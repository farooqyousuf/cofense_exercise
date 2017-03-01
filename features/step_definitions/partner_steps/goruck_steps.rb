Given(/^GORUCK\- I add a item to the cart$/) do
  visit FigNewton.partners.goruck.product_page
  select("21L")
  click_on("Add To Cart")
end

Given(/^GORUCK\- I sign in with my IDme "([^"]*)" account$/) do |group|

  user_group = case group
    when "troop_id"
      "military"
    when "teacher_id"
      "teacher"
    when "responder_id"
      "firstResponder"
    when "student_id"
      "student"
    when "government_id"
      "government"
  end

  find("#gr-idme-#{user_group}").click
  puts "#{user_group} was selected"
  sign_in_with_idme_account(group)
  puts "#{user_group} has signed in"
end


Given(/^GORUCK\- I verify that my "([^"]*)" discount was applied$/) do |group|
  user_group = case group
    when "troop_id"
      "military"
    when "teacher_id"
      "teacher"
    when "responder_id"
      "firstResponder"
    when "student_id"
      "student"
    when "government_id"
      "government"
  end

  page.has_text? ("Earned Service Discount")
  sleep 2
  original_product_amt_string = find(".is-crossedout").text
  actual_product_discounted_amt_string = find(".mz-item-discount").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".25",:exact_match => true)
  expect(discount_applied).to be(true)
  puts "#{user_group} discount has successfully been applied"
end
