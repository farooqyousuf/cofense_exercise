Given(/^FANATICS\- I add an item to the cart$/) do
  visit FigNewton.partners.fanatics.product_page

  begin
    #TODO : bad taste to use this rescue so liberaly? find a better way that
      find("#lightboxModal")
      find("#lightboxOverlay").click
    rescue
    #this seems odd ot just have this here
  end
  
  begin 
    select_product_size_for_partner("fanatics")
  rescue 
    #TODO: Refactor this rescue into a test helper and use for all product page stores 
    visit FigNewton.partners.fanatics.product_page2 #fall back url when product_page is all out of stock 
    select_product_size_for_partner("fanatics")
  end 

  find("#addToCart").click
end

Given(/^FANATICS\- I apply the Troop ID discount$/) do
  find("#militaryAndFirstResponderHeaderTitle").click

  idp_signin = window_opened_by { find("#imgMilitary").click }

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^FANATICS\- I verify the Troop ID discount has been applied$/) do
  sleep 2
  expect(find(".ui-alert-body").text).to eql(FigNewton.partners.fanatics.discount_copy) #find a better expectation for this
  original_product_amt_string = find(".displayTotalPrice").text
  actual_product_discounted_amt_string = find("#checkoutCouponTotalValue").text
  discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string,".10")
  expect(discount_applied).to be(true)
end

Given(/^FANATICS_M\- I add an item to the cart$/) do
  visit FigNewton.partners.fanatics.mobile.product_page
  find("#pdpSizeSelector div",:match => :first).click
  find("#mobileAddToCart").click
  find("#militaryAndFirstResponderHeader").click
end

Given(/^FANATICS_M\- I apply the Troop ID discount$/) do
  idp_signin = window_opened_by { find("#imgMilitary").click }

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^FANATICS_M\- I verify the Troop ID discount has been applied$/) do
  expect(page).to have_text FigNewton.partners.fanatics.mobile.discount_copy
  expect(page).to have_css(".couponAmount",:visible => true)

  original_product_amt_string = find(".cartTotalAmount").text
  actual_product_discounted_amt_string = find(".couponAmount").text
  discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string,".10")
  expect(discount_applied).to be(true)
end