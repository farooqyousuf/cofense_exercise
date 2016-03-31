Given(/^MLBTV \- I apply for a yearly premium subscription$/) do
  visit FigNewton.partners.mlb_tv_subscription_page
  find(:link,:text => FigNewton.partners.mlb_tv_yearly_subscription).click
  find_button("Buy Now!").click


end

Given(/^MLBTV \- I apply the Troop ID discount$/) do
  expect(page).to have_text("Receive 35% off your subscription")
  idme_window = window_opened_by { click_on("Troop ID") }

  within_window idme_window do
    sign_in_with_idme
  end
end

Given(/^MLBTV \- I verify the Troop ID discount has been applied$/) do
  click_button("BUY & ACCEPT TERMS") #not a fan of having to induce the error but having focus issue
  sleep 2
  expect(page).to have_text("Step 2: Payment")
  expect(find("#success-id").text).to eq("Military discount with ID.me Status Verified; Discount Applied")
  expect(find("#discount").text).to eq("$38.50") #discount amount
  expect(find("#totalAmount").text).to eq("$71.49")
end
