class MarketplaceBase < IDmeBase

  def fill_in_email_by_id(email)
    fill_in("user_email", :with => email)
  end

  def fill_in_email_by_name(email)
    fill_in("email", :with => email)
  end

  def fill_in_password(password)
    fill_in("user_password", :with => password)
  end

  def click_sign_in
    click_button("Sign in")
  end

  def click_submit_button
    click_button("Submit")
  end
end
