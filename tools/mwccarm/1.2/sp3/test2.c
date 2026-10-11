typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;

extern void test(void);

int test2(int foo) {
    switch(foo) {
        case 0 .. 7:
            return foo;
        case 0xDEADBEEF:
            return 1;
        case 0x0000BEEF:
            return 2;
        case 0xDEAD0000:
            return 3;
        case 413 ... 418:
            return foo / 2;
    }
}

void func_20347D8(void) {
    test2(2); // in test3.s
}

asm void somefunc() { 
 /* 0x0000 */ add r4, r4, #0x1
 /* 0x0001 */ bx r3
}

asm void __startup(void) {
    bl func_20347D8
    bl somefunc
}
