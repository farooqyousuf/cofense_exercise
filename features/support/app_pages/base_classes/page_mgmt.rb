module PageManagement
  # ****************************
  # * Window/Browser Management*
  # ****************************

  def create_new_window
    page.execute_script("window.open()")
  end

  # def use_last_browser_created
  #   page.driver.browser.window_handles.last
  # end

  def find_target_window(title)
    @handle = page.driver.find_window(title)
  end

  def use_certain_browser()
    find_target_window
    page.driver.browser.switch_to.window(@handle)
  end

  def close_current_browser
    page.driver.browser.close
  end

  def target_last_window
    @last_handle = page.driver.browser.window_handles.last
  end

  def use_last_browser_created
    target_last_window
    page.driver.browser.switch_to.window(@last_handle)
  end

  # def use_parent_window
  #   @browser.window(:index => 0).use
  # end

  # def close_specific_browser(title)
  #   @browser.window(:title => title).close
  # end

end