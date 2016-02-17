Given(/^I verify using military documentation for "([^"]*)"$/) do |affiliation	|
  step 'I generate a unique doc'
  @military_doc = MilitaryDoc.new
  @military_doc.verify(affiliation)
end

Given(/^I submit the empty military document form for "([^"]*)"$/) do |group|
  @military_doc = MilitaryDoc.new
  @military_doc.verify(group, false)
end

