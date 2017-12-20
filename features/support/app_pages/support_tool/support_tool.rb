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

  def verify_search(type: "none")
            data = data_for(:admin_test_user)
    special_data = data_for(:search_apostrophe_test_user)

       # full_name = data.fetch("first_name") + " " + data.fetch("last_name")
    # partial_name = data.fetch("first_name").split("f")
      # apostrophe = data.fetch("last_name")

    click_link("Name")

    case type
    when "first_name", "last_name"
      populate_name(data: data, name: type)
    when "full_name"
      populate_full_name(data: data)
    when "partial_name"
      populate_partial_name(data: data)
    when "uppercase_characters"
      populate__to_uppercase(data: data)
    when "apostrophe"
      populate_name(data: special_data, name: "last_name")
    end

    sleep 1
    click_button("Search")

    if type == "apostrophe"
      assert_full_name(data: special_data)
    else
      assert_full_name(data: data)
    end
    # page.assert_text(full_name)
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

  def populate__to_uppercase(data:, first_name: "first_name", last_name: "last_name")
    fill_in("name", :with => (data.fetch(first_name) + " " + data.fetch(last_name)).upcase)
  end

  def assert_full_name(data:, first_name: "first_name", last_name: "last_name")
    page.assert_text(data.fetch(first_name) + " " + data.fetch(last_name))
  end
end
