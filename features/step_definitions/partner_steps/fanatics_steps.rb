Given(/^FANATICS\- I add an item to the cart$/) do
  visit FigNewton.partners.fanatics
  find(:link, :href => "http://www.fanatics.com/NFL_Denver_Broncos/Peyton_Manning_Denver_Broncos_Nike_Super_Bowl_50_Game_Jersey_-_Orange").click
  click_link "Choose Size XL"
  find("#addToCart").click
end

Given(/^FANATICS\- I apply the Troop ID discount$/) do
  find("#militaryAndFirstResponderHeaderTitle").click

  idp_signin = window_opened_by { find("#imgMilitary").click }

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^FANATICS\- I verify the Troop ID discount has been applied$/) do
  expect(find(".ui-alert-body").text).to eql(FigNewton.partners.fanatics_discount) #find a better expectation for this
  expect(page).to have_selector("#checkoutCouponTotalValue", :visible => true)
  expect(find("#checkoutCouponTotalValue").text).to eql("-$12.00")
  expect(page).to have_selector("#desktopIdMeVerified",:text =>"Status Verified",:visible => false)
end
