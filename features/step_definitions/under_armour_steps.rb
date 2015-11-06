Given(/^UA \- I add an item to the cart$/) do
  visit "http://www.underarmour.com/en-us/technology/armour/armourvent/mens?iid=hero"
  find(".close").click
  first(".product-img-link").click
  first(".size-chip").click
  find(".addtocart-btn").click
  find(".checkout-btn").click
  first(".checkout-btn").click
end

Given(/^UA \- I apply the "([^"]*)" discount$/) do |type|
  case type
  when "Troop ID"
   button = "Troop ID"
  when "First Responder"
   button = "First Responders"
  end

  find("a[data-target='#military']").click

  idme_window = window_opened_by do
     find(".idme-btn-primary-lg-Troop").first(:xpath,".//..").native.send_key:return #.native drops down to access the selenium webdriver API methods

  end

  within_window idme_window do
   sign_in_with_idme
  end

end

Given(/^UA \- I verify the "([^"]*)" discount has been applied$/) do |type|
  case type
  when "Troop ID"
    confirmation = "Promo Code Military/First Responder 15% Off Has Been Applied."
  end

  expect(find('.ua-prompt-removable').text).to eq(confirmation)
  find('.ua-prompt-removable').visible?
end
