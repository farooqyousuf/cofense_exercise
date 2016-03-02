require_relative '../base_classes/error_messages.rb'

class NationalEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

 	def verify(populate = true)
  		find("[data-option=#{container_attribute}]").find(".verification-header").click
  		choose("emt_level_national")

  		if populate
  			populate_fields(data_for(:emt_national))
  		end

  		click_verify_button  
 	end

  	def populate_fields(data)
  		%w(first_name last_name birth_date registry_number).each do |field|
  			2.times {fill_in field, :with => data.fetch(field)}
  		end
	end

	def container_attribute
  		"emt"
	end

	def required_fields  
  		[0,1,2,3]
	end
end