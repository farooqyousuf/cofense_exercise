require_relative '../base_classes/error_messages.rb'

class Police < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: nil)

    find("[data-option=#{container_attribute}]").find(".verification-header").click

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

    click_verify_button

    if (type == "unique") || (type == "second unique user")
      sleep 2
      attach_doc(3)
      click_verify_button
    end
  end

  def populate_fields(data:)
    populate_first_state(data.fetch("state"), unique_id)

    %w(first_name last_name social social_confirm street city zip).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    escape_google_address_autocomplete(%w(#street #city))

    populate_second_state(data.fetch("state"), index=0)
  end

  def container_attribute
    "police"
  end

  def unique_id
    "#s2id_police_state"
  end

  def required_fields
    [0,2,3,4,5,6,7,8,9,11]
  end

end
