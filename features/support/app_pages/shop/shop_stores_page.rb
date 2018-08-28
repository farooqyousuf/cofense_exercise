class ShopStoresPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop.stores_page)
  end

  def click_stores_link
    click_on("STORES")
  end

  def click_category(category)
    all("span", :text => "#{category}")[0].click
  end
end
