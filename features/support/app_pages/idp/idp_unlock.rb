class IDPUnlock < IDmeBase

def initialize
  super("https://idp-staging.idmeinc.net/unlocks/new")
end

def lockout_account(username)
   fill_in_email_by_id(username)

   11.times do |variable|
      fill_in_password(FigNewton.oauth_tester.weak_password)
      click_sign_in
   end
 end
 
 def click_continue_button
   click_button("Continue")
 end

 def click_submit_button
   click_button("Submit")
 end

 def unlock_account(username)
   fill_in_email_by_name(username)
   click_continue_button
   fill_in_code(code_css)
   click_submit_button
 end

end