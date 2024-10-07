important note: 
By using/executing "Hcxtoolscript.sh", you agree that this is only for educational purposes, we are not responsible for any illegal activities or harm caused.

Requirements:
- Mostly any linux distro
- Python 3
- hxcdumptool 6.3.4 (or higher)
- hxctools
- Wifi adapter (preferably one that allows monitor mode)
- an API key from onlinehashcrack.com 

How to use:
make you sure you have hxcdumptool working
run ./Deskstop/Hcxtoolscript.sh (if you have it on your desktop, it works as long as you run on it in a terminal) on the default directory
enter channel range you wish to scan in, end the integer with an "a" if band is 2GHZ and "b" if band is 5GHZ (for example: for channel 7 at 2GHZ, "7a" or channel 8 with 5GHZ, "8b")
enter frequency range (for example: 2.443 , 2.437, 2.422)
enter any file and folder name
after some time, you will get a few hits and you will see the name of the ESSID in the lower area, press `ctrl + c`
after that pick which PMKID you wish to crack
enter API key
wait for the website to crack it, if it fails, the password is quite strong
