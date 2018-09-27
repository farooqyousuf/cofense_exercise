class WalletSettings < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.wallet.settings)
  end

  def change_pw
    click_edit_link
    # fill_in_pw_validation(FigNewton.oauth.general_password)
    fill_in_pw_validation("Changeme123")
    fill_in_pw("ChangeMe12345")
    fill_in_pw_confirm("ChangeMe12345")
    binding.pry
    click_update
  end

  def change_pw_with_incorrect_current_pw
    click_edit_link
    fill_in_pw_validation(FigNewton.oauth.weak_password)
    fill_in_pw(FigNewton.oauth.general_password)
    fill_in_pw_confirm(FigNewton.oauth.general_password)
    click_update
  end

  def click_edit_link
    click_link("Edit")
  end

  def fill_in_pw_validation(password)
    fill_in("user_password_validation", :with => FigNewton.oauth.weak_password)
  end

  def fill_in_pw(password)
    fill_in("user_password", :with => password)
  end

  def fill_in_pw_confirm(password)
    fill_in("user_password_confirmation", :with => password)
  end

  def click_update
    click_button("Update")
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

  def switch_to_profile_tab
    find("li[data-option='js-toggle-profile']").click
  end
end
