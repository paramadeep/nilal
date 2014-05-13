module AssertNilal
  extend RSpec::Matchers::DSL

  matcher :match_image do |text|
    match_for_should { |node| 
      capture node,text
      compare_image  text
    }
    match_for_should_not { |node|
    }
  end

  def compare_image file_name
    actual_file = "#{Dir.pwd}/features/images/#{file_name}.png"
    expexcted_file = "#{Capybara.save_and_open_page_path}/#{file_name}.png"
    diff_file = "#{Capybara.save_and_open_page_path}/#{file_name}_diff.png"
    Chunk.new.compare actual_file,expexcted_file,diff_file
  end
end
