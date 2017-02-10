class UserSearch

include Capybara::DSL

    def search_user_email
      fill_in("query", with: "capybara+471715@id.me")
      click_button("Search")
    end
    
    def search_user_full_name
      fill_in("query", with: "capybara+471715@id.me")
      click_button("Search")
    end

    def search_user_first_name
      fill_in("query", with: "capybara+471715@id.me")
      click_button("Search")
    end
end
