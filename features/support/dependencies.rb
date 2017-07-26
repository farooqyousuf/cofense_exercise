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
require "capybara/cucumber"
require "selenium/webdriver"
require 'sauce_whisk'
require_relative "test_helper"
require_relative "app_pages/base_classes/page_mgmt"

DataMagic.load 'data.yml'

KBA ||= YAML.load_file('config/data/kba_questions_answers.yml')

include AllureCucumber::DSL

Capybara.default_max_wait_time = 30
Capybara.wait_on_first_by_default = true

AllureCucumber.configure do |c|
  c.output_dir = "output/allure"
end
