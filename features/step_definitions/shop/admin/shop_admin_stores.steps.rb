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
