require_relative '../base_classes/error_messages.rb'

class MilitaryEmail < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages


  def verify(affiliation:, populate: true, type:)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    populate_affiliation(affiliation)

    if populate

      data = data_for(:mil_email) #info for duplicate user
      build_fake_info #info for unique and denied users

      case type
      when "unique"
        populate_fields(email: @unique_email,
                        fname: @fake_first_name,
                        lname: @fake_last_name,
                        dob:   @dob)
      when "denied"
        populate_fields(email: "farooq@id.me",
                        fname: @fake_first_name,
                        lname: @fake_last_name,
                        dob:   @dob)
      when "duplicate"
        populate_fields(email: data.fetch("dupe_email"),
                        fname: data.fetch("dupe_fname"),
                        lname: data.fetch("dupe_lname"),
                          dob: data.fetch("dupe_dob"))
      end

      if ["Service Member", "Military Supporter"].include?(affiliation)
        find(".checkbox").click
      end

      if ["Military Family", "Military Spouse"].include?(affiliation)
        %w(first_name last_name).each do |field|
          fill_in field, :with => Faker::Name.send(field)
        end
        2.times {fill_in "birth_date", :with => "01/01/1985"}
        select_option(container_attribute, "#s2id_service_subgroup_id", "Veteran")
      end

    end

    click_verify_button
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".military-affiliation", value)
  end

  def build_fake_info
    @fake_first_name = Faker::Name.first_name
    @fake_last_name = Faker::Name.last_name
    @unique_email = @fake_last_name+"#{rand(6 ** 8)}"+"@id.me"
    @dob = "01/05/1985"
  end

  def populate_fields(email:, fname:, lname:, dob:)
    fill_in "service_member_first_name", with: fname
    fill_in "service_member_last_name", with: lname
    2.times {fill_in "service_member_birth_date", with: dob}
    %w(email email_confirmation).each do |field|
      2.times {fill_in field, :with => email}
    end
  end

  def container_attribute
    'military-email'
  end

  def required_fields
    [0, 1, 2, 3, 4, 5]
  end

end

