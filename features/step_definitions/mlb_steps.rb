Given(/^MLB \- I add an item to the cart$/) do
  visit "http://mlb.mlb.com/mlb/subscriptions/index.jsp"
  click_link("Get MLB.TV")
  click_on("Buy Now!")
end

Given(/^MLB \- I apply the Troop ID discount$/) do
  click_on("Troop ID")
  idme_window = window_opened_by { click_on("Troop ID") }

  within_window idme_window do
    sign_in_with_idme
  end
end

Given(/^MLB \- I verify the Troop ID discount has been applied$/) do
  expect(find(".idme-btn-affinity").text).to eq("Receive 35% off your subscription")
end
