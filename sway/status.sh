SEP='  |  '

VOLUME() {
    amixer | head -6 | tail -1 | sed 's/^[^\[]*//'
}

POWER() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed 's/:/\n/g' | tail -1 | xargs
}

POWER_STATE() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | sed 's/:/\n/g' | tail -1 | xargs
}

POWER_TIME() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "time to empty" | sed 's/:/\n/g' | tail -1 | xargs
}

DATE() {
    date +'%Y-%m-%d %l:%M:%S %p'
}

WIFI() {
    iw dev wlp2s0 link | grep SSID | xargs
}

WIFI_STRENGTH() {
    iw dev wlp2s0 link | grep signal | xargs
}

WIFI_IP() {
    ip addr | grep wlp2s0 | tail -1 | awk -F'/' '{print $1}' | awk -F'inet ' '{print $2}'
}

PING_TIME() {
    if [ $(calc `date +%S` % 2) -eq 0 ]
    then
        timeout .2 ping -c 1 bwsi-racecar.com | grep time= | awk -F'=' '{print $4}' > ~/.config/sway/ping
    fi
    ms=$(cat ~/.config/sway/ping)
    if [ -n $ms ]
    then
        echo 'N/A'
    else
        echo $ms
    fi
}

echo -n $(WIFI_STRENGTH) '::' $(WIFI) '::' $(WIFI_IP) '   ' $(VOLUME) '   ' $(POWER_STATE) '::' $(POWER) \[$(POWER_TIME)\] '   ' $(DATE)
