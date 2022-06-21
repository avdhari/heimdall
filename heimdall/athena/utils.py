import requests
from bs4 import BeautifulSoup


def get_raw_data(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.text, 'html.parser')
    raw_data = soup.get_text()
    return raw_data