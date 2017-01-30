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
end
