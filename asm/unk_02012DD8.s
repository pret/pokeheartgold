	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02012DD8
sub_02012DD8: ; 0x02012DD8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	mov r1, #0x4c
	bl AllocFromHeap
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	bl sub_02012E6C
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02012DD8

	thumb_func_start sub_02012E10
sub_02012E10: ; 0x02012E10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	ldr r4, [r5, #0x14]
	cmp r0, #1
	beq _02012E28
	cmp r0, #2
	beq _02012E44
	cmp r0, #3
	beq _02012E5E
	b _02012E62
_02012E28:
	add r0, r4, #0
	bl sub_02012F54
	cmp r0, #1
	bne _02012E66
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	ldr r2, [r5, #0x10]
	bl sub_02010F34
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012E66
_02012E44:
	add r0, r4, #0
	bl sub_02010EC8
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	add r0, r6, #0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02012E66
_02012E5E:
	mov r6, #1
	b _02012E66
_02012E62:
	bl GF_AssertFail
_02012E66:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02012E10

	thumb_func_start sub_02012E6C
sub_02012E6C: ; 0x02012E6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r1, #0
	ldr r6, [sp, #0x38]
	str r3, [sp, #0x1c]
	str r2, [sp, #0x18]
	ldrb r1, [r4, #8]
	ldr r3, [sp, #0x44]
	add r2, r6, #0
	add r5, r0, #0
	ldr r7, [sp, #0x3c]
	bl sub_02010E64
	ldr r0, _02012F44 ; =0x007FFF80
	mov r1, #0
	str r0, [r5, #0x14]
	ldrsh r1, [r4, r1]
	lsr r0, r0, #7
	str r1, [r5, #0xc]
	mov r1, #2
	ldrsh r1, [r4, r1]
	str r1, [r5, #0x10]
	ldr r1, [r4, #4]
	str r1, [r5, #0x18]
	ldr r1, [r4, #4]
	str r1, [r5, #0x1c]
	ldr r1, [sp, #0x18]
	bl _s32_div_f
	str r0, [r5, #0x20]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [r5, #0x28]
	mov r0, #0
	str r0, [r5, #0x2c]
	ldr r0, [sp, #0x40]
	str r7, [r5, #0x44]
	str r0, [r5, #0x48]
	ldr r0, [sp, #0x44]
	str r0, [r5, #0x30]
	ldrb r0, [r4, #0xb]
	str r0, [r5, #0x34]
	ldrb r0, [r4, #8]
	str r0, [r5, #0x38]
	str r6, [r5, #0x3c]
	mov r0, #1
	str r0, [r5, #0x40]
	add r0, r5, #0
	bl sub_020131AC
	ldr r0, _02012F48 ; =sub_02010F00
	ldr r2, _02012F4C ; =0x000003FF
	add r1, r5, #0
	bl sub_0200E374
	add r0, r5, #0
	mov r1, #0
	bl sub_02010EE0
	mov r1, #3
	str r6, [sp]
	lsl r1, r1, #8
	ldrsh r1, [r0, r1]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x12
	lsl r1, r1, #6
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x34]
	str r0, [sp, #0x14]
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #0xa]
	ldrb r3, [r4, #8]
	add r0, r7, #0
	bl sub_02010F84
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _02012F22
	ldr r3, [r5, #0x34]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	bl sub_02011068
	b _02012F2E
_02012F22:
	ldr r3, [r5, #0x34]
	add r0, r7, #0
	mov r1, #2
	add r2, r6, #0
	bl sub_02011068
_02012F2E:
	ldr r0, [sp, #0x44]
	ldr r2, _02012F50 ; =sub_02010C38
	str r0, [sp]
	ldr r0, [r5, #0x48]
	add r1, r5, #0
	add r3, r6, #0
	bl sub_0200FF88
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02012F44: .word 0x007FFF80
_02012F48: .word sub_02010F00
_02012F4C: .word 0x000003FF
_02012F50: .word sub_02010C38
	thumb_func_end sub_02012E6C

	thumb_func_start sub_02012F54
sub_02012F54: ; 0x02012F54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	add r1, r0, #1
	str r1, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _02012FF0
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	cmp r0, #0
	ble _02012FE2
	ldr r2, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	add r1, r2, r1
	str r1, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	ldr r2, _02012FF4 ; =0x0000FFFF
	sub r1, r1, #1
	str r1, [r4, #0x24]
	ldr r1, [r4, #0x1c]
	add r0, #0x1c
	cmp r1, r2
	blt _02012F98
	add r3, r2, #0
_02012F8C:
	ldr r1, [r0]
	sub r1, r1, r2
	str r1, [r0]
	ldr r1, [r4, #0x1c]
	cmp r1, r3
	bge _02012F8C
_02012F98:
	cmp r1, #0
	bge _02012FAE
	add r2, r4, #0
	ldr r0, _02012FF4 ; =0x0000FFFF
	add r2, #0x1c
_02012FA2:
	ldr r1, [r2]
	add r1, r1, r0
	str r1, [r2]
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	blt _02012FA2
_02012FAE:
	ldr r0, _02012FF8 ; =0x00007FFF
	cmp r1, r0
	blt _02012FD0
	ldr r0, [r4, #0x18]
	cmp r1, r0
	bge _02012FD0
	ldr r0, [r4, #0x40]
	cmp r0, #1
	bne _02012FD0
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x34]
	bl sub_02010FEC
	mov r0, #0
	str r0, [r4, #0x40]
_02012FD0:
	add r0, r4, #0
	bl sub_020131AC
	ldr r0, _02012FFC ; =sub_02010F00
	ldr r2, _02013000 ; =0x000003FF
	add r1, r4, #0
	bl sub_0200E374
	b _02012FF0
_02012FE2:
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x30]
	bl sub_0200FFB4
	mov r0, #1
	pop {r4, pc}
_02012FF0:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02012FF4: .word 0x0000FFFF
_02012FF8: .word 0x00007FFF
_02012FFC: .word sub_02010F00
_02013000: .word 0x000003FF
	thumb_func_end sub_02012F54

	thumb_func_start sub_02013004
sub_02013004: ; 0x02013004
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r0, [sp, #0x28]
	add r5, r3, #0
	str r0, [sp, #0x10]
	asr r0, r0, #4
	add r4, r2, #0
	lsl r2, r0, #1
	add r0, r2, #1
	str r1, [sp]
	lsl r1, r0, #1
	ldr r0, _020131A4 ; =FX_SinCosTable_
	ldr r3, [sp, #0x2c]
	ldrsh r1, [r0, r1]
	ldr r0, _020131A8 ; =0x0000FFFF
	ldr r6, [sp, #0x30]
	mul r0, r1
	asr r1, r0, #0xc
	ldr r0, [sp]
	ldr r7, [sp, #0x34]
	add r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, _020131A4 ; =FX_SinCosTable_
	lsl r1, r2, #1
	ldrsh r1, [r0, r1]
	ldr r0, _020131A8 ; =0x0000FFFF
	mul r0, r1
	asr r0, r0, #0xc
	add r1, r4, r0
	asr r0, r3, #4
	lsl r0, r0, #1
	mov ip, r0
	add r0, r0, #1
	lsl r2, r0, #1
	ldr r0, _020131A4 ; =FX_SinCosTable_
	ldrsh r2, [r0, r2]
	ldr r0, _020131A8 ; =0x0000FFFF
	mul r0, r2
	asr r2, r0, #0xc
	ldr r0, [sp]
	add r0, r0, r2
	str r0, [sp, #8]
	mov r0, ip
	lsl r2, r0, #1
	ldr r0, _020131A4 ; =FX_SinCosTable_
	ldrsh r2, [r0, r2]
	ldr r0, _020131A8 ; =0x0000FFFF
	mul r0, r2
	asr r0, r0, #0xc
	add r0, r4, r0
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	sub r2, r3, r0
	ldr r0, _020131A8 ; =0x0000FFFF
	lsr r0, r0, #1
	cmp r2, r0
	bne _0201308C
	cmp r5, #0
	blt _0201307E
	cmp r5, r4
	blt _02013080
_0201307E:
	b _020131A0
_02013080:
	mov r0, #0
	str r0, [r6]
	mov r0, #0xff
	add sp, #0x14
	str r0, [r7]
	pop {r4, r5, r6, r7, pc}
_0201308C:
	cmp r3, #0
	blt _02013100
	ldr r0, _020131A8 ; =0x0000FFFF
	lsr r0, r0, #1
	cmp r3, r0
	bge _02013100
	cmp r1, r4
	bge _020130A0
	add r0, r1, #0
	b _020130A2
_020130A0:
	add r0, r4, #0
_020130A2:
	cmp r1, r4
	ble _020130AA
	add r2, r1, #0
	b _020130AC
_020130AA:
	add r2, r4, #0
_020130AC:
	cmp r0, r5
	bgt _020130CC
	cmp r5, r2
	bgt _020130CC
	ldr r2, [sp, #0xc]
	ldr r0, [sp]
	sub r2, r2, r0
	sub r0, r5, r1
	mul r0, r2
	sub r1, r1, r4
	bl _s32_div_f
	ldr r1, [sp, #0xc]
	add r0, r1, r0
	str r0, [r6]
	b _020130E6
_020130CC:
	ldr r1, [sp, #8]
	ldr r0, [sp]
	sub r1, r1, r0
	ldr r0, [sp, #4]
	sub r0, r5, r0
	mul r0, r1
	ldr r1, [sp, #4]
	sub r1, r1, r4
	bl _s32_div_f
	ldr r1, [sp, #8]
	add r0, r1, r0
	str r0, [r6]
_020130E6:
	ldr r0, [r6]
	cmp r0, #0xff
	ble _020130F0
	mov r0, #0xff
	b _020130F6
_020130F0:
	cmp r0, #0
	bge _020130F6
	mov r0, #0
_020130F6:
	str r0, [r6]
	mov r0, #0xff
	add sp, #0x14
	str r0, [r7]
	pop {r4, r5, r6, r7, pc}
_02013100:
	cmp r1, r4
	bge _02013108
	add r0, r1, #0
	b _0201310A
_02013108:
	add r0, r4, #0
_0201310A:
	cmp r1, r4
	ble _02013112
	add r2, r1, #0
	b _02013114
_02013112:
	add r2, r4, #0
_02013114:
	cmp r0, r5
	bgt _02013144
	cmp r5, r2
	bgt _02013144
	ldr r2, [sp, #0xc]
	ldr r0, [sp]
	sub r2, r2, r0
	sub r0, r5, r1
	mul r0, r2
	sub r1, r1, r4
	bl _s32_div_f
	ldr r1, [sp, #0xc]
	add r0, r1, r0
	str r0, [r6]
	cmp r0, #0xff
	ble _0201313A
	mov r0, #0xff
	b _02013140
_0201313A:
	cmp r0, #0
	bge _02013140
	mov r0, #0
_02013140:
	str r0, [r6]
	b _02013148
_02013144:
	mov r0, #0
	str r0, [r6]
_02013148:
	ldr r0, [sp, #4]
	cmp r0, r4
	bge _02013152
	add r1, r0, #0
	b _02013154
_02013152:
	add r1, r4, #0
_02013154:
	ldr r0, [sp, #4]
	cmp r0, r4
	bgt _0201315C
	add r0, r4, #0
_0201315C:
	cmp r1, r5
	bgt _02013190
	cmp r5, r0
	bgt _02013190
	ldr r1, [sp, #8]
	ldr r0, [sp]
	sub r1, r1, r0
	ldr r0, [sp, #4]
	sub r0, r5, r0
	mul r0, r1
	ldr r1, [sp, #4]
	sub r1, r1, r4
	bl _s32_div_f
	ldr r1, [sp, #8]
	add r0, r1, r0
	str r0, [r7]
	cmp r0, #0xff
	ble _02013186
	mov r0, #0xff
	b _0201318C
_02013186:
	cmp r0, #0
	bge _0201318C
	mov r0, #0
_0201318C:
	str r0, [r7]
	b _02013194
_02013190:
	ldr r0, [r6]
	str r0, [r7]
_02013194:
	ldr r1, [r7]
	ldr r0, [r6]
	cmp r0, r1
	ble _020131A0
	str r1, [r6]
	str r0, [r7]
_020131A0:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020131A4: .word FX_SinCosTable_
_020131A8: .word 0x0000FFFF
	thumb_func_end sub_02013004

	thumb_func_start sub_020131AC
sub_020131AC: ; 0x020131AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r1, #0
	add r5, r0, #0
	bl sub_02010EE0
	add r4, r0, #0
	mov r6, #0
	add r7, sp, #0x14
_020131BE:
	ldr r0, [r5, #0x18]
	add r3, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r0, sp, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0xc]
	ldr r2, [r5, #0x10]
	bl sub_02013004
	mov r0, #3
	ldr r1, [sp, #0x14]
	lsl r0, r0, #8
	strh r1, [r4, r0]
	mov r0, #0x12
	ldr r1, [sp, #0x10]
	lsl r0, r0, #6
	strh r1, [r4, r0]
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, #0xc0
	blt _020131BE
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020131AC

	thumb_func_start sub_020131F4
sub_020131F4: ; 0x020131F4
	cmp r1, #0
	ldr r1, _02013218 ; =0xFFFF1FFF
	bne _0201320A
	mov r3, #1
	lsl r3, r3, #0x1a
	ldr r2, [r3]
	lsl r0, r0, #0xd
	and r1, r2
	orr r0, r1
	str r0, [r3]
	bx lr
_0201320A:
	ldr r3, _0201321C ; =0x04001000
	lsl r0, r0, #0xd
	ldr r2, [r3]
	and r1, r2
	orr r0, r1
	str r0, [r3]
	bx lr
	.balign 4, 0
_02013218: .word 0xFFFF1FFF
_0201321C: .word 0x04001000
	thumb_func_end sub_020131F4

	thumb_func_start sub_02013220
sub_02013220: ; 0x02013220
	push {r3, r4}
	cmp r2, #0
	bne _02013262
	cmp r3, #0
	bne _02013246
	ldr r2, _0201329C ; =0x04000048
	ldrh r3, [r2]
	mov r2, #0x3f
	bic r3, r2
	add r2, r3, #0
	orr r2, r0
	cmp r1, #0
	beq _0201323E
	mov r0, #0x20
	orr r2, r0
_0201323E:
	ldr r0, _0201329C ; =0x04000048
	strh r2, [r0]
	pop {r3, r4}
	bx lr
_02013246:
	ldr r2, _020132A0 ; =0x04001048
	ldrh r3, [r2]
	mov r2, #0x3f
	bic r3, r2
	add r2, r3, #0
	orr r2, r0
	cmp r1, #0
	beq _0201325A
	mov r0, #0x20
	orr r2, r0
_0201325A:
	ldr r0, _020132A0 ; =0x04001048
	strh r2, [r0]
	pop {r3, r4}
	bx lr
_02013262:
	cmp r3, #0
	ldr r2, _020132A4 ; =0xFFFFC0FF
	bne _02013282
	ldr r4, _0201329C ; =0x04000048
	lsl r0, r0, #8
	ldrh r3, [r4]
	and r2, r3
	orr r2, r0
	cmp r1, #0
	beq _0201327A
	lsr r0, r4, #0xd
	orr r2, r0
_0201327A:
	ldr r0, _0201329C ; =0x04000048
	strh r2, [r0]
	pop {r3, r4}
	bx lr
_02013282:
	ldr r4, _020132A0 ; =0x04001048
	lsl r0, r0, #8
	ldrh r3, [r4]
	and r2, r3
	orr r2, r0
	cmp r1, #0
	beq _02013294
	lsr r0, r4, #0xd
	orr r2, r0
_02013294:
	ldr r0, _020132A0 ; =0x04001048
	strh r2, [r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0201329C: .word 0x04000048
_020132A0: .word 0x04001048
_020132A4: .word 0xFFFFC0FF
	thumb_func_end sub_02013220

	thumb_func_start sub_020132A8
sub_020132A8: ; 0x020132A8
	cmp r2, #0
	bne _020132C6
	ldr r2, _020132E0 ; =0x0400004A
	ldrh r3, [r2]
	mov r2, #0x3f
	bic r3, r2
	add r2, r3, #0
	orr r2, r0
	cmp r1, #0
	beq _020132C0
	mov r0, #0x20
	orr r2, r0
_020132C0:
	ldr r0, _020132E0 ; =0x0400004A
	strh r2, [r0]
	bx lr
_020132C6:
	ldr r2, _020132E4 ; =0x0400104A
	ldrh r3, [r2]
	mov r2, #0x3f
	bic r3, r2
	add r2, r3, #0
	orr r2, r0
	cmp r1, #0
	beq _020132DA
	mov r0, #0x20
	orr r2, r0
_020132DA:
	ldr r0, _020132E4 ; =0x0400104A
	strh r2, [r0]
	bx lr
	.balign 4, 0
_020132E0: .word 0x0400004A
_020132E4: .word 0x0400104A
	thumb_func_end sub_020132A8

	thumb_func_start sub_020132E8
sub_020132E8: ; 0x020132E8
	push {r3}
	sub sp, #4
	cmp r0, #0
	bne _02013308
	cmp r1, #0
	bne _020132FE
	ldr r0, _0201332C ; =0x04000048
	ldrb r1, [r0]
	add r0, sp, #0
	strb r1, [r0]
	b _0201331E
_020132FE:
	ldr r0, _02013330 ; =0x04001048
	ldrb r1, [r0]
	add r0, sp, #0
	strb r1, [r0]
	b _0201331E
_02013308:
	cmp r1, #0
	bne _02013316
	ldr r0, _02013334 ; =0x04000049
	ldrb r1, [r0]
	add r0, sp, #0
	strb r1, [r0]
	b _0201331E
_02013316:
	ldr r0, _02013338 ; =0x04001049
	ldrb r1, [r0]
	add r0, sp, #0
	strb r1, [r0]
_0201331E:
	add r1, sp, #0
	mov r0, #0
	ldrsb r0, [r1, r0]
	add sp, #4
	pop {r3}
	bx lr
	nop
_0201332C: .word 0x04000048
_02013330: .word 0x04001048
_02013334: .word 0x04000049
_02013338: .word 0x04001049
	thumb_func_end sub_020132E8

	thumb_func_start sub_0201333C
sub_0201333C: ; 0x0201333C
	push {r3}
	sub sp, #4
	cmp r0, #0
	bne _02013348
	ldr r0, _0201335C ; =0x0400004A
	b _0201334A
_02013348:
	ldr r0, _02013360 ; =0x0400104A
_0201334A:
	ldrb r1, [r0]
	add r0, sp, #0
	strb r1, [r0]
	add r1, sp, #0
	mov r0, #0
	ldrsb r0, [r1, r0]
	add sp, #4
	pop {r3}
	bx lr
	.balign 4, 0
_0201335C: .word 0x0400004A
_02013360: .word 0x0400104A
	thumb_func_end sub_0201333C

	thumb_func_start sub_02013364
sub_02013364: ; 0x02013364
	push {r4, r5}
	add r4, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #8]
	cmp r3, #0
	bne _020133C2
	ldr r3, [sp, #0xc]
	cmp r3, #0
	bne _0201339C
	lsl r0, r0, #8
	mov r3, #0xff
	add r5, r0, #0
	lsl r3, r3, #8
	lsl r0, r4, #0x18
	and r5, r3
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	add r4, r5, #0
	orr r4, r0
	ldr r0, _02013414 ; =0x04000040
	orr r1, r3
	strh r4, [r0]
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
_0201339C:
	lsl r0, r0, #8
	mov r3, #0xff
	add r5, r0, #0
	lsl r3, r3, #8
	lsl r0, r4, #0x18
	and r5, r3
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	add r4, r5, #0
	orr r4, r0
	ldr r0, _02013418 ; =0x04001040
	orr r1, r3
	strh r4, [r0]
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
_020133C2:
	ldr r3, [sp, #0xc]
	cmp r3, #0
	bne _020133EE
	lsl r0, r0, #8
	mov r3, #0xff
	add r5, r0, #0
	lsl r3, r3, #8
	lsl r0, r4, #0x18
	and r5, r3
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	add r4, r5, #0
	orr r4, r0
	ldr r0, _0201341C ; =0x04000042
	orr r1, r3
	strh r4, [r0]
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
_020133EE:
	lsl r0, r0, #8
	mov r3, #0xff
	add r5, r0, #0
	lsl r3, r3, #8
	lsl r0, r4, #0x18
	and r5, r3
	lsl r1, r1, #8
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	add r4, r5, #0
	orr r4, r0
	ldr r0, _02013420 ; =0x04001042
	orr r1, r3
	strh r4, [r0]
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02013414: .word 0x04000040
_02013418: .word 0x04001040
_0201341C: .word 0x04000042
_02013420: .word 0x04001042
	thumb_func_end sub_02013364

	thumb_func_start sub_02013424
sub_02013424: ; 0x02013424
	push {r4, lr}
	lsl r3, r2, #3
	add r4, r0, r3
	str r1, [r0, r3]
	str r2, [r4, #4]
	ldr r0, _0201343C ; =sub_020134BC
	add r1, r4, #0
	mov r2, #1
	bl sub_0200E374
	pop {r4, pc}
	nop
_0201343C: .word sub_020134BC
	thumb_func_end sub_02013424

	thumb_func_start sub_02013440
sub_02013440: ; 0x02013440
	push {r4, r5, r6, lr}
	ldr r5, [sp, #0x10]
	add r0, #0x10
	lsl r4, r5, #5
	add r6, r0, r4
	lsl r0, r3, #4
	add r4, r6, r0
	str r1, [r6, r0]
	str r2, [r4, #4]
	str r3, [r4, #8]
	ldr r0, _02013464 ; =sub_020134D0
	add r1, r4, #0
	mov r2, #1
	str r5, [r4, #0xc]
	bl sub_0200E374
	pop {r4, r5, r6, pc}
	nop
_02013464: .word sub_020134D0
	thumb_func_end sub_02013440

	thumb_func_start sub_02013468
sub_02013468: ; 0x02013468
	push {r3, r4, r5, lr}
	mov r4, #0xc
	add r0, #0x68
	mul r4, r3
	add r5, r0, r4
	str r1, [r0, r4]
	str r2, [r5, #4]
	ldr r0, _02013484 ; =sub_020134EC
	add r1, r5, #0
	mov r2, #1
	str r3, [r5, #8]
	bl sub_0200E374
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02013484: .word sub_020134EC
	thumb_func_end sub_02013468

	thumb_func_start sub_02013488
sub_02013488: ; 0x02013488
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, [sp, #0x20]
	add r7, r1, #0
	add r0, #0x80
	lsl r1, r5, #5
	add r6, r0, r1
	add r4, r2, #0
	ldr r0, [sp, #0x1c]
	add r2, r3, #0
	lsl r3, r0, #4
	add r1, r6, r3
	strh r7, [r6, r3]
	strh r4, [r1, #2]
	strh r2, [r1, #4]
	ldr r2, [sp, #0x18]
	strh r2, [r1, #6]
	str r0, [r1, #8]
	ldr r0, _020134B8 ; =sub_02013504
	mov r2, #1
	str r5, [r1, #0xc]
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020134B8: .word sub_02013504
	thumb_func_end sub_02013488

	thumb_func_start sub_020134BC
sub_020134BC: ; 0x020134BC
	push {r4, lr}
	add r4, r0, #0
	ldmia r1!, {r0, r1}
	bl sub_020131F4
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020134BC

	thumb_func_start sub_020134D0
sub_020134D0: ; 0x020134D0
	push {r4, lr}
	add r3, r1, #0
	add r4, r0, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	bl sub_02013220
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020134D0

	thumb_func_start sub_020134EC
sub_020134EC: ; 0x020134EC
	push {r4, lr}
	add r2, r1, #0
	add r4, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #8]
	bl sub_020132A8
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end sub_020134EC

	thumb_func_start sub_02013504
sub_02013504: ; 0x02013504
	push {r3, r4, r5, lr}
	sub sp, #8
	add r3, r1, #0
	add r4, r0, #0
	ldr r0, [r3, #8]
	mov r1, #2
	str r0, [sp]
	ldr r0, [r3, #0xc]
	mov r2, #4
	str r0, [sp, #4]
	mov r0, #0
	mov r5, #6
	ldrsh r0, [r3, r0]
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r5]
	bl sub_02013364
	add r0, r4, #0
	bl DestroySysTask
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02013504
