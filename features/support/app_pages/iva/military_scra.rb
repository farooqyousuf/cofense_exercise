require_relative '../base_classes/error_messages.rb'

class MilitarySCRA < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation, popuplate = true)
  	find("[data-option='service-record']").find(".verification-header").click
  	populate_affiliation(affiliation)
  	
  	case affiliation
  	when "Service Member"     then data_set = :scra_service_member
  	when "Veteran"		      then data_set = :scra_veteran
  	when "Military Spouse"    then data_set = :scra_mil_spouse
  	when "Military Family"    then data_set = :scra_mil_family
  	when "Military Supporter" then data_set = :scra_mil_supporter
  	else puts "Affiliation not found!"
	end

  	if popuplate
  	  populate_fields(data_for(data_set))
  	end

  	if ["Military Spouse", "Military Family", "Military Supporter"].include?(affiliation)
  	  %w(first_name last_name).each do |field|
  	  	fill_in field, :with => data_for(data_set).fetch(field)
  	  end
  	end

  	if ["Military Spouse", "Military Family"].include?(affiliation)
      populate_affiliation_2("Service Member")
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

  def populate_affiliation_2(value)
  	select_option(container_attribute, ".service-affiliation", value)
  end

  def container_attribute
  	'service-record'
  end

end