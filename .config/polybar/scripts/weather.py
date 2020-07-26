#!/usr/bin/env python
import requests


def main():
    zip = 38655
    api_key = "a784299ca2686eb858b34475dfbd7667"

    data  = {'zip': zip, 'appid': api_key, 'units': 'imperial'}
    weather = requests.get('http://api.openweathermap.org/data/2.5/weather', params=data).json()
    desc = weather['weather'][0]['description'].capitalize()
    print(desc)
    icons = {
        "Thunderstorm":"U+2601", 
        "Drizzle":"U+1F327", 
        "Rain":"U+1F327", 
        "Snow":"U+2744", 
        "Mist":"", 
        "Smoke":"", 
        "Haze":"", 
        "Dust":"", 
        "Fog":"", 
        "Sand":"", 
        "Dust":"", 
        "Ash":"", 
        "Squall":"", 
        "Tornado":"", 
        "Clear":"", 
        "Clouds":""
        }
    icon = icons.get (desc, 'none')
    if icon == 'none':
        icon = ''
    temp = int(float(weather['main']['temp']))
    #return icon + ' ' + desc + ' ' + temp + ''
    return ' {} {}{}F '.format(icon, temp, '\u00B0')


if __name__ == "__main__":
	print(main())
