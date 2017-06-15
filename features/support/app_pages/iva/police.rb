require_relative '../base_classes/error_messages.rb'

class Police < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: nil)
    if populate

      data = data_for(:experian_user) #info for unique and duplicate users
      denied_data = data_for(:fail_experian) #info for denied user
      second_unique_data = data_for(:experian_user2)

      case type
      when "unique", "duplicate"
        populate_fields(data: data)
      when "denied"
        populate_fields(data: denied_data)
      when "second unique user"
        populate_fields(data: second_unique_data)
      end
    end

    click_continue

    if (type == "unique") || (type == "second unique user")
      sleep 2
      attach_doc
      click_continue
    end
  end

  def populate_fields(data:)
    search_option(container_attribute, "#s2id_verification_police_state", data.fetch("state"))

    %w(verification_first_name verification_last_name verification_social verification_social_confirm street city zip).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    escape_google_address_autocomplete(%w(#street #city))

    #populate_second_state(data.fetch("state"), index=0)
    all("#s2id_state")[0].click
    pick_result("Kansas")
  end

  def container_attribute
    "police"
  end

  def unique_id
    "#s2id_police_state"
  end

  def required_fields
    [0,1,2,3,4,5,6,7,8,9]
  end

  def click_verify_police_link
    click_link("Verify as a state certified Police Officer")
  end

end
