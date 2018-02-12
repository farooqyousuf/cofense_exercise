class ShopAdminOffers < IDmeBase
  include IDPBase
  include JavascriptAlerts

  def initialize
    super(FigNewton.shop_admin.offers)
  end

  def filter_for_active_offers
    select("All Active Offers",:from =>"offer")
  end

  def filter_for_inactive_offers
    select("ll Inactive Offers",:from =>"offer")
  end

  def click_button_for_new_offer_page
    click_link "Create New Offers"
  end

  def fill_in_title_field
    fill_in("offer_title", :with => "merchant sample offer")
  end

  def fill_in_affiliate_url_field
    fill_in("offer_affiliate_url", :with => "https://www.avantlink.com/123123")
  end

  def select_store
    find("#select2-offer_merchant_id-container").click
    all("input[type='search']")[1].set("test")
    sleep 1
    find("#select2-offer_merchant_id-results").all("li", :text => "Test")[0].click
  end

  def click_create_sidebar_button
    click_button "Create"
  end

  def filter_datatable_for_offer
    find("input[type='search']").set("merchant sample offer")
  end

  def click_on_offer
    first("#DataTables_Table_0 tbody a").click
  end

  def delete_offer
    click_link "Delete"
    js_accept
  end

  def select_category_result_return
    sleep 1
    find(".select2-results").click
    sleep 1
  end

  def update_offer_page
    click_button "Update"
  end

  def search_for_offer_category
    find(".select2-search__field").set("fitness-diet")
  end
end
