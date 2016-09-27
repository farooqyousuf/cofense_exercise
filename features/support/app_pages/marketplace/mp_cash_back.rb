class MarketplaceCashBackPage < IDmeBase
 
    include IDPBase
    require "HTTParty"

    def initialize
      super(FigNewton.mp_users.mp_homepage)
    end
end
