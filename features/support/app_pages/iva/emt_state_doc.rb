require_relative '../base_classes/error_messages.rb'

class StateDocEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

   def verify(populate: true, type: "none")
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    choose("emt_level_state")
    populate_first_state("Wyoming", unique_id)

      if populate

        unique_data = data_for(:experian_user) #info for unique and duplicate users
        denied_data = data_for(:fail_experian) #info for denied user

        case type
        when "unique", "duplicate"
          populate_fields(data: unique_data)
        when "denied"
          populate_fields(data: denied_data)
        end
      end

      click_verify_button

      if type == "unique"
        attach_doc
        click_verify_button
      end
   end

  def populate_fields(data:)
    %w(first_name last_name birth_date social social_confirm street city zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
    populate_second_state("Wyoming", index=0)
  end

  def container_attribute
    "emt"
  end

  def unique_id
    "#s2id_emt_state"
  end

  def required_fields
    [0,1,2,3,4,5,6,7]
  end
end