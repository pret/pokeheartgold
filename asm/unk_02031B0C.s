#include "constants/items.h"
	.include "asm/macros.inc"
	.include "unk_02031B0C.inc"
	.include "global.inc"

	.rodata

_020F68D0:
	.short ITEM_LEVEL_BALL
	.short ITEM_MOON_BALL
	.short ITEM_LURE_BALL
	.short ITEM_FRIEND_BALL
	.short ITEM_LOVE_BALL
	.short ITEM_FAST_BALL
	.short ITEM_HEAVY_BALL
_020F68DE:
	.byte  4, -2,  0,  0
	.byte  0,  0,  4, -2
	.byte  0,  0,  0,  0
	.byte  4, -2,  0,  0
	.byte  0,  0,  4, -2
	.byte -2,  0,  0,  0
	.byte  4, -2, -2, -2
	.byte -2, -2,  2,  2
	.byte  2,  2,  2,  0
_020F6902:
	.byte 0x00, 0x00, 0x74, 0x16, 0x0A, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x78, 0x00, 0x14, 0x0E
	.byte 0x00, 0x00, 0x1C, 0x02, 0x7D, 0x00, 0x00, 0x1C
	.byte 0x14, 0x00, 0xC8, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x18, 0x0E, 0x96, 0x00, 0x68, 0x0C, 0x00, 0x00, 0x00, 0x14

	.text

	thumb_func_start Save_ApricornBox_sizeof
Save_ApricornBox_sizeof: ; 0x02031B0C
	mov r0, #0x80
	bx lr
	thumb_func_end Save_ApricornBox_sizeof

	thumb_func_start sub_02031B10
sub_02031B10: ; 0x02031B10
	mov r0, #0x20
	bx lr
	thumb_func_end sub_02031B10

	thumb_func_start Save_ApricornBox_Get
Save_ApricornBox_Get: ; 0x02031B14
	ldr r3, _02031B1C ; =SaveArray_Get
	mov r1, #0x26
	bx r3
	nop
_02031B1C: .word SaveArray_Get
	thumb_func_end Save_ApricornBox_Get

	thumb_func_start InitApricornBox
InitApricornBox: ; 0x02031B20
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x80
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xc
	bl sub_02031B5C
	add r0, r4, #0
	bl sub_02031B3C
	pop {r4, pc}
	thumb_func_end InitApricornBox

	thumb_func_start sub_02031B3C
sub_02031B3C: ; 0x02031B3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x20
_02031B44:
	add r0, r5, #0
	bl sub_020325CC
	add r4, r4, #1
	add r5, #0x20
	cmp r4, #3
	blt _02031B44
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02031B3C

	thumb_func_start Save_ApricornBox_Init
Save_ApricornBox_Init: ; 0x02031B54
	ldr r3, _02031B58 ; =InitApricornBox
	bx r3
	.balign 4, 0
_02031B58: .word InitApricornBox
	thumb_func_end Save_ApricornBox_Init

	thumb_func_start sub_02031B5C
sub_02031B5C: ; 0x02031B5C
	ldr r3, _02031B64 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #8
	bx r3
	.balign 4, 0
_02031B64: .word MI_CpuFill8
	thumb_func_end sub_02031B5C

	thumb_func_start ApricornBox_GiveApricorn
ApricornBox_GiveApricorn: ; 0x02031B68
	push {r3, lr}
	cmp r1, #7
	blt _02031B76
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02031B76:
	ldrb r3, [r0, r1]
	add r2, r2, r3
	cmp r2, #0x63
	ble _02031B82
	mov r2, #0x63
	b _02031B82
_02031B82:
	strb r2, [r0, r1]
	ldrb r0, [r0, r1]
	pop {r3, pc}
	thumb_func_end ApricornBox_GiveApricorn

	thumb_func_start ApricornBox_TakeApricorn
ApricornBox_TakeApricorn: ; 0x02031B88
	push {r3, lr}
	cmp r1, #7
	blt _02031B96
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02031B96:
	ldrb r3, [r0, r1]
	cmp r3, r2
	blo _02031BA0
	sub r2, r3, r2
	strb r2, [r0, r1]
_02031BA0:
	ldrb r0, [r0, r1]
	pop {r3, pc}
	thumb_func_end ApricornBox_TakeApricorn

	thumb_func_start ApricornBox_CountApricorn
ApricornBox_CountApricorn: ; 0x02031BA4
	push {r3, lr}
	cmp r1, #7
	blt _02031BB2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02031BB2:
	ldrb r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ApricornBox_CountApricorn

	thumb_func_start ApricornBox_SetKurtApricorn
ApricornBox_SetKurtApricorn: ; 0x02031BB8
	push {r3, lr}
	ldrb r3, [r0, r1]
	cmp r3, r2
	bhs _02031BC6
	bl GF_AssertFail
	pop {r3, pc}
_02031BC6:
	strb r1, [r0, #8]
	strb r2, [r0, #7]
	bl ApricornBox_TakeApricorn
	pop {r3, pc}
	thumb_func_end ApricornBox_SetKurtApricorn

	thumb_func_start ApricornBox_GetKurtQuantity
ApricornBox_GetKurtQuantity: ; 0x02031BD0
	ldrb r0, [r0, #7]
	bx lr
	thumb_func_end ApricornBox_GetKurtQuantity

	thumb_func_start ApricornBox_GetKurtBall
ApricornBox_GetKurtBall: ; 0x02031BD4
	ldrb r0, [r0, #8]
	cmp r0, #7
	blo _02031BDE
	mov r0, #ITEM_POKE_BALL
	bx lr
_02031BDE:
	lsl r1, r0, #1
	ldr r0, _02031BE8 ; =_020F68D0
	ldrh r0, [r0, r1]
	bx lr
	nop
_02031BE8: .word _020F68D0
	thumb_func_end ApricornBox_GetKurtBall

	thumb_func_start sub_02031BEC
sub_02031BEC: ; 0x02031BEC
	ldr r3, [r0, #0x1c]
	ldr r2, _02031BFC ; =0x3FFFFFFF
	lsl r1, r1, #0x1e
	and r2, r3
	orr r1, r2
	str r1, [r0, #0x1c]
	bx lr
	nop
_02031BFC: .word 0x3FFFFFFF
	thumb_func_end sub_02031BEC

	thumb_func_start sub_02031C00
sub_02031C00: ; 0x02031C00
	ldr r0, [r0, #0x1c]
	lsr r0, r0, #0x1e
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031C00

	thumb_func_start sub_02031C08
sub_02031C08: ; 0x02031C08
	push {r3, r4}
	ldrh r4, [r0, #0xa]
	mov r3, #0
	add r2, r3, #0
	mov r1, #7
_02031C12:
	add r0, r4, #0
	tst r0, r1
	beq _02031C1E
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
_02031C1E:
	lsl r0, r4, #0xd
	add r2, r2, #1
	lsr r4, r0, #0x10
	cmp r2, #5
	blt _02031C12
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031C08

	thumb_func_start sub_02031C30
sub_02031C30: ; 0x02031C30
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrh r6, [r5, #0xa]
	cmp r4, #7
	blt _02031C44
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02031C44:
	mov r3, #0
	mov r1, #7
_02031C48:
	add r0, r6, #0
	tst r0, r1
	beq _02031C54
	lsl r0, r6, #0xd
	lsr r6, r0, #0x10
	b _02031C96
_02031C54:
	add r6, r4, #1
	mov r0, #7
	and r0, r6
	lsl r6, r3, #1
	add r3, r3, r6
	lsl r0, r3
	lsl r0, r0, #0x10
	ldrh r1, [r5, #0xa]
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r5, #0xa]
	mov r0, #2
	ldrh r1, [r5, #0xa]
	lsl r0, r0, #0xe
	orr r0, r1
	strh r0, [r5, #0xa]
	str r2, [r5, #0x14]
	ldrb r0, [r5, #9]
	cmp r0, #0
	bne _02031C7E
	str r2, [r5, #0x18]
_02031C7E:
	mov r0, #3
	ldr r1, [r5, #0x1c]
	lsl r0, r0, #0x1e
	and r0, r1
	str r0, [r5, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ApricornBox_TakeApricorn
	mov r0, #1
	pop {r4, r5, r6, pc}
_02031C96:
	add r3, r3, #1
	cmp r3, #5
	blt _02031C48
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02031C30

	thumb_func_start sub_02031CA0
sub_02031CA0: ; 0x02031CA0
	push {r4, lr}
	add r4, r0, #0
	bl sub_02031C08
	cmp r0, #0
	bne _02031CB0
	mov r0, #0
	pop {r4, pc}
_02031CB0:
	ldr r0, [r4, #0x1c]
	lsl r0, r0, #2
	lsr r0, r0, #2
	cmp r0, #0x32
	bhs _02031CBE
	mov r0, #1
	pop {r4, pc}
_02031CBE:
	cmp r0, #0x50
	bhs _02031CC6
	mov r0, #2
	pop {r4, pc}
_02031CC6:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02031CA0

	thumb_func_start sub_02031CCC
sub_02031CCC: ; 0x02031CCC
	mov r2, #0xa
	mul r2, r1
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _02031CE6
	ldrb r1, [r0, #0xe]
	add r1, r1, r2
	cmp r1, #0xff
	ble _02031CE4
	mov r1, #0xff
	strb r1, [r0, #0xe]
	bx lr
_02031CE4:
	strb r1, [r0, #0xe]
_02031CE6:
	bx lr
	thumb_func_end sub_02031CCC

	thumb_func_start sub_02031CE8
sub_02031CE8: ; 0x02031CE8
	ldrb r0, [r0, #9]
	bx lr
	thumb_func_end sub_02031CE8

	thumb_func_start sub_02031CEC
sub_02031CEC: ; 0x02031CEC
	push {r3, r4, r5, lr}
	add r5, r2, #0
	cmp r1, #9
	blt _02031CF6
	mov r1, #0
_02031CF6:
	cmp r1, #4
	bgt _02031D12
	ldr r0, _02031D68 ; =_020F6902
	lsl r2, r1, #3
	add r1, r0, r2
	ldrh r0, [r0, r2]
	strh r0, [r5]
	ldrh r0, [r1, #2]
	strh r0, [r5, #2]
	ldrh r0, [r1, #4]
	strh r0, [r5, #4]
	ldrh r0, [r1, #6]
	strh r0, [r5, #6]
	b _02031D64
_02031D12:
	cmp r1, #7
	bgt _02031D44
	sub r1, r1, #5
	add r0, #0x38
	lsl r1, r1, #5
	add r4, r0, r1
	add r0, r4, #0
	bl sub_02031D80
	cmp r0, #0
	bne _02031D32
	add r0, r5, #0
	bl sub_02031B5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02031D32:
	ldrh r0, [r4]
	strh r0, [r5]
	ldrh r0, [r4, #2]
	strh r0, [r5, #2]
	ldrh r0, [r4, #4]
	strh r0, [r5, #4]
	ldrh r0, [r4, #6]
	strh r0, [r5, #6]
	b _02031D64
_02031D44:
	ldrb r1, [r0, #9]
	cmp r1, #0
	bne _02031D54
	add r0, r5, #0
	bl sub_02031B5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02031D54:
	ldrh r1, [r0, #0xc]
	strh r1, [r5]
	ldrh r1, [r0, #0xe]
	strh r1, [r5, #2]
	ldrh r1, [r0, #0x10]
	strh r1, [r5, #4]
	ldrh r0, [r0, #0x12]
	strh r0, [r5, #6]
_02031D64:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031D68: .word _020F6902
	thumb_func_end sub_02031CEC

	thumb_func_start sub_02031D6C
sub_02031D6C: ; 0x02031D6C
	push {r3, lr}
	bl sub_02031D80
	cmp r0, #0
	beq _02031D7A
	mov r0, #1
	pop {r3, pc}
_02031D7A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02031D6C

	thumb_func_start sub_02031D80
sub_02031D80: ; 0x02031D80
	mov r3, #0
	add r2, r3, #0
_02031D84:
	add r1, r0, r2
	ldrb r1, [r1, #3]
	add r2, r2, #1
	add r1, r3, r1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r2, #5
	blt _02031D84
	cmp r3, #0x64
	bls _02031D9A
	mov r3, #0x64
_02031D9A:
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_02031D80

	thumb_func_start sub_02031DA0
sub_02031DA0: ; 0x02031DA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xe
	bl MI_CpuFill8
	add r0, sp, #4
	add r0, #2
	mov r1, #0
	mov r2, #0xa
	bl MI_CpuFill8
	mov r0, #0
	add r1, sp, #4
	str r0, [sp]
	add r1, #2
_02031DC6:
	add r2, r4, r0
	ldrb r2, [r2, #3]
	strb r0, [r1]
	strb r2, [r1, #1]
	cmp r2, #0
	beq _02031DDC
	ldr r2, [sp]
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
_02031DDC:
	add r0, r0, #1
	add r1, r1, #2
	cmp r0, #5
	blt _02031DC6
	ldr r0, [sp]
	cmp r0, #0
	beq _02031E3C
	add r0, sp, #4
	add r0, #2
	mov r7, #0
	mov ip, r0
_02031DF2:
	add r5, r7, #1
	cmp r5, #5
	bge _02031E34
	lsl r2, r5, #1
	mov r1, ip
	add r1, r1, r2
	add r2, sp, #4
_02031E00:
	ldrb r4, [r1, #1]
	ldrb r3, [r0, #1]
	cmp r3, r4
	bhi _02031E2C
	cmp r3, r4
	bne _02031E14
	ldrb r4, [r0]
	ldrb r3, [r1]
	cmp r4, r3
	blo _02031E2C
_02031E14:
	ldrb r3, [r0]
	strb r3, [r2]
	ldrb r3, [r0, #1]
	strb r3, [r2, #1]
	ldrb r3, [r1]
	strb r3, [r0]
	ldrb r3, [r1, #1]
	strb r3, [r0, #1]
	ldrb r3, [r2]
	strb r3, [r1]
	ldrb r3, [r2, #1]
	strb r3, [r1, #1]
_02031E2C:
	add r5, r5, #1
	add r1, r1, #2
	cmp r5, #5
	blt _02031E00
_02031E34:
	add r7, r7, #1
	add r0, r0, #2
	cmp r7, #5
	blt _02031DF2
_02031E3C:
	add r0, sp, #4
	ldrb r5, [r0, #0xb]
	add r3, sp, #4
	add r0, r6, #0
	mov r4, #0
	add r3, #2
	add r0, #0xb
_02031E4A:
	ldrb r2, [r3]
	add r1, r6, r4
	strb r2, [r1, #6]
	ldrb r1, [r3, #1]
	cmp r5, r1
	bne _02031E5C
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
_02031E5C:
	add r4, r4, #1
	add r3, r3, #2
	cmp r4, #5
	blt _02031E4A
	ldr r0, [sp]
	strb r0, [r6, #0xc]
	ldr r0, [sp]
	cmp r0, #5
	bls _02031E70
	b _02031FDC
_02031E70:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02031E7C: ; jump table
	.short _02031E88 - _02031E7C - 2 ; case 0
	.short _02031E98 - _02031E7C - 2 ; case 1
	.short _02031EB2 - _02031E7C - 2 ; case 2
	.short _02031ED6 - _02031E7C - 2 ; case 3
	.short _02031EFA - _02031E7C - 2 ; case 4
	.short _02031EFA - _02031E7C - 2 ; case 5
_02031E88:
	ldrh r1, [r6]
	mov r0, #0xf
	add sp, #0x10
	bic r1, r0
	mov r0, #6
	orr r0, r1
	strh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02031E98:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	ldrh r1, [r6, #2]
	mov r0, #0xf
	bic r1, r0
	mov r0, #6
	orr r0, r1
	strh r0, [r6, #2]
	b _02031FDC
_02031EB2:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	add r0, r6, #2
	add r1, sp, #8
	mov r2, #1
	bl sub_02032588
	ldrh r1, [r6, #4]
	mov r0, #0xf
	bic r1, r0
	mov r0, #6
	orr r0, r1
	strh r0, [r6, #4]
	b _02031FDC
_02031ED6:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	add r0, r6, #2
	add r1, sp, #8
	mov r2, #1
	bl sub_02032588
	add r1, sp, #8
	add r0, r6, #4
	add r1, #2
	mov r2, #2
	bl sub_02032588
	b _02031FDC
_02031EFA:
	add r0, sp, #4
	ldrb r2, [r0, #3]
	ldrb r1, [r0, #9]
	sub r1, r2, r1
	cmp r1, #0xc
	bgt _02031F88
	ldrh r3, [r6]
	mov r2, #0xf
	mov r1, #5
	bic r3, r2
	orr r1, r3
	strh r1, [r6]
	ldrb r3, [r0, #3]
	ldrh r1, [r6]
	ldr r4, _02031FE4 ; =0xFFFF00FF
	lsl r3, r3, #0x18
	and r1, r4
	lsr r3, r3, #0x10
	orr r1, r3
	strh r1, [r6]
	ldrh r1, [r6, #2]
	mov r3, #6
	bic r1, r2
	orr r1, r3
	strh r1, [r6, #2]
	ldrb r5, [r0, #5]
	ldrh r1, [r6, #2]
	lsl r5, r5, #0x18
	and r1, r4
	lsr r5, r5, #0x10
	orr r1, r5
	strh r1, [r6, #2]
	ldrh r1, [r6, #4]
	bic r1, r2
	orr r1, r3
	strh r1, [r6, #4]
	ldrh r1, [r6, #4]
	add r2, r1, #0
	ldrb r1, [r0, #7]
	and r2, r4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	strh r1, [r6, #4]
	mov r1, #1
	strb r1, [r6, #0xc]
	ldrb r0, [r0, #3]
	cmp r0, #0x14
	bls _02031F6A
	ldrh r1, [r6]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x30
	orr r0, r1
	strh r0, [r6]
	b _02031FDC
_02031F6A:
	cmp r0, #7
	ldrh r1, [r6]
	bls _02031F7C
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strh r0, [r6]
	b _02031FDC
_02031F7C:
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r6]
	b _02031FDC
_02031F88:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	add r0, r6, #2
	add r1, sp, #8
	mov r2, #1
	bl sub_02032588
	ldr r0, [sp]
	cmp r0, #4
	bne _02031FB2
	add r1, sp, #0xc
	add r0, r6, #4
	add r1, #2
	mov r2, #2
	bl sub_02032588
	b _02031FDC
_02031FB2:
	ldrh r1, [r6, #4]
	mov r0, #0xf
	bic r1, r0
	mov r0, #5
	orr r0, r1
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	ldr r0, _02031FE4 ; =0xFFFF00FF
	and r1, r0
	add r0, sp, #4
	ldrb r0, [r0, #7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r6, #4]
_02031FDC:
	ldr r0, [sp]
	strb r0, [r6, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02031FE4: .word 0xFFFF00FF
	thumb_func_end sub_02031DA0

	thumb_func_start sub_02031FE8
sub_02031FE8: ; 0x02031FE8
	push {r3, lr}
	sub sp, #0x10
	add r1, sp, #0
	bl sub_02031DA0
	add r0, sp, #0
	ldrh r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #5
	blo _02032000
	mov r0, #5
_02032000:
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end sub_02031FE8

	thumb_func_start sub_02032004
sub_02032004: ; 0x02032004
	push {r3, lr}
	sub sp, #0x10
	add r1, sp, #0
	bl sub_02031DA0
	add r0, sp, #0
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	bne _0203201C
	add sp, #0x10
	mov r0, #0
	pop {r3, pc}
_0203201C:
	ldrb r0, [r0, #6]
	add r0, r0, #1
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end sub_02032004

	thumb_func_start sub_02032024
sub_02032024: ; 0x02032024
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02032032
	mov r0, #0
	pop {r4, pc}
_02032032:
	sub r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02032054
	add r0, r4, #0
	add r0, #0xc
	bl sub_02031B5C
	mov r0, #0
	str r0, [r4, #0x18]
	str r0, [r4, #0x14]
	mov r0, #3
	ldr r1, [r4, #0x1c]
	lsl r0, r0, #0x1e
	and r0, r1
	str r0, [r4, #0x1c]
_02032054:
	ldrb r0, [r4, #9]
	pop {r4, pc}
	thumb_func_end sub_02032024

	thumb_func_start sub_02032058
sub_02032058: ; 0x02032058
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0xa]
	add r4, r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	bne _0203206C
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _020320D8
_0203206C:
	ldr r0, [r5, #0x18]
	sub r6, r4, r0
	cmp r6, #0x64
	blo _02032094
	add r0, r6, #0
	mov r1, #0x64
	bl _u32_div_f
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02032340
	add r0, r6, #0
	mov r1, #0x64
	bl _u32_div_f
	sub r0, r4, r1
	str r0, [r5, #0x18]
_02032094:
	ldrh r0, [r5, #0xa]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	beq _020320D8
	ldr r1, [r5, #0x1c]
	mov r0, #3
	lsl r0, r0, #0x1e
	add r2, r1, #0
	and r2, r0
	ldr r0, [r5, #0x14]
	sub r1, r4, r0
	ldr r0, _020320DC ; =0x3FFFFFFF
	and r0, r1
	orr r0, r2
	str r0, [r5, #0x1c]
	lsl r0, r0, #2
	lsr r0, r0, #2
	cmp r0, #0x64
	blo _020320D8
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _020320CA
	add r0, r5, #0
	mov r1, #3
	bl sub_02031BEC
	b _020320D2
_020320CA:
	add r0, r5, #0
	mov r1, #2
	bl sub_02031BEC
_020320D2:
	add r0, r5, #0
	bl sub_02032354
_020320D8:
	pop {r4, r5, r6, pc}
	nop
_020320DC: .word 0x3FFFFFFF
	thumb_func_end sub_02032058

	thumb_func_start sub_020320E0
sub_020320E0: ; 0x020320E0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x20
	add r6, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #4]
	add r0, r5, #0
	bl PlayerProfile_GetLanguage
	strb r0, [r4, #5]
	add r0, r5, #0
	bl PlayerProfile_GetVersion
	strb r0, [r4, #6]
	add r0, r4, #0
	add r0, #8
	mov r1, #8
	bl StringFillEOS
	add r0, r5, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #8
	mov r2, #7
	bl CopyU16StringArrayN
	add r2, r4, #0
	add r0, r7, #0
	mov r1, #8
	add r2, #0x18
	bl sub_02031CEC
	ldr r0, _02032154 ; =0x0000FFFF
	cmp r6, r0
	bls _0203214C
	strh r0, [r4, #0x18]
	b _0203214E
_0203214C:
	strh r6, [r4, #0x18]
_0203214E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02032154: .word 0x0000FFFF
	thumb_func_end sub_020320E0

	thumb_func_start sub_02032158
sub_02032158: ; 0x02032158
	push {r3, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	beq _02032166
	mov r0, #0
	pop {r3, pc}
_02032166:
	ldrb r3, [r0, #4]
	ldrb r2, [r1, #4]
	cmp r3, r2
	beq _02032172
	mov r0, #0
	pop {r3, pc}
_02032172:
	ldrb r3, [r0, #6]
	ldrb r2, [r1, #6]
	cmp r3, r2
	beq _0203217E
	mov r0, #0
	pop {r3, pc}
_0203217E:
	ldrb r3, [r0, #5]
	ldrb r2, [r1, #5]
	cmp r3, r2
	beq _0203218A
	mov r0, #0
	pop {r3, pc}
_0203218A:
	add r0, #8
	add r1, #8
	bl StringNotEqual
	cmp r0, #0
	bne _0203219A
	mov r0, #1
	pop {r3, pc}
_0203219A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02032158

	thumb_func_start sub_020321A0
sub_020321A0: ; 0x020321A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r4, #0
	add r5, r0, #0
	str r0, [sp]
	add r7, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0x10]
	add r5, #0x38
_020321B4:
	add r0, r5, #0
	bl sub_02031D6C
	cmp r0, #0
	beq _020321CC
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	add r0, r0, #1
	add r5, #0x20
	str r0, [sp, #0x10]
	cmp r4, #3
	blt _020321B4
_020321CC:
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _020322A6
_020321D6:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _02032298
	add r0, r7, #0
	add r0, #0x18
	bl sub_02031D6C
	cmp r0, #0
	beq _02032298
	mov r4, #0
	str r4, [sp, #0x14]
	ldr r5, [sp]
	ldr r6, [sp, #0x14]
	add r5, #0x20
_020321F4:
	add r0, r7, #0
	add r1, r5, #0
	bl sub_02032158
	cmp r0, #0
	beq _0203220A
	lsl r0, r6, #0x18
	lsr r4, r0, #0x18
	mov r0, #1
	str r0, [sp, #0x14]
	b _02032212
_0203220A:
	add r6, r6, #1
	add r5, #0x20
	cmp r6, #3
	blt _020321F4
_02032212:
	ldr r0, [sp, #0x10]
	cmp r0, #3
	blt _02032222
	mov r0, #2
	mov ip, r0
	mov r0, #1
	str r0, [sp, #0x14]
	b _02032242
_02032222:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02032234
	ldr r0, [sp, #0x10]
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	b _02032242
_02032234:
	ldr r0, [sp, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_02032242:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0203227C
	mov r0, ip
	cmp r4, r0
	bhs _0203227C
	ldr r0, [sp, #0x10]
	sub r6, r0, #1
	cmp r4, r6
	bge _0203227C
	ldr r0, [sp]
	lsl r1, r4, #5
	add r5, r0, r1
_0203225C:
	add r3, r5, #0
	add r2, r5, #0
	add r3, #0x40
	add r2, #0x20
	add r5, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	add r4, r4, #1
	stmia r2!, {r0, r1}
	cmp r4, r6
	blt _0203225C
_0203227C:
	mov r0, ip
	lsl r1, r0, #5
	ldr r0, [sp]
	add r3, r7, #0
	add r2, r0, r1
	add r2, #0x20
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
_02032298:
	ldr r0, [sp, #0xc]
	add r7, #0x20
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _020321D6
_020322A6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020321A0

	thumb_func_start sub_020322AC
sub_020322AC: ; 0x020322AC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #9
	add r1, r7, #0
	bl String_New
	add r6, r0, #0
	cmp r5, #5
	bge _020322E2
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x15
	add r3, r7, #0
	bl NewMsgDataFromNarc
	add r5, #0xe
	add r4, r0, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	b _02032304
_020322E2:
	cmp r5, #8
	bge _02032304
	sub r0, r5, #5
	lsl r0, r0, #0x18
	lsr r5, r0, #0x13
	add r0, r4, #0
	add r0, #0x38
	add r0, r0, r5
	bl sub_02031D6C
	cmp r0, #0
	beq _02032304
	add r4, #0x28
	add r0, r6, #0
	add r1, r4, r5
	bl CopyU16ArrayToString
_02032304:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020322AC

	thumb_func_start sub_02032308
sub_02032308: ; 0x02032308
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r2, #0
	add r2, sp, #0
	bl sub_02031CEC
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x15
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r0, sp, #0
	bl sub_02032004
	add r1, r0, #0
	add r0, r5, #0
	add r1, #0x13
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02032308

	thumb_func_start sub_02032340
sub_02032340: ; 0x02032340
	ldrb r2, [r0, #0xe]
	add r1, r2, r1
	cmp r1, #0xff
	ble _0203234E
	mov r1, #0xff
	strb r1, [r0, #0xe]
	bx lr
_0203234E:
	strb r1, [r0, #0xe]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032340

	thumb_func_start sub_02032354
sub_02032354: ; 0x02032354
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp]
	ldrh r0, [r0, #0xa]
	add r1, sp, #0x34
	add r1, #1
	str r0, [sp, #0x14]
	ldr r0, [sp]
	add r0, #0xc
	bl sub_020324F4
	mov r0, #0
	str r0, [sp, #0x28]
_0203236E:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	mov r1, #7
	and r0, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	bne _02032380
	b _020324CA
_02032380:
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x1c]
	sub r0, r1, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	add r1, sp, #0x30
_02032398:
	strb r0, [r1]
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #5
	blt _02032398
	mov r0, #0
	add r2, sp, #0x30
	add r7, sp, #0x34
	str r0, [sp, #4]
	add r7, #1
	mov ip, r2
_020323AE:
	ldr r0, [sp, #4]
	add r1, r0, #1
	cmp r1, #5
	bge _020323DE
	mov r0, ip
	add r3, r0, r1
_020323BA:
	mov r0, #0
	mov r5, #0
	ldrsb r4, [r3, r0]
	ldrsb r5, [r2, r5]
	ldrsb r0, [r7, r4]
	ldrsb r6, [r7, r5]
	cmp r6, r0
	bgt _020323D6
	cmp r6, r0
	bne _020323D2
	cmp r5, r4
	blt _020323D6
_020323D2:
	strb r4, [r2]
	strb r5, [r3]
_020323D6:
	add r1, r1, #1
	add r3, r3, #1
	cmp r1, #5
	blt _020323BA
_020323DE:
	ldr r0, [sp, #4]
	add r2, r2, #1
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #2
	blt _020323AE
	ldr r0, [sp, #0x20]
	ldr r2, _020324F0 ; =_020F68DE
	lsl r1, r0, #2
	add r0, r0, r1
	add r1, r2, r0
	add r2, sp, #0x34
	mov r4, #0
	add r3, sp, #0x30
	ldrsb r0, [r3, r4]
	add r2, #1
	str r0, [sp, #8]
	add r0, r2, r0
	str r0, [sp, #0xc]
	mov r0, #1
	ldrsb r7, [r3, r0]
	add r0, r2, r7
	str r0, [sp, #0x2c]
_0203240C:
	mov r0, #0
	ldrsb r5, [r1, r0]
	ldrsb r3, [r2, r0]
	add r0, r3, r5
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	cmp r5, #0
	ble _0203243E
	ldr r6, [sp, #0xc]
	mov r5, #0
	ldrsb r5, [r6, r5]
	cmp r5, #0
	beq _0203243E
	ldr r5, [sp, #8]
	cmp r5, r4
	beq _0203243E
	ldr r5, [sp, #0x2c]
	mov r6, #0
	ldrsb r5, [r5, r6]
	cmp r5, #0
	beq _0203243E
	cmp r7, r4
	beq _0203243E
	mov r5, #1
	str r5, [sp, #0x10]
_0203243E:
	cmp r0, #0x3f
	blt _02032446
	mov r0, #0x3f
	b _0203244C
_02032446:
	cmp r0, #0
	bge _0203244C
	mov r0, #0
_0203244C:
	ldr r5, [sp, #0x20]
	cmp r5, #6
	beq _02032456
	cmp r0, r3
	bgt _02032468
_02032456:
	ldr r3, [sp, #0x1c]
	cmp r0, r3
	ble _02032468
	lsl r3, r0, #0x18
	lsr r3, r3, #0x18
	str r3, [sp, #0x1c]
	lsl r3, r4, #0x18
	lsr r3, r3, #0x18
	str r3, [sp, #0x18]
_02032468:
	strb r0, [r2]
	ldr r3, [sp, #0x24]
	add r4, r4, #1
	add r0, r3, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	add r1, r1, #1
	add r2, r2, #1
	cmp r4, #5
	blt _0203240C
	ldr r0, [sp, #0x14]
	lsl r0, r0, #0xd
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0203249E
	ldr r0, [sp]
	ldrb r1, [r0, #0xe]
	cmp r1, #0xa
	bhs _0203249A
	mov r1, #0
	strb r1, [r0, #0xe]
	b _0203249E
_0203249A:
	sub r1, #0xa
	strb r1, [r0, #0xe]
_0203249E:
	ldr r0, [sp, #0x20]
	cmp r0, #5
	beq _020324BE
	ldr r0, [sp, #0x24]
	cmp r0, #0x64
	bls _020324BE
	add r2, sp, #0x34
	ldr r0, [sp, #0x18]
	add r2, #1
	ldrsb r1, [r2, r0]
	ldr r0, [sp, #0x24]
	sub r0, #0x64
	str r0, [sp, #0x24]
	sub r1, r1, r0
	ldr r0, [sp, #0x18]
	strb r1, [r2, r0]
_020324BE:
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #5
	bge _020324CA
	b _0203236E
_020324CA:
	mov r4, #0
	add r3, sp, #0x34
	add r3, #1
	add r1, r4, #0
_020324D2:
	ldrsb r2, [r3, r1]
	ldr r0, [sp]
	add r3, r3, #1
	add r0, r0, r4
	add r4, r4, #1
	strb r2, [r0, #0xf]
	cmp r4, #5
	blt _020324D2
	ldr r0, [sp]
	mov r1, #3
	strb r1, [r0, #9]
	mov r1, #0
	strh r1, [r0, #0xa]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020324F0: .word _020F68DE
	thumb_func_end sub_02032354

	thumb_func_start sub_020324F4
sub_020324F4: ; 0x020324F4
	mov r3, #0
_020324F6:
	add r2, r0, r3
	ldrb r2, [r2, #3]
	strb r2, [r1, r3]
	add r3, r3, #1
	cmp r3, #5
	blt _020324F6
	bx lr
	thumb_func_end sub_020324F4

	thumb_func_start sub_02032504
sub_02032504: ; 0x02032504
	cmp r1, #0
	bne _0203250C
	mov r0, #0
	bx lr
_0203250C:
	cmp r0, #0
	beq _0203251A
	cmp r0, #1
	beq _0203254A
	cmp r0, #2
	beq _0203256A
	b _02032582
_0203251A:
	cmp r1, #0x3e
	bls _02032522
	mov r0, #6
	bx lr
_02032522:
	cmp r1, #0x32
	bls _0203252A
	mov r0, #5
	bx lr
_0203252A:
	cmp r1, #0x28
	bls _02032532
	mov r0, #4
	bx lr
_02032532:
	cmp r1, #0x1e
	bls _0203253A
	mov r0, #3
	bx lr
_0203253A:
	cmp r1, #0x14
	bls _02032542
	mov r0, #2
	bx lr
_02032542:
	cmp r1, #0
	beq _02032582
	mov r0, #1
	bx lr
_0203254A:
	cmp r1, #0x28
	bls _02032552
	mov r0, #4
	bx lr
_02032552:
	cmp r1, #0x1e
	bls _0203255A
	mov r0, #3
	bx lr
_0203255A:
	cmp r1, #0x14
	bls _02032562
	mov r0, #2
	bx lr
_02032562:
	cmp r1, #0
	beq _02032582
	mov r0, #1
	bx lr
_0203256A:
	cmp r1, #0x14
	bls _02032572
	mov r0, #3
	bx lr
_02032572:
	cmp r1, #0xa
	bls _0203257A
	mov r0, #2
	bx lr
_0203257A:
	cmp r1, #0
	beq _02032582
	mov r0, #1
	bx lr
_02032582:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032504

	thumb_func_start sub_02032588
sub_02032588: ; 0x02032588
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r0, [r4]
	ldrb r5, [r1]
	mov r3, #0xf
	bic r0, r3
	mov r3, #0xf
	and r3, r5
	orr r0, r3
	strh r0, [r4]
	ldrh r3, [r4]
	ldr r0, _020325C8 ; =0xFFFF00FF
	and r3, r0
	ldrb r0, [r1, #1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x10
	orr r0, r3
	strh r0, [r4]
	lsl r0, r2, #0x18
	ldrb r1, [r1, #1]
	lsr r0, r0, #0x18
	bl sub_02032504
	lsl r0, r0, #0x1c
	ldrh r2, [r4]
	mov r1, #0xf0
	lsr r0, r0, #0x18
	bic r2, r1
	orr r0, r2
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_020325C8: .word 0xFFFF00FF
	thumb_func_end sub_02032588

	thumb_func_start sub_020325CC
sub_020325CC: ; 0x020325CC
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x18
	bl sub_02031B5C
	add r4, #8
	add r0, r4, #0
	mov r1, #8
	bl StringFillEOS
	pop {r4, pc}
	thumb_func_end sub_020325CC
