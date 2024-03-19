#!/usr/bin/env sh

if pgrep -x "wlogout" > /dev/null
then
    pkill -x "wlogout"
    exit 0
fi

layout="./layout"
template="./style.css"

monitor_w=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
monitor_h=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
monitor_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
hypr_border=`hyprctl -j getoption decoration:rounding | jq '.int'`

export x_mgn=$(( monitor_w * 35 / monitor_scale ))
export y_mgn=$(( monitor_h * 25 / monitor_scale ))
export x_hvr=$(( monitor_w * 32 / monitor_scale ))
export y_hvr=$(( monitor_h * 20 / monitor_scale ))

export fontSize=$(( monitor_h * 2 / 100 ))

export active_radius=$(( hypr_border * 5 ))
export button_radius=$(( hypr_border * 8 ))
export button_background="#222"
export button_color="#ff0000"

style=`envsubst < $template`
echo $style
wlogout -b 2 -c 0 -r 0 -m 0 --css <(echo "$style")
