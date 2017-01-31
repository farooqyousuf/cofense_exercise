Given(/^NFL_M \- I add an item to the cart$/) do
  visit FigNewton.partners.nfl_mobile.product_page
  select_product_size_for_partner("nfl_mobile")
  find("#mobileAddToCart").click
  sleep 1
end

Given(/^NFL_M \- I apply the Troop ID discount$/) do
  find("#militaryAndFirstResponderHeader").click

  idp_signin = window_opened_by { find("#imgMilitary").click }
    within_window idp_signin do
      sign_in_with_idme
    end
end

Given(/^NLF_M \- I verify the Troop ID discount has been applied$/) do
  original_product_amt_string = find(".cartTotalAmount").text
  actual_product_discounted_amt_string = find(".couponAmount").text
  discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string, ".10")
  expect(discount_applied).to be(true)
end
