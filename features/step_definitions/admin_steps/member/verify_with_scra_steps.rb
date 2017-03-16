Given(/^I login the admin tool$/) do
  @admin = AdminTool.new.login
  step 'I visit "VerifyWithScra"'
end

Given(/^I verify with SCRA for "([^"]*)"$/) do |affiliation|
  username = @username
  VerifyWithScra.new.scra_verify(@username, affiliation: affiliation)
end

Given(/^I should be successfully verified as a "([^"]*)"$/) do |affiliation|
  username = @username
  VerifyWithScra.new.verify(@username, affiliation: affiliation)
end
