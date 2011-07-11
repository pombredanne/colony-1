#!/usr/bin/python
# -*- coding: utf-8 -*-

# Hive Colony Framework
# Copyright (C) 2008 Hive Solutions Lda.
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

__author__ = "João Magalhães <joamag@hive.pt> & Tiago Silva <tsilva@hive.pt>"
""" The author(s) of the module """

__version__ = "1.0.0"
""" The version of the module """

__revision__ = "$LastChangedRevision: 3219 $"
""" The revision number of the module """

__date__ = "$LastChangedDate: 2009-05-26 11:52:00 +0100 (ter, 26 Mai 2009) $"
""" The last change date of the module """

__copyright__ = "Copyright (c) 2008 Hive Solutions Lda."
""" The copyright for the module """

__license__ = "GNU General Public License (GPL), Version 3"
""" The license for the module """

import unittest

import xml.dom.minidom

class ColonyTestCase(unittest.TestCase):
    """
    The base class to be used for all the colony
    based test cases.
    """

    def assert_type(self, value, expected_type):
        """
        Tests that the provided value is of the specified type.

        @type value: Object
        @param value: The value whose type will be compared
        against the expected type.
        @type expected_type: Type
        @param expected_type: The type that is expected for
        the provided value.
        """

        # retrieves the value's type
        value_type = type(value)

        # raises an exception in case the
        # value is not of the expected type
        if not value_type == expected_type:
            # raises a failure exception
            raise self.failureException("value is of type %s instead of expected type %s" % (value_type, expected_type))

    def assert_raises(self, expected_exception_name, function, *args, **kwargs):
        """
        Tests that the specified exception is raised when invoking
        the provided function with the respective arguments.

        @type expected_exception_name: String
        @param expected_exception_name: The name of the exception
        that should be raised by the function.
        @type function: Function
        @param function: The function to be invoked.
        @type args: pointer
        @param args: The function arguments list.
        @type kwargs: pointer pointer
        @param kwargs: The function arguments map.
        """

        try:
            # invokes the function
            function(*args, **kwargs)
        except Exception, exception:
            # retrieves the exception class
            exception_class = exception.__class__

            # retrieves the exception class name
            exception_class_name = exception_class.__name__

            # raises a failure exception in case the
            # raised exception was not the expected one
            if not exception_class_name == expected_exception_name:
                # raises a failure exception
                raise self.failureException("raised exception %s instead of expected exception %s" % (exception_class_name, expected_exception_name))
        else:
            # raises a failure exception in case no exception was raised
            raise self.failureException("%s exception was not raised" % expected_exception_name)

    def assert_valid_xml(self, xml_data):
        """
        Tests that the provided xml data is valid.

        @type xml_data: String
        @param xml_data: The string with the xml data.
        """

        # attempts to parse the xml data
        # to check if its valid
        try:
            # parses the xml data
            xml.dom.minidom.parseString(xml_data)
        except:
            # raises a failure exception
            # in case the parse was unsuccessful
            raise self.failureException("xml data is invalid")
