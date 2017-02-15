Given(/^I visit the user quick search page$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login
  step 'I visit "UserQuickSearch"'
end

Given(/^I search user by "([^"]*)"$/) do |type|
  UserQuickSearch.new.search_user(type: type)
end

Given(/^I verify that the user was searched by "([^"]*)"$/) do |type|
  UserQuickSearch.new.verify(type: type)
end
