class ShopAdminDashboard < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop_admin.base)
  end

end
