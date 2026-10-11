typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;

#define EOS 0xFFFF
#define NULL (void*)0

void sub_20533D0(void) {
    
}

void sub_2053A58(u32 func, int r1) {
    return;
}

int sub_2030078(void) {
    return 1;
}

void sub_2052E50() {
    if(sub_2030078()) {
        sub_2053A58((u32)sub_20533D0, 0xA);
    }
}

/* JP
ROM:02050BD0 sub_2050BD0                             ; DATA XREF: sub_2050BBC+6o
ROM:02050BD0                                         ; ROM:off_2050BCCo
ROM:02050BD0                 PUSH            {R3,LR}
ROM:02050BD2                 BL              sub_202EE0C
ROM:02050BD6                 CMP             R0, #0
ROM:02050BD8                 BEQ             locret_2050BE2
ROM:02050BDA                 LDR             R0, =(sub_20506A8+1)
ROM:02050BDC                 MOVS            R1, #0xA
ROM:02050BDE                 BL              sub_2050094
ROM:02050BE2
ROM:02050BE2 locret_2050BE2                          ; CODE XREF: sub_2050BD0+8j
ROM:02050BE2                 POP             {R3,PC}
*/

/* US
sub_2052E50
                PUSH            {LR}
                SUB             SP, SP, #4
                BL              sub_2030078
                CMP             R0, #0
                BEQ             loc_2052E64
                LDR             R0, =(sub_20533D0+1)
                MOVS            R1, #0xA
                BL              sub_2053A58
loc_2052E64
                ADD             SP, SP, #4
                POP             {PC}
off_2052E68     DCD sub_20533D0+1
*/

u16 *StringCopy(u16 *dest, const u16 *src)
{
    while (*src != EOS)
    {
        *dest = *src;
        dest++;
        src++;
    }

    *dest = EOS;
    sub_2052E50();
    return dest;
}

u16 *StringCopy2(u16 *dest, const u16 *src)
{
    while (*src != EOS - 4)
    {
        *dest = *src;
        dest++;
        src++;
    }

    *dest = EOS;
    return dest;
}

void a(void) {
    StringCopy(NULL, NULL);
}

void b(void) {
    StringCopy2(NULL, NULL);
}

void c(void) {
}

void d(void) {
}

void e(void) {
}

void f(void) {
}

asm void __startup(void) {
    bl a
    bl b
    bl c
    bl d
    bl e
    bl f
}
