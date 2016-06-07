require_relative '../base_classes/error_messages.rb'

class Police < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)

    find("[data-option=#{container_attribute}]").find(".verification-header").click

    if populate
      populate_fields(data_for(:experian_user))
      click_verify_button
      sleep 5
      attach_doc(3)
    end

    click_verify_button

  end

  def populate_fields(data)
    populate_first_state(data.fetch("state"))

    %w(first_name last_name social social_confirm street city zip).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    populate_second_state(data.fetch("state"))
  end


  def populate_first_state(value)
    search_option(container_attribute, "#s2id_police_state", value)
  end

  def populate_second_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

  def container_attribute
    "police"
  end

  def required_fields
    [0,2,3,4,5,6,7,8,9,11]
  end

end
