#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";

        # Icons for Font Awesome 5 Pro
        # 01d) icon="";;
        # 01n) icon="";;
        # 02d) icon="";;
        # 02n) icon="";;
        # 03d) icon="";;
        # 03n) icon="";;
        # 04*) icon="";;
        # 09*) icon="";;
        # 10d) icon="";;
        # 10n) icon="";;
        # 11*) icon="";;
        # 13*) icon="";;
        # 50*) icon="";;
        # *) icon="";
    esac

    echo $icon
}

get_duration() {

    osname=$(uname -s)

    case $osname in
        *BSD) date -r "$1" -u +%H:%M;;
        *) date --date="@$1" -u +%H:%M;;
    esac

}

KEY="6a47368fafd403704616bd574ba63d05"
CITY="Uxbridge,US"
UNITSC="metric"
UNITSF="imperial"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    currentc=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITSC")
    forecastc=$(curl -sf "$API/forecast?appid=$KEY&$CITY_PARAM&units=$UNITSC&cnt=1")
    currentf=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITSF")
    forecastf=$(curl -sf "$API/forecast?appid=$KEY&$CITY_PARAM&units=$UNITSF&cnt=1")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        currentc=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITSC")
        forecastc=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITSC&cnt=1")
        currentf=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITSF")
        forecastf=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITSF&cnt=1")
    fi
fi

if [ -n "$currentc" ] && [ -n "$forecastc" ] && [ -n "$currentf" ] && [ -n "$forecastf" ]; then
    current_tempc=$(echo "$currentc" | jq ".main.temp" | cut -d "." -f 1)
    current_tempf=$(echo "$currentf" | jq ".main.temp" | cut -d "." -f 1)
    current_icon=$(echo "$currentc" | jq -r ".weather[0].icon")

    forecast_tempc=$(echo "$forecastc" | jq ".list[].main.temp" | cut -d "." -f 1)
    forecast_tempf=$(echo "$forecastf" | jq ".list[].main.temp" | cut -d "." -f 1)
    forecast_icon=$(echo "$forecastc" | jq -r ".list[].weather[0].icon")


    if [ "$current_tempc" -gt "$forecast_tempc" ]; then
        trend=""
    elif [ "$forecast_tempc" -gt "$current_tempc" ]; then
        trend=""
    else
        trend=""
    fi


    sun_rise=$(echo "$currentc" | jq ".sys.sunrise")
    sun_set=$(echo "$currentc" | jq ".sys.sunset")
    now=$(date +%s)

    if [ "$sun_rise" -gt "$now" ]; then
        daytime=" $(date --date="@$sun_rise" +%H:%M)"
    elif [ "$sun_set" -gt "$now" ]; then
        daytime=" $(date --date="@$sun_set" +%H:%M)"
    else
        daytime=" $(date --date="@$sun_rise" +%H:%M)"
    fi

    echo "$(get_icon "$current_icon") $current_tempc$SYMBOL/$current_tempf$SYMBOL  $trend  $(get_icon "$forecast_icon") $forecast_tempc$SYMBOL/$forecast_tempf$SYMBOL   $daytime"
fi
