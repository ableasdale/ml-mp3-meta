import os
import http.client
import time, datetime
import concurrent.futures
from base64 import b64encode

# Traverses a specified directory containing MP3 files and builds a database 
# from the metadata in each of the files in that directory
# and send them over to MarkLogic via an HTTP/XDBC request (not decided yet)
# c:\Python34\python.exe d:\ml-mp3-meta\src\main\python\traverse-music-directory.py

MUSIC_DIR = "C:\\Users\\Public\\Music\\Sample Music"



# Main #

# traverse the directory from a given root with os.walk(".")	
for root, dirs, files in os.walk(MUSIC_DIR):
	# print the file and path with :: print (item) 
	for file in files:
                # task a single thread with the processing for that file
                # executor.submit(process_file, os.path.join(root, file))
				if file.endswith('.mp3'):
					print(os.path.join(root, file))
				
