Given(/^I create a Marketplace saved offers page object$/) do
  @mp_saved_offers = SavedOffersPage.new
end

Given(/^I visit saved offers from side menu navigation page$/) do
  step 'I visit "MarketplaceUserAccountEditPage"'
  @mp_saved_offers.navigate_from_side_menu_bar
end

Given(/^I visit saved offers from user menu navigation page$/) do
  @mp_saved_offers.navigate_from_user_menu_nav
end

Given(/^I expect to be at the saved offers page$/) do
  expect(page.current_url).to eql(FigNewton.marketplace.saved_offers_page)
end

Given(/^I add a offer to Saved Offers$/) do
  @mp_saved_offers.add_saved_offer
end

Given(/^I confirm that offer has been saved$/) do
  @check_saved_offer_text = first(".offer-card").text
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(true)
  @mp_saved_offers.navigate_from_user_menu_nav
  expect(first(".offer-card").text).to eql(@check_saved_offer_text)
end

Given(/^I remove a offer from Saved Offers$/) do
  @mp_saved_offers.navigate_from_user_menu_nav
  @mp_saved_offers.click_save_offer_icon
  sleep 1
end

Given(/^I confirm that the offer has been removed from Saved Offers$/) do
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(false)
  page.driver.browser.navigate.refresh
  expect(page.has_css?(".offer-card")).to be(false)
end
