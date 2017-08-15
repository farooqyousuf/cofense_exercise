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
  # @expected_value = FigNewton.direct_api
  expect(@response.success?).to be(true)
  expect(@response["code"].should eq(nil)).to be(true)


  @actual_values = @response.values_at("first_name", "last_name", "birth_date", "ssn")
  @actual_values.each do |value|
    binding.pry
    expect(value).should equal(FigNewton.direct_api.fetch(value))
  end
  binding.pry
  expect(@expected_value)
  puts @response
end
