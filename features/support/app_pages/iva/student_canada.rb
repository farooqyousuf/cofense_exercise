require_relative '../base_classes/error_messages.rb'

class StudentCanada < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
      if populate

        unique_data = data_for(:experian_user) #info for unique and duplicate users
        # denied_data = data_for(:fail_experian) #info for denied user
        # second_unique_data = data_for(:experian_user2)

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
    select2_arrow(data.fetch("canadian_school"))

    %w(verification_first_name verification_last_name verification_street verification_city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    2.times {fill_in "verification_birth_date", :with => data.fetch("verification_birth_date")}

    escape_google_address_autocomplete(%w(#verification_street #verification_city))

    populate_province(data.fetch("province"))

    #postal code
    fill_in "verification_zip", :with => data.fetch("postal_code")
  end

  def populate_province(province)
    select_option("#s2id_verification_province", province)
  end

  def populate_doc
     select_filter(".select2-arrow", "Student ID")
  end

  def user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1]
  end

end
