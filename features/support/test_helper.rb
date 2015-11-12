# general module helpers for step definitions
module HelperMethods
  def sign_in_with_idme
    if page.has_content? "Sign in"
      fill_in "user_email", :with => FigNewton.partners.user
      fill_in "user_password", :with => FigNewton.partners.password
      click_button "Sign in"
    end

    if page.has_content? "Click here to finish"
      click_link "Click here to finish"
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
    when "NFL"
      click_link "lightboxSaleCloseLinkMM"
    when "fansedge"
      click_link "lightboxSaleCloseLink"
    else fail("No Lightbox!")
    end
  end
end
