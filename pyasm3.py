#!/usr/bin/env python3
import ctypes
dll = ctypes.cdll.LoadLibrary("./add2.so")
dll.add.restype = ctypes.c_long
dll.add.argtypes = (ctypes.c_int, ctypes.c_int, ctypes.c_long)
# ctypes.POINTER(ctypes.c_int)
r = dll.add(422342, 212343, 1234567899990)
print(r, 422342 * 212343 +  1234567899990)
