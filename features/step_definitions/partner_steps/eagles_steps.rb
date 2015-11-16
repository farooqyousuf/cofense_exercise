Given(/^SH \- I add an item to the cart$/) do
  visit "http://store.philadelphiaeagles.com/Philadelphia_Eagles_Mens_Jerseys/Mens_Philadelphia_Eagles_Brian_Dawkins_Nike_Midnight_Green_Game_Jersey"
  click_link "Choose Size S"
  find("#addToCart").click
end

Given(/^SH \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^SH \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
