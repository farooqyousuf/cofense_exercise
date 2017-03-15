Given(/^I create a Marketplace Offers index page object$/) do
	@marketplace_offers = MarketplaceOffersPage.new
end

Given(/^I expect the page url to be for Marketplace Offers Page$/) do
	expect(page.current_url).to eql(FigNewton.marketplace.offers_index_page)
end

Given(/^I check that the Offers Index is available$/) do
	expect(page).to have_css(".offers-list-static")
	expect(page).to have_css(".listing__header .heading .breadcrumbs", :text =>"Shop › Offers")
end

Given(/^I check that store offer index card is visible$/) do
	expect(page).to have_css(".offers-list-static .resource-card",:match => :first)
end

Given(/^I check the store offer card links for "([^"]*)" User$/) do |user_type|
	if user_type == "Logged Out"
		expect(page).to have_css(".resource-card .button", :match => :first , :text =>"Sign Up & Save")
	elsif user_type == "Logged In"
		expect(page).to have_css(".resource-card .button", :match => :first ,:text =>"Shop Now")
	end

	expect(page).to have_css(".resource-card .offer-card__share-alt",:match => :first , :text =>"Share with Friends")
end

Given(/^I check that the store offer card favorite and report bug is not visible$/) do
	expect(page).to have_no_selector(".save-offer")
	expect(page).to have_no_selector(".report-offer")
end

Given(/^I check that the store offer card favorite and report bug is visible$/) do
	expect(page).to have_css(".resource-card .save-offer", :match =>:first)
	expect(page).to have_css(".resource-card .report-offer", :match =>:first)
end

Given(/^I click to see all promo code offers$/) do
	@marketplace_offers.click_promocodes_sidebar_link

	expect(page.current_url).to eql(FigNewton.marketplace.offers_promo_code_index_page)
	expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › Codes")
end

Given(/^I check that the table index are promo code offers$/) do
	expect(page).to have_css(".offers-list-static li:nth-child(1) .button",:match => :first, :text =>"Claim Code")
	expect(page).to have_css(".offer-card__share-alt",:match =>:first, :text =>"Share with Friends")

	(2..10).each do |card_number|
		expect(page).to have_css(".offers-list-static li:nth-child(#{ card_number }) .button",:match =>:first, :text =>"Claim Code")
	end
end

Given(/^I click to see all Coupon offers$/) do
	@marketplace_offers.click_coupons_sidebar_link

	expect(page.current_url).to eql(FigNewton.marketplace.offers_coupon_index_page)
	expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › Coupons")
end

Given(/^I check that the table index are coupon offers$/) do
	expect(page).to have_css(".offers-list-static")

	#Currently Matcher for coupon page are hard coded to offers because unable to differentiate coupon specific offers but be aware that very brittle
	expect(page).to have_css(".offers-list-static li:nth-child(1)",:text =>"PLUS UP TO 1.3% CASH BACK Up to 50% off electronics and more! Shop Now Share with Friends")
	expect(page).to have_css(".offers-list-static li:nth-child(2)",:text =>"PLUS UP TO 4.0% CASH BACK Up to 50% off Daily Deals. Shop Now Share with Friends")
	expect(page).to have_css(".offers-list-static li:nth-child(3)",:text =>"PLUS UP TO 4.0% CASH BACK 10% Off Orders for the Military Community Sign Up & Save Share with Friends")
end

Given(/^I click to see all Offer Categories$/) do
	find(".filters .categories-filter").click
	expect(page).to have_css(".categories-filter .filter__links",:visible => true)
end

Given(/^I check the "([^"]*)" categories link$/) do |category|
	find(:link,:href =>"/offers?categories=#{category.downcase}").click
	expect(page.current_url).to eql("https://shop-staging.idmeinc.net/offers?categories=#{category.downcase}")
	expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › #{category}")
end

Given(/^I click to see Group Military offers$/) do
	@marketplace_offers.click_offer_groups_filter_sidebar_link
	@marketplace_offers.click_groups_military_sidebar_link

	expect(".filter__links:nth-child(1)",:visible => true)
end

Given(/^I check that the table index shows all military specific$/) do
	(2..10).each do |card_number|
		expect(page).to have_css(".offers-list-static li:nth-child(#{ card_number }) .offer-card__tags .-military")
	end
end

Given(/^I click to see Group First Responder offers$/) do
	@marketplace_offers.click_offer_groups_filter_sidebar_link
	@marketplace_offers.click_groups_first_responder_sidebar_link

	expect(".filter__links:nth-child(2)",:visible => true)
end

Given(/^I check that the table index shows all first responder specific offers$/) do
	(2..10).each do |card_number|
		expect(page).to have_css(".offers-list-static li:nth-child(#{ card_number }) .offer-card__tags .-responder")
	end
end

Given(/^I click to see Group Student offers$/) do
	@marketplace_offers.click_offer_groups_filter_sidebar_link
	@marketplace_offers.click_groups_student_sidebar_link

	expect(".filter__links:nth-child(3)",:visible => true)
end

Given(/^I check that the table index shows all student specific offers$/) do
	(2..10).each do |card_number|
		expect(page).to have_css(".offers-list-static li:nth-child(#{ card_number }) .offer-card__tags .-student")
	end
end

Given(/^I click to see Group Government Employees Offers$/) do
	@marketplace_offers.click_offer_groups_filter_sidebar_link
	@marketplace_offers.click_groups_government_sidebar_link
	expect(".filter__links:nth-child(4)",:visible => true)
end

Given(/^I check that the table index shows all government employee specific offers$/) do
		expect(page).to not_have_selector(".offers-list-static .resource-card")
		#Currently there are no listed government specific deals on marketplace staging
		#TODO: Add a couple test gov specific offers
end

Given(/^I click to see Group Teacher offers$/) do
	@marketplace_offers.click_offer_groups_filter_sidebar_link
	@marketplace_offers.click_groups_teacher_sidebar_link
	expect(".filter__links:nth-child(5)",:visible => true)
end

Given(/^I check that the table index shows all teacher specific offers$/) do
	(2..10).each do |card_number|
		expect(page).to have_css(".offers-list-static li:nth-child(#{ card_number }) .offer-card__tags .-teacher")
	end
end
