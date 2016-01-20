class StoreInvitePage < IDmeBase
  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.invite_store)
  end

  def navigate_to_invite_store_page
    page.execute_script "window.scrollBy(0,1500)"
    click_link "Invite a store"
    sleep 1
    click_on "Invite a Store"
  end

  def complete_form
    find("label",:text => "Apple").click
    page.execute_script "window.scrollBy(0,1000)"
    find("label",:text => "Higher cash back for ID.me VIPs").click
  end
end
