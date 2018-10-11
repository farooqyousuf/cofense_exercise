require_relative '../base_classes/error_messages.rb'

class DocEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type:)
    if populate
      unique_data = data_for(:experian_user) #info for unique and duplicate users
      denied_data = data_for(:fail_experian)
      second_unique_data = data_for(:experian_user2)

      case type
      when "unique", "duplicate"
        populate_fields(data: unique_data)
      when "denied"
        populate_fields(data: denied_data)
      when "second unique user"
        populate_fields(data: second_unique_data)
      end

      click_continue

      sleep 2

      if (type == "unique")|| (type == "second unique user")
        attach_doc
        click_continue
      end
    end
  end

  def container_attribute
    "emt"
  end

  def populate_fields(data:)
    %w(verification_first_name verification_last_name verification_birth_date verification_social verification_street verification_city verification_zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
    sleep 2

    escape_google_address_autocomplete(%w(#verification_street #verification_city))
    select_option("#s2id_verification_state", "Kansas")
  end

  def click_verify_emt_doc_link
    click_link("Verify as a certified EMT / Paramedic")
    click_link("I am neither of the above - OR - I have documentation proving my certification")
  end

  def user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1, 1]
  end

end
