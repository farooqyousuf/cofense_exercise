require_relative "../base_classes/page_mgmt"
require_relative "../base_classes/js_alerts"

class AdminUsers < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/users")
  end

  def open_newest
    first('.odd > td > a').click
  end

  def delete_user
    open_newest
  	click_link("Delete")
    sleep 1
  	js_accept
  end

  def delete_experian_user1
    search_for_user("sue gentz")
    sleep 2
    delete_user 
  end

  def delete_experian_user2
    search_for_user("erin rashid")
    sleep 2
    delete_user
  end

  def delete_experian_user3
    #CapybaraTester is the name for Mil Doc Family/Spouse, to search and delete from Admin Tool
    search_for_user("CapybaraTester")
    sleep 2
    delete_user
  end

  def delete_natl_emt
    search_for_user("paucar")
    sleep 2
    delete_user
  end

  def search_for_user(string)
    find("input[type='search']").set string
  end
  
end