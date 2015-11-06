Given(/^MLB \- I add an item to the cart$/) do
  visit " http://mlb.mlb.com/mlb/subscriptions/index.jsp"
  click_link("Get MLB.TV")
  click_on("Buy Now!")
end

Given(/^MLB \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^MLB \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
