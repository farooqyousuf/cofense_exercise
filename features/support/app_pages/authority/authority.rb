class Authority

include Capybara::DSL

  def auth_login
     if (page.has_text?  "Sign in with ID.me Authority") || (page.has_text?  "You need to sign in or sign up before continuing.")
      auth_click_sign_in
      sleep 1
      if page.has_text? "Authenticate"
          auth_base_login
      end
      sleep 1
      auth_approve
    elsif page.has_text?  "Authenticate"
      auth_base_login
      auth_approve
    elsif page.has_text?  "has requested the following information"
      auth_approve
    elsif page.has_text?  "Your login credentials were used in another browser. Please sign in again to continue in this browser."
      auth_click_sign_in
      auth_approve
    else
       puts "Already signed in!"
     end
  end

  def auth_base_login
    fill_in(:user_email, :with=> FigNewton.authority.userid)
      fill_in(:user_password, :with=> FigNewton.authority.password)
      click_button("Log in")
  end

  def auth_approve
    sleep 2
    click_button("Approve")
  end

  def auth_click_sign_in
    click_link("Sign in with ID.me Authority")
  end

  def logout
    click_link("Log out")
  end
end
