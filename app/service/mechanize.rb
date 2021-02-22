require 'rubygems'
require 'selenium-webdriver'
require 'xpath'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')

driver=Selenium::WebDriver.for :chrome,:driver_path =>"chromedriver.exe",options: options
driver.get("https://www.facebook.com/")
sleep(2)
driver.find_element(id: "email").send_keys("hoangthimylinh23012001@gmail.com")
driver.find_element(id: "pass").send_keys("LinhLinh2k1")
driver.find_element(id: "u_0_b").click()
sleep(2)
driver.navigate.to("https://www.facebook.com/KiddiVietnam")

sleep(4)
element = driver.find_element(:xpath, '//div[contains(@aria-label,"Gửi tin nhắn")]')
driver.execute_script("arguments[0].click();", element)
sleep(4)
a = driver.find_element(:xpath, "//div[contains(@class,'notranslate _5rpu')]")
driver.execute_script("arguments[0].click()",a)
a.send_keys("hellllo")

driver.quit

