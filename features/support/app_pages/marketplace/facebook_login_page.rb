class FaceBookLoginPage < IDmeBase
  include IDPBase

  def sign_in
    fill_in_email_by_name(FigNewton.social_network.facebook_email)
    fill_in_password(FigNewton.social_network.facebook_password)
    click_button("Log In")
    click_button("Okay")
  end
end
