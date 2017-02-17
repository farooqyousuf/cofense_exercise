class UserQuickSearch < IDmeBase

include Capybara::DSL
include DataMagic

  def initialize
    super(FigNewton.admin.user_quick_search)
  end

  def search_user(populate: true, type: "none")
    if populate
      data = data_for(:admin_government)
      case type
      when "email"
        populate_field(search_box: data.fetch("email"))
      when "full_name"
        populate_field(search_box: data.fetch("first_name") + " " + data.fetch("last_name"))
      when "first_name"
        populate_field(search_box: data.fetch("first_name"))
      end
    end
      click_button("Search")
  end

  def populate_field(search_box:)
    fill_in("query", :with => search_box)
  end

  def verify(type:)
    data = data_for(:admin_government)
    case type
    when "email"
      click_link(data.fetch("email"))
    when "full_name"
      click_link(data.fetch("first_name") + " " + data.fetch("last_name"))
    when "first_name"
      click_link(data.fetch("first_name"))
      # page.assert_text "Testname"
    end
    page.assert_text(data.fetch("first_name") + " " + data.fetch("last_name"))
  end
end
