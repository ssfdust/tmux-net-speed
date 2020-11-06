get_weather() {
    if [[ -f /tmp/tmux-weather/weather.txt ]];then
        /usr/bin/cat /tmp/tmux-weather/weather.txt
    else
        echo ""
    fi
}
get_weather
