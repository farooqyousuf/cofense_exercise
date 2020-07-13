require "rubygems"
require "pry"
require "yaml"
require "rspec"
require "cucumber"
require "fig_newton"
require "rspec/expectations"
require "selenium/webdriver"
require 'httparty'

$driver = Selenium::WebDriver.for :chrome

FigNewton.load("testing.yml")