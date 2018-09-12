require_relative '../base_classes/error_messages.rb'

class IVAEmployee < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, email_type: "none")
    if populate
      data = data_for(:government)
        case email_type
        when "unique"
          populate_fields(data: data, email: "capybara+"+"#{Time.now.strftime("%m%d%y_%I%M%S")}"+"@id.me")
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
    %w[verification_first_name verification_last_name verification_birth_date].each do |field|
      2.times {fill_in field, :with => data.fetch(field)} #twice b/c dob doesn't get filled first time occasionally
    end

    %w[email verification_email_confirmation].each do |field|
      fill_in field, :with => email, :match => :prefer_exact
    end
  end

  def required_fields
    [0, 1, 2, 3, 4, 5, 6, 7, 8]
  end

  def user_properties_levels
    [2, 2, 2, 2, 2, 2]
  end

end
