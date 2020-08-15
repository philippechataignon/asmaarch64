#!/usr/bin/env python

import ctypes
import numpy as np
from time import time

arr = np.arange(100000000, dtype = np.int32)
print(arr)

dll = ctypes.cdll.LoadLibrary("./add4.so")
dll.add4.restype = ctypes.c_longlong
dll.add4.argtypes = (
    np.ctypeslib.ndpointer(dtype=np.int32, ndim=1, flags='C_CONTIGUOUS'),
    ctypes.c_int
)
start = time()
r = dll.add4(arr, len(arr))
print(time() - start)
start = time()
s = np.sum(arr, dtype = np.int64)
print(time() - start)
print(r, s)
