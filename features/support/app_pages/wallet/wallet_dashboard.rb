class WalletDashboard < IDmeBase
  require "date"
  # include IDPBase

  def initialize
    super(FigNewton.wallet.dashboard)
  end

  def open_shared_side_navigation
   find(".shared-nav-user-avatar").click
  end

  def close_shared_side_navigation
    sleep 1
  	find(".icon-wallet-close").click
  end

  def click_shared_side_navigation_sign_out
    sleep 3
    click_on("Sign Out")
  end

  def click_shared_nav_tab(tab)
    find("ul.shared-nav-tabs").click_link(tab)
  end

  def click_wallet_subnav(link)
    find("ul.shared-nav-sub-menu").click_link(link)
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

  def find_page_header
    find("h1.heading")
  end

  def find_ids_and_logins_subheader
    find("h2:nth-child(3)")
  end

  def find_activity_feed_subheader
    find("h2:nth-child(5)")
  end

  def find_my_ids_section
    find("div.wallet-toggle-option h4:nth-child(2)")
  end

  def click_logins_toggle_button
    find("div.wallet-dashboard-module ul.wallet-toggle-btns li:nth-child(2)").click
  end

  def click_ids_and_logins_view_all
    find("h2:nth-child(3) a").click
  end

  def click_activity_feed_view_all
    find("h2:nth-child(5) a").click
  end

  def click_add_id_button
    click_link("+ Add ID")
  end

  def find_add_id_modal
    find("div.modal-content")
  end

  def close_id_modal
    find("div.modal-content button.close").click
  end

  def teacher_flow_view
    teacher_view = window_opened_by do
      find("div.wallet-toggle-option ul:nth-child(5) li:nth-child(1) a").click
    end
    switch_to_window(teacher_view)
  end

  def responder_flow_view
    responder_view = window_opened_by do
      find("div.wallet-toggle-option ul.wallet-list-id li:nth-child(2) a").click
    end
    switch_to_window(responder_view)
  end

  def government_flow_view
    government_view = window_opened_by do
      find("div.wallet-toggle-option ul.wallet-list-id li:nth-child(3) a").click
    end
    switch_to_window(government_view)
  end

  def student_flow_view
    student_view = window_opened_by do
      find("div.wallet-toggle-option ul.wallet-list-id li:nth-child(4) a").click
    end
    switch_to_window(student_view)
  end

  def browser_cleanup
    close_current_browser
    use_last_browser_created
  end

  def find_flow_header
    find("div.heading-affinity")
  end
end
