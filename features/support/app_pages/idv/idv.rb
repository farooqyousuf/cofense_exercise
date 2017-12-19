require_relative '../base_classes/error_messages.rb'

class IDV < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def set_up_multifactor
    data = data_for(:experian_user3)

    click_link("Voice or Text Message")
    fill_in "multifactor_phone", :with => data.fetch("mobile_phone")

    3.times {
      sleep 1
      click_continue
    }
  end

  def click_verify_drivers_license_link
    click_button("Verify using my driver's license")
  end

  def verify(document: "none")
    upload_front_id_image(document: "au10tix")
    sleep 2
    upload_back_id_image

    idv_user = data_for(:experian_user3)
    populate_fields(data: idv_user)

    check("idme_verification_identity_accepts_fcra")
    click_button("Verify my information")
    click_link("Verify")
  end

  def upload_front_id_image(document)
    click_button("Upload from my computer")
    all(".photos-container")[0].click
    attach_idv_doc(document)
    click_button("Upload")
  end

  def upload_back_id_image
    all(".photos-container")[1].click
    attach_doc
    click_button("Upload")
    click_button("Look Good?")
    click_button("Confirmio Error Callback")
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

  def attach_idv_doc(number = 0, document: "none")
    page.has_css?("#file-upload")
    Dir.mkdir("./test_documents") unless Dir.exists?("./test_documents")
    page.driver.browser.all(:xpath, '//input[@type="file"]')[number].send_keys("#{Dir.pwd}/test_documents/test_#{document}.jpg")
  end
end
