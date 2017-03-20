class FavoritesPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.marketplace.favorites_page)
  end

  def navigate_from_side_menu_bar
    find("ul.user-menu__links li:nth-child(2)").click_link("Favorites")
  end

  def navigate_from_user_menu_nav
    click_on("Favorites")
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
    find(:xpath, ".//div[@class='layout-row']/div/ul/li[1]/div/figure/a").click
    # click_button "Save for Later"
  end

  def favorite_offer_header
    find(:xpath,".//section[1]/div/div[2]/h1").text
  end
end
