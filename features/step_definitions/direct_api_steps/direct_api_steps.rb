Given(/^I send a POST request with "([^"]*)" attributes to ARCS staging$/) do |request|
  attributes = case request
               when "valid Client Credential"     then FigNewton.direct_api.to_hash
               when "missing Client Credential"   then {}
               else fail ("Failed POST request.")
               end

  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query => attributes)
  puts @response
end

Given(/^I verify that I authenticated with "([^"]*)" attributes$/) do |method|
  case method
  when "valid Client Credential"
    expected_status = true
    expected_code = nil
  when "missing Client Credential"
    expected_status = false
    expected_code = "122"
  else fail ("Method not found")
  end

  expect(@response.success?).to eq(expected_status)
  expect(@response["code"]).to eq(expected_code)
end

Given(/^I verify the user's "([^"]*)" military attributes$/) do |request|
# response_values incldue client_id, client_secret, first_name, last_name, birth_date and ssn
  response_values = @response.to_hash.except("service_branch",
                                              "service_name",
                                              "service_component",
                                              "service_end_date",
                                              "service_start_date",
                                              "verified",
                                              "affiliation",
                                              "external",
                                              "message",
                                              "code")

  expected_values = case request
                    when "valid"    then FigNewton.direct_api.to_hash.except("client_id", "client_secret")
                    when "missing"  then {}
                    else fail ("Failed authentication with #{request} attribute.")
                    end
  expect(response_values).to eq(expected_values)
end
