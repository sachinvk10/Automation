#!/usr/bin/python

import serial
from pexpect_serial import SerialSpawn
ser = serial.Serial('/dev/ttyS0')
ss = SerialSpawn(ser)
ss.sendline('start')
ss.expect('done')

"""
import serial
ser = serial.Serial()
ser.boudrate = 115200
ser.port = '/dev/ttyS0'
ser
Serial<id=0xa81c10, open=False>(port='/dev/ttyS0', baudrate=115200, bytesize=8, parity='N', stopbits=1, timeout=None, xonxoff=0, rtscts=0)
ser.open()
ser.close()
"""


"""
import sys
from pexpect import pxssh
import getpass
from ConfigParser import SafeConfigParser
#parser = SafeConfigParser()
#parser.read('../conf/conf.cnf')
try:
    s = pxssh.pxssh()
    parser = SafeConfigParser()
    parser.read('/home/testuser/sachin/sky_auto/conf/conf.cnf')
    hostname = parser.get('config', 'hostname')
#raw_input('hostname: ')
#print parser.get('config', 'hostname')
    username = parser.get('config', 'username')
#raw_input('username: ')
    password = parser.get('config', 'password') 
#getpass.getpass('password: ')
    s.login(hostname, username, password)
    s.sendline('uptime')   # run a command
    s.prompt()             # match the prompt
    print(s.before)        # print everything before the prompt.
    s.sendline('ls -l')
    s.prompt()
    print(s.before)
    s.sendline('df')
    s.prompt()
    print(s.before)
    s.logout()
except pxssh.ExceptionPxssh as e:
    print("pxssh failed on login.")
    print(e)
"""
