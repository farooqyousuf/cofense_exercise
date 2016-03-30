Given(/^carhartt \- I add an item to the cart$/) do
  visit FigNewton.partners.carhartt_homepage
  find(:link, :href =>"http://www.carhartt.com/products/carhartt-men-outerwear/Duck-Chore-Coat-Blanket-Lined-C001").click
  click_on "MEDIUM"
  click_on "Add to Cart"
  click_on "Checkout Now"
end

Given(/^carhartt \- I apply the "([^"]*)" discount$/) do |type|
  new_window = window_opened_by { click_link("#{type}") }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^carhartt \- I verify the "([^"]*)" discount has been applied$/) do |type|
  expect(find(".order-subtotal-title")).to have_text("$84.99")
  expect(page).to have_text "Military and First Responders receive 10% off"
  expect(find(".discount").find(".small-4").text).to eql("-$8.50")
  expect(find("#estimated-total").text).to eql("$76.49")
end
