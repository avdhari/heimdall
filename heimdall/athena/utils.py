import requests
from bs4 import BeautifulSoup


def get_title(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.text, 'html.parser')
    title = soup.title.string
    return title


def get_raw_data(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.text, 'html.parser')
    raw_data = soup.get_text()
    return raw_data


def get_text_data(url):
    raw_data = get_raw_data(url)
    text_data = ' '.join([str(word) for word in raw_data.split()])
    return text_data
