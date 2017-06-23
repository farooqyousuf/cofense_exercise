Given(/^I login the admin tool$/) do
  @admin = AdminTool.new.login
end

Given(/^I verify with SCRA for "([^"]*)"$/) do |affiliation|
  VerifyWithScra.new.verify_via_scra(@user_email, affiliation: affiliation)
end

Given(/^I should be successfully verified as a "([^"]*)"$/) do |group|
  VerifyWithScra.new.verify_scra_applied(@user_email, affiliation: group)
end
