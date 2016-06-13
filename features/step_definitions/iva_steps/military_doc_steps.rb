Given(/^I verify using military documentation for "([^"]*)"$/) do |affiliation|
  step 'I generate a unique doc'
  MilitaryDoc.new.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty military document form for "([^"]*)"$/) do |group|
  MilitaryDoc.new.verify(affiliation: group, populate: false)
end

Given(/^I submit the military document verification form as a "([^"]*)" record$/) do |type|
  MilitaryDoc.new.verify(affiliation: "Service Member", type: type)
end
