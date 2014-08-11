require 'chunky'

module Appium

  should_match_previous_screen_capture do
      capture_screen "second"
      actual_file = "#{Dir.pwd}/second.png"
      expexcted_file = "#{Dir.pwd}/first.png"
      diff_file = "#{Dir.pwd}/diff.png"
      Chunk.new.compare actual_file,expexcted_file,diff_file
  end

  def capture_screen file = "first"
      #code to capture image
  end

end
