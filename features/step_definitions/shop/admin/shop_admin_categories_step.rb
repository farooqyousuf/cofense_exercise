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
