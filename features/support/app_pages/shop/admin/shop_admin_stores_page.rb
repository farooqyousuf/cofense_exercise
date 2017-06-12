class ShopAdminStores < IDmeBase
  include IDPBase
  include JavascriptAlerts

  def initialize
    super(FigNewton.shop_admin.stores.base_url)
    @store_title = "Test Store Title #{rand(1..1000)}"
  end

  def click_button_for_new_store_page
    click_link "Create New Store"
  end

  def fill_in_title_field
    find("#store_name").set(@store_title)
  end

  def click_create_sidebar_button
    click_button "Create"
  end
end
