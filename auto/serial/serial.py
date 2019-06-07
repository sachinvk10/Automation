import serial
ser = serial.Serial("/dev/ttyS0", 115200)
ser.write("Hello world")
x = ser.readline()
print(x)
