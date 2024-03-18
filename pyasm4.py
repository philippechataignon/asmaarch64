#!/usr/bin/env python

import ctypes
import numpy as np
from time import time

arr = np.arange(100000000, dtype = np.int32)
print(arr)

start = time()
s = np.sum(arr, dtype = np.int64)
print(time() - start)
print(s)
