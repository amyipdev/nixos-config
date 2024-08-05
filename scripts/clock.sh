while :; do
	if [ ! -f "/tmp/.clockLock-$(whoami)" ]; then
		echo "$(date +%H:%M)"
	else
		echo "$(date +%d/%m/%y) - $(idate --simple | head -n 1 | awk -F " - " '{print $1}')"
	fi
	sleep 0.054
done
