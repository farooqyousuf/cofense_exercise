class HlpEditPage < IDmeBase
  include IDPBase
  include JavascriptAlerts

def initialize
end

def delete_hlp_page
  click_link "Delete Page"
  js_accept
end

def enter_page_name
  fill_in("ungated_page[name]",:with => FigNewton.hlp_page_test_data.ungated_page.name)
end

def enter_redirect_url
  fill_in("ungated_page[redirect_url]", :with => FigNewton.hlp_page_test_data.ungated_page.page_redirect_url)
end

def enter_body_contents
  within_frame(find("#cke_1_contents").find(".cke_wysiwyg_frame")) do
    body = find("body")
    body.set(FigNewton.hlp_page_test_data.ungated_page.body_copy)
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

end
