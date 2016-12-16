require 'appium_lib'

RSpec.describe 'iOS app testing' do
  context "try it" do
    it 'init ios webdriver' do
      # singleton mode
      return if $driver

      # # define driver info in desired_capabilities
      # APP_PATH = 'app/UICatalog6.1.app.zip'
      # desired_capabilities = {
      #   caps: {
      #     platformName: 'iOS',
      #     versionNumber: '10.1',
      #     deviceName: 'iPhone 6',
      #     app: APP_PATH,
      #     automationName: 'XCUITest',
      #   },
      #   appium_lib: {
      #     sauce_name: nil,
      #     sauce_access_key: nil,
      #   }
      # }

      # init driver from appium.txt
      caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appium.txt')
      # new the driver
      Appium::Driver.new(caps)
    end

    it 'launch ios driver' do
      $driver.start_driver
    end

    xit 'click a button then Back one by one' do
      cells = $driver.texts('uses')
      cells.each do |cell|
        cell.click
        $driver.back
      end
    end

    it 'using Appium.promote_appium_methods to get Page object' do
      Appium.promote_appium_methods RSpec::Core::ExampleGroup
      cells = texts('uses')
      cells.each do |cell|
        cell.click
        back
      end
    end

    it 'close ios driver' do
      $driver.driver_quit
    end
  end
end
