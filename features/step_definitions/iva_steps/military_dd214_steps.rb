
Given(/^I verify using DD214 information for "(.*)"$/) do |affiliation|
  @dd214 = DD214.new
  @dd214.verify(affiliation)
end

Given(/^I submit the empty DD214 form for "([^"]*)"$/) do |group|
  @dd214 = DD214.new
  @dd214.verify(group, false)
end