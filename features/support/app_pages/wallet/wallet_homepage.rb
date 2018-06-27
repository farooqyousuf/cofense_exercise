class WalletHomepage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.wallet.homepage.url)
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

  def click_shared_nav_sign_in_button
    find(".shared-nav-login a",:text =>"Sign In").click
  end

  def click_shared_nav_sign_up_button
    find(".shared-nav-login a",:text =>"Sign Up").click
  end

  def click_my_account_button
    find(".m_account").click
  end

  def click_hero_sign_up_button
    find(".wallet-home-hero-cta a",:text =>"Sign Up For Free").click
  end

  def click_portable_sign_up_button
    find(".wallet-home-portable-content a",:text =>"Get Started Now").click
  end

  def click_home_cta_sign_up_button
    find(".wallet-home-cta a",:text =>"Get Started Now").click
  end
end
