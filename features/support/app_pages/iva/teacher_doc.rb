require_relative '../base_classes/error_messages.rb'

class TeacherDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
    populate_first_state("Maryland")
      if populate
        populate_fields(data_for(:experian_user))
      end
      
      click_verify_button
      sleep 5

      if populate
        attach_doc
        click_verify_button
      end
  end

  def populate_fields(data)
    fill_in "first_name", with: data.fetch("first_name")
    fill_in "last_name", with: data.fetch("last_name")
    2.times {fill_in "birth_date", with: data.fetch("dob")}
    
    fill_in "teacher_city", with: Faker::Address.city
    fill_in "district", with: Faker::Address.city
    fill_in "school", with: Faker::Address.city
    fill_in "teacher_number", with: Faker::Number.number(10)
    
    fill_in "social", with: data.fetch("ssn")
    fill_in "social_confirm", with: data.fetch("ssn")

    fill_in "street", with: data.fetch("street")
    fill_in "city", with: data.fetch("city")
    populate_second_state(data.fetch("state"))
    2.times {fill_in "zip", with: data.fetch("zip")}
  end

  def container_attribute
    'teacher-state'
  end

  def populate_first_state(value)
    select_filter("id_teacher_state", value)
  end

  def populate_second_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

  def required_fields
    [0,1,2,3,4,5,6,7,8,9,11]
  end
  
end

