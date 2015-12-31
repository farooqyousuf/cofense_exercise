class Authority

include Capybara::DSL

	def login
	  click_link("Sign in with ID.me Authority")
	  fill_in(:user_email, :with=> FigNewton.authority.userid)
	  fill_in(:user_password, :with=> FigNewton.authority.password)
	  click_button("Log in")
	  click_button("Approve")
	end

end