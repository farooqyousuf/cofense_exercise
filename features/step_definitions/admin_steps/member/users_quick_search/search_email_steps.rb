Given(/^I visit the user quick search page$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
  visit FigNewton.admin.user_quick_search
end

Given(/^I search user by "([^"]*)"$/) do |type|
  # fill_in("query", with: "capybara+471715@id.me")
  # click_button("Search")
  search_type =  case type
  when "email"
    "email"
  end
  search_user(type)
end

Given(/^I verify that the user was searched$/) do
  click_link("Capybara DoNotDelete")
  expect(page).to have_text("Capybara DoNotDelete")
end
