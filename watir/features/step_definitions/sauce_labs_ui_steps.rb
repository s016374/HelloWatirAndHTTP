require "selenium/webdriver"

Given(/^open browser$/) do
  caps = {
    platform: "Windows 7",
    browserName: "Chrome",
    version: "45"
  }
  driver = Selenium::WebDriver.for(:remote,
      url: "https://SamDgg:3a1a4e3b-0c5d-4b1d-a8e6-4fefb422557a@ondemand.saucelabs.com:443/wd/hub",
      desired_capabilities: caps)

  driver.get('http://saucelabs.com/test/guinea-pig')

  puts "title of webpage is: #{driver.title()}"

  driver.quit()
end
