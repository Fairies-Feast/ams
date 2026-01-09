import sys

command = " ".join(sys.argv[1:])
if command == "" or command == "help":
  print("ppi help > Help\nppi run [file] > Run an exe, tar, etc file")
elif command.startswith("run"):
  print("Coming, soon!")
