require_relative '../base_classes/error_messages.rb'

class MilitaryDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation:, populate: true, type: "none")
    find("[data-option=#{container_attribute}]").find(".verification-header").click

    populate_affiliation(affiliation)

    if populate

      unique_data = data_for(:mil_doc) #info used for unique and dupe users
      denied_data = data_for(:fail_experian) #info used for denied users

      case type
      when "unique", "duplicate"
        populate_fields(data: unique_data)
      when "denied"
        populate_fields(data: denied_data)
      end

      if ["Military Family", "Military Spouse"].include?(affiliation)
        %w(first_name last_name birth_date).each do |field|
          2.times {fill_in field, :with => (data_for(:mil_doc).fetch(field))}
        end
        select_option(container_attribute, "#s2id_service_subgroup_id", "Veteran", index=0)
      end
    end

    click_verify_button
    sleep 5

    if ((type == "unique") && (page.has_no_text?("We’re sorry, but we are unable to verify your credentials with the information you provided.")))
      #attach dd214 doc
      populate_dd214_type("DD214 - Other")
      attach_doc
      click_verify_button
    end
  end

  def populate_fields(data:)
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
    select_option(container_attribute, ".military-affiliation", value, index=0)
  end

  def populate_state(value)
    select_option(container_attribute, "#s2id_state", value, index=0)
  end

  def populate_dd214_type(value)
    wait_for_ajax
    sleep 2
    select_option(container_attribute, "#s2id_document_type_id", value, index=0)
  end

  def required_fields
    [0,1,2,3,4,5,6,7,9]
  end

end
