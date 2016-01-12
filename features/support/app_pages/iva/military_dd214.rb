require_relative '../base_classes/error_messages.rb'

class DD214 < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation, populate = true)
    find("[data-option='dd214-request']").find(".verification-header").click
    populate_affiliation(affiliation)

    if populate
      populate_signature
      populate_branch
      populate_officer
      populate_component
      populate_checkboxes
      populate_fields(data_for(:military_dd214))
    end

    #first and last name for user
    if ["Next of kin deceased veteran", "Legal guardian"].include?(affiliation)
      find("#first_name").set(data_for(:military_dd214).fetch("first_name"))
      find("#last_name").set(data_for(:military_dd214).fetch("last_name"))
    end

    click_verify_button
  end

  def populate_fields(data)
    #information for service member
  	find("#service_member_first_name").set(data.fetch("member_first_name"))
  	find("#service_member_last_name").set(data.fetch("member_last_name"))
  	find("#social").set(data.fetch("ssn"))
  	find("#social_confirm").set(data.fetch("ssn_confirm"))
  	find("#birth_place").set(data.fetch("birth_place"))
  	2.times { find("#birth_date").set(data.fetch("dob")) }
    2.times { find("#date_entered").set(data.fetch("enter_date")) }
    2.times { find("#date_released").set(data.fetch("release_date")) }
  end

   def container_attribute
    'dd214-request'
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".dd214-affiliation", value)
  end

  def populate_signature
    page.execute_script("document.getElementById('signature').value = '#{data_for(:military_dd214)["signature"]}';")
  end

  def populate_branch
    select_option(container_attribute, ".dd214-branch", "Air Force")
  end

  def populate_officer
    select_option(container_attribute, ".dd214-officer", "Officer")
  end

  def populate_component
    select_option(container_attribute, ".dd214-component", "Active Duty")
  end

  def release_checkbox
  	all(".checkbox")[0].click
  end

  def liable_checkbox
  	all(".checkbox")[1].click
  end

  def verify_checkbox
  	all(".checkbox")[2].click
  end

  def populate_checkboxes
    release_checkbox
    liable_checkbox
    verify_checkbox
  end

end
