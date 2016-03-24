#!/usr/bin/bash

# Run it as:
# zsh ~/.i3/my_lemonbar.sh | lemonbar -p -f "LibarationMono-9:Regular" -f "fontawesome"
#
# Requires: termite, nmtui, alsautils, mailcheck, font awesome
# go to https://github.com/LemonBoy/bar for tips

PAD="  "
BAT_BIAS=3 # My battery often decides to stop charging at what is reported as 97-99%
IW="wlp2s0"

Clock() {
    #DATE=$(date "+%{c T2}\uf017%{T1}  %a %b %d %H:%M")
    DATE=$(date "+%{c T2} %a %b %d %H:%M")
    echo -ne "$DATE"
}

Battery() {
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    BAT=$(((BAT + BAT_BIAS) >= 100 ? 100 : BAT))
    case $BAT in
        8* | 9* | 100)  echo -ne '%{T2}\uf240%{T1}';;
        6* | 7*)        echo -ne '%{T2}\uf241%{T1}';;
        4* | 5*)        echo -ne '%{T2}\uf242%{T1}';;
        1* | 2* | 3*)   echo -ne '%{T2}\uf243%{T1}';;
        *)              echo -ne '%{T2}\uf244%{T1}';;
    esac
    echo -n " $BAT %"
}

Wifi() {
    #WIFI_SSID=$(iw $IW link | grep 'SSID' | sed 's/SSID: //' | sed 's/\t//')
    #WIFI_SIGNAL=$(iw $IW link | grep 'signal' | sed 's/signal: //' | sed 's/ dBm//' | sed 's/\t//')
    #echo -ne '%{T2}\uf1eb%{T1}' $WIFI_SSID '%{A}'
    WIFI_SSID=$(iwgetid -r)
    if [ -z "$WIFI_SSID" ]
    then
        echo '%{T2}\uf1eb%{T1}  No Connection'
    else
        echo '%{T2}\uf1eb%{T1}' $WIFI_SSID '%{A}'
    fi
}

Sound() {
    STATUS=$(amixer get Master | grep 'Left: Playback' | grep -o '\[on]')
    VOLUME=$(amixer get Master | grep 'Left: Playback' | grep -o '...%' | sed 's/\[//' | sed 's/%//' | sed 's/ //')
    if [ "$STATUS" = "[on]" ] && [ $VOLUME -gt 0 ]; then
        echo -ne '%{T2}\uf028%{T1}' $VOLUME%
    else
        echo -ne '%{T2}\uf026%{T1}' "off"
    fi
}

c=0
while true; do
    if [ $((c % 10)) -eq 0 ]; then clock="$(Clock)"; fi
    if [ $((c % 15)) -eq 0 ]; then wifi="$(Wifi)"; fi
    if [ $((c % 60)) -eq 0 ]; then battery="$(Battery)"; fi
    
    # Draw Lennyface (left aligned)
    echo -ne "%{l}%{F#000000}%{B#F5F6F7}\u0028 \u0361\u00b0 \u035c\u0296 \u0361\u00b0\u0029"
    
    # Draw time (centered)
    echo -n "%{c}%{F#000000}%{B#F5F6F7}"$PAD" $clock "
    
    # Draw Sound, Wifi, and Battery (right aligned)
    echo "%{r}%{F#000000}%{B#F5F6F7}"$PAD" $(Sound) "$PAD" $wifi "$PAD" $battery "
    
    # Draw Power button (right aligned) (not clickable)
    # echo -e "%{A2:poweroff:}%{A3:reboot:} "$PAD" %{T2}\uf011%{T1} "$PAD" %{A}%{A}"
    
    c=$((c+1));
    sleep 1;
done
