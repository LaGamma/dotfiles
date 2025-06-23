upower -e | head -n1 | xargs upower -i | grep state | awk '{print $2}'
