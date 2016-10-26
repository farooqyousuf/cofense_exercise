Given(/^OVERSTOCK \- I create a club o account$/) do
	@random_username = "capybara"+"#{rand(6 ** 8)}"+"@id.me"
	fill_in("createEmailInput",:with => @random_username)
	fill_in("createPasswordInput1",:with => FigNewton.partners.password)
	fill_in("createPasswordInput2",:with => FigNewton.partners.password)
	click_button "Create Account"
end

Given(/^OVERSTOCK \- I verify my IDme account$/) do
	expect(page).to have_css(".co-fg-signup-text",:text =>"Get More with Club O The #1 Membership Program")
	find(".termsCheckBox").click

	idp_signin = window_opened_by do
    find(".addClubO").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^OVERSTOCK \- I verify my club o membership$/) do

	expect(page).to have_css(".co-fg-signup-contents",:text =>"Congratulations! Valued Customer, You have been verified as a Teacher! Your Club O membership will be applied to your account within 24 hours. We will send you an email welcoming you to the Club O program shortly. Start Earning Club O Dollars")
end

Given(/^OVERSTOCK \- I visit the club o "([^"]*)" page$/) do |group|
 affinity_group_page = case group
	when "military" then FigNewton.partners.overstock.military
 	when "teachers" then FigNewton.partners.overstock.teacherstudents
 	when "students" then FigNewton.partners.overstock.teacherstudents
 	when "first responders" then FigNewton.partners.overstock.firstresponders
 end

 group_idme_button = case group
   when "military" then "https://www.overstock.com/troopswap"
 	 when "teachers" then "/clubo-teacher"
 	 when "students" then "/clubo-student"
 	 when "first responders" then "/clubo-first-responder"
 end

 visit affinity_group_page
 find(:link,:href => group_idme_button).click
end

