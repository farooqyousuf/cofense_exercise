class MarketplaceCashBackPage < IDmeBase
 
    include IDPBase
    require "HTTParty"

    def initialize
      super(FigNewton.mp_users.mp_homepage)
    end

  	def create_cash_back_purchase(user_uid)
  		response = HTTParty.post("https://marketplace-users-staging.idmeinc.net/user/#{ user_uid }/purchase?purchase[order_id]=001&purchase[purchased_at]=2016-04-03&purchase[merchant_id]=175&purchase[merchant_name]=Fanatics&purchase[sale_amount]=150&purchase[commission_amount]=10&purchase[base_commission_amount]=10&purchase[affinity_commission_amount]=0")
  	end 
end
