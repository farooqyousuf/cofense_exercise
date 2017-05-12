Given(/^I navigate to the create a new category page$/) do
  visit FigNewton.shop_admin.categories
end

Given(/^I sumbit a valid new category$/) do
  @ShopAdminCategories.create_new_valid_category
end

Given(/^I verify the category has been created$/) do
  @ShopAdminCategories.filter_datatable_for_category
  expect(page).to have_css("#categories", :text => "Fitness & Diet")
  @ShopAdminCategories.delete_test_category
end

Given(/^I submit a new category with blank label$/) do
  @ShopAdminCategories.submit_invalid_category
end

Given(/^I verify a error is returned and no new category is created$/) do
  expect(page).to have_css(".alert", :text =>"× An error has occured, please check the form below")
end

Given(/^I delete a category$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I verify the category has been deleted$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I update the new category$/) do
  @ShopAdminCategories.filter_datatable_for_category
  @ShopAdminCategories.click_on_new_category
  @ShopAdminCategories.update_new_category
end

Given(/^I verify the category has been updated$/) do
  expect(page).to have_css(".alert",:text =>"× Category successfully updated.")
  @ShopAdminCategories.click_cancel_button
  @ShopAdminCategories.filter_datatable_for_category
  expect(page).to have_css("#DataTables_Table_0 tbody td:nth-child(3)",:text =>"Getting super swole")
  @ShopAdminCategories.delete_test_category
end

Given(/^I attempt to submit a duplicate category$/) do
  @ShopAdminCategories.submit_duplicate_category
end

Given(/^I verify a error is returned and no duplicate category is created$/) do
  @ShopAdminCategories.click_cancel_button
  @ShopAdminCategories.filter_datatable_for_category
  expect(page).to have_css("#DataTables_Table_0 tbody a", :text => "fitness-diet", :count => 1)
  @ShopAdminCategories.delete_test_category
end

Given(/^I delete the new category$/) do
  @ShopAdminCategories.delete_test_category
end

Given(/^I verify the new category has been deleted$/) do
  @ShopAdminCategories.filter_datatable_for_category
  expect(page).to_not have_css("#DataTables_Table_0 tbody a",:text =>"fitness-diet")
end
