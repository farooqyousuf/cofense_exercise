class MarketplaceUserAccountEditPage < IDmeBase

  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.user_account_edit)
  end

  def enter_initial_password
    fill_in(:user_password,:with => password)
  end

  def enter_confirm_password
    sleep 1
    fill_in(:user_confirm_password,:with => confirm_password)
  end

end
