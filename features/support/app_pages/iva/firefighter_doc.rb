require_relative '../base_classes/error_messages.rb'

class DocFirefighter < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    populate_first_state(data_for(:experian_user).fetch("state"), unique_id)
    choose("proboard_status_uncertified")

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

    click_verify_button

    if (type == "unique") || (type == "second unique user")
      attach_doc(2)
      click_verify_button
    end
  end

  def populate_fields(data:)
    %w(first_name last_name social social_confirm street city).each do |field|
      fill_in field, with: data.fetch(field)
    end

    escape_google_address_autocomplete(%w(#street #city))

    %w(birth_date zip).each do |field|
      2.times { fill_in field, with: data.fetch(field) }
    end

    #Added the 2 lines above populate_second_state to deal with the random dropdown not working on occasion
    all("#s2id_state")[1].click
    find("#s2id_autogen6_search").native.send_keys :escape
    2.times {populate_second_state("Kansas", index=1)}
  end

  def container_attribute
    "firefighter"
  end

  def unique_id
    "#s2id_state"
  end

  def required_fields
    [0,1,2,3,4,5,6,7,9]
  end

end
