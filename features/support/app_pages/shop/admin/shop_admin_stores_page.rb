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

  def fill_in_cash_back
    find("#store_cash_back").set("0")
  end

  def click_create_sidebar_button
    click_button "Create"
  end

  def search_for_store
    find("input[type='search']").set("Test Store Title")
  end

  def select_first_matching_store
    find("#DataTables_Table_0 tbody a",:match => :first).click
  end

  def update_store_page
    click_button "Update"
  end

  def remove_store_category
    click_link "Remove Category"
  end
end
