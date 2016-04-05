require_relative '../base_classes/error_messages.rb'

class MilitarySCRA < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation, popuplate = true)
  	find("[data-option='service-record']").find(".verification-header").click
  	populate_affiliation(affiliation)
  	
  	case affiliation
  	when "Service Member" then data_set = :scra_service_member
  	when "Veteran"		  then data_set = :scra_veteran
  	else puts "Affiliation not found!"
	end

  	if popuplate
  	  populate_fields(data_for(data_set))
  	end

  	click_verify_button
  end

  def populate_fields(data)
  	%w(service_member_first_name service_member_last_name social social_confirm).each do |field|
  	  fill_in field, :with => data.fetch(field)
  	end

  	%w(birth_date service_date).each do |field|
  	  2.times {fill_in field, :with => data.fetch(field)}
  	end
  end

  def populate_affiliation(value)
  	select_option(container_attribute, ".military-affiliation", value)
  end

  def container_attribute
  	'service-record'
  end

end