Given(/^I select to verify the Military Group Affiliation$/) do
	#TODO: refactor out to MarketplaceGroupAffiliationsPage object when add CSS scenario
  find(:link, :text =>"Military").click
end

Given(/^I click on the Marketplace Sign Up link$/) do
	@marketplace_landing_page = MarketplaceLandingPage.new 
	@marketplace_landing_page.sign_up
end

Given(/^I verify user "([^"]*)" Group Affiliation is approved on Marketplace$/) do |group_affiliation|
	@admin_user_marketplace = AdminUsers.new
	@admin_user_marketplace.record_test_user_email
	expect(page).to have_css(".-verified", :text => group_affiliation)
	expect(page).to have_css(".-verified .-checkmark-square",:visible => true)
end