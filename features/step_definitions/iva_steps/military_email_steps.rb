Given(/^I create a Military Email page object$/) do
  @MilEmail = MilitaryEmail.new
end

Given(/^I verify using military email information for "([^"]*)"$/) do |affiliation|
  @MilEmail.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty military email form for "([^"]*)"$/) do |group|
  @MilEmail.verify(affiliation: group, populate: false,)
end

Given(/^I submit the military email verification form as a "([^"]*)" record$/) do |type|
  @MilEmail.verify(affiliation: "Service Member", type: type)
end


