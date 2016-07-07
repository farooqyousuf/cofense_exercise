class MarketplaceStoreIndexPage < IDmeBase
	include IDPBase

	def initialize 
		super(FigNewton.marketplace.stores_index_page)
	end 
end