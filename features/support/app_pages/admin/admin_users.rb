require_relative "../base_classes/page_mgmt"
require_relative "../base_classes/js_alerts"

class AdminUsers < IDmeBase
include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/users")
  end

  def delete_mil_doc_multi_family_users
    delete_experian_user1
    4.times do delete_experian_user3 end
  end

  def delete_scra_multi_family_users
    delete_scra_user1
    2.times do delete_scra_user3 end
    4.times do delete_scra_family_member end
  end

  def open_newest(clear_results = false)
    if clear_results == true
      search_for_user(" ") #clears the previous results to default
    end
    first('.odd > td > a').click
  end

  def delete_user
    click_link("Delete")
    sleep 1
    js_accept
  end

  def open_user_and_delete(user)
    search_for_user(user)
    sleep 2
    open_newest
    delete_user
  end

  def search_for_user(string)
    find("input[type='search']").set string
    find("input[type='search']").native.send_keys(:return)
  end

  def delete_scra_family_member
    open_user_and_delete("Mike Doe")
  end

  def delete_pb_fireman_user
    open_user_and_delete("Anika Smith")
  end

  def delete_dd214_user
    open_user_and_delete("Benny Washington")
  end

  def delete_dd214_user2
    open_user_and_delete("Joel Smith")
  end

  def delete_paypal_user
    open_user_and_delete("test@id.me")
  end

  def delete_facebook_user
    open_user_and_delete("Sadanberg")
  end

  def delete_google_user
    open_user_and_delete("Capybara Tester")
  end

  def delete_linkedin_user
    open_user_and_delete("bruce.wayne_test@yahoo.com")
  end

  def delete_scra_denied_user
    open_user_and_delete("Johnn Joness")
  end

  def delete_scra_user1
    open_user_and_delete("John Jones")
  end

  def delete_scra_user2
    open_user_and_delete("Harry Dune")
  end

  def delete_scra_user3
    open_user_and_delete("Erin Doe")
  end

  def delete_scra_user4
    open_user_and_delete("Tiffany Killian")
  end

  def delete_scra_user5
    open_user_and_delete("Jane Doe")
  end

  def delete_experian_user1
    open_user_and_delete("sue gentz")
  end

  def delete_experian_user2
    open_user_and_delete("erin rashid")
  end

  def delete_experian_user3
    #CapybaraTester is the name for Mil Doc Family/Spouse, to search and delete from Admin Tool
    open_user_and_delete("CapybaraTester")
  end

  def delete_natl_emt
    open_user_and_delete("paucar")
  end

  def delete_shop_test_user
    open_user_and_delete(@user_identifier)
  end

  def delete_current_username
    open_user_and_delete(@username)
  end

  def record_test_user_email
    @user_identifier = find(".user-menu__header").text
  end

end
