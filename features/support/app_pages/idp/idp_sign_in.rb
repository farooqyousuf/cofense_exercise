class IDPSignIn < IDmeBase

 def initialize
   super("https://idp-staging.idmeinc.net/sessions/new")
 end
  
 def sign_in(email, password)
   fill_in_email(email)
   fill_in_pw(password)
   click_sign_in
 end
  
 def sign_up
   click_link("Sign up")
 end
  
 def invalid_pw(email)
   fill_in_email(email)
   fill_in_pw(FigNewton.oauth_tester.weak_password)
   click_sign_in
 end

end