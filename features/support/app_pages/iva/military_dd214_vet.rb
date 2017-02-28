require_relative '../base_classes/error_messages.rb'

class DD214 < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation: "Veteran", populate: true, type: "none", method: "none")
    find("[data-option='dd214-request']").find(".verification-header").click
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
        populate_signature
        populate_branch
        populate_officer
        populate_component
        populate_checkboxes
        populate_fields(data_for(data_set))
      when "dupe"
        #work in progress
      end

      #first and last name for user
      if ["Next of kin deceased veteran", "Legal guardian"].include?(affiliation)
        %w(first_name last_name birth_date).each do |field|
          2.times {fill_in field, :with => (data_for(:military_dd214).fetch(field))}
        end
      end
    end

    click_verify_button
  end

  def populate_fields(data)
    #information for service member
    %w(service_member_first_name service_member_last_name social social_confirm birth_place).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(service_member_birth_date date_entered date_released).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
  end

   def container_attribute
    'dd214-request'
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".dd214-affiliation", value, index=0)
  end

  def populate_signature
    page.execute_script("document.getElementById('signature').value = '#{data_for(:military_dd214)["signature"]}';")
  end

  def populate_branch
    select_option(container_attribute, ".dd214-branch", "Air Force", index=0)
  end

  def populate_officer
    select_option(container_attribute, ".dd214-officer", "Officer", index=0)
  end

  def populate_component
    select_option(container_attribute, ".dd214-component", "Active Duty", index=0)
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
    [0, 1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 16, 17]
  end

end
