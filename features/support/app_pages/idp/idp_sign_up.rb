class IDPSignUp < IDmeBase

  include IDPBase

  #Readable attributes
  #Allows the user_email attribute to be read/accessed outside of this class

  attr_reader :user_email

  def initialize
    super("#{FigNewton.idp.base_url}/registration/new")
  end

  def user_email_css
    "user_email"
  end

  def unique_user_email
    @user_email = "capybara+"+"#{rand(6 ** 8)}"+"@id.me"
    fill_in(user_email_css, :with => @user_email)
  end

  def pw_tos
    fill_in_password(FigNewton.oauth.general_password)
    fill_in_password_confirmation

    #exposes the checkbox so capybara can click it
    page.execute_script("document.getElementById('user_accepts_terms').style.zIndex ='200'")

    first(".field.checkbox").native.find_element(:id, "user_accepts_terms").click
  end

  def sign_up
    unique_user_email
    pw_tos
    puts "username: #{@user_email}"
  end

  def click_sign_up_button
    click_button("Sign Up")
  end

  def fill_in_password_confirmation
    fill_in("user_password_confirmation", :with => FigNewton.oauth.general_password)
  end

  def forgot_password_link
    click_link("Forgot your password?")
  end

end
