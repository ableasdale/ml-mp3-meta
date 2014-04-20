from __future__ import unicode_literals
import os
import http.client
import urllib 


import time, datetime
import concurrent.futures
from base64 import b64encode

# Traverses a specified directory containing MP3 files and builds a database 
# from the metadata in each of the files in that directory
# and send them over to MarkLogic via an HTTP/XDBC request (not decided yet)
# c:\Python34\python.exe d:\ml-mp3-meta\src\main\python\traverse-music-directory.py

MUSIC_DIR = "C:\\Users\\Public\\Music\\Sample Music"
REST_SERVER_PORT = 8004
HOSTNAME = "localhost"
ADMIN_USER = "q"
ADMIN_PASSWORD = "q"
CREDENTIALS = bytes((ADMIN_USER+':'+ADMIN_PASSWORD), encoding='utf-8') 

def http_post_file(filename):
	connection = http.client.HTTPConnection(HOSTNAME, REST_SERVER_PORT)
	userAndPass = b64encode(CREDENTIALS).decode("ascii")
	headers = { 'Authorization' : 'Basic %s' %  userAndPass, 'Content-type' : 'application/octet-stream' }	
	f = open(filename, 'rb')
	try:
		connection.request('POST', '/mp3-meta.xqy?filename='+urllib.parse.quote_plus(filename.replace("\\", "/")), f, headers)	
	except OSError as e: 
		print ("Failed with:", e.strerror)
		print ("Error code:", e.code)
	finally:
		f.close()
	response = connection.getresponse()	
	if response.status != 200:
		print("EXCEPTION: " + filename + " | " + str(response.status) + " | " + response.reason + " | "  + response.read().decode())


# Main #

# traverse the directory from a given root with os.walk(".")	
for root, dirs, files in os.walk(MUSIC_DIR):
	# print the file and path with :: print (item) 
	for file in files:
                # task a single thread with the processing for that file
                # executor.submit(process_file, os.path.join(root, file))
				if file.endswith('.mp3'):
					print(os.path.join(root, file))
					# post it to the web server
					http_post_file(os.path.join(root, file))
				
