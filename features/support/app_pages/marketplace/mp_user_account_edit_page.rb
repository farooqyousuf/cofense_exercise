class MarketplaceUserAccountEditPage < IDmeBase

  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.user_account_edit)
  end

  def enter_initial_password
    fill_in(:core_user_password,:with => password)
  end

  def enter_confirm_password
    sleep 1
    fill_in(:core_user_confirm_password,:with => confirm_password)
  end

  def enter_correct_password_fields
    fill_in(:core_user_password,:with => FigNewton.marketplace.new_password)
    fill_in(:core_user_confirm_password,:with => FigNewton.marketplace.new_password)
  end

  def sign_out
    click_link "Sign Out"
  end

  def new_sign_in
    fill_in(:user_email,:with => FigNewton.mp_users.vip)
    fill_in(:user_password,:with => FigNewton.marketplace.new_password)
    click_button "Sign in"
  end
end
