class Authority

include Capybara::DSL

	# def login
	#   click_link("Sign in with ID.me Authority")
	#   	  binding.pry
	# 	  if find(:css, "#user_email").visible? == true 
	# 	    fill_in(:user_email, :with=> FigNewton.authority.userid) 
	# 		fill_in(:user_password, :with=> FigNewton.authority.password)
	# 	  end  	  	
	#   click_button("Log in")
	#   click_button("Approve") if find_button("Approve").visible?
	# end

	def auth_login
 	  if (page.text.include? "Sign in with ID.me Authority") || (page.text.include? "You need to sign in or sign up before continuing.")
	    auth_click_sign_in
	      if page.text.include? "Authenticate"
	        auth_base_login
		  end
		auth_approve
	  elsif page.text.include? "Authenticate"
	    auth_base_login
	    auth_approve
	  elsif page.text.include? "has requested the following information"
	  	auth_approve
	  elsif page.text.include? "Your login credentials were used in another browser. Please sign in again to continue in this browser."
	    auth_click_sign_in
	    auth_approve
	  else
	     puts "Already signed in!"	  	
	   end
	end

	def auth_base_login
	  fill_in(:user_email, :with=> FigNewton.authority.userid) 
      fill_in(:user_password, :with=> FigNewton.authority.password)
      click_button("Log in")
	end

	def auth_approve
	  click_button("Approve")
	end

	def auth_click_sign_in
	  click_link("Sign in with ID.me Authority")  
	end

end