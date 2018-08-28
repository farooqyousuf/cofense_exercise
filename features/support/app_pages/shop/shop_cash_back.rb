class ShopCashBackPage < IDmeBase

  include IDPBase

  def initialize
    super(FigNewton.shop.homepage)
  end

  def close_out_modal_if_present
    if page.has_css?("div.modal-body")
      click_link("✕ Not now, just browsing")
    end
  end
end
