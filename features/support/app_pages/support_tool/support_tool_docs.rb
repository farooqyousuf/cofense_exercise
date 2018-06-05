require_relative "../base_classes/js_alerts"

class SupportToolDocs < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super(FigNewton.support_tool.waiting_attempts)
  end

  def approve_doc
    open_newest
    find("#verification_attempt_decision_accept").click
    click_button("Update")
  end

  def deny_doc
    open_newest
    find("#verification_attempt_decision_deny").click
    select('Other', :from => 'verification_attempt_reason_id')
    click_button("Update")
  end

  def open_newest
    sleep 1
    first(".odd > td > a").click
  end

  def search_user_by_email(email_address:)
    find("input[type='text']").set email_address
    find("input[type='text']").native.send_keys(:return)
  end

  def view_searched_user_verification_attempt
    open_newest
    click_link("Verification attempts")
    sleep 1
    use_last_browser_created
    open_newest
  end

  def verify_doc_upload(username)
    open_newest
    page.assert_text username
    find(".document-tabs").text.should === "test_png.png"
  end

  def verify_unique_doc_upload(username, document: "none")
    open_newest
    page.assert_text username
    expected_uploaded_doc = case document
                            when "test_large_file_under_16MB" then "test_large_file_u..."
                            else "test_#{document}.#{document}"
                            end

    find(".document-tabs").text.should === expected_uploaded_doc
  end

  def verify_doc_is_not_uploaded(username)
    search_user_by_email(email_address: username)
    view_searched_user_verification_attempt

    page.assert_text username
    doc_upload = "test_"
    page.has_css?(".document-tabs").should == false
    page.has_text?(doc_upload).should == false
  end
end
