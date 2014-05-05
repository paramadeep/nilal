Gem::Specification.new do |s|
  s.name        = 'nilal'
  s.version     = '0.0.1'
  s.date        = '2014-05-03'
  s.summary     = "Image Capturing and assertion at element level"
  s.description = "Image Capturing and assertion at element level, all you need is a single assert statement"
  s.authors     = ["deepak p"]
  s.files       = Dir['README.md', 'lib/**/*']
  s.homepage    =
    'https://github.com/paramadeep/nilal_rb'
  s.license       = 'MIT'

  s.add_runtime_dependency 'capybara', '>= 2.1.0'
  s.add_runtime_dependency 'oily_png', '>= 1.1.1'
  s.add_runtime_dependency 'selenium-webdriver', '>= 2.0'

  s.add_development_dependency 'rspec', ''

end
