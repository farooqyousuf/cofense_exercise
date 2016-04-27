class IDPPasswordReset < IDmeBase

  include IDPBase

  def initialize
    super("#{FigNewton.idp.base_url}/passwords/new")
  end

  def reset_password
    fill_in_code(code_css)
    fill_in_password
    fill_in_password_confirm
    click_submit_button
  end

  def fill_in_password
    fill_in("password", :with => FigNewton.oauth.general_password)
  end

  def fill_in_password_confirm
    fill_in("password_confirmation", :with => FigNewton.oauth.general_password)
  end

  def resend_code_link
    click_link("Send it again")
  end

end
