require_relative "../base_classes/js_alerts"

class SupportToolDocs < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.support_tool.base_url}/verification/attempts?waiting_or_fax_pending=true")
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

  def verify_doc_upload(username)
    open_newest
    page.assert_text username
    find("div.col-md-6.sidebar > a:nth-child(2)").text.should === "Download .png"
  end

  def verify_unique_doc_upload(username, document: "none")
    open_newest
    page.assert_text username
    find("div.col-md-6.sidebar > a:nth-child(2)").text.should === "Download .#{document}"
  end
end
