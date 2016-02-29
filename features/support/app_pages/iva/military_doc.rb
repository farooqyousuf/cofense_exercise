require_relative '../base_classes/error_messages.rb'

class MilitaryDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation, populate = true)
  	find("[data-option=#{container_attribute}]").find(".verification-header").click

  	populate_affiliation(affiliation)

  	if populate
  		populate_fields(data_for(:experian_user))
      
      if ["Military Family", "Military Spouse"].include?(affiliation)
        fill_in "first_name", with: "CapybaraTester" 
        fill_in "last_name", with: "CapybaraTester"
        select_option(container_attribute, "#s2id_service_subgroup_id", "Veteran")
      end

      click_verify_button

      #attach dd214 doc
      populate_dd214_type("DD214 - Other")
      attach_doc 
  	end

  	click_verify_button
  end

  def populate_fields(data)
  	#fill reqd fields
    fill_in "service_member_first_name", with: data.fetch("first_name")
	  fill_in "service_member_last_name", with: data.fetch("last_name")
	  2.times { fill_in "birth_date", with: data.fetch("dob") }
	  fill_in "social", with: data.fetch("ssn")
	  fill_in "social_confirm", with: data.fetch("ssn")
	  fill_in "street", with: data.fetch("street")
	  fill_in "city", with: data.fetch("city")
	  2.times { fill_in "zip", with: data.fetch("zip") }
    populate_state(data.fetch("state"))
  end

  def container_attribute
  	"military-document"
  end

  def populate_affiliation(value)
	  select_option(container_attribute, ".military-affiliation", value)
  end 

  def populate_state(value)
  	select_option(container_attribute, "#s2id_state", value)
  end

  def populate_dd214_type(value)
  	wait_for_ajax
    sleep 2
  	select_option(container_attribute, "#s2id_document_type_id", value)
  end

  def required_fields
    [0,1,2,3,4,5,6,7,9]
  end

end