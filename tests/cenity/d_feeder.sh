#!/bin/sh

mkfifo encrypt_pipe

sleep 5 
echo "# first line" > encrypt_pipe
sleep 1
echo "# second line" > encrypt_pipe
sleep 2
echo "invisible line" > encrypt_pipe
sleep 1
echo "# third line" > encrypt_pipe
sleep 1
echo "100" > encrypt_pipe

rm encrypt_pipe
