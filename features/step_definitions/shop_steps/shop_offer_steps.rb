Given(/^I create a Shop Offers index page object$/) do
  @shop_offers = ShopOffersPage.new
end

Given(/^I click on the mobile Shop Sign Up link$/) do
  @ShopOffersPage.click_mobile_signup
end

Given(/^I click on the mobile Shop Sign In link$/) do
  @ShopOffersPage.click_mobile_signin
end

Given(/^I expect the page url to be for Shop Offers Page$/) do
  expect(page.current_url).to eql(FigNewton.shop.offers_index_page)
end

Given(/^I check that the Offers Index is available$/) do
  expect(page).to have_css(".listing__header .heading .breadcrumbs", :text =>"Shop › Offers")
  expect(page).to have_css(".popularDeals")
end

Given(/^I check that store offer index card is visible$/) do
  expect(page).to have_css(".popularDeals .popularDeals__long-ad-cards-item", :match => :first)
end

Given(/^I check the store offer card links for "([^"]*)" User$/) do |user_type|
  if user_type == "Logged Out"
    expect(page).not_to have_content("Unlock to Save")
    expect(page).to have_content("Sign Up & Save")
  elsif user_type == "Logged In"
    expect(page).not_to have_content("Sign Up & Save")
    expect(page).to have_content("Unlock to Save")
  end
end

Given(/^I click to see all promo code offers$/) do
  @ShopOffersPage.click_promocodes_sidebar_link
  expect(page.current_url).to eql(FigNewton.shop.offers_promo_code_index_page)
  expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › Codes")
end

Given(/^I check that the table index are promo code offers$/) do
  expect(page).to have_css(".popularDeals .button", :text => ("Claim Code" || "Unlock to Save"))
  expect(page).not_to have_css(".popularDeals .button", :text => "Shop Now")
end

Given(/^I click to see all Offer Categories$/) do
  @ShopOffersPage.click_categories_filter
  expect(page).to have_css(".categories-filter .filter__links",:visible => true)
end

Given(/^I check the "([^"]*)" categories link$/) do |category|
  find(:link,:href =>"/offers?categories=#{category.downcase}").click
  expect(page.current_url).to eql("https://shop-staging.idmeinc.net/offers?categories=#{category.downcase}")
  expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › #{category}")
  @ShopOffersPage.click_categories_filter
end

Given("I click to see Group {string} offers") do |group|
  @ShopOffersPage.click_offer_groups_filter_sidebar_link
  @ShopOffersPage.click_group(group)
end

Given("I check that the table index shows all {string} specific offers") do |group|
  expect(page).to have_css(".popularDeals .idme-wallet-button", :text => group)
end
