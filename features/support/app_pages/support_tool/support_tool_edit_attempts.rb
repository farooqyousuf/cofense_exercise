require_relative "../base_classes/js_alerts"

class SupportToolEditAttempts < IDmeBase

include PageManagement
include JavascriptAlerts
include ErrorMessages

  def initialize
    super(FigNewton.support_tool.waiting_attempts)
  end

  def edit_attempt(type: "none")

    case type
    when "military"
      update_doc_type("NARA Request")
      update_subgroup("Retiree")
      update_dob("verification_attempt_service_member_birth_date")
      %w(verification_attempt_service_member_first_name verification_attempt_service_member_last_name).each do |field|
        update_property(field)
      end
    when "emt state lookup"
      update_dob("verification_attempt_birth_date")
      update_zip("#verification_attempt_emt_zip")
      update_state("verification_attempt_emt_state", "CA")
      %w(verification_attempt_first_name verification_attempt_last_name verification_attempt_emt_number verification_attempt_emt_city verification_attempt_emt_county).each do |field|
        update_property(field)
      end
    when "remove military name"
      %w(verification_attempt_service_member_first_name verification_attempt_service_member_last_name).each do |field|
        remove_value(field)
      end
    when "remove emt state lookup"
      %w(verification_attempt_first_name verification_attempt_last_name verification_attempt_emt_number verification_attempt_emt_county verification_attempt_emt_zip).each do |value|
        remove_value(value)
      end
    end

    accept_attempt
  end

  def update_doc_type(doc_type)
    select_from_menu("#select2-verification_attempt_document_attributes_document_type_id-container", doc_type)
  end

  def update_subgroup(subgroup)
    select_from_menu("#select2-verification_attempt_subgroup_id-container", subgroup)
  end

  def update_state(state_id, state)
    select(state, :from => state_id)
  end

  def update_dob(dob_id)
    page.execute_script("document.getElementById('#{dob_id}').removeAttribute('readonly')")
    find("##{dob_id}").set "01/01/1911"
  end

  def update_zip(zip_id)
    find(zip_id).set "12345-1111"
  end

  def update_property(field)
    original_property = page.find("##{field}").value
    fill_in(field, :with => "#{original_property}-Updated")
  end

  def remove_value(field)
    original_value = page.find("##{field}").value
    fill_in(field, :with => " ")
  end

  def select_from_menu(element, value)
    find(element).click
    find("li", :text => value).click
  end

  def accept_attempt
    find("#verification_attempt_decision_accept").click
    click_button("Update")
  end

  def compare_expected_and_actual_user_property_values(type: nil, last_name: "Gentz", first_name: "Sue", city: "Emporia", county: "Loudoun")
    case type
    when "military"
      updated_subgroup = "Retiree"
      last_name_label = "service_member_last_name"
      first_name_label = "service_member_first_name"
      verify_updated_subgroup(updated_subgroup)
    when "emt state lookup"
      first_name_label = "first_name"
      last_name_label = "last_name"
      verify_appended_updated_property("emt_city", city)
      verify_appended_updated_property("emt_county", county)
      verify_appended_updated_property("emt_number", "FJDL2")
      verify_set_updated_property("emt_zip", "12345-1111")
      verify_set_updated_property("emt_state", "CA")
    end

    verify_appended_updated_property(last_name_label, last_name)
    verify_appended_updated_property(first_name_label, first_name)
  end

  def verify_appended_updated_property(label, updated_property)
    collected_field = find("label[for='#{label}']").find(:xpath, "../..").text
    collected_field.should == "#{label.capitalize.gsub("_", " ")}\n#{updated_property}-Updated"
  end

  def verify_set_updated_property(label, updated_property)
    collected_field = find("label[for='#{label}']").find(:xpath, "../..").text
    collected_field.should == "#{label.capitalize.gsub("_", " ")}\n#{updated_property}"
  end

  def verify_updated_subgroup(group)
    collected_subgroup = find("td.key", :text => "Subgroup").find(:xpath, "..").text
    collected_subgroup.should == "Subgroup #{group}"
  end
end
