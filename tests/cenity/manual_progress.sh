#!/bin/sh

cenity="../../usr/lib/tik/lib/cenity"
. $cenity

RESULT=1

z_result="$((
echo "10" ; sleep 1
echo "# Updating mail logs" ; sleep 1
echo "20" ; sleep 1
echo "# Resetting cron jobs" ; sleep 1
echo "50" ; sleep 1
echo "This line will just be ignored" ; sleep 1
echo "75" ; sleep 1
echo "# Rebooting system" ; sleep 1
echo "100" ; sleep 1
) |
zenity --progress --title="Update System Logs" \
  --text="Scanning mail logs..." --percentage=0)" ; z_retval=$?

(
echo "10" ; sleep 1
echo "# Updating mail logs" ; sleep 1
echo "20" ; sleep 1
echo "# Resetting cron jobs" ; sleep 1
echo "50" ; sleep 1
echo "This line will just be ignored" ; sleep 1
echo "75" ; sleep 1
echo "# Rebooting system" ; sleep 1
echo "100" ; sleep 1
) |
cenity c_result --progress --title="Update System Logs" \
  --text="Scanning mail logs..." --percentage=0 ; c_retval=$?


echo "[cenity][${c_retval}][${c_result}]"
echo "[zenity][${z_retval}][${z_result}]"

RESULT=1

z_result="$((
echo "# Updating mail logs" ; sleep 1
echo "# Resetting cron jobs" ; sleep 1
echo "This line will just be ignored" ; sleep 1
echo "# Rebooting system" ; sleep 1
) |
zenity --progress --title="Update System Logs" \
   --pulsate --auto-close --no-cancel)" ; z_retval=$?

(
echo "# Updating mail logs" ; sleep 1
echo "# Resetting cron jobs" ; sleep 1
echo "This line will just be ignored" ; sleep 1
echo "# Rebooting system" ; sleep 1
) |
cenity c_result --progress --title="Update System Logs" \
   --pulsate --auto-close --no-cancel ; c_retval=$?


echo "[cenity][${c_retval}][${c_result}]"
echo "[zenity][${z_retval}][${z_result}]"



if [[ ${c_retval} = ${z_retval} ]] && [[ ${c_result} = ${z_result} ]]; then
  RESULT=0
fi

echo "Result: $RESULT"

