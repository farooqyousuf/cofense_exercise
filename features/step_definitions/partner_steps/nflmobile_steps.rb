Given(/^NFLMobile \- I add an item to the cart$/) do
  visit FigNewton.partners.nfl_shop
  page.driver.browser.navigate.refresh
  sleep 1
  click_button "S"
  sleep 1
  click_on "mobileAddToCart"
end

Given(/^NFLMobile \- I apply the Troop ID discount$/) do
  sleep 1
  find_link("militaryAndFirstResponderHeader").click
  sleep 1
  find(".idMeMilitaryBtn").click

  sign_in_with_idme
  sleep 3
end

Given(/^NFLMobile \- I verify the Troop ID discount has been applied$/) do
  sleep 3
  page.assert_text("Status Verified", :wait => 300)
  page.assert_text("A discount of 15% and free shipping was successfully applied to your order.",:wait => 300)
end
