Given(/^I should be on the military verification screen$/) do
  @dd214 = DD214.new
  find(@dd214.header_css).visible?
end

Given(/^I verify using DD214 information for "(.*)"$/) do |affiliation|
  @dd214.verify(affiliation, true)
end