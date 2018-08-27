require_relative '../base_classes/error_messages.rb'

class StudentDoc < IDmeBase

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
      sleep 3
      populate_doc
      attach_doc
      click_continue
    end
  end

  def populate_fields(data:)
    populate_school(data.fetch("school"))

    %w(verification_first_name verification_last_name verification_social verification_social_confirm verification_street verification_city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_birth_date verification_zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    escape_google_address_autocomplete(%w(#verification_street #verification_city))

    populate_state(data.fetch("state"))
  end

  def container_attribute
    'student-document'
  end

  #dupe method found in school creds, maybe add to a module
  def populate_school(value)
    # click the dropdown
    all(".select2-arrow")[0].click

    #set the search value
    set_search_value(value)

    #pick a result
    pick_result(value)
  end

  def populate_state(state)
    select_option("#s2id_verification_state", state)
  end

  def populate_doc
     select_filter(".select2-arrow", "Student ID")
  end

  def click_verify_by_doc
    click_link("Upload student documentation")
  end

  def required_fields
    [0,1,2,3,4,5,6,7,8,9]
  end

  def user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  end

end
