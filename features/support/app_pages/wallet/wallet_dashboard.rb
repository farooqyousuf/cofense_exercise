class WalletDashboard < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.wallet.dashboard)
  end

  def open_shared_side_navigation
   find(".shared-nav-user-avatar").click
  end

  def close_shared_side_navigation
  	find(".icon-wallet-close").click
  end

  def click_shared_side_navigation_sign_out
    click_link "Sign Out"
  end

  def click_on_about_shared_nav_tab
    find("ul.shared-nav-tabs li:nth-child(1)").click
  end

  def click_on_business_shared_nav_tab
    find("ul.shared-nav-tabs li:nth-child(2)").click
  end

  def click_on_shop_shared_nav_tab
    find("ul.shared-nav-tabs li:nth-child(3)").click
  end

  def click_on_wallet_shared_nav_tab_from_about_page
    find("nav.wallet-header-nav li:nth-child(4)").click
  end
end
