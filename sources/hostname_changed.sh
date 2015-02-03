#!/bin/sh
### BEGIN INIT INFO
# Provides:          hostname_changed
# Required-Start:    mountall
# Required-Stop:
# Should-Start:      glibc
# Default-Start:     S
# Default-Stop:
# Short-Description: Writes the current hostname to disk
# Description:       Writes the current hostname to disk
### END INIT INFO
## INSTALLING:
# sudo cp hostname_changed.sh /etc/init.d/hostname_changed.sh
# sudo chmod u+x /etc/init.d/hostname_changed.sh
# sudo update-rc.d hostname_changed.sh start 36 S .


PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

. /lib/init/vars.sh
. /lib/lsb/init-functions

do_start () {
	# if hostname != /et/hostname we must fix host, hostname and create the new rsa key
	HOSTNAME=$(hostname)
	OLD_HOSTNAME=`cat /etc/hostname`

	if [ ! -z "$OLD_HOSTNAME" ] && [ ! -z "$HOSTNAME" ] && [ "$OLD_HOSTNAME" != "$HOSTNAME" ]; then

		echo "New hostname detected..."
		for file in /etc/hostname /etc/hosts; do
			echo -n "replacing ${OLD_HOSTNAME} with $HOSTNAME in file $file..."
			sed s:${OLD_HOSTNAME}:${HOSTNAME}:g $file > ${file}.new && mv ${file}.new $file && echo "done" || echo "failed"
		done

		echo
		[ "$VERBOSE" != no ] && log_action_begin_msg "building new ssh key"
		rm -rf /etc/ssh/ssh_host_*
		ssh-keygen -A
		ES=$?
		[ "$VERBOSE" != no ] && log_action_end_msg $ES

		exit $ES
	fi
	exit 0

	# /cfs-hostname-changer
}


case "$1" in
  start|"")
	do_start
	;;
  restart|reload|force-reload)
	echo "Error: argument '$1' not supported" >&2
	exit 3
	;;
  stop)
	# No-op
	;;
  *)
	echo "Usage: hostname_changed.sh [start|stop]" >&2
	exit 3
	;;
esac

:
