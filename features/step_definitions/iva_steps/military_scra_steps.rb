Given(/^I verify using SCRA for "([^"]*)"$/) do |affiliation|
  MilitarySCRA.new.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty SCRA form for "([^"]*)"$/) do |group|
  MilitarySCRA.new.verify(affiliation: group, populate: false)
end

Given(/^I submit the military scra verification form as a "([^"]*)" record$/) do |type|
  MilitarySCRA.new.verify(affiliation: "Service Member", type: type)
end
