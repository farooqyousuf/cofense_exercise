Given(/^I should be on the government verification screen$/) do
  @iva_govt = IVAGovernment.new
  find(@iva_govt.header_css).visible?
end

Given(/^I submit the government verification form$/) do
  @iva_govt.verify(true)
end

Given(/^I submit the government verification code$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I should see the verification success page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I complete the verification process$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I submit the empty government form$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I should see error messages on required fields for "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end