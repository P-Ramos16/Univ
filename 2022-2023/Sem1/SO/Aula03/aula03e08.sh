#!/bin/bash
# select structure to create menus
select arg in $@; do
	case $REPLY in
		"q")
			echo "Adeus!"
			exit 0
		;;
		*)
			echo "You picked $arg ($REPLY)."
			echo "Select q to exit!"
		;;
	esac
done
