###Firefighter ProBoard Steps###

Given(/^I verify using a ProBoard Firefighter$/) do
  PBFirefighter.new.verify(type: "unique")
end

Given(/^I submit the empty ProBoard Firefighter form$/) do
  PBFirefighter.new.verify(populate: false)
end

Given(/^I submit the proboard firefighter verification form as a "([^"]*)" record$/) do |type|
  PBFirefighter.new.verify(type: type)
end


###Firefighter Doc Upload Steps###

Given(/^I verify using firefighter documentation$/) do
  DocFirefighter.new.verify(type: "unique")
end

Given(/^I submit the empty Firefighter doc upload form$/) do
  DocFirefighter.new.verify(populate: false)
end

Given(/^I submit the firefighter doc upload verification form as a "([^"]*)" record$/) do |type|
  DocFirefighter.new.verify(type: type)
end

Given(/^I click on the No I am not ProBoard certified link$/) do
  DocFirefighter.new.click_verify_firefighter_doc_link
end
