class ShopAdminCategories < IDmeBase

  include IDPBase
  include JavascriptAlerts

  def initialize
    super(FigNewton.shop_admin.categories)
  end

  def create_new_valid_category
    click_button_for_new_category_page
    fill_in("category_label", :with => "Fitness & Diet")
    fill_in("category_description", :with => "Getting healthy everyday")
    click_button "Create"
  end

  def click_button_for_new_category_page
    click_link "Create New Category"
  end

  def filter_datatable_for_category
    find("input[type='search']").set("fitness-diet")
  end

  def delete_test_category
    filter_datatable_for_category
    find(:link, :text => "fitness-diet").click
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

end
