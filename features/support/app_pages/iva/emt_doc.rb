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

      case type
      when "unique", "duplicate"
        populate_fields(data: unique_data)
      when "denied"
        populate_fields(data: denied_data)
      end

      click_verify_button

      sleep 2

      if type == "unique"
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

    populate_second_state("Kansas", index=0)
  end

end
