require_relative '../base_classes/error_messages.rb'

class StudentCanada < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
    if populate

      data = data_for(:experian_user) #info for unique and duplicate users
      denied_data = data_for(:fail_experian) #info for denied user

      case type
      when "unique"
        populate_fields(data: data)
      when "duplicate"
        populate_fields(data: data)
      when "denied"
        populate_fields(data: denied_data)
      end
    end

    click_continue
    sleep 3
    populate_doc

    case type
    when "unique", "denied"
      attach_doc
    when "duplicate"
      attach_doc(number = 0, document: "dupe_doc.png")
    end

    click_continue
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
    2.times {fill_in "verification_zip", :with => data.fetch("postal_code")}
  end

  def populate_province(province)
    select_option("#s2id_verification_province", province)
  end

  def populate_doc
     select_filter(".select2-arrow", "Student ID")
  end

  def required_fields
    [0, 1, 2, 3, 4, 5, 6, 7]
  end

  def user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1]
  end

end
