require_relative '../base_classes/error_messages.rb'

class StudentCreds < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: "none")

      if populate

        build_unique_info #info for unique and denied users
        unique_data = data_for(:student_creds) #info for unique and duplicate users
        denied_data = data_for(:student_creds_denied) #info for denied user


        case type
        when "unique"
          populate_fields(data: unique_data)
        when "denied"
          populate_fields(data: denied_data)
        when "duplicate"
          populate_fields(school: data.fetch("school"),
                          fname:  data.fetch("dupe_fname"),
                          lname:  data.fetch("dupe_lname"),
                          dob:    data.fetch("dob"),
                          ssn:    data.fetch("dupe_ssn"))
        end
      end
    click_continue
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

  def populate_fields(data:)
    populate_school(data.fetch("school"))
    %w(verification_first_name verification_last_name verification_social verification_social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_birth_date).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
  end

  def click_verify_by_creds
    click_link("Verify using your student credentials")
  end

  def populate_school(school)
    search_option(container_attribute, ".schools", school)
  end

  def required_fields
    [0,2,3,4,5,6]
  end

end

