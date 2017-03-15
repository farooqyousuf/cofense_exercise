class MarketplaceUserAccountEditPage < IDmeBase

  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.user_account_edit)
  end

end
