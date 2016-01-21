require_relative "../base_classes/page_mgmt"

class AdminVerificationAttempts < IDmeBase

include PageManagement

  def initialize
  	super("#{FigNewton.admin.base_url}/verification/attempts")
  end

  def open_newest
    first('.odd > td > a').click
  end

  def get_code(option)
  	case option
  	when "Government Email"    then number = 13
  	when "Military Email Code" then number = 15
  	else 
  		puts "Option not found!"
  	end
  	page.all(".row")[number].find(".columns.medium-6.data-container.left").text
  end

end