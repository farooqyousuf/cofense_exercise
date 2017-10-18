require_relative '../base_classes/error_messages.rb'

class TeacherLookup < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(state: "none", populate: true, type: "unique")
      if populate

        build_unique_info #info for unique and denied users

        case type
        when "unique", "denied"
          populate_fields(state:          state,   # Delaware used as default state
                          fname:          @fname,
                          lname:          @lname,
                          dob:            @dob,
                          teacher_city:   @teacher_city,
                          district:       @district,
                          school:         @school)
        when "dupe"
          #populate_fields() #work in progress
        end
      end

    if page.has_css?("#state_number_available_yes")
      find("#state_number_available_no").click
    end

    sleep 2
    click_continue
  end

  def build_unique_info
    @fname = Faker::Name.first_name
    @lname = Faker::Name.last_name
    @dob = Faker::Date.birthday.strftime("%m%d%Y")
    @teacher_city = Faker::Address.city
    @district = Faker::Address.city
    @school = Faker::University.name
    @teacher_number = Faker::Number.number(10) #teacher license number
    @ssn = "1111"
  end

  def populate_fields(state:, fname:, lname:, dob:, teacher_city:, district:, school:)
    fill_in "verification_first_name", :with => fname
    fill_in "verification_last_name", :with => lname
    fill_in "teacher_city", :with => teacher_city
    fill_in "district", :with => district
    fill_in "verification_school", :with => school
    2.times {fill_in "verification_birth_date", :with => dob}

    case state
    when "Michigan"
      fill_teacher_license_number
    when "New Mexico"
      fill_short_ssn
    when "Alabama"
      fill_teacher_license_number
    end

    escape_google_address_autocomplete(%w(#teacher_city #district))
  end

  def fill_teacher_license_number
    fill_in "verification_teacher_number", :with => @teacher_number #teacher license number
  end

  def fill_short_ssn
    %w(verification_social verification_social_confirm).each do |field|
      fill_in field, :with => @ssn
    end
  end

  def populate_teacher_first_state(value)
    select_filter("id_teacher_state", value)
  end

  def click_verify_by_state_lookup
    click_link("I am licensed by my state.")
  end

  def no_license_no_ssn_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1]
  end

  def ssn_no_license_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1]
  end

  def license_and_no_ssn_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1]
  end

  def license_and_ssn_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1]
  end

end
