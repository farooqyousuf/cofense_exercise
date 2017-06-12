require_relative '../base_classes/error_messages.rb'

class StateLookupEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: nil)
    if populate

      data = data_for(:experian_user) #info for unique and duplicate user
      denied_data = data_for(:fail_experian) #info for denied user

      case type
      when "unique", "duplicate"
        populate_fields(data: data)
      when "denied"
        populate_fields(data: denied_data)
      end
    end

    click_continue
  end

  def populate_fields(data:)
    %w(verification_first_name verification_last_name verification_social verification_social_confirm street city emt_city emt_county verification_emt_number).each do |field|
        fill_in field, :with => data.fetch(field)
    end

    %w(verification_birth_date zip emt_zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    escape_google_address_autocomplete(%w(#street #emt_city))

    binding.pry
    all("#s2id_state")[0].click
    find("#s2id_autogen1_search").native.send_keys :escape
    all("#s2id_state")[0].click
    #3 lines above required to deal with dropdown sometimes not functioning properly
    pick_result("Kansas")
  end

  def required_fields
    [0,1,2,3,4,5,6,7,9,10,11,12]
  end

  def click_verify_emt_state_link
    click_link("Verify as a certified EMT / Paramedic")
    click_link("I am state certified")
    select_option("#s2id_state","Alaska")
  end

end


