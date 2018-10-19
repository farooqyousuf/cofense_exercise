require_relative '../base_classes/error_messages.rb'

class DD214 < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation: "Veteran", populate: true, type: "none", method: "none")

    if method == "SCRA"
      data_set = :dd214_via_scra
    else
      data_set = :military_dd214
    end

    if populate
      case type
      when "unique", "denied", "dupe"
        populate_fields(data_for(data_set))
        populate_component
        populate_branch
        populate_officer
        populate_checkboxes
        populate_signature
      else fail("User type not found")
      end
    end

    click_continue
  end

  def populate_fields(data)
    #information for service member
    %w(verification_service_member_first_name verification_service_member_last_name
      verification_social verification_birth_place).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_service_member_birth_date verification_date_entered verification_date_released).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
  end

  def container_attribute
    'dd214-request'
  end

  def populate_signature
    page.execute_script("document.getElementById('verification_signature').value = '#{data_for(:military_dd214)["jSignature"]}';")
  end

  def populate_branch
    select_option("#s2id_verification_service_branch_id", "Air Force")
  end

  def populate_officer
    select_option("#s2id_verification_officer_or_enlisted", "Officer")
  end

  def populate_component
    select_option("#s2id_verification_service_component", "Active Duty")
  end

  def release_checkbox
    find("label[for=verification_auth_release]").click
  end

  def liable_checkbox
    find("label[for=verification_liable_ack]").click
  end

  def verify_checkbox
    find("label[for=verification_verify_info]").click
  end

  def populate_checkboxes
    release_checkbox
    liable_checkbox
    verify_checkbox
  end

  def required_fields
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def vet_scra_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1, 1]
  end

  def vet_doc_user_properties_levels
    [1, 1, 1, 1, 1, 1, 1, 1, 1]
  end

  def click_verify_by_dd214_link
    click_link("Verify by requesting your DD214")
  end

end
