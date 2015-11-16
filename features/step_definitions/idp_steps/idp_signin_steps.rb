Given(/^I login as a "([^"]*)" user$/) do |user_type|
 
  user = case user_type
  		 when "Unverified" 
		   then FigNewton.oauth_tester.unverified
	     else fail ("User not found!")
		 end

 password = FigNewton.oauth_tester.general_password

 @idp_signin = IDPSignIn.new
 @idp_signin.sign_in(user, password)
end

Given(/^I should be successfully verified(?: as "(.*)")?$/) do |group|
  expect(@oauth_tester.verification_status).to eq(true)
  expect(@oauth_tester.affiliated_as(group)).to eq(true) if group
end

Given(/^I login with an invalid password$/) do
	@idp_signin.invalid_pw(@username)
end

Given(/^I create the test conditions for Login with invalid password$/) do
  step 'I click on the Join Now link'
  step 'I sign up as a new user'
  step 'I logout of the OAuth Tester'
  step 'I visit the OAuth Tester'
  step 'I select the "Marketplace" policy'
end

Given(/^I login with a "([^"]*)" email$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
