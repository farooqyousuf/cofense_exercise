class IDPSignIn < IDmeBase

 def initialize
   super("https://idp-staging.idmeinc.net/sessions/new")
 end

 def fill_in_email(email)
   fill_in("user_email", :with => email)
 end
 
 def fill_in_pw(password)
   fill_in("user_password", :with => password)
 end

 def click_sign_in
   click_button("Sign in")
 end
 
 def sign_in(email, password)
   fill_in_email(email)
   fill_in_pw(password)
   click_sign_in
 end
 
 def join_now
   click_link("Join now")
   return IDPSignUp.new
 end
 
 def invalid_pw(email)
   fill_in_email(email)
   fill_in_pw(FigNewton.oauth_tester.weak_password)
   click_sign_in
 end

end