Given(/^COLUMBIA \- I visit the military HLP and verify$/) do
	visit FigNewton.partners.columbia_sport.hlp_page

	new_window = window_opened_by { find(".idme-trigger").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^COLUMBIA \- I add a item to the cart and checkout$/) do
	sleep 2
  refresh_browser_page
  find("#home_hero_text_wintersale_shopmens").click 
  sleep 1
  visit FigNewton.partners.columbia_sport.product_page
	find(".variationboxes .swatchanchor",:match =>:first ).click
	sleep 1
	click_button "Add to Cart"
	sleep 2
end

Given(/^COLUMBIA \- I verify that a discount has been applied$/) do
	visit FigNewton.partners.columbia_sport.shopping_cart_page
	original_product_amt_string = find(".item-price").text
	actual_product_discounted_amt_string = find(".price-adjusted-total").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".15",:verify_discount_total => true)
  expect(discount_applied).to be(true)
end
