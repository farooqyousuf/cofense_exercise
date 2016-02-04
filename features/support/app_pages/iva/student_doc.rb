require_relative '../base_classes/error_messages.rb'

class StudentDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
      if populate
        populate_fields(data_for(:student_creds))
      end
    click_verify_button
    sleep 2
    populate_doc
    binding.pry
  end

  def populate_fields(data)
    populate_school(data.fetch("school"))
    fill_in "first_name", with: data.fetch("first_name")
    fill_in "last_name", with: data.fetch("last_name")
    2.times {fill_in "birth_date", with: data.fetch("dob")}
    fill_in "street", with: data.fetch("street")
    fill_in "city", with: data.fetch("city")
    fill_in "social", with: data.fetch("ssn")
    fill_in "social_confirm", with: data.fetch("ssn")
    2.times {fill_in "zip", with: data.fetch("zip")}
    populate_state(data.fetch("state"))
  end

  def container_attribute
    'student-document'
  end

  def populate_school(school)
    search_option(container_attribute, ".schools", school)
  end

  def populate_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

  def populate_doc
     select_filter("id_document_type_id", "Student ID")
  end
end

