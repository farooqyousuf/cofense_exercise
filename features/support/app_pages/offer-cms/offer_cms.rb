require_relative "../base_classes/base_idme.rb"

class OfferCMSTool < IDmeBase
	def initialize 
		super(FigNewton.offer_cms.base_url)
	end 

  def login_in_new_window
    self.create_new_window
    self.use_last_browser_created
    self.visit
    sleep 2
    authority = Authority.new
    sleep 2
    authority.auth_login
    #BLOCKED due to farooq+1@id.me not having Authority Access to offer-cms
  end

   def logout_in_new_window
    click_link("Logout")
    self.close_current_browser
    self.use_last_browser_created
  end

  def find_user_uid
    #so then how 
    visit "https://offers-cms-staging.idmeinc.net/marketplace_users"
    fill_in("query2", :with => "whatevertheuseremailishere")
    click_link "Search"

    @user_uid = find("#DataTables_Table_0 tbody td:nth-child(3)").text #double check that instance variable should persist past scenario
  end
end 	
