class MarketplaceOffersPage < IDmeBase 
	include IDPBase 

	def initialize
		super(FigNewton.marketplace.offers_index_page)
	end 

	def click_promocodes_sidebar_link
		find(:link ,:text =>"Promo Codes").click 
	end

	def click_coupons_sidebar_link
		find(:link, :text =>"Coupons").click 
	end 
end 