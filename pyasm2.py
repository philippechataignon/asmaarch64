#!/usr/bin/env python3
import ctypes
import mmap

def load_func(filename):
    src = open(filename, "r+b")
    buf = mmap.mmap(src.fileno(), 0, prot=mmap.PROT_READ | mmap.PROT_WRITE | mmap.PROT_EXEC)
    return buf

def asm_func(buf, argtypes, restype):
    ftype = ctypes.CFUNCTYPE(*argtypes)
    fpointer = ctypes.c_void_p.from_buffer(buf)
    f = ftype(ctypes.addressof(fpointer))
    f.argtypes = argtypes
    f.restype = restype
    return f

argtypes = (ctypes.c_int, ctypes.c_int, ctypes.c_long)
restype = ctypes.c_long
buf = load_func("add2.bin")
f = asm_func(buf, argtypes, restype)
r = f(422342, 212343, 123456789090)
print(r, 422342 * 212343 + 123456789090)
buf.close()
