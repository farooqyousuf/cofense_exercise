class IDPUnlock < IDmeBase

  include IDPBase

def initialize     
  super("#{FigNewton.idp.base_url}/unlocks/new")
end

def lockout_account(username)
   11.times do |variable|
      fill_in_email_by_id(username)
      fill_in_password(FigNewton.oauth_tester.weak_password)
      click_sign_in
   end
 end

 def unlock_account(username)
   fill_in_email_by_name(username)
   click_continue_button
   sleep 1
   fill_in_code(code_css)
   click_submit_button
 end

end