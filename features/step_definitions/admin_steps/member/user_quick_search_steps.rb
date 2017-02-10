Given(/^I visit the user quick search page$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
  visit FigNewton.admin.user_quick_search
end

Given(/^I search user by "([^"]*)"$/) do |type|
  @search_user = UserSearch.new
  case type
    when "email"
      @search_user.search_user_email
    when "full_name"
      @search_user.search_user_full_name
    when "first_name"
      @search_user.search_user_first_name
    end
end

Given(/^I verify that the user was searched by "([^"]*)"$/) do |type|
  case type
  when "email"
    click_link("Capybara DoNotDelete")
    expect(page).to have_text("Capybara DoNotDelete")
  when "full_name"
    puts "verify full_name"
  when "first_name"
    puts "verify first_name"
  end
end
