Given(/^COLUMBIA \- I visit the military HLP and verify$/) do
	visit FigNewton.partners.columbia_sport_hlp

	new_window = window_opened_by { find(".idme-trigger").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^COLUMBIA \- I add a item to the cart and checkout$/) do
	find(".modal-close").click 

	visit "http://www.columbia.com/mens-zero-rules-short-sleeve-shirt-AM6464.html?cgid=men-shirts-shortsleeve&dwvar_AM6464_variationColor=845#start=1"
	find(".variationboxes").first(".swatchanchor").click

	click_button "Add to Cart"
end

Given(/^COLUMBIA \- I verify that a discount has been applied$/) do
	visit "https://www.columbia.com/cart"
	expect(page).to have_css(".promo-adjustment",:text=>'Thank you for your service')

	original_product_amt_string = find(".item-price").text
	actual_product_discounted_amt_string = find(".price-adjusted-total").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".15",:verify_discounted_total => true) 
  expect(discount_applied).to be(true)
end