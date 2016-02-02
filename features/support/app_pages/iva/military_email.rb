require_relative '../base_classes/error_messages.rb'

class MilitaryEmail < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages


  def verify(affiliation, populate = true)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    populate_affiliation(affiliation)
    
    if populate
      populate_fields

      if ["Service Member", "Military Supporter"].include?(affiliation)
        find(".checkbox").click
      end

      if ["Military Family", "Military Spouse"].include?(affiliation)
        fill_in "first_name", with: Faker::Name.first_name
        fill_in "last_name", with: Faker::Name.last_name
      end
    end

    click_verify_button
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".military-affiliation", value)
  end 

  def populate_fields
    fake_first_name = Faker::Name.first_name
    fake_last_name = Faker::Name.last_name
    unique_email = fake_last_name+"#{rand(6 ** 8)}"+"@id.me"

    fill_in "email", with: unique_email
    fill_in "email_confirmation", with: unique_email
    fill_in "service_member_first_name", with: fake_first_name
    fill_in "service_member_last_name", with: fake_last_name
    2.times {fill_in "birth_date", with: "01/05/1985"}
  end

  def container_attribute
    'military-email'
  end

  def required_fields
    [0, 1, 2, 3, 4, 5]
  end

end

