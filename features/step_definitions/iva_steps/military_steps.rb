Given(/^I should be on the military verification screen$/) do
  @dd214 = DD214.new
  find(@dd214.header_css).visible?
end

Given(/^I verify using DD214 information for "(.*)"$/) do |affiliation|
  @dd214.verify(affiliation, true)
end

Given(/^I submit the empty DD214 form for "([^"]*)"$/) do |group|
  @dd214 = DD214.new
  @dd214.verify(group, false)
end