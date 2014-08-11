require 'chunky'
require 'firefox_driver'

module Capybara
  extend RSpec::Matchers::DSL

  matcher :match_image do |file_name|
    match_for_should do |node| 
      FirefoxDriver.capture node,text
      actual_file = "#{Dir.pwd}/features/images/#{file_name}.png"
      expexcted_file = "#{Capybara.save_and_open_page_path}/#{file_name}.png"
      diff_file = "#{Capybara.save_and_open_page_path}/#{file_name}_diff.png"
      Chunk.new.compare actual_file,expexcted_file,diff_file
    end
  end
end
