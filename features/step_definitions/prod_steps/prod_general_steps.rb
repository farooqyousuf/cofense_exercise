########### General Steps
Given("I visit the {string} production page") do |view|
  url = case view
        when "vets.gov" then FigNewton.partners.vetsgov
        when "wallet"   then FigNewton.wallet.homepage.url
        end

  visit(url)
end

Given("I login as a {string} user in production") do |user_type|
  user = case user_type
         when "Unverified" then FigNewton.oauth.unverified
         end

  password = FigNewton.oauth.general_password

  @IDPSignIn.sign_in(user, password)
end

########### Vets.gov Steps
Given("I should be successfully signed into vets.gov production") do
  expect(page).not_to have_content("Sign in or sign up for an account")
end

Given("I click on {string} for vets.gov") do |button|
  login_window = window_opened_by do
    click_on(button)
  end
  switch_to_window(login_window)
end

########### Wallet Steps
Given("I should be successfully signed into wallet production") do
  page.has_css? ".company_logo" #wait for page to load before check
  expect(page).to have_css(".button_text", :text => "Sign Out")
  expect(page).to have_css(".button_text", :text => "My Account")
  expect(page).not_to have_css(".button_text", :text => "Sign In")
end
