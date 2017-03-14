class HlpEditPage < IDmeBase
  include IDPBase
  include JavascriptAlerts

  def initialize
  end

  def delete_hlp_page
    click_link "Delete Page"
    js_accept
  end

  def enter_ungated_page_name
    fill_in("ungated_page[name]", :with => FigNewton.hlp_page_test_data.ungated_page.name)
  end

  def enter_gated_page_name
    fill_in("gated_page[name]", :with => FigNewton.hlp_page_test_data.gated_page.name)
  end

  def enter_document_page_name
    fill_in("document_page[name]", :with => FigNewton.hlp_page_test_data.document_page.name)
  end

  def enter_redirect_url #only for ungated
    fill_in("ungated_page[redirect_url]", :with => FigNewton.idp.new_session_url)
  end

  def enter_gated_page_redirect_url #only for ungated
    fill_in("gated_page[redirect_url]", :with => FigNewton.idp.new_session_url)
  end

  def enter_body_contents
    within_frame(find("#cke_1_contents").find(".cke_wysiwyg_frame")) do
      body = find("body")
      body.set(FigNewton.hlp_page_test_data.body_copy)
    end
  end

  def click_create_button
    click_button "Create"
  end

  def click_cancel_link
    click_link "Cancel"
  end

  def click_duplicate_page_link
    click_link "Duplicate Page"
  end

  def click_and_open_new_preview_page
    click_link "Preview"
  end

  def attach_document_file
    page.driver.browser.all(:xpath, '//input[@type="file"]')[2].send_keys("#{Dir.pwd}/features/support/test_doc_copy.docx")
  end

  def click_launch_page_link
    click_button "Launch Page"
  end

  def click_update_page_link
    click_button "Update"
  end

  def click_live_page_link
    click_link "Live Page"
  end

  def click_idp_sign_in_button
    click_link "Verify with Troop ID"
  end

  def switch_to_idp_sign_in_window
    idp_signin = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(idp_signin)
  end

  def enter_promocode_page_name
    fill_in("promo_code_page[name]", :with => FigNewton.hlp_page_test_data.promo_code_page.name)
  end

  def enter_promo_header
    fill_in("promo_code_page[title]", :with => FigNewton.hlp_page_test_data.promo_code_page.header)
  end

  def enter_promo_subheader
    fill_in("promo_code_page[subtitle]", :with => FigNewton.hlp_page_test_data.promo_code_page.subheader)
  end

  def enter_number_of_codes_allowed_per_user
    fill_in("promo_code_page[promo_code_info_attributes][codes_per_user]", :with => FigNewton.hlp_page_test_data.promo_code_page.number_of_codes_per_user)
  end

  def attach_promo_code_file
    page.driver.browser.all(:xpath, '//input[@type="file"]')[2].send_keys("#{Dir.pwd}/features/support/promo_code.csv")
  end

  def accept_js_alert
    js_accept
  end

  def enter_wufoo_page_name
    fill_in("wufoo_page[name]", :with => "Sam's Club Military Special Wufoo Page")
  end
end
