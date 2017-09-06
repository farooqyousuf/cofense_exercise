require "appium_lib"

Given(/^Android Native: I click through the splash screens$/) do
  el2 = @driver.find_element(:id, "me.id.wallet.sandbox:id/next_button")
  4.times do
    el2.click
  end
end

Given(/^Android Native: I Sign In$/) do
  @driver.find_element(:id, "me.id.wallet.sandbox:id/sign_in").click

  sleep 5

  @driver.find_element(:id, "user_email").send_keys("farooq@id.me")
  @driver.find_element(:id, "user_password").send_keys("Changme123")

  @driver.find_element(:accessibility_id, "Sign in Sign in to your ID.me Wallet").click
  # @driver.find_element(:value, "Sign in").click
end

Given(/^Android Native: I verify I have signed in$/) do
  @driver.page_source.include? "ID.me Wallet Sandbox"
  #text(ID.me Wallet Sandbox).should be present
end

  #inspect for the sign up and sign in

#sign up
  # el3 = driver.find_elements(:id, "user_password")
  # el3.click
  # el3 = driver.find_elements(:id, "user_password_confirmation")
  # el3.click


  # el4 = driver.find_elements(:accessibility_id, "")
  # el4.click

  # el6 = driver.find_elements(:accessibility_id, "Sign up Create your ID.me Wallet")
  # el6.click
