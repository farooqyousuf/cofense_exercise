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

      if populate
        sleep 5
        attach_doc
        click_verify_button
      end
  end

  def populate_fields(data)
    %w(first_name last_name social social_confirm street city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
    
    %w(teacher_city district school).each do |field|
      fill_in field, :with => Faker::Address.city
    end
    
    fill_in "teacher_number", with: Faker::Number.number(10)
    populate_second_state(data.fetch("state"))
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

