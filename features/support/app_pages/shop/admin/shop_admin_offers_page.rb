class ShopAdminOffers < IDmeBase
  include IDPBase
  include JavascriptAlerts

  attr_reader :offer

  def initialize
    super(FigNewton.shop_admin.offers.url)
  end

  def filter_for_active_offers
    select("All Active Offers", :from =>"offer")
  end

  def filter_for_inactive_offers
    select("All Inactive Offers", :from =>"offer")
  end

  def click_button_for_new_offer_page
    click_link "Create New Offers"
  end

  def fill_in_title_field
    @offer = "Test Offer #{rand(6 ** 8)}"
    fill_in("offer_title", :with => @offer)
    puts "#{@offer}"
  end

  def fill_in_affiliate_url_field
    fill_in("offer_affiliate_url", :with => FigNewton.shop_admin.offers.offer_affiliate_url)
  end

  def select_store
    find("#select2-offer_merchant_id-container").click
    all("input[type='search']")[1].set(FigNewton.shop_admin.stores.test_store)
    sleep 1
    find("#select2-offer_merchant_id-results").all("li", :text => FigNewton.shop_admin.stores.test_store)[0].click
  end

  def click_create_sidebar_button
    click_button "Create"
  end

  def filter_datatable_for_offer
    find("input[type='search']").set(@offer)
  end

  def click_on_offer
    first("#DataTables_Table_0 tbody a").click
  end

  def select_category_result_return
    sleep 1
    find(".select2-results").click
    sleep 1
  end

  def update_offer_page
    click_button "Update"
  end

  def search_for_offer_category(category)
    find(".select2-search__field").set(category)
  end
end
