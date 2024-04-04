#!/usr/bin/env sh

if pgrep -x "wlogout" > /dev/null
then
    pkill -x "wlogout"
    exit 0
fi

w_path=`dirname "$(realpath $0)"`

template="$w_path/style.css"

monitor_w=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
monitor_h=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
monitor_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
hypr_border=`hyprctl -j getoption decoration:rounding | jq '.int'`

export margin_x=$(( monitor_w * 35 / monitor_scale ))
export margin_y=$(( monitor_h * 25 / monitor_scale ))

export font_size=$(( monitor_h * 2 / 100 ))
export active_radius=$(( hypr_border * 5 ))
export button_radius=$(( hypr_border * 8 ))

style=`envsubst < $template`
wlogout -b 2 -c 0 -r 0 -m 0 --css <(echo "$style")
