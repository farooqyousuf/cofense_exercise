Given(/^I login the admin tool$/) do
  @admin = AdminTool.new.login
end

Given(/^I verify with SCRA for "([^"]*)"$/) do |affiliation|
  VerifyWithScra.new.verify_via_scra(@user_email, affiliation: affiliation)
end

Given(/^I should be successfully verified as a "([^"]*)"$/) do |group|
  VerifyWithScra.new.verify_scra_applied(@user_email, affiliation: group)
end

Given(/^I submit the SCRA verification form through the admin tool as a "([^"]*)" record$/) do |type|
  VerifyWithScra.new.verify_via_scra(@username, affiliation: "Service Member", type: type)
end

Given(/^I should see the red alert flash message$/) do
  VerifyWithScra.new.verify_denied_scra_error_message
end
