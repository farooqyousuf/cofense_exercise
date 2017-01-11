Given(/^MLBSHOP \- I add an item to the cart$/) do
  visit FigNewton.partners.mlb_shop
  page.driver.browser.navigate.refresh
  visit "http://www.mlbshop.com/Baltimore_Orioles_Jerseys/Mens_Baltimore_Orioles_Manny_Machado_Majestic_Orange_Alternate_Cool_Base_Player_Jersey"
  find(".sizeChoiceContainer a[title='Choose Size S']").click
  find("#addToCart").click
  find(:link, :href =>"/cart/view").click
  # 03/31/16 link for cart view is because add to card button is brokenr right now
end

Given(/^MLBSHOP \- I apply the Troop ID discount$/) do
  find("#militaryAndFirstResponderHeaderTitle").click
  idp_signin = window_opened_by { find("#imgMilitary").click }
  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^MLBSHOP \- I verify the Troop ID discount has been applied$/) do
  #TODO: refactor this to use the verify_discount method
  expect(page).to have_css(".ui-alert-body",:text => FigNewton.partners.mlb_shop_discount)
  expect(page).to have_selector("#checkoutCouponTotalValue", :visible => true)
  expect(page).to have_css("#checkoutCouponTotalValue",:text => FigNewton.partners.mlb_shop_discount_amount)
  expect(page).to have_selector("#desktopIdMeVerified",:text =>"Status Verified",:visible => false)
end
