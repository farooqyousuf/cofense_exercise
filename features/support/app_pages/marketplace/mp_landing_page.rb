class MarketplaceLandingPage < IDmeBase

  include IDPBase

  def initialize
    super(FigNewton.marketplace.shop_homepage)
  end

  def sign_in(user,password) #might need to move this to more general page object in itself
    fill_in_email_by_id(user)
    fill_in_password(password)
    click_sign_in
  end
end
