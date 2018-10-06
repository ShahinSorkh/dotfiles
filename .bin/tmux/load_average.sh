echo $(uptime | rev | cut -d: -f1 | rev | sed 's/,//g' | xargs)
