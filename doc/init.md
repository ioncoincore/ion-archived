# Sample init scripts and service configuration for iond

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

- [contrib/init/iond.service](contrib/init/iond.service):    systemd service unit configuration
- [contrib/init/iond.openrc](contrib/init/iond.openrc):     OpenRC compatible SysV style init script
- [contrib/init/iond.openrcconf](contrib/init/iond.openrcconf): OpenRC conf.d file
- [contrib/init/iond.conf](contrib/init/iond.conf):       Upstart service configuration file
- [contrib/init/iond.init](contrib/init/iond.init):       CentOS compatible SysV style init script

Table of Contents
-----------------
- [Sample init scripts and service configuration for iond](#sample-init-scripts-and-service-configuration-for-iond)
    - [1. Service User](#1-service-user)
    - [2. Configuration](#2-configuration)
    - [3. Paths](#3-paths)
    - [4. Installing Service Configuration](#4-installing-service-configuration)
        - [4(a) systemd](#4a-systemd)
        - [4(b) OpenRC](#4b-openrc)
        - [4(c) Upstart (for Debian/Ubuntu based distributions)](#4c-upstart-for-debianubuntu-based-distributions)
        - [4(d) CentOS](#4d-centos)
    - [5. Auto-respawn](#5-auto-respawn)


## 1. Service User
All three startup configurations assume the existence of a "ion" user
and group.  They must be created before attempting to use these scripts.

## 2. Configuration
At a bare minimum, iond requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, iond will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that iond and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If iond is run with "-daemon" flag, and no rpcpassword is set, it will
print a randomly generated suitable password to stderr.  You can also
generate one from the shell yourself like this:

bash -c 'tr -dc a-zA-Z0-9 < /dev/urandom | head -c32 && echo'

Once you have a password in hand, set rpcpassword= in /etc/ioncoin/ioncoin.conf

For an example configuration file that describes the configuration settings,
see contrib/debian/examples/ioncoin.conf.

## 3. Paths
All three configurations assume several paths that might need to be adjusted.

Binary:              /usr/bin/iond
Configuration file:  /etc/ioncoin/ioncoin.conf
Data directory:      /var/lib/iond
PID file:            /var/run/iond/iond.pid (OpenRC and Upstart)
                     /var/lib/iond/iond.pid (systemd)

The configuration file, PID directory (if applicable) and data directory
should all be owned by the ion user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
ion user and group.  Access to ion-cli and other iond rpc clients
can then be controlled by group membership.

## 4. Installing Service Configuration

### 4(a) systemd

Installing this .service file consists on just copying it to
/usr/lib/systemd/system directory, followed by the command
"systemctl daemon-reload" in order to update running systemd configuration.

To test, run "systemctl start iond" and to enable for system startup run
"systemctl enable iond"

### 4(b) OpenRC

Rename iond.openrc to iond and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
"/etc/init.d/iond start" and configure it to run on startup with
"rc-update add iond"

### 4(c) Upstart (for Debian/Ubuntu based distributions)

Drop iond.conf in /etc/init.  Test by running "service iond start"
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon uitility.

### 4(d) CentOS

Copy iond.init to /etc/init.d/iond. Test by running "service iond start".

Using this script, you can adjust the path and flags to the iond program by
setting the IOND and FLAGS environment variables in the file
/etc/sysconfig/iond. You can also use the DAEMONOPTS environment variable here.

## 5. Auto-respawn
Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
