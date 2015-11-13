Given(/^NHL \- I add a item to the cart$/) do
  visit 'http://shop.nhl.com/Boston_Bruins_Jerseys/Mens_Boston_Bruins_Reebok_Black_2016_Winter_Classic_Premier_Jersey'
  click_link "Choose Size S"
  find("#addToCart").click
end

Given(/^NHL \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^NHL \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
