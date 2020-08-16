#! /usr/bin/env sh
# SCRIPT: /entrypoint.sh
# AUTHOR: @ox1d0
# DATE: 08-2001
# REV: 1.0.P
# PLATFORM: Not Platform Dependent
#
# PURPOSE" This script is used to monitor and log
# the status of a process as it starts and stops."
#
# REV LIST:
#
# set -x # Uncomment to debug this script
# set -n # Uncomment to check syntax without ANY execution
#
####################################################
########## DEFINE FILES AND VARIABLES HERE #########
####################################################
set -e
nginx && cd flask002/ && flask run
#find . -name 'runner.sh' | xargs bash
exec "$@"
