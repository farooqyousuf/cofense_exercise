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
	if "Logged Out"
		expect(page).to have_css(".resource-card .button", :match => :first , :text =>"Sign Up & Save")
		expect(page).to have_css(".resource-card .offer-card__share-alt",:match => :first , :text =>"Share with Friends")
	end 
end

Given(/^I check that the store offer card favorite and report bug is not visible$/) do
	expect(page).to have_no_selector(".save-offer")
	expect(page).to have_no_selector(".report-offer")
end
