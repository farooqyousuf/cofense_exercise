Given(/^I create a Marketplace Favorites page object$/) do
  @mp_favorites = FavoritesPage.new
end

Given(/^I visit Favorites from side menu navigation page$/) do
  @mp_favorites.navigate_from_side_menu_bar
end

Given(/^I visit Favorites from user menu navigation page$/) do
  @mp_favorites.navigate_from_user_menu_nav
end

Given(/^I expect to be at the Favorites page$/) do
  expect(page.current_url).to eql(FigNewton.marketplace.favorites_page)
end

Given(/^I add a offer to Saved Offers$/) do
  @mp_favorites.add_saved_offer
end

Given(/^I confirm that offer has been saved$/) do
  @check_saved_offer_text = @mp_favorites.saved_offer_header
  @mp_favorites.navigate_from_user_menu_nav
  @mp_favorites.view_favorite_offer
  @favorite_header_text = @mp_favorites.favorite_offer_header
  expect(@favorite_header_text).to eql(@check_saved_offer_text)
end

Given(/^I remove a offer from Saved Offers$/) do
  @mp_favorites.add_saved_offer
  @mp_favorites.navigate_from_user_menu_nav
  sleep 1
end

Given(/^I confirm that the offer has been removed from Saved Offers$/) do
  page.driver.browser.navigate.refresh
  @mp_favorites.view_favorite_offer
  expect(page).not_to have_css(".offers-list-static")
end

Given(/^I expect to see the Favorite Offers tab$/) do
  find(".offers").click
  expect(page).to have_text "Saved Offers"
end

Given(/^I expect to see the Favorite Stores tab$/) do
  find(".stores").click
  expect(page).to have_text "Saved Stores"
end

Given(/^I add a favorite store$/) do
  @mp_favorites.add_favorite_store
  expect(page).to have_selector(:xpath,".//div[@class='site-content-wrapper']/section[1]/div/div[1]/figure/img[contains(@alt,'123Greetings')]")
end

Given(/^I confirm that the store has been saved$/) do
  visit "https://shop-staging.idmeinc.net/favorites"
  expect(page).to have_selector(:xpath, ".//*[@id='store-offers']/div/div[1]/ul/li/div/figure/img[contains(@alt,'123Greetings')]")
end

Given(/^I remove a favorite store from the favorite stores page$/) do
  visit "https://shop-staging.idmeinc.net/favorites"
  @mp_favorites.click_save_offer_icon
end

Given(/^I confirm that the store has been unfavorited from the store page$/) do
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(false)
end
