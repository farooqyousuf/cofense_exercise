Given(/^BODYBUILDING \- I verify the Troop ID HLP military page$/) do
	visit "https://hosted-pages.id.me/bodybuilding-military-discount?offer_id=25202"
 
  idp_signin = window_opened_by do
    find(".idme-trigger").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
	
end

Given(/^BODYBUILDING \- I add a item to my cart$/) do
	sleep 1
	@coupon_code = find("#couponCode").text

	visit "http://www.bodybuilding.com/store/bsn/synth.html"
	find("#BSN063-right-submit").click
	find(:link , :href =>"https://www.bodybuilding.com/store/commerce/cart.jsp").click
	find("#promo-code-toggler").click

	find(".qa-automation-var-couponcode").set(@coupon_code)
end

Given(/^BODYBUILDING \- I apply the discount code and verify discount applied$/) do
	page.execute_script("window.scrollBy(0,-100)")
	find(".qa-automation-var-claimcoupon").click 
	expect(page).to have_text "The Promotional Code #{ @coupon_code } was entered successfully and applied to your cart subtotal."

  original_product_amt_string = first(".actual").text
  actual_product_discounted_amt_string = find(".store-discount").find("strong").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".10") 
  expect(discount_applied).to be(true)
end