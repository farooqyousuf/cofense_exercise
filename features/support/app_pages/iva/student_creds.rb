require_relative '../base_classes/error_messages.rb'

class StudentCreds < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")
    find("[data-option=#{container_attribute}]").find(".verification-header").click

      if populate

        build_unique_info #info for unique and denied users
        data = data_for(:student_creds) #info for denied and dupe users

        case type
        when "unique"
          populate_fields(school: data.fetch("school"),
                          fname:  @unique_first_name,
                          lname:  @unique_last_name,
                          dob:    @dob,
                          ssn:    @random_ssn)
        when "denied"
          populate_fields(school: data.fetch("school"),
                          fname:  data.fetch("fname"),
                          lname:  data.fetch("lname"),
                          dob:    data.fetch("dob"),
                          ssn:    data.fetch("denied_ssn"))
        when "duplicate"
          populate_fields(school: data.fetch("school"),
                          fname:  data.fetch("dupe_fname"),
                          lname:  data.fetch("dupe_lname"),
                          dob:    data.fetch("dob"),
                          ssn:    data.fetch("dupe_ssn"))
        end
      end
    click_verify_button
  end

  def container_attribute
    "clearinghouse"
  end

  def build_unique_info
    #NSC requires a valid ssn to end with a 1 in their test env
    @unique_first_name = Faker::Name.first_name
    @unique_last_name = Faker::Name.last_name
    @dob = Faker::Date.birthday.strftime("%m%d%Y")
    @random_ssn = "#{Faker::Number.number(3)}1"
  end

  def populate_fields(school:, fname:, lname:, dob:, ssn:)
    populate_school(school)
    fill_in "first_name", :with => fname
    fill_in "last_name", :with => lname
    2.times {fill_in "birth_date", :with => dob}
    %w(social social_confirm).each do |field|
      fill_in field, :with => ssn
    end
  end

  def populate_school(school)
    search_option(container_attribute, ".schools", school)
  end

  def required_fields
    [0,2,3,4,5,6]
  end

end

