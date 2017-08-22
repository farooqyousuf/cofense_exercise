Given(/^I verify the user's "([^"]*)" military attributes is received$/) do |request|
  expected_response = case request
                      when "valid"
                        {
                          "first_name"         => FigNewton.direct_api.first_name,
                          "last_name"          => FigNewton.direct_api.last_name,
                          "birth_date"         => FigNewton.direct_api.birth_date,
                          "ssn"                => FigNewton.direct_api.ssn,
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
                          "message"            => "Consumer is not allowed to access this API",
                          "code"               => "122"
                        }
                      else fail ("Unable to find the rquested #{request} attributes")
                      end

  expect(@response.to_hash).to eq(expected_response)
end

Given(/^I send a POST request with "([^"]*)" attributes to ARCS staging$/) do |request|
  attributes = case request
               when "valid"                 then FigNewton.direct_api.to_hash
               when "missing"               then {}
               when "invalid"               then FigNewton.invalid_id_secret_direct_api.to_hash
               else fail ("Failed POST request with #{request}.")
               end

  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query => attributes)
  puts @response
end

Given(/^I verify that I authenticated with "([^"]*)" attributes$/) do |method|
  case method
  when "valid"
    expect(@response.code).to eq(200)             # verifies HTTP status code
    expect(@response["code"]).not_to eq("122")    # verifies response code attribute
  when "invalid"
    expect(@response.code).to eq(403)
    expect(@response["code"]).to eq("122")
  else fail ("Method for #{method} not found")
  end
end
