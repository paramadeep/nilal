require 'capybara'
class FirefoxDriver
  self.def capture (element,file_name)
    x = element.native.location.x
    y = element.native.location.y
    width = element.native.size.width
    height = element.native.size.height
    path = "#{Capybara.save_and_open_page_path}/#{file_name}.png"
    touch_file Capybara.save_and_open_page_path,"#{file_name}.png"
    script = 
      "var nilal_element = document.getElementById('nilal_client');
         if (nilal_element == null){
            nilal_element = document.createElement('nilal_client');
            nilal_element.id = 'nilal_client';
         }
         nilal_element.setAttribute('x', #{x});
         nilal_element.setAttribute('y', #{y});
         nilal_element.setAttribute('width', #{width});
         nilal_element.setAttribute('height',#{height} );
         nilal_element.setAttribute('path', '#{path}');
         document.documentElement.appendChild(nilal_element);
         var evt = document.createEvent('Events');
         evt.initEvent('CatchNilal', true, false); 
         nilal_element.dispatchEvent(evt); "
      script.delete!("\n")
    Capybara.page.execute_script(script)
  end

  self.def touch_file (folder,file)
    FileUtils.mkdir_p folder unless File.exists? folder
    FileUtils.touch "#{folder}/#{file}"
  end
end
