Given("I click on the stores link") do
  @ShopStoresPage.click_stores_link
end

Given("I expect the page url to be for the shop stores page") do
  expect(page.current_url).to eql(FigNewton.shop.stores_page)
end

Given("I filter stores for the {string} category") do |category|
  @ShopStoresPage.click_category(category)
end

Given("I remove filter for the {string} category") do |category|
  @ShopStoresPage.click_category(category)
end

Given("I verify that the stores for the {string} category are shown") do |category|
  stores_found = find(".results__header__count").text
  stores_found = stores_found.split(" ")[0].to_i
  expect(page).to have_css(".pillbox-text[value='#{category} (#{stores_found})']")
end

Given("I verify sorting stores by newest") do
  step 'I visit "ShopAdminDashboard"'
  step 'I login with Authority'
  step 'I visit "ShopAdminStores"'
  step 'I navigate to the create a new store page'
  step 'I submit a valid new store'
  step 'I visit "ShopStoresPage"'
  store_title = @store_title

  find("span", :text => "New").click
  store_title = store_title.downcase.gsub(" ", "-") ## Changes store title format to match store link

  first_store_url = find("a.store_cards_array-card:nth-child(1)")[:href]
  first_store_url = first_store_url.split("-", 3)[2] ## Splits store card url link into array to show store title at end of link

  expect(first_store_url).to eql(store_title)
end
