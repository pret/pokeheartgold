typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;

extern void test(void);

void func_20347D8(void) {
    test(); // in test3.s
}

asm void somefunc() { 
 /* 0x0000 */ add r4, r4, #0x1
 /* 0x0001 */ bx r3
}

asm void __startup(void) {
    bl func_20347D8
    bl somefunc
}
