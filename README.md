# Nilal

[![Dependency Status](https://gemnasium.com/paramadeep/pageify.svg)](https://gemnasium.com/paramadeep/pageify) [![Build Status](https://travis-ci.org/paramadeep/nilal_rb.svg?branch=master)](https://travis-ci.org/paramadeep/nilal_rb)

Captures images  of a particular web element and assert it against the expected image, and all you have to learn extra, to do this, is a single assert statement . Thus makes it a simple yet powerful visual regression testing tools.

## Example
```ruby
# In your capybara test

# Asserting a graph in page
find('.trend_chart').should match_image expected_report_image

# Assert layout/CSS Styling 
find('.analysis_table').should match_image expected_table_image
```



## Key Benefits
There are lot of tools out there to do visual regression, then why a yet another one.
- Seemlessly integrates with your existing regression testsuite. No need to set up a seperate suite.  
- Any validations, image of just the element under validation is captured and asserted, rather than the full page. This brings in a see of advantages
...- Test failuer


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

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => firefox_profile)
end
Capybara.current_session.driver.browser.capabilities.firefox_profile = firefox_profile
```
