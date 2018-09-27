Given("I click on the Security tab") do
  @WalletSettings.switch_to_security_tab
end

Given("I attempt to change the password using an incorrect current password") do
  @WalletSettings.change_pw_with_incorrect_current_pw
end

