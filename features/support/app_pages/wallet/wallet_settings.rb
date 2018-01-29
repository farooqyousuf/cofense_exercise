class WalletSettings < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.wallet.settings)
  end

  def switch_to_security_tab
    find("li[data-option='js-toggle-security']").click  
  end

  def deactivate_wallet_user_account
    click_deactivate_account_button
    select_reason_to_deactivate
    click_close_account_button
  end

  def click_deactivate_account_button
    find(".wallet-table-delete").click
  end

  def select_reason_to_deactivate
    select("No longer interested",:from =>"reason_id")
  end

  def click_close_account_button
    click_button("Close Account")
  end

  def switch_to_account_tab
    find("li[data-option='js-toggle-account']").click
  end

  def switch_to_privacy_tab
    find("li[data-option='js-toggle-privacy']").click
  end 

end
