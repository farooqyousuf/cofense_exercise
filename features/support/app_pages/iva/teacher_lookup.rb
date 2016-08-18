require_relative '../base_classes/error_messages.rb'

class TeacherLookup < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(state: "Delaware", populate: true, type: "unique")
    #Delaware is randomly used as a default state
    populate_first_state(state)

      if populate

        build_unique_info #info for unique and denied users

        case type
        when "unique", "denied"
          populate_fields(state:          state,
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
    click_verify_button
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
    fill_in "first_name", :with => fname
    fill_in "last_name", :with => lname
    fill_in "teacher_city", :with => teacher_city
    fill_in "district", :with => district
    fill_in "school", :with => school
    2.times {fill_in "birth_date", :with => dob}

    case state
    when "Michigan"
      fill_teacher_license_number
    when "New Mexico"
      fill_short_ssn
    when "Alabama"
      fill_teacher_license_number
      fill_short_ssn
    end
  end

  def fill_teacher_license_number
    fill_in "teacher_number", :with => @teacher_number #teacher license number
  end

  def fill_short_ssn
    %w(social social_confirm).each do |field|
      fill_in field, :with => @ssn
    end
  end

  def populate_first_state(value, index=0)
    select_filter("id_teacher_state", value, index)
  end

end

