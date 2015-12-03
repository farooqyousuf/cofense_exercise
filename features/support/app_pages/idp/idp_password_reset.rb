class IDPPasswordReset < IDmeBase

 def initialize
   super("https://idp-staging.idmeinc.net/passwords/new")
 end
 
 def fill_in_email(email)
   fill_in("email", :with => email)
 end

 def continue_button
   click_button("Continue")
 end

 def reset_password
   fill_in_reset_pw_code
   fill_in_password
   fill_in_password_confirm
   click_submit
 end

 def click_submit
 	click_button("Submit")
 end

 def fill_in_reset_pw_code
 	fill_in("code", :with => code)
 end

 def fill_in_password
   fill_in("password", :with => FigNewton.oauth_tester.general_password) 
 end

 def fill_in_password_confirm
   fill_in("password_confirmation", :with => FigNewton.oauth_tester.general_password)
 end

 def wrong_reset_pw_code
   fill_in("code", :with => FigNewton.oauth_tester.wrong_unlock_code)
 end

 def resend_code_link
   click_link("Send it again")
 end

end