Given(/^UA \- I add an item to the cart$/) do
  visit FigNewton.partners.underarmour_url
  
  begin
    find(".modal-dialog")
    find(".close").click
  rescue
  end

  #find(:link ,:href => "/en-us/men-s-ua-streaker-run-v-neck-t-shirt/pid1276515-016").click
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
    expect(page).to have_css("span[class='subtotal']",:text => FigNewton.partners.underarmour_item_subtotal)
    expect(page).to have_css(".promo",:text => FigNewton.partners.underarmour_discount_amount)
    expect(page).to have_css("div[class='total']",:text => FigNewton.partners.underarmour_discounted_total)
  end
end
