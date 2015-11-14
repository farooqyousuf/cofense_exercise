class IDPSignIn < IDmeBase
	include Capybara::DSL

	def initialize
		super("https://idp-staging.idmeinc.net/sessions/new")
	end

	def visit
		super(URL)
	end

	def sign_in(email)
		fill_in("user_email", :with => email)
		fill_in("user_password", :with => FigNewton.oauth_tester.general_password)
		click_button("Sign in")	
	end

end