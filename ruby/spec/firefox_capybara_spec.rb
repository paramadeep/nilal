require_relative "spec_helper"
describe "firefox capybara" do
  it "passes for matching image" do
    Capybara.page.visit('/')
    Capybara.page.find("#searchform .jsb").should match_image "spec/images/actual.png"
  end

  it "fails for mismatching image size" do
    Capybara.page.visit('/')
    Capybara.page.find("#searchform").should_not match_image "spec/images/actual.png"
  end

  it "fails for mismatching image" do
    Capybara.page.visit('/')
    Capybara.page.find("#searchform .jsb").should_not match_image "spec/images/changed.png"
  end

end
