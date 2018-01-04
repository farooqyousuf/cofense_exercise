require_relative '../base_classes/error_messages.rb'

class IDVPhone < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

    def verify(action: "none", document: "none", populate: "none")

    # data = data_for(:docs)

    # case action
    # when "verify via Confirm.io via"
    #   populate = true
    #   front_id = data.fetch("png")
    #   back_id = data.fetch("idv")
    #   mocked_result = "Success"
    # when "verify via AU10TIX"
    #   populate = true
    #   front_id = data.fetch("idv")
    #   back_id = data.fetch("png")
    #   mocked_result = "Failure"
    # when "fail documentation"
    #   populate = false
    #   front_id = data.fetch("png")
    #   back_id = data.fetch("png")
    #   mocked_result = "Failure"
    # end

    # upload_front_id(front_id: front_id)
    # upload_back_id(back_id: back_id)
    # click_button("Look Good?")
    # confirm_io_callback(mocked_result: mocked_result)

    # if populate == true
    #   idv_user = data_for(:experian_user3)
    #   populate_fields(data: idv_user)

    #   check("idme_verification_identity_accepts_fcra")
    #   click_button("Verify my information")
    #   click_link("Verify")
    # end
  end

  # def click_verify_drivers_license_link
  #   click_button("Verify using my driver's license")
  # end

  # def upload_front_id(front_id:)
  #   #Upload front id
  #   click_button("Upload from my computer")
  #   all(".photos-container")[0].click
  #   attach_doc(document: front_id)
  #   sleep 2
  # end

  # def upload_back_id(:back_id:)
  #   #Upload back id
  #   click_button("Upload")
  #   all(".photos-container")[1].click
  #   attach_doc(document: back_id)
  #   click_button("Upload")
  # end

  # def confirm_io_callback(mocked_result: mocked_result)
  #   click_button("#{mocked_result} Callback")
  # end

  # def populate_fields(data:)
  #   populate_phone(data.fetch("mobile_phone"))
  #   fill_in("social", :with => data.fetch("social"))
  #   fill_in("social_confirm", :with => data.fetch("social_confirm"))
  #   click_button("Submit SSN")
  # end

  # def populate_phone(mobile_phone)
  #   choose("phone_type_smart_phone")
  #   sleep 1
  #   find("#phone_type_smart_phone").click
  #   fill_in("mobile_phone", :with => mobile_phone)
  #   click_button("Submit phone")
  # end

  # def user_properties_levels
  #   [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  # end

  # def set_up_multifactor
  #   data = data_for(:experian_user3)

  #   click_link("Voice or Text Message")
  #   fill_in "multifactor_phone", :with => data.fetch("mobile_phone")

  #   3.times {
  #     sleep 1
  #     click_continue
  #   }
  # end

end
