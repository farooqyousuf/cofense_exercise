class WalletDashboard < IDmeBase
  include IDPBase
  
  def initialize
    super(FigNewton.wallet.dashboard)
  end

  def open_shared_side_navigation
   find(".shared-nav-user-avatar").click
  end 

  def close_shared_side_navigation
  	find(".icon-wallet-close").click
  end 

  def click_shared_side_navigation_sign_out
    click_link "Sign Out"
  end 
end 
