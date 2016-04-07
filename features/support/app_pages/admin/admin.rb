require_relative '../base_classes/base_idme.rb'

class AdminTool < IDmeBase

  def initialize
    super(FigNewton.admin.base_url)
  end

  def login_in_new_window
    self.create_new_window
    self.use_last_browser_created
    self.visit
    sleep 2
    authority = Authority.new
    sleep 2
    authority.auth_login
  end

  def logout_in_new_window
    click_link("Logout")
    self.close_current_browser
    self.use_last_browser_created
  end

end
