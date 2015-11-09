Given(/^JO \- I add an item to the cart$/) do
  visit "http://www.jockey.com/catalog?department=men&category=t-shirts#/"
  first(".ProductListImage").click
  first("#ProductColors a").click
  first("#ProductSizes a").click
  find("#AddToBagPD").click
  find("#CheckOutButtonPD").click
  first("a", :text => "CHECKOUT").click
end

Given(/^JO \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^JO \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
