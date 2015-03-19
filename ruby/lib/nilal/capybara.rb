require_relative 'chunky'
require_relative 'firefox_driver'
require 'capybara'
require 'capybara/rspec'

module Nilal
  module Capybara
    extend RSpec::Matchers::DSL

    matcher :match_image do |expexcted_file|
      expexcted_file = File.absolute_path expexcted_file
      actual_file = File.absolute_path "tmp/app_#{File.basename(expexcted_file)}"
      diff_file = File.absolute_path "tmp/app_diff_#{File.basename(expexcted_file)}"
      FileUtils.touch actual_file
      match do |node| 
        FirefoxDriver.capture node,actual_file
        Chunk.matches? actual_file,expexcted_file,diff_file
      end
      match_when_negated do |node| 
        FirefoxDriver.capture node,actual_file
        !Chunk.matches? actual_file,expexcted_file,diff_file
      end
    end
  end
end
