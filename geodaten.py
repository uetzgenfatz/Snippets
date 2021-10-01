#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Simple script that scrapes GeoHack (via Wikipedia) for geo coordinates of given list of place names (input: .csv)
# Oliver Schallert, 2021
# only compatible with Python 3

import re
from bs4 import BeautifulSoup
import urllib.request as urllib2
import csv
import ssl

ssl._create_default_https_context = ssl._create_unverified_context

url="https://de.wikipedia.org/wiki/"


t = open("koordinaten.csv", 'wt') 
print("Ort"+";"+"X"+";"+"Y", file=t)

with open ("orte.csv") as csvfile:
	f = csv.DictReader(csvfile)
	for row in f:
		try:
			link = url+row['Ort']
			ort = str(row['Ort'])	
			x = urllib2.urlopen(link)
			soup = BeautifulSoup(x.read(), "html.parser")
			hoi = soup.find('span', {'class' : 'latitude'})
			hai = soup.find('span', {'class' : 'longitude'})
			long = str(hoi.get_text())
			lat = str(hai.get_text())
			print(ort+";"+lat+";"+long, file=t)
		except (AttributeError, urllib2.HTTPError):
			lat = 'NA'
			long = 'NA'
			print(ort+";"+lat+";"+long, file=t)
		
t.close()

