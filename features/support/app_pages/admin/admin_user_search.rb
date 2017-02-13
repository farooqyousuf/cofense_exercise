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
        populate_field(search_box: data.fetch("dupe_fname" "dupe_lname"))
      when "first_name"
        populate_field(search_box: data.fetch("dupe_fname"))
      end
    end
      click_button("Search")
  end


  def populate_field(search_box:)
    fill_in("query", :with => search_box)
  end

    # def search_user_email
    #   fill_in("query", with: "capybara+471715@id.me")
    #   click_button("Search")
    # end
    #
    # def search_user_full_name
    #   fill_in("query", with: "Capybara DoNotDelete")
    #   click_button("Search")
    # end
    #
    # def search_user_first_name
    #   fill_in("query", with: "Capybara")
    #   click_button("Search")
    # end
end
