class MarketplaceUserSettingsPage < IDmeBase

  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.user_settings_homepage)
  end

  def fill_in_name
    fill_in("core_user_fname",:with => FigNewton.marketplace.user_fname)
    fill_in("core_user_lname",:with => FigNewton.marketplace.user_lname)
    click_button "Save Changes"
  end

  def profile_menu_name
    first(:link, :href =>"/cash-back").text
  end

  def subscribe_to_email
    find("div.checkbox").click
    click_on "Save Changes"
  end

  def user_subscribed
    find("div.checkbox").all("input",:visible => false)[1].checked?
  end
end
