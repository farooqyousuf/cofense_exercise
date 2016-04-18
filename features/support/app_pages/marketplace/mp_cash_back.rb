class MarketplaceCashBackPage < IDmeBase
    #srequire "rest-client"
    include IDPBase

    def initialize
      super(FigNewton.mp_users.mp_homepage)
    end

    def request_vip_uid
      $last_response = RestClient.get "#{FigNewton.mp_users.mp_homepage}/user/#{FigNewton.mp_users.vip_uid}", {:accept => :json}
      return JSON.parse($last_response.body)["level"]
    end

end
