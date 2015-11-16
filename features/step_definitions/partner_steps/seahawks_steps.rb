Given(/^SH \- I add an item to the cart$/) do
  visit 'http://proshop.seahawks.com/Seattle_Seahawks_Mens_Jerseys/Mens_Seattle_Seahawks_Russell_Wilson_Nike_College_Navy_Game_Jersey'
  click_link "Choose Size S"
  find("#addToCart").click
  find("#addToCart").click
end

Given(/^SH \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^SH \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
