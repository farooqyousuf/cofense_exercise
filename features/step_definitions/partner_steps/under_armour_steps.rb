Given(/^UA \- I add an item to the cart$/) do
  visit FigNewton.partners.underarmour_url
  begin
    find(".modal-dialog")
    find(".close").click
  rescue
  end

  find(:link ,:href => "/en-us/mens-ua-streaker-run-v-neck-t-shirt/pid1283380-001").click
  find(".size-chip",match: :first).click
  find(".addtocart-btn").click
  find(".cart-added-container").find(".checkout-btn").click #js div modal
  find(".checkout-btn",match: :first).click
end

Given(/^UA \- I apply the "([^"]*)" discount$/) do |type|
  case type
  when "Troop ID"
    button = "Troop"
  when "First Responder"
    button = "Responder"
  end

  page.execute_script "window.scrollBy(0,1000)"
  find("a[data-target='#military']").click

  idp_signin = window_opened_by do
    find(".idme-btn-primary-lg-" + button)
    .first(:xpath, ".//..").native.send_key :return # .native drops down to access the selenium webdriver API methods
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^UA \- I verify the "([^"]*)" discount has been applied$/) do |type|
  case type
  when "Troop ID"
    confirmation = "Promo Code Military Veteran 10% off Has Been Applied."
  end

  expect(find(".ua-prompt-removable").text).to eq(confirmation)
  expect(find(".itemsSubtotal").text).to eq(FigNewton.partners.underarmour_item_subtotal)
  expect(find(".promo").text).to eq(FigNewton.partners.underarmour_discount_amount)
end
