class FirefoxDriver
  def self.capture element,file_name
    x = element.native.location.x
    y = element.native.location.y
    width = element.native.size.width
    height = element.native.size.height
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
         nilal_element.setAttribute('path', '#{file_name}');
         document.documentElement.appendChild(nilal_element);
         var evt = document.createEvent('Events');
         evt.initEvent('CatchNilal', true, false); 
         nilal_element.dispatchEvent(evt); "
      script.delete!("\n")
    Capybara.page.execute_script(script)
  end

end
