require_relative '../base_classes/error_messages.rb'

class LookupEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    choose("emt_level_state")
    populate_first_state("Alaska")

    if populate
      populate_fields(data_for(:))
    end
  end

  def populate_fields(data)
     %w(first_name last_name birth_date social social_confirm street city zip emt_city emt_county emt_zip emt_number).each do |field|
        fill_in field, :with => data.fetch(field)
    end
    populate_second_state("Alaska")
  end

  def container_attrbute
    "emt"
  end

  def populate_first_state(value)
    select_option(container_attribute, "#s2id_emt_state", value)
  end

  def populate_second_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

end


