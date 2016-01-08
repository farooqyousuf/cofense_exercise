class MarketplaceLandingPage < IDmeBase

  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.shop_homepage)
  end

  def sign_in(user,password) #might need to move this to more general page object in itself
    fill_in_email_by_id(user)
    fill_in_password(password)
    click_sign_in
  end

  def sign_out
    click_link("Sign Out")
  end

  def click_on_user_profile_navigation_link
    find(".user-nav").click
    sleep 1
    first(".button").click #this is for staging intro popup, might not be on prod
  end

  def user_cashback_page_url
    page.current_url
  end

  def request_vip_achievements
    $vip_user_acheivement_response_raw = RestClient.get "#{FigNewton.mp_users.mp_homepage}/user/#{FigNewton.mp_users.vip_uid}/achievements_progress", {:accept => :json}
    @vip_user_acheivement_response =  JSON.parse($vip_user_acheivement_response_raw)
    return @vip_user_acheivement_response
  end

  def social_network_login(name)
    case name
    when "facebook"
      facebook_connect_modal.click
      sleep 2
      binding.pry
      # facebook = FaceBookLoginPage.new
      # binding.pry
      # facebook.sign_in
      #ISSUE : current there is a issue working where the facebook setting is not setup for the endpoint
      #some sort of implicit wait along with the return item
    when "twitter"
      twitter_connect_modal.click
      # sleep 2
      # twitter = TwitterLoginPage.new
      # twitter.sign_in
    end

  end

  def success_flash_msg
    #should be the div "container" with the success flash msg
  end

  def social_network_modal_popup
    first(".modal-block").text
    sleep 1
  end

  def social_network_activity_card(social_network)
    find(:link,:href => "/cash-back/activities/#{social_network}-connected")
  end

  def social_network_connect_modal(social_network)
    find(:link,:href =>"/auth/#{social_network}")
  end

  def social_network_activity_card_exists(social_network)
    page.has_selector?(:link, :href => "/cash-back/activities/#{social_network}-connected")
  end

  # facebook specific social connect

  def check_facebook_activity_card_connected
    if @vip_user_acheivement_response[1]["completed"] == true
      expect(social_network_activity_card("facebook").text).to eql("COMPLETED Connect your Facebook account")
    else
      expect(social_network_activity_card("facebook").text).to eql("EXTEND VIP Connect your Facebook account")
      click_link "Connect your Facebook account"
      #INTERMITTENT FAILURE ISSUE => sometimes the modal window will not load and instead just refresh the page
      expect(social_network_modal_popup.text).to eql("Link your Facebook account to ID.me to get 10 points and extend your VIP status for 1 month. Connecting to Facebook also helps ID.me show you personalized offers.")
      expect(social_network_connect_modal("facebook").visible?).to be(true) #maybe get rid off? redundent to fact there is text there in the check?
    end
  end

  # twitter specific social connect

  def check_twitter_activity_card_connected
    if @vip_user_acheivement_response[19]["completed"] == true
      expect(social_network_activity_card("twitter").text).to eql("5 POINTS Connect your Twitter account")
    else
      expect(social_network_activity_card("twitter").text).to eql("5 POINTS Connect your Twitter account")
      binding.pry
      click_link "Connect your Twitter account"
      expect(social_network_modal_popup).to eql("Link your Twitter account to ID.me and get 5 points. Connecting to Twitter also helps ID.me show you personalized offers.")
      expect(social_network_connect_modal("twitter").visible?).to be(true)

    end

  end

end
