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

# DATA  ||= DataMagic.load("data.yml")
# KBA   ||= YAML.load_file("config/data/kba.yml")
#
# include AllureCucumber::DSL
#
# AllureCucumber.configure do |c|
#   c.output_dir = "output/allure"
# end
#
# PageObject.javascript_framework = :jquery