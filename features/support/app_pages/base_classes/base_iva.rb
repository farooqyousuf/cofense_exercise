module IVABase

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
    # if element == ".schools"
    #   id = "s2id_autogen3_search"
    # else
    #   id = "s2id_autogen2_search"
    # end
    # fill_in(id, :with => value) 
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
  
  def header_css
    ".form-title"
  end

  def click_verify_button
    click_button("Verify now")
  end
  
end
