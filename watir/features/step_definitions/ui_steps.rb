require "watir-webdriver"
require "rspec/expectations"

Given(/^I have entered "([^"]*)" into the query$/) do |term|
  chromedriver_path = File.join(File.absolute_path('/Users/s016374/Downloads/chromedriver'))
  Selenium::WebDriver::Chrome.driver_path = chromedriver_path

  @browser = Watir::Browser.new :chrome
  @browser.goto "google.com"
  @browser.text_field(:name => "q").set term
end

When(/^I click "([^"]*)"$/) do |button_name|
  @browser.button(:name => button_name).click
end

Then(/^I should see some results$/) do
  @browser.div(:id => "resultStats").wait_until_present
  expect(@browser.div(:id => "resultStats")).to exist
  @browser.close
end
