Given(/^I create a Fireman ProBoard page object$/) do
  @PBFirefighter = PBFirefighter.new
end

Given(/^I click on the Yes I am ProBoard certified link$/) do
  @PBFirefighter.click_verify_firefighter_pb_link
end

Given(/^I verify using a ProBoard Firefighter$/) do
  @PBFirefighter.verify(type: "unique")
  click_link("Continue")
end

Given(/^I submit the empty ProBoard Firefighter form$/) do
  @PBFirefighter.verify(populate: false)
end

Given(/^I submit the proboard firefighter verification form as a "([^"]*)" record$/) do |type|
  @PBFirefighter.verify(type: type)
end
