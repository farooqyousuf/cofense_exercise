module IDVBase

include Capybara::DSL
include DataMagic

  #############
  #IDV Methods#
  #############

  def click_verify_drivers_license_link
    click_button("Verify using my driver's license")
  end

  def click_upload_from_computer
    click_button("Upload from my computer")
  end

  def click_take_pic_with_phone
    click_button("Take a picture with my phone")
  end

  def enter_phone_number
    data = data_for(:experian_user3)
    fill_in("mobile_phone", :with => data.fetch("mobile_phone"))
  end

  def click_send_me_link
    click_button("Send me the link")
  end

  def click_upload_form_link
    click_link("Upload form")
  end

  def upload_front_id(front_id:)
    #Upload front id
    all(".photos-container-image")[0].click
    attach_doc(document: front_id)
    click_button("Upload")
    sleep 2
  end

  def upload_back_id(back_id:)
    #Upload back id
    all(".photos-container-image")[1].click
    attach_doc(document: back_id)
    click_button("Upload")
  end

  def confirm_io_callback(mocked_result: "Failure")

    mocked_result = "Failure" if mocked_result.nil?

    click_button("#{mocked_result} Callback")
  end

  def populate_fields_computer(data:)
    populate_phone(data.fetch("mobile_phone"))
    populate_ssn(data: data)
  end

  def populate_fields_phone(data:)
    populate_ssn(data: data)
  end

  def populate_ssn(data:)
    fill_in("social", :with => data.fetch("social"))
    fill_in("social_confirm", :with => data.fetch("social_confirm"))
    click_button("Submit SSN")
  end

  def populate_phone(mobile_phone)
    2.times {find("label[for='phone_type_smart_phone']").click}
    enter_phone_number
    click_button("Submit phone")
  end

  def set_up_multifactor
    data = data_for(:experian_user3)

    find(".m_phone").click
    fill_in "multifactor_phone", :with => data.fetch("mobile_phone")

    3.times {
      sleep 1
      click_continue
    }
  end

  def close_confirm_window
    blank_confirmio_window = page.driver.window_handles[1]
    page.driver.close_window(blank_confirmio_window)
  end

  def check_fcra_box
    find(:css, "label[for='idme_verification_identity_accepts_fcra'] span").click
  end
end
