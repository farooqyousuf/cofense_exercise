require_relative '../base_classes/error_messages.rb'

class StudentCreds < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
      if populate
       populate_fields(data_for(:student_creds))
      end
    click_verify_button
  end

  def container_attribute
    "clearinghouse"
  end

  def populate_fields(data)
    populate_school(data.fetch("school"))
    fill_in "first_name", with: Faker::Name.first_name
    fill_in "last_name", with: Faker::Name.last_name
    2.times {fill_in "birth_date", with: Faker::Date.birthday.strftime("%m%d%Y")}
    populate_ssn
  end

  def populate_school(school)
    search_option(container_attribute, ".schools", school)
  end

  def populate_ssn
    random_ssn = "#{rand(3 ** 3).to_s.rjust(3,'0')}1"
    fill_in "social", with: random_ssn
    fill_in "social_confirm", with: random_ssn
  end

  def required_fields
    [0,2,3,4,5,6]
  end

end

