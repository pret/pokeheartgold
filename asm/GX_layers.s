	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D21FC:
	.space 0x8

	.text

	thumb_func_start GX_SetBanks
GX_SetBanks: ; 0x02022BE8
	push {r4, lr}
	add r4, r0, #0
	bl GX_ResetBankForBG
	bl GX_ResetBankForBGExtPltt
	bl GX_ResetBankForSubBG
	bl GX_ResetBankForSubBGExtPltt
	bl GX_ResetBankForOBJ
	bl GX_ResetBankForOBJExtPltt
	bl GX_ResetBankForSubOBJ
	bl GX_ResetBankForSubOBJExtPltt
	bl GX_ResetBankForTex
	bl GX_ResetBankForTexPltt
	ldr r0, [r4]
	bl GX_SetBankForBG
	ldr r0, [r4, #4]
	bl GX_SetBankForBGExtPltt
	ldr r0, [r4, #8]
	bl GX_SetBankForSubBG
	ldr r0, [r4, #0xc]
	bl GX_SetBankForSubBGExtPltt
	ldr r0, [r4, #0x10]
	bl GX_SetBankForOBJ
	ldr r0, [r4, #0x14]
	bl GX_SetBankForOBJExtPltt
	ldr r0, [r4, #0x18]
	bl GX_SetBankForSubOBJ
	ldr r0, [r4, #0x1c]
	bl GX_SetBankForSubOBJExtPltt
	ldr r0, [r4, #0x20]
	bl GX_SetBankForTex
	ldr r0, [r4, #0x24]
	bl GX_SetBankForTexPltt
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GX_SetBanks

	thumb_func_start GX_DisableEngineALayers
GX_DisableEngineALayers: ; 0x02022C54
	ldr r0, _02022C5C ; =_021D21FC
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_02022C5C: .word _021D21FC
	thumb_func_end GX_DisableEngineALayers

	thumb_func_start GX_EngineAToggleLayers
GX_EngineAToggleLayers: ; 0x02022C60
	cmp r1, #1
	bne _02022C6E
	ldr r1, _02022C94 ; =_021D21FC
	ldr r1, [r1, #4]
	tst r1, r0
	beq _02022C76
	bx lr
_02022C6E:
	ldr r1, _02022C94 ; =_021D21FC
	ldr r1, [r1, #4]
	tst r1, r0
	beq _02022C90
_02022C76:
	ldr r1, _02022C94 ; =_021D21FC
	ldr r2, [r1, #4]
	add r3, r2, #0
	eor r3, r0
	mov r2, #1
	lsl r2, r2, #0x1a
	str r3, [r1, #4]
	ldr r1, [r2]
	ldr r0, _02022C98 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r3, #8
	orr r0, r1
	str r0, [r2]
_02022C90:
	bx lr
	nop
_02022C94: .word _021D21FC
_02022C98: .word 0xFFFFE0FF
	thumb_func_end GX_EngineAToggleLayers

	thumb_func_start sub_02022C9C
sub_02022C9C: ; 0x02022C9C
	ldr r1, _02022CB4 ; =_021D21FC
	mov r3, #1
	str r0, [r1, #4]
	lsl r3, r3, #0x1a
	ldr r2, [r3]
	ldr r1, _02022CB8 ; =0xFFFFE0FF
	lsl r0, r0, #8
	and r1, r2
	orr r0, r1
	str r0, [r3]
	bx lr
	nop
_02022CB4: .word _021D21FC
_02022CB8: .word 0xFFFFE0FF
	thumb_func_end sub_02022C9C

	thumb_func_start GX_DisableEngineBLayers
GX_DisableEngineBLayers: ; 0x02022CBC
	ldr r0, _02022CC4 ; =_021D21FC
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_02022CC4: .word _021D21FC
	thumb_func_end GX_DisableEngineBLayers

	thumb_func_start sub_02022CC8
sub_02022CC8: ; 0x02022CC8
	cmp r1, #1
	bne _02022CD6
	ldr r1, _02022CF8 ; =_021D21FC
	ldr r1, [r1]
	tst r1, r0
	beq _02022CDE
	bx lr
_02022CD6:
	ldr r1, _02022CF8 ; =_021D21FC
	ldr r1, [r1]
	tst r1, r0
	beq _02022CF6
_02022CDE:
	ldr r1, _02022CF8 ; =_021D21FC
	ldr r2, [r1]
	add r3, r2, #0
	eor r3, r0
	ldr r2, _02022CFC ; =0x04001000
	str r3, [r1]
	ldr r1, [r2]
	ldr r0, _02022D00 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r3, #8
	orr r0, r1
	str r0, [r2]
_02022CF6:
	bx lr
	.balign 4, 0
_02022CF8: .word _021D21FC
_02022CFC: .word 0x04001000
_02022D00: .word 0xFFFFE0FF
	thumb_func_end sub_02022CC8

	thumb_func_start sub_02022D04
sub_02022D04: ; 0x02022D04
	ldr r1, _02022D18 ; =_021D21FC
	ldr r3, _02022D1C ; =0x04001000
	str r0, [r1]
	ldr r2, [r3]
	ldr r1, _02022D20 ; =0xFFFFE0FF
	lsl r0, r0, #8
	and r1, r2
	orr r0, r1
	str r0, [r3]
	bx lr
	.balign 4, 0
_02022D18: .word _021D21FC
_02022D1C: .word 0x04001000
_02022D20: .word 0xFFFFE0FF
	thumb_func_end sub_02022D04

	thumb_func_start GX_BothDispOn
GX_BothDispOn: ; 0x02022D24
	push {r3, lr}
	bl sub_020CD9B4
	ldr r2, _02022D38 ; =0x04001000
	mov r0, #1
	ldr r1, [r2]
	lsl r0, r0, #0x10
	orr r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_02022D38: .word 0x04001000
	thumb_func_end GX_BothDispOn

	thumb_func_start GX_SwapDisplay
GX_SwapDisplay: ; 0x02022D3C
	ldr r0, _02022D5C ; =gMain + 0x60
	ldr r2, _02022D60 ; =0x04000304
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _02022D50
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	bx lr
_02022D50:
	ldrh r1, [r2]
	ldr r0, _02022D64 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2]
	bx lr
	nop
_02022D5C: .word gMain + 0x60
_02022D60: .word 0x04000304
_02022D64: .word 0xFFFF7FFF
	thumb_func_end GX_SwapDisplay

	thumb_func_start sub_02022D68
sub_02022D68: ; 0x02022D68
	ldr r0, _02022D70 ; =_021D21FC
	ldr r0, [r0, #4]
	bx lr
	nop
_02022D70: .word _021D21FC
	thumb_func_end sub_02022D68
