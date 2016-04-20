#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Einfaches Skript, das Geodaten aus Wikipedia abgreift 
# Oliver Schallert, 2016

import re
from bs4 import BeautifulSoup
import urllib2
import csv


url="https://de.wikipedia.org/wiki/"


t = open("koordinaten.csv", 'wt') 
print >> t, "Ort"+";"+"X"+";"+"Y"

with open ("Orte.csv") as csvfile:
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
			print >> t, ort+";"+lat+";"+long
		except (AttributeError, urllib2.HTTPError):
			lat = 'NA'
			long = 'NA'
			print >> t, ort+";"+lat+";"+long
		
t.close()

