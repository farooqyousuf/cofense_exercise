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

	def incorrect_sign_in
	  fill_in_email_by_id(FigNewton.mp_users.military)
	  fill_in_password(FigNewton.mp_users.incorrect_password)
	  click_sign_in
	end 
end 
