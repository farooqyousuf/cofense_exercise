require "rubygems"
require "pry"
require "yaml"
require "rspec"
require "cucumber"
require "cucumber_statistics/autoload"
require "allure-cucumber"
require "data_magic"
require "fig_newton"
require "rspec/expectations"
require 'fig_newton'
require 'pry'
#require_relative 'test_helper'
require 'capybara/cucumber'
require_relative 'test_helper'
require_relative 'step_method_helpers'
# require 'allure-cucumber'

# include AllureCucumber::DSL

FigNewton.load('production.yml')

Capybara.default_max_wait_time = 10

# Actions performed before/after each scenario
Before do
  Capybara.default_driver = :selenium
end

# AllureCucumber.configure do |c|
#    c.output_dir = "gen/allure_xml_files"
# end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.screenshot.save(screenshot)

    #attachs failed test screenshot to Allure reports
    # attach_file("FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png", File.open("#{screenshot}"))
  end
end

After do
  sign_out_of_idme
end

# Include helper methods module in each 'World' instance
World(HelperMethods)
