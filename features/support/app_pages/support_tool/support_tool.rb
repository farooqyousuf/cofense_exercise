require_relative '../base_classes/base_idme.rb'

class SupportTool < IDmeBase
include PageManagement

  def initialize
    super(FigNewton.support_tool.base_url)
  end

  def login
    self.visit
    sleep 2
    authority = Authority.new
    sleep 2
    authority.auth_login
  end

  def login_in_new_window
    self.create_new_window
    self.use_last_browser_created
    login
  end

  def logout_in_new_window
    click_link("Log out")
    self.close_current_browser
    self.use_last_browser_created
  end

  def verify_search(type: "none", user_email: "none")
            data = data_for(:admin_test_user)
    special_data = data_for(:search_apostrophe_test_user)

    if type == "email" || type == "partial_email" || type == "new_user"
      click_link("Email")
    else
      click_link("Name")
    end

    case type
    when "first_name", "last_name"
      populate_name(data: data, name: type)
    when "full_name"
      populate_full_name(data: data)
    when "partial_name"
      populate_partial_name(data: data)
    when "uppercase_characters"
      populate_to_uppercase(data: data)
    when "apostrophe"
      populate_name(data: special_data, name: "last_name")
    when "email"
      populate_email(data: data, email: "email")
    when "partial_email"
      populate_partial_email(data: data, email: "email")
    when "new_user"
      populate_new_user_email(user_email)
    end

    sleep 1
    click_button("Search")
    wait_for_search_results

    if type == "apostrophe"
      assert_full_name(data: special_data)
    elsif type == "new_user"
      assert_email(user_email)
    else
      assert_full_name(data: data)
    end
  end

  def populate_name(data:, name:)
    fill_in("name", :with => data.fetch(name))
  end

  def populate_full_name(data:, first_name: "first_name", last_name: "last_name")
    fill_in("name", :with => data.fetch(first_name) + " " + data.fetch(last_name))
  end

  def populate_partial_name(data:, first_name: "first_name")
    fill_in("name", :with => data.fetch(first_name).split("f").first)
  end

  def populate_to_uppercase(data:, first_name: "first_name", last_name: "last_name")
    fill_in("name", :with => (data.fetch(first_name) + " " + data.fetch(last_name)).upcase)
  end

  def populate_email(data:, email:)
    fill_in("email", :with => data.fetch(email))
  end

  def populate_partial_email(data:, email:)
    fill_in("email", :with => data.fetch(email).split("_").first)
  end

  def populate_new_user_email(email)
    fill_in("email", :with => email)
  end

  def assert_full_name(data:, first_name: "first_name", last_name: "last_name")
    page.assert_text(data.fetch(first_name) + " " + data.fetch(last_name))
  end

  def assert_email(email)
    page.assert_selector(".odd > td > a", :text => email)
  end

  def wait_for_search_results
    page.has_text? ("Search Results for")
  end
end
