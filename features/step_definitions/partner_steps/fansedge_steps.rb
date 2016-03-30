Given(/^FE \- I add an item to the cart$/) do
  visit FigNewton.partners.fansedge
  begin
    #TODO : bad taste to use this rescue so liberaly? find a better way that
      find("#lightboxModal")
      find("#lightboxSaleCloseLink").click
    rescue
  end
  click_link "Choose Size S"
  find("#addToCart").click
end

Given(/^FE \- I apply the Troop ID discount$/) do
  click_link "militaryAndFirstResponderHeaderTitle"
  idp_signin = window_opened_by { find(".desktopIdMeMilitaryBtn").native.send_key :return }

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^FE \- I verify the Troop ID discount has been applied$/) do
  expect(find("#ui-alert-message").text).to eql(FigNewton.partners.fansedge_discount)
  expect(page).to have_selector("#checkoutCouponTotalValue", :visible => true)
  expect(find("#checkoutCouponTotalValue").text).to eql(FigNewton.partners.fansedge_discount_amount)
  expect(page).to have_selector("#desktopIdMeVerified",:text =>"Status Verified",:visible => false)
end
