class MarketplaceLandingPage < IDmeBase

  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.shop_homepage)
  end
end
