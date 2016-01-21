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
    find("[data-key='verification_code_generated']").text
  end

end