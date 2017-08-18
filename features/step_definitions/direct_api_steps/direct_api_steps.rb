Given(/^I send a POST request with valid Client Credential attributes to ARCS staging$/) do
  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query => FigNewton.direct_api.to_hash)
end

Given(/^I verify that the response is valid$/) do
  expect(@response.success?).to be(true)  # verifies status is 200
  expect(@response["code"]).to be(nil)    # verifies the code attribute key is nil

  expected_values = FigNewton.direct_api.to_hash.except("client_id", "client_secret")
  response_values = @response.to_hash.except("service_branch", "service_name", "service_component", "service_end_date", "service_start_date", "verified", "affiliation", "external")

  expect(response_values).to eq(expected_values)  # verifies response values match up with the yml file
  puts @response
end
