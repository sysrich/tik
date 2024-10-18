#!/bin/sh

. ./d_function_test

RESULT=0

#######################################
asserted_output="$(echo -e '--ENTRY----- This is a ENTRY -------------

[cenity][][Test entry] --entry --text=This is a entry text --title=This is a ENTRY')"
output="$(c_test --entry --text="This is a entry text" --title="This is a ENTRY" <<< "Test entry" 2>&1)"
compare "$output" "$asserted_output"

check_result
