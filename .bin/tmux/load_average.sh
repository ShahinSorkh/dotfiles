echo $(uptime | awk "{printf \"%.2f %.2f %.2f\",strtonum(\$8),strtonum(\$9),strtonum(\$10)}")
