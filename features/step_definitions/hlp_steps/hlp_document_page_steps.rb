Given(/^I visit the Add DocumentPage page$/) do
  @hlp_selected_partner_page.click_add_document_page_link
end

Given(/^I create a new DocumentPage$/) do
  @hlp_selected_partner_edit_page.enter_document_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.attach_document_file
  @hlp_selected_partner_edit_page.click_create_button
end

Given(/^I fill out the required data for the DocumentPage$/) do
  @hlp_selected_partner_edit_page.enter_document_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.attach_document_file
end

Given(/^I delete the original temp_hlp_document_page$/) do
  @hlp_selected_partner_page.select_original_document_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end


Given(/^The DocumentPage name should have copy appended at the end$/) do
  expect(page).to have_field("document_page_name",:with => FigNewton.hlp_page_test_data.document_page.duplicate_page_name)
end

Given(/^I verify all the elements on the Preview DocumentPage hosted landing page$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.document_page.preview_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.document_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify all the elements on the Live DocumentPage hosted landing page$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.document_page.live_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.document_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end
