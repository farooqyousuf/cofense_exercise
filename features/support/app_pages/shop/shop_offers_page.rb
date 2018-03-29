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

  def click_groups_teacher_sidebar_link
    find(".filter__links li:nth-child(5)").click
  end

  def click_offer_groups_filter_sidebar_link
    find(".filters .groups-filter").click
  end

  def click_group(group)
    click_link(group)
  end
end
