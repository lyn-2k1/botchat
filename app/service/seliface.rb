require 'rubygems'
require 'httparty'
require 'json'
require 'uri'
require 'xpath'
# require 'watir'
require "selenium-webdriver" # load in the webdriver gem to interact with Selenium

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
driver.navigate.to("https://www.facebook.com/groups/255791402550152/pending_posts?search=&has_selection=false") # link groups

sleep(10)
a=driver.find_elements(class: 'tr9rh885')

file = File.open("unapproved_post.json","w")
j=1
a.each do |i|
  if j%2==0
    puts i.attribute("textContent")
    url = "https://api.wit.ai/message?v=20200513&q="+i.attribute("textContent").to_s
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(URI.escape(url))
    end
    response=HTTParty.get(uri,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
    a=JSON.parse(response.body)
    if a["entities"].empty?
      data={
          message: i.attribute("textContent"),
          idd: "",
          pheduyet: 0
      }.to_json
      sleep(2)
      element = driver.find_element(:xpath, '//div[contains(@aria-label, "Từ chối")]')
      driver.execute_script("arguments[0].click();", element)
    else
      data={
          message: i.attribute("textContent"),
          idd: "",
          pheduyet: a["intents"][0]["confidence"]
      }.to_json
      sleep(2)
      element = driver.find_element(:xpath, '//div[contains(@aria-label, "Phê duyệt")]')
      driver.execute_script("arguments[0].click();", element)
    end
    file.puts(data)
    puts("---------")
    puts data
  end
  j+=1;
end
file.close
driver.quit
