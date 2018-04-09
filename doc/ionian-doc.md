Ionian OS Installation Manual
=============================

Ionian is a collection of different Ubuntu 16.04 based media with ionomy ioncoin software ready installed and updated automatially from the master ionomy ppa.  It is broken down into 3 different sets of images.

1) Ionian ISO -- this is an install-to computer iso image that will install Ubuntu Ionian 16.04 to a local computer.  Available in both i386 and amd64 versions  

2) Ionian USB -- this is meant as a complete copy-and-run solution.  With this image you can run directly from the usb medium, also available in i386 and amd64 versions  

3) Ionian VDI -- These images are meant for use in Oracle VIrtualBox environments.  Again, i386 and mad64 versions are available 


Virtualbox VDI installation
---------------------------
amd64 and i386 follow the same installation process.  
1) Download the current Ionian vdi (32 or 64 bit) from http://download/ioncoin.org/Ionian/vdi  
2) Unzip the vdi file that you have just downloaded  
3) Create a new 32 or 64 bit Virtual Machine in Oracle Virtualbox as documented at <a href="https://www.virtualbox.org/manual" target="_blank">https://www.virtualbox.org/manual</a>   
4) Select "Use an existing disk file" and select your downloaded VDI as shown below  
  
32 Bit  

![](ionian-doc-images/create_32_bit.png)  
  
  64 Bit  

![](ionian-doc-images/create_64_bit.png)
  
 5) Start and run your new Ionian OS
  
Ionian USB Installation
-----------------------
Download the current USB image (i386 or amd64) from http://download.ioncoin.org/usb/    

1) Windows Install

A) Download rufus (or similar SD writing software) rufus can be downloaded from
  https://rufus.akeo.ie/

B) insert your USB Flash Drive (16 GB or Larger, USB 3.0 Recommended) into an
  unused usb slot

C) double click on your chosen USB writing tool and follow the instructions to install Ionian-&lt;amd64|i386&gt;-&lt;version&gt;.img.xz to your USB Flash Drive.  
(Rufus shown below)    

![](ionian-doc-images/rufus.png)
  
  
  

D) remove the USB Flash Drive replace in your chosen system and reboot (note: first boot will take a short time to configure the ionian user home directory, please be patient).  
 

2) Linux/OSX Install   
 
A) mkusb  

&nbsp;i) install mkusb for your system using the appropriate package manager.

&nbsp;ii) insert your USB Flash Drive (16 GB or Larger, USB3.0 Recommended)) into an
  unused USB slot.  
  
&nbsp;iii) start mkusb and select the Ionian-<amd64|i386\>-<version\>-img.xz file that you downloaded and follow the instructions.

&nbsp;iv) once mkusb has finished you can remove the USB Flash Drive replace in your system and reboot (note: first boot will take a short time to configure the ionian user home directory, please be patient).  
   
B) Using DD from the CLI  

&nbsp;i) insert your USB Flash Drive (16 GB or Larger, USB3.0 Recommended)) into an
  unused USB slot.  
&nbsp;ii) Enter the following command at the CLI prompt in the directory you downloaded the USB image into 
 
"sudo xzcat Ionian-<amd64|i386\>-<version\>.img.xz  | sudo dd of=/dev/sdX bs=4096 status=progress"  

(where X is the letter of your USB Flash Drive  

&nbsp;iii) once dd has finished you can remove the USB Flash Drive replace in your chosen system and reboot (note: first boot will take a short time to configure the ionian user home directory, please be patient).  

Ionian ISO Installation
---------------------- 

Download the current ISO image (i386 or amd64) from http://download.ioncoin.org/iso/ and burn the image to a DVD using the appropriate tools (far too many burning tools to mention here)    

Put the DVD that you have created into the DVD drive of the system and select try or install.  
-- note: if "Try Ionian without installing" is selected, ALL changes you make to the system will be lost on reboot.  This is due to the installation being on DVD with no write capabilities.  If needed, you can create a casper-rw usb flash drive to save your changes - this is beyond the scope of this document. 
