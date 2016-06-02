require_relative '../base_classes/error_messages.rb'

class MilitaryDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation:, populate: true, dupe: false)
    find("[data-option=#{container_attribute}]").find(".verification-header").click

    populate_affiliation(affiliation)

    if populate
      populate_fields(data_for(:mil_doc))

      if ["Military Family", "Military Spouse"].include?(affiliation)
        %w(first_name last_name birth_date).each do |field|
          2.times {fill_in field, :with => (data_for(:mil_doc).fetch(field))}
        end
        select_option(container_attribute, "#s2id_service_subgroup_id", "Veteran")
      end

      click_verify_button

      #attach dd214 doc
      populate_dd214_type("DD214 - Other")
      attach_doc
    end

    click_verify_button
  end

  def populate_fields(data)
    #fill reqd fields
    %w(service_member_first_name service_member_last_name social social_confirm street city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(service_member_birth_date zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end

    populate_state(data.fetch("state"))
  end

  def container_attribute
    "military-document"
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".military-affiliation", value)
  end

  def populate_state(value)
    select_option(container_attribute, "#s2id_state", value)
  end

  def populate_dd214_type(value)
    wait_for_ajax
    sleep 2
    select_option(container_attribute, "#s2id_document_type_id", value)
  end

  def required_fields
    [0,1,2,3,4,5,6,7,9]
  end

end
