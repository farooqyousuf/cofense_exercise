require_relative '../base_classes/error_messages.rb'

class TeacherLookup < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(state, populate = true)
    populate_first_state(state)
    populate_fields
    click_verify_button
  end
  
  def populate_fields
    fill_in "first_name", with: Faker::Name.first_name
    fill_in "last_name", with: Faker::Name.last_name
    2.times {fill_in "birth_date", with: Faker::Date.birthday.strftime("%m%d%Y")}
    
    fill_in "teacher_city", with: Faker::Address.city
    fill_in "district", with: Faker::Address.city
    fill_in "school", with: Faker::University.name
    fill_in "teacher_number", with: Faker::Number.number(10)    
  end

  def populate_first_state(value)
    select_filter("id_teacher_state", value)
  end

end

