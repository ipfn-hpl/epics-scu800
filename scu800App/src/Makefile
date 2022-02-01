TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = scu800
# scu800.dbd will be created and installed
DBD += scu800.dbd

# scu800.dbd will be made up from these files:
scu800_DBD += base.dbd
scu800_DBD += asyn.dbd
scu800_DBD += drvAsynSerialPort.dbd
scu800_DBD += stream.dbd

# Include dbd files from all support applications:
#scu800_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#scu800_LIBS += xxx
scu800_LIBS += asyn
scu800_LIBS += stream

# scu800_registerRecordDeviceDriver.cpp derives from scu800.dbd
scu800_SRCS += scu800_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
scu800_SRCS_DEFAULT += scu800Main.cpp
scu800_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#scu800_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
scu800_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

