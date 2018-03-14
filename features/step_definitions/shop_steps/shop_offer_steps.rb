Given(/^I create a Shop Offers index page object$/) do
  @shop_offers = ShopOffersPage.new
end

Given(/^I expect the page url to be for Shop Offers Page$/) do
  expect(page.current_url).to eql(FigNewton.shop.offers_index_page)
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
    expect(page).not_to have_content("Unlock to Save")
  elsif user_type == "Logged In"
    expect(page).not_to have_content("Sign Up & Save")
  end

  expect(page).to have_css(".resource-card .offer-card__share-alt",:match => :first , :text =>"Share with Friends")
end

Given(/^I click to see all promo code offers$/) do
  @shop_offers.click_promocodes_sidebar_link
  expect(page.current_url).to eql(FigNewton.shop.offers_promo_code_index_page)
  expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › Codes")
end

Given(/^I check that the table index are promo code offers$/) do
  @unlock_to_save = @shop_offers.find_unlock_to_save

  if @unlock_to_save
    expect(page).to have_css(".offers-list-static li .button", :match => :first, :text => "Unlock to Save")
  else
    expect(page).to have_css(".offers-list-static li .button", :match => :first, :text => "Claim Code")
  end

  expect(page).to have_css(".offer-card__share-alt", :match => :first, :text => "Share with Friends")

  within find("ul.resources-list-static.offers-list-static") do
    expect(page).to have_content("Claim Code", :minimum => 1)
  end
end

Given(/^I click to see all Offer Categories$/) do
  @shop_offers.click_categories_filter
  expect(page).to have_css(".categories-filter .filter__links",:visible => true)
end

Given(/^I check the "([^"]*)" categories link$/) do |category|
  find(:link,:href =>"/offers?categories=#{category.downcase}").click
  expect(page.current_url).to eql("https://shop-staging.idmeinc.net/offers?categories=#{category.downcase}")
  expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › #{category}")
  @shop_offers.click_categories_filter
end

Given(/^I click to see Group Military offers$/) do
  @shop_offers.click_offer_groups_filter_sidebar_link
  @shop_offers.click_groups_military_sidebar_link
end

Given(/^I check that the table index shows all military specific offers$/) do
  (2..10).each do |card_number|
    expect(page).to have_css(".offers-list-static li:nth-child(#{card_number}) .idme-wallet-button-military")
  end
end

Given(/^I click to see Group First Responder offers$/) do
  @shop_offers.click_offer_groups_filter_sidebar_link
  @shop_offers.click_groups_first_responder_sidebar_link
end

Given(/^I check that the table index shows all first responder specific offers$/) do
  (2..10).each do |card_number|
    expect(page).to have_css(".offers-list-static li:nth-child(#{card_number}) .idme-wallet-button-responder")
  end
end

Given(/^I click to see Group Student offers$/) do
  @shop_offers.click_offer_groups_filter_sidebar_link
  @shop_offers.click_groups_student_sidebar_link
end

Given(/^I check that the table index shows all student specific offers$/) do
  (2..10).each do |card_number|
    expect(page).to have_css(".offers-list-static li:nth-child(#{card_number}) .idme-wallet-button-student")
  end
end

Given(/^I click to see Group Government Employees offers$/) do
  @shop_offers.click_offer_groups_filter_sidebar_link
  @shop_offers.click_groups_government_sidebar_link
end

Given(/^I check that the table index shows all government employee specific offers$/) do
  (1..2).each do |card_number|
    expect(page).to have_css(".offers-list-static li:nth-child(#{card_number}) .idme-wallet-button-government")
  end
end

Given(/^I click to see Group Teacher offers$/) do
  @shop_offers.click_offer_groups_filter_sidebar_link
  @shop_offers.click_groups_teacher_sidebar_link
end

Given(/^I check that the table index shows all teacher specific offers$/) do
  (2..10).each do |card_number|
    expect(page).to have_css(".offers-list-static li:nth-child(#{card_number}) .idme-wallet-button-teacher")
  end
end