Given(/^FE \- I add an item to the cart$/) do
  visit "http://www.fansedge.com/New_England_Patriots_Merchandise/Nike_Tom_Brady_New_England_Patriots_Navy_Blue_Silver_Game_Jersey"
  click_link("Choose Size S")
  find("#addToCart").click
  first(:link, "Checkout").click
end

Given(/^FE \- I apply the Troop ID discount$/) do
  click_link "militaryAndFirstResponderHeaderTitle"
  new_window = window_opened_by { find(".desktopIdMeMilitaryBtn").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^FE \- I verify the Troop ID discount has been applied$/) do
  expect(find("#desktopIdStatus").text).to eq("Status Verified")
end
