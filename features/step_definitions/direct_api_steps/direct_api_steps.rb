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
    expect(@response.code).to eq(200)             # verifies HTTP status code
    expect(@response["code"]).not_to eq("122")    # verifies response code attribute
  when "missing Client Credential"
    expect(@response.code).to eq(403)
    expect(@response["code"]).to eq("122")
  else fail ("Method not found")
  end
end
