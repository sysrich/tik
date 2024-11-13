#!/bin/sh

. ./d_function_test

RESULT=0

#######################################
asserted_output="$(echo -e '--ERROR----- Installation Failed ----------------

Please file a bug report at \033[1mTEST URL\033[0m

Please include the \033[1mtik.log\033[0m file
It can be found on the IGNITION partition on this USB Stick

\033[1mSystem is shutting down\033[0m

Press CTRL+C to cancel
Press any key to continue
[cenity][][] --error --no-wrap --title=Installation Failed --text=Please file a bug report at <tt>TEST URL</tt>\\n\\nPlease include the <tt>tik.log</tt> file\\nIt can be found on the IGNITION partition on this USB Stick\\n\\n<b>System is shutting down</b>')"
output="$(c_test --error --no-wrap --title="Installation Failed" --text="Please file a bug report at <tt>TEST URL</tt>\n\nPlease include the <tt>tik.log</tt> file\nIt can be found on the IGNITION partition on this USB Stick\n\n<b>System is shutting down</b>" <<< "\n" 2>&1)"
compare "$output" "$asserted_output"

check_result
