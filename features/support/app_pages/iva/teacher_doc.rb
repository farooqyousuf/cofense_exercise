require_relative '../base_classes/error_messages.rb'

class TeacherDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
      if populate

        unique_data = data_for(:experian_user) #info used for unique and dupliate users
        denied_data = data_for(:fail_experian) #info used for denied user
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
        sleep 2
        attach_doc
        click_continue
      end
  end

  def populate_fields(data:)
    %w(verification_first_name verification_last_name verification_social verification_social_confirm street city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    %w(teacher_city district verification_school).each do |field|
      fill_in field, :with => Faker::Address.city
    end

    fill_in "verification_teacher_number", with: Faker::Number.number(10)

    escape_google_address_autocomplete(%w(#street #city))
    select_option("#s2id_state", data.fetch("state"))
  end

  def click_verify_by_doc
    click_link("I do not have my state license number, but I can verify using documentation.")
  end

  def populate_teacher_first_state(value)
    select_filter(".select2-arrow", value)
  end

  def required_fields
    [0,1,2,3,4,5,6,7,8,9,11]
  end

end

