Given(/^I visit the user quick search page$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
  visit FigNewton.admin.user_quick_search
end

Given(/^I search user by email$/) do
  fill_in("query", with: "capybara+471715@id.me")
  click_button("Search")
end

Given(/^I verify that the user was searched$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
