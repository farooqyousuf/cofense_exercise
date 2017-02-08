Given(/^I visit the user quick search page$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
  visit FigNewton.admin.user_quick_search
end

Given(/^I search user by email$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I verify that the user was searched$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
