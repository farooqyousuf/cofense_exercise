Given(/^GORUCK STUDENT \- I add a item to the cart$/) do
  visit FigNewton.partners.goruck.product_page
  select("21L")
  click_on("Add To Cart")
end

Given(/^GORUCK STUDENT \- I sign in with my IDme Student account$/) do
  find("#gr-idme-student").click
  find("#user_email").set FigNewton.test_user.student.user_email
  find("#user_password").set FigNewton.test_user.password
  click_on("Sign in")
  click_on("Continue")
end

Given(/^GORUCK STUDENT \- I verify that my student discount was applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
