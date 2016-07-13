class MarketplaceOffersPage < IDmeBase 
	include IDPBase 

	def initialize
		super(FigNewton.marketplace.offers_index_page)
	end 
end 