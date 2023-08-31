Sample init scripts and service configuration for skytered
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/skytered.service:    systemd service unit configuration
    contrib/init/skytered.openrc:     OpenRC compatible SysV style init script
    contrib/init/skytered.openrcconf: OpenRC conf.d file
    contrib/init/skytered.conf:       Upstart service configuration file
    contrib/init/skytered.init:       CentOS compatible SysV style init script

Service User
---------------------------------

All three Linux startup configurations assume the existence of a "skyterecore" user
and group.  They must be created before attempting to use these scripts.
The OS X configuration assumes skytered will be set up for the current user.

Configuration
---------------------------------

At a bare minimum, skytered requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, skytered will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that skytered and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If skytered is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running skytered without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `contrib/debian/examples/skytere.conf`.

Paths
---------------------------------

### Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/skytered`  
Configuration file:  `/etc/skyterecore/skytere.conf`  
Data directory:      `/var/lib/skytered`  
PID file:            `/var/run/skytered/skytered.pid` (OpenRC and Upstart) or `/var/lib/skytered/skytered.pid` (systemd)  
Lock file:           `/var/lock/subsys/skytered` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the skyterecore user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
skyterecore user and group.  Access to skytere-cli and other skytered rpc clients
can then be controlled by group membership.

### Mac OS X

Binary:              `/usr/local/bin/skytered`  
Configuration file:  `~/Library/Application Support/SkytereCore/skytere.conf`  
Data directory:      `~/Library/Application Support/SkytereCore`
Lock file:           `~/Library/Application Support/SkytereCore/.lock`

Installing Service Configuration
-----------------------------------

### systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start skytered` and to enable for system startup run
`systemctl enable skytered`

### OpenRC

Rename skytered.openrc to skytered and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/skytered start` and configure it to run on startup with
`rc-update add skytered`

### Upstart (for Debian/Ubuntu based distributions)

Drop skytered.conf in /etc/init.  Test by running `service skytered start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

### CentOS

Copy skytered.init to /etc/init.d/skytered. Test by running `service skytered start`.

Using this script, you can adjust the path and flags to the skytered program by
setting the SKYTERED and FLAGS environment variables in the file
/etc/sysconfig/skytered. You can also use the DAEMONOPTS environment variable here.

### Mac OS X

Copy org.skytere.skytered.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.skytere.skytered.plist`.

This Launch Agent will cause skytered to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run skytered as the current user.
You will need to modify org.skytere.skytered.plist if you intend to use it as a
Launch Daemon with a dedicated skyterecore user.

Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
