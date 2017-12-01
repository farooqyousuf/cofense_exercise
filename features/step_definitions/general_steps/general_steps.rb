Given(/^I create a new account after clearing my old "([^"]*)" session$/) do |group|
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

Given(/^I clear the session from Authority$/) do
  sleep 2
  sign_out_of_idme
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
  expect(page.current_url).to eql(FigNewton.shop.shop_homepage)
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

Given(/^I submit an invalid verification code$/) do
  @IDmeBase = IDmeBase.new
  @IDmeBase.fill_in_verification_code("000000")
end


Given(/^I submit the verification code for "([^"]*)"$/) do |option|
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminVerificationAttempts"'
  @admin_verif_attempts = AdminVerificationAttempts.new

  # open and view the latest record
  sleep 2
  find('#s2id_option').click
  find("#select2-results-6").find("div", :text => "#{option}").click

  #select("#{option}", :from => "option")
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
  click_link("Continue")
  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given(/^I generate a unique doc$/) do
  create_new_window
  use_last_browser_created
  visit 'http://pasted.co/'
  fill_in "input_text", with: Faker::Lorem.paragraph(50)

  @IDmeBase = IDmeBase.new
  @IDmeBase.save_screenshot_in_dir
  close_current_browser
  use_last_browser_created
end

Given(/^I generate a unique "([^"]*)" doc$/) do |document|
  create_new_window
  use_last_browser_created
  visit 'http://pasted.co/'
  fill_in "input_text", with: Faker::Lorem.paragraph(50)

  @IDmeBase = IDmeBase.new
  @IDmeBase.save_unique_screenshot_in_dir(document: document)
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

  if page.has_text? "Congratulations!"
    VerificationSuccess.new.click_continue
  end

  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given(/^I approve the document in the IDme support tool$/) do
  @support_tool = SupportTool.new
  @support_tool.login_in_new_window

  step 'I visit "SupportToolDocs"'
  @support_tool_docs = SupportToolDocs.new

  @support_tool_docs.approve_doc
  @support_tool.logout_in_new_window
  if page.has_text? "Congratulations!"
    VerificationSuccess.new.click_continue
  end

  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given(/^I deny the document in the IDme support tool$/) do
  @support_tool = SupportTool.new
  @support_tool.login_in_new_window

  step 'I visit "SupportToolDocs"'
  @support_tool_docs = SupportToolDocs.new

  @support_tool_docs.deny_doc
  @support_tool.logout_in_new_window
end

Given(/^I create "([^"]*)" page objects$/) do |page_objects|
  page_objects_array = page_objects.split(", ")
  page_objects_array.each do |d|
    instance_variable_set("@#{d}", Object.const_get(d).new)
  end
end
