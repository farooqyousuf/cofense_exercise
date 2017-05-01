class ShopAdminCategories < IDmeBase
  include IDPBase

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
end
