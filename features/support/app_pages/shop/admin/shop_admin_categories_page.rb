class ShopAdminCategories < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop_admin.categories)
  end


end
