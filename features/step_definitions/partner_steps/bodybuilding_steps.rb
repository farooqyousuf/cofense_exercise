Given(/^BODYBUILDING \- I verify the Troop ID HLP military page$/) do
  visit FigNewton.partners.bodybuilding_hlp
  find(".offer-btn").click
  sign_in_with_idme
end

Given(/^BODYBUILDING \- I add a item to my cart$/) do
  @coupon_code = find("#couponText").text

  visit FigNewton.partners.bodybuilding

  find("#OPT2620006-right-submit").click
  find(".add2cart__footer a:nth-child(2)").click
  find(".qa-automation-var-couponcode").set(@coupon_code)
end

Given(/^BODYBUILDING \- I apply the discount code and verify discount applied$/) do
  page.execute_script("window.scrollBy(0,-100)")
  find(".qa-automation-var-claimcoupon").click
  expect(page).to have_text "The Promotional Code #{ @coupon_code } was entered successfully and applied to your cart subtotal."

  original_product_amt_string = first(".actual").text
  actual_product_discounted_amt_string = find(".store-discount").find("strong").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".10",:exact_match => true)
  expect(discount_applied).to be(true)
end
