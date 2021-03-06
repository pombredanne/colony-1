#!/bin/sh
# -*- coding: utf-8 -*-

# Hive Colony Framework
# Copyright (c) 2008-2012 Hive Solutions Lda.
#
# This file is part of Hive Colony Framework.
#
# Hive Colony Framework is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Hive Colony Framework is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Hive Colony Framework. If not, see <http://www.gnu.org/licenses/>.

# __author__    = João Magalhães <joamag@hive.pt>
# __version__   = 1.0.0
# __revision__  = $LastChangedRevision$
# __date__      = $LastChangedDate$
# __copyright__ = Copyright (c) 2008-2012 Hive Solutions Lda.
# __license__   = GNU General Public License (GPL), Version 3

# Function called upon process term signal received
on_term() {
    # kills the child process
    kill -TERM $PID

    # waits for child process
    wait

    # exits the process
    exit 0
}

# Function called upon process kill signal received
on_kill() {
    # kills the child process
    kill -KILL $PID

    # waits for child process
    wait

    # exits the process
    exit 0
}

# traps the term signal
trap "on_term" TERM

# traps the kill signal
trap "on_kill" KILL

# sets the temporary variables
USR_BIN_PATH=/usr/bin
PYTHON_PATH=$USR_BIN_PATH/python
RELATIVE_PATH=../../
SCRIPT_NAME=main.py

# retrieves the daemon pid
DAEMON_PID=$$

# retrieves the script directory path
SCRIPT_DIRECTORY_PATH=$(dirname $(readlink -f $0))

# executes the initial python script with
# the provided arguments
$PYTHON_PATH $SCRIPT_DIRECTORY_PATH/$RELATIVE_PATH/$SCRIPT_NAME $* --daemon_pid=$DAEMON_PID &

# saves the pid value
PID=$!

# iterates continuously
while true ; do
    wait
done
