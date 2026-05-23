#!/bin/bash

echo "all variables passed to script: $@"
echo "number of variables passed to script: $#"
echo "script name: $0"
echo "present working direction: $PWD"
echo "who is running the script: $HOME"

echo "PID of the script: $$"
sleep 100 &
echo "background process ID: $!"
 