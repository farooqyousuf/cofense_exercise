require_relative '../base_classes/error_messages.rb'

class StudentCreds < IDmeBase

  include IDPBase
  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
      if populate
        unique_data = data_for(:student_creds) #info for unique user
        denied_data = data_for(:student_creds_denied) #info for denied user
        dupe_data   = data_for(:student_creds_dupe) #info for dupe user

        case type
        when "unique"
          populate_fields(data: unique_data)
        when "denied"
          populate_fields(data: denied_data)
        when "duplicate"
          populate_fields(data: dupe_data)
        end
      end
    click_continue
  end

  def container_attribute
    "clearinghouse"
  end

  def populate_fields(data:)
    populate_school(data.fetch("school"))
    %w(verification_first_name verification_last_name verification_social verification_social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_birth_date).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
  end

  def click_verify_by_creds
    click_link("Confirm your school enrollment")
  end

  def populate_school(value)
    # click the dropdown
    all(".select2-arrow")[0].click

    #set the search value
    set_search_value(value)

    #pick a result
    pick_result(value)
  end

  def required_fields
    [0,1,2,3,4,5]
  end

  def user_properties_levels
    [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
  end
end
