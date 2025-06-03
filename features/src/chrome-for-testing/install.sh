#!/usr/bin/env bash

set -e

CHROME_VERSION=$(curl -s "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json" | jq '.channels.Stable.version' -r)

apt update -y && apt upgrade -y
wget -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome.deb || apt -f install -y

wget -O chromedriver.zip https://storage.googleapis.com/chrome-for-testing-public/$CHROME_VERSION/linux64/chromedriver-linux64.zip
unzip chromedriver.zip -d chromedriver
cp chromedriver/chromedriver-linux64/chromedriver /usr/local/bin/

rm -r google-chrome.deb chromedriver chromedriver.zip
