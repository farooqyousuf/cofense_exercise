Given(/^I should be on the government verification screen$/) do
  @iva_govt = IVAGovernment.new
  find(@iva_govt.header_css).visible?
end

Given(/^I submit the government verification form$/) do
  @iva_govt.verify(true)
end

Given(/^I submit the empty government form$/) do
  @iva_govt = IVAGovernment.new
  @iva_govt.verify(false)
end

Given(/^I submit the government verification code$/) do
  @admin_tool = AdminTool.new 
  @admin_tool.login_in_new_window

  step 'I visit "AdminVerificationAttempts"'
  @admin_verif_attempts = AdminVerificationAttempts.new
  
  # open and view the latest record
  select('Government Email', :from => "option")
  @admin_verif_attempts.open_newest

  # get the verification code
  code = nil
  code = @admin_verif_attempts.get_code

  # logout and close window
  @admin_tool.logout_in_new_window

  # fill in verification code
  @admin_verif_attempts.use_last_browser_created
  @iva_govt.fill_in_verification_code(code)
end