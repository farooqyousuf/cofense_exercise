class WalletHomepage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.wallet.homepage.url)
  end

  def click_wallet_sign_in
    find_link("Sign In").click
  end

  def click_wallet_sign_up
    find_link("Sign Up").click
  end

  def sign_in(user_email)
    fill_in_email_by_id(user_email)
    fill_in_password(FigNewton.shop_users.general_password)
    click_sign_in
  end

  def incorrect_sign_in
    fill_in_email_by_id(FigNewton.shop_users.military)
    fill_in_password(FigNewton.shop_users.incorrect_password)
    click_sign_in
  end

  def click_shared_navlink_forbusiness
    find(".js_dropdown1").click
  end

  def click_shared_navlink_forindividuals
    find(".js_dropdown2").click
  end

  def click_my_account_button
    find(".m_account").click
  end

  def click_mobile_my_account_button
    click_link("menu")
    all("li")[2].click
  end
end
