Given(/^carhartt \- I add an item to the cart$/) do
  visit FigNewton.partners.carhartt_homepage
  click_on "MEDIUM"
  click_on "Add to Cart"
  sleep 1#long delay for their checkout modal to show 
  click_on "Checkout Now"
end

Given(/^carhartt \- I apply the "([^"]*)" discount$/) do |type|
  new_window = window_opened_by { click_link("#{type}") }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^carhartt \- I verify the "([^"]*)" discount has been applied$/) do |type|
  expect(page).to have_css(".order-subtotal-title",:text =>"$134.99")
  expect(page).to have_text "Military and First Responders receive 10% off"
  expect(page).to have_css(".discount .small-4",:text =>"-$13.50")
  expect(page).to have_css("#estimated-total", :text =>"$121.49")
end
