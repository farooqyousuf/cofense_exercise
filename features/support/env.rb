require_relative "dependencies"

FigNewton.load('production.yml')

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10

# Include helper methods module in each 'World' instance
World(HelperMethods)