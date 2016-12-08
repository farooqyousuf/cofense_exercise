class WalletNavigation < IDmeBase
  def initialize

  end

  def click_dashboard_link
    find(".shared-nav-sub-menu a",:text =>"Dashboard").click
  end

  def click_myids_link
    find(".shared-nav-sub-menu a",:text =>"IDs and Logins").click
  end

  def click_settings_link
    find(".shared-nav-sub-menu a",:text =>"Settings").click
  end

  def click_activity_link
    find(".shared-nav-sub-menu a",:text =>"Activity").click
  end
end
