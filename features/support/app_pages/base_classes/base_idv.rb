module IDVBase

include Capybara::DSL
include DataMagic

  #############
  #IDV Methods#
  #############

  def click_verify_drivers_license_link
    click_button("Verify using my driver's license")
  end

  def click_mobile_verify_drivers_license_link
    all("li")[1].click
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

  def populate_fields_computer(data:)
    populate_phone(data.fetch("mobile_phone"))
    populate_ssn(data: data)
  end

  def populate_fields_phone(data:)
    populate_ssn(data: data)
  end

  def populate_fields_kba(data:)
    populate_fields_personal_info(data: data)
    populate_fields_address(data: data)
    populate_fields_computer(data: data)
  end

  def populate_fields_personal_info(data:)
    %w(idme_verification_identity_first_name idme_verification_identity_last_name idme_verification_identity_birth_date).each do |field|
      fill_in(field, :with => data.fetch(field))
    end

    click_on("Submit my information")
  end

  def populate_fields_address(data:)
    %w(idme_verification_identity_street idme_verification_identity_city idme_verification_identity_zip).each do |field|
      fill_in(field, :with => data.fetch(field))
    end

    populate_state(data.fetch("state"))
    2.times {fill_in("idme_verification_identity_zip", :with => data.fetch("idme_verification_identity_zip"))}
    click_on("Submit address")
  end

  def populate_state(state)
    select_option("#select2-chosen-1", state)
  end

  def populate_ssn(data:)
    fill_in("social", :with => data.fetch("social"))
    fill_in("social_confirm", :with => data.fetch("social_confirm"))
    click_button("Continue")
  end

  def populate_phone(mobile_phone)
    2.times { find("label[for='phone_type_smart_phone']").click }
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

  def check_fcra_box
    find(:css, "label[for='idme_verification_identity_accepts_fcra'] span").click
  end
end
