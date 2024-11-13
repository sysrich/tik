#!/bin/sh

. ./d_function_test

RESULT=0

#######################################
./d_feeder.sh &
sleep 1
(tail -f encrypt_pipe) | c_test --progress --title="Configuring Encryption" --auto-close --no-cancel --width=400 > /tmp/out
strings=(
  "Configuring Encryption"
  "0% - # first line"
  "0% - # third line"
  "100%"
  "[cenity][][]"
)
cat /tmp/out
exit
string_test "${strings[@]}"
echo
rm -f /tmp/out


#######################################

(echo "10" ; sleep 1
echo "# Updating mail logs" ; sleep 1
echo "20" ; sleep 1
echo "# Resetting cron jobs" ; sleep 1
echo "50" ; sleep 1
echo "This line will just be ignored" ; sleep 1
echo "75" ; sleep 1
echo "# Rebooting system" ; sleep 1
echo "100" ; sleep 1
) | c_test --progress --title="Update System Logs" \
--text="Scanning mail logs..." --percentage=0 > /tmp/out 

strings=(
  "Update System Logs"
  "10% - # Updating mail logs"
  "100%"
  "[cenity][][]"
)
string_test "${strings[@]}"
echo
rm -f /tmp/out


#######################################
(cat /dev/zero | pv -f -F "# %b copied in %t %r" | /usr/bin/dd of=/dev/null bs=64k count=30GB) 2>&1 2>&1 | c_test --progress --title="Installing Testsystem" --pulsate --auto-close --no-cancel --width=400 > /tmp/out

strings=(
  "Installing Testsystem"
  "30000000000 bytes (30 GB, 28 GiB)"
  "# 27.9GiB copied in "
  "[cenity][][]"
)
string_test "${strings[@]}"
echo
rm -f /tmp/out

check_result


#TODO
#prun systemd-repart --no-pager --pretty=0 --empty=force --dry-run=no --key-file=${tik_keyfile} ${image_target} > >(d --progress --title="Installing ${TIK_OS_NAME}" --text="Deploying OS Image" --pulsate --auto-close --no-cancel --width=400)

#prun /usr/sbin/btrfs quota rescan -w ${mig_dir}/mnt | d_test --progress --title="Detected existing /home subvolume.." --pulsate --auto-close --no-cancel --width=400

#(prun /usr/sbin/btrfs send ${mig_dir}/mnt/${snap_dir} | pv -f -F "# %b copied in %t %r" | prun /usr/sbin/btrfs receive ${mig_dir}) 2>&1 | d_test --progress --title="Backing up /home" --pulsate --auto-close --no-cancel --width=400

#(prun /usr/sbin/btrfs send ${mig_dir}/mnt/${subsubvolname} | pv -f -F "# %b copied in %t %r" | prun /usr/sbin/btrfs receive ${mig_dir}/${snap_dir}/${subsubdirname}) 2>&1 | d_test --progress --title="Backing up containers" --pulsate --auto-close --no-cancel --width=400
