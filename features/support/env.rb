require_relative "dependencies"

FigNewton.load('staging.yml')

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10
Capybara.wait_on_first_by_default = true

# Include helper methods module in each 'World' instance
World(HelperMethods, PageManagement)
