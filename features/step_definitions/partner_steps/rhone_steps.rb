Given(/^RHONE \- I add a item to the cart$/) do
	visit "https://www.rhone.com"
	sleep 1
	visit FigNewton.partners.rhone
	first(".sizes li").click
	find(".product-details__addtocart").click
	find(".main-nav__aux-bag").click
	sleep 1
	find(".sidecart-actions__checkout").click
  sleep 1
end

Given(/^RHONE \- I sign in with my Idme military account$/) do
	find(".idMeHeader").click
	first(".idme-btn-primary-lg-Student").click
	sign_in_with_idme
end

Given(/^RHONE \- I verify my military discount was applied$/) do
	expect(page).to have_text("ID.ME-SERVICE MEMBER")
	original_product_amt_string = find(".order-summary__section--total-lines .total-line--subtotal .total-line__price").text
	actual_product_discounted_amt_string = find(".order-summary__section--total-lines .total-line--reduction .total-line__price").text
	discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string,".15",:exact_match => true)

	expect(discount_applied).to be(true)
end
