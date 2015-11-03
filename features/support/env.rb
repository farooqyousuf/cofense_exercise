# `killall chromedriver`
#
# `adb kill-server`
# `adb devices`

require_relative "dependencies"
require 'fileutils'
require 'selenium-webdriver'

server_url = "http://localhost:4723/wd/hub"

capabilities =
{
  'platformName' => 'Android',
  'deviceName' => 'Android Emulator',
  'platformVersion' => '5.1',
  'browserName' => 'Chrome'
}

# caps = Selenium::WebDriver::Remote::Capabilities.android
# caps['appiumVersion'] = '1.4.13'
# caps['deviceName'] = 'Android Emulator'
# caps['deviceOrientation'] = 'portrait'
# caps['browserName'] = 'Browser'
# caps['platformVersion'] = '5.1'
# caps['platformName'] = 'Android

FigNewton.load("staging.yml")

driver = Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)

browser = Watir::Browser.new driver

# browser.driver.manage.window.maximize
browser.driver.manage.timeouts.implicit_wait = 30

puts "New Android Watir Browser Object Instantiated"

Before do
  @browser = browser
  @browser.cookies.clear
end

at_exit do
  browser.close
end

puts "=" * 25
puts "Environment: Staging"
puts "Platform: iOS"
puts "Browser: Safari"
puts "=" * 25

World(PageObject::PageFactory)