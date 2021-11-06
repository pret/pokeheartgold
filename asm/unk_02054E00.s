	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC61C:
	.byte 0x02, 0x00, 0x54, 0x04
	.byte 0x54, 0x04, 0x03, 0x00, 0x59, 0x04, 0x59, 0x04, 0x04, 0x00, 0x54, 0x04, 0x54, 0x04, 0x05, 0x00
	.byte 0x59, 0x04, 0x59, 0x04, 0x06, 0x00, 0x54, 0x04, 0x54, 0x04, 0x08, 0x00, 0x59, 0x04, 0x59, 0x04
	.byte 0x09, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x0B, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x0E, 0x00, 0x5B, 0x04
	.byte 0x5B, 0x04, 0x14, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x15, 0x00, 0x53, 0x04, 0x53, 0x04, 0x18, 0x00
	.byte 0x5B, 0x04, 0x5B, 0x04, 0x19, 0x00, 0x53, 0x04, 0x53, 0x04, 0x45, 0x00, 0x54, 0x04, 0x54, 0x04
	.byte 0x1F, 0x00, 0x55, 0x04, 0x55, 0x04, 0x22, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x24, 0x00, 0x53, 0x04
	.byte 0x53, 0x04, 0x26, 0x00, 0x5A, 0x04, 0x5A, 0x04, 0x2A, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x2B, 0x00
	.byte 0x53, 0x04, 0x53, 0x04, 0x2E, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x2F, 0x00, 0x57, 0x04, 0x57, 0x04
	.byte 0x31, 0x00, 0x54, 0x04, 0x54, 0x04, 0x34, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x37, 0x00, 0x58, 0x04
	.byte 0x58, 0x04, 0x38, 0x00, 0x53, 0x04, 0x53, 0x04, 0x3C, 0x00, 0x54, 0x04, 0x54, 0x04, 0x3E, 0x00
	.byte 0x58, 0x04, 0x58, 0x04, 0x3F, 0x00, 0x55, 0x04, 0x55, 0x04, 0x40, 0x00, 0x5B, 0x04, 0x5B, 0x04
	.byte 0x41, 0x00, 0x5B, 0x04, 0x5B, 0x04, 0x44, 0x00, 0x55, 0x04, 0x55, 0x04, 0x4D, 0x00, 0x53, 0x04
	.byte 0x53, 0x04, 0x4E, 0x00, 0x55, 0x04, 0x55, 0x04, 0x4F, 0x00, 0x56, 0x04, 0x56, 0x04, 0x52, 0x00
	.byte 0x56, 0x04, 0x56, 0x04, 0x71, 0x00, 0x58, 0x04, 0x55, 0x04, 0x73, 0x00, 0x5B, 0x04, 0x5B, 0x04
	.byte 0x79, 0x00, 0x5A, 0x04, 0x5A, 0x04, 0x7A, 0x00, 0x53, 0x04, 0x53, 0x04, 0x74, 0x00, 0x58, 0x04
	.byte 0x58, 0x04, 0x72, 0x00, 0x58, 0x04, 0x58, 0x04, 0x75, 0x00, 0x58, 0x04, 0x58, 0x04, 0x76, 0x00
	.byte 0x58, 0x04, 0x58, 0x04

	.text

	thumb_func_start sub_02054E50
sub_02054E50: ; 0x02054E50
	cmp r0, #0xd0
	bne _02054E58
	mov r0, #1
	bx lr
_02054E58:
	mov r0, #0
	bx lr
	thumb_func_end sub_02054E50

	thumb_func_start sub_02054E5C
sub_02054E5C: ; 0x02054E5C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	cmp r5, #0
	blt _02054E6C
	cmp r4, #0
	bge _02054E74
_02054E6C:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02054E74:
	ldr r0, [r6, #0x30]
	bl sub_0203B004
	add r7, r0, #0
	ldr r0, [r6, #0x30]
	bl sub_0203B014
	asr r1, r5, #4
	lsr r1, r1, #0x1b
	add r1, r5, r1
	asr r2, r1, #5
	asr r1, r4, #4
	lsr r1, r1, #0x1b
	add r1, r4, r1
	asr r1, r1, #5
	cmp r2, r7
	blt _02054EA2
	cmp r1, r0
	blt _02054EA2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02054EA2:
	add r0, r1, #0
	mul r0, r7
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054E5C

	thumb_func_start sub_02054EB0
sub_02054EB0: ; 0x02054EB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r0, [sp, #4]
_02054EBE:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [r1, #0x2c]
	add r2, sp, #8
	bl ov01_021F630C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02054F00
	mov r5, #0
_02054ED2:
	ldr r0, [sp, #8]
	add r1, r5, #0
	bl ov01_021F3B44
	add r4, r0, #0
	bl ov01_021F3B30
	cmp r0, #0
	beq _02054EF6
	add r0, r4, #0
	bl ov01_021F3B34
	cmp r0, r6
	bne _02054EF6
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F3B2C
_02054EF6:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x20
	blo _02054ED2
_02054F00:
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #4
	blo _02054EBE
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054EB0

	thumb_func_start sub_02054F14
sub_02054F14: ; 0x02054F14
	push {r3, lr}
	bl sub_02005FA0
	bl sub_020053F0
	mov r0, #0
	bl sub_02004AD8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02054F14

	thumb_func_start sub_02054F28
sub_02054F28: ; 0x02054F28
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl sub_0203B9C4
	bl sub_0203B980
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02054F28

	thumb_func_start sub_02054F3C
sub_02054F3C: ; 0x02054F3C
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B980
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02054F3C

	thumb_func_start sub_02054F4C
sub_02054F4C: ; 0x02054F4C
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B980
	mov r1, #0
	strh r1, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02054F4C

	thumb_func_start sub_02054F60
sub_02054F60: ; 0x02054F60
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	add r5, r1, #0
	bl sub_0205C700
	cmp r0, #2
	bne _02054F82
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_02066A3C
	cmp r0, #0
	bne _02054F82
	ldr r0, _02054FA4 ; =0x000003F6
	pop {r3, r4, r5, pc}
_02054F82:
	add r0, r4, #0
	add r1, r5, #0
	bl GetMapMusic
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02054F3C
	cmp r0, #0
	beq _02054F9E
	add r0, r4, #0
	bl sub_02054F3C
	add r5, r0, #0
_02054F9E:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	nop
_02054FA4: .word 0x000003F6
	thumb_func_end sub_02054F60

	thumb_func_start GetMapMusic
GetMapMusic: ; 0x02054FA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl IsNighttime
	cmp r0, #0
	bne _02054FBE
	add r0, r4, #0
	bl MapHeader_GetDayMusicId
	b _02054FC4
_02054FBE:
	add r0, r4, #0
	bl MapHeader_GetNightMusicId
_02054FC4:
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r1, r4, #0
	bl GetOverriddenMapMusic
	cmp r0, #0
	beq _02054FD8
	add r6, r0, #0
_02054FD8:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end GetMapMusic

	thumb_func_start sub_02054FDC
sub_02054FDC: ; 0x02054FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	add r7, r2, #0
	bl sub_0205C700
	add r6, r0, #0
	bl sub_02004A54
	cmp r0, #1
	bne _02054FFC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02054FFC:
	add r0, r5, #0
	bl sub_02004A90
	cmp r4, r0
	bne _0205500C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205500C:
	bl sub_020053F0
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0xc
	add r3, sp, #8
	bl sub_0205504C
	cmp r6, #1
	beq _02055022
	bne _02055036
_02055022:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r3, #0x1e
	bl sub_02005A4C
	b _02055044
_02055036:
	mov r3, #0
	str r3, [sp]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	add r0, r4, #0
	bl sub_020059F0
_02055044:
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054FDC

	thumb_func_start sub_0205504C
sub_0205504C: ; 0x0205504C
	cmp r1, #4
	bhi _0205508E
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205505C: ; jump table
	.short _02055066 - _0205505C - 2 ; case 0
	.short _02055070 - _0205505C - 2 ; case 1
	.short _0205507A - _0205505C - 2 ; case 2
	.short _0205508E - _0205505C - 2 ; case 3
	.short _02055084 - _0205505C - 2 ; case 4
_02055066:
	mov r0, #0x1e
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
_02055070:
	mov r0, #0x3c
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
_0205507A:
	mov r0, #0x3c
	str r0, [r2]
	mov r0, #0xf
	str r0, [r3]
	bx lr
_02055084:
	mov r0, #0x1e
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
_0205508E:
	mov r0, #0x3c
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205504C

	thumb_func_start sub_02055098
sub_02055098: ; 0x02055098
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #2
	blt _020550A6
	bl GF_AssertFail
_020550A6:
	add r0, r5, #0
	mov r1, #1
	bl TrainerData_GetAttr
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, _020550DC ; =0x00000454
	ldr r1, _020550E0 ; =0x020FC61C
	mov r3, #0
	mov r6, #6
_020550BA:
	add r7, r3, #0
	mul r7, r6
	add r2, r1, r7
	ldrh r7, [r1, r7]
	cmp r5, r7
	bne _020550CE
	add r0, r4, #1
	lsl r0, r0, #1
	ldrh r0, [r2, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020550CE:
	add r2, r3, #1
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	cmp r3, #0x2c
	blo _020550BA
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020550DC: .word 0x00000454
_020550E0: .word 0x020FC61C
	thumb_func_end sub_02055098

	thumb_func_start sub_020550E4
sub_020550E4: ; 0x020550E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_02004A54
	cmp r0, #1
	beq _0205510C
	bl sub_02004A90
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl GetMapMusic
	cmp r4, r0
	beq _0205510C
	mov r0, #0
	mov r1, #0x28
	bl GF_SndStartFadeOutBGM
_0205510C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020550E4

	thumb_func_start sub_02055110
sub_02055110: ; 0x02055110
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl sub_02004A54
	cmp r0, #1
	beq _02055160
	mov r0, #0
	bl sub_02004AD8
	add r0, r5, #0
	add r1, r6, #0
	bl GetMapMusic
	add r6, r0, #0
	bl sub_02004AC8
	mov r0, #1
	bl sub_02005CF4
	mov r1, #2
	add r0, r5, #0
	mvn r1, r1
	add r0, #0xc4
	str r1, [r0]
	cmp r4, #1
	bne _02055152
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02055198
	b _0205515A
_02055152:
	mov r0, #0
	add r1, r6, #0
	bl sub_02055198
_0205515A:
	mov r0, #0
	bl sub_02005CF4
_02055160:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02055110

	thumb_func_start sub_02055164
sub_02055164: ; 0x02055164
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02054F60
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetMapMusic
	bl sub_02004AC8
	mov r0, #1
	bl sub_02005CF4
	mov r0, #0
	add r1, r6, #0
	bl sub_02055198
	add r4, r0, #0
	mov r0, #0
	bl sub_02005CF4
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02055164

	thumb_func_start sub_02055198
sub_02055198: ; 0x02055198
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_02004EB4
	add r4, r0, #0
	cmp r4, #1
	bne _020551B4
	cmp r5, #0
	beq _020551B4
	add r0, r5, #0
	mov r1, #0
	bl ov01_021E7F00
_020551B4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02055198
