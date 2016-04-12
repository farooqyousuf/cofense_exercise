Given(/^shave \- I visit the hlp page and get promo code$/) do
  visit "https://hosted-pages.id.me/dollar-shave-club-military-offer?offer_id=572130"
  idme_window = window_opened_by { find(".idme-trigger").click }

  within_window idme_window do
    sign_in_with_idme
  end

  promo_code = find(".show-code").text
  click_link "Continue »"
end

Given(/^shave \- I sign up a new membership and apply Troop ID promo code$/) do
#get through cart
  find("#ember1952").find(:button).click
  find(".checkout-bar").find(:button).click
  fill_in("firstName",:with =>"Mary")
  fill_in("lastName",:with =>"Lamb")
  fill_in("email",:with => "eddie.park.tester@gmail.com")
  fill_in("password",:with =>"Password123")
  first(".button").click
  find(:link, :href =>"/coupon/redeem").click
end

Given(/^shave \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
