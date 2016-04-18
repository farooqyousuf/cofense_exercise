require_relative "../base_classes/page_mgmt"
require_relative "../base_classes/js_alerts"

class AdminUsers < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/users")
  end

  def open_newest(clear_results = false)
    if clear_results == true
      search_for_user(" ") #clears the previous results to default
    end
    first('.odd > td > a').click
  end

  def delete_dd214_user
    search_for_user("Benny Washington")
    sleep 1
    open_newest
    delete_user
  end

  def delete_dd214_user2
    search_for_user("Joel Smith")
    sleep 1
    open_newest
    delete_user
  end

  def delete_facebook_user
    search_for_user("Sadanberg")
    sleep 1
    open_newest
    delete_user
  end

  def delete_scra_user1
    search_for_user("John Jones")
    sleep 1
    open_newest
    delete_user
  end

  def delete_scra_user2
    search_for_user("Harry Dune")
    sleep 1
    open_newest
    delete_user
  end

  def delete_scra_user3
    search_for_user("Jack Doe")
    sleep 1
    open_newest
    delete_user
  end

  def delete_scra_user4
    search_for_user("Tiffany Killian")
    sleep 1
    open_newest
    delete_user
  end

  def delete_scra_user5
    search_for_user("Jane Doe")
    sleep 1
    open_newest
    delete_user
  end

  def delete_user
    click_link("Delete")
    sleep 1
    js_accept
  end

  def delete_experian_user1
    search_for_user("sue gentz")
    sleep 2
    open_newest
    delete_user
  end

  def delete_experian_user2
    search_for_user("erin rashid")
    sleep 2
    open_newest
    delete_user
  end

  def delete_experian_user3
    #CapybaraTester is the name for Mil Doc Family/Spouse, to search and delete from Admin Tool
    search_for_user("CapybaraTester")
    sleep 2
    open_newest
    delete_user
  end

  def delete_natl_emt
    search_for_user("paucar")
    sleep 2
    open_newest
    delete_user
  end

  def search_for_user(string)
    find("input[type='search']").set string
  end

end
