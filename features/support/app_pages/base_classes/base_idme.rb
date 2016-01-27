require_relative 'page_mgmt'
require_relative 'base_iva'

class IDmeBase

 include Capybara::DSL
 include PageManagement
 include IVABase

 #Readable attributes
 #Allows the url attribute to be read/accessed outside of this class
 attr_reader :url

  #Constructs IDPBase's data structure
  #Every IDmeBase object will contain a @url variable
  def initialize(url = nil)
    @url = url
  end

  #calls Capybara's visit method
  def visit
    super(url)
  end

  def fill_in_verification_code(code)
    fill_in("verification_code", :with => code)
    click_verify_button
  end

  def save_screenshot
    Dir.mkdir("./screenshots") unless Dir.exists?("./screenshots")
    page.save_screenshot("#{Dir.pwd}/screenshots/screenshot2.png")
  end

  def wait_for_ajax
  Timeout.timeout(Capybara.default_wait_time) do
    active = page.evaluate_script('jQuery.active')
    until active == 0
      active = page.evaluate_script('jQuery.active')
    end
  end
end

end
