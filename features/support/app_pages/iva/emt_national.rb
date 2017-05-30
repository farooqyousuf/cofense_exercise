require_relative '../base_classes/error_messages.rb'

class NationalEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

   def verify(populate: true, type: nil)
      find("[data-option=#{container_attribute}]").find(".verification-header").click
      choose("emt_level_national")

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

      click_verify_button
   end

  def populate_fields(data:)
      %w(first_name last_name birth_date registry_number).each do |field|
        2.times {fill_in field, :with => data.fetch(field)}
      end
  end

  def container_attribute
      "emt"
  end

  def required_fields
      [0,1,2,3]
  end
end
