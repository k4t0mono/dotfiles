#!/usr/bin/env python3
"""A simple script for wheather forecast

Author: KatoMono Enkeli
Email: k4t0mono@gmail.com
GPG key: 806FC3F95E6CF4D0
Powered by: [
    Google Maps API,
    Dark Sky
]
"""

import os
import urllib.request
import urllib.parse
import json

GOOGLE_KEY = os.environ["GOOGLE_API_KEY"] or ""
DARKSKY_KEY = os.environ["DARKSKY_API_KEY"] or ""

CITY = urllib.parse.quote("Lavras, MG".lower())
BASE_URL_GOOGLE = "https://maps.googleapis.com/maps/api/geocode/json"
BASE_URL_DARKSY = "https://api.darksky.net/forecast/{}/".format(DARKSKY_KEY)


def find_coord():
    url = BASE_URL_GOOGLE + "?address={}&key={}".format(CITY, GOOGLE_KEY)

    response = ""
    try:
        response = json.loads(urllib.request.urlopen(url).read())
    except Exception as e:
        exit(1)

    if(response['status'] != 'OK'):
        return "x.x"

    location = response['results'][0]['geometry']['location']
    return {'lat': location['lat'], 'lng': location['lng']}


def get_wheather(location):
    url = BASE_URL_DARKSY + "{},{}?units=si".format(
         location['lat'], location['lng']
    )

    response = ""
    try:
        response = json.loads(urllib.request.urlopen(url).read())
    except Exception as e:
        exit(1)

    currently = response['currently']

    return {
        'temperature': round(float(currently['temperature'])),
        'summary': currently['summary'].lower()
    }


def main():
    location = find_coord()
    wheather = get_wheather(location)

    print("{} °C, {}".format(wheather['temperature'], wheather['summary']))


main()
