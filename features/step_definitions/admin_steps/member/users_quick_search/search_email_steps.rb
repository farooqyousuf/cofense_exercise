Given(/^I visit the user quick search page$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
  visit FigNewton.admin.user_quick_search
end

Given(/^I search user by "([^"]*)"$/) do |type|
  @user_email_search = UserSearch.new
  if type == "email"
    @user_email_search.search_email_user
  end
end

Given(/^I verify that the user was searched$/) do
  click_link("Capybara DoNotDelete")
  expect(page).to have_text("Capybara DoNotDelete")
end
