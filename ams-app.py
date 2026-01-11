import sys
import tkinter
import requests
import os

command = sys.argv[1:]

if len(command) >= 1:
  base = command[0]
  if base == "help":
    print("Commands:\nams help: shows this message\nams update : Update AMS\nams uninstall : Uninstall AMS")
  elif base == "update":
    print("AMS: Updating...")
    print("DO NOT RUN AMS until after you wait 15 seconds")
    os.system("sleep 2 && curl https://amsilla-ams.pages.dev/ams-app.py >> ams-app.py &")
    quit()
    quit()
    exit()
    exit()
    
  elif base == "uninstall":
    print("To uninstall AMS, delete these files: ams-install.sh, ams-temp.sh, ams-app.py. Some might have been already removed.")
    print("Then, follow the instructions for your operating system below. '-' means no more steps to uninstall AMS.")
    print("Windows: -")
    print("Other OS: -")
    print("Linux, Bash, MacOS: Then, run the command")
    print("Linux, Bash, MacOS: $ nano ~/.bashrc")
    print("Linux, Bash, MacOS: and delete the line/lines at the bottom that say:")
    print("Linux, Bash, MacOS: $ alias ams='cd ~ && python3 ams-app.py")
    print("On some operating systems, you might need to restart to finish uninstalling.")
    quit()
    quit()
    exit()
    exit()
    
else:
  print("Try 'ams help'")
