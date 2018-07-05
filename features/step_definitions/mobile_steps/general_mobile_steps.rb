Given("I approve the document in the IDme support tool via mobile") do
  @SupportTool.login_in_new_window

  step 'I visit "SupportToolDocs"'
  @SupportToolDocs.approve_mobile_doc
  @SupportTool.logout_in_new_window
  if page.has_text? "Congratulations!"
    VerificationSuccess.new.click_continue
  end

  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given("I open a new window") do
  self.create_new_window
  self.use_last_browser_created
end
