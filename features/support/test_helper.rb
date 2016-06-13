# general module helpers for step definitions
module HelperMethods

  def sign_in_with_idme 
    #TODO figure out why you alotted two identical sign_in_with_idme in manual_helper.rb too
    if page.has_content? "Sign in"
      fill_in "user_email", :with => FigNewton.partners.user
      fill_in "user_password", :with => FigNewton.partners.password
      click_button "Sign in"
    end

    click_link "Continue"
    # if page.has_text? "Click here to continue"
    #   click_link "Click here to continue"
    # elsif page.has_text? "Authorize"
    #   click_button "Authorize"
    # elsif page.has_text? "Continue"
    #   click_link "Continue"
    # end
  end

  #TODO - Refactor the duplicate sign_in options we have right now to single
  def sign_in_with_idme_veteran 
    if page.has_content? "Sign in"
      fill_in "user_email", :with => FigNewton.test_user.military.veteran.user_email
      fill_in "user_password", :with => FigNewton.test_user.password
      click_button "Sign in"
    end

    if page.has_text? "Click here to finish"
      click_link "Click here to finish"
    
    elsif page.has_text? "Allow"
       click_button "Allow"

    elsif page.has_text? "Authorize" 
      click_button "Authorize"

    elsif page.has_text? "Continue"
      click_link "Continue"
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

   def verify_discount(original_product_amt_string, actual_product_discounted_amt_string, discount_percentage, options={})
   exact_match = options[:exact_match]
   verify_discount_total = options[:verify_discount_total]
   full_price = original_product_amt_string.delete "$"

  if exact_match
    calc_discount_amt = ( full_price.to_f * discount_percentage.to_f ).to_i
  else 
    calc_discount_amt =  should_round_amt(full_price,discount_percentage)
  end 

   full_price = original_product_amt_string.delete "$"

   if verify_discount_total
     #TODO: rename this whole conditional variable and even move it out to its own method
     original_total = original_product_amt_string[0] = ""
     discount_total = actual_product_discounted_amt_string[0] =""
     actual_discount_amt = original_product_amt_string.to_f - actual_product_discounted_amt_string.to_f 
   else 
    actual_discount_amt = /\d{1,3}[,\\.]?(\\d{1,2})?/.match(actual_product_discounted_amt_string)[0].chop.to_i
   end 
   return actual_discount_amt == calc_discount_amt 
  end 

  private 

  def should_round_amt(full_price,discount_percentage)
    expected_discount_amt = full_price.to_f * discount_percentage.to_f
    if expected_discount_amt.to_s.split(".")[1] === "5" #will prevent rounded up number being returned 
      expected_discount_amt.to_s.split(".")[0].to_i
    else 
      expected_discount_amt.round.to_i
    end 
  end 
end
