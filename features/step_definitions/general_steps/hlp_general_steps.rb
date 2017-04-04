
Given(/^I should see the edit hlp page tab elements$/) do
  sleep 1
  ["Duplicate Page","Delete Page","Preview"].each do |edit_link|
    expect(page).to have_link(edit_link)
  end

  ["Launch Page","Update"].each do |edit_button|
    expect(page).to have_button(edit_button)
  end
end

Given(/^I verify the HLP page offer button redirects the user to IDP\-IVA$/) do
  within_window @new_live_page_window do
    @hlp_selected_partner_edit_page.click_idp_sign_in_button
    @hlp_selected_partner_edit_page.switch_to_idp_sign_in_window
    sleep 1 #need brief delay otherwise expectation picks up redirct uri
    expect(page.current_url).to eql(FigNewton.idp.new_session_url)
  end
end

Given(/^I delete the selected hlp page$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I cancel the selected hlp page$/) do
  @hlp_selected_partner_edit_page.click_cancel_link
end

Given(/^I duplicate the selected HLP Page$/) do
  @hlp_selected_partner_edit_page.click_duplicate_page_link
end


Given(/^I login with Authority$/) do
  authority = Authority.new
  authority.auth_login
end

Given(/^I check if page name has been already taken for the "([^"]*)"$/) do |hlp_type|
  step 'I visit "HlpPartnerIndexPage"'

  @hlp_selected_partner_edit_page = HlpEditPage.new
  @hlp_selected_partner_page = HlpPartnerPage.new

  hlp_sample_page_type   = case hlp_type
  when "UngatedPage"   then FigNewton.hlp_page_test_data.ungated_page.name
  when "DocumentPage"  then FigNewton.hlp_page_test_data.document_page.name
  when "GatedPage"     then FigNewton.hlp_page_test_data.gated_page.name
  when "PromoCodePage" then FigNewton.hlp_page_test_data.promo_code_page.name
  when "WufooPage"     then FigNewton.hlp_page_test_data.wufoo_code_page.name
  end

  if @hlp_selected_partner_page.partner_page_already_exists(hlp_sample_page_type)
    @hlp_selected_partner_page.select_existing_page(hlp_sample_page_type)
    @hlp_selected_partner_edit_page.delete_hlp_page

    expect(@hlp_selected_partner_page.partner_page_already_exists(hlp_sample_page_type)).to be(false)
  else
    puts "#{hlp_type} is free to use!"
  end
end

Given(/^I preview the selected HLP page$/) do
  @hlp_selected_partner_edit_page.click_and_open_new_preview_page
  @new_preview_window = window_opened_by do
    @hlp_selected_partner_edit_page.accept_js_alert
  end
end

Given(/^I launch the HLP page$/) do
  @hlp_selected_partner_edit_page.click_launch_page_link
end

Given(/^I click to see the live HLP page$/) do
  expect(page).to have_link "Live Page"

  @new_live_page_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_live_page_link
  end
end

Given(/^I delete the HLP page duplicate$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end
