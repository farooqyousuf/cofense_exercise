class ShopStoreIndexPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop.stores_index_page)
  end
end
