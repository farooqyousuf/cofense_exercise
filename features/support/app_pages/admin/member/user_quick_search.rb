class UserQuickSearch < IDmeBase

include Capybara::DSL
include DataMagic

  def initialize
    super(FigNewton.admin.user_quick_search)
  end

  # def search_user(populate: true, type: "none")
  #   if populate
  #     data = data_for(:admin_test_user)
  #     case type
  #     when "email"
        # populate_field(search_box: data.fetch("email"))
  #     when "full_name"
  #       populate_field(search_box: data.fetch("first_name") + " " + data.fetch("last_name"))
  #     when "first_name"
  #       populate_field(search_box: data.fetch("first_name"))
  #     end
  #   end
  #     click_button("Search")
  # end

  def populate_field(search_box:)
    fill_in("query", :with => search_box)
  end

  def verify(populate: true, type: "none")
    if populate
      data = data_for(:admin_test_user)
      case type
      when "email"
        populate_field(search_box: data.fetch("email"))
        click_button("Search")
        click_link(data.fetch("email"))
      when "full_name"
        populate_field(search_box: data.fetch("first_name") + " " + data.fetch("last_name"))
        click_button("Search")
        click_link(data.fetch("first_name") + " " + data.fetch("last_name"))
      when "first_name"
        populate_field(search_box: data.fetch("first_name"))
        click_button("Search")
        click_link(data.fetch("first_name"))
      end
    end
    page.assert_text(data.fetch("first_name") + " " + data.fetch("last_name"))
  end
end
