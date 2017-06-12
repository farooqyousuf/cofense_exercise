require_relative "../base_classes/js_alerts"

class AdminEMTVerifs < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/verification/responders")
  end

  def approve_doc
    open_newest
    find("#decision_accept").click
    click_button("Update")
  end

  def open_newest
    first('.odd > td > a').click
  end

end
