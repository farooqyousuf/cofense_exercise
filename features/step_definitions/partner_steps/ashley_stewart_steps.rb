Given(/^ASHLEY\- I visit the shop page$/) do
	visit FigNewton.partners.ashley_stewart
end

Given(/^ASHLEY\- I add a item to the cart$/) do
	find(".size li:nth-child(1)").click 
	click_button "Add to Bag"
end

Given(/^ASHLEY\- I visit the checkout page$/) do
	visit "https://www.ashleystewart.com/cart"
	page.driver.browser.navigate.refresh # to remove pop-up promotion
end

Given(/^ASHLEY\- I sign in with my Id\.me military account$/) do
	find(".idme-buttons-wrapper").click 
	idp_signin = window_opened_by do
   	find(".IDmeButtonMil a").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^ASHLEY\- I verify my military discount was applied$/) do
	expect(page).to have_css(".cart-promo",:text => "Order Discount: Extra 10% Discount for our Military! Thanks for all you do. ....... Ashley")

	original_product_amt_string = find(".price-adjusted-total").text
	actual_product_discount_amt_string = find(".order-discount td:nth-child(2)").text

	discount_applied = verify_discount(original_product_amt_string, actual_product_discount_amt_string, ".10")
	expect(discount_applied).to be(true)
end

Given(/^ASHLEY\- I sign in with my Id\.me teacher account$/) do
	find(".idme-buttons-wrapper").click 
	idp_signin = window_opened_by do
   	find(".IDmeButtonTea a").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^ASHLEY\- I verify my teacher discount was applied$/) do
	expect(page).to have_css(".cart-promo",:text => "Order Discount: Extra 10% Discount for our Teachers! Thanks for all you do. ....... Ashley")

	original_product_amt_string = find(".price-adjusted-total").text
	actual_product_discount_amt_string = find(".order-discount td:nth-child(2)").text

	discount_applied = verify_discount(original_product_amt_string, actual_product_discount_amt_string, ".10")
	expect(discount_applied).to be(true)
end