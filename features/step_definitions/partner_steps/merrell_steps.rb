Given(/^MERRELL\- I add a item to the cart$/) do
	visit FigNewton.partners.merrell.product_page
	page.driver.browser.navigate.refresh #remove email modal
	find(".variation-item:nth-child(2)").click 
	select_product_size_for_partner("merrell")
	find(".variations-other").click
  find(".product-name-v2").click #click added to counter size menu from blocking cart click
	find("#add-to-cart").click

	visit "http://www.merrell.com/US/en/cart"
end

Given(/^MERRELL\- I signin with my Id\.me military account$/) do
  idp_signin = window_opened_by do
    find(".login-trigger").click
  end

  within_window idp_signin do
    sign_in_with_idme
	end
end

Given(/^MERRELL\- I verify my military discount was applied$/) do
	expect(page).to have_css(".order-discount",:visible => true)
	original_product_amt_string = find(".order-subtotal td:nth-child(2)").text
	actual_product_discounted_amt_string = find(".order-discount td:nth-child(2)").text
	discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string,".10")
	expect(discount_applied).to be(true)

	begin
		expect(page).to have_css(".IDmeButtonMil",:visible => true)
		expect(page).to have_css(".IDmeButtonMil .military")
	rescue
		puts "==================== MERRELL IDme LOGIN BUTTON HAS CHANGED . REVIEW AND CHECK CSS ================================="
		#08/2/16: merrell is suppose to change UI for the button sometime this or next week
	end
end
