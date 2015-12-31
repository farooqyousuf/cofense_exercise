require_relative "../base_classes/page_mgmt"

class AdminVerificationAttempts < IDmeBase

include PageManagement

  def initialize
    super("https://admin-staging.idmeinc.net/verification/attempts")
  end

  def open_newest
    first('.odd > td > a').click
  end

  def get_code
  	page.all(".row")[13].find(".columns.medium-6.data-container.left").text
  end

end