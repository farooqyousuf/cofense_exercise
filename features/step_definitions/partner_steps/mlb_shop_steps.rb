Given(/^MLBSHOP \- I add an item to the cart$/) do
  visit FigNewton.partners.mlb_shop
  begin
    find("#lightboxModal")
    find("#lightboxSaleCloseLink").click
  rescue

  end

  first(:link , :text => "Jerseys").click
  # TODO : move the link to fignewton or abstract to non specific selection
  find(:link, :href =>"/Baltimore_Orioles_Jerseys/Mens_Baltimore_Orioles_Manny_Machado_Majestic_Orange_Cool_Base_Player_Jersey").click
  click_link "Choose Size L"
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
  expect(find(".ui-alert-body").text).to eql(FigNewton.partners.mlb_shop_discount) #find a better expectation for this
  expect(page).to have_selector("#checkoutCouponTotalValue", :visible => true)
  expect(find("#checkoutCouponTotalValue").text).to eql(FigNewton.partners.mlb_shop_discount_amount)
  expect(page).to have_selector("#desktopIdMeVerified",:text =>"Status Verified",:visible => false)
end
