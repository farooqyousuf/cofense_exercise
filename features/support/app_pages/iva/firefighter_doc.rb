require_relative '../base_classes/error_messages.rb'

class DocFirefighter < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
    if populate

      unique_data = data_for(:experian_user) #info for unique and duplicate users
      denied_data = data_for(:fail_experian) #info for denied user
      second_unique_data = data_for(:experian_user2)

      case type
      when "unique", "duplicate"
        populate_fields(data: unique_data)
      when "denied"
        populate_fields(data: denied_data)
      when "second unique user"
        populate_fields(data: second_unique_data)
      end
    end

    click_continue

    if (type == "unique") || (type == "second unique user")
      attach_doc
      click_continue
    end
  end

  def populate_fields(data:)
    %w(verification_first_name verification_last_name verification_social verification_social_confirm verification_street verification_city).each do |field|
      fill_in field, with: data.fetch(field)
    end

    escape_google_address_autocomplete(%w(#verification_street #verification_city))

    %w(verification_birth_date verification_zip).each do |field|
      2.times { fill_in field, with: data.fetch(field) }
    end

    all("#s2id_verification_state")[0].click
    pick_result("Kansas")
  end

  def container_attribute
    "firefighter"
  end

  def unique_id
    "#s2id_state"
  end

  def required_fields
    [0,1,2,3,4,5,6,7]
  end

  def user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1, 1]
  end

  def click_verify_firefighter_doc_link
    click_link("Verify as a state certified Firefighter")
    select_option("#s2id_state","Kansas")
    click_link("No, I am not ProBoard certified")
  end

end
