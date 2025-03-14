#!/usr/bin/env python

# -- imports
import ctypes
import os
import sys

# -- preamble
pwd = os.path.dirname(os.path.abspath(__file__))
libcgo_test_path = os.path.join(pwd, "libcgo_test.so")
libnogo_path     = os.path.join(pwd, "libnogo.so")

MIN_PYTHON = (3, 11)
version_info = sys.version_info
if version_info < MIN_PYTHON:
    sys.exit("Python %s.%s or later is required.\n" % MIN_PYTHON)


class NestDriver:
    def __init__(self):
        version_info_fstring = f"{version_info.major}.{version_info.minor}.{version_info.micro}"
        print("NestDriver (alpha) on Python %s\n\t-- Starting demo..." % version_info_fstring)
        d = self.load_library(libcgo_test_path)
        n = self.load_library(libnogo_path)
        hello = d.hello
        greet = d.greet
        hello()
        greet("Crux".encode('utf-8'))
        nogo_hello = n.about
        nogo_hello()


    def __del__(self):
        print("NestDriver closing...")

    def __str__(self):
        return f"meh."

    def load_library(self, path):
        try:
            library = ctypes.cdll.LoadLibrary(path)
            print(f"\t-- NestDriver succesfully loaded library\n\t\t({path})")
            # proceed :D

        except OSError as e:
            print(f"error: {e}")
            library = None # please clean up

        if library is None:
            sys.exit("Unable to load <%s>" % path)
        else:
            return library

if __name__ == '__main__':  # Corrected line
    d = NestDriver()

