Given(/^UA \- I add an item to the cart$/) do
  visit "http://www.underarmour.com/en-us/technology/armour/armourvent/mens?iid=hero"
  find(".close").click
  first(".product-img-link").click
  first(".size-chip").click
  find(".addtocart-btn").click
  find(".checkout-btn").click
  first(".checkout-btn").click
end

Given(/^UA \- I apply the "([^"]*)" discount$/) do |type|
 pending

end

Given(/^UA \- I verify the "([^"]*)" discount has been applied$/) do |type|
 pending
end
