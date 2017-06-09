Given(/^I select to filter for only active offers$/) do
  @ShopAdminOffers.filter_for_active_offers
 end

Given(/^I verify that all displayed offers are active$/) do
  (1..5).each do |number|
    expect(page).to have_css("#DataTables_Table_0 tr:nth-child(#{number}) td:nth-child(2)",:text => "Yes")
  end
end

Given(/^I select to filter for only inactive offers$/) do
  @ShopAdminOffers.filter_for_inactive_offers
end

Given(/^I verify that all displayed offers are inactive$/) do
  (1..5).each do |number|
    expect(page).to have_css("#DataTables_Table_0 tr:nth-child(#{number}) td:nth-child(2)",:text => "No")
  end
end

Given(/^I navigate to the create a new offer page$/) do
  @ShopAdminOffers.click_button_for_new_offer_page
end

Given(/^I submit a valid new offer$/) do
  @ShopAdminOffers.fill_in_title_field
  @ShopAdminOffers.fill_in_affiliate_url_field
  @ShopAdminOffers.click_create_sidebar_button
end

Given(/^I verify the offer has been created$/) do
  expect(page).to have_css(".alert-success", :text =>"Offer successfully created.")
end
