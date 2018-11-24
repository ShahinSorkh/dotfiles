echo "$(free -mh | awk "/^Mem/ {print \$7\"/\"\$2}")"
