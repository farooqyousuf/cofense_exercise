Given(/^I create a Fireman Doc page object$/) do
  @FiremanDoc = DocFirefighter.new
end

Given(/^I verify using firefighter documentation$/) do
  step 'I generate a unique "png" doc'
  @FiremanDoc.verify(type: "unique")
end

Given(/^I submit the empty Firefighter doc upload form$/) do
  @FiremanDoc.verify(populate: false)
end

Given(/^I submit the firefighter doc upload verification form as a "([^"]*)" record$/) do |type|
  @FiremanDoc.verify(type: type)
end

Given(/^I click on the No I am not ProBoard certified link$/) do
  @FiremanDoc.click_verify_firefighter_doc_link
end
