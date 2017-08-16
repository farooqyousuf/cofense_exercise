require_relative '../base_classes/error_messages.rb'

class MilitaryDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation:, populate: true, type: "none")
    populate_affiliation(affiliation)

    if populate

      unique_data = data_for(:mil_doc) #info used for unique and dupe users
      denied_data = data_for(:fail_experian) #info used for denied users
      second_unique_data = data_for(:experian_user2)

      case type
      when "unique", "duplicate", "no_doc"
        populate_fields(data: unique_data)
      when "denied"
        populate_fields(data: denied_data)
      when "second unique user"
        populate_fields(data: second_unique_data)
      end

      if ["Military Family", "Military Spouse"].include?(affiliation)
        %w(verification_first_name verification_last_name verification_birth_date).each do |field|
          2.times {fill_in field, :with => (data_for(:mil_doc).fetch(field))}
        end
        select_option("#s2id_verification_service_subgroup_id", "Veteran")
      end
    end

    click_continue
    sleep 3

    if (type == "no_doc")
      populate_dd214_type("DD214 - Other")
      click_continue
    end

    if (type == "unique") || (type == "second unique user")
      #attach dd214 doc
      populate_dd214_type("DD214 - Other")
      attach_doc
      click_continue
    end
  end

  def populate_fields(data:)
    #fill reqd fields
    %w(verification_service_member_first_name verification_service_member_last_name verification_social verification_social_confirm street city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_service_member_birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    escape_google_address_autocomplete(%w(#street #city))

    populate_state(data.fetch("state"))
  end

  def container_attribute
    "military-document"
  end

  def populate_affiliation(affiliation)
    select_option("#s2id_verification_subgroup_id", affiliation)
  end

  def populate_state(state)
    select_option("#s2id_state", state)
  end

  def populate_dd214_type(value)
    wait_for_ajax
    sleep 3
    select_option("#s2id_verification_document_type_id", value)
  end

  def required_fields
    [0,1,2,3,4,5,6,7,8]
  end

  def service_member_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1, 1]
  end

  def family_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  end

  def click_verify_mildoc_link
    click_link("Verify by uploading documentation")
  end


end
