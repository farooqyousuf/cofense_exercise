class IVABase

include Capybara::DSL

  #############
  #IVA Methods#
  #############

  def select_option(container, element, value)
    # click the dropdown
    # @browser.link(:css, "[data-option='#{container}'] #{element} > a.select2-choice").click

    find("[data-option='#{container}'] #{element} > a.select2-choice").click
    #find("[data-option='government-email'] .government-affiliation > a.select2-choice").click

    # wait until options are rendered
    # @browser.wait_until { @browser.li(:css, "#select2-drop .select2-results .select2-result-selectable").visible? }
    expect(page).to have_css( "#select2-drop .select2-results .select2-result-selectable")

    # pick an option
    # @browser.ul(:css, "#select2-drop .select2-results").div(:text => /^#{value}$/i).click
    find("#select2-drop .select2-results").find("div", :text => /^#{value}$/i).click
  end

  # def search_option(container, element, value)
  #   # click the dropdown
  #   @browser.link(:css, "[data-option='#{container}'] #{element} > a.select2-choice").click

  #   # wait until options and filter are visible
  #   @browser.wait_until { @browser.text_field(:css, "#select2-drop .select2-search .select2-input").visible? }

  #   # set the seach value
  #   @browser.text_field(:css, "#select2-drop .select2-search .select2-input").value = value

  #   # wait until search results are visible
  #   @browser.wait_until { @browser.li(:css, "#select2-drop .select2-results .select2-result-selectable").visible? }

  #   # pick a result
  #   @browser.ul(:css, "#select2-drop .select2-results").div(:text => /^#{value}$/i).click
  # end

  # def select_filter(id, value)
  #   # click the dropdown
  #   @browser.link(:css, ".select2-container#s2id_#{id} > a.select2-choice").click

  #   # wait until search results are visible
  #   @browser.wait_until { @browser.li(:css, "#select2-drop .select2-results .select2-result-selectable").visible? }

  #   # pick an options
  #   @browser.ul(:css, "#select2-drop .select2-results").div(:text => /^#{value}$/i).click
  # end

  

end