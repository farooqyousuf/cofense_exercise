class IDPSignUp < IDmeBase

 #Readable attributes
 #Allows the username attribute to be read/accessed outside of this class
 attr_reader :username

 def initialize
   super("https://idp-staging.idmeinc.net/registrations/new")
 end
 
 def user_email_css
   "user_email"
 end
 
 def unique_username
   @username = "test+"+"#{rand(6 ** 8)}"+"@id.me"
   fill_in(user_email_css, :with => @username)
 end
 
 def pw_tos
   fill_in_password
   fill_in_password_confirmation
   first(".field.checkbox").native.find_element(:id, "user_accepts_terms").click
 end
 
 def sign_up
   unique_username
   pw_tos
   puts "username: #{@username}"
 end
 
 def sign_up_button
   click_button("Sign up")
 end

 def fill_in_password
   fill_in("user_password", :with => FigNewton.oauth_tester.general_password)
 end

 def fill_in_password_confirmation
   fill_in("user_password_confirmation", :with => FigNewton.oauth_tester.general_password)
 end
 
 def forgot_password_link
   click_link("Forgot your password?")
 end

end