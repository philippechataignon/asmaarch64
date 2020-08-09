#!/usr/bin/env python3
import ctypes
import mmap

src = open("add2.bin", "r+b")
buf = mmap.mmap(src.fileno(), 0, prot=mmap.PROT_READ | mmap.PROT_WRITE | mmap.PROT_EXEC)

ftype = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_int, ctypes.c_long)
fpointer = ctypes.c_void_p.from_buffer(buf)

f = ftype(ctypes.addressof(fpointer))
r = f(422342, 212343, 12345678)
print(r, 422342 * 212343 + 12345678)

del fpointer
buf.close()
