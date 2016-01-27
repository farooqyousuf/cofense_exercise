require_relative "../base_classes/js_alerts"

class AdminDocs < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/verification/documents")
  end

  def approve_doc
    open_newest
    find("#verification_attempt_status_event_accept").click
    click_button("Update")
  end

  def open_newest
    first('.odd > td > a').click
  end

end