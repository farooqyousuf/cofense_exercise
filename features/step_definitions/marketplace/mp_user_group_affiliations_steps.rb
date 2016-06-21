Given(/^I select to verify the Military Group Affiliation$/) do
  find(:link, :text =>"Military").click

end

Given(/^I click on the Marketplace Sign Up link$/) do
	@marketplace_landing_page = MarketplaceLandingPage.new 
	@marketplace_landing_page.sign_up
end