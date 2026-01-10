import sys
import tkinter

command = sys.argv[1:]

if len(command) >= 1:
  base = command[0]
  if base == "help":
    print("Commands:\nams: starts the application\nams help: shows this message")
elif len(command) == 0:
  print("AMS : Starting application...")
  root = tkinter.Tk()
  root.mainloop()
else:
  print("Try 'ams help'")
