
Given(/^I login with Authority$/) do
  authority = Authority.new
  authority.auth_login
end

#TODO move this over into a general admin because it will be done for each one
Given(/^I check if page name has been already taken for the "([^"]*)"$/) do |hlp_type|
  step 'I visit "HlpPartnerIndexPage"'

  @hlp_selected_partner_edit_page = HlpEditPage.new
  @hlp_selected_partner_page = HlpPartnerPage.new

  hlp_sample_page_type   = case hlp_type
  when "UngatedPage"   then FigNewton.hlp_page_test_data.ungated_page.name
  when "DocumentPage"  then FigNewton.hlp_page_test_data.document_page.name
  when "GatedPage"     then FigNewton.hlp_page_test_data.gated_page.name
  end

  if @hlp_selected_partner_page.partner_page_already_exists(hlp_sample_page_type)
    @hlp_selected_partner_page.select_existing_page(hlp_sample_page_type)
    @hlp_selected_partner_edit_page.delete_hlp_page

    expect(@hlp_selected_partner_page.partner_page_already_exists(hlp_sample_page_type)).to be(false)
  else
    puts "#{hlp_type} is free to use!"
  end
end

Given(/^I visit the Add UngatedPage page$/) do
  @hlp_selected_partner_page.click_add_ungated_page_link
end

Given(/^I create a new UngatedPage$/) do
  @hlp_selected_partner_edit_page.enter_ungated_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.enter_redirect_url
  @hlp_selected_partner_edit_page.click_create_button
end

Given(/^I should see UngatedPage edit page elements$/) do
  expect(page).to have_link "Duplicate Page"
  expect(page).to have_link "Delete Page"
  expect(page).to have_link "Preview"
  expect(page).to have_button "Launch Page"
  expect(page).to have_button "Update"
end

Given(/^I delete the UngatedPage hlp page$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I cancel the UngatedPage$/) do
  @hlp_selected_partner_edit_page.click_cancel_link
end

Given(/^I should be on the HLP_Test_Partner_Pages page$/) do
    expect(page.current_url).to eql(FigNewton.hlp.homepage)
end

Given(/^I delete the original temp_hlp_ungated$/) do
  @hlp_selected_partner_page.select_original_ungated_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I fill out the data for the UngatedPage$/) do
  @hlp_selected_partner_edit_page.enter_page_name
  @hlp_selected_partner_edit_page.enter_redirect_url
  @hlp_selected_partner_edit_page.enter_body_contents
end

Given(/^I verify the deleted UngatedPage is deleted$/) do
  expect(@hlp_selected_partner_page.partner_page_already_exists("UngatedPage")).to be(false)
end

Given(/^I duplicate the UngatedPage$/) do
  @hlp_selected_partner_edit_page.click_duplicate_page_link
end

Given(/^The UngatedPage name should have copy appended at the end$/) do
  expect(page).to have_field("ungated_page_name", :with => FigNewton.hlp_page_test_data.ungated_page.duplicate_page_name)
end

Given(/^I delete the UngatedPage copy$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I preview the UngatedPage$/) do
  @new_preview_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_and_open_new_preview_page
  end
end

Given(/^I verify all the elements on the Preview UngatedPage hosted landing page$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.ungated_page.preview_page_url)
    expect(page.title).to eql("Sam's Club Military Special Ungated Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I launch the UngatedPage$/) do
  @hlp_selected_partner_edit_page.click_launch_page_link
end

Given(/^I live page the UngatedPage$/) do
  expect(page).to have_link "Live Page"

  @new_live_page_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_live_page_link
  end
end

Given(/^I verify all the elements on the Live UngatedPage hosted landing page$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.ungated_page.live_page_url)
    expect(page.title).to eql("Sam's Club Military Special Ungated Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify the UngatedPage offer button redirects the user to IDP\-IVA$/) do
  within_window @new_live_page_window do
    @hlp_selected_partner_edit_page.click_idp_sign_in_button
    @hlp_selected_partner_edit_page.switch_to_idp_sign_in_window

    expect(page.current_url).to eq(FigNewton.idp.new_session_url)
  end
end
