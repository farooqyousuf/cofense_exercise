
require_relative '../base_classes/error_messages.rb'

class IDV < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify_with_phone(action: "none", document: "none", populate: true)

    data = data_for(:docs)

    case action
    when "verify with Imagery"
      populate = true
      front_id = data.fetch("png")
      back_id = data.fetch("idv")
    when "verify with AU10TIX"
      populate = true
      front_id = data.fetch("idv")
      back_id = data.fetch("png")
    when "fail documentation"
      populate = false
      front_id = data.fetch("png")
      back_id = data.fetch("png")
    end

    upload_front_id(front_id: front_id)
    upload_back_id(back_id: back_id)
    click_button("Look Good?")

    close_current_browser
    use_original_tab
    sleep 3
    if populate == true
      idv_user = data_for(:experian_user3)

      if page.has_css?("#sr_page_title", text: "Enter your Social Security Number") == false
        close_current_browser
        use_original_tab
      end

      populate_fields_phone(data: idv_user)
      check_fcra_box
      click_button("Verify my information")
      click_button("Allow")
    end
  end

   def verify_with_computer(action: "none", document: "none", populate: "none")

    data = data_for(:docs)
    idv_user = data_for(:experian_user3)
    fail_idv_user = data_for(:fail_experian)

    case action
    when "verify via Imagery"
      populate = true
      front_id = data.fetch("png")
      back_id = data.fetch("idv")
      user = idv_user
    when "verify via AU10TIX"
      populate = true
      front_id = data.fetch("idv")
      back_id = data.fetch("png")
      user = idv_user
    when "fail documentation"
      populate = false
      front_id = data.fetch("png")
      back_id = data.fetch("png")
      user = idv_user
    when "fail experian"
      populate = true
      front_id = data.fetch("idv")
      back_id = data.fetch("idv")
      user = fail_idv_user
    end

    upload_front_id(front_id: front_id)
    upload_back_id(back_id: back_id)
    click_button("Look Good?")
    sleep 3

    if populate == true
      populate_fields_computer(data: user)
      check_fcra_box
      click_button("Verify my information")

      unless action == "fail experian"
        click_link("Verify")
      end
    end
  end

  def verify_with_kba(action: "none", populate: "none")
    idv_user = data_for(:experian_user3)

    case action
    when "successfully verify"
      populate = true
      user = idv_user
    end

    if populate == true
      populate_fields_kba(data: user)
      check_fcra_box
      click_button("Verify my information")
    end
  end

  def user_properties_levels
    [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  end
end
