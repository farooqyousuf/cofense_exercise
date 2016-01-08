class FaceBookLoginPage < IDmeBase
  include IDPBase

  def sign_in
    fill_in_email_by_name(FigNewton.social_network.facebook_email)
    fill_in_password(FigNewton.social_network.facebook_password)
    binding.pry
    click_button("Log In")
  end
end
