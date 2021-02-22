require 'watir'
require 'rubygems'

browser=Watir::Browser.new:chrome
browser.goto "https://www.facebook.com/"
sleep(2)
browser.find_element(id: "email").send_keys("hoangthimylinh23012001@gmail.com")
browser.find_element(id: "pass").send_keys("LinhLinh2k1")
brower.find_element(id: "u_0_b").click()
sleep(2)
browser.img(:src, "https://www.facebook.com/groups/255791402550152/pending_posts?search=&has_selection=false").click
sleep(4)
browser.link(:class, 'tr9rh885').set "textContent"