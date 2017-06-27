Given(/^I login the admin tool$/) do
  @admin = AdminTool.new.login
end

Given(/^I verify with SCRA for "([^"]*)"$/) do |affiliation|
  VerifyWithScra.new.verify_via_scra(@user_email, affiliation: affiliation, type: "unique")
end

Given(/^I should be successfully verified as a "([^"]*)"$/) do |group|
  VerifyWithScra.new.verify_scra_applied(@user_email, affiliation: group)
end

Given(/^I submit the SCRA verification form through the admin tool as a "([^"]*)" record$/) do |type|
  VerifyWithScra.new.verify_via_scra(@user_email, affiliation: "Service Member", type: type)
end

Given(/^I should see the red alert flash message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
