import requests

def fetch_ip_details(ip_address):
    url = f"http://ip-api.com/json/{ip_address}"
    response = requests.get(url)
    
    if response.status_code == 200:
        ip_details = response.json()
        for key, value in ip_details.items():
            print(f"{key}: {value}")
    else:
        print("Failed to fetch IP details. Please check the IP address and try again.")

# Red-styled "LMAO" ASCII art banner
print(r"""
\033[91m   __         __    __     ______     ______    
 /\ \       /\ "-./  \   /\  __ \   /\  __ \   
 \ \ \____  \ \ \-./\ \  \ \  __ \  \ \ \/\ \  
  \ \_____\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\ 
   \/_____/   \/_/  \/_/   \/_/\/_/   \/_____/ 
\033[0m
""")

# Get user input for the IP address
ip = input("\033[92mEnter the IP address: \033[0m")
fetch_ip_details(ip)
      
