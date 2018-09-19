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
      update_service_member_name
      update_service_member_dob
    when "remove military name"
      remove_value("verification_attempt_service_member_first_name")
      remove_value("verification_attempt_service_member_last_name")
    end

    accept_attempt
  end

  def update_doc_type(doc_type)
    select_from_menu("#select2-verification_attempt_document_attributes_document_type_id-container", doc_type)
  end

  def update_subgroup(subgroup)
    select_from_menu("#select2-verification_attempt_subgroup_id-container", subgroup)
  end

  def update_service_member_name
    %w(verification_attempt_service_member_first_name verification_attempt_service_member_last_name).each do |field|
      original_value = page.find("##{field}").value
      fill_in(field, :with => "#{original_value}-Updated")
    end
  end

  def update_service_member_dob
    page.execute_script("document.getElementById('verification_attempt_service_member_birth_date').removeAttribute('readonly')")
    find("#verification_attempt_service_member_birth_date").set "01/01/1911"
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

  def compare_expected_and_actual_user_property_values(type: nil, last_name: "Gentz", first_name: "Sue")
    case type
    when "military"
      updated_subgroup = "Retiree"
      last_name_label = "service_member_last_name"
      first_name_label = "service_member_first_name"
    end

    verify_updated_subgroup(updated_subgroup)
    verify_updated_name(last_name_label, last_name)
    verify_updated_name(first_name_label, first_name)
  end


  def verify_updated_name(label, updated_name)
    collected_field = find("label[for='#{label}']").find(:xpath, "../..").text
    collected_field.should == "#{label.capitalize.gsub("_", " ")}\n#{updated_name}-Updated"
  end

  def verify_updated_subgroup(group)
    collected_subgroup = find("td.key", :text => "Subgroup").find(:xpath, "..").text
    collected_subgroup.should == "Subgroup #{group}"
  end
end
