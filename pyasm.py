#!/usr/bin/env python3
import ctypes
import mmap

buf = mmap.mmap(-1, mmap.PAGESIZE, prot=mmap.PROT_READ | mmap.PROT_WRITE | mmap.PROT_EXEC)

ftype = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_int)
fpointer = ctypes.c_void_p.from_buffer(buf)

f = ftype(ctypes.addressof(fpointer))

buf.write(
    b'\x00\x04\x00\x11'
    b'\xc0\x03\x5F\xD6'
)

r = f(42)
print(r)

del fpointer
buf.close()
if __name__ == '__main__':
    pass

