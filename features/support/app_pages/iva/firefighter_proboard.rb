require_relative '../base_classes/error_messages.rb'

class PBFirefighter < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
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

    click_continue
  end

  def populate_fields(data:)
    %w(verification_first_name verification_last_name verification_social verification_social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    2.times {fill_in :verification_birth_date, :with => data.fetch("verification_birth_date")}
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

  def user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1]
  end

  def click_verify_firefighter_pb_link
    click_on("Verify as a state certified Firefighter")
    select_option("#s2id_state","Virginia")
    click_link("Yes, I am ProBoard certified")
  end
end
