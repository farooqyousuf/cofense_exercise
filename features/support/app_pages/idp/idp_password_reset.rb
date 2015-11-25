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

 def code
   find("strong")["data-code"]
 end

 def reset_password
   fill_in("code", :with => code)
   fill_in("password", :with => FigNewton.oauth_tester.general_password) 
   fill_in("password_confirmation", :with => FigNewton.oauth_tester.general_password)
   click_button("Submit")
 end

end