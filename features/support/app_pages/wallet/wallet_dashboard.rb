class WalletDashboard < IDmeBase
  require "date"
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
    find("ul.shared-nav-tabs").click_link("About")
  end

  def click_on_business_shared_nav_tab
    find("ul.shared-nav-tabs").click_link("Business")
  end

  def click_on_shop_shared_nav_tab
    find("ul.shared-nav-tabs").click_link("Shop")
  end

  def click_on_wallet_shared_nav_tab_from_about_page
    find("nav.wallet-header-nav ").click_link("Wallet")
  end

  def click_wallet_subnav_dashboard_tab
    find("ul.shared-nav-sub-menu").click_link("Dashboard")
  end

  def click_wallet_subnav_ids_logins_tab
    find("ul.shared-nav-sub-menu").click_link("IDs and Logins")
  end

  def click_wallet_subnav_settings_tab
    find("ul.shared-nav-sub-menu").click_link("Settings")
  end

  def click_wallet_subnav_activity_tab
    find("ul.shared-nav-sub-menu").click_link("Activity")
  end

  def user_account_email
    find("ul.shared-nav-user-menu-details li:nth-child(2)").text
  end

  def account_membership_date
    find("ul.shared-nav-user-menu-details > li:nth-child(1)").text
  end

  def valid_date?(str, format="%m/%d/%Y")
    Date.strptime(str,format) rescue false
  end

  def click_view_profile
    click_link("View Full Profile")
  end
end
