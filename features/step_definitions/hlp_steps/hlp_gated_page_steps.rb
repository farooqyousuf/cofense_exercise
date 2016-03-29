Given(/^I visit the Add GatedPage page$/) do
  @hlp_selected_partner_page.click_add_gated_page_link
end

Given(/^I create a new GatedPage$/) do
  @hlp_selected_partner_edit_page.enter_gated_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.enter_gated_page_redirect_url
  @hlp_selected_partner_edit_page.click_create_button
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

Given(/^The GatedPage name should have copy appended at the end$/) do
  expect(page).to have_field("gated_page_name",:with => FigNewton.hlp_page_test_data.gated_page.duplicate_page_name)
end

Given(/^I verify all the elements on the Preview GatedPage hosted landing page$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.gated_page.preview_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.gated_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify all the elements on the Live GatedPage hosted landing page$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.gated_page.live_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.gated_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end
