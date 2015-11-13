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
require "site_prism"
require_relative "test_helper"

include AllureCucumber::DSL

AllureCucumber.configure do |c|
  c.output_dir = "output/allure"
end
