class ShopAdminEmailGenerator < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop_admin.email_generator)
  end
end
