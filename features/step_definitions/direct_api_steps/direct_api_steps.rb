Given(/^I send a POST request with valid Client Credential attributes to ARCS staging$/) do
  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query =>
                            {
                              :client_id     => FigNewton.direct_api.client_id,
                              :client_secret => FigNewton.direct_api.client_secret,
                              :first_name    => FigNewton.direct_api.first_name,
                              :last_name     => FigNewton.direct_api.last_name,
                              :birth_date    => FigNewton.direct_api.birth_date,
                              :ssn           => FigNewton.direct_api.ssn
                            })
end

Given(/^I verify that the response is valid$/) do
  expect(@response.success?).to be(true)                # verifies status is 200
  expect(@response["code"].should eq(nil)).to be(true)  # verifies the code attribute key is nil

  @expected_values = FigNewton.direct_api.to_hash
  @response_values = @response.to_hash

  fields = %w[first_name last_name birth_date ssn]

  fields.each do |field|                                # verifies response values match up with the yml file
    expect(@response_values.values_at(field)).to match_array(@expected_values.values_at(field))
  end
  puts @response
end
