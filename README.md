
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

1. Seamlessly integrates with your existing regression test suite. No need to set up a seperate suite
2. Any validations, image of just the element under validation is captured and asserted, rather than the full page whicch other tools offer. This brings in a see of advantages.
  1. Avoid test failures, due to change in elements unrelated to the test
  2. Test time is reduced, since we need not process a large image of the whole page. Test would be faster as we focus on small image
  3. Need of updating expected reference image will be avoided when there is a change element unrelated to test
  4. Test runs in a real browser (Firefox supported now, Chrome & IE in progress), providing a real time feedback, rather than virtual headless browsers

3. Unlike other toos, there is no need of any external dependencies like pdiff or ImageMagic. [Chunky_Png](https://github.com/wvanbergen/chunky_png) is used here.


## Usage
```ruby
#Gemfile
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
#### Generating expected reference image
1. Create a folder under 'feature' called 'images'.
2. First time, run your test without the reference image, test would fail, yet image of the expected element would be captured in 'tmp/capybara' folder.
3. Copy the image into your 'feature/images' folder. Commit it as part of your test source code.
4. Done. Now your tests will run, anywhere your ode is available. 
