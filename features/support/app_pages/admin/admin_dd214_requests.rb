require_relative "../base_classes/js_alerts"

class AdminDD214Requests < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/verification/dd214-requests")
  end

  def fax_doc
    #work in progress
  end

  def deny_dd214
    open_newest
    find("#verification_attempt_status_event_deny").click
    click_button("Update")
  end

  def open_newest
    first('.odd > td > a').click
  end

end
