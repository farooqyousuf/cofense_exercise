class TwitterLoginPage < IDmeBase
  include IDPBase

  def sign_in
    fill_in_email_by_name(FigNewton.social_network.twitter_email)
    fill_in("password", :with => FigNewton.social_network.twitter_password)
    click_button("Authorize app")
  end
end
