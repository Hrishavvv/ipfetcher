#!/bin/bash

# Function to fetch IP details
fetch_ip_details() {
    url="http://ip-api.com/json/$1"
    response=$(curl -s "$url")

    if [ $? -eq 0 ]; then
        echo "$response" | jq -r 'to_entries | map("\(.key): \(.value)")[]'
    else
        echo "Failed to fetch IP details. Please check the IP address and try again."
    fi
}

# Red-styled "LMAO" ASCII art banner
echo -e "\033[91m   __         __    __     ______     ______    "
echo -e " /\ \       /\ \"-./  \   /\  __ \   /\  __ \   "
echo -e " \ \ \____  \ \ \-./\ \  \ \  __ \  \ \ \/\ \  "
echo -e "  \ \_____\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\ "
echo -e "   \/_____/   \/_/  \/_/   \/_/\/_/   \/_____/ \033[0m"

# Get user input for the IP address
read -p $'\e[92mEnter the IP address: \e[0m' ip
fetch_ip_details "$ip"
