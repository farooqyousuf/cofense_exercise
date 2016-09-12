Given(/^MLBTV \- I apply for a yearly premium subscription$/) do
  visit FigNewton.partners.mlb_tv_subscription_page
  first(".button--yearly").click
  find_button("Buy Now!").click
end

Given(/^MLBTV \- I apply the Troop ID discount$/) do
  expect(page).to have_css(".idme_mil_list",:text => "Military Receive 35% off")
  idme_window = window_opened_by { click_on("Troop ID") }

  within_window idme_window do
    sign_in_with_idme
  end
end

Given(/^MLBTV \- I verify the Troop ID discount has been applied$/) do
  click_button("BUY & ACCEPT TERMS") #not a fan of having to induce the error but having focus issue
  sleep 2
  fill_in("firstName",:with =>"Test")
  click_button("BUY & ACCEPT TERMS") #not a fan of having to induce the error but having focus issue
  sleep 1
  expect(page).to have_text("Step 2: Payment")
  expect(page).to have_css("#success-id", :text => "Military discount with ID.me Status Verified; Discount Applied")
  original_product_amt_string = find("#subtotalAmount").text
  actual_product_discounted_amt_string = find("#discount").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".35") 
  expect(discount_applied).to be(true)
end
