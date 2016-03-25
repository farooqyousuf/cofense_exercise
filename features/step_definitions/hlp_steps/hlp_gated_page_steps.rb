Given(/^I visit the Add GatedPage page$/) do
  @hlp_selected_partner_page.click_add_gated_page_link
end

Given(/^I create a new GatedPage$/) do
  @hlp_selected_partner_edit_page.enter_gated_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.enter_gated_page_redirect_url
  @hlp_selected_partner_edit_page.click_create_button
end

Given(/^I should see GatedPage edit page elements$/) do
  expect(page).to have_link "Duplicate Page"
  expect(page).to have_link "Delete Page"
  expect(page).to have_link "Preview"
  expect(page).to have_button "Launch Page"
  expect(page).to have_button "Update"
end

Given(/^I delete the GatedPage hlp page$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I cancel the GatedPage$/) do
  @hlp_selected_partner_edit_page.click_cancel_link
end

Given(/^I delete the original temp_hlp_gated$/) do
  @hlp_selected_partner_page.select_original_gated_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I fill out the data for the GatedPage$/) do
  @hlp_selected_partner_edit_page.enter_gated_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.enter_gated_page_redirect_url
end

Given(/^I verify the deleted GatedPage is deleted$/) do
  expect(@hlp_selected_partner_page.partner_page_already_exists("GatedPage")).to be(false)
end

Given(/^I duplicate the GatedPage$/) do
  @hlp_selected_partner_edit_page.click_duplicate_page_link
end

Given(/^The GatedPage name should have copy appended at the end$/) do
  expect(page).to have_field("gated_page_name",:with => FigNewton.hlp_page_test_data.gated_page.duplicate_page_name)
end

Given(/^I delete the GatedPage copy$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I preview the GatedPage$/) do
  @new_preview_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_and_open_new_preview_page
  end
end

Given(/^I verify all the elements on the Preview GatedPage hosted landing page$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.gated_page.preview_page_url)
    expect(page.title).to eql("Sam's Club Military Special Gated Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I launch the GatedPage$/) do
  @hlp_selected_partner_edit_page.click_launch_page_link
end

Given(/^I live page the GatedPage$/) do
  expect(page).to have_link "Live Page"

  @new_live_page_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_live_page_link
  end
end

Given(/^I verify all the elements on the Live GatedPage hosted landing page$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.gated_page.live_page_url)
    expect(page.title).to eql("Sam's Club Military Special Gated Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify the GatedPage offer button redirects the user to IDP\-IVA$/) do
  within_window @new_live_page_window do
    @hlp_selected_partner_edit_page.click_idp_sign_in_button
    @hlp_selected_partner_edit_page.switch_to_idp_sign_in_window

    expect(page.current_url).to eql(FigNewton.idp.new_session_url)
  end
end
