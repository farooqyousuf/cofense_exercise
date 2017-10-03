class ShopAdminEmailGenerator < IDmeBase
  include IDPBase
  include JavascriptAlerts

  def initialize
    super(FigNewton.shop_admin.email_generator)
  end

  def click_create_new_email_template
    click_link "Create New Email Template"
  end

  def submit_valid_weekly_email_no_offers
    fill_in("email_template_title", :with => "test valid weekly email")
    select_header_resource_offer
    click_create
  end

  def select_header_resource_offer
    #header resource offer
    find("#select2-header-one-resource-select-container").click
    find(".select2-search__field").set("1027")

    sleep 1

    find(".select2-results").click
  end

  def click_create
    click_button "Create"
  end

  def click_delete
    click_link "Delete"
    sleep 1
    js_accept
  end
end


