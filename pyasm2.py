#!/usr/bin/env python3
import ctypes
import mmap

src = open("add2.bin", "r+b")
buf = mmap.mmap(src.fileno(), 0, prot=mmap.PROT_READ | mmap.PROT_WRITE | mmap.PROT_EXEC)
argtypes = (ctypes.c_int, ctypes.c_int, ctypes.c_long)
ftype = ctypes.CFUNCTYPE(*argtypes)
fpointer = ctypes.c_void_p.from_buffer(buf)
f = ftype(ctypes.addressof(fpointer))
f.argtypes = argtypes
f.restype = ctypes.c_long
r = f(422342, 212343, 123456789090)
print(r, 422342 * 212343 + 123456789090)

del fpointer
buf.close()
