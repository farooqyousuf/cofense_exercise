Given(/^I click on the Verify using a government service record link$/) do
  @MilitarySCRA.click_verify_scra_link
end

Given(/^I verify using SCRA for "([^"]*)"$/) do |affiliation|
  @MilitarySCRA.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty SCRA form for "([^"]*)"$/) do |group|
  @MilitarySCRA.verify(affiliation: group, populate: false)
end

Given(/^I submit the military scra verification form as a "([^"]*)" record$/) do |type|
  @MilitarySCRA.verify(affiliation: "Service Member", type: type)
end
