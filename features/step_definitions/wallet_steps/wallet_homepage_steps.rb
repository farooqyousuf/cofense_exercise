Given("I verify I am on the wallet homepage") do
  expect(page.current_url).to eql(FigNewton.wallet.homepage.url)
  expect(page.title).to eql(FigNewton.wallet.homepage.title)
end

Given("I verify that the wallet home hero is displayed") do
  expect(page).to have_css(".page-container",:text => "ID.me simplifies how individuals securely prove and share their identity online.\nFor Business & Government keyboard_arrow_right\nFor Individuals keyboard_arrow_right")
  expect(page).to have_css(".m_feature_image",:visible => true)
end

Given("I verify the For Business and Government navigation dropdown link {string}") do |dropdown_link|
  @WalletHomepage.click_shared_navlink_forbusiness
  find("#js_dropdown1").click_link(dropdown_link)

  expected_url, page_header = case dropdown_link
                              when "Identity Verification" then ["identity_verification", "DIGITAL IDENTITY VERIFICATION"]
                              when "Document Verification" then ["document_verification", "DOCUMENT VERIFICATION"]
                              when "KYC Verification"      then ["kyc_verification", "KYC VERIFICATION"]
                              when "SCRA Monitoring"       then ["scra_monitoring", "SCRA MONITORING"]
                              when "Group Verification"    then ["group_verification", "GROUP VERIFICATION"]
                              when "Military"              then ["military", "MILITARY VERIFICATION"]
                              when "Students"              then ["students", "STUDENT VERIFICATION"]
                              when "Teachers"              then ["teachers", "TEACHER VERIFICATION"]
                              when "First Responders"      then ["first_responders", "FIRST RESPONDER VERIFICATION"]
                              when "Government Employees"  then ["government_employees", "GOVERNMENT EMPLOYEE VERIFICATION"]
                              when "Government"            then ["government", "GOVERNMENT"]
                              when "Healthcare"            then ["healthcare", "HEALTHCARE"]
                              when "Financial Services"    then ["financial_services", "FINANCIAL SERVICES"]
                              when "Ecommerce"             then ["ecommerce", "ECOMMERCE"]
                              when "Ecommerce"             then ["ecommerce", "ECOMMERCE"]
                              when "Request a Demo"        then ["request_demo", "CONTACT US"]
                              else fail ("#{dropdown_link} not recognized")
                              end

  expect(page).to have_current_path(FigNewton.wallet.business_and_gov.send("#{expected_url}"),:url => true)
  expect(page).to have_css(".page-container-header > div > .title",:text => page_header)
  step 'I visit "WalletHomepage"'
end

Given("I verify the For Individuals navigation dropdown link {string}") do |dropdown_link|
  @WalletHomepage.click_shared_navlink_forindividuals
  find("#js_dropdown2").click_link(dropdown_link)

  expected_url, page_header = case dropdown_link
                              when "Accessing Government Services"  then ["accessing_gov_services", "ACCESSING GOVERNMENT SERVICES"]
                              when "Qualifying for Group Discounts" then ["group_discounts", "QUALIFYING FOR GROUP DISCOUNTS"]
                              when "Shop Now"                       then ["shop_now", nil]
                              else fail ("#{dropdown_link} not recognized")
                              end

  expect(page).to have_current_path(FigNewton.wallet.individuals.send("#{expected_url}"),:url => true)

  unless dropdown_link == "Shop Now"
    expect(page).to have_css(".page-container-header > div > .title",:text => page_header)
  end

  step 'I visit "WalletHomepage"'
end

Given("I verify the wallet Sign in links direct to idp") do
  @WalletHomepage.click_wallet_sign_in
  expect(page).to have_current_path(FigNewton.idp.new_session_url,:url => true)
  return_to_previous_page
end

# ------- Wallet mobile steps
Given("I verify the wallet My Account mobile link redirects to idp") do
  @WalletHomepage.click_mobile_my_account_button
  expect(page).to have_current_path(FigNewton.idp.new_session_url,:url => true)
  return_to_previous_page
end
