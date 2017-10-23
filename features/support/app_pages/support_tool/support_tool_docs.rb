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

  def open_newest
    sleep 1
    first(".odd > td > a").click
  end
end
