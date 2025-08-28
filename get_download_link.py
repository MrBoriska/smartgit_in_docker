#!python3
import requests
from bs4 import BeautifulSoup

url = 'https://www.syntevo.com/smartgit/download/'
response = requests.get(url)
soup = BeautifulSoup(response.text, 'lxml')
el = soup.find('a', class_='stretched-link', attrs={"title":"Debian Bundle: Download for Linux"})
print(el.attrs["href"], end="")
