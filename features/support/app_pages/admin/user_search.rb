class UserSearch

include Capybara::DSL

    def search_email_user
      fill_in("query", with: "capybara+471715@id.me")
      click_button("Search")
    end
end
