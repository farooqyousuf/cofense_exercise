Given(/^I create a Military Document page object$/) do
  @MilDoc = MilitaryDoc.new
end

Given(/^I click on the Military Verify by uploading documentation link$/) do
  @MilDoc.click_verify_mildoc_link
end

Given(/^I verify using military documentation for "([^"]*)"$/) do |affiliation|
  step 'I generate a unique doc'
  @MilDoc.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty military document form for "([^"]*)"$/) do |group|
  @MilDoc.verify(affiliation: group, populate: false)
end

Given(/^I submit the military document verification form as a "([^"]*)" record$/) do |type|
  @MilDoc.verify(affiliation: "Service Member", type: type)
end
