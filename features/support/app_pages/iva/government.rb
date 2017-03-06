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
    click_verify_button
  end

  def populate_fields(data:, email:)
    %w(first_name last_name city county birth_date).each do |field|
      2.times {fill_in field, :with => data.fetch(field)} #twice b/c dob doesn't get filled first time occasionally
    end
    escape_google_address_autocomplete(%w(#city #county))

    %w(email email_confirmation).each do |field|
      fill_in field, :with => email
    end
    populate_state(data.fetch("state"))
    populate_affiliation(data.fetch("affiliation"))
    sleep 1
    populate_agency(data.fetch("agency"))
  end

  def container_attribute
    'government-email'
  end

  def populate_affiliation(affiliation)
    select_option(container_attribute, ".government-affiliation", affiliation, index=0)
  end

  def populate_agency(agency)
    search_option(container_attribute, ".government-agency", agency)
  end

  def populate_state(state)
    select_option(container_attribute, ".state-select", state, index=0)
  end

  def required_fields
    [0, 1, 2, 3, 5, 6, 7, 9, 10]
  end

end
