Given(/^I sign-up with a generic test user account$/) do
	@marketplace_shop = MarketplaceLandingPAge.new
	@marketplace_shop.sign_up
end

Given(/^I select to verify the Military Group Affiliation$/) do
	@marketplace_group_affiliations = MarketplaceGroupAffiliationPage.new 
end