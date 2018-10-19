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

  def click_take_pic_with_phone
    click_on("Take a picture with my phone")
  end

  def click_look_good
    click_on("Look good?")
  end

  def enter_phone_number
    data = data_for(:experian_user3)
    populate_mobile_phone(data: data)
  end

  def enter_ssn
    data = data_for(:experian_user3)
    populate_ssn(data: data)
  end

  def click_upload_form_link
    click_link("Upload form")
  end

  def upload_front_id(front_id:)
    all(".photos-container")[0].click
    attach_doc(document: front_id)
    click_button("Upload")
  end

  def upload_back_id(back_id:)
    all(".photos-container")[1].click
    attach_doc(document: back_id)
    click_button("Upload")
  end

  def populate_fields_computer(data:)
    click_smartphone_with_browser_option
    populate_mobile_phone(data: data)
  end

  def populate_fields_phone(data:)
    click_smartphone_with_browser_option
    populate_mobile_phone(data: data)
    populate_ssn(data: data)
  end

  def populate_fields_kba(data:)
    populate_fields_personal_info(data: data)
    populate_fields_address(data: data)
  end

  def populate_fields_personal_info(data:)
    %w(idme_verification_identity_attempt_first_name idme_verification_identity_attempt_middle_name idme_verification_identity_attempt_last_name idme_verification_identity_attempt_birth_date).each do |field|
      fill_in(field, :with => data.fetch(field))
    end

    populate_ssn(data: data)
    populate_gender("female")
    submit_form
  end

  def populate_fields_address(data:)
    %w(idme_verification_identity_attempt_street idme_verification_identity_attempt_city idme_verification_identity_attempt_zip).each do |field|
      fill_in(field, :with => data.fetch(field))
    end

    populate_state(data.fetch("state"))
    2.times {fill_in("idme_verification_identity_attempt_zip", :with => data.fetch("idme_verification_identity_attempt_zip"))}
    submit_form
  end

  def populate_state(state)
    select_option("#select2-chosen-1", state)
  end

  def populate_ssn(data:)
    fill_in("social", :with => data.fetch("social"))
  end

  def populate_mobile_phone(data:)
    fill_in("mobile_phone", :with => data.fetch("idme_verification_identity_attempt_mobile_phone"))
    submit_form
  end

  def populate_home_phone(data:)
    fill_in("home_phone", :with => data.fetch("mobile_phone"))
    submit_form
  end

  def populate_gender(sex)
    find("label[for='idme_verification_identity_attempt_gender_#{sex}']").click
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
    find(:css, "label[for='idme_verification_identity_attempt_accepts_fcra'] span").click
  end

  def close_verify_window
    sleep 2
    phone_confirm_window = page.driver.window_handles.last
    page.driver.close_window(phone_confirm_window)
  end

  def click_smartphone_with_browser_option
    find("label[for='phone_type_smart_phone']").click
  end

  def click_homephone_option
    find("label[for='phone_type_home_phone']").click
  end

  def edit_info(fields)

    data = data_for(:experian_user4)
    find("input[aria-label='Edit #{fields}']").click

    case fields
    when "Personal Information"
      populate_fields_personal_info(data: data)
    when "Address"
      populate_fields_address(data: data)
    when "Phone"
      click_smartphone_with_browser_option

      if page.has_css? ("input[name='mobile_phone'][disabled='disabled']")
        populate_home_phone(data: data)
      else
        populate_mobile_phone(data: data)
      end
    end
  end

  def current_info(fields)
    case fields
    when "Personal Information"
      first_field = 1
      last_field = 6
    when "Address"
      first_field = 7
      last_field = 11
    when "Phone"
      first_field = 12
      last_field = 13
    when "Home Phone"
      first_field = 12
      last_field = 14
    when "All"
      first_field = 1
      last_field = 13
    when "All + Home Phone"
      first_field = 1
      last_field = 14
    end

    all(".review-row-right")[first_field...last_field].map { |a| a.text }
  end

  def mocked_info(fields)
    case fields
    when "Personal Information" then ["VERONICA", "C", "PERSINGER", "Female", "07/09/1942"]
    when "Address"              then ["6647 WILDFLOWER DR S", "COTTAGE GROVE", "MN", "55016"]
    when  "Phone"               then ["651-458-1155"]
    when  "All"                 then ["VERONICA", "C", "PERSINGER", "Female", "07/09/1942", "", "6647 WILDFLOWER DR S", "COTTAGE GROVE", "MN", "55016", "", "651-458-1155"]
    end
  end

  def expected_info(fields)
    case fields
    when "Personal Information" then ["JACQUELYN", "Q", "RUTLAND", "Female", "08/28/1948"]
    when "Address"              then ["1016 TOWNSEND ST", "SPEARMAN", "TX", "79081-3564"]
    when "Phone"                then ["806-659-0081"]
    when "Home Phone"           then ["651-458-1155", "806-659-0081"]
    when  "All"                 then ["JACQUELYN", "Q", "RUTLAND", "Female", "08/28/1948", "", "1016 TOWNSEND ST", "SPEARMAN", "TX", "79081-3564", "", "806-659-0081"]
    when  "All + Home Phone"    then ["JACQUELYN", "Q", "RUTLAND", "Female", "08/28/1948", "", "1016 TOWNSEND ST", "SPEARMAN", "TX", "79081-3564", "", "651-458-1155", "806-659-0081"]
    end
  end

  def submit_form
    find("button[type=submit]").click
  end

  def compare_expected_and_actual_user_property_values(type)
    if type == "phone"
      collect_user_properties.should == expected_user_properties_via_phone
    else
      collect_user_properties.should == expected_user_properties
    end
  end

  def collect_user_properties
    last_index = all("#collapse-user-properties tr td.value:nth-child(2)").count
    all("#collapse-user-properties tr td.value:nth-child(2)")[0..(last_index - 4)].map { |a| a.text }
  end

  def expected_user_properties
    ["JACQUELYN", "Q", "RUTLAND", "female", "18066590081", "1016 TOWNSEND ST", "SPEARMAN", "TX", "79081-3564"]
  end

  def expected_user_properties_via_phone
    ["JACQUELYN", "C", "RUTLAND", "female", "16514581155", "1016 TOWNSEND ST", "SPEARMAN", "TX", "79081-3564"]
  end

  def scroll_to_bottom_of_page
    page.execute_script "window.scrollBy(0,10000)"
  end
end
