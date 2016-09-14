Given(/^I verify using state EMT doc upload$/) do
  StateDocEMT.new.verify(type: "unique")
end

Given(/^I submit the empty state EMT doc upload form$/) do
  StateDocEMT.new.verify(populate: false)
end

Given(/^I submit the state EMT Document Upload form as a "([^"]*)" record$/) do |type|
  StateDocEMT.new.verify(type: type)
end

Given(/^I submit the empty EMT state lookup form$/) do
  StateLookupEMT.new.verify(populate: false)
end

Given(/^I verify using EMT state lookup$/) do
  StateLookupEMT.new.verify(type: "unique")
end

Given(/^I submit the emt state lookup verification form as a "([^"]*)" record$/) do |type|
  StateLookupEMT.new.verify(type: type)
end
