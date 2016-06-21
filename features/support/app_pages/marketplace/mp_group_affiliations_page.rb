class MarketplaceGroupAffiliationsPage < IDmeBase
	include IDPBase
	include RSpec::Matchers

	def initialize 
		super(FigNewton.marketplace.group_affiliations_page)
	end
end 