Given(/^TAYLOR MADE \- I add a item to the checkout cart$/) do
  visit FigNewton.partners.taylormadegolf
  sleep 1
  page.driver.browser.navigate.refresh
  click_button "Add to Cart"
  first(:link ,:href =>"https://taylormadegolf.com/cart").click
end

Given(/^TAYLOR MADE \- I apply the Troop ID discount$/) do
  page.execute_script "window.scrollBy(0,-100)"
  first(".biling-payment-options-block fieldset fieldset fieldset:nth-child(2)").click
  new_window = window_opened_by { find(".idme-button").click } 
 
  within_window new_window do
    sign_in_with_idme
  end
end

Given (/^TAYLOR MADE - I sign in through the checkout flow$/) do
  find("a[title='Checkout']").click
  find("button[value='Checkout']").click
  fill_in("dwfrm_singleshipping_shippingAddress_addressFields_firstName", :with => "John")
  fill_in("dwfrm_singleshipping_shippingAddress_addressFields_lastName", :with => "Smith")
  fill_in("dwfrm_singleshipping_shippingAddress_addressFields_address1", :with =>"8281 Greensboro Drive")
  fill_in("dwfrm_singleshipping_shippingAddress_addressFields_city", :with =>"Mclean")
 
  page.evaluate_script("document.getElementById('dwfrm_singleshipping_shippingAddress_addressFields_states_state').style.display ='inline'") #shipping address state is hidden element
  select("Virginia",:from =>"dwfrm_singleshipping_shippingAddress_addressFields_states_state")
  
  fill_in("dwfrm_singleshipping_shippingAddress_addressFields_zip",:with =>"22102")
  fill_in("dwfrm_singleshipping_shippingAddress_addressFields_phone",:with =>"866-775-4663")
  click_button "Proceed to billing"
end 

Given(/^TAYLOR MADE \- I verify the Troop ID discount has been applied$/) do
  original_product_amt_string = find(".mini-cart-price-unadjusted").text
  actual_product_discounted_amt_string = find(".order-total .value").text

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".15",:verify_discount_total => true) 
  expect(discount_applied).to be(true)
  page.has_text? "- ID.me Discount 15% off"
end

Given(/^ADIDAS GOLF \- I add a item to the checkout cart$/) do
  visit FigNewton.partners.adidasgolf
  page.driver.browser.navigate.refresh
  sleep 1
  page.execute_script("document.getElementById('va-tm_comfil_size').style.display='block'") #select box is hidden by default
  find("#va-tm_comfil_size")
  select "Small", :from => "va-tm_comfil_size"

  page.execute_script("window.scrollBy(0,-400)")
  sleep 1
  find("#add-to-cart").click
  first(:link, :href => "https://adidasgolf.com/cart").click 
end

Given(/^ASHWORTH GOLF \- I add a item to the checkout cart$/) do
  visit FigNewton.partners.ashworthgolf
  page.driver.browser.navigate.refresh
  sleep 1
  page.execute_script("document.getElementById('va-tm_comfil_size').style.display='block'") #select box is hidden by default
  select "Small", :from => "va-tm_comfil_size"

  page.execute_script("window.scrollBy(0,-400)")
  sleep 1
  find("#add-to-cart").click
  first(:link, :href => "https://ashworthgolf.com/cart").click 
end



