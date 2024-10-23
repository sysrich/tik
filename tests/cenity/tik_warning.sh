#!/bin/sh

. ./d_function_test

RESULT=0

#######################################
asserted_output="\
--WARNING--- AC Power Recommended ----------------

Runnning on battery power detected

It is recommended to connect the system to AC power during the install

	Press key to continue
[cenity][][] --warning --no-wrap --title=AC Power Recommended --text=Runnning on battery power detected\n\nIt is recommended to connect the system to AC power during the install"
output=$(c_test --warning --no-wrap --title="AC Power Recommended" --text="Runnning on battery power detected\n\nIt is recommended to connect the system to AC power during the install" <<< "\n" 2>&1)
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--WARNING---  -------------security-low--

postamble

	Press key to continue
[cenity][][] --width=600 --warning --icon=security-low-symbolic --text=postamble')"
output=$(c_test --width=600 --warning --icon=security-low-symbolic --text="postamble" <<< "\n" 2>&1)
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--WARNING---  -------------security-medium--

preamble

Reason: reason

postamble

	Press key to continue
[cenity][][] --width=600 --warning --icon=security-medium-symbolic --text=preamble\\n\\nReason: reason\\n\\npostamble')"
output=$(c_test --width=600 --warning --icon=security-medium-symbolic --text="preamble\n\nReason: reason\n\npostamble" <<< "\n" 2>&1)
compare "$output" "$asserted_output"

check_result
