Given("I expect the page url to be for the shop offers page") do
  expect(page.current_url).to eql(FigNewton.shop.offers_index_page)
end

Given("I verify that the offers are shown on the offers page") do
  offers = find(".results__header__count").text
  offers_amount = offers.split(" ")[0].to_i
  offers_amount_first_page = all(".store_cards_array-card").count

  expect(page).to have_css(".results__header__count", :text =>"OFFERS FOUND") # Verifies offers found is shown
  expect(offers_amount > 10000).to eql(true) # Verifies there are over 10k offers found
  expect(page).to have_css(".active", :text =>"OFFERS") # Verifies offers is active
  expect(offers_amount_first_page > 10).to eql(true) # Verifies offer cards are shown
end

Given("I verify that the stores are shown on the offers page") do
  stores = find(".results__header__count").text
  stores_amount = stores.split(" ")[0].to_i
  stores_amount_first_page = all(".store_cards_array-card").count

  expect(page).to have_css(".results__header__count", :text =>"STORES FOUND") # Verifies stores found is shown
  expect(stores_amount > 100).to eql(true) # Verifies there are over 100 stores found
  expect(page).to have_css(".active", :text =>"STORES") # Verifies stores is active
  expect(stores_amount_first_page > 10).to eql(true) # Verifies offer cards are shown
end

# WIP
Given("I verify the card button texts for a {string} user") do |user_type|
  if user_type == "signed out"
    expect(page).not_to have_content("Unlock to Save")
    expect(page).to have_css(".button", :text => "Shop Now")
  elsif user_type == "signed in"
    expect(page).not_to have_content("Sign Up & Save")
    expect(page).to have_content("Unlock to Save")
  end
end

Given("I click on the stores link") do
  @ShopOffersPage.click_stores_link
end

Given("I click on the mobile Shop Sign Up link") do
  @ShopOffersPage.click_mobile_signup
end

Given("I click on the mobile Shop Sign In link") do
  @ShopOffersPage.click_mobile_signin
end

#WIP - needs to be included in a separate user category feature tests
Given("I check the {string} categories link") do |category|
  find(:link,:href =>"/offers?categories=#{category.downcase}").click
  expect(page.current_url).to eql("https://shop-staging.idmeinc.net/offers?categories=#{category.downcase}")
  expect(page).to have_css(".listing__header .breadcrumbs",:text =>"Shop › Offers › #{category}")
  @ShopOffersPage.click_categories_filter
end

Given("I filter offers for the {string} group") do |group|
  @ShopOffersPage.click_group(group)
end

Given("I remove filter for the {string} group") do |group|
  @ShopOffersPage.click_group(group)
end

Given("I verify that {string} specific offers are shown") do |group|
  @ShopOffersPage.verify_group_offer(group)
end

Given("I click to see Group {string} offers") do |group|
  @ShopOffersPage.click_group(group)
end

Given("I check that the table index shows all {string} specific offers") do |group|
  expect(page).to have_css(".popularDeals .idme-wallet-button", :text => group)
end
