require_relative '../base_classes/error_messages.rb'

class MilitaryEmail < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation:, populate: true, type: nil)
    click_link("Verify using a .mil e-mail address")
    click_link("Begin")
    populate_affiliation(affiliation)

    if populate

      data = data_for(:mil_email) #info for duplicate user
      build_unique_info #info for unique and denied users

      case type
      when "unique"
        populate_fields(email: @unique_email,
                        fname: @unique_first_name,
                        lname: @unique_last_name,
                        dob:   @dob)
      when "denied"
        populate_fields(email: data.fetch("denied_email"),
                        fname: @unique_first_name,
                        lname: @unique_last_name,
                        dob:   @dob)
      when "duplicate"
        populate_fields(email: data.fetch("dupe_email"),
                        fname: data.fetch("dupe_fname"),
                        lname: data.fetch("dupe_lname"),
                          dob: data.fetch("dupe_dob"))
      end

      if ["Military Family", "Military Spouse"].include?(affiliation)
        fill_in "verification_first_name", :with => Faker::Name.first_name
        fill_in "verification_last_name", :with => Faker::Name.last_name
        2.times {fill_in "verification_birth_date", :with => @dob}
        select_option(container_attribute, "#select2-chosen-3", "Veteran", index=0)
      end

    end

    click_continue
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".field-group", value, index=0)
  end

  def build_unique_info
    @unique_first_name = Faker::Name.first_name
    @unique_last_name = Faker::Name.last_name
    @dob = Faker::Date.birthday.strftime("%m%d%Y")
    @unique_email = @unique_last_name+"#{rand(6 ** 8)}"+"@id.me"
  end

  def populate_fields(email:, fname:, lname:, dob:)
    fill_in "verification_service_member_first_name", :with => fname
    fill_in "verification_service_member_last_name", :with => lname
    2.times {fill_in "verification_service_member_birth_date", :with => dob}
    %w(email verification_email_confirmation).each do |field|
      fill_in field, :with => email
    end
  end

  def container_attribute
    'military-email'
  end

  def required_fields
    [0, 1, 2, 3, 4, 5]
  end

end
