class FavoritesPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.marketplace.favorites_page)
  end

  def navigate_from_side_menu_bar
    click_on("Favorites")
  end

  def navigate_from_user_menu_nav
    find(".user-nav").click
    first(:link,:href =>"/favorites").click
    sleep 1
  end

  def click_save_offer_icon
    first(".offer-card").find(".fa-heart").click
  end

  def add_saved_offer
    click_link "Shop"
    sleep 1
    find(:link,:href =>"offers").native.send_keys(:enter)
    sleep 1
    first(".offer-card").find(".fa-heart").click
  end

  def add_favorite_store
    find(".stores-list").first(".table__row").first(".table__cell").find("a").click
    click_button "Add to Favorites"
  end
end
