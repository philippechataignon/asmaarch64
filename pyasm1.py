#!/usr/bin/env python3
import ctypes
dll = ctypes.cdll.LoadLibrary("./add1.so")
dll.add.restype = ctypes.c_int
dll.add.argtypes = (ctypes.c_int, ctypes.c_int)
r = dll.add(4223122, 21234)
print(r, 4223122 + 21234)
