Given(/^I create Shop Store Index Page object$/) do
  @shop_stores_page = ShopStoreIndexPage.new
end

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
  ['123Greetings Store','123Print', '1800AnyLens'].each.with_index(offset=1) do |title,index|
    expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
  end
end

Given(/^I check to sort stores by newest$/) do
  select("newest", :from => "filters")
    ['Bodybuilding.com', 'DISH Network','GlobeIn'].each.with_index(offset=1) do |title,index|
      expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
  end
end

Given(/^I check to sort stores by highest cash back %$/) do
  select("Highest Cash Back %",:from => "filters")
  ['Bigcommerce','The Shaw Academy','FreeTaxUSA'].each.with_index(offset=1) do |title,index|
    expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
  end
end

Given(/^I check to sort stores by highest cash back \$$/) do
  select("Highest Cash Back $",:from => "filters")
  ['DISH Network','KitchenAid','99designs'].each.with_index(offset=1) do |title,index|
    expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
  end
end
