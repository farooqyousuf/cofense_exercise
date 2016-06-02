Given(/^I verify using military documentation for "([^"]*)"$/) do |affiliation|
  step 'I generate a unique doc'
  @military_doc = MilitaryDoc.new
  @military_doc.verify(affiliation: affiliation)
end

Given(/^I submit the empty military document form for "([^"]*)"$/) do |group|
  @military_doc = MilitaryDoc.new
  @military_doc.verify(affiliation: group, populate: false)
end

Given(/^I submit the Military Document verification form as a dupe record$/) do
  @military_doc = MilitaryDoc.new
  @military_doc.verify(affiliation: "Service Member", dupe: true)
end
