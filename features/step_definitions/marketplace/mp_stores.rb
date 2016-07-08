Given(/^I create Marketplace Store Index Page object$/) do
	@marketplace_stores_page = MarketplaceStoreIndexPage.new 
end

Given(/^I expect to be at the Marketplace Stores Index Page$/) do
	expect(page.current_url).to eql(FigNewton.marketplace.stores_index_page) 
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

	['100 Percent Pure','123Greetings Store','123Inkjets'].each.with_index(offset=1) do |title,index|
		expect(page).to have_css(".stores-list-static li:nth-child(#{index}) .merchant-card figure a[title='#{title}']")
	end 
end

Given(/^I check to sort stores by newest$/) do
	select("newest", :from => "filters")

	['DISH Network','GlobeIn','Fairway Styles'].each.with_index(offset=1) do |title,index|
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