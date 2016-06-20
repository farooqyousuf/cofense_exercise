Given(/^I sign-up with a generic test user account$/) do
	@marketplace_shop = MarketplaceLandingPAge.new
	@marketplace_shop.sign_up(FigNewton.user.test_email,FigNewton.user.test_email)
end

Given(/^I select to verify the Military Group Affiliation$/) do
	@marketplace_group_affiliations = MarketplaceGroupAffiliationPage.new 
	@marketplace_group_affiliations.verify_military_affiliation 

	#expectation to verify? set as steps? 
end