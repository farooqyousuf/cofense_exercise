require_relative '../base_classes/error_messages.rb'

class StudentDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
    find("[data-option=#{container_attribute}]").find(".verification-header").click

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
      sleep 3
      populate_doc
      attach_doc
      click_verify_button
    end
  end

  def populate_fields(data:)
    populate_school(data.fetch("school"))

    %w(first_name last_name social social_confirm street city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    escape_google_address_autocomplete(%w(#street #city))

    populate_state(data.fetch("state"))
  end

  def container_attribute
    'student-document'
  end

  #dupe method found in school creds, maybe add to a module
  def populate_school(school)
    search_option(container_attribute, ".schools", school)
  end

  def populate_state(value)
    select_option(container_attribute, "#s2id_state", value, index=0)
  end

  def populate_doc
     select_filter("id_document_type_id", "Student ID")
  end

  def required_fields
    [0,2,3,4,5,6,7,8,9,11]
  end
end

