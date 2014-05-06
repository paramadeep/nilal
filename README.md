# Nilal

Captures images  of a particular web element and assert it against the expected image. Thus makes it a simple yet powerful visual reresion testing tools, as suggested in ThoughtWorks TechRadar. http://www.thoughtworks.com/radar/#/tools/717
## Example
```ruby
# In your capybara test

# Asserting a graph in page
find('.trend_chart').should match_image expected_report

# Assert page layout 
should match_image expected_page
```

## Usage
```ruby
#GEMFILE
gem 'nilal', '~> 0.0.1'
```
###Cucumber

```ruby
# In env.rb
require 'nilal'
include Nilal

firefox_profile = Selenium::WebDriver::Firefox::Profile.new
firefox_profile.add_extension File.join(Gem::Specification.find_by_name("nilal").gem_dir,"/lib/nilal/nilal.xpi")
0
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => firefox_profile)
end
Capybara.current_session.driver.browser.capabilities.firefox_profile = firefox_profile
```


## Key Benefits
- Asserts just the element 


