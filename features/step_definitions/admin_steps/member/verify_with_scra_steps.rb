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
