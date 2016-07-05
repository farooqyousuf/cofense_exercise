Given(/^I create a new account after clearing my old "([^"]*)" session$/) do |group|
  case group
  when "military"
    step 'I visit IDP through the "military" policy'
  when "responder"
    #this
  end
  step 'I click on the Sign Up link'
  step 'I sign up as a new user'
end

Given(/^I clear the session from Authority$/) do
  @authority = Authority.new
  @authority.auth_login
  OAuthClient.new.logout
  @authority.logout
end

Given(/^I verify the attempt is marked as "([^"]*)"$/) do |status|
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminVerificationAttempts"'
  @admin_verif_attempts = AdminVerificationAttempts.new
  sleep 1
  all(".#{status}".downcase)[0].text.should == status
  click_link("Logout")
end

Given(/^I should be on the Shop Homepage$/) do
  expect(find(".site-header__logo").visible?).to eql true
  expect(page.current_url).to eql(FigNewton.marketplace.shop_homepage)
end

Given(/^I scroll to the bottom of the page$/) do
  sleep 2
  page.execute_script "window.scrollBy(0,10000)"
  sleep 2
end

Given(/^I visit "(.*?)"$/) do |page|
  @page = Object.const_get(page).new # converts a string text into a class name
  @page.visit
end

Given(/^I pry$/) do
  binding.pry
end

Given(/^I confirm my email address$/) do
  ConfirmEmail.new.confirm_email
end

Given(/^I authorize the attribute release$/) do
  Consent.new.allow
end

Given(/^I complete the verification process$/) do
  @iva_success = IVASuccess.new
  @iva_success.continue
end

Given(/^I submit the verification code for "([^"]*)"$/) do |option|
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminVerificationAttempts"'
  @admin_verif_attempts = AdminVerificationAttempts.new

  # open and view the latest record
  select("#{option}", :from => "option")
  @admin_verif_attempts.open_newest

  # get the verification code
  code = nil
  code = @admin_verif_attempts.get_code

  # logout and close window
  @admin_tool.logout_in_new_window

  # fill in verification code
  @admin_verif_attempts.use_last_browser_created
  @IDmeBase = IDmeBase.new
  @IDmeBase.fill_in_verification_code(code)
end

Given(/^I generate a unique doc$/) do
  create_new_window
  use_last_browser_created
  visit 'https://pastie.org'
  fill_in "paste_body", with: Faker::Lorem.paragraph(50)

  @IDmeBase = IDmeBase.new
  @IDmeBase.save_screenshot
  close_current_browser
  use_last_browser_created
end

Given(/^I approve the document in IDme admin$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminDocs"'
  @admin_docs = AdminDocs.new

  @admin_docs.approve_doc

  @admin_tool.logout_in_new_window
end
