class ShopLandingPage < IDmeBase
  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.shop.shop_homepage)
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
end
