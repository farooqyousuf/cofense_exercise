Given(/^I visit the Add UngatedPage page$/) do
  @hlp_selected_partner_page.click_add_ungated_page_link
end

Given(/^I create a new UngatedPage$/) do
  @hlp_selected_partner_edit_page.enter_ungated_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.enter_redirect_url
  @hlp_selected_partner_edit_page.click_create_button
end

Given(/^I should be on the HLP_Test_Partner_Pages page$/) do
    expect(page.current_url).to eql(FigNewton.hlp.homepage)
end

Given(/^I delete the original temp_hlp_ungated$/) do
  @hlp_selected_partner_page.select_original_ungated_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I fill out the data for the UngatedPage$/) do
  @hlp_selected_partner_edit_page.enter_ungated_page_name
  @hlp_selected_partner_edit_page.enter_redirect_url
  @hlp_selected_partner_edit_page.enter_body_contents
end

Given(/^I verify the deleted UngatedPage is deleted$/) do
  expect(@hlp_selected_partner_page.partner_page_already_exists("UngatedPage")).to be(false)
end

Given(/^The UngatedPage name should have copy appended at the end$/) do
  expect(page).to have_field("ungated_page[name]", :with => FigNewton.hlp_page_test_data.ungated_page.duplicate_page_name)
end

Given(/^I verify all the elements on the Preview UngatedPage hosted landing page$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.ungated_page.preview_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.ungated_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify all the elements on the Live UngatedPage hosted landing page$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.ungated_page.live_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.ungated_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end
