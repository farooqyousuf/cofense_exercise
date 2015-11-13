Given(/^I visit the OAuth Tester$/) do
	@oauth = OAuthTester.new
	@oauth.load
end

Given(/^I select the "([^"]*)" policy$/) do |policy|
	binding.pry
	@oauth.oauth_integration_button.click
	@oauth.organization_dropdown.select("ID.me")
	@oauth.consumer_dropdown.select("ID.me Staging")
	@oauth.policy_dropdown.select("Marketplace")
	binding.pry
	@oauth.authenticate_button.click
end

Given(/^I logout of the OAuth Tester$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
