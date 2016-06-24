Given(/^I visit group affiliations from the shop homepage$/) do
	step 'I visit "MarketplaceLandingPage"'
	@marketplace_group_affiliations_page = MarketplaceGroupAffiliationsPage.new 
	@marketplace_group_affiliations_page.navigate_to_group_affiliation_page_from_shop_homepage
end

Given(/^I select to verify the Military Group Affiliation$/) do
  @marketplace_group_affiliations_page.click_verify_military_affiliation_link
end


Given(/^I select to verify the Teacher Group Affiliation$/) do
  @marketplace_group_affiliations_page.click_verify_teacher_affiliation_link
end 

Given(/^I select to verify the First Responder Group Affiliation$/) do
  @marketplace_group_affiliations_page.click_verify_first_responder_affiliation_link
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

Given(/^I expect to be at the group affiliations page$/) do
	page.assert_current_path(FigNewton.marketplace.group_affiliations_page, :url => true)
end

Given(/^I expect to see the verify group affiliations dashboard$/) do
  expect(page).to have_css(".complete-activity",:visible => true)
  expect(page).to have_css(".complete-activity .heading",:text => "Verify a group affiliation")
end

Given(/^I expect that all groups are marked as Instant VIP$/) do
	@admin_user_marketplace = AdminUsers.new
	@admin_user_marketplace.record_test_user_email
	expect(page).to have_css(".select-group li:nth-child(1)",:text => "Military Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(2)",:text => "First Responders Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(3)",:text => "Students Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(4)",:text => "Government Employees Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(5)",:text => "Teachers Instant VIP")
end