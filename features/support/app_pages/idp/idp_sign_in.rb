class IDPSignIn < IDmeBase

  include IDPBase

  def initialize
   super("#{FigNewton.idp.base_url}/session/new")
  end

  def sign_in(email, password)
   fill_in_email_by_id(email)
   fill_in_password(password)
   click_sign_in
  end

  def click_sign_up_link
   click_link("Sign up")
  end

  def invalid_pw(email)
   fill_in_email_by_id(email)
   fill_in_password(FigNewton.oauth_tester.weak_password)
   click_sign_in
end

end
