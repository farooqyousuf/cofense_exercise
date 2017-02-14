class UserQuickSearch

include Capybara::DSL
include DataMagic

  def search_user(populate: true, type: "none")

    if populate

      data = data_for(:mil_email)

      case type
      when "email"
        populate_field(search_box: data.fetch("dupe_email"))
      when "full_name"
        populate_field(search_box: data.fetch("dupe_fname") + " " + data.fetch("dupe_lname"))
      when "first_name"
        populate_field(search_box: data.fetch("dupe_fname"))
      end
    end
      click_button("Search")
  end


  def populate_field(search_box:)
    fill_in("query", :with => search_box)
  end
end
