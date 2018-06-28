Given("I set the mobile External Vendor Environment to {string}") do |settings|
  AdminTool.new.login_in_new_window
  step 'I visit "AdminSettings"'
  AdminSettings.new.set_vendor_env(settings: settings)
  sleep 1
end

Given("I verify using military documentation for {string} via mobile") do |affiliation|
  step 'I generate a unique "png" doc via mobile'
  step 'I visit IDP through the "military" policy'
  step 'I click on the Military Verify by uploading documentation link'
  step 'I click on the Begin link'
  @MilitaryDoc.verify(affiliation: affiliation, type: "unique")
end

Given("I generate a unique {string} doc via mobile") do |document|
  visit 'http://pasted.co/'
  fill_in "input_text", with: Faker::Lorem.paragraph(50)

  @IDmeBase = IDmeBase.new
  @IDmeBase.save_screenshot_in_dir(document: document)
end

Given("I approve the document in the IDme support tool via mobile") do
  @SupportTool.login_in_new_window

  step 'I visit "SupportToolDocs"'
  binding.pry
  # @SupportToolDocs.approve_mobile_doc
  step 'I visit IDP through th e "military" policy'
  if page.has_text? "Congratulations!"
    VerificationSuccess.new.click_continue
  end

  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end
