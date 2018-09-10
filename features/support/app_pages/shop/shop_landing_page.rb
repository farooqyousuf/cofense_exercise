class ShopLandingPage < IDmeBase
  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.shop.homepage)
  end

  def sign_in(user,password)
    fill_in_email_by_id(user)
    fill_in_password(password)
    sleep 1
    click_sign_in
    sleep 3
  end

  def sign_up
    sleep 1
    click_link("Sign Up")
  end

  def close_out_modal_if_present
    if page.has_css?("div.modal-body")
      click_link("✕ Not now, just browsing")
    end
  end

## Mobile Method(s)
  def scroll_to_bottom_of_sidenav_menu
    last_link = all(".sidenav-nav_link").last
    page.execute_script("arguments[0].scrollIntoView(true)", last_link)
  end
end
