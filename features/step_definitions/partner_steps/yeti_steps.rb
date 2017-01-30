Given(/^YETI\- I add an item to the cart$/) do
  visit FigNewton.partners.yeti.product_page
  click_button("Add to Cart")
  puts "Added product to cart"
  click_link("VIEW CART")
  puts "Viewed cart"
end

Given(/^YETI\- I verify my "([^"]*)" through ID\.me$/) do |group|

  user_group = case group
    when "troop_id"
      "military"
    end

  idp_signin = window_opened_by do
    find(".button-container a[data-scope='#{user_group}']").click
  end

  within_window idp_signin do
    sign_in_with_idme_account(group)
  end

end

Given(/^YETI\- I verify my "([^"]*)" discount has been applied$/) do |group|

  user_group = case group
  when "troop_id"
      "military"
    end

  page.has_text? ("YOU HAVE SUCCESSFULLY VERIFIED YOURSELF AS")
  original_product_amt_string = find("#shopping-cart-totals-table > tbody > tr:nth-child(1) > td.a-right > span").text
  actual_product_discounted_amt_string = find("#shopping-cart-totals-table > tbody > tr:nth-child(2) > td.a-right > i > span").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".15", :exact_match => true)
  expect(discount_applied).to be(true)
  puts "#{user_group} discount has successfully been applied"
end
