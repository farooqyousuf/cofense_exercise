Given(/^I create a Shop Favorites page object$/) do
  @shop_favorites = FavoritesPage.new
end

Given(/^I visit Favorites from side menu navigation page$/) do
  step 'I visit "ShopUserAccountEditPage"'
  @shop_favorites.navigate_from_side_menu_bar
end

Given(/^I visit Favorites from user menu navigation page$/) do
  @shop_favorites.navigate_from_user_menu_nav
end

Given(/^I expect to be at the Favorites page$/) do
  expect(page.current_url).to eql(FigNewton.shop.favorites_page)
end

Given(/^I add a offer to Saved Offers$/) do
  @shop_favorites.add_saved_offer
end

Given(/^I confirm that offer has been saved$/) do
  @check_saved_offer_text = first(".offer-card").text
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(true)
  @shop_favorites.navigate_from_user_menu_nav
  expect(first(".offer-card").text).to eql(@check_saved_offer_text)
end

Given(/^I remove a offer from Saved Offers$/) do
  @shop_favorites.navigate_from_user_menu_nav
  @shop_favorites.click_save_offer_icon
  sleep 1
end

Given(/^I confirm that the offer has been removed from Saved Offers$/) do
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(false)
  page.driver.browser.navigate.refresh
  expect(page.has_css?(".offer-card")).to be(false)
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
  visit "https://shop-staging.idmeinc.net/stores"
  @shop_favorites.add_favorite_store
  @favorite_offer_header = find(".store-details__grid").find(".heading").text

  expect(page).to have_css("div.unfavorite-merchant")
end

Given(/^I confirm that the store has been saved$/) do
  visit "https://shop-staging.idmeinc.net/favorites"
  expect(first(".offer-card").find(".heading").text).to eql(@favorite_offer_header)
end

Given(/^I remove a favorite store from the favorite stores page$/) do
  visit "https://shop-staging.idmeinc.net/favorites"
  @shop_favorites.click_save_offer_icon
end

Given(/^I confirm that the store has been unfavorited from the store page$/) do
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(false)
end
