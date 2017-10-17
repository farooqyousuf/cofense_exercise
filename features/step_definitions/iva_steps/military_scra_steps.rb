Given(/^I create a Military SCRA page object$/) do
  @MilSCRA = MilitarySCRA.new
end

Given(/^I click on the Verify using a government service record link$/) do
  @MilSCRA.click_verify_scra_link
end

Given(/^I verify using SCRA for "([^"]*)"$/) do |affiliation|
  @MilSCRA.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty SCRA form for "([^"]*)"$/) do |group|
  @MilSCRA.verify(affiliation: group, populate: false)
end

Given(/^I submit the military scra verification form as a "([^"]*)" record$/) do |type|
  @MilSCRA.verify(affiliation: "Service Member", type: type)
end
