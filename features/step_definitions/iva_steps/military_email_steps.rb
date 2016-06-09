Given(/^I verify using military email information for "([^"]*)"$/) do |affiliation|
  MilitaryEmail.new.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty military email form for "([^"]*)"$/) do |group|
  MilitaryEmail.new.verify(affiliation: group, populate: false,)
end

Given(/^I submit the military email verification form as a "([^"]*)" record$/) do |type|
  MilitaryEmail.new.verify(affiliation: "Service Member", type: type)
end


