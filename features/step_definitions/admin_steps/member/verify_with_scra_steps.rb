Given(/^I login the admin tool$/) do
  @admin = AdminTool.new.login
end

Given(/^I verify with SCRA for "([^"]*)"$/) do |affiliation|
  username = @username
  VerifyWithScra.new.verify_via_scra(@username, affiliation: affiliation)
end

Given(/^I should be successfully verified as a "([^"]*)"$/) do |group|
  username = @username
  VerifyWithScra.new.verify_scra_applied(@username, affiliation: group)
end

Given(/^I submit the empty SCRA form for "([^"]*)" in the Admin tool$/) do |group|
  VerifyWithScra.new.verify_via_scra(@username, affiliation: group, populate: false)
end

Given(/^I should see error messages on required fields for "([^"]*)" in the Admin tool$/) do |affiliation|
  VerifyWithScra.new.verify_admin_scra_form_error_messages(affiliation: affiliation)
end

Given(/^I should see red highlighted errors for "([^"]*)" in the Admin tool$/) do |affiliation|
  VerifyWithScra.new.verify_admin_scra_form_red_highlighted_errors(affiliation: affiliation)
end
