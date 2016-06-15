Given(/^I submit the empty EMT state lookup form$/) do
  LookupEMT.new.verify(populate: false)
end

Given(/^I verify using EMT state lookup$/) do
  LookupEMT.new.verify(type: "unique")
end

Given(/^I submit the emt state lookup verification form as a "([^"]*)" record$/) do |type|
  LookupEMT.new.verify(type: "denied")
end
