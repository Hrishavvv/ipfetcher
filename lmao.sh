#!/bin/bash

# Function to fetch IP details
fetch_ip_details() {
    url="http://ip-api.com/json/$1"
    response=$(curl -s "$url")

    if [ $? -eq 0 ]; then
        # Fetching IP details
        details=$(echo "$response" | jq -r 'to_entries | map("\(.key): \(.value)")[]')
        # Highlighting 'ISP' and its details in orange and others in cyan
        highlighted_details=$(echo "$details" | sed -e 's/ISP: /\\033[38;5;208m&\\033[0m/g' | sed -e 's/\bISP\b/\\033[38;5;208m&\\033[0m/g' | sed -e 's/\b\(.*\): /\1: \\033[36m/g')
        echo -e "$highlighted_details"
    else
        echo -e "\033[91mFailed to fetch IP details. Please check the IP address and try again.\033[0m"  # Red color for error message
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
