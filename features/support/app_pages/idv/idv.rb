require_relative '../base_classes/error_messages.rb'

class IDV < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(action: "none", document: "none")

    case action
    when "successfully verify confirm iO"
      upload_ids(front_id: "png", back_id: "idv")
      click_button("Look Good?")
      confirm_io_callback(mocked_result: "Success")
    when "successfully verify au10tix"
      upload_ids(front_id: "idv", back_id: "png")
      click_button("Look Good?")
      confirm_io_callback(mocked_result: "Failure")
    end

    idv_user = data_for(:experian_user3)
    populate_fields(data: idv_user)

    check("idme_verification_identity_accepts_fcra")
    click_button("Verify my information")
    click_link("Verify")
  end

  def click_verify_drivers_license_link
    click_button("Verify using my driver's license")
  end

  def upload_ids(front_id:, back_id:)
    click_button("Upload from my computer")
    all(".photos-container")[0].click
    attach_unique_doc(document: front_id)
    sleep 2
    click_button("Upload")
    all(".photos-container")[1].click
    attach_unique_doc(document: back_id)
    click_button("Upload")
  end

  def confirm_io_callback(mocked_result: mocked_result)
    click_button("#{mocked_result} Callback")
  end

  def accept_confirm_io_callback
    binding.pry
    # click_button("Confirmio Error Callback")
  end

  def populate_fields(data:)
    populate_phone(data.fetch("mobile_phone"))
    fill_in("social", :with => data.fetch("social"))
    fill_in("social_confirm", :with => data.fetch("social_confirm"))
    click_button("Submit SSN")
  end

  def populate_phone(mobile_phone)
    choose("phone_type_smart_phone")
    sleep 1
    find("#phone_type_smart_phone").click
    fill_in("mobile_phone", :with => mobile_phone)
    click_button("Submit phone")
  end

  def user_properties_levels
    [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  end

  def set_up_multifactor
    data = data_for(:experian_user3)

    click_link("Voice or Text Message")
    fill_in "multifactor_phone", :with => data.fetch("mobile_phone")

    3.times {
      sleep 1
      click_continue
    }
  end
end
