Given(/^I visit the admin tool$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
end

Given(/^I create user$/) do
  click_link("Members")
  click_link("Users")
end

Given(/^I verify new user was created$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
