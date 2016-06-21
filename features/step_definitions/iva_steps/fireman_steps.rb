###Firefighter ProBoard Steps###

Given(/^I verify using a ProBoard Firefighter$/) do
  PBFirefighter.new.verify
end

Given(/^I submit the empty ProBoard Firefighter form$/) do
  PBFirefighter.new.verify(false)
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
