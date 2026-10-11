.section .text

.global test
test:
 /* 0x0000 */ add r4, r4, #0x1
 /* 0x0001 */ bx r3

.section .data
.global mydatafoo
mydatafoo:
    .incbin "test.bin"
