Given(/^I create a Police page object$/) do
  @police = Police.new
end

Given(/^I click on the Verify as a state certified Police Officer$/) do
  @police.click_verify_police_link
end

Given(/^I verify using police officer documentation$/) do
  step 'I generate a unique doc'
  @police.verify(type: "unique")
end

Given(/^I submit the empty Police form$/) do
  @police.verify(populate: false)
end

Given(/^I submit the police verification form as a "([^"]*)" record$/) do |type|
  @police.verify(type: type)
end
