# general module helpers for step definitions
module HelperMethods

  def sign_in_with_idme
    if page.has_content? "Sign in"
      fill_in "user_email", :with => FigNewton.partners.user
      fill_in "user_password", :with => FigNewton.partners.password
      click_button "Sign in"
    end

    if page.has_content? "Click here to continue"
      click_link "Click here to continue"
    elsif page.has_content? "Authorize"
      click_button "Authorize"
    end
  end

  def sign_out_of_idme
    page.driver.browser.manage.delete_all_cookies # clears cookies from partner site first
    visit "https://api.id.me/sessions/new"
    page.driver.browser.manage.delete_all_cookies
  end

  def fanatics_lightbox(brand)
    case brand
    when "FAN"
      click_link "lightboxSaleCloseLink"
    when "NBA"
      click_link "lightboxSaleCloseLink"
    when "NFL"
      click_link "lightboxSaleCloseLinkMM"
    when "fansedge"
      click_link "lightboxSaleCloseLink"
    else fail("No Lightbox!")
    end
  end

  def red_alert_box_message
    page.find(".alert-error").text
  end

  def green_alert_box_message
    page.find(".alert-success").text
  end

  def error_label_css
    ".error"
  end

  def red_error_below_field
    page.find(".label-error").text
  end

  def visit_admin_users_in_new_window
    @admin_tool = AdminTool.new
    @admin_tool.login_in_new_window
    sleep 2
    @admin_users = AdminUsers.new
    sleep 2
    @admin_users.visit
  end

  def verify_discount(original_product_amt_string, actual_product_discounted_amt_string, discount_percentage)
   full_price = original_product_amt_string.delete "$"
   calc_discount_amt = ( full_price.to_f * discount_percentage.to_f ).round.to_i
   actual_discount_amt = /\d{1,3}[,\\.]?(\\d{1,2})?/.match(actual_product_discounted_amt_string)[0].chop.to_i 
   binding.pry
   return actual_discount_amt == calc_discount_amt 
  end 

end
