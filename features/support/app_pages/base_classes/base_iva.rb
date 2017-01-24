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

  def populate_second_state(value, index)
    select_option(container_attribute, "#s2id_state", value, index)
  end

  def select_option(container, element, value, index)
    # click the dropdown
    all("#{element}")[index].click
    sleep 1
    # pick an option
    find("#select2-drop .select2-results").find("div", :text => /^#{value}$/i).click
  end

  def search_option(container, element, value)
    # click the dropdown
    find("[data-option='#{container}'] #{element}").click

    #set the search value
    find(".select2-input").set(value)

    #pick a result
    find('#select2-drop .select2-results').find("div", :text => /^#{value}$/i).click
  end

  def select_filter(id, value)
    # click the dropdown
    find(".select2-container#s2#{id} > a.select2-choice").click

    # pick an options
    find("#select2-drop .select2-results").find("div", :text => /^#{value}$/i).click
  end

  def select_filter2(id, value)
    # click the dropdown
    find(".select2-container#{id} > a.select2-choice").click

    # pick an option
    find("#select2-drop .select2-results").find("div", :text => /^#{value}$/i).click
  end

  def header_css
    ".form-title"
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
