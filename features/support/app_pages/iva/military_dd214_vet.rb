require_relative '../base_classes/error_messages.rb'

class DD214 < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation: "Veteran", populate: true, type: "none", method: "none")
    #find("[data-option='dd214-request']").find(".verification-header").click
    populate_affiliation(affiliation)

    if method == "SCRA"
      data_set = :dd214_via_scra
    else
      data_set = :military_dd214
    end

    if populate

      case type
      when "unique", "denied"
        sleep 2
        populate_branch
        populate_officer
        populate_component
        populate_checkboxes
        populate_fields(data_for(data_set))
        populate_signature
      when "dupe"
        #work in progress
      end

      #first and last name for user
      if ["Next of kin deceased veteran", "Legal guardian"].include?(affiliation)
        %w(verification_first_name verification_last_name verification_birth_date).each do |field|
          2.times {fill_in field, :with => (data_for(:military_dd214).fetch(field))}
        end
      end
    end

    click_continue
  end

  def populate_fields(data)
    #information for service member
    %w(verification_service_member_first_name verification_service_member_last_name
      verification_social verification_social_confirm verification_birth_place).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(verification_service_member_birth_date verification_date_entered verification_date_released).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
  end

  def container_attribute
    'dd214-request'
  end

  def populate_affiliation(value)
    select_option("#s2id_verification_affiliation", value)
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
    all(".checkbox")[0].click
  end

  def liable_checkbox
    all(".checkbox")[1].click
  end

  def verify_checkbox
    all(".checkbox")[2].click
  end

  def populate_checkboxes
    release_checkbox
    liable_checkbox
    verify_checkbox
  end

  def required_fields
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def click_verify_by_dd214_link
    click_link("Verify by requesting your DD214")
  end

end
