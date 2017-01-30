Given(/^MLBSHOP \- I add an item to the cart$/) do
  visit FigNewton.partners.mlb_shop.product_page
  page.driver.browser.navigate.refresh
  visit "http://www.mlbshop.com/Baltimore_Orioles_Jerseys/Mens_Baltimore_Orioles_Manny_Machado_Majestic_Orange_Alternate_Cool_Base_Player_Jersey"
  find(".sizeChoiceContainer a[title='Choose Size S']").click
  find("#addToCart").click
  find(:link, :href =>"/cart/view").click
end

Given(/^MLBSHOP \- I apply the Troop ID discount$/) do
  find("#militaryAndFirstResponderHeaderTitle").click
  idp_signin = window_opened_by { find("#imgMilitary").click }
  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^MLBSHOP \- I verify the Troop ID discount has been applied$/) do
  expect(page).to have_css(".ui-alert-body",:text => FigNewton.partners.mlb_shop.discount_copy)
  
  original_product_amt_string = find(".displayTotalPrice").text
  actual_product_discounted_amt_string = find("#checkoutCouponTotalValue").text
  discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string,".15")
  expect(discount_applied).to be(true)
end
