require 'rubygems'
require 'selenium-webdriver'
require 'xpath'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')

driver=Selenium::WebDriver.for :chrome,:driver_path =>"chromedriver.exe",options: options
driver.get("https://www.messenger.com/")
sleep(2)
driver.find_element(id: "email").send_keys("hoangthimylinh23012001@gmail.com")
driver.find_element(id: "pass").send_keys("LinhLinh2k1")
driver.find_element(id: "loginbutton").click()
sleep(2)
driver.navigate.to("https://www.messenger.com/t/1093596310660784")
sleep(4)
driver.find_element(:xpath, "//div[contains(@class,'_1mf _1mj')]").send_keys("hellllo")
driver.quit