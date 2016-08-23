class WalletHomepage < IDmeBase
	include IDPBase
	
	def initialize
		super(FigNewton.wallet.homepage)
	end 

	def sign_in(user_email)
		fill_in_email_by_id(user_email)
    fill_in_password(FigNewton.mp_users.general_password)
    click_sign_in
	end
end 