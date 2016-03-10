class HlpEditPage < IDmeBase
    include IDPBase
    include JavascriptAlerts

  def initialize
  end

  def delete_hlp_page
    click_link "Delete Page"
    js_accept
  end

  def enter_page_name #only for ungated
    fill_in("ungated_page[name]",:with => FigNewton.hlp_page_test_data.ungated_page.name)
  end

  def enter_document_page_name
    fill_in("document_page[name]", :with => FigNewton.hlp_page_test_data.document_page.name)
  end

  def enter_redirect_url #only for ungated
    fill_in("ungated_page[redirect_url]", :with => FigNewton.idp.new_session_url)
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

  def click_live_page_link
    click_link "Live Page"
  end

  def click_idp_sign_in_button
    click_link "Verify with ID.me Troop ID"
  end

  def switch_to_idp_sign_in_window
    idp_signin = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(idp_signin)
  end
end
