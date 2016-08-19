require_relative '../base_classes/error_messages.rb'

class PBFirefighter < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    populate_first_state(data_for(:firefighter_proboard).fetch("state"), unique_id)
    choose("proboard_status_certified")

    if populate

      unique_data = data_for(:firefighter_proboard)
      denied_data = data_for(:denied_pb_fireman)

      case type
      when "unique", "duplicate"
        populate_fields(data: unique_data)
      when "denied"
        populate_fields(data: denied_data)
      end
    end

    click_verify_button
  end

  def populate_fields(data:)
    %w(first_name last_name social social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    2.times {fill_in :birth_date, :with => data.fetch("birth_date")}
  end

  def container_attribute
    "firefighter"
  end

  def unique_id
    "#s2id_state"
  end

  def required_fields
    [0,1,2,3,4]
  end

end
