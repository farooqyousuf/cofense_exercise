Given(/^SH \- I add an item to the cart$/) do
  visit "http://proshop.seahawks.com/Seattle_Seahawks_Mens_Jerseys/Mens_Seattle_Seahawks_Russell_Wilson_Nike_College_Navy_Game_Jersey"
  click_link "Choose Size S"
  find("#addToCart").click
end

Given(/^SH \- I apply the Troop ID discount$/) do
  click_link "militaryAndFirstResponderHeaderTitle"
  new_window = window_opened_by { find(".desktopIdMeMilitaryBtn").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^SH \- I verify the Troop ID discount has been applied$/) do
  page.has_text? "A discount of 10% was successfully applied to your order."
  page.has_text? "Status Verified"
end
