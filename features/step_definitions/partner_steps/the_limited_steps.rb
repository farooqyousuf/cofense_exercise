Given(/^LIMITED\- I visit the shop page$/) do
  visit FigNewton.partners.the_limited.product_page
end

Given(/^LIMITED\- I add a item to the cart$/) do
  find(".size .swatchesdisplay .emptyswatch:nth-child(4)").click
  find(".addtocart").click 
end

Given(/^LIMITED\- I visit the checkout flow$/) do
  visit FigNewton.partners.the_limited.checkout_cart
end

Given(/^LIMITED\- I sign in with my Id\.me "([^"]*)" account$/) do |affinity_group|
  group_id = case affinity_group
    when "military"     then ".IDmeButtonMil a"
    when "teacher"	then ".IDmeButtonTea a"
    when "student" 	then ".IDmeButtonStu a"
  end 

  expect(page).to have_css(".idme-section")
  find(".idme-section-header").click
 
  idp_signin = window_opened_by do
    find(group_id).click
  end

  within_window idp_signin do
    sign_in_with_idme
  end	
end

Given(/^LIMITED\- I verify my IDme discount was applied$/) do
  expect(page).to have_css(".idme-section",:text =>"You are verified with")
  expect(page).to have_css(".orderdiscount .label",:text =>"Extra 10% Off Purchase:")

  original_product_amt_string = find(".ordersubtotal .value").text
  actual_product_discount_amt_string = find(".orderdiscount .value").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discount_amt_string, ".10",:exact_match => true)
  expect(discount_applied).to be(true)
end
