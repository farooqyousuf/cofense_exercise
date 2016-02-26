require_relative '../base_classes/error_messages.rb'

class PBFirefighter < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)    
    find("[data-option=#{container_attribute}]").find(".verification-header").click

    if populate
       populate_fields(data_for(:firefighter_proboard))
    end

    click_verify_button
  end

  def populate_fields(data)
    populate_first_state(data.fetch("state"))
    choose("proboard_status_certified")

    fill_in :first_name, with: data.fetch("first_name")
    fill_in :last_name, with: data.fetch("last_name")
    2.times {fill_in :birth_date, :with => data.fetch("dob")}
    fill_in :social, :with => data.fetch("ssn")
    fill_in :social_confirm, :with => data.fetch("ssn")
  end


  def populate_first_state(value)
    search_option(container_attribute, "#s2id_firefighter_state", value)
  end

  def container_attribute
    "firefighter"
  end

  def required_fields
  end

end