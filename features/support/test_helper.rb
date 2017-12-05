# general module helpers for step definitions
module HelperMethods

  def click_continue_link
    click_link("Continue")
  end

  def sign_in_with_idme
    #TODO figure out why you alotted two identical sign_in_with_idme in manual_helper.rb too
    #TODO once convert everything over the sign_in_with_idme_account method then delete this method
    if page.has_content? "Sign in"
      fill_in "user_email", :with => FigNewton.partners.user
      fill_in "user_password", :with => FigNewton.partners.password
      click_button "Sign in"
    end
  end

  def sign_in_with_idme_account(group_type)
    user_email = case group_type
    when "troop_id"
      FigNewton.partners.user
    when "student_id"
      FigNewton.test_user.student.user_email
    when "responder_id"
      FigNewton.test_user.first_responder.user_email
    when "teacher_id"
      FigNewton.test_user.teacher.user_email
    when "government_id"
      FigNewton.partners.user
    end

    if page.has_content? "Sign in"
      fill_in "user_email", :with => user_email
      fill_in "user_password", :with => FigNewton.partners.password

      page.execute_script "window.scrollBy(0,1000)"
      click_button "Sign in"
    end
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

  def p_tag_message
    #page.find('p').text
    all('p').first.text
  end

  def red_error_under_textfield
    page.find(".formError").text
  end

  def red_error_under_file_upload
    page.find("#fileupload-error").text
  end

  def red_alert_box_message
    page.find(".alert-error").text
  end

  def green_alert_box_message
    page.find(".alert-success").text
  end

  def blue_alert_box_message
    page.find(".alert").text
  end

  def error_label_css
    ".error"
  end

  # def red_error_below_field
  #   page.find(".label-error").text
  # end

  def check_idp_red_highlighted_error(field)
    idp_red = "rgb(194, 58, 39)"

  %w(top right bottom left).each do |border_side|
      red_highlighted_field = page.find(field).native.css_value("border-#{border_side}-color")
      expect(red_highlighted_field).to eql(idp_red)
    end
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
    #TODO : this whole method needs to be refactored and more semanticaly named
    exact_match = options[:exact_match]
    verify_discount_total = options[:verify_discount_total] #when only the total after subtracted discount amount is visible
    full_price = original_product_amt_string.delete "$"

    if exact_match
      calc_discount_amt = ( full_price.to_f * discount_percentage.to_f ).to_i
    else
      calc_discount_amt =  should_round_amt(full_price,discount_percentage)
    end

    full_price = original_product_amt_string.delete "$"

    if verify_discount_total
      #TODO : rename this whole conditional variable and even move it out to its own method but it works right now
      original_total = original_product_amt_string.delete "$"
      discount_total = actual_product_discounted_amt_string.delete "$"
      actual_discount_amt = original_total.to_f - discount_total.to_f
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

  def return_to_previous_page
    page.driver.go_back
  end

  def refresh_browser_page
    page.driver.browser.navigate.refresh
  end

  def select_product_size_for_partner(partner_name) #offers alternative selector in case first size is sold out or unavailable
    begin
      find(FigNewton.partners.send("#{partner_name}").product_selection_1).click
    rescue
      find(FigNewton.partners.send("#{partner_name}").product_selection_2).click
    end
  end
end
