require "watir-webdriver"
require "rspec/expectations"

Given(/^prepare browser "(.*)"$/) do |browser|
  case browser
  when 'chrome'
    Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path('/Users/s016374/Applications/chromedriver'))
    @browser = Watir::Browser.new :chrome
  when 'firefox'
    # TODO
  when 'IE'
    # TODO
  when 'safari'
    # TODO
  else
    raise ArgumentError, "pls input correct browser"
  end

end

When(/^I open "(.*)", entered "(.*)" into the query and click search$/) do |url, keyword|
  @browser.goto url
  @browser.text_field(:name => "q").set keyword
  @browser.button(:name => "btnK").click
  sleep 2
end

Then(/^I should see some results$/) do
  @browser.div(:id => "resultStats").wait_until_present
  expect(@browser.div(:id => "resultStats")).to exist
  sleep 5
  @browser.close
end
