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
