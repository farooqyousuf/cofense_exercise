Given(/^I visit the OAuth Tester$/) do
  @oauth_tester = OAuthTester.new
  @oauth_tester.visit
end

Given(/^I select the "([^"]*)" policy$/) do |policy|
  @oauth_tester.create_test_env("ID.me", "ID.me Staging", policy) 
end

Given(/^I logout of the OAuth Tester$/) do
  click_link("Logout »")
end
