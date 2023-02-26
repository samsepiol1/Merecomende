# led_zepplin

import time
def veri(link,link2):
    if link == link2:
        print('Link as the same')
    else:
        print('Links are different')
from selenium import webdriver
browser = webdriver.Chrome()
# Load page with all Javascript rendered in the DOM for you.
#browser.get("https://www.google.com/search?q=grimes&oq=daft+punk&aqs=chrome.0.69i59j46i39j46j0l2j69i60l2j69i61.4943j0j7&sourceid=chrome&ie=UTF-8")
# Find the table
#yt = browser.find_element_by_xpath("/html/body/div[7]/div/div[9]/div[2]/div/div/div[2]/div[2]/div/div/div/div[1]/div/div/div/div/div/div[2]/div/div/table/tbody/tr[1]/td/a")
#deezer = browser.find_element_by_xpath('/html/body/div[7]/div/div[9]/div[2]/div/div/div[2]/div[2]/div/div/div/div[1]/div/div/div/div/div/div[2]/div/div/table/tbody/tr[3]/td/a')
#spo = browser.find_element_by_link_text('Spotify').click()
#url_spo = browser.current_url
#links = [elem.get_attribute('href') for elem in table]
# Do something with the table element
# Save the data
#print(yt.get_attribute('href'))
#print(deezer.get_attribute('href'))
#print(url_spo)

def spo_url(url):
    browser = webdriver.Chrome()
    url2 = 'https://www.google.com/search?q={}&oq=daft+punk&aqs=chrome.0.69i59j46i39j46j0l2j69i60l2j69i61.4943j0j7&sourceid=chrome&ie=UTF-8'.format(url)
    browser.get(url2)
    spo = browser.find_element_by_link_text('Spotify').click()
    url_spo = browser.current_url
    tag_spo =  '<a href="{}"><img src="spotify.png"></a>'.format(url_spo)
    print(tag_spo)
    browser.close()


def yt_url(url):
    browser = webdriver.Chrome()
    url2 = 'https://www.google.com/search?q={}&oq=daft+punk&aqs=chrome.0.69i59j46i39j46j0l2j69i60l2j69i61.4943j0j7&sourceid=chrome&ie=UTF-8'.format(url)
    browser.get(url2)
    yt = browser.find_element_by_link_text('YouTube').click()
    yt_u = browser.current_url

    tag_yt = '<a href="{}"><img src="youtube.png"></a>'.format(yt_u)
    print(tag_yt)
    f = open("teste_code.html", "a")
    f.write(tag_yt)

    browser.close()
def dee_url(url):
    browser = webdriver.Chrome()
    url2 = 'https://www.google.com/search?q={}&oq=daft+punk&aqs=chrome.0.69i59j46i39j46j0l2j69i60l2j69i61.4943j0j7&sourceid=chrome&ie=UTF-8'.format(url)
    browser.get(url2)
    dee = browser.find_element_by_link_text('Deezer').click()
    dee_u = browser.current_url
    tag_dee = '<a href="{}"><img src="deezer_f.png"></a>'.format(dee_u)
    print(tag_dee)
    browser.close()

spo_url('Loveless mbv')
time.sleep(5)
#yt_url('Loveless mbv')
time.sleep(5)
dee_url('Loveless mbv')
