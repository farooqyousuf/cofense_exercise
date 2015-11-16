Given(/^SH \- I add an item to the cart$/) do
  visit "http://store.philadelphiaeagles.com/Philadelphia_Eagles_Mens_Jerseys/Mens_Philadelphia_Eagles_Brian_Dawkins_Nike_Midnight_Green_Game_Jersey"
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
