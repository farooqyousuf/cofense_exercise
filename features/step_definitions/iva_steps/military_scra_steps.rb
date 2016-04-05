Given(/^I verify using SCRA for "([^"]*)"$/) do |affiliation|
  @military_scra = MilitarySCRA.new
  @military_scra.verify(affiliation)
end
