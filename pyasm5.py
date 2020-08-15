#!/usr/bin/env python3

import ctypes
from time import time

dll = ctypes.cdll.LoadLibrary("./putdec.so")
dll.putdec.restype = ctypes.c_int
dll.putdec.argtypes = (
    ctypes.c_short,
    ctypes.c_char_p
)
i = 12345
s = b"        "

start = time()
r = dll.putdec(i, s)
print(time() - start)
print(s)
if __name__ == '__main__':
    pass

