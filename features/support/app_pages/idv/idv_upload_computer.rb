require_relative '../base_classes/error_messages.rb'

class IDVComputer < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

   def verify(action: "none", document: "none", populate: "none")

    data = data_for(:docs)
    idv_user = data_for(:experian_user3)
    fail_idv_user = data_for(:fail_experian)

    case action
    when "verify via Imagery", "submit dupe attempt"
      populate = true
      front_id = data.fetch("png")
      back_id = data.fetch("idv")
      user = idv_user
    when "verify via AU10TIX"
      populate = true
      front_id = data.fetch("idv")
      back_id = data.fetch("png")
      user = idv_user
    when "fail documentation", "upload front doc"
      populate = false
      front_id = data.fetch("png")
      back_id = data.fetch("png")
      user = idv_user
    when "fail experian"
      populate = true
      front_id = data.fetch("idv")
      back_id = data.fetch("idv")
      user = fail_idv_user
    when "submit empty documents"
      populate = false
    when "submit documents"
      populate = false
      front_id = data.fetch("idv")
      back_id = data.fetch("idv")
    end

    unless action == "submit empty documents"
      upload_front_id(front_id: front_id)
      scroll_to_bottom_of_page
      upload_back_id(back_id: back_id) unless action == "upload front doc"
    end

    click_look_good
    sleep 5

    if populate == true
      populate_fields_computer(data: user)
      populate_ssn(data: user)
      submit_form

      check_fcra_box
      submit_form

      unless (action == "fail experian") || (action == "submit dupe attempt")
        click_link("Verify")
        close_verify_window
      end
    end
  end

  def user_properties_levels
    [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  end

  def submit_empty_smartphone_number_form
    click_smartphone_with_browser_option
    submit_form
  end

  def submit_empty_homephone_number_form
    click_homephone_option
    submit_form
  end

  def submit_empty_ssn_form
    page.has_css?("#sr_page_title", :text => "Enter your Social Security Number")
    click_button("Continue")
  end

  def required_fields
    [0]
  end
end
