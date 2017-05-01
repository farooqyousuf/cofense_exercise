Given(/^I navigate to the create a new category page$/) do
  visit FigNewton.shop_admin.categories
end

Given(/^I sumbit a valid new category$/) do
  @ShopAdminCategories.create_new_valid_category
end

Given(/^I verify the category has been created$/) do
    pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I attempt to submit a invalid new category$/) do
    pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I verify a error is returned and no new category is created$/) do
    pending # Write code here that turns the phrase above into concrete actions
end
