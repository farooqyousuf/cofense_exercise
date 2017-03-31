class ShopOfferPromotedStoresPage < IDmeBase
  def initialize
    super(FigNewton.shop.promoted_stores)
  end
end
