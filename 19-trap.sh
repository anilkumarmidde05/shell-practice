#!/bin/bash

set -e

trap 'echo "there is an error in $LINENO, Command: $BASH_COMMAND"' ERR

echo "Hello"
echo "Thank you"
echoo "error spelling"
echo "it wont print"