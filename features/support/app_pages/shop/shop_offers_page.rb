class ShopOffersPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop.offers_index_page)
  end

  def click_promocodes_sidebar_link
    find(:link ,:text =>"Promo Codes").click
  end

  def click_categories_filter
    page.execute_script("$('.filters .categories-filter').attr('class', 'collapsable categories-filter -active')")
  end

  def click_groups_military_sidebar_link
    find(".filter__links li:nth-child(1)").click
  end

  def click_groups_first_responder_sidebar_link
    find(".filter__links li:nth-child(2)").click
  end

  def click_groups_student_sidebar_link
    find(".filter__links li:nth-child(3)").click
  end

  def click_groups_government_sidebar_link
    find(".filter__links li:nth-child(4)").click
  end

  def click_groups_teacher_sidebar_link
    find(".filter__links li:nth-child(5)").click
  end

  def click_offer_groups_filter_sidebar_link
    # find(".filters .groups-filter").click
    page.execute_script("$('.filters .groups-filter').attr('class', 'collapsable groups-filter -active')")

  end

  def find_unlock_to_save
    find(".offers-list-static li .button", :match => :first, :text => "Unlock to Save")
  end
end
