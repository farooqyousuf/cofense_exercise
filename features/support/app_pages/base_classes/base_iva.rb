module IVABase

include Capybara::DSL
include DataMagic

  #############
  #IVA Methods#
  #############

  def select_option(container, element, value, index)
    # click the dropdown
    all("#{element}")[index].click
    #find("[data-option='#{container}'] #{element} > a.select2-choice").click

    # pick an option
    find("#select2-drop .select2-results").find("div", :text => /^#{value}$/i).click
  end

  def search_option(container, element, value, index)
    # click the dropdown
    #find("[data-option='#{container}'] #{element} > a.select2-choice").click
    all("#{element}")[index].click

    #set the seach value
    find(".select2-input").set(value)

    #pick a result
    find('#select2-drop .select2-results').find("div", :text => /^#{value}$/i).click
  end

  def select_filter(id, value)
    # click the dropdown
    find(".select2-container#s2#{id} > a.select2-choice").click
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
