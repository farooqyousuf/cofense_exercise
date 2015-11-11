Given(/^FE \- I add an item to the cart$/) do
  visit "http://www.fansedge.com/New_England_Patriots_Merchandise/Nike_Tom_Brady_New_England_Patriots_Navy_Blue_Silver_Game_Jersey"
  click_link("Choose Size S")
  find("#addToCart").click
  first(:link,"Checkout").click
end

Given(/^FE \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^FE \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
