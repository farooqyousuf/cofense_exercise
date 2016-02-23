require_relative '../base_classes/error_messages.rb'

class Police < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
    
    find("[data-option=#{container_attribute}]").find(".verification-header").click

    if populate
      populate_fields(data_for(:police))
      click_verify_button
      sleep 5
      attach_doc(2)
    end

    click_verify_button

  end

  def populate_fields(data)
    populate_first_state(data.fetch("state"))
    fill_in :first_name, :with => data.fetch("first_name")
    fill_in :last_name, :with => data.fetch("last_name")
    2.times {fill_in :birth_date, :with => data.fetch("dob")}
    fill_in :social, :with => data.fetch("ssn")
    fill_in :social_confirm, :with => data.fetch("ssn")
    fill_in :street, :with => data.fetch("street")
    fill_in :city, :with => data.fetch("city")
    populate_second_state("Kansas")
    2.times {fill_in :zip, :with => data.fetch("zip")}
  end


  def populate_first_state(value)
    search_option(container_attribute, "#s2id_police_state", value)
  end

  def populate_second_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

  def container_attribute
    "police"
  end

  def required_fields
    [0,2,3,4,5,6,7,8,9,11]
  end

end