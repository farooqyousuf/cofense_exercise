Given(/^JO \- I add an item to the cart$/) do
  visit "http://www.jockey.com/catalog?department=men&category=t-shirts#/"
  sleep 1
  page.driver.browser.navigate.refresh

  find("a", :text => "Jockey® Classic Crew Neck - 6 Pack").click
  first(".color-select-control").click
  first(".size-select-control").click
  find(".add-to-bag-btn").click
 
  if find("#TopNavCheckOutButton").visible?
    find("#TopNavCheckOutButton").click
  else
    first("a", :text => "CHECKOUT").click
  end
end

Given(/^JO \- I apply the "([^"]*)" discount$/) do |group|
  user_group = case group
    when "troop_id"
      ".idme-btn-primary-lg-Troop"
    when "responder_id"
      ".idme-btn-primary-lg-Responder"
    when "student_id"
      ".idme-btn-primary-lg-Student"
  end 

  @idp_signin = window_opened_by do
    find(user_group).click 
  end 

  within_window @idp_signin do 
    sign_in_with_idme_account(group)
  end 
end

Given(/^JO \- I verify the IDme "([^"]*)" discount has been applied$/) do |group|
  discount_message_text = case group
  when "troop_id"
    "Military members receive 10% off! with ID.me"
  when "student_id"
    "Students receive 10% off! with ID.me"
  when "responder_id"
    "First Responders receive 10% off! with ID.me"
  end 

  expect(page).to have_css(".idme-container",:text => discount_message_text)
  original_product_amt_string = first(".summary-detail-row .summary-right").text
  actual_product_discounted_amt_string = find(".red-discount-ledger .summary-right").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".10", :exact_match => true) 
  expect(discount_applied).to be(true)
end
