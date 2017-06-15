Given(/^I navigate to the create a new store page$/) do
  @ShopAdminStores.click_button_for_new_store_page
end

Given(/^I submit a valid new store$/) do
  @ShopAdminStores.fill_in_title_field
  @ShopAdminStores.click_create_sidebar_button
end

Given(/^I verify the store has been created$/) do
  expect(page).to have_css(".alert-success", :text => "Store successfully created.")
end

Given(/^I click to edit a store from the shop admin stores index$/) do
  @ShopAdminStores.search_for_store
  @ShopAdminStores.select_first_matching_store
end

Given(/^I add a new category to the store$/) do
  @ShopAdminStores.search_for_store_category
  @ShopAdminStores.select_category_result_return
  @ShopAdminStores.update_store_page
end

Given(/^I verify the store has been updated$/) do
  expect(page).to have_css(".alert-success", :text => "× Store successfully updated.")
end

Given(/^I verify the category has been added to the store$/) do
  expect(page).to have_css("#store_categories_attributes_0_label[value='Fitness & Diet']")
end

Given(/^I delete the store category$/) do
  @ShopAdminStores.remove_store_category
  @ShopAdminStores.update_store_page
end
