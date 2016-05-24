Given(/^TAYLOR MADE \- I add a item to the checkout cart$/) do
  visit FigNewton.partners.taylormadegolf
  page.driver.browser.navigate.refresh
  sleep 1
  click_button "Add to Cart"
  first(:link ,:href =>"https://taylormadegolf.com/cart").click
end

Given(/^TAYLOR MADE \- I apply the Troop ID discount$/) do
  page.execute_script "window.scrollBy(0.,300)"
  new_window = window_opened_by { click_link "Troop ID" } 
 
  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^TAYLOR MADE \- I verify the Troop ID discount has been applied$/) do
  original_product_amt_string = find(".price-unadjusted").text
  actual_product_discounted_amt_string = find(".total-savings").find("span:nth-child(2)").text 

  discount_applied = verify_discount(original_product_amt_string, actual_product_discounted_amt_string, ".15") 
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


