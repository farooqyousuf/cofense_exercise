class IVABase < IDmeBase

include Capybara::DSL
include DataMagic

  #############
  #IVA Methods#
  #############

  def select_option(container, element, value)
    # click the dropdown
    find("[data-option='#{container}'] #{element} > a.select2-choice").click

    # pick an option
    find("#select2-drop .select2-results").find("div", :text => /^#{value}$/i).click
  end

  def search_option(container, element, value)
    # click the dropdown
    find("[data-option='#{container}'] #{element} > a.select2-choice").click

    #set the seach value
    fill_in('s2id_autogen2_search', :with => value)

    #pick a result
    find('#select2-drop .select2-results').find("div", :text => /^#{value}$/i).click
  end

  # def select_filter(id, value)
  #   # click the dropdown
  #   @browser.link(:css, ".select2-container#s2id_#{id} > a.select2-choice").click

  #   # wait until search results are visible
  #   @browser.wait_until { @browser.li(:css, "#select2-drop .select2-results .select2-result-selectable").visible? }

  #   # pick an options
  #   @browser.ul(:css, "#select2-drop .select2-results").div(:text => /^#{value}$/i).click
  # end

  def click_here_to_finish
    click_link("Click here to finish")
  end
  

end