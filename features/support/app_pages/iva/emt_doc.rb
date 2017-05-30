require_relative '../base_classes/error_messages.rb'

class DocEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type:)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    choose("emt_level_document")

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

      click_verify_button

      sleep 2

      if (type == "unique")|| (type == "second unique user")
        attach_doc(1)
        click_verify_button
      end
    end
  end

  def container_attribute
    "emt"
  end

  def populate_fields(data:)
    %w(first_name last_name birth_date social social_confirm street city zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
    sleep 2

    escape_google_address_autocomplete(%w(#street #city))

    #Added the 2 lines above populate_second_state to deal with the random dropdown not working on occasion
    all("#s2id_state")[0].click
    find("#s2id_autogen4_search").native.send_keys :escape
    2.times {populate_second_state("Kansas", index=0)}
  end

end
