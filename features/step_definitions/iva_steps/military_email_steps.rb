Given(/^I verify using military email information for "([^"]*)"$/) do |affiliation|
  @military_email = MilitaryEmail.new
  @military_email.verify(affiliation, true)
end

Given(/^I submit the empty military email form for "([^"]*)"$/) do |group|
  @military_email = MilitaryEmail.new
  @military_email.verify(group, false)
end