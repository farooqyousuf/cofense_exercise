Given(/^I used "([^"]*)" client credentials$/) do |credentials|
  @request_params = case credentials
                    when "valid" then { "client_id"     => FigNewton.direct_api_client_cred.client_id,
                                        "client_secret" => FigNewton.direct_api_client_cred.client_secret}
                    end
end

Given(/^I used "([^"]*)" user attributes$/) do |credentials|
  case credentials
  when "valid"    then @request_params.merge!(FigNewton.direct_api_client_cred.valid_attributes.to_hash)
  when "invalid"  then @request_params.merge!(FigNewton.direct_api_client_cred.invalid_attributes.to_hash)
  when "missing"  then @request_params.merge!({ }.to_hash)
  end
end


Given(/^I send a POST request to ARCS$/) do
  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query => @request_params)
  puts @response
end

Given(/^I verify the user's "([^"]*)" military attributes is received$/) do |request|
  expected_response = case request
                      when "valid"
                        {
                          "first_name"         => FigNewton.direct_api_client_cred.valid_attributes.first_name,
                          "last_name"          => FigNewton.direct_api_client_cred.valid_attributes.last_name,
                          "birth_date"         => FigNewton.direct_api_client_cred.valid_attributes.birth_date,
                          "ssn"                => FigNewton.direct_api_client_cred.valid_attributes.ssn,
                          "service_branch"     => "Army",
                          "service_component"  => "active",
                          "service_end_date"   => nil,
                          "service_start_date" => "2016-01-01",
                          "verified"           => true,
                          "affiliation"        => "Service Member",
                          "external"           => true
                        }
                      when "invalid"
                        {
                          "message"            => "We are unable to verify the given credentials.",
                          "code"               => 1001,
                          "verified"           => false
                        }
                      when "missing"
                        {
                          "code"               => 1002,
                          "error"              => {
                                                    "first_name" => ["can't be blank"],
                                                    "last_name"  => ["can't be blank"],
                                                    "ssn"        => ["can't be blank",
                                                                     "is the wrong length (should be 9 characters)",
                                                                     "is not a number"],
                                                    "birth_date" => ["can't be blank",
                                                                     "must be in yyyy-mm-dd format"],
                                                   }
                        }
                      else fail ("Unable to find the requested #{request} attributes")
                      end

  expect(@response.to_hash).to eq(expected_response)
end

Given(/^I verify that I authenticated with "([^"]*)" attributes$/) do |method|
  case method
  when "valid"
    expect(@response.code).to eq(200)             # verifies HTTP status code
    expect(@response["code"]).not_to eq("122")    # verifies response code attribute
  when "invalid"
    expect(@response.code).to eq(200)
    expect(@response["code"]).to eq(1001)
  when "missing"
    expect(@response.code).to eq(400)
    expect(@response["code"]).to eq(1002)
  else fail ("Method for #{method} not found")
  end
end
