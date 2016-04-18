
Given(/^moosejaw \- I add an item to the cart$/) do
  visit "http://www.moosejaw.com/moosejaw/shop/product_Arcteryx-Men-s-Captive-SS-Polo_10235054_10208_10000001_-1_"

  click_link "po-link-selectSize"
  click_link "pd_prod_Small"
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
  page.assert_selector("div.checkout-total-figures",:text =>"$68.95")
  page.assert_selector("div.checkout-total-figures",:text =>"$13.79")
  page.assert_selector("div.checkout-total-figures",:text =>"$55.16")
end
