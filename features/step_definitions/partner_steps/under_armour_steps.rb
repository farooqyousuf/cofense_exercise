Given(/^UA \- I add an item to the cart$/) do
  visit FigNewton.partners.underarmour_url

  begin
    find(".modal-dialog")
    find(".close").click
  rescue
  end

  find("li.size-chip:nth-child(2)").click
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
  page.execute_script "window.scrollBy(0,650)"
  sleep 1
  find(".extras .panel-group .panel:nth-child(2)").click

  idp_signin = window_opened_by do
    find(".idme-btn-primary-lg-Troop").first(:xpath, ".//..").native.send_key :return # .native drops down to access the selenium webdriver API methods
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^UA \- I verify the "([^"]*)" discount has been applied$/) do |type|
  begin
    case type
    when "Troop ID"
      confirmation = "Promo Code Military 10% off Has Been Applied. Remove"
    end
    expect(page).to have_css(".ua-prompt-removable", :text => confirmation )

    original_product_amt_string = find("span[class='subtotal']").text
    actual_product_discounted_amt_string = find(".promo div[class='number']").text
    discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string,".10",:exact_match => true)

    expect(discount_applied).to be(true)
  end
end
