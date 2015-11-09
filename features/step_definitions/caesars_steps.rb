Given(/^CS \- I add an item to the cart$/) do
  visit "https://www.totalrewards.com/reserve/"
  click_on "btnSearch"
end

Given(/^CS \- I apply the Troop ID discount$/) do
  idme_window = window_opened_by do
    first(".idme-btn-container a").click
  end

  within_window idme_window do
    sign_in_with_idme
  end
end

Given(/^CS \- I verify the discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
