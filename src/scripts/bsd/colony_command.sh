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

# sets the temporary variables
BIN_PATH=/bin
USR_BIN_PATH=/usr/bin
SHELL_PATH=$BIN_PATH/sh
PYTHON_PATH=$USR_BIN_PATH/python
RELATIVE_PATH=../..

# retrieves the script directory path
SCRIPT_DIRECTORY_PATH=$(dirname $($PYTHON_PATH -c "import os;print os.path.realpath(\"$0\")"))

# updates the path variable with the scripts path
export PATH=$PATH:$SCRIPT_DIRECTORY_PATH/$RELATIVE_PATH/scripts/bsd

# executes the command prompt
$SHELL_PATH
