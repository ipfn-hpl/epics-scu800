#!../../bin/linux-x86_64/scu800

#- You may have to change scu800 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet( "STREAM_PROTOCOL_PATH", "$(TOP)/db" )

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/scu800.dbd"
scu800_registerRecordDeviceDriver pdbbase

## Load Serial drivers
drvAsynSerialPortConfigure("RS485","/dev/rs485")
asynSetOption("RS485", 0, "baud", "38400")
asynSetOption("RS485", 0, "bits", "8")
asynSetOption("RS485", 0, "parity", "none")
asynSetOption("RS485", 0, "stop", "1")
#asynSetOption("RS485", 0, "clocal", "Y")
#asynSetOption("RS485", 0, "crtscts", "N")

drvAsynSerialPortConfigure("RS232","/dev/edwardsADC")
asynSetOption("RS485", 0, "baud", "9600")
asynSetOption("RS485", 0, "bits", "8")
asynSetOption("RS485", 0, "parity", "none")
asynSetOption("RS485", 0, "stop", "1")
#asynSetOption("RS485", 0, "clocal", "Y")
#asynSetOption("RS485", 0, "crtscts", "N")

## Load record instances
#dbLoadRecords("db/xxx.db","user=bernardo")
dbLoadRecords("db/edwards.db", "P=UUU:,R=EDW:,A=01,BUS=RS485")

var streamError 1
#var streamDebug 1
#streamSetLogfile("stream_logfile.txt")


cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=bernardo"
