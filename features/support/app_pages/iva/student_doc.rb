require_relative '../base_classes/error_messages.rb'

class StudentDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
      if populate
        populate_fields(data_for(:experian_user))
      end
    click_verify_button
      if populate
        sleep 3
        populate_doc
        attach_doc
        click_verify_button
      end
  end

  def populate_fields(data)
    populate_school(data.fetch("school"))
    
    %w(first_name last_name street city social social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end
      
    %w(birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
    
    populate_state(data.fetch("state"))
  end

  def container_attribute
    'student-document'
  end

  #dupe method found in school creds, maybe add to a module
  def populate_school(school)
    search_option(container_attribute, ".schools", school)
  end

  def populate_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

  def populate_doc
     select_filter("id_document_type_id", "Student ID")
  end

  def required_fields
    [0,2,3,4,5,6,7,8,9,11]
  end
end

