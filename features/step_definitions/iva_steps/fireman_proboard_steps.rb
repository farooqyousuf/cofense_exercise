Given(/^I create a Fireman ProBoard page object$/) do
  @FiremanProBoard = PBFirefighter.new
end

Given(/^I click on the Yes I am ProBoard certified link$/) do
  @FiremanProBoard.click_verify_firefighter_pb_link
end

Given(/^I verify using a ProBoard Firefighter$/) do
  @FiremanProBoard.verify(type: "unique")
end

Given(/^I submit the empty ProBoard Firefighter form$/) do
  @FiremanProBoard.verify(populate: false)
end

Given(/^I submit the proboard firefighter verification form as a "([^"]*)" record$/) do |type|
  @FiremanProBoard.verify(type: type)
end
