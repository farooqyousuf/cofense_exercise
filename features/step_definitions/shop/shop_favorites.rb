Given(/^I create a Shop Favorites page object$/) do
  @shop_favorites = FavoritesPage.new
end

Given(/^I visit Favorites from side menu navigation page$/) do
<<<<<<< HEAD:features/step_definitions/marketplace/mp_favorites.rb
  @mp_favorites.navigate_from_side_menu_bar
=======
  step 'I visit "ShopUserAccountEditPage"'
  @shop_favorites.navigate_from_side_menu_bar
>>>>>>> b0d83ffdccc2013101f4de3a831dae5cedf792f5:features/step_definitions/shop/shop_favorites.rb
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
<<<<<<< HEAD:features/step_definitions/marketplace/mp_favorites.rb
  @check_saved_offer_text = @mp_favorites.saved_offer_header
  @mp_favorites.navigate_from_user_menu_nav
  @mp_favorites.view_favorite_offer
  @favorite_header_text = @mp_favorites.favorite_offer_header
  expect(@favorite_header_text).to eql(@check_saved_offer_text)
end

Given(/^I remove a offer from Saved Offers$/) do
  @mp_favorites.add_saved_offer
  @mp_favorites.navigate_from_user_menu_nav
=======
  @check_saved_offer_text = first(".offer-card").text
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(true)
  @shop_favorites.navigate_from_user_menu_nav
  expect(first(".offer-card").text).to eql(@check_saved_offer_text)
end

Given(/^I remove a offer from Saved Offers$/) do
  @shop_favorites.navigate_from_user_menu_nav
  @shop_favorites.click_save_offer_icon
>>>>>>> b0d83ffdccc2013101f4de3a831dae5cedf792f5:features/step_definitions/shop/shop_favorites.rb
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
<<<<<<< HEAD:features/step_definitions/marketplace/mp_favorites.rb
  @mp_favorites.add_favorite_store
  expect(page).to have_selector(:xpath,".//div[@class='site-content-wrapper']/section[1]/div/div[1]/figure/img[contains(@alt,'123Greetings')]")
=======
  visit "https://shop-staging.idmeinc.net/stores"
  @shop_favorites.add_favorite_store
  @favorite_offer_header = find(".store-details__grid").find(".heading").text

  expect(page).to have_css("div.unfavorite-merchant")
>>>>>>> b0d83ffdccc2013101f4de3a831dae5cedf792f5:features/step_definitions/shop/shop_favorites.rb
end

Given(/^I confirm that the store has been saved$/) do
  visit "https://shop-staging.idmeinc.net/favorites"
<<<<<<< HEAD:features/step_definitions/marketplace/mp_favorites.rb
  expect(page).to have_selector(:xpath, ".//*[@id='store-offers']/div/div[1]/ul/li/div/figure/img[contains(@alt,'123Greetings')]")
=======
  expect(first(".offer-card").find(".heading").text).to eql(@favorite_offer_header)
>>>>>>> b0d83ffdccc2013101f4de3a831dae5cedf792f5:features/step_definitions/shop/shop_favorites.rb
end

Given(/^I remove a favorite store from the favorite stores page$/) do
  visit "https://shop-staging.idmeinc.net/favorites"
<<<<<<< HEAD:features/step_definitions/marketplace/mp_favorites.rb
  @mp_favorites.click_favorite_store_heart_icon
end

Given(/^I confirm that the store has been unfavorited from the store page$/) do
  expect(page).not_to have_css("#store-offers > div > div.stores-tab > ul > li > div
div.merchant-card")
=======
  @shop_favorites.click_save_offer_icon
end

Given(/^I confirm that the store has been unfavorited from the store page$/) do
  expect(first(".offer-card").find(".fa-heart").parent.has_css?(".unsave")).to be(false)
>>>>>>> b0d83ffdccc2013101f4de3a831dae5cedf792f5:features/step_definitions/shop/shop_favorites.rb
end
