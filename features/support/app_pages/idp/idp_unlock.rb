class IDPUnlock < IDmeBase

def initialize
  super("https://idp-staging.idmeinc.net/unlocks/new")
end

def lockout_account(username)
   fill_in_email(username)

   11.times do |variable|
      fill_in_pw(FigNewton.oauth_tester.weak_password)
      click_sign_in
   end
 end

 def unlock_link
   click_link("here")
 end

 def code
   find("strong")["data-code"]
 end

 def unlock_account(username)
   fill_in("email", :with => username)
   click_button("Continue")
   fill_in("code", :with => code)
   click_button("Submit")
 end

end