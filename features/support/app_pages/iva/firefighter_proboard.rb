require_relative '../base_classes/error_messages.rb'

class PBFirefighter < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)    
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    populate_first_state(data_for(:firefighter_proboard).fetch("state"))
    choose("proboard_status_certified")

    if populate
       populate_fields(data_for(:firefighter_proboard))
    end

    click_verify_button
  end

  def populate_fields(data)
    %w(first_name last_name social social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    2.times {fill_in :birth_date, :with => data.fetch("birth_date")}
  end

  def populate_first_state(value)
    search_option(container_attribute, "#s2id_firefighter_state", value)
  end

  def container_attribute
    "firefighter"
  end

  def required_fields
    [0,1,2,3,4]
  end

end