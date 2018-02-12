Given(/^I visit the Add Wufoo page$/) do
  @hlp_selected_partner_page.click_add_wufoo_page_link
end

Given(/^I create a new Wufoo Page$/) do
  @hlp_selected_partner_edit_page.enter_wufoo_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.click_create_button
end

Given(/^I delete the original Wufoo Page$/) do
  @hlp_selected_partner_page.select_original_wufoo_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I fill out the data for a Wufoo page$/) do
  @hlp_selected_partner_edit_page.enter_wufoo_page_name
  @hlp_selected_partner_edit_page.enter_body_contents
end

Given(/^The Wufoo Page name should have copy appended at the end$/) do
  expect(page).to have_field("wufoo_page[name]",:with => FigNewton.hlp_page_test_data.wufoo_code_page.duplicate_page_name)
end

Given(/^I verify all the elements on the WufooPage$/) do
  within_window @new_preview_window do
    sleep 1
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.wufoo_code_page.preview_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.wufoo_code_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify all the elements on the live Wufoo hlp page$/) do
  within_window @new_live_page_window do
    sleep 1
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.wufoo_code_page.live_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.wufoo_code_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end
