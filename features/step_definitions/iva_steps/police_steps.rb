Given("I click on the Verify as a state certified Police Officer") do
  @Police.click_verify_police_link
end

Given("I verify using police officer documentation") do
  step 'I generate a unique "png" doc'
  @Police.verify(type: "unique")
end

Given("I submit the empty Police form") do
  @Police.verify(populate: false)
end

Given("I submit the police verification form as a {string} record") do |type|
  @Police.verify(type: type)
end
