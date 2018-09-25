require_relative '../base_classes/error_messages.rb'

class IDVKba < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify_via_kba(action: "none", populate: "none")
    idv_user = data_for(:experian_user3)
    fail_idv_user = data_for(:experian_user4)

    case action
    when "verify", "fail kba", "submit dupe attempt", "submit information"
      populate = true
      user = idv_user
    when "fail experian"
      populate = true
      user = fail_idv_user
    end

    if populate == true
      populate_fields_kba(data: user)
      populate_fields_computer(data: user)
      unless action == "submit information"
        check_fcra_box
        click_button("Verify my information")
        sleep 3
      end
    end
  end

  def submit_personal_info_form
    populate_fields_personal_info(data: data_for(:experian_user3))
  end

  def submit_address_info_form
    populate_fields_address(data: data_for(:experian_user3))
  end
end
