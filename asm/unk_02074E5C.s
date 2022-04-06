#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FFE30:
	.word sub_02075534
	.word sub_020342B8
	.word 0
	.word sub_02075028
	.word sub_020342B8
	.word 0
	.word sub_020750B4
	.word sub_02074ED8
	.word 0
	.word sub_0207513C
	.word sub_02074EDC
	.word sub_02074EF8
	.word sub_020751A8
	.word sub_02074EF4
	.word sub_02074F18
	.word sub_02075210
	.word sub_02074EE4
	.word sub_02074F38
	.word sub_0207530C
	.word sub_02074EEC
	.word sub_02074F54
	.word sub_02075398
	.word sub_02074EF4
	.word sub_02074F74
	.word sub_02075398
	.word sub_02074EF4
	.word sub_02074F7C
	.word sub_02075424
	.word sub_02074EE4
	.word sub_02074F84
	.word sub_02075424
	.word sub_02074EE4
	.word sub_02074F8C
	.word sub_020755B4
	.word sub_020755E4
	.word sub_02074F94

	.text

	thumb_func_start sub_02074E5C
sub_02074E5C: ; 0x02074E5C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	bne _02074EB6
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, _02074EB8 ; =_020FFE30
	mov r1, #0xc
	add r2, r5, #0
	bl sub_0203410C
	str r5, [r4]
	mov r0, #0
	strb r0, [r4, #4]
	str r5, [r6]
	strb r0, [r6, #4]
	add r0, r5, #0
	add r1, r4, #4
	bl ov12_0223BBFC
	add r0, r5, #0
	add r1, r6, #4
	bl ov12_0223BC08
	ldr r0, _02074EBC ; =sub_02075434
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r0, _02074EC0 ; =sub_020754C0
	add r1, r6, #0
	mov r2, #0
	bl CreateSysTask
_02074EB6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02074EB8: .word _020FFE30
_02074EBC: .word sub_02075434
_02074EC0: .word sub_020754C0
	thumb_func_end sub_02074E5C

	thumb_func_start sub_02074EC4
sub_02074EC4: ; 0x02074EC4
	ldr r3, _02074ED0 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _02074ED4 ; =_020FFE30
	mov r1, #0xc
	bx r3
	nop
_02074ED0: .word sub_0203410C
_02074ED4: .word _020FFE30
	thumb_func_end sub_02074EC4

	thumb_func_start sub_02074ED8
sub_02074ED8: ; 0x02074ED8
	mov r0, #4
	bx lr
	thumb_func_end sub_02074ED8

	thumb_func_start sub_02074EDC
sub_02074EDC: ; 0x02074EDC
	ldr r3, _02074EE0 ; =PlayerProfile_sizeof
	bx r3
	.balign 4, 0
_02074EE0: .word PlayerProfile_sizeof
	thumb_func_end sub_02074EDC

	thumb_func_start sub_02074EE4
sub_02074EE4: ; 0x02074EE4
	ldr r3, _02074EE8 ; =PartyCore_sizeof
	bx r3
	.balign 4, 0
_02074EE8: .word PartyCore_sizeof
	thumb_func_end sub_02074EE4

	thumb_func_start sub_02074EEC
sub_02074EEC: ; 0x02074EEC
	mov r0, #0xfa
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074EEC

	thumb_func_start sub_02074EF4
sub_02074EF4: ; 0x02074EF4
	mov r0, #0x34
	bx lr
	thumb_func_end sub_02074EF4

	thumb_func_start sub_02074EF8
sub_02074EF8: ; 0x02074EF8
	ldr r3, [r1]
	mov r1, #0x80
	ldr r2, [r3]
	tst r1, r2
	beq _02074F0C
	lsl r0, r0, #3
	add r0, r3, r0
	add r0, #0xf8
	ldr r0, [r0]
	bx lr
_02074F0C:
	lsl r0, r0, #2
	add r0, r3, r0
	add r0, #0xf8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074EF8

	thumb_func_start sub_02074F18
sub_02074F18: ; 0x02074F18
	ldr r1, [r1]
	mov r2, #0x80
	ldr r3, [r1]
	tst r2, r3
	beq _02074F2E
	lsl r2, r0, #1
	mov r0, #0x34
	add r1, #0x28
	mul r0, r2
	add r0, r1, r0
	bx lr
_02074F2E:
	mov r2, #0x34
	add r1, #0x28
	mul r2, r0
	add r0, r1, r2
	bx lr
	thumb_func_end sub_02074F18

	thumb_func_start sub_02074F38
sub_02074F38: ; 0x02074F38
	ldr r3, [r1]
	mov r1, #0x80
	ldr r2, [r3]
	tst r1, r2
	beq _02074F4A
	lsl r0, r0, #3
	add r0, r3, r0
	ldr r0, [r0, #4]
	bx lr
_02074F4A:
	lsl r0, r0, #2
	add r0, r3, r0
	ldr r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074F38

	thumb_func_start sub_02074F54
sub_02074F54: ; 0x02074F54
	ldr r3, [r1]
	mov r1, #0x80
	ldr r2, [r3]
	tst r2, r1
	beq _02074F68
	lsl r0, r0, #3
	add r0, r3, r0
	add r1, #0x98
	ldr r0, [r0, r1]
	bx lr
_02074F68:
	lsl r0, r0, #2
	add r0, r3, r0
	add r1, #0x98
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074F54

	thumb_func_start sub_02074F74
sub_02074F74: ; 0x02074F74
	ldr r0, [r1]
	add r0, #0x5c
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074F74

	thumb_func_start sub_02074F7C
sub_02074F7C: ; 0x02074F7C
	ldr r0, [r1]
	add r0, #0xc4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074F7C

	thumb_func_start sub_02074F84
sub_02074F84: ; 0x02074F84
	ldr r0, [r1]
	ldr r0, [r0, #8]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074F84

	thumb_func_start sub_02074F8C
sub_02074F8C: ; 0x02074F8C
	ldr r0, [r1]
	ldr r0, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02074F8C

	thumb_func_start sub_02074F94
sub_02074F94: ; 0x02074F94
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02074F94

	thumb_func_start sub_02074F9C
sub_02074F9C: ; 0x02074F9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, #5
	mov r1, #4
	str r2, [sp, #8]
	add r7, r3, #0
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, [sp]
	bl ov12_0223A940
	add r5, r0, #0
	ldr r0, [sp]
	bl ov12_0223A960
	add r4, r0, #0
	ldr r0, [sp]
	bl ov12_0223A96C
	mov ip, r0
	add r0, sp, #0x10
	ldrh r3, [r4]
	ldrb r0, [r0, #0x10]
	add r1, r3, #5
	add r2, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r2, r1
	bls _02074FE4
	mov r1, ip
	strh r3, [r1]
	mov r1, #0
	strh r1, [r4]
_02074FE4:
	ldr r1, [sp, #4]
	mov r3, #0
	strb r1, [r6]
	ldr r1, [sp, #8]
	strb r1, [r6, #1]
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	strh r1, [r6, #2]
_02074FF4:
	ldrb r2, [r6, r3]
	ldrh r1, [r4]
	add r3, r3, #1
	strb r2, [r5, r1]
	ldrh r1, [r4]
	add r1, r1, #1
	strh r1, [r4]
	cmp r3, #4
	blo _02074FF4
	mov r3, #0
	cmp r0, #0
	ble _0207501E
_0207500C:
	ldrb r2, [r7, r3]
	ldrh r1, [r4]
	add r3, r3, #1
	strb r2, [r5, r1]
	ldrh r1, [r4]
	add r1, r1, #1
	strh r1, [r4]
	cmp r3, r0
	blt _0207500C
_0207501E:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02074F9C

	thumb_func_start sub_02075028
sub_02075028: ; 0x02075028
	push {r3, r4, r5, r6, r7, lr}
	str r3, [sp]
	add r0, r3, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov12_0223A948
	add r7, r0, #0
	ldr r0, [sp]
	bl ov12_0223A984
	add r4, r0, #0
	ldr r0, [sp]
	bl ov12_0223A990
	ldrh r1, [r4]
	add r2, r1, r5
	add r3, r2, #1
	mov r2, #1
	lsl r2, r2, #0xc
	cmp r3, r2
	ble _0207505A
	strh r1, [r0]
	mov r0, #0
	strh r0, [r4]
_0207505A:
	mov r0, #0
	cmp r5, #0
	ble _02075072
_02075060:
	ldrb r2, [r6, r0]
	ldrh r1, [r4]
	add r0, r0, #1
	strb r2, [r7, r1]
	ldrh r1, [r4]
	add r1, r1, #1
	strh r1, [r4]
	cmp r0, r5
	blt _02075060
_02075072:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02075028

	thumb_func_start sub_02075074
sub_02075074: ; 0x02075074
	push {r0, r1, r2, r3}
	push {r3, lr}
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _0207508E
	mov r0, #0
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
_0207508E:
	mov r0, #0x33
	bl sub_02037B38
	cmp r0, #0
	bne _020750A2
	mov r0, #0
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
_020750A2:
	mov r0, #0x18
	add r1, sp, #0xc
	mov r2, #4
	bl sub_02037030
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end sub_02075074

	thumb_func_start sub_020750B4
sub_020750B4: ; 0x020750B4
	push {r3, r4, r5, lr}
	add r4, r3, #0
	ldr r5, [r2]
	ldr r2, [r4]
	lsl r1, r0, #2
	add r3, r2, r1
	mov r2, #0x5f
	lsl r2, r2, #2
	str r5, [r3, r2]
	ldr r3, [r4]
	add r1, r3, r1
	ldr r1, [r1, r2]
	bl sub_0203049C
	ldr r0, _020750DC ; =0x00001020
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
	nop
_020750DC: .word 0x00001020
	thumb_func_end sub_020750B4

	thumb_func_start sub_020750E0
sub_020750E0: ; 0x020750E0
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _020750F4
	mov r0, #0
	pop {r4, pc}
_020750F4:
	ldr r0, [r4]
	add r4, #0x20
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r4, #0
	bl PlayerProfile_copy
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020750E0

	thumb_func_start sub_02075108
sub_02075108: ; 0x02075108
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _0207511C
	mov r0, #0
	pop {r4, pc}
_0207511C:
	mov r0, #0x34
	bl sub_02037B38
	cmp r0, #0
	bne _0207512A
	mov r0, #0
	pop {r4, pc}
_0207512A:
	bl PlayerProfile_sizeof
	add r4, #0x20
	add r2, r0, #0
	mov r0, #0x19
	add r1, r4, #0
	bl sub_02036FD8
	pop {r4, pc}
	thumb_func_end sub_02075108

	thumb_func_start sub_0207513C
sub_0207513C: ; 0x0207513C
	ldr r0, _02075148 ; =0x00001020
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bx lr
	nop
_02075148: .word 0x00001020
	thumb_func_end sub_0207513C

	thumb_func_start sub_0207514C
sub_0207514C: ; 0x0207514C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _02075160
	mov r0, #0
	pop {r4, pc}
_02075160:
	ldr r3, [r4]
	add r4, #0x20
	add r3, #0x28
	mov r2, #6
_02075168:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _02075168
	ldr r0, [r3]
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0207514C

	thumb_func_start sub_02075178
sub_02075178: ; 0x02075178
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _0207518C
	mov r0, #0
	pop {r4, pc}
_0207518C:
	mov r0, #0x35
	bl sub_02037B38
	cmp r0, #0
	bne _0207519A
	mov r0, #0
	pop {r4, pc}
_0207519A:
	add r4, #0x20
	mov r0, #0x1a
	add r1, r4, #0
	mov r2, #0x34
	bl sub_02036FD8
	pop {r4, pc}
	thumb_func_end sub_02075178

	thumb_func_start sub_020751A8
sub_020751A8: ; 0x020751A8
	ldr r0, _020751B4 ; =0x00001020
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bx lr
	nop
_020751B4: .word 0x00001020
	thumb_func_end sub_020751A8

	thumb_func_start sub_020751B8
sub_020751B8: ; 0x020751B8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _020751CC
	mov r0, #0
	pop {r4, pc}
_020751CC:
	ldr r0, [r4]
	add r4, #0x20
	ldr r0, [r0, #4]
	add r1, r4, #0
	bl Party_copy
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020751B8

	thumb_func_start sub_020751DC
sub_020751DC: ; 0x020751DC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _020751F0
	mov r0, #0
	pop {r4, pc}
_020751F0:
	mov r0, #0x36
	bl sub_02037B38
	cmp r0, #0
	bne _020751FE
	mov r0, #0
	pop {r4, pc}
_020751FE:
	bl PartyCore_sizeof
	add r4, #0x20
	add r2, r0, #0
	mov r0, #0x1b
	add r1, r4, #0
	bl sub_02036FD8
	pop {r4, pc}
	thumb_func_end sub_020751DC

	thumb_func_start sub_02075210
sub_02075210: ; 0x02075210
	ldr r0, _0207521C ; =0x00001020
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bx lr
	nop
_0207521C: .word 0x00001020
	thumb_func_end sub_02075210

	thumb_func_start sub_02075220
sub_02075220: ; 0x02075220
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _02075234
	mov r0, #0
	pop {r4, pc}
_02075234:
	ldr r2, [r4]
	add r1, #0x10
	add r0, r4, #0
	ldr r1, [r2, r1]
	add r0, #0x20
	bl Chatot_copy
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02075220

	thumb_func_start sub_02075248
sub_02075248: ; 0x02075248
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _0207525C
	mov r0, #0
	pop {r4, pc}
_0207525C:
	mov r0, #0x37
	bl sub_02037B38
	cmp r0, #0
	bne _0207526A
	mov r0, #0
	pop {r4, pc}
_0207526A:
	add r4, #0x20
	mov r2, #0xfa
	mov r0, #0x1c
	add r1, r4, #0
	lsl r2, r2, #2
	bl sub_02036FD8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02075248

	thumb_func_start sub_0207527C
sub_0207527C: ; 0x0207527C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _02075290
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02075290:
	ldr r4, [r5]
	mov r0, #0x80
	ldr r1, [r4]
	tst r0, r1
	beq _020752A2
	bl sub_0203769C
	lsl r0, r0, #3
	b _020752A8
_020752A2:
	bl sub_0203769C
	lsl r0, r0, #2
_020752A8:
	add r0, r4, r0
	mov r1, #0x52
	add r0, #0xf8
	lsl r1, r1, #2
	add r2, r5, #0
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, #0x20
	bl sub_02075554
	mov r4, #0
	mov r6, #5
	mov r7, #0x88
_020752C2:
	add r0, r6, #0
	add r1, r7, #0
	bl AllocFromHeap
	str r0, [r5, #0x10]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _020752C2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207527C

	thumb_func_start sub_020752D8
sub_020752D8: ; 0x020752D8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _020752EC
	mov r0, #0
	pop {r4, pc}
_020752EC:
	mov r0, #0x38
	bl sub_02037B38
	cmp r0, #0
	bne _020752FA
	mov r0, #0
	pop {r4, pc}
_020752FA:
	add r4, #0x20
	mov r2, #0xfa
	mov r0, #0x21
	add r1, r4, #0
	lsl r2, r2, #2
	bl sub_02036FD8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020752D8

	thumb_func_start sub_0207530C
sub_0207530C: ; 0x0207530C
	ldr r0, _02075318 ; =0x00001020
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bx lr
	nop
_02075318: .word 0x00001020
	thumb_func_end sub_0207530C

	thumb_func_start sub_0207531C
sub_0207531C: ; 0x0207531C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _02075332
	mov r0, #0
	pop {r3, r4, r5, pc}
_02075332:
	ldr r1, [r5]
	mov r0, #0x34
	mul r0, r4
	add r3, r1, r0
	add r3, #0x28
	add r5, #0x20
	mov r2, #6
_02075340:
	ldmia r3!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r2, r2, #1
	bne _02075340
	ldr r0, [r3]
	str r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207531C

	thumb_func_start sub_02075350
sub_02075350: ; 0x02075350
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _02075368
	mov r0, #0
	pop {r4, r5, r6, pc}
_02075368:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	cmp r0, #0
	bne _02075378
	mov r0, #0
	pop {r4, r5, r6, pc}
_02075378:
	cmp r4, #1
	bne _0207538A
	add r5, #0x20
	mov r0, #0x1d
	add r1, r5, #0
	mov r2, #0x34
	bl sub_02036FD8
	pop {r4, r5, r6, pc}
_0207538A:
	add r5, #0x20
	mov r0, #0x1e
	add r1, r5, #0
	mov r2, #0x34
	bl sub_02036FD8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02075350

	thumb_func_start sub_02075398
sub_02075398: ; 0x02075398
	ldr r0, _020753A4 ; =0x00001020
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bx lr
	nop
_020753A4: .word 0x00001020
	thumb_func_end sub_02075398

	thumb_func_start sub_020753A8
sub_020753A8: ; 0x020753A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _020753BE
	mov r0, #0
	pop {r3, r4, r5, pc}
_020753BE:
	ldr r1, [r5]
	lsl r0, r4, #2
	add r0, r1, r0
	add r5, #0x20
	ldr r0, [r0, #4]
	add r1, r5, #0
	bl Party_copy
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020753A8

	thumb_func_start sub_020753D4
sub_020753D4: ; 0x020753D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	beq _020753EC
	mov r0, #0
	pop {r4, r5, r6, pc}
_020753EC:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	cmp r0, #0
	bne _020753FC
	mov r0, #0
	pop {r4, r5, r6, pc}
_020753FC:
	cmp r4, #1
	bne _02075412
	bl PartyCore_sizeof
	add r5, #0x20
	add r2, r0, #0
	mov r0, #0x1f
	add r1, r5, #0
	bl sub_02036FD8
	pop {r4, r5, r6, pc}
_02075412:
	bl PartyCore_sizeof
	add r5, #0x20
	add r2, r0, #0
	mov r0, #0x20
	add r1, r5, #0
	bl sub_02036FD8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020753D4

	thumb_func_start sub_02075424
sub_02075424: ; 0x02075424
	ldr r0, _02075430 ; =0x00001020
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bx lr
	nop
_02075430: .word 0x00001020
	thumb_func_end sub_02075424

	thumb_func_start sub_02075434
sub_02075434: ; 0x02075434
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	bl ov12_0223A940
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A954
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223A960
	str r0, [sp, #4]
	ldr r0, [r5]
	bl ov12_0223A96C
	add r7, r0, #0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _02075466
	cmp r0, #0xff
	b _020754B0
_02075466:
	bl sub_02037190
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	bne _020754BC
	ldr r0, [sp, #4]
	ldrh r1, [r4]
	ldrh r0, [r0]
	cmp r1, r0
	beq _020754BC
	ldrh r0, [r7]
	cmp r1, r0
	bne _02075488
	mov r0, #0
	strh r0, [r4]
	strh r0, [r7]
_02075488:
	ldrh r1, [r4]
	add r0, r1, #2
	ldrb r2, [r6, r0]
	add r0, r1, #3
	ldrb r0, [r6, r0]
	add r1, r6, r1
	lsl r0, r0, #8
	orr r0, r2
	add r5, r0, #4
	mov r0, #0x17
	add r2, r5, #0
	bl sub_02037030
	cmp r0, #1
	bne _020754BC
	ldrh r0, [r4]
	add sp, #8
	add r0, r0, r5
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_020754B0:
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	bl DestroySysTask
_020754BC:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02075434

	thumb_func_start sub_020754C0
sub_020754C0: ; 0x020754C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	bl ov12_0223A948
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A978
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223A984
	add r7, r0, #0
	ldr r0, [r5]
	bl ov12_0223A990
	ldrb r1, [r5, #4]
	cmp r1, #0
	beq _020754EE
	cmp r1, #0xff
	b _02075526
_020754EE:
	ldrh r1, [r4]
	ldrh r2, [r7]
	cmp r1, r2
	beq _02075532
	ldrh r2, [r0]
	cmp r1, r2
	bne _02075502
	mov r1, #0
	strh r1, [r4]
	strh r1, [r0]
_02075502:
	ldrh r1, [r4]
	ldr r0, [r5]
	add r1, r6, r1
	bl ov12_02264334
	cmp r0, #1
	bne _02075532
	ldrh r0, [r4]
	add r1, r0, #2
	ldrb r2, [r6, r1]
	add r1, r0, #3
	ldrb r1, [r6, r1]
	lsl r1, r1, #8
	orr r1, r2
	add r1, r1, #4
	add r0, r0, r1
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02075526:
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	bl DestroySysTask
_02075532:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020754C0

	thumb_func_start sub_02075534
sub_02075534: ; 0x02075534
	push {r4, lr}
	add r4, r3, #0
	add r0, r4, #0
	mov r1, #0xff
	bl ov12_0223BC14
	add r0, r4, #0
	mov r1, #0xff
	bl ov12_0223BC20
	add r0, r4, #0
	mov r1, #1
	bl ov12_0223BC2C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02075534

	thumb_func_start sub_02075554
sub_02075554: ; 0x02075554
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16StringArray
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4, #0x10]
	add r0, r6, #0
	bl PlayerProfile_GetLanguage
	strb r0, [r4, #0x14]
	add r0, r6, #0
	bl PlayerProfile_GetVersion
	strb r0, [r4, #0x15]
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #0x16]
	mov r0, #0
	add r1, r4, #0
_0207558C:
	ldr r2, [r5, #0x10]
	str r2, [r1, #0x18]
	ldrb r3, [r5, #0x15]
	add r2, r4, r0
	add r2, #0x58
	strb r3, [r2]
	add r2, r4, r0
	ldrb r3, [r5, #0x14]
	add r2, #0x68
	add r1, r1, #4
	strb r3, [r2]
	add r2, r4, r0
	ldrb r3, [r5, #0x16]
	add r2, #0x78
	add r0, r0, #1
	add r5, #0x88
	strb r3, [r2]
	cmp r0, #0x10
	blt _0207558C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02075554

	thumb_func_start sub_020755B4
sub_020755B4: ; 0x020755B4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r5, r0
	beq _020755D6
	mov r0, #0x52
	ldr r1, [r4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r6, #0
	mov r2, #1
	mov r3, #5
	bl SavePalPad_Merge
_020755D6:
	ldr r0, _020755E0 ; =0x00001020
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020755E0: .word 0x00001020
	thumb_func_end sub_020755B4

	thumb_func_start sub_020755E4
sub_020755E4: ; 0x020755E4
	mov r0, #0x88
	bx lr
	thumb_func_end sub_020755E4
