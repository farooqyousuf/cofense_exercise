require_relative '../base_classes/error_messages.rb'

class IDVPhone < IDmeBase

  include IVABase
  include IDVBase
  include Capybara::DSL
  include ErrorMessages

    def verify(action: "none", document: "none", populate: "none")

    data = data_for(:docs)

    case action
    when "verify with Confirm.io"
      populate = true
      front_id = data.fetch("png")
      back_id = data.fetch("idv")
      mocked_result = "Success"
    end

    upload_front_id(front_id: front_id)
    upload_back_id(back_id: back_id)
    click_button("Look Good?")
    confirm_io_callback(mocked_result: mocked_result)

    if populate == true
      idv_user = data_for(:experian_user3)
      populate_fields(data: idv_user)

      check("idme_verification_identity_accepts_fcra")
      click_button("Verify my information")
      click_link("Verify")
    end
  end

  def user_properties_levels
    [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  end
end
