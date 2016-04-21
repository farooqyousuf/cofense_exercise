class IDPSignUp < IDmeBase

  include IDPBase

  #Readable attributes
  #Allows the username attribute to be read/accessed outside of this class
  attr_reader :username

  def initialize
    super("#{FigNewton.idp.base_url}/registrations/new")
  end

  def user_email_css
    "user_email"
  end

  def unique_username
    @username = "capybara+"+"#{rand(6 ** 8)}"+"@id.me"
    fill_in(user_email_css, :with => @username)
  end

  def pw_tos
    fill_in_password(FigNewton.oauth.general_password)
    fill_in_password_confirmation

    #exposes the checkbox so capybara can click it
    page.execute_script("document.getElementById('user_accepts_terms').style.zIndex ='200'")

    first(".field.checkbox").native.find_element(:id, "user_accepts_terms").click
  end

  def sign_up
    unique_username
    pw_tos
    puts "username: #{@username}"
  end

  def click_sign_up_button
    click_button("Sign up")
  end

  def fill_in_password_confirmation
    fill_in("user_password_confirmation", :with => FigNewton.oauth.general_password)
  end

  def forgot_password_link
    click_link("Forgot your password?")
  end

end
