Given(/^I verify using military email information for "([^"]*)"$/) do |affiliation|
  @military_email = MilitaryEmail.new
  @military_email.verify(affiliation, true)
end