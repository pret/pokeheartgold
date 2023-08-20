	.include "asm/macros.inc"
	.include "overlay_80_02235FC8.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02235FC8
ov80_02235FC8: ; 0x02235FC8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xb4
	bl AllocFromHeap
	ldr r1, _02235FE8 ; =ov80_0223DD50
	mov r2, #0xb4
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02235FE8 ; =ov80_0223DD50
	ldr r0, [r0]
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
_02235FE8: .word ov80_0223DD50
	thumb_func_end ov80_02235FC8

	thumb_func_start ov80_02235FEC
ov80_02235FEC: ; 0x02235FEC
	push {r3, lr}
	cmp r0, #0
	beq _02235FF6
	bl FreeToHeap
_02235FF6:
	pop {r3, pc}
	thumb_func_end ov80_02235FEC

	thumb_func_start ov80_02235FF8
ov80_02235FF8: ; 0x02235FF8
	push {r3, lr}
	cmp r1, #5
	bhi _0223603C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223600A: ; jump table
	.short _02236016 - _0223600A - 2 ; case 0
	.short _0223601C - _0223600A - 2 ; case 1
	.short _02236024 - _0223600A - 2 ; case 2
	.short _0223603C - _0223600A - 2 ; case 3
	.short _0223602E - _0223600A - 2 ; case 4
	.short _02236036 - _0223600A - 2 ; case 5
_02236016:
	bl sub_02096A34
	pop {r3, pc}
_0223601C:
	add r1, r2, #0
	bl sub_02096AAC
	pop {r3, pc}
_02236024:
	add r1, r2, #0
	add r2, r3, #0
	bl sub_02096AF4
	pop {r3, pc}
_0223602E:
	add r1, r2, #0
	bl sub_02096BF8
	pop {r3, pc}
_02236036:
	add r1, r2, #0
	bl sub_02096C40
_0223603C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235FF8

	thumb_func_start ov80_02236040
ov80_02236040: ; 0x02236040
	push {r3, lr}
	add r3, r1, #0
	add r3, #0x98
	ldr r3, [r3]
	cmp r2, #4
	bhi _02236088
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02236058: ; jump table
	.short _02236062 - _02236058 - 2 ; case 0
	.short _0223606C - _02236058 - 2 ; case 1
	.short _02236076 - _02236058 - 2 ; case 2
	.short _02236080 - _02236058 - 2 ; case 3
	.short _02236088 - _02236058 - 2 ; case 4
_02236062:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_0223608C
	pop {r3, pc}
_0223606C:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_022362B8
	pop {r3, pc}
_02236076:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_02236330
	pop {r3, pc}
_02236080:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_0223641C
_02236088:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02236040

	thumb_func_start ov80_0223608C
ov80_0223608C: ; 0x0223608C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x44
	add r4, r2, #0
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	mov r0, #0
	mov r2, #0x44
	bl MIi_CpuClearFast
	ldr r0, [r5]
	bl SaveArray_Party_Get
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [r5]
	bl Save_Bag_Get
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r0, [r5]
	bl Save_Mailbox_Get
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #8]
	ldr r0, [r5]
	bl Save_PlayerData_GetOptionsAddr
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #0xc]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _0223610E
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x11
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_0223610E:
	cmp r0, #5
	bne _02236120
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x16
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_02236120:
	cmp r0, #4
	bne _02236132
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x17
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_02236132:
	cmp r0, #6
	bne _02236144
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x17
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_02236144:
	bl GF_AssertFail
_02236148:
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	str r4, [r0, #0x1c]
	add r0, r5, #0
	add r0, #0x9f
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r0, #0x26
	strb r1, [r0]
	mov r1, #0
_02236162:
	add r2, r5, #0
	add r0, r5, r1
	add r2, #0xa8
	add r0, #0xa1
	ldr r2, [r2]
	ldrb r0, [r0]
	add r2, r2, r1
	add r2, #0x30
	strb r0, [r2]
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #2
	blo _02236162
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _022361C6
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x20
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_022361C6:
	cmp r0, #5
	bne _02236208
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x10
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x1e
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_02236208:
	cmp r0, #4
	bne _0223624A
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x20
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_0223624A:
	cmp r0, #6
	bne _0223628C
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x20
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_0223628C:
	bl GF_AssertFail
_02236290:
	mov r0, #0x43
	lsl r0, r0, #2
	add r1, r4, r0
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r3, #0
	str r1, [r0, #0x20]
	str r3, [sp]
	add r5, #0xa8
	ldr r1, _022362B4 ; =_0210159C
	ldr r2, [r5]
	add r0, r6, #0
	bl sub_02096820
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022362B4: .word _0210159C
	thumb_func_end ov80_0223608C

	thumb_func_start ov80_022362B8
ov80_022362B8: ; 0x022362B8
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x26
	ldrb r1, [r1]
	cmp r1, #6
	beq _022362E0
	cmp r1, #7
	bne _022362F0
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #4
	strh r1, [r0]
	add r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
_022362E0:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #4
	strh r1, [r0]
	add r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
_022362F0:
	add r1, r4, #0
	add r0, #0x30
	add r1, #0xa1
	mov r2, #2
	bl MI_CpuCopy8
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r0, #0x26
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x9f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	add r0, #0xa8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #2
	strh r1, [r0]
	add r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022362B8

	thumb_func_start ov80_02236330
ov80_02236330: ; 0x02236330
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r3, #0
	mov r1, #0x3c
	bl AllocFromHeapAtEnd
	add r1, r4, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	ldr r0, [r4]
	bl Save_PlayerData_GetOptionsAddr
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r0, [r4]
	bl SaveArray_Party_Get
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [r4]
	bl SaveArray_IsNatDexEnabled
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	ldr r0, [r4]
	bl sub_02088288
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x2c]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x11]
	add r0, r4, #0
	add r0, #0x9f
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r0, [r0]
	bl Party_GetCount
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	strb r0, [r1, #0x13]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0
	strh r1, [r0, #0x18]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	strb r1, [r0, #0x12]
	ldr r0, [r4]
	bl Save_SpecialRibbons_Get
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x20]
	ldr r0, [r4]
	bl sub_0208828C
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x34]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, _02236414 ; =ov80_0223C040
	bl sub_02089D40
	ldr r0, [r4]
	bl Save_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0208AD34
	mov r3, #0
	str r3, [sp]
	add r4, #0xac
	ldr r1, _02236418 ; =_02103A1C
	ldr r2, [r4]
	add r0, r5, #0
	bl sub_02096820
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236414: .word ov80_0223C040
_02236418: .word _02103A1C
	thumb_func_end ov80_02236330

	thumb_func_start ov80_0223641C
ov80_0223641C: ; 0x0223641C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	add r0, r4, #0
	add r0, #0x9f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	add r0, #0xac
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	add r4, #0x9d
	strh r1, [r0]
	strb r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223641C

    .rodata

ov80_0223D4C0: ; 0x0223D4C0
	.byte 0x00, 0x0A, 0x0B, 0x0D, 0x0C, 0x0F, 0x01, 0x03, 0x04, 0x02, 0x0E, 0x06, 0x05, 0x07, 0x10, 0x11
	.byte 0x08, 0xFE, 0xFE, 0x09

    .bss

ov80_0223DD50: ; 0x0223DD50
	.space 0x10
