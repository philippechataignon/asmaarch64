.global entier
.global calc1
.data
entier: .fill 4

.text
calc1:
    ldr x3,[x0]
    ldr x4,[x1]
    add x4,x4,x3
    lsl x4,x4,1
    adr x2,entier
    str x4,[x2]
    ret 
