require "appium_lib"

Given(/^Android First Test$/) do
  el2 = @driver.find_element(:id, "me.id.wallet.sandbox:id/next_button")
  4.times do
    el2.click
  end
  binding.pry
  #inspect for the sign up and sign in
  #@driver.find_element(:id, "user_email").send_keys("farooq")
end
