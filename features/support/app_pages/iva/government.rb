require_relative '../base_classes/error_messages.rb'

class IVAGovernment < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, email_type: "none")
    if populate
      data = data_for(:government)
        case email_type
        when "unique"
          populate_fields(data: data, email: "capybara+"+"#{rand(6 ** 8)}"+"@id.me")
        when "dupe"
          populate_fields(data: data, email: data.fetch("dupe_email"))
        when "denied"
          populate_fields(data: data, email: data.fetch("denied_email"))
        when "none"
          puts "No email type specified"
        end
    end
    click_continue
  end

  def populate_fields(data:, email:)
    %w[verification_first_name verification_last_name city county verification_birth_date].each do |field|
      2.times {fill_in field, :with => data.fetch(field)} #twice b/c dob doesn't get filled first time occasionally
    end

    escape_google_address_autocomplete(%w(#city #county))
    populate_state(data.fetch("state"))

    %w[email verification_email_confirmation].each do |field|
      fill_in field, :with => email, :match => :prefer_exact
    end

    populate_affiliation(data.fetch("affiliation"))
    sleep 1
    populate_agency(data.fetch("agency"))
  end

  def populate_affiliation(affiliation)
    select_option("#s2id_verification_subgroup_id", affiliation)
  end

  def populate_agency(agency)
    select_option("#s2id_verification_department_id", agency)
  end

  def populate_state(state)
    select_option("#s2id_state", state)
  end

  def required_fields
    [0, 1, 2, 3, 4, 5, 6, 7, 8]
  end

  def govt_user_and_verif_properties
    [1, 1, 1, 1, 1, 1, 1, 1]
  end

end
