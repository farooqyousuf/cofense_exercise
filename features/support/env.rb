require_relative "dependencies"

FigNewton.load("staging.yml")

browser = Watir::Browser.new :firefox
browser.driver.manage.window.maximize
browser.driver.manage.timeouts.implicit_wait = 30

Before do
  @browser = browser
  @browser.cookies.clear
end

at_exit do
  browser.close
end

puts "=" * 25
puts "Environment: Staging"
puts "Browser: Firefox"
puts "=" * 25

World(PageObject::PageFactory)