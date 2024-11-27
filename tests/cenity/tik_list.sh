#!/bin/sh

. ./d_function_test

RESULT=0

list_items=' virtio-0987654321 20G 3 unknown(2M),vfat(20M),btrfs(4.3G) virtio-test2 20G 3 unknown(2M),vfat(20M),btrfs(4.3G) virtio-test3 20G 3 unknown(2M),vfat(20M),btrfs(4.3G)'
#######################################
asserted_output="$(echo -e '--LIST------ Select A Disk ----------------

Press CTRL+C to cancel
Select the disk to install the operating system to.

\033[1mMake sure any important documents and files have been backed up.\033[0m

Item  Disk               Size  Partitions  Filesystems
0:    virtio-0987654321  20G   3           unknown(2M),vfat(20M),btrfs(4.3G)
1:    virtio-test2       20G   3           unknown(2M),vfat(20M),btrfs(4.3G)
2:    virtio-test3       20G   3           unknown(2M),vfat(20M),btrfs(4.3G)

Please select a item number
[cenity][][virtio-test3] --list --column=Disk --column=Size --column=Partitions --column=Filesystems --width=1050 --height=340 --title=Select A Disk --text=Select the disk to install the operating system to.\\n\\n<b>Make sure any important documents and files have been backed up.</b>\\n virtio-0987654321 20G 3 unknown(2M),vfat(20M),btrfs(4.3G) virtio-test2 20G 3 unknown(2M),vfat(20M),btrfs(4.3G) virtio-test3 20G 3 unknown(2M),vfat(20M),btrfs(4.3G)')"
output="$(c_test --list --column=Disk --column=Size --column=Partitions --column=Filesystems --width=1050 --height=340 --title="Select A Disk" --text="Select the disk to install the operating system to.\n\n<b>Make sure any important documents and files have been backed up.</b>\n" ${list_items} <<< "2" 2>&1)"
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--LIST------ Select A Disk ----------------

Press CTRL+C to cancel
Select the disk to install the operating system to.

\033[1mMake sure any important documents and files have been backed up.\033[0m

Item  Disk               Size  Partitions  Filesystems
0:    virtio-0987654321  20G   3           unknown(2M),vfat(20M),btrfs(4.3G)
1:    virtio-test2       20G   3           unknown(2M),vfat(20M),btrfs(4.3G)
2:    virtio-test3       20G   3           unknown(2M),vfat(20M),btrfs(4.3G)

Please select a item number
[cenity][][virtio-test2] --list --column=Disk --column=Size --column=Partitions --column=Filesystems --width=1050 --height=340 --title=Select A Disk --text=Select the disk to install the operating system to.\\n\\n<b>Make sure any important documents and files have been backed up.</b>\\n virtio-0987654321 20G 3 unknown(2M),vfat(20M),btrfs(4.3G) virtio-test2 20G 3 unknown(2M),vfat(20M),btrfs(4.3G) virtio-test3 20G 3 unknown(2M),vfat(20M),btrfs(4.3G)')"
output="$(c_test --list --column=Disk --column=Size --column=Partitions --column=Filesystems --width=1050 --height=340 --title="Select A Disk" --text="Select the disk to install the operating system to.\n\n<b>Make sure any important documents and files have been backed up.</b>\n" ${list_items} <<< "1" 2>&1)"
compare "$output" "$asserted_output"


list_items='tik-osimage-Aeon.20240731.raw.xz 1501130408 tik-osimage-Aeon.test2.raw.xz 1501130408 tik-osimage-Aeon.test3.raw.xz 1501130408'
#######################################
asserted_output="$(echo -e '--LIST------ Select A Image ----------------

Press CTRL+C to cancel
Select the operating system image to install.

Item  Image                             Size
0:    tik-osimage-Aeon.20240731.raw.xz  1501130408
1:    tik-osimage-Aeon.test2.raw.xz     1501130408
2:    tik-osimage-Aeon.test3.raw.xz     1501130408

Please select a item number
[cenity][][tik-osimage-Aeon.test2.raw.xz] --list --column=Image --column=Size --title=Select A Image --text=Select the operating system image to install.\\n tik-osimage-Aeon.20240731.raw.xz 1501130408 tik-osimage-Aeon.test2.raw.xz 1501130408 tik-osimage-Aeon.test3.raw.xz 1501130408')"
output="$(c_test --list --column=Image --column=Size --title="Select A Image" --text="Select the operating system image to install.\n" ${list_items} <<< "1" 2>&1)"
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--LIST------ Select A Image ----------------

Press CTRL+C to cancel
Select the operating system image to install.

Item  Image                             Size
0:    tik-osimage-Aeon.20240731.raw.xz  1501130408
1:    tik-osimage-Aeon.test2.raw.xz     1501130408
2:    tik-osimage-Aeon.test3.raw.xz     1501130408

Please select a item number
[cenity][][tik-osimage-Aeon.test3.raw.xz] --list --column=Image --column=Size --title=Select A Image --text=Select the operating system image to install.\\n tik-osimage-Aeon.20240731.raw.xz 1501130408 tik-osimage-Aeon.test2.raw.xz 1501130408 tik-osimage-Aeon.test3.raw.xz 1501130408')"
output="$(c_test --list --column=Image --column=Size --title="Select A Image" --text="Select the operating system image to install.\n" ${list_items} <<< "2" 2>&1)"
compare "$output" "$asserted_output"

check_result
