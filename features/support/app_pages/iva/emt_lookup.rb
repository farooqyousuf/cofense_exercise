require_relative '../base_classes/error_messages.rb'

class LookupEMT < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate: true, type: nil)
    find("[data-option=#{container_attribute}]").find(".verification-header").click
    choose("emt_level_state")
    populate_first_state("Alaska")

    if populate

      data = data_for(:experian_user) #info for unique and duplicate user
      denied_data = data_for(:fail_experian) #info for denied user

      case type
      when "unique", "duplicate"
        populate_fields(data: data)
      when "denied"
        populate_fields(data: denied_data)
      end
    end

    click_verify_button
  end

  def populate_fields(data:)
    %w(first_name last_name social social_confirm street city emt_city emt_county).each do |field|
        fill_in field, :with => data.fetch(field)
    end

    %w(birth_date zip emt_zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    populate_second_state("Kansas", index=0)
  end

  def container_attribute
    "emt"
  end

  def unique_id
    "#s2id_emt_state"
  end

  def required_fields
    [0,1,2,3,4,5,6,7,9,10,11,12]
  end

end


