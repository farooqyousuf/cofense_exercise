Given(/^I expect to be at the Shop Stores Index Page$/) do
  expect(page.current_url).to eql(FigNewton.shop.stores_index_page)
end

Given(/^I check that the filter is visible$/) do
  expect(page).to have_css(".sort-filter",:visible => true)
end

Given(/^I check that the Stores index is visible$/) do
  expect(page).to have_css(".stores-list-static",:visible => true)
end

Given(/^I verify the stores merchant card$/) do
  expect(page).to have_css(".stores-list-static li:nth-child(1) .merchant-card",:visible => true)
  expect(page).to have_css(".stores-list-static li:nth-child(1) .merchant-card .resource-card__teaser",:visible => true )
  expect(page).to have_css(".stores-list-static li:nth-child(1) .merchant-card .button",:text =>"View Offers")
end

Given(/^I check to sort stores by name$/) do
  select("name", :from => "filters")
  ['123Inkjets','1800AnyLens', '1-800-Baskets'].each.with_index(offset=1) do |title,index|
    expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
  end
end

Given(/^I check to sort stores by newest$/) do
  step 'I visit "ShopAdminDashboard"'
  step 'I login with Authority'
  step 'I visit "ShopAdminStores"'
  step 'I navigate to the create a new store page'
  step 'I submit a valid new store'
  step 'I visit "ShopStoreIndexPage"'
  store_title = @store_title

  select("newest", :from => "filters")
  expect(page).to have_css(".stores-list-static li:nth-child(1) .merchant-card figure a[title='#{store_title}']")
end


Given(/^I check to sort stores by highest cash back %$/) do
  select("Highest Cash Back %",:from => "filters")
  ['Norton by Symantec','OpenSky','FreeTaxUSA'].each.with_index(offset=1) do |title,index|
    expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
  end
end

Given(/^I check to sort stores by highest cash back \$$/) do
  select("Highest Cash Back $",:from => "filters")
  ['Dish Network Subscriber Referral','Constant Contact','BlueHost'].each.with_index(offset=1) do |title,index|
    expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
  end
end
