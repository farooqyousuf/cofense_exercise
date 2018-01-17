
require_relative '../base_classes/error_messages.rb'

class IDV < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify_with_phone(action: "none", document: "none", populate: true)

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

    close_current_browser
    use_original_tab

    confirm_io_callback(mocked_result: mocked_result)

    if populate == true
      idv_user = data_for(:experian_user3)
      populate_fields_phone(data: idv_user)

      check("idme_verification_identity_accepts_fcra")
      click_button("Verify my information")
      click_button("Allow")
    end
  end

   def verify_with_computer(action: "none", document: "none", populate: "none")

    data = data_for(:docs)

    case action
    when "verify via Confirm.io"
      populate = true
      front_id = data.fetch("png")
      back_id = data.fetch("idv")
      mocked_result = "Success"
    when "verify via AU10TIX"
      populate = true
      front_id = data.fetch("idv")
      back_id = data.fetch("png")
      mocked_result = "Failure"
    when "fail documentation"
      populate = false
      front_id = data.fetch("png")
      back_id = data.fetch("png")
      mocked_result = "Failure"
    end

    upload_front_id(front_id: front_id)
    upload_back_id(back_id: back_id)
    click_button("Look Good?")
    confirm_io_callback(mocked_result: mocked_result)

    if populate == true
      idv_user = data_for(:experian_user3)
      populate_fields_computer(data: idv_user)

      check("idme_verification_identity_accepts_fcra")
      click_button("Verify my information")
      click_link("Verify")
    end
  end

  def user_properties_levels
    [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  end
end
