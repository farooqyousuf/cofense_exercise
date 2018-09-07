require_relative "../base_classes/page_mgmt"

class AdminVerificationAttempts < IDmeBase

include PageManagement

  def initialize
    super("#{FigNewton.admin.base_url}/verification/attempts")
  end

  def open_newest
    first('.odd > td > a').click
  end

  def get_code
    find("[data-key='code']").text
  end

  def search_user_attempt(user)
    find("input[type=search]").set(user).native.send_keys(:return)
  end
end
