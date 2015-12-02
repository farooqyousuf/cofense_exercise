Given(/^NFLMobile \- I add an item to the cart$/) do
  visit FigNewton.partners.nfl_shop

  if page.has_link? "lightboxSaleCloseLink"
    click_link "lightboxSaleCloseLink"
  end
  click_button "S"
  click_on "mobileAddToCart"
end

Given(/^NFLMobile \- I apply the Troop ID discount$/) do
  find_link("militaryAndFirstResponderHeader").click
  find(".idMeMilitaryBtn").click
  sign_in_with_idme
end

Given(/^NFLMobile \- I verify the Troop ID discount has been applied$/) do
  page.assert_text "Status Verified"
  page.assert_text "A discount of 15% and free shipping was successfully applied to your order."
end
