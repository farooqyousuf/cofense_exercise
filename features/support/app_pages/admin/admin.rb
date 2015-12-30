require_relative '../base_classes/base_idme.rb'

class AdminTool < IDmeBase

  def initialize
    super("https://admin-staging.idmeinc.net")
  end

  def login_in_new_window
  	binding.pry
    self.create_new_window
    self.use_last_browser_created
    self.visit
    #login
  end

  def logout_in_new_window
    self.logout
    self.close_last_browser_created
    self.use_parent_window
  end


end