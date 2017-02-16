class UserQuickSearch < IDmeBase

include Capybara::DSL
include DataMagic

  def initialize
    super(FigNewton.admin.user_quick_search)
  end

  def search_user(populate: true, type: "none")
    if populate
      data = data_for(:mil_email)
      case type
      when "email"
        populate_field(search_box: data.fetch("dupe_email"))
      when "full_name"
        populate_field(search_box: data.fetch("dupe_fname") + " " + data.fetch("dupe_lname"))
      when "first_name"
        populate_field(search_box: "Testname")
      end
    end
      click_button("Search")
  end

  def populate_field(search_box:)
    fill_in("query", :with => search_box)
  end

  def verify(type:)
    case type
    when "email" || "full_name"
      click_link("Capybara DoNotDelete")
      page.assert_text "Capybara DoNotDelete"
    when "first_name"
      click_link("Testname")
      page.assert_text "Testname"
    end
  end
end
