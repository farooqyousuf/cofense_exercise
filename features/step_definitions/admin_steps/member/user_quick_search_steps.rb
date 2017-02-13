Given(/^I visit the user quick search page$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
  visit FigNewton.admin.user_quick_search
end

Given(/^I search user by "([^"]*)"$/) do |type|
  UserQuickSearch.new.search_user(type: type)
  # @search_user = UserQuickSearch.new
  # case type
  #   when "email"
  #     @search_user.search_user_email
  #   when "full_name"
  #     @search_user.search_user_full_name
  #   when "first_name"
  #     @search_user.search_user_first_name
  #   end
end

Given(/^I verify that the user was searched by "([^"]*)"$/) do |type|
  case type
  when "email" || "full_name"
    click_link("Capybara DoNotDelete")
    expect(page).to have_text("Capybara DoNotDelete")
  when "first_name"
    find("body > div.main-container > div > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(2) > a").click
    expect(page).to have_text("capybara")
  end
end
