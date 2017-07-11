class ShopCashBackPage < IDmeBase

  include IDPBase

  def initialize
    super(FigNewton.shop_users.shop_homepage)
  end
end
