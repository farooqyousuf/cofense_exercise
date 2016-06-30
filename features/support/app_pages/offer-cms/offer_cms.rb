require_relative "../base_classes/base_idme.rb"

class OfferCMSTool < IDmeBase
  attr_reader :user_uid 

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
    2.times { find(:link, :href =>"/marketplace_users").click }
    sleep 1
    fill_in("query2", :with => "test+24@id.me")
    click_link "Search"

    @user_uid = find("#DataTables_Table_0 tbody td:nth-child(3)").text #double check that instance variable should persist past scenario
  end
end 	
