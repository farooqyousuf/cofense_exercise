require_relative '../base_classes/error_messages.rb'

class IDVKba < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify_via_kba(action: "none", populate: "none")
    idv_user = data_for(:experian_user3)
    fail_idv_user = data_for(:experian_user4)

    case action
    when "verify", "fail kba", "submit dupe attempt"
      populate = true
      user = idv_user
    when "fail experian"
      populate = true
      user = fail_idv_user
    end

    if populate == true
      populate_fields_kba(data: user)
      populate_fields_computer(data: user)
      check_fcra_box
      click_button("Verify my information")
      sleep 3
    end
  end
end
