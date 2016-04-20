Given(/^TAYLOR MADE \- I add a item to the checkout cart$/) do
  visit FigNewton.partners.taylormadegolf
  page.driver.browser.navigate.refresh
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
  page.has_text? "You Saved: - $75.00"
  page.has_text? "- ID.me Discount 15% off"
  page.has_text? "Order Total: $424.99"
end

Given(/^ADIDAS GOLF \- I add a item to the checkout cart$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^ADIDAS GOLF \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^ADIDAS GOLF \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end