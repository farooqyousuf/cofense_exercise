Given(/^I visit group affiliations from the Shop homepage$/) do
	@shop_group_affiliations_page = ShopGroupAffiliationsPage.new
	@shop_group_affiliations_page.navigate_to_group_affiliation_page_from_shop_homepage
end

Given(/^I select to verify the Military Group Affiliation$/) do
  @shop_group_affiliations_page.click_verify_military_affiliation_link
end

Given(/^I select to verify the Student Group Affiliation$/) do
  @shop_group_affiliations_page.click_verify_student_affiliation_link
end

Given(/^I select to verify the Government Group Affiliation$/) do
  @shop_group_affiliations_page.click_verify_government_affiliation_link
end

Given(/^I select to verify the Teacher Group Affiliation$/) do
  @shop_group_affiliations_page.click_verify_teacher_affiliation_link
end

Given(/^I select to verify the First Responder Group Affiliation$/) do
  @shop_group_affiliations_page.click_verify_first_responder_affiliation_link
end

Given(/^I click on the Shop Sign Up link$/) do
	@shop_landing_page = ShopLandingPage.new
	@shop_landing_page.sign_up
end

Given(/^I verify user "([^"]*)" Group Affiliation is approved on Shop$/) do |group_affiliation|
  @shop_group_affiliations_page.navigate_to_group_affiliation_page_from_shop_homepage
	@admin_user_shop = AdminUsers.new
	@admin_user_shop.record_test_user_email
	expect(page).to have_css(".-verified", :text => group_affiliation)
	expect(page).to have_css(".-verified .-checkmark-square",:visible => true)
end

Given(/^I expect to be at the group affiliations page$/) do
	page.assert_current_path(FigNewton.shop.group_affiliations_page, :url => true)
end

Given(/^I expect to see the verify group affiliations dashboard$/) do
  expect(page).to have_css(".complete-activity",:visible => true)
  expect(page).to have_css(".complete-activity .heading",:text => "Verify a group affiliation")
end

Given(/^I expect that all groups are marked as Instant VIP$/) do
	@admin_user_shop = AdminUsers.new
	@admin_user_shop.record_test_user_email
	expect(page).to have_css(".select-group li:nth-child(1)",:text => "Military Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(2)",:text => "First Responders Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(3)",:text => "Students Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(4)",:text => "Government Employees Instant VIP")
	expect(page).to have_css(".select-group li:nth-child(5)",:text => "Teachers Instant VIP")
end
