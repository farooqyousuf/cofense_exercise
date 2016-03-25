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

Given(/^I should see PromoCodePage edit page elements$/) do
  expect(page).to have_link "Duplicate Page"
  expect(page).to have_link "Delete Page"
  expect(page).to have_link "Preview"
  expect(page).to have_button "Launch Page"
  expect(page).to have_button "Update"
end

Given(/^I add new promo codes to the page$/) do
  @hlp_selected_partner_edit_page.attach_promo_code_file
  @hlp_selected_partner_edit_page.click_update_page_link
end

Given(/^I delete the PromoCodePage$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I delete the original promocode page$/) do
  @hlp_selected_partner_page.select_original_promocode_page
  @hlp_selected_partner_edit_page.delete_hlp_page
end

Given(/^I cancel the PromoCodePage$/) do
  @hlp_selected_partner_edit_page.click_cancel_link
end

Given(/^I fill out the data for the PromoCodePage$/) do
  @hlp_selected_partner_edit_page.enter_promocode_page_name
  @hlp_selected_partner_edit_page.enter_promo_header
  @hlp_selected_partner_edit_page.enter_promo_subheader
  @hlp_selected_partner_edit_page.enter_number_of_codes_allowed_per_user
  @hlp_selected_partner_edit_page.enter_body_contents
end

Given(/^I duplicate the PromoCodePage$/) do
  @hlp_selected_partner_edit_page.click_duplicate_page_link
end

Given(/^The PromoCodePage name should have copy appended at the end$/) do
  expect(page).to have_field("promo_code_page_name", :with => FigNewton.hlp_page_test_data.promo_code_page.duplicate_page_name)
end

Given(/^I delete the PromoCodePage copy$/) do
  @hlp_selected_partner_edit_page.delete_hlp_page
end


Given(/^I preview the PromoCodePage$/) do
  @new_preview_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_and_open_new_preview_page
    @hlp_selected_partner_edit_page.accept_js_alert
  end
end

Given(/^I verify all the elements on the preview PromoCodePage$/) do
  within_window @new_preview_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.promo_code_page.preview_page_url)
    expect(page.title).to eql("Sam's Club Military Special Promo Code Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I launch the PromoCodePage$/) do
  @hlp_selected_partner_edit_page.click_launch_page_link
end

Given(/^I live page the PromoCodePage$/) do
  expect(page).to have_link "Live Page"

  @new_live_page_window = window_opened_by do
    @hlp_selected_partner_edit_page.click_live_page_link
    @hlp_selected_partner_edit_page.accept_js_alert
  end
end

Given(/^I verify all the elements on the Live PromoCodePage$/) do
  within_window @new_live_page_window do
    expect(page.current_url).to eql(FigNewton.hlp_page_test_data.promo_code_page.live_page_url)
    expect(page.title).to eql("Sam's Club Military Special Promo Code Page - ID.me")
    expect(page).to have_text(FigNewton.hlp_page_test_data.body_copy)
  end
end

Given(/^I verify the PromoCode offer button redirects to IDP\-IVA$/) do
  within_window @new_live_page_window do
    @hlp_selected_partner_edit_page.click_idp_sign_in_button
    @hlp_selected_partner_edit_page.switch_to_idp_sign_in_window

    expect(page.current_url).to eql(FigNewton.idp.new_session_url)
  end
end
