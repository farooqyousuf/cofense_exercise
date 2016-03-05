Given(/^I visit the Add DocumentPage page$/) do
  @hlp_selected_partner_page.click_add_document_page_link
end

Given(/^I create a new DocumentPage$/) do
  @hlp_selected_partner_edit_page.enter_document_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.attach_document_file
  @hlp_selected_partner_edit_page.click_create_button
end

Given(/^I should see DocumentPage edit page elements$/) do
  # TODO : refactor this to generic hlp edit page expectation page
  expect(page).to have_link "Duplicate Page"
  expect(page).to have_link "Delete Page"
  expect(page).to have_link "Preview"
  expect(page).to have_button "Launch Page"
  expect(page).to have_button "Update"
end

Given(/^I fill out the required data for the DocumentPage$/) do
  @hlp_selected_partner_edit_page.enter_document_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.attach_document_file
end

Given(/^I delete the DocumentPage hlp page$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I cancel the DocumentPage$/) do
  @hlp_selected_partner_edit_page.click_cancel_link
end

Given(/^I delete the original temp_hlp_document_page$/) do
  @hlp_selected_partner_page.select_original_document_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I duplicate the DocumentPage$/) do
  @hlp_selected_partner_edit_page.click_duplicate_page_link
end

Given(/^The DocumentPage name should have copy appended at the end$/) do
  expect(page).to have_field("document_page_name",:with => FigNewton.hlp_page_test_data.document_page.duplicate_page_name)
end

Given(/^I delete the DocumentPage Duplicate$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I preview the DocumentPage$/) do
  @new_preview_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_and_open_new_preview_page
  end
end

Given(/^I verify all the elements on the Preview DocumentPage hosted landing page$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.document_page.preview_page_url)
    expect(page.title).to eql("Sam's Club Military Special Document Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I launch the DocumentPage$/) do
  @hlp_selected_partner_edit_page.click_launch_page_link
end

Given(/^I live page the DocumentPage$/) do
  expect(page).to have_link "Live Page"

  @new_live_page_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_live_page_link
  end
end

Given(/^I verify all the elements on the Live DocumentPage hosted landing page$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.document_page.live_page_url)
    expect(page.title).to eql("Sam's Club Military Special Document Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify the DocumentPage offer button redirects the user to IDP-IVA$/) do
  within_window @new_live_page_window do
    @hlp_selected_partner_edit_page.click_idp_sign_in_button
    @hlp_selected_partner_edit_page.switch_to_idp_sign_in_window

    expect(page.current_url).to eq(FigNewton.idp.new_session_url)
  end
end
