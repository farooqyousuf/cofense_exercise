require_relative '../base_classes/error_messages.rb'

class StudentCreds < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
      if populate
       populate_fields(data_for(:experian_user))
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
    #NSC requires a valid ssn to end with a 1 in their test env
    random_ssn = Faker::Number.number(3)
    %w(social social_confirm).each do |field|
      fill_in field, :with => "#{random_ssn}1"
    end
  end

  def required_fields
    [0,2,3,4,5,6]
  end

end

