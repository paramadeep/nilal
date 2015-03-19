require 'nilal'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara'
require 'selenium-webdriver'
require 'capybara/session'
require 'pry'
firefox_profile = Selenium::WebDriver::Firefox::Profile.new
firefox_profile.add_extension File.join(Gem::Specification.find_by_name("nilal").gem_dir,"/lib/nilal/nilal.xpi")
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => firefox_profile)
end
Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'https://www.google.co.in'
end

RSpec.configure do |config|
  config.include Nilal::Capybara
  config.include Capybara::DSL
end
