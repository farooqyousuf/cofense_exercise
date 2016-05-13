
Given(/^moosejaw \- I add an item to the cart$/) do
  visit FigNewton.partners.moosejaw
  click_link "po-link-selectSize"
  click_link "pd_prod_Small"
  click_link "po-link-selectColor"
  click_link "pd_prod_Rojo"
  
  find("#productPageAdd2Cart").click
  find("#MiniShoppingCart").click
  find("#widget_minishopcart").click
end

Given(/^moosejaw \- I apply the Troop ID discount$/) do
  find("#idMe").click
  idme_window = window_opened_by { find(".login-trigger-military").click  }

  within_window idme_window do
    sign_in_with_idme
  end
end

Given(/^moosejaw \- I verify the troop ID discount has been applied$/) do
  page.has_text?("IDMEPROMO")

  original_product_amt_string = find("#order_total").first(".checkout-total-figures").text
  actual_product_discounted_amt_string = find("#order_total").find("div:nth-child(4)").find(".checkout-total-figures").text
  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".20", :exact_match => true ) 

  expect(discount_applied).to be(true)
end
