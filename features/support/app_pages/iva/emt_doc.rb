require_relative '../base_classes/error_messages.rb'

class DocEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

   def verify(populate: true, dupe: false)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    choose("emt_level_state")
    populate_first_state("Wyoming")

      if populate
        data = data_for(:experian_user)
          if dupe
            populate_fields(data: data_for(:fail_experian))
            click_verify_button
          else
            populate_fields(data: data)
            sleep 5
            click_verify_button
            attach_doc
          end
      end

     if dupe == false
      click_verify_button
    end
   end

  def populate_fields(data:)
    %w(first_name last_name birth_date social social_confirm street city zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
    populate_second_state("Wyoming")
  end

  def container_attribute
    "emt"
  end

  def populate_first_state(value)
    select_option(container_attribute, "#s2id_emt_state", value)
  end

  def populate_second_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

  def required_fields
    [0,1,2,3,4,5,6,7]
  end
end
