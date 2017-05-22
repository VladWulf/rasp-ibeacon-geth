# test BLE Scanning software
# jcs 6/8/2014

import blescan
import sys
import os

import bluetooth._bluetooth as bluez


dev_id = 0
try:
	sock = bluez.hci_open_dev(dev_id)
	print "ble thread started"

except:
	print "error accessing bluetooth device..."
    	sys.exit(1)

blescan.hci_le_set_scan_parameters(sock)
blescan.hci_enable_le_scan(sock)


count = 0
signals = {'e8:54:cf:58:12:19': 0,'cd:08:33:a6:de:14': 0,'d9:01:91:10:7e:fa': 0}

   
def mapData(data,signals):
   signals2 = {'Node C': 0, 'Node A': 0, 'Node B': 0}
   data = data.split(',')
   for signal in signals:
      if(data[0] == signal):
         signals[signal] = abs(int(data[1]))
   signals2[signals2.keys()[0]] = signals[signals.keys()[0]]
   signals2[signals2.keys()[1]] = signals[signals.keys()[1]]
   signals2[signals2.keys()[2]] = signals[signals.keys()[2]]
   return signals2

def scan_devices(data, signals):		
   while True:
     returnedList = blescan.parse_events(sock, 1)
     if returnedList:
        data = returnedList[0]
        res = mapData(data, signals)
	print res

scan_devices('',signals)




from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
  return "Hello World"

if __name__=='__main__':
  app.run()
