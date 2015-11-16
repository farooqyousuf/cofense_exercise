Given(/^I login as a "([^"]*)" user$/) do |user_type|
	user = case user_type
		   when "Unverified" 
		     then FigNewton.oauth_tester.unverified
	       else fail ("User not found!")
		   end
 @idp_signin = IDPSignIn.new
 @idp_signin.sign_in(user)
end

Given(/^I should be successfully verified(?: as "(.*)")?$/) do |group|
  expect(@oauth_tester.verification_status).to eq(true)
  expect(@oauth_tester.affiliated_as(group)).to eq(true) if group
end

Given(/^I click on the Join Now link$/) do
  @idp_signin = IDPSignIn.new
  @idp_signin.join_now
end

Given(/^I sign up as a new user$/) do
 @idp_sign_up = IDPSignUp.new
 @idp_sign_up.sign_up
 #@idp_signin_up.sign_up_button
 binding.pry
end

Given(/^I login with a "([^"]*)" password$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I should see the red alert box error message "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I login with a "([^"]*)" email$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
