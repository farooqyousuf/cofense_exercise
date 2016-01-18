class LinkedInLoginPage < IDmeBase
  include IDPBase

  def sign_in
    fill_in("Email",:with => FigNewton.social_network.linkedin_email)
    fill_in("session_password", :with => FigNewton.social_network.linkedin_password)
    click_button "Allow access"
  end
end
