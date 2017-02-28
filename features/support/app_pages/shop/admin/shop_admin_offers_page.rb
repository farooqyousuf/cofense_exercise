class ShopAdminOffers < IDmeBase
  include IDPBase
  
  def initialize
    super(FigNewton.shop_admin.offers)
  end 

  def filter_for_active_offers
    select("All Active Offers",:from =>"offer")
  end 

  def filter_for_inactive_offers
    select("ll Inactive Offers",:from =>"offer")
  end 
end
