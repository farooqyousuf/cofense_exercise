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
  idme_window = window_opened_by do
    find(".military-discount-container").click
  end

  within_window idme_window do
    sign_in_with_idme
  end
end

Given(/^JO \- I verify the Troop ID discount has been applied$/) do
  expect(page).to have_content("Military members receive 20% off with ID.me")
end
