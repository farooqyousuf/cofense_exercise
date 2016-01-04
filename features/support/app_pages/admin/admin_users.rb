require_relative "../base_classes/page_mgmt"
require_relative "../base_classes/js_alerts"

class AdminUsers < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("https://admin-staging.idmeinc.net/users")
  end

  def open_newest
    first('.odd > td > a').click
  end

  def delete_user
    open_newest
  	click_link("Delete")
  	js_accept
  end

end