require "rubygems"
require "pry"
require "yaml"
require "rspec"
require "cucumber"
require "cucumber_statistics/autoload"
require "allure-cucumber"
require "allure-cucumber/dsl"
require "data_magic"
require "fig_newton"
require "rspec/expectations"
require "capybara/cucumber"
require_relative 'test_helper'

AllureCucumber.configure do |c|
   c.output_dir = "output/allure"
end