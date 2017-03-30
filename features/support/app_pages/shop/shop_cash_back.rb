class ShopCashBackPage < IDmeBase

    include IDPBase
    require "HTTParty"

    def initialize
      super(FigNewton.shop_users.shop_homepage)
    end
end
