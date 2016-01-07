class FaceBookLoginPage < IDmeBase
  include IDPBase

  def sign_in
    binding.pry
    fill_in_email_by_name(Fignewton.social_network.facebook_email)
    fill_in_password(Fignewton.social_network.facebook_password)
    click_button("Log In")
  end
end
