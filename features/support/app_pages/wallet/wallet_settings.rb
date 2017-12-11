class WalletSettings < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.wallet.settings)
  end

  def switch_to_security_tab
    find(".wallet-toggle-btns li:nth-child(3)").click
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
end
