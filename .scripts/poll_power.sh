upower -e | head -n1 | xargs upower -i | grep percent | awk '{print $2}'
