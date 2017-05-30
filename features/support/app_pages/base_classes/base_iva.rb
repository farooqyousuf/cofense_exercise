module IVABase

include Capybara::DSL
include DataMagic

  #############
  #IVA Methods#
  #############

  def escape_google_address_autocomplete(array)
    array.each do |field|
      find(field).native.send_keys :escape
    end
  end

  def populate_first_state(value, unique_id)
    search_option(container_attribute, unique_id, value)
  end

  def pick_result(value)
    find("#select2-drop .select2-results").find("div", :text => /^#{value}$/i).click
  end

  def select_option(element, value)
    # click the dropdown
    sleep 1
    find(element.to_s).click
    sleep 1
    # pick result
    pick_result(value)
  end

  def search_option(container, element, value)
    # click the dropdown
    find(element.to_s).click

    #set the search value
    find(".select2-input").set(value)

    #pick a result
    pick_result(value)
  end

  def select_filter(element, value)
    # click the dropdown
    find(element).click

    # pick result
    pick_result(value)
  end

  def select_filter2(id, value)
    # click the dropdown
    find(".select2-container#{id} > a.select2-choice").click

    # pick result
    pick_result(value)
  end

  def header_css
    ".heading"
  end

  def click_verify_button
    click_button("Verify now")
  end

  def click_submit
    click_button("Submit")
  end

  def click_continue
    click_button("Continue")
  end

  def attach_doc(number = 0)
    page.has_css?(".file-upload") #will wait until this is true which means the file upload page has loaded, and the bottom command will not fail.
    page.driver.browser.all(:xpath, '//input[@type="file"]')[number].send_keys("#{Dir.pwd}/screenshots/screenshot.png")
  end

end
