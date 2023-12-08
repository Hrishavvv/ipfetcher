from rich import print
import requests

def fetch_ip_details(ip_address):
    url = f"http://ip-api.com/json/{ip_address}"
    response = requests.get(url)
    
    if response.status_code == 200:
        ip_details = response.json()
        for key, value in ip_details.items():
            if key == 'status':  # Checking for specific details like 'status'
                print(f"[orange1]{key}[/orange1]: [cyan]{value}[/cyan]")  # Displaying 'status' in orange and its value in cyan
            else:
                print(f"[cyan]{key}[/cyan]: [cyan]{value}[/cyan]")  # Displaying all other details in cyan
    else:
        print("[red]Failed to fetch IP details. Please check the IP address and try again.[/red]")  # Error message in red

# Red-styled "LMAO" ASCII art banner using rich
print(
"""
[red]   __         __    __     ______     ______    [/red]
[red] /\ \       /\ "-./  \   /\  __ \   /\  __ \   [/red]
[red] \ \ \____  \ \ \-./\ \  \ \  __ \  \ \ \/\ \  [/red]
[red]  \ \_____\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\ [/red]
[red]   \/_____/   \/_/  \/_/   \/_/\/_/   \/_____/  [/red]
"""
)

# Get user input for the IP address (in ANSI light green)
ip = input("\033[92;1mEnter the IP address: \033[0m")
fetch_ip_details(ip)
                      
