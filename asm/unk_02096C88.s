#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02096C88.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02096C88
sub_02096C88: ; 0x02096C88
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x58
	bl AllocFromHeap
	add r4, r0, #0
	bne _02096C9E
	bl GF_AssertFail
_02096C9E:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x58
	bl memset
	ldr r1, _02096CC4 ; =0x00001BD0
	add r0, r6, #0
	str r5, [r4]
	bl AllocFromHeap
	str r0, [r4, #0x4c]
	ldr r1, _02096CC4 ; =0x00001BD0
	add r0, r6, #0
	bl AllocFromHeap
	str r0, [r4, #0x50]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02096CC4: .word 0x00001BD0
	thumb_func_end sub_02096C88

	thumb_func_start sub_02096CC8
sub_02096CC8: ; 0x02096CC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl Heap_Free
	ldr r0, [r4, #0x50]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	thumb_func_end sub_02096CC8

	thumb_func_start sub_02096CE0
sub_02096CE0: ; 0x02096CE0
	ldr r3, _02096CEC ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _02096CF0 ; =_0210884C
	mov r1, #0x87
	bx r3
	nop
_02096CEC: .word sub_0203410C
_02096CF0: .word _0210884C
	thumb_func_end sub_02096CE0

	thumb_func_start sub_02096CF4
sub_02096CF4: ; 0x02096CF4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	bl sub_02038C1C
	bl sub_02037FF0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl sub_0205AD24
	mov r0, #0
	bl sub_0205A904
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096CF4

	thumb_func_start sub_02096D14
sub_02096D14: ; 0x02096D14
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r6, r3, #0
	str r2, [sp]
	cmp r5, #0x12
	blo _02096D26
	bl GF_AssertFail
_02096D26:
	add r0, r6, #4
	cmp r0, #0x18
	bls _02096D30
	bl GF_AssertFail
_02096D30:
	add r4, r7, #4
	ldr r1, [sp]
	add r0, r4, #4
	add r2, r6, #0
	str r5, [r7, #4]
	bl memcpy
	mov r0, #0x82
	add r1, r4, #0
	mov r2, #0x18
	bl sub_02037030
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02096D14

	thumb_func_start sub_02096D4C
sub_02096D4C: ; 0x02096D4C
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	cmp r4, #1
	bne _02096D58
	mov r0, #0
	pop {r4, pc}
_02096D58:
	bl sub_02096D14
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096D4C

	thumb_func_start sub_02096D60
sub_02096D60: ; 0x02096D60
	push {r3, r4, r5, lr}
	ldr r4, [r2]
	cmp r4, #0x12
	blo _02096D6E
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_02096D6E:
	lsl r5, r4, #2
	ldr r4, _02096D7C ; =_02108804
	add r2, r2, #4
	ldr r4, [r4, r5]
	blx r4
	pop {r3, r4, r5, pc}
	nop
_02096D7C: .word _02108804
	thumb_func_end sub_02096D60

	thumb_func_start sub_02096D80
sub_02096D80: ; 0x02096D80
	push {r4, lr}
	add r1, r0, #0
	mov r0, #0x46
	add r4, r2, #0
	ldrsh r2, [r3, r0]
	mov r0, #1
	lsl r0, r1
	orr r2, r0
	add r0, r3, #0
	add r0, #0x46
	strh r2, [r0]
	add r0, r3, #0
	bl sub_02097018
	mov r2, #0x59
	add r1, r4, #0
	lsl r2, r2, #4
	bl memcpy
	pop {r4, pc}
	thumb_func_end sub_02096D80

	thumb_func_start sub_02096DA8
sub_02096DA8: ; 0x02096DA8
	cmp r0, #0
	bne _02096DB0
	ldrb r0, [r2]
	str r0, [r3, #0x28]
_02096DB0:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02096DA8

	thumb_func_start sub_02096DB4
sub_02096DB4: ; 0x02096DB4
	ldr r0, [r3, #0x20]
	add r0, r0, #1
	str r0, [r3, #0x20]
	bx lr
	thumb_func_end sub_02096DB4

	thumb_func_start sub_02096DBC
sub_02096DBC: ; 0x02096DBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02096DE0
	mov r0, #0
	str r0, [r4, #0x20]
	mov r0, #1
	str r0, [r4, #0x24]
	ldr r0, [r4]
	lsl r2, r5, #0x18
	ldr r0, [r0, #0x38]
	mov r1, #0x1f
	lsr r2, r2, #0x18
	bl ov85_021E9C84
_02096DE0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02096DBC

	thumb_func_start sub_02096DE4
sub_02096DE4: ; 0x02096DE4
	ldr r0, [r3]
	ldr r3, _02096DF0 ; =ov85_021E9C84
	ldr r0, [r0, #0x38]
	mov r1, #2
	mov r2, #0
	bx r3
	.balign 4, 0
_02096DF0: .word ov85_021E9C84
	thumb_func_end sub_02096DE4

	thumb_func_start sub_02096DF4
sub_02096DF4: ; 0x02096DF4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r6, #0
	beq _02096E7E
	bl sub_0203769C
	cmp r0, #0
	bne _02096ECC
	ldrb r1, [r5]
	add r0, sp, #0
	strb r1, [r0]
	ldrb r1, [r5, #1]
	strb r1, [r0, #1]
	ldrb r1, [r5, #2]
	strb r1, [r0, #2]
	ldrb r1, [r5, #3]
	strb r1, [r0, #3]
	strb r6, [r0]
	ldr r1, [r4, #0x2c]
	strb r1, [r0, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _02096E2C
	cmp r0, #1
	b _02096E6E
_02096E2C:
	bl sub_02037454
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _02096E4E
	bl sub_02096FFC
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _02096E4E
	bl sub_02033250
	bl MATH_CountPopulation
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	beq _02096E56
_02096E4E:
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #3]
	b _02096E6E
_02096E56:
	mov r1, #1
	add r0, r1, #0
	ldr r2, [r4, #0x30]
	lsl r0, r6
	orr r0, r2
	str r0, [r4, #0x30]
	add r0, sp, #0
	strb r1, [r0, #3]
	bl sub_02037454
	bl sub_02038C1C
_02096E6E:
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0
	mov r3, #4
	bl sub_02096D4C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096E7E:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _02096E8C
	cmp r0, #1
	beq _02096EC0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096E8C:
	ldrb r6, [r5]
	bl sub_0203769C
	cmp r6, r0
	bne _02096ECC
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _02096EAC
	ldr r0, [r4]
	mov r1, #8
	ldr r0, [r0, #0x38]
	add r2, r6, #0
	bl ov85_021E9C84
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096EAC:
	ldrb r0, [r5, #1]
	mov r1, #7
	strh r0, [r4, #0x38]
	ldr r0, [r4]
	ldrb r2, [r5]
	ldr r0, [r0, #0x38]
	bl ov85_021E9C84
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02096EC0:
	ldr r0, [r4]
	ldrb r2, [r5]
	ldr r0, [r0, #0x38]
	mov r1, #0x13
	bl ov85_021E9C84
_02096ECC:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02096DF4

	thumb_func_start sub_02096ED0
sub_02096ED0: ; 0x02096ED0
	push {r4, lr}
	add r4, r3, #0
	ldr r0, [r4]
	ldrb r2, [r2]
	ldr r0, [r0, #0x38]
	mov r1, #1
	bl ov85_021E9D9C
	bl sub_0203769C
	cmp r0, #0
	bne _02096EEC
	mov r0, #0
	str r0, [r4, #0x34]
_02096EEC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096ED0

	thumb_func_start sub_02096EF0
sub_02096EF0: ; 0x02096EF0
	push {r4, lr}
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02096F08
	ldr r0, [r4]
	mov r1, #0xd
	ldr r0, [r0, #0x38]
	mov r2, #0
	bl ov85_021E9C84
_02096F08:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02096EF0

	thumb_func_start sub_02096F0C
sub_02096F0C: ; 0x02096F0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02096F2A
	add r0, sp, #0
	strb r5, [r0]
	add r0, r4, #0
	mov r1, #0
	add r2, sp, #0
	mov r3, #1
	bl sub_02096D4C
_02096F2A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02096F0C

	thumb_func_start sub_02096F2C
sub_02096F2C: ; 0x02096F2C
	add r0, r3, #0
	add r0, #0x40
	ldrh r1, [r0]
	ldrh r0, [r2]
	add r3, #0x40
	orr r0, r1
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096F2C

	thumb_func_start sub_02096F3C
sub_02096F3C: ; 0x02096F3C
	add r1, r3, #0
	add r1, #0x42
	ldrh r2, [r1]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	add r3, #0x42
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096F3C

	thumb_func_start sub_02096F50
sub_02096F50: ; 0x02096F50
	ldr r0, [r3]
	ldr r3, _02096F5C ; =ov85_021E8680
	ldr r0, [r0, #0x34]
	add r1, r2, #0
	bx r3
	nop
_02096F5C: .word ov85_021E8680
	thumb_func_end sub_02096F50

	thumb_func_start sub_02096F60
sub_02096F60: ; 0x02096F60
	ldr r0, [r3]
	ldr r3, _02096F6C ; =ov85_021E86AC
	ldr r0, [r0, #0x34]
	ldr r1, [r2]
	bx r3
	nop
_02096F6C: .word ov85_021E86AC
	thumb_func_end sub_02096F60

	thumb_func_start sub_02096F70
sub_02096F70: ; 0x02096F70
	ldr r0, [r3]
	ldr r3, _02096F7C ; =ov85_021E85C4
	ldr r0, [r0, #0x34]
	ldrb r1, [r2]
	bx r3
	nop
_02096F7C: .word ov85_021E85C4
	thumb_func_end sub_02096F70

	thumb_func_start sub_02096F80
sub_02096F80: ; 0x02096F80
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02096F98
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x34]
	bl ov85_021E85CC
_02096F98:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02096F80

	thumb_func_start sub_02096F9C
sub_02096F9C: ; 0x02096F9C
	add r1, r0, #0
	ldr r0, [r3]
	ldr r3, _02096FA8 ; =ov85_021E8740
	ldr r0, [r0, #0x34]
	ldr r2, [r2]
	bx r3
	.balign 4, 0
_02096FA8: .word ov85_021E8740
	thumb_func_end sub_02096F9C

	thumb_func_start sub_02096FAC
sub_02096FAC: ; 0x02096FAC
	ldr r0, [r3]
	ldr r3, _02096FB8 ; =ov85_021E8748
	ldr r0, [r0, #0x34]
	add r1, r2, #0
	bx r3
	nop
_02096FB8: .word ov85_021E8748
	thumb_func_end sub_02096FAC

	thumb_func_start sub_02096FBC
sub_02096FBC: ; 0x02096FBC
	add r1, r3, #0
	add r1, #0x48
	ldrh r2, [r1]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	add r3, #0x48
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096FBC

	thumb_func_start sub_02096FD0
sub_02096FD0: ; 0x02096FD0
	add r1, r3, #0
	add r1, #0x4a
	ldrh r2, [r1]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	add r3, #0x4a
	strh r0, [r3]
	bx lr
	thumb_func_end sub_02096FD0

	thumb_func_start sub_02096FE4
sub_02096FE4: ; 0x02096FE4
	mov r0, #0x18
	bx lr
	thumb_func_end sub_02096FE4

	thumb_func_start sub_02096FE8
sub_02096FE8: ; 0x02096FE8
	mov r0, #0x59
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02096FE8

	thumb_func_start sub_02096FF0
sub_02096FF0: ; 0x02096FF0
	ldr r2, [r1, #0x4c]
	mov r1, #0x59
	lsl r1, r1, #4
	mul r1, r0
	add r0, r2, r1
	bx lr
	thumb_func_end sub_02096FF0

	thumb_func_start sub_02096FFC
sub_02096FFC: ; 0x02096FFC
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_02097002:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _0209700E
	add r5, r5, #1
_0209700E:
	add r4, r4, #1
	cmp r4, #5
	blt _02097002
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02096FFC

	thumb_func_start sub_02097018
sub_02097018: ; 0x02097018
	ldr r2, [r0, #0x50]
	mov r0, #0x59
	lsl r0, r0, #4
	mul r0, r1
	add r0, r2, r0
	bx lr
	thumb_func_end sub_02097018

	.rodata

	; File boundary
_02108804:
	.word sub_02096ED0
	.word sub_02096DE4
	.word sub_02096DF4
	.word sub_02096EF0
	.word sub_02096F0C
	.word sub_02096DBC
	.word sub_02096DB4
	.word sub_02096DA8
	.word sub_02096F2C
	.word sub_02096F3C
	.word sub_02096F70
	.word sub_02096F80
	.word sub_02096F50
	.word sub_02096F60
	.word sub_02096F9C
	.word sub_02096FAC
	.word sub_02096FBC
	.word sub_02096FD0
_0210884C:
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02091570, sub_020342C0, 0
	.word sub_02096D60, sub_02096FE4, 0
	.word sub_02096D80, sub_02096FE8, sub_02096FF0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word 0, 0, 0

