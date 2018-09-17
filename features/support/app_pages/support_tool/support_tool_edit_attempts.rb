require_relative "../base_classes/js_alerts"

class SupportToolEditAttemps < IDmeBase

include PageManagement
include JavascriptAlerts

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

  def select_from_menu(element, value)
    find(element).click
    find("li", :text => value).click
  end

  def accept_attempt
    find("#verification_attempt_decision_accept").click
    click_button("Update")
  end

  def check_updated_user_properties
    # data = data_for(:experian_user2)
    # check_subgroup
    # check_first_name
    # check_last_name
    # check_birth_date
  end

  def check_subgroup
    # find("th", :text => "Subgroup")
    # all("td.value")
  end
end
