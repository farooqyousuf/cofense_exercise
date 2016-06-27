class MarketplaceCashBackPage < IDmeBase
 
    include IDPBase

    def initialize
      super(FigNewton.mp_users.mp_homepage)
    end

    def request_vip_uid
 			#vip either removed or will hit db directly
    end

end
