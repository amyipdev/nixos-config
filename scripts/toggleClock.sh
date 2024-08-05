FILEPATH="/tmp/.clockLock-$(whoami)"
if [ ! -f "$FILEPATH" ]; then
	touch "$FILEPATH"
else
	rm "$FILEPATH"
fi
