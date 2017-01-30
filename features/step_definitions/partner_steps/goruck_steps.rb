# Given(/^GORUCK STUDENT \- I add a item to the cart$/) do
    # visit FigNewton.partners.goruck.product_page
    # select("21L")
    # click_on("Add To Cart")
# end
#
# Given(/^GORUCK STUDENT \- I sign in with my IDme Student account$/) do
#   find("#gr-idme-student").click
#   find("#user_email").set FigNewton.test_user.student.user_email
#   find("#user_password").set FigNewton.test_user.password
#   click_on("Sign in")
#   click_on("Continue")
# end
#
# Given(/^GORUCK STUDENT \- I verify that my student discount was applied$/) do
#   page.has_text? ("Earned Service Discount")
#   original_product_amt_string = find(".is-crossedout").text
#   actual_product_discounted_amt_string = find(".mz-item-discount").text
#
#   discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".25",:exact_match => true)
#   expect(discount_applied).to be(true)
# end

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
  end

  find("#gr-idme-#{user_group}").click
  puts "#{user_group} was selected"
  
end


Given(/^GORUCK\- I verify that my "([^"]*)" discount was applied$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^GORUCK \- I verify that my "([^"]*)" discount was applied$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
