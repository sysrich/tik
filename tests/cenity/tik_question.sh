#!/bin/sh

. ./d_function_test

RESULT=0

#######################################
asserted_output="\
--QUESTION--  ----------------

Do you really want to quit?

1) Yes
2) No
#? Selected: 1) yes
[cenity][][] --question --text=Do you really want to quit?"

output=$(c_test --question --text="Do you really want to quit?" <<< 1 2>&1) 
compare "$output" "$asserted_output"


asserted_output="\
--QUESTION--  ----------------

Do you really want to quit?

1) Yes
2) No
#? Selected: 2) No
[cenity][1][] --question --text=Do you really want to quit?"

output=$(c_test --question --text="Do you really want to quit?" <<< 2 2>&1)
compare "$output" "$asserted_output"


#######################################
asserted_output="\
--QUESTION-- Backup users from the existing install? ----------------

These users will be restored to the new installation.

1) Yes
2) No
#? Selected: 1) yes
[cenity][][] --question --no-wrap --title=Backup users from the existing install? --text=These users will be restored to the new installation."

output=$(c_test --question --no-wrap --title="Backup users from the existing install?" --text="These users will be restored to the new installation." <<< 1 2>&1)
compare "$output" "$asserted_output"


asserted_output="\
--QUESTION-- Backup users from the existing install? ----------------

These users will be restored to the new installation.

1) Yes
2) No
#? Selected: 2) No
[cenity][1][] --question --no-wrap --title=Backup users from the existing install? --text=These users will be restored to the new installation."

output=$(c_test --question --no-wrap --title="Backup users from the existing install?" --text="These users will be restored to the new installation." <<< 2 2>&1)
compare "$output" "$asserted_output"


# TODO implement ok/cancel label and icon ahndling

#c_test --width=600 --question --icon=security-low-symbolic --title="Warning" --ok-label="Cancel Installation" --cancel-label="I Understand, Proceed Anyway" --text="${preamble}\n\nReason: <b>SecureBoot Disabled</b> and ${reason}\n\n${secureboot_warning}"

#c_test --question --no-wrap --cancel-label="No, Delete Backup" --title="Existing user backup detected" --text="These users can be restored to the new installation\n\nWould you like to use this backup?"

check_result
