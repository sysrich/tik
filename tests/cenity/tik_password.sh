#!/bin/sh

. ./d_function_test

RESULT=0

#######################################
asserted_output="$(echo -e '--PASSWORD-- Set Encryption Passphrase -------------

[cenity][][test] --password --title=Set Encryption Passphrase')"
output="$(c_test --password --title='Set Encryption Passphrase' <<< "test" 2>&1)"
compare "$output" "$asserted_output"


# TODO: Fix cancel-label
#######################################
#asserted_output="$(echo -e 'EXPECTED OUTPUT')"
#output="$(c_test --password --title='Encrypted partition (/devsda) detected' --cancel-label='Skip' <<< "test" 2>&1)"
#compare "$output" "$asserted_output"

check_result
