require_relative '../base_classes/error_messages.rb'

class TeacherLookup < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(state, populate = true)
    populate_first_state(state)
      if populate == true
        populate_fields(state)
      end
    click_verify_button
  end
  
  def populate_fields(state)
    fill_in "first_name", with: Faker::Name.first_name
    fill_in "last_name", with: Faker::Name.last_name
    2.times {fill_in "birth_date", with: Faker::Date.birthday.strftime("%m%d%Y")}
    
    fill_in "teacher_city", with: Faker::Address.city
    fill_in "district", with: Faker::Address.city
    fill_in "school", with: Faker::University.name

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
    fill_in "teacher_number", with: Faker::Number.number(10) #teacher license number
  end

  def fill_short_ssn
    fill_in "social", with: "1111"
    fill_in "social_confirm", with: "1111"
  end

  def populate_first_state(value)
    select_filter("id_teacher_state", value)
  end

end

