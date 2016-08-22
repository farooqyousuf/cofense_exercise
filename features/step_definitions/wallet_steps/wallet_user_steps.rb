Given(/^I visit the Wallet homepage$/) do
	visit FigNewton.wallet.homepage 
	#add some basic verifications of homepage here?
end

Given(/^I click on the Wallet Sign Up link$/) do
	click_link "Sign Up" #might have to turn into first
end

Given(/^I should be on the marketplace landing page$/) do
  #check the page url is correct
  # check the user name matches?
  # check maybe some page text is available 
  binding.pry
  expect(page.current_url).to eql(FigNewton.)
end

Given(/^I click on the Wallet shared nav link$/) do
  pending # Write code here that turns the phrase above into concrete actions
  #this should be a page object by now however 
  #click link for it 
end

Given(/^I should be on the Wallet dashboard page$/) do
  pending # Write code here that turns the phrase above into concrete actions
  #confirm page url
  #check user url
  #check that page section portions are in fact available 
end
