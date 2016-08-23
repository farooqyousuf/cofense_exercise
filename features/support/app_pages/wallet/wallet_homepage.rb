class WalletHomepage < IDmeBase
	include IDPBase
	
	def initialize
		super(FigNewton.wallet.homepage)
	end 
end 