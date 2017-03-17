Given(/^I login the admin tool$/) do
  @admin = AdminTool.new.login
  step 'I visit "VerifyWithScra"'
end

Given(/^I verify with SCRA for "([^"]*)"$/) do |group|
  username = @username
  VerifyWithScra.new.verify(@username, affiliation: group, type: "unique")
end

Given(/^I should be successfully verified as a "([^"]*)"$/) do |type|
  username = @username
  VerifyWithScra.new.verify(@username, type: type, populate: false, affiliation: "Service Member")
end
