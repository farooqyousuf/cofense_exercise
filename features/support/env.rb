require_relative "dependencies"

Capybara.default_driver = :selenium
Capybara.default_selector = :css
Capybara.default_max_wait_time = 20
Capybara.wait_on_first_by_default = true

# Include helper methods module in each 'World' instance
World(HelperMethods, PageManagement)