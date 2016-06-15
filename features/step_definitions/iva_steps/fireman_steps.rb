Given(/^I verify using a ProBoard Firefighter$/) do
  PBFirefighter.new.verify
end

Given(/^I submit the empty ProBoard Firefighter form$/) do
  PBFirefighter.new.verify(false)
end

Given(/^I verify using firefighter documentation$/) do
  DocFirefighter.new.verify
end

Given(/^I submit the empty Firefighter doc upload form$/) do
  DocFirefighter.new.verify(false)
end
