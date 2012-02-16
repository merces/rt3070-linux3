Driver Install:
	the README_STA_usb include in the driver is outdate.
    Please use following command ( # is comment line , after the  ">"  is command) to install driver
    # extract driver
    > tar xvf 2009_1120_RT3070_Linux_STA_v2.1.2.0.tar.gz
    # enter the driver folder that just extract
    > cd 2009_1120_RT3070_Linux_STA_v2.1.2.0
    # compile the driver (system need install kernel-header package, should be installed by default)
    > make
    # install the driver to system (need "root" right)
    > make install
    #plugin the DWA-125(USB device) then the driver should be loadup by system.
    # now user may use "networkmanager" to site survey and connect to AP.
    
    
Notice 1:
	This driver support both RT3070 and RT2870 chipset base products, as folloowing pid/vid shows
		{USB_DEVICE(0x07D1,0x3C0A)}, /* D-Link DWA-140 B2*/
		{USB_DEVICE(0x07D1,0x3C0B)}, /* D-Link DWA-110 B1*/
		{USB_DEVICE(0x07D1,0x3C0D)}, /* D-Link DWA-125 A1*/
		{USB_DEVICE(0x07D1,0x3C0E)}, /* D-Link WUA-2340 B1*/
		{USB_DEVICE(0x07D1,0x3C0F)}, /* D-Link DWL-G122 E1*/
		{USB_DEVICE(0x07D1,0x3C15)}, /* D-Link DWA-140 B3*/
		{USB_DEVICE(0x07D1,0x3C16)}, /* D-Link DWA-125 A2*/
		/*RT2870*/
		{USB_DEVICE(0x07D1,0x3C09)}, /* D-Link DWA-140 B1*/
		{USB_DEVICE(0x07D1,0x3C11)}, /* D-Link DWA-160 B1*/
		{USB_DEVICE(0x07D1,0x3C13)}, /* D-Link DWA-130 B1*/
		
	Before installing and using this driver, user should remove rt2870 driver from system.
	#user should have root right to do following things.
	#close down the network interface
	> ifconfig raX down
	#where X is current rt2870sta's network interface number.
	# unload driver from system
	> rmmod rt2870sta
	#remove driver from system.
	> rm /lib/modules/<kernel version>/kernel/drivers/net/wireless/<driver name>
	#where <driver name> is rt2870sta.ko (2.6) or rt2870sta.o (2.4)
	#      <kernel version> is current running kernel version
	#update kernel modules list
	> depmod -a

Notice 2:	
	if the system's gcc version lower then 4.1, there might be an error happen while compile the driver.
	Edit os/linux/config.mk and remove "-Wpointer-sign" at line 77.