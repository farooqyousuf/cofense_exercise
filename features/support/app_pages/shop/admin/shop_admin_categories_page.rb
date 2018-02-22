class ShopAdminCategories < IDmeBase

  include IDPBase
  include JavascriptAlerts

  attr_reader :category_label, :category

  def initialize
    super(FigNewton.shop_admin.categories)
    @category = "Test Categories #{rand(6 ** 8)}"
    @category_label = @category.gsub(" ", "-").downcase
  end

  def create_new_valid_category
    click_button_for_new_category_page
    fill_in("category_label", :with => @category)
    fill_in("category_description", :with => "Getting healthy everyday")
    click_button "Create"
    puts "#{@category}"
  end

  def click_button_for_new_category_page
    click_link "Create New Category"
  end

  def filter_datatable_for_category
    find("input[type='search']").set(@category_label)
  end

  def verify_created_category
    filter_datatable_for_category
    page.assert_text @category_label
  end

  def delete_test_category
    click_link "Delete"
    js_accept
  end

  def click_on_new_category
    find("#DataTables_Table_0 tbody td:first-child").click
  end

  def update_new_category
    fill_in("category_description", :with => "Getting super swole")
    click_button "Update"
  end

  def click_cancel_button
    click_link "Cancel"
  end

  def submit_invalid_category
    click_button_for_new_category_page
    fill_in("category_label", :with =>"")
    click_button "Create"
  end

  def submit_duplicate_category
    create_new_valid_category
  end

  def search_for_store_category
    find("div[data-component='Shared.Select2Category'] .select2-search__field").set(@category_label)
  end

  def select_category_result_return
    sleep 1
    find(".select2-results").click
    sleep 1
  end

  def login
    self.visit
    authority = Authority.new
    authority.auth_login
  end

  def login_in_new_window
    self.create_new_window
    self.use_last_browser_created
    login
  end

  def logout_in_new_window
    click_link("Logout")
    self.close_current_browser
    self.use_last_browser_created
  end
end
