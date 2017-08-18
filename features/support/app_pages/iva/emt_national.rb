require_relative '../base_classes/error_messages.rb'

class NationalEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

   def verify(populate: true, type: nil)
      if populate

        data = data_for(:emt_national) #info for unique and duplicate user
        denied_data = data_for(:denied_emt_national) #info for denied user
        expired_data = data_for(:expired_emt_national)

        case type
        when "unique", "duplicate"
          populate_fields(data: data)
        when "denied"
          populate_fields(data: denied_data)
        when "expired"
          populate_fields(data: expired_data)
        end
      end

      click_continue
   end

  def populate_fields(data:)
      %w(verification_first_name verification_last_name verification_birth_date verification_registry_number).each do |field|
        2.times {fill_in field, :with => data.fetch(field)}
      end
  end

  def container_attribute
      "emt"
  end

  def required_fields
      [0,1,2,3]
  end

  def click_verify_emt_national_link
    click_link("Verify as a certified EMT / Paramedic")
    click_link("I am nationally certified")
  end

  def user_properties_levels
    [1, 1, 1, 1, 1, 1]
  end

end
