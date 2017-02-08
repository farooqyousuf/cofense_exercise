class UserSearch

  def search_user
    case type
    when "email"
      fill_in("query", with: "capybara+471715@id.me")
      click_button("Search")
    end
  end
end
