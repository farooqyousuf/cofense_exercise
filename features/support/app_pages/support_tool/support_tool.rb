require_relative '../base_classes/base_idme.rb'

class SupportTool < IDmeBase

  def initialize
    super(FigNewton.support_tool.base_url)
  end

  def login
    self.visit
    sleep 2
    authority = Authority.new
    sleep 2
    authority.auth_login
  end

  def login_in_new_window
    self.create_new_window
    self.use_last_browser_created
    login
  end
end
