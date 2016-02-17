class SavedOffersPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.marketplace.saved_offers_page)
  end

  def navigate_from_side_menu_bar
    find(".user-menu").find(:link,:href => "/saved_offers").click
  end

  def navigate_from_user_menu_nav
    find(".user-nav").click
    first(:link,:href =>"/saved_offers").click
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
end
