class IDPNewWallet < IDmeBase

  include IDPBase

  def click_joining_first_time
    click_link("I am joining ID.me for the first time")
  end

  def check_tos_pp
    page.execute_script("document.getElementById('user_terms').style.zIndex ='200'")
    first(".field.checkbox").native.find_element(:id, "user_terms").click
  end

  def create_password
    fill_in("user_password", :with => FigNewton.oauth.general_password)
    fill_in("user_password_confirmation", :with => FigNewton.oauth.general_password)
  end
end
