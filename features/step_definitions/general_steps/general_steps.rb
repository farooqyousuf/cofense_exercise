Given("I click on {string}") do |button|
  click_on(button)
end

Given("I create a new account after clearing my old {string} session") do |group|
  case group
  when "military"
    step 'I visit IDP through the "military" policy'
  when "responder"
    step 'I visit IDP through the "responder" policy'
  when "student"
    step 'I visit IDP through the "student" policy'
  when "teacher"
    step 'I visit IDP through the "teacher" policy'
  end
  sleep 2
  step 'I click on the Sign Up link'
  sleep 2
  step 'I sign up as a new user'
end

Given("I clear the session from Authority") do
  sleep 2
  sign_out_of_idme
end

Given("I verify the attempt is marked as {string}") do |status|
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminVerificationAttempts"'
  @admin_verif_attempts = AdminVerificationAttempts.new
  sleep 1
  all(".#{status}".downcase)[0].text.should == status
  click_link("Logout")
end

Given("I should be on the Shop Homepage") do
  expect(find(".site-header__logo").visible?).to eql true
  expect(page.current_url).to eql(FigNewton.shop.homepage)
end

Given("I scroll to the bottom of the page") do
  sleep 2
  page.execute_script "window.scrollBy(0,10000)"
  sleep 2
end

Given("I pry") do
  binding.pry
end

Given("I confirm my email address") do
  ConfirmEmail.new.confirm_email
end

Given("I authorize the attribute release") do
  page.has_button? "Allow" #waits for allow button to show
  Consent.new.allow
end

Given("I submit an invalid verification code") do
  step 'I create "SupportToolVerificationAttempts" page objects'

  attempt_uuid = @SupportToolVerificationAttempts.get_uuid(current_url)

  step 'I open a new window'
  visit "https://verify-staging.idmeinc.net/email_confirmations/#{attempt_uuid}/complete?code=000000"
end


Given("I submit the verification code for {string}") do |option|
  step 'I create "AdminTool, AdminVerificationAttempts, SupportTool, SupportToolVerificationAttempts, IDmeBase" page objects'

  attempt_uuid = @SupportToolVerificationAttempts.get_uuid(current_url)

  @AdminTool.login_in_new_window
  step 'I visit "AdminVerificationAttempts"'
  @AdminVerificationAttempts.open_newest

  code = @AdminVerificationAttempts.get_code

  visit "https://verify-staging.idmeinc.net/email_confirmations/#{attempt_uuid}/complete?code=#{code}"
  @AdminVerificationAttempts.close_current_browser
  @AdminVerificationAttempts.use_last_browser_created

  sleep 3

  click_link("Continue")
  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given("I generate a unique {string} doc") do |document|
  create_new_window
  use_last_browser_created
  visit 'http://pasted.co/'
  fill_in "input_text", with: Faker::Lorem.paragraph(50)

  @IDmeBase = IDmeBase.new
  @IDmeBase.save_screenshot_in_dir(document: document)

  close_current_browser
  use_last_browser_created
end

Given("I approve the document in IDme admin") do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminDocs"'
  @admin_docs = AdminDocs.new

  @admin_docs.approve_doc
  @admin_tool.logout_in_new_window

  if page.has_text? "Congratulations!"
    VerificationSuccess.new.click_continue
  end

  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given("I approve the document in the IDme support tool") do
  @support_tool = SupportTool.new
  @support_tool.login_in_new_window

  step 'I visit "SupportToolVerificationAttempts"'
  @support_tool_verification_attempts = SupportToolVerificationAttempts.new

  @support_tool_verification_attempts.approve_doc
  @support_tool.logout_in_new_window
  if page.has_text? "Congratulations!"
    VerificationSuccess.new.click_continue
  end

  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given("I deny the document in the IDme support tool") do
  @support_tool = SupportTool.new
  @support_tool.login_in_new_window

  step 'I visit "SupportToolVerificationAttempts"'
  @support_tool_verification_attempts = SupportToolVerificationAttempts.new

  @support_tool_verification_attempts.deny_doc
  @support_tool.logout_in_new_window
  sleep 3
end

Given("I create {string} page objects") do |page_objects|
  page_objects_array = page_objects.split(", ")
  page_objects_array.each do |d|
    instance_variable_set("@#{d}", Object.const_get(d).new)
  end
end

Given("I verify a military user") do
  step 'I create "MilitaryEmail" page objects'
  step 'I verify using military email information for "Service Member"'
  step 'I submit the verification code for "Military Email Code"'
end

Given("I verify a student user") do
  step 'I create "StudentCreds" page objects'
  sleep 2
  @StudentCreds.click_verify_by_creds
  step 'I click on "Begin"'
  step 'I submit the student credentials verification form as a "unique" record'
end

Given("I set the External Vendor Environment to {string}") do |settings|
  AdminTool.new.login_in_new_window
  step 'I visit "AdminSettings"'
  AdminSettings.new.set_vendor_env(settings: settings)
  sleep 1

  close_current_browser
  use_last_browser_created
end

Given("I set up multi-factor authentication") do
  @IDVComputer.set_up_multifactor
end

Given("I delete the current user") do
  delete_user(@user_email)
end

Given(/^I visit "(.*?)"$/) do |page|
  @page = Object.const_get(page).new # converts a string text into a class name
  @page.visit
end
