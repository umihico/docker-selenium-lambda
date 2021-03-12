from selenium import webdriver


def handler(event=None, context=None):
    options = webdriver.ChromeOptions()
    options.binary_location = "/opt/bin/headless-chromium"
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1280x1696")
    options.add_argument("--single-process")
    options.add_argument("--disable-dev-shm-usage")
    chrome = webdriver.Chrome("/opt/bin/chromedriver",
                              options=options)
    chrome.get("https://umihi.co/")
    return chrome.find_element_by_xpath("//html").text
