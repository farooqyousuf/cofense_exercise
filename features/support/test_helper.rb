module HelperMethods
  def sign_in_with_idme
    if page.has_content? "Sign in"
      fill_in "user_email", :with => FigNewton.partners.user
      fill_in "user_password", :with => FigNewton.partners.password
      click_button "Sign in"
    end

    if page.has_content? "Click here to finish"
      click_link "Click here to finish"
    else page.has_content? "Authorize"
      click_button "Authorize"
    end
  end

  def sign_out_of_idme
    page.driver.browser.manage.delete_all_cookies #clears cookies from partner site first
    visit 'https://api.id.me/sessions/new'
    page.driver.browser.manage.delete_all_cookies
  end

  def fanatics_lightbox(brand)
    case brand

      when "FAN"
        click_link('lightboxSaleCloseLink')

      else fail("No Lightbox!")
    end
  end
end

#extraneous code which might be useful later so will keep
#   def test_email
#     "test-#{random_string}@id.me"
#   end
#
#   def random_string
#     Array.new(10) { (rand(122-97) + 97).chr }.join
#   end
# end
