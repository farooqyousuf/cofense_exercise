Given(/^I send a POST request with valid Client Credential attributes to ARCS staging$/) do
  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query => FigNewton.direct_api.to_hash)
end

Given(/^I verify the user's military attributes$/) do
  expect(@response.success?).to eq(true)  # verifies status is 200
  expect(@response["code"]).to eq(nil)    # verifies the code attribute key is nil

  @expected_values = FigNewton.direct_api.to_hash.except("client_id", "client_secret")
  @response_values = @response.to_hash.except("service_branch", "service_name", "service_component", "service_end_date", "service_start_date", "verified", "affiliation", "external")
end

Given(/^I verify that I can authenticate with valid Client Credentials$/) do
  expect(@response_values).to eq(@expected_values)  # verifies response values match up with the yml file
  puts @response
end

Given(/^I send a POST request with missing Client Credential attributes to ARCS staging$/) do
  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query => { })
end

Given(/^I verify the user's missing military attributes$/) do
  expect(@response.success?).to eq(false) # verifies status to not equal 200
  expect(@response["code"]).to eq("122")  # verifies the code attribute value is 122
end

Given(/^I verify that I authenticated with missing Client Credentials$/) do
  expect(@response_values).to eq(nil)
  puts @response
end
