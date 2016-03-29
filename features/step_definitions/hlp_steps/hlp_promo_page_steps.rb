Given(/^I visit the Add PromoCodePage$/) do
  @hlp_selected_partner_page.click_add_promocode_page_link
end

Given(/^I create a new PromoCodePage$/) do
  @hlp_selected_partner_edit_page.enter_promocode_page_name
  @hlp_selected_partner_edit_page.enter_promo_header
  @hlp_selected_partner_edit_page.enter_promo_subheader
  @hlp_selected_partner_edit_page.enter_number_of_codes_allowed_per_user
  @hlp_selected_partner_edit_page.enter_body_contents
  @hlp_selected_partner_edit_page.click_create_button
end

Given(/^I add new promo codes to the page$/) do
  @hlp_selected_partner_edit_page.attach_promo_code_file
  @hlp_selected_partner_edit_page.click_update_page_link
end

Given(/^I delete the original promocode page$/) do
  @hlp_selected_partner_page.select_original_promocode_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I fill out the data for the PromoCodePage$/) do
  @hlp_selected_partner_edit_page.enter_promocode_page_name
  @hlp_selected_partner_edit_page.enter_promo_header
  @hlp_selected_partner_edit_page.enter_promo_subheader
  @hlp_selected_partner_edit_page.enter_number_of_codes_allowed_per_user
  @hlp_selected_partner_edit_page.enter_body_contents
end

Given(/^The PromoCodePage name should have copy appended at the end$/) do
  expect(page).to have_field("promo_code_page_name", :with => FigNewton.hlp_page_test_data.promo_code_page.duplicate_page_name)
end

Given(/^I verify all the elements on the preview PromoCodePage$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.promo_code_page.preview_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.promo_code_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I click to see the live hlp PromoCodePage$/) do
  expect(page).to have_link "Live Page"

  @new_live_page_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_live_page_link
    @hlp_selected_partner_edit_page.accept_js_alert
  end
end

Given(/^I verify all the elements on the Live PromoCodePage$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.promo_code_page.live_page_url)
    expect(page.title).to eql(FigNewton.hlp_page_test_data.promo_code_page.live_page_title)
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end
