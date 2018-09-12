Given("I verify using firefighter documentation") do
  step 'I generate a unique "png" doc'
  @DocFirefighter.verify(type: "unique")
end

Given("I submit the empty Firefighter doc upload form") do
  @DocFirefighter.verify(populate: false)
end

Given("I submit the firefighter doc upload verification form as a {string} record") do |type|
  @DocFirefighter.verify(type: type)
end

Given("I click on the No I am not ProBoard certified link") do
  @DocFirefighter.click_verify_firefighter_doc_link
end
