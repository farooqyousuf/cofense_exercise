Given(/^I verify using SCRA for "([^"]*)"$/) do |affiliation|
  @military_scra = MilitarySCRA.new
  @military_scra.verify(affiliation)
end

Given(/^I submit the empty SCRA form for "([^"]*)"$/) do |group|
  @military_scra = MilitarySCRA.new
  @military_scra.verify(group, false)
end