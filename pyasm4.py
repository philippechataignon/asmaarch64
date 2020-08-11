#!/usr/bin/env python3
from time import time

import ctypes
pyarr = list(range(10000000))
arr = (ctypes.c_int * len(pyarr))(*pyarr)

dll = ctypes.cdll.LoadLibrary("./add4.so")
dll.add4.restype = ctypes.c_long
dll.add4.argtypes = (ctypes.POINTER(ctypes.c_int), ctypes.c_int)
start = time()
r = dll.add4(arr, len(pyarr))
print(time() - start)
print(r, sum(pyarr))

