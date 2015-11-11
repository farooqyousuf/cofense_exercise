require_relative "dependencies"

FigNewton.load('production.yml')

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10
Capybara.wait_on_first_by_default = true

# Actions performed before/after each scenario
Before do
  page.driver.browser.manage.window.maximize
end

After do
  sign_out_of_idme
end

# Include helper methods module in each 'World' instance
World(HelperMethods)
