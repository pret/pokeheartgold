	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov63_0221BE20
ov63_0221BE20: ; 0x0221BE20
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0
	bl GX_EngineASetLayers
	mov r0, #0
	bl GX_EngineBSetLayers
	ldr r2, _0221BF10 ; =0x04000050
	mov r1, #0
	strh r1, [r2]
	ldr r0, _0221BF14 ; =0x04001050
	ldr r3, _0221BF18 ; =0x04000304
	strh r1, [r0]
	ldrh r1, [r3]
	lsr r0, r3, #0xb
	lsl r2, r2, #0xc
	orr r0, r1
	strh r0, [r3]
	mov r0, #3
	mov r1, #0x3e
	bl CreateHeap
	ldr r1, _0221BF1C ; =0x0001306C
	add r0, r4, #0
	mov r2, #0x3e
	bl OverlayManager_CreateAndGetData
	ldr r2, _0221BF1C ; =0x0001306C
	mov r1, #0
	add r5, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	str r0, [r5]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb4
	mov r3, #0x3e
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	mov r0, #0x3e
	bl ScrStrBufs_new
	add r1, r5, #0
	add r1, #0x88
	str r0, [r1]
	mov r0, #0x7d
	lsl r0, r0, #2
	mov r1, #0x3e
	bl String_ctor
	add r1, r5, #0
	add r1, #0x8c
	str r0, [r1]
	mov r0, #0x7d
	lsl r0, r0, #2
	mov r1, #0x3e
	bl String_ctor
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	mov r0, #0x65
	mov r1, #0x3e
	bl NARC_ctor
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	mov r0, #0xb4
	mov r1, #0x3e
	bl NARC_ctor
	add r1, r5, #0
	add r1, #0x98
	str r0, [r1]
	add r0, r5, #0
	bl ov63_0221E114
	bl ov63_0221BFBC
	add r0, r5, #0
	bl ov63_0221C044
	add r0, r5, #0
	bl ov63_0221C068
	ldr r1, _0221BF20 ; =0x000003F7
	mov r0, #8
	mov r2, #1
	bl sub_02004EC4
	mov r1, #0
	mov r0, #0x47
	add r2, r1, #0
	bl sub_02004EC4
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3e
	bl LoadFontPal0
	ldr r0, _0221BF24 ; =0x0001304C
	mov r1, #2
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221BF10: .word 0x04000050
_0221BF14: .word 0x04001050
_0221BF18: .word 0x04000304
_0221BF1C: .word 0x0001306C
_0221BF20: .word 0x000003F7
_0221BF24: .word 0x0001304C
	thumb_func_end ov63_0221BE20

	thumb_func_start ov63_0221BF28
ov63_0221BF28: ; 0x0221BF28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov63_0221C118
	add r0, r4, #0
	bl ov63_0221C05C
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	bl NARC_dtor
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl NARC_dtor
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	bl ScrStrBufs_delete
	add r4, #0x84
	ldr r0, [r4]
	bl DestroyMsgData
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x3e
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov63_0221BF28

	thumb_func_start ov63_0221BF88
ov63_0221BF88: ; 0x0221BF88
	push {r4, lr}
	bl OverlayManager_GetData
	ldr r1, _0221BFB4 ; =0x0001304C
	add r4, r0, #0
	ldr r1, [r4, r1]
	lsl r2, r1, #2
	ldr r1, _0221BFB8 ; =ov63_0221FD18
	ldr r1, [r1, r2]
	blx r1
	ldr r1, _0221BFB4 ; =0x0001304C
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #8
	bne _0221BFAA
	mov r0, #1
	pop {r4, pc}
_0221BFAA:
	add r0, r4, #0
	bl ov63_0221C14C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0221BFB4: .word 0x0001304C
_0221BFB8: .word ov63_0221FD18
	thumb_func_end ov63_0221BF88

	thumb_func_start ov63_0221BFBC
ov63_0221BFBC: ; 0x0221BFBC
	ldr r3, _0221BFC4 ; =GX_SetBanks
	ldr r0, _0221BFC8 ; =ov63_0221FD58
	bx r3
	nop
_0221BFC4: .word GX_SetBanks
_0221BFC8: .word ov63_0221FD58
	thumb_func_end ov63_0221BFBC

	thumb_func_start ov63_0221BFCC
ov63_0221BFCC: ; 0x0221BFCC
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0221BFE2
	add r0, r4, #0
	blx r1
	cmp r0, #0
	bne _0221BFE2
	mov r0, #0
	str r0, [r4, #8]
_0221BFE2:
	ldr r0, [r4, #0x10]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	add r4, #0xa0
	ldr r0, [r4]
	bl sub_0200D020
	bl sub_0200D034
	ldr r3, _0221C004 ; =0x027E0000
	ldr r1, _0221C008 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0221C004: .word 0x027E0000
_0221C008: .word 0x00003FF8
	thumb_func_end ov63_0221BFCC

	thumb_func_start ov63_0221C00C
ov63_0221C00C: ; 0x0221C00C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GX_LoadOBJ
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov63_0221C00C

	thumb_func_start ov63_0221C028
ov63_0221C028: ; 0x0221C028
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GX_LoadOBJPltt
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov63_0221C028

	thumb_func_start ov63_0221C044
ov63_0221C044: ; 0x0221C044
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3e
	bl BgConfig_Alloc
	str r0, [r4, #0x10]
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov63_0221C044

	thumb_func_start ov63_0221C05C
ov63_0221C05C: ; 0x0221C05C
	ldr r3, _0221C064 ; =FreeToHeap
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0221C064: .word FreeToHeap
	thumb_func_end ov63_0221C05C

	thumb_func_start ov63_0221C068
ov63_0221C068: ; 0x0221C068
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x3e
	bl sub_0200CF18
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r4, #0
	add r1, #0xa0
	add r2, sp, #0x2c
	ldr r5, _0221C10C ; =ov63_0221FCB8
	str r0, [r1]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	ldr r6, _0221C110 ; =ov63_0221FB30
	stmia r2!, {r0, r1}
	add r5, sp, #0x18
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r3, #0
	str r0, [r5]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _0221C114 ; =ov63_0221FB5C
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0xf
	bl sub_0200CFF4
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0
	bl sub_0200D3F8
	add r4, #0x9c
	ldr r0, [r4]
	bl sub_0200CF6C
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x16
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	nop
_0221C10C: .word ov63_0221FCB8
_0221C110: .word ov63_0221FB30
_0221C114: .word ov63_0221FB5C
	thumb_func_end ov63_0221C068

	thumb_func_start ov63_0221C118
ov63_0221C118: ; 0x0221C118
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D998
	add r4, #0x9c
	ldr r0, [r4]
	bl sub_0200D108
	pop {r4, pc}
	thumb_func_end ov63_0221C118

	thumb_func_start ov63_0221C134
ov63_0221C134: ; 0x0221C134
	push {r3, r4, r5, lr}
	add r4, r0, #0
	lsl r5, r1, #2
	add r4, #0xa4
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _0221C14A
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4, r5]
_0221C14A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov63_0221C134

	thumb_func_start ov63_0221C14C
ov63_0221C14C: ; 0x0221C14C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0221C152:
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	beq _0221C160
	bl sub_0200DC18
_0221C160:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xf
	blo _0221C152
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov63_0221C14C

	thumb_func_start ov63_0221C16C
ov63_0221C16C: ; 0x0221C16C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	lsl r4, r1, #2
	add r5, #0xa4
	ldr r0, [r5, r4]
	mov r1, #0
	add r6, r2, #0
	bl sub_0200DCC0
	ldr r0, [r5, r4]
	add r1, r6, #0
	bl sub_0200DC4C
	pop {r4, r5, r6, pc}
	thumb_func_end ov63_0221C16C

	thumb_func_start ov63_0221C188
ov63_0221C188: ; 0x0221C188
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	add r4, r1, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3e
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, _0221C1B0 ; =0x00013050
	str r4, [r5, r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0221C1B0: .word 0x00013050
	thumb_func_end ov63_0221C188

	thumb_func_start ov63_0221C1B4
ov63_0221C1B4: ; 0x0221C1B4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3e
	str r0, [sp, #8]
	mov r0, #0
	add r4, r1, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, _0221C1E0 ; =0x00013050
	str r4, [r5, r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0221C1E0: .word 0x00013050
	thumb_func_end ov63_0221C1B4

	thumb_func_start ov63_0221C1E4
ov63_0221C1E4: ; 0x0221C1E4
	ldr r3, _0221C1F4 ; =0x00013050
	str r2, [r0, r3]
	mov r2, #0
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r1, [r0, #8]
	mov r0, #1
	bx lr
	.balign 4, 0
_0221C1F4: .word 0x00013050
	thumb_func_end ov63_0221C1E4

	thumb_func_start ov63_0221C1F8
ov63_0221C1F8: ; 0x0221C1F8
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0221C20A
	ldr r0, _0221C210 ; =0x00013050
	ldr r0, [r4, r0]
	pop {r4, pc}
_0221C20A:
	mov r0, #0
	pop {r4, pc}
	nop
_0221C210: .word 0x00013050
	thumb_func_end ov63_0221C1F8

	thumb_func_start ov63_0221C214
ov63_0221C214: ; 0x0221C214
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0221C220
	ldr r1, _0221C224 ; =0x00013050
	ldr r0, [r0, r1]
	bx lr
_0221C220:
	mov r0, #1
	bx lr
	.balign 4, 0
_0221C224: .word 0x00013050
	thumb_func_end ov63_0221C214

	thumb_func_start ov63_0221C228
ov63_0221C228: ; 0x0221C228
	push {r4, lr}
	add r4, r0, #0
	bl ov63_0221CC78
	add r0, r4, #0
	bl ov63_0221CDF8
	add r0, r4, #0
	bl ov63_0221CD68
	ldr r0, _0221C25C ; =0x00013054
	mov r2, #0
	strh r2, [r4, r0]
	add r0, r0, #2
	strh r2, [r4, r0]
	ldr r0, _0221C260 ; =ov63_0221BFCC
	add r1, r4, #0
	bl sub_0200E33C
	str r0, [r4, #4]
	add r0, r4, #0
	mov r1, #3
	bl ov63_0221C188
	pop {r4, pc}
	nop
_0221C25C: .word 0x00013054
_0221C260: .word ov63_0221BFCC
	thumb_func_end ov63_0221C228

	thumb_func_start ov63_0221C264
ov63_0221C264: ; 0x0221C264
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0221C354 ; =0x00013054
	add r4, r0, #0
	ldrh r2, [r4, r1]
	cmp r2, #4
	bhi _0221C34C
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0221C27E: ; jump table
	.short _0221C288 - _0221C27E - 2 ; case 0
	.short _0221C296 - _0221C27E - 2 ; case 1
	.short _0221C2B8 - _0221C27E - 2 ; case 2
	.short _0221C316 - _0221C27E - 2 ; case 3
	.short _0221C342 - _0221C27E - 2 ; case 4
_0221C288:
	bl ov63_0221D344
	ldr r0, _0221C354 ; =0x00013054
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _0221C34C
_0221C296:
	add r2, r2, #1
	strh r2, [r4, r1]
	add r1, r1, #2
	ldrh r2, [r4, r1]
	mov r1, #1
	tst r1, r2
	bne _0221C2AE
	ldr r1, _0221C358 ; =ov63_0221D55C
	mov r2, #3
	bl ov63_0221C1E4
	b _0221C34C
_0221C2AE:
	ldr r1, _0221C35C ; =ov63_0221DB38
	mov r2, #3
	bl ov63_0221C1E4
	b _0221C34C
_0221C2B8:
	ldr r3, [r4, #8]
	cmp r3, #0
	bne _0221C2C4
	add r0, r2, #1
	strh r0, [r4, r1]
	b _0221C34C
_0221C2C4:
	add r2, r1, #0
	add r2, #0xc
	ldr r2, [r4, r2]
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x1f
	cmp r2, #1
	bne _0221C2EC
	mov r2, #0
	str r2, [sp]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #2
	mov r3, #1
	bl ov63_0221E450
	ldr r1, _0221C360 ; =0x00013060
	mov r0, #2
	ldr r2, [r4, r1]
	bic r2, r0
	str r2, [r4, r1]
_0221C2EC:
	ldr r1, _0221C360 ; =0x00013060
	ldr r0, [r4, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221C34C
	mov r0, #2
	str r0, [sp]
	sub r1, #0xa
	ldrh r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0
	mov r3, #1
	bl ov63_0221E450
	ldr r1, _0221C360 ; =0x00013060
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	str r2, [r4, r1]
	b _0221C34C
_0221C316:
	bl ov63_0221D21C
	ldr r1, _0221C364 ; =0x00013056
	ldrh r0, [r4, r1]
	add r0, r0, #1
	strh r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0xe
	ldr r2, [r4, r0]
	ldrh r0, [r4, r1]
	cmp r2, r0
	bne _0221C33A
	sub r0, r1, #2
	ldrh r0, [r4, r0]
	add r2, r0, #1
	sub r0, r1, #2
	strh r2, [r4, r0]
	b _0221C34C
_0221C33A:
	mov r2, #0
	sub r0, r1, #2
	strh r2, [r4, r0]
	b _0221C34C
_0221C342:
	mov r1, #4
	bl ov63_0221C1B4
	add sp, #4
	pop {r3, r4, pc}
_0221C34C:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221C354: .word 0x00013054
_0221C358: .word ov63_0221D55C
_0221C35C: .word ov63_0221DB38
_0221C360: .word 0x00013060
_0221C364: .word 0x00013056
	thumb_func_end ov63_0221C264

	thumb_func_start ov63_0221C368
ov63_0221C368: ; 0x0221C368
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl DestroySysTask
	add r0, r4, #0
	bl ov63_0221CE7C
	add r0, r4, #0
	bl ov63_0221CD40
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov63_0221C368

	thumb_func_start ov63_0221C384
ov63_0221C384: ; 0x0221C384
	push {r4, lr}
	ldr r1, _0221C3C4 ; =0x00013056
	add r4, r0, #0
	mov r2, #0
	strh r2, [r4, r1]
	sub r1, r1, #2
	strh r2, [r4, r1]
	bl ov63_0221E940
	add r0, r4, #0
	bl ov63_0221EA24
	add r0, r4, #0
	bl ov63_0221EAA8
	add r0, r4, #0
	bl ov63_0221EC1C
	add r0, r4, #0
	bl ov63_0221F088
	ldr r0, _0221C3C8 ; =ov63_0221E8FC
	add r1, r4, #0
	mov r2, #4
	bl sub_0200E33C
	str r0, [r4, #4]
	add r0, r4, #0
	mov r1, #6
	bl ov63_0221C188
	pop {r4, pc}
	.balign 4, 0
_0221C3C4: .word 0x00013056
_0221C3C8: .word ov63_0221E8FC
	thumb_func_end ov63_0221C384

	thumb_func_start ov63_0221C3CC
ov63_0221C3CC: ; 0x0221C3CC
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0221C570 ; =0x00013054
	add r5, r0, #0
	ldrh r2, [r5, r1]
	cmp r2, #0
	beq _0221C3E4
	cmp r2, #1
	beq _0221C3F2
	cmp r2, #2
	bne _0221C3E2
	b _0221C562
_0221C3E2:
	b _0221C56A
_0221C3E4:
	add r2, r2, #1
	strh r2, [r5, r1]
	ldr r1, _0221C574 ; =ov63_0221E5A0
	mov r2, #6
	bl ov63_0221C1E4
	b _0221C56A
_0221C3F2:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0221C3FC
	add r0, r2, #1
	strh r0, [r5, r1]
_0221C3FC:
	ldr r0, _0221C578 ; =0x00013060
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	beq _0221C40A
	b _0221C51C
_0221C40A:
	add r0, r5, #0
	bl ov63_0221F238
	add r1, r5, #0
	add r1, #0xf8
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xf8
	mov r2, #5
	ldr r0, [r0]
	ldr r1, _0221C57C ; =0xFFFFF493
	lsl r2, r2, #0xe
	bl ov63_0221F324
	add r0, r5, #0
	add r0, #0xf8
	mov r2, #0xf
	ldr r0, [r0]
	ldr r1, _0221C580 ; =0xFFFFF923
	lsl r2, r2, #0xe
	bl ov63_0221F324
	add r0, r5, #0
	add r0, #0xf8
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, _0221C584 ; =0xFFFFFDB6
	lsl r2, r2, #0xe
	bl ov63_0221F324
	add r0, r5, #0
	add r0, #0xf8
	mov r2, #0x23
	ldr r0, [r0]
	ldr r1, _0221C588 ; =0x0000024A
	lsl r2, r2, #0xe
	bl ov63_0221F324
	add r0, r5, #0
	add r0, #0xf8
	mov r2, #0x1e
	ldr r0, [r0]
	ldr r1, _0221C58C ; =0x000006DD
	lsl r2, r2, #0xe
	bl ov63_0221F324
	add r0, r5, #0
	add r0, #0xf8
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, _0221C590 ; =0x00000B6D
	lsl r2, r2, #0x10
	bl ov63_0221F324
	add r0, r5, #0
	bl ov63_0221F614
	add r1, r5, #0
	add r1, #0xfc
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	bl ov63_0221F7DC
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, _0221C594 ; =0x00013048
	mov r6, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	bls _0221C512
	ldr r7, _0221C594 ; =0x00013048
	add r4, r5, #0
_0221C4CA:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r6, #0
	bl ov63_0221C9E0
	add r0, r4, #0
	add r0, #0xa4
	mov r1, #0xfe
	lsl r1, r1, #0x16
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200E0FC
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blo _0221C4CA
_0221C512:
	ldr r1, _0221C578 ; =0x00013060
	mov r0, #4
	ldr r2, [r5, r1]
	bic r2, r0
	str r2, [r5, r1]
_0221C51C:
	ldr r0, _0221C578 ; =0x00013060
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221C544
	add r0, r5, #0
	bl ov63_0221E8AC
	ldr r0, _0221C598 ; =0x00000919
	bl PlaySE
	ldr r0, _0221C59C ; =0x0000091A
	bl PlaySE
	ldr r1, _0221C578 ; =0x00013060
	mov r0, #8
	ldr r2, [r5, r1]
	bic r2, r0
	str r2, [r5, r1]
_0221C544:
	ldr r0, _0221C578 ; =0x00013060
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221C56A
	add r0, r5, #0
	bl ov63_0221E8D4
	ldr r1, _0221C578 ; =0x00013060
	mov r0, #0x10
	ldr r2, [r5, r1]
	bic r2, r0
	str r2, [r5, r1]
	b _0221C56A
_0221C562:
	mov r0, #0
	strh r0, [r5, r1]
	mov r0, #7
	pop {r3, r4, r5, r6, r7, pc}
_0221C56A:
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221C570: .word 0x00013054
_0221C574: .word ov63_0221E5A0
_0221C578: .word 0x00013060
_0221C57C: .word 0xFFFFF493
_0221C580: .word 0xFFFFF923
_0221C584: .word 0xFFFFFDB6
_0221C588: .word 0x0000024A
_0221C58C: .word 0x000006DD
_0221C590: .word 0x00000B6D
_0221C594: .word 0x00013048
_0221C598: .word 0x00000919
_0221C59C: .word 0x0000091A
	thumb_func_end ov63_0221C3CC

	thumb_func_start ov63_0221C5A0
ov63_0221C5A0: ; 0x0221C5A0
	push {r4, lr}
	ldr r1, _0221C60C ; =0x00013054
	add r4, r0, #0
	ldrh r1, [r4, r1]
	cmp r1, #0
	beq _0221C5B6
	cmp r1, #1
	beq _0221C5DA
	cmp r1, #2
	beq _0221C5EC
	b _0221C606
_0221C5B6:
	ldr r0, [r4, #4]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	bl ov63_0221F7C4
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov63_0221F5B4
	ldr r0, _0221C60C ; =0x00013054
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _0221C606
_0221C5DA:
	bl ov63_0221F600
	cmp r0, #1
	bne _0221C606
	ldr r0, _0221C60C ; =0x00013054
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _0221C606
_0221C5EC:
	bl ov63_0221F1C4
	add r0, r4, #0
	bl ov63_0221EFD8
	add r0, r4, #0
	bl ov63_0221EC04
	add r0, r4, #0
	bl ov63_0221E9FC
	mov r0, #8
	pop {r4, pc}
_0221C606:
	mov r0, #7
	pop {r4, pc}
	nop
_0221C60C: .word 0x00013054
	thumb_func_end ov63_0221C5A0

	thumb_func_start ov63_0221C610
ov63_0221C610: ; 0x0221C610
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	str r0, [sp]
	str r2, [sp, #4]
	add r6, r3, #0
	bne _0221C638
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	bl sub_0200DDB8
	ldr r1, [r4, #8]
	ldr r0, [sp]
	add r2, r1, #0
	bl sub_0200E024
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221C638:
	add r1, r2, #0
	cmp r6, r1
	bne _0221C658
	mov r1, #4
	mov r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	bl sub_0200DDB8
	ldr r1, [r4, #0xc]
	ldr r0, [sp]
	add r2, r1, #0
	bl sub_0200E024
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221C658:
	mov r0, #4
	ldrsh r7, [r4, r0]
	mov r0, #0
	ldrsh r5, [r4, r0]
	sub r0, r5, r7
	bl abs
	ldr r1, [sp, #4]
	lsl r0, r0, #8
	bl _u32_div_f
	mul r0, r6
	lsl r0, r0, #8
	asr r0, r0, #0x10
	cmp r5, r7
	ble _0221C682
	sub r0, r5, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	b _0221C68A
_0221C682:
	add r0, r5, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
_0221C68A:
	mov r0, #6
	ldrsh r7, [r4, r0]
	mov r0, #2
	ldrsh r5, [r4, r0]
	sub r0, r5, r7
	bl abs
	ldr r1, [sp, #4]
	lsl r0, r0, #8
	bl _u32_div_f
	mul r0, r6
	lsl r0, r0, #8
	asr r0, r0, #0x10
	cmp r5, r7
	ble _0221C6AE
	sub r0, r5, r0
	b _0221C6B0
_0221C6AE:
	add r0, r5, r0
_0221C6B0:
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl sub_0200DDB8
	add r0, r6, #0
	bl _ffltu
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #8]
	bl _fsub
	add r6, r0, #0
	ldr r0, [sp, #4]
	bl _ffltu
	add r1, r0, #0
	add r0, r6, #0
	bl _fdiv
	add r1, r0, #0
	add r0, r5, #0
	bl _fmul
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl _fadd
	add r1, r0, #0
	ldr r0, [sp]
	add r2, r1, #0
	bl sub_0200E024
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov63_0221C610

	thumb_func_start ov63_0221C6FC
ov63_0221C6FC: ; 0x0221C6FC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #8
	mov r1, #0x3e
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221C84C ; =0x0000D8D8
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4c
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221C84C ; =0x0000D8D8
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4d
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221C84C ; =0x0000D8D8
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4e
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C84C ; =0x0000D8D8
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C850 ; =0x0000D8D9
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221C850 ; =0x0000D8D9
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4c
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221C850 ; =0x0000D8D9
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4d
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221C850 ; =0x0000D8D9
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4e
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C854 ; =0x0000D8DA
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C858 ; =0x0000D8DB
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x9c
	add r5, #0xa0
	ldr r0, [r0]
	ldr r1, [r5]
	mov r3, #0x4b
	bl sub_0200D5D4
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221C84C: .word 0x0000D8D8
_0221C850: .word 0x0000D8D9
_0221C854: .word 0x0000D8DA
_0221C858: .word 0x0000D8DB
	thumb_func_end ov63_0221C6FC

	thumb_func_start ov63_0221C85C
ov63_0221C85C: ; 0x0221C85C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 ; =0x0000D8D8
	bl sub_0200D968
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8DC ; =0x0000D8D9
	bl sub_0200D968
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8E0 ; =0x0000D8DA
	bl sub_0200D968
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8E4 ; =0x0000D8DB
	bl sub_0200D968
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 ; =0x0000D8D8
	bl sub_0200D958
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 ; =0x0000D8D8
	bl sub_0200D978
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 ; =0x0000D8D8
	bl sub_0200D988
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8DC ; =0x0000D8D9
	bl sub_0200D958
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8DC ; =0x0000D8D9
	bl sub_0200D978
	add r4, #0xa0
	ldr r0, [r4]
	ldr r1, _0221C8DC ; =0x0000D8D9
	bl sub_0200D988
	pop {r4, pc}
	nop
_0221C8D8: .word 0x0000D8D8
_0221C8DC: .word 0x0000D8D9
_0221C8E0: .word 0x0000D8DA
_0221C8E4: .word 0x0000D8DB
	thumb_func_end ov63_0221C85C

	thumb_func_start ov63_0221C8E8
ov63_0221C8E8: ; 0x0221C8E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	add r0, sp, #8
	add r6, r2, #0
	add r7, r3, #0
	bl GetPokemonSpriteCharAndPlttNarcIds
	cmp r6, #2
	bne _0221C904
	add r4, #0x6c
	b _0221C908
_0221C904:
	ldr r0, _0221C950 ; =0x0000196C
	add r4, r4, r0
_0221C908:
	add r5, #0xa4
	lsl r6, r7, #2
	ldr r0, [r5, r6]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	mov r2, #0x32
	add r1, r0, #0
	add r0, r4, #0
	lsl r2, r2, #6
	bl ov63_0221C00C
	ldr r0, [r5, r6]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3e
	str r0, [sp, #4]
	add r1, sp, #8
	ldrh r0, [r1]
	ldrh r1, [r1, #4]
	mov r2, #1
	bl GfGfxLoader_GXLoadPal
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221C950: .word 0x0000196C
	thumb_func_end ov63_0221C8E8

	thumb_func_start ov63_0221C954
ov63_0221C954: ; 0x0221C954
	push {r3, r4, r5, lr}
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, #0xa4
	ldr r0, [r0]
	add r5, r2, #0
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r1, r0, #0
	cmp r5, #0
	beq _0221C97C
	cmp r5, #1
	beq _0221C980
	cmp r5, #2
	beq _0221C984
	b _0221C986
_0221C97C:
	ldr r4, _0221C990 ; =ov63_0221FC58
	b _0221C986
_0221C980:
	ldr r4, _0221C994 ; =ov63_0221FC78
	b _0221C986
_0221C984:
	ldr r4, _0221C998 ; =ov63_0221FC98
_0221C986:
	add r0, r4, #0
	mov r2, #0x20
	bl ov63_0221C028
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221C990: .word ov63_0221FC58
_0221C994: .word ov63_0221FC78
_0221C998: .word ov63_0221FC98
	thumb_func_end ov63_0221C954

	thumb_func_start ov63_0221C99C
ov63_0221C99C: ; 0x0221C99C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	lsl r0, r2, #2
	add r0, r5, r0
	add r0, #0xa4
	ldr r0, [r0]
	add r4, r1, #0
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r6, r0, #0
	bl sub_02026EA4
	mov r1, #1
	bic r6, r1
	mov r1, #1
	lsl r1, r1, #8
	add r3, r5, r1
	ldr r1, _0221C9DC ; =0x0000328C
	add r2, r4, #0
	mul r2, r1
	add r2, r3, r2
	sub r1, #0x20
	add r1, r2, r1
	add r0, r0, r6
	mov r2, #0x20
	bl MI_CpuCopy8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221C9DC: .word 0x0000328C
	thumb_func_end ov63_0221C99C

	thumb_func_start ov63_0221C9E0
ov63_0221C9E0: ; 0x0221C9E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r0, r2, #2
	add r0, r5, r0
	add r0, #0xa4
	ldr r0, [r0]
	add r4, r1, #0
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r1, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r3, r5, r0
	ldr r0, _0221CA18 ; =0x0000328C
	add r2, r4, #0
	mul r2, r0
	add r2, r3, r2
	sub r0, #0x20
	add r0, r2, r0
	mov r2, #0x20
	bl ov63_0221C028
	pop {r3, r4, r5, pc}
	nop
_0221CA18: .word 0x0000328C
	thumb_func_end ov63_0221C9E0

	thumb_func_start ov63_0221CA1C
ov63_0221CA1C: ; 0x0221CA1C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _0221CA8C
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221CB3C ; =0x0000D8DE
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0xc
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 ; =0x0000D8DA
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0xd
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 ; =0x0000D8DA
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0xe
	bl sub_0200D71C
	b _0221CAEE
_0221CA8C:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221CB3C ; =0x0000D8DE
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #9
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 ; =0x0000D8DA
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0xa
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 ; =0x0000D8DA
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0xb
	bl sub_0200D71C
_0221CAEE:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221CB3C ; =0x0000D8DE
	add r1, r4, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0xf
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221CB44 ; =0x0000D8DF
	add r1, r4, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x9c
	add r1, #0xa0
	add r4, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r4]
	mov r3, #0xf
	bl sub_0200D5D4
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221CB3C: .word 0x0000D8DE
_0221CB40: .word 0x0000D8DA
_0221CB44: .word 0x0000D8DF
	thumb_func_end ov63_0221CA1C

	thumb_func_start ov63_0221CB48
ov63_0221CB48: ; 0x0221CB48
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB88 ; =0x0000D8DE
	bl sub_0200D968
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB8C ; =0x0000D8DF
	bl sub_0200D968
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB88 ; =0x0000D8DE
	bl sub_0200D958
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB90 ; =0x0000D8DA
	bl sub_0200D978
	add r4, #0xa0
	ldr r0, [r4]
	ldr r1, _0221CB90 ; =0x0000D8DA
	bl sub_0200D988
	pop {r4, pc}
	nop
_0221CB88: .word 0x0000D8DE
_0221CB8C: .word 0x0000D8DF
_0221CB90: .word 0x0000D8DA
	thumb_func_end ov63_0221CB48

	thumb_func_start ov63_0221CB94
ov63_0221CB94: ; 0x0221CB94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r0, #0xa4
	str r0, [sp, #0x24]
	str r1, [sp, #0xc]
	lsl r0, r2, #2
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0221CBC4
	mov r0, #8
	str r0, [sp, #0x10]
	b _0221CBC8
_0221CBC4:
	mov r0, #4
	str r0, [sp, #0x10]
_0221CBC8:
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	lsl r1, r0, #5
	add r6, r0, #0
	mul r6, r1
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	ldrh r0, [r0, #0xc]
	ldrb r1, [r1, #0x10]
	ldrb r2, [r2, #0x11]
	bl ov63_0221E404
	add r1, r0, #0
	mov r0, #0x51
	mov r2, #0x3e
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [sp, #0x1c]
	bl NNS_G3dGetTex
	ldr r1, [r0, #0x14]
	str r0, [sp, #0x20]
	add r0, r0, r1
	str r0, [sp, #0x18]
	mov r0, #0x3e
	add r1, r6, #0
	bl AllocFromHeap
	add r7, r0, #0
	mov r4, #0
_0221CC04:
	ldr r0, [sp, #0x10]
	add r5, r6, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [sp, #0x18]
	mul r5, r4
	ldr r1, [sp, #0x10]
	add r0, r0, r5
	add r3, r2, #0
	str r7, [sp, #8]
	bl sub_020145B4
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	add r1, r1, r5
	add r2, r6, #0
	bl ov63_0221C00C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #8
	blo _0221CC04
	add r0, r7, #0
	bl FreeToHeap
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	ldr r1, [r0, #0x38]
	add r5, r0, r1
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	bl MonIsShiny
	cmp r0, #1
	bne _0221CC62
	add r5, #0x20
_0221CC62:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x20
	bl ov63_0221C028
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov63_0221CB94

	thumb_func_start ov63_0221CC78
ov63_0221CC78: ; 0x0221CC78
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0221CD2C ; =ov63_0221FB10
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0221CD30 ; =ov63_0221FBAC
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	ldr r0, [r4, #0x10]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3e
	bl BG_ClearCharDataRange
	ldr r5, _0221CD34 ; =ov63_0221FBC8
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _0221CD38 ; =ov63_0221FB74
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _0221CD3C ; =ov63_0221FC1C
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_0221CD2C: .word ov63_0221FB10
_0221CD30: .word ov63_0221FBAC
_0221CD34: .word ov63_0221FBC8
_0221CD38: .word ov63_0221FB74
_0221CD3C: .word ov63_0221FC1C
	thumb_func_end ov63_0221CC78

	thumb_func_start ov63_0221CD40
ov63_0221CD40: ; 0x0221CD40
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov63_0221CD40

	thumb_func_start ov63_0221CD68
ov63_0221CD68: ; 0x0221CD68
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r3, #1
	add r4, r0, #0
	str r3, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	mov r1, #2
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	mov r1, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3e
	mov r2, #0
	add r4, #0x94
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #4
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov63_0221CD68

	thumb_func_start ov63_0221CDF8
ov63_0221CDF8: ; 0x0221CDF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _0221CE74 ; =ov63_0221FD80
	mov r6, #0
	add r5, #0x14
_0221CE06:
	ldr r0, [r7, #0x10]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #7
	blo _0221CE06
	add r0, r7, #0
	add r0, #0x14
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	add r2, r7, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0
	bl ReadMsgDataIntoString
	add r1, r7, #0
	add r1, #0x8c
	mov r0, #0
	ldr r1, [r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	add r2, r7, #0
	lsr r4, r3, #1
	mov r3, #0x80
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221CE78 ; =0x000F0200
	add r2, #0x8c
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r7, #0
	ldr r2, [r2]
	add r0, #0x14
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	add r7, #0x14
	add r0, r7, #0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221CE74: .word ov63_0221FD80
_0221CE78: .word 0x000F0200
	thumb_func_end ov63_0221CDF8

	thumb_func_start ov63_0221CE7C
ov63_0221CE7C: ; 0x0221CE7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x14
_0221CE84:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #7
	blo _0221CE84
	pop {r3, r4, r5, pc}
	thumb_func_end ov63_0221CE7C

	thumb_func_start ov63_0221CE94
ov63_0221CE94: ; 0x0221CE94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #1
	lsl r1, r1, #8
	lsl r6, r2, #4
	add r2, r4, r1
	ldr r1, _0221D204 ; =0x0000328C
	add r5, r4, #0
	mul r1, r0
	ldr r0, [r2, r1]
	add r5, #0x14
	add r7, r2, r1
	str r0, [sp, #0x14]
	bl Mon_GetBoxMon
	str r0, [sp, #0x10]
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #4
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x88
	add r1, #0x90
	add r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r1, #0
	add r2, r4, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 ; =0x000F0200
	add r2, #0x90
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r5, r6
	mov r3, #2
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	bl CopyWindowPixelsToVram_TextMode
	add r0, r5, r6
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r1, [r7, #0x11]
	cmp r1, #2
	beq _0221CF2E
	ldrb r0, [r7, #0x12]
	cmp r0, #0
	bne _0221CF42
_0221CF2E:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #3
	bl ReadMsgDataIntoString
	b _0221CF84
_0221CF42:
	cmp r1, #0
	bne _0221CF5A
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #1
	bl ReadMsgDataIntoString
	b _0221CF84
_0221CF5A:
	cmp r1, #1
	bne _0221CF72
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #2
	bl ReadMsgDataIntoString
	b _0221CF84
_0221CF72:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #3
	bl ReadMsgDataIntoString
_0221CF84:
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x88
	add r1, #0x90
	add r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r1, #0
	add r2, r4, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 ; =0x000F0200
	add r2, #0x90
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, r6
	ldr r2, [r2]
	add r0, #0x10
	mov r3, #2
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #5
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x88
	ldrh r2, [r7, #0xe]
	ldr r0, [r0]
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x88
	add r1, #0x90
	add r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 ; =0x000F0200
	add r2, r4, #0
	str r0, [sp, #8]
	mov r1, #0
	add r0, r5, r6
	str r1, [sp, #0xc]
	add r2, #0x90
	ldr r2, [r2]
	add r0, #0x10
	mov r3, #2
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	add r0, #0x10
	bl CopyWindowPixelsToVram_TextMode
	add r0, r5, r6
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #6
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl BufferBoxMonOTName
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x88
	add r1, #0x90
	add r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 ; =0x000F0200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, r6
	str r1, [sp, #0xc]
	add r2, #0x90
	ldr r2, [r2]
	add r0, #0x20
	mov r3, #2
	bl AddTextPrinterParameterized2
	ldr r2, [r4]
	ldr r1, [sp, #0x14]
	ldr r2, [r2]
	add r0, r4, #0
	bl ov63_0221E310
	cmp r0, #9
	bls _0221D09C
	b _0221D1DA
_0221D09C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221D0A8: ; jump table
	.short _0221D0BC - _0221D0A8 - 2 ; case 0
	.short _0221D0F4 - _0221D0A8 - 2 ; case 1
	.short _0221D12C - _0221D0A8 - 2 ; case 2
	.short _0221D140 - _0221D0A8 - 2 ; case 3
	.short _0221D154 - _0221D0A8 - 2 ; case 4
	.short _0221D168 - _0221D0A8 - 2 ; case 5
	.short _0221D17C - _0221D0A8 - 2 ; case 6
	.short _0221D190 - _0221D0A8 - 2 ; case 7
	.short _0221D1A4 - _0221D0A8 - 2 ; case 8
	.short _0221D1A4 - _0221D0A8 - 2 ; case 9
_0221D0BC:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #7
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r2, [r7, #0x14]
	mov r1, #0
	bl BufferLandmarkName
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x88
	add r1, #0x90
	add r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	b _0221D1DA
_0221D0F4:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #8
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r2, [r7, #0x14]
	mov r1, #0
	bl BufferLandmarkName
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x88
	add r1, #0x90
	add r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	b _0221D1DA
_0221D12C:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #9
	bl ReadMsgDataIntoString
	b _0221D1DA
_0221D140:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0xa
	bl ReadMsgDataIntoString
	b _0221D1DA
_0221D154:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0xb
	bl ReadMsgDataIntoString
	b _0221D1DA
_0221D168:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0xe
	bl ReadMsgDataIntoString
	b _0221D1DA
_0221D17C:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0xc
	bl ReadMsgDataIntoString
	b _0221D1DA
_0221D190:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0xd
	bl ReadMsgDataIntoString
	b _0221D1DA
_0221D1A4:
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0xf
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r2, [r7, #0x14]
	mov r1, #0
	bl BufferLandmarkName
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x88
	add r1, #0x90
	add r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
_0221D1DA:
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 ; =0x000F0200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, r6
	str r1, [sp, #0xc]
	add r4, #0x90
	ldr r2, [r4]
	add r0, #0x20
	mov r3, #2
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	add r0, #0x20
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D204: .word 0x0000328C
_0221D208: .word 0x000F0200
	thumb_func_end ov63_0221CE94

	thumb_func_start ov63_0221D20C
ov63_0221D20C: ; 0x0221D20C
	push {r3, lr}
	bl ov63_0221D240
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r3, pc}
	thumb_func_end ov63_0221D20C

	thumb_func_start ov63_0221D21C
ov63_0221D21C: ; 0x0221D21C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0221D222:
	add r0, r5, #0
	add r1, r4, #0
	bl ov63_0221C134
	add r4, r4, #1
	cmp r4, #0xf
	blo _0221D222
	add r0, r5, #0
	bl ov63_0221CB48
	add r0, r5, #0
	bl ov63_0221C85C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov63_0221D21C

	thumb_func_start ov63_0221D240
ov63_0221D240: ; 0x0221D240
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #1
	add r5, r0, #0
	lsl r2, r2, #8
	add r3, r5, r2
	ldr r2, _0221D2EC ; =0x0000328C
	mul r2, r1
	add r1, r3, r2
	str r1, [sp]
	bl ov63_0221C6FC
	ldr r1, [sp]
	add r0, r5, #0
	bl ov63_0221CA1C
	ldr r4, _0221D2F0 ; =ov63_0221FF68
	mov r7, #0
	add r6, r5, #0
_0221D264:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	bl sub_0200D734
	add r1, r6, #0
	add r1, #0xa4
	add r7, r7, #1
	str r0, [r1]
	add r4, #0x34
	add r6, r6, #4
	cmp r7, #5
	bls _0221D264
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #2
	mov r3, #0
	bl ov63_0221C8E8
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0
	mov r3, #2
	bl ov63_0221C8E8
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #4
	bl ov63_0221CB94
	ldr r0, [sp]
	ldrh r1, [r0, #0xc]
	ldr r0, _0221D2F4 ; =0x0000FF9E
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _0221D2CC
	add r0, r5, #0
	mov r1, #4
	mov r2, #2
	bl ov63_0221C16C
	add r0, r5, #0
	mov r1, #5
	mov r2, #2
	bl ov63_0221C16C
_0221D2CC:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov63_0221C954
	add r0, r5, #0
	mov r1, #3
	mov r2, #0
	bl ov63_0221C954
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl ov63_0221C954
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D2EC: .word 0x0000328C
_0221D2F0: .word ov63_0221FF68
_0221D2F4: .word 0x0000FF9E
	thumb_func_end ov63_0221D240

	thumb_func_start ov63_0221D2F8
ov63_0221D2F8: ; 0x0221D2F8
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _0221D322
	add r0, r4, #0
	add r0, #0xb4
	mov r1, #0x1f
	mvn r1, r1
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DED0
	add r4, #0xb8
	mov r1, #0x1f
	mvn r1, r1
	ldr r0, [r4]
	add r2, r1, #0
	bl sub_0200DED0
	pop {r4, pc}
_0221D322:
	add r0, r4, #0
	add r0, #0xb4
	mov r1, #0xf
	mvn r1, r1
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DED0
	add r4, #0xb8
	mov r1, #0xf
	mvn r1, r1
	ldr r0, [r4]
	add r2, r1, #0
	bl sub_0200DED0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov63_0221D2F8

	thumb_func_start ov63_0221D344
ov63_0221D344: ; 0x0221D344
	push {r3, r4, r5, lr}
	ldr r1, _0221D54C ; =0x00013056
	add r5, r0, #0
	mov r2, #1
	lsl r2, r2, #8
	add r3, r5, r2
	ldrh r1, [r5, r1]
	ldr r2, _0221D550 ; =0x0000328C
	mul r2, r1
	add r4, r3, r2
	bl ov63_0221D20C
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
	mov r1, #0
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r1, #0
	bl ScheduleSetBgPosText
	ldr r0, _0221D54C ; =0x00013056
	mov r1, #1
	ldrh r0, [r5, r0]
	tst r0, r1
	ldr r0, [r5, #0x10]
	bne _0221D44E
	mov r2, #0
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5, #0x10]
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5, #0x10]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #3
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	mov r3, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	add r0, #0xa4
	mov r1, #1
	mov r2, #0x27
	ldr r0, [r0]
	lsl r1, r1, #8
	mvn r2, r2
	bl sub_0200DDB8
	add r0, r5, #0
	add r0, #0xa8
	mov r1, #0x4a
	mov r2, #0x4f
	ldr r0, [r0]
	lsl r1, r1, #2
	mvn r2, r2
	bl sub_0200DDB8
	ldrb r2, [r4, #0x13]
	add r0, r5, #0
	add r0, #0xac
	add r2, #0x98
	mov r1, #0x12
	lsl r2, r2, #0x10
	ldr r0, [r0]
	lsl r1, r1, #4
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldrb r2, [r4, #0x13]
	add r0, r5, #0
	add r0, #0xb0
	add r2, #0x98
	mov r1, #0x4a
	lsl r2, r2, #0x10
	ldr r0, [r0]
	lsl r1, r1, #2
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r5, #0
	mov r1, #0x51
	add r0, #0xb4
	mvn r1, r1
	add r2, r1, #0
	ldr r0, [r0]
	add r2, #0x50
	bl sub_0200DDB8
	add r0, r5, #0
	mov r1, #0x58
	add r0, #0xb8
	mvn r1, r1
	add r2, r1, #0
	ldr r0, [r0]
	add r2, #0x56
	bl sub_0200DDB8
	ldr r1, _0221D54C ; =0x00013056
	add r0, r5, #0
	ldrh r1, [r5, r1]
	mov r2, #1
	bl ov63_0221CE94
	b _0221D512
_0221D44E:
	mov r2, #0
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #1
	add r3, #0xfd
	bl ScheduleSetBgPosText
	mov r2, #0
	add r3, r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #2
	sub r3, #0xb8
	bl ScheduleSetBgPosText
	ldr r0, [r5, #0x10]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r5, #0x10]
	mov r2, #0
	add r3, #0xfd
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r5, #0x10]
	add r2, r1, #0
	mov r3, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	add r0, #0xa4
	mov r1, #0
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0x28
	bl sub_0200DDB8
	add r0, r5, #0
	mov r1, #0x27
	add r0, #0xa8
	mvn r1, r1
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0x28
	bl sub_0200DDB8
	ldrb r2, [r4, #0x13]
	add r0, r5, #0
	add r0, #0xac
	add r2, #0x98
	mov r1, #0x4f
	lsl r2, r2, #0x10
	ldr r0, [r0]
	mvn r1, r1
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldrb r2, [r4, #0x13]
	add r0, r5, #0
	add r0, #0xb0
	add r2, #0x98
	mov r1, #0x5b
	lsl r2, r2, #0x10
	ldr r0, [r0]
	mvn r1, r1
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r5, #0
	add r0, #0xb4
	mov r2, #1
	ldr r0, [r0]
	ldr r1, _0221D554 ; =0x00000152
	mvn r2, r2
	bl sub_0200DDB8
	add r0, r5, #0
	add r0, #0xb8
	mov r2, #2
	ldr r0, [r0]
	ldr r1, _0221D558 ; =0x00000159
	mvn r2, r2
	bl sub_0200DDB8
	ldr r1, _0221D54C ; =0x00013056
	add r0, r5, #0
	ldrh r1, [r5, r1]
	mov r2, #4
	bl ov63_0221CE94
_0221D512:
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DF98
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DF98
	add r0, r5, #0
	add r0, #0xa8
	mov r1, #0xff
	lsl r1, r1, #0x16
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	add r0, r5, #0
	add r1, r4, #0
	bl ov63_0221D2F8
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D54C: .word 0x00013056
_0221D550: .word 0x0000328C
_0221D554: .word 0x00000152
_0221D558: .word 0x00000159
	thumb_func_end ov63_0221D344

	thumb_func_start ov63_0221D55C
ov63_0221D55C: ; 0x0221D55C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0xe]
	cmp r1, #0x10
	bls _0221D568
	b _0221DB1A
_0221D568:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221D574: ; jump table
	.short _0221D596 - _0221D574 - 2 ; case 0
	.short _0221D632 - _0221D574 - 2 ; case 1
	.short _0221D644 - _0221D574 - 2 ; case 2
	.short _0221D65C - _0221D574 - 2 ; case 3
	.short _0221D6C4 - _0221D574 - 2 ; case 4
	.short _0221D70E - _0221D574 - 2 ; case 5
	.short _0221D726 - _0221D574 - 2 ; case 6
	.short _0221D734 - _0221D574 - 2 ; case 7
	.short _0221D780 - _0221D574 - 2 ; case 8
	.short _0221D812 - _0221D574 - 2 ; case 9
	.short _0221D848 - _0221D574 - 2 ; case 10
	.short _0221D860 - _0221D574 - 2 ; case 11
	.short _0221D87C - _0221D574 - 2 ; case 12
	.short _0221D894 - _0221D574 - 2 ; case 13
	.short _0221D8B8 - _0221D574 - 2 ; case 14
	.short _0221D940 - _0221D574 - 2 ; case 15
	.short _0221DB0C - _0221D574 - 2 ; case 16
_0221D596:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	bne _0221D5F2
	ldr r0, _0221D8A4 ; =0x00013056
	mov r2, #0
	ldrh r1, [r4, r0]
	ldr r0, _0221D8A8 ; =0x0000328C
	add r3, r2, #0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0221D8AC ; =0x00000113
	sub r3, #0x48
	ldrb r5, [r1, r0]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #0
	mov r3, #0x48
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r5, #0x98
	add r0, #0xac
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #0x30
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #0x2e
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D5F2:
	ldr r0, [r4, #0x10]
	mov r1, #1
	mov r2, #2
	mov r3, #7
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #1
	mov r3, #7
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	mov r1, #0x17
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb0
	mov r1, #0x18
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DED0
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D632:
	ldr r1, _0221D8B0 ; =0x00013060
	mov r0, #2
	ldr r2, [r4, r1]
	orr r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D644:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x32
	bne _0221D656
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D656:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D65C:
	ldrh r0, [r4, #0xc]
	cmp r0, #6
	bne _0221D6A0
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #0x20
	mov r2, #0x28
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #0x1f
	mov r2, #0x27
	bl sub_0200DDB8
	mov r1, #1
	lsl r1, r1, #8
	add r3, r4, r1
	ldr r1, _0221D8A4 ; =0x00013056
	add r0, r4, #0
	ldrh r2, [r4, r1]
	ldr r1, _0221D8A8 ; =0x0000328C
	mul r1, r2
	add r1, r3, r1
	bl ov63_0221D2F8
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D6A0:
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #0x13
	mov r2, #7
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #0x14
	mov r2, #7
	bl sub_0200DED0
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D6C4:
	ldr r1, _0221D8A4 ; =0x00013056
	ldrh r2, [r4, r1]
	ldr r1, _0221D8A8 ; =0x0000328C
	mul r1, r2
	add r2, r4, r1
	mov r1, #0x43
	lsl r1, r1, #2
	ldrh r2, [r2, r1]
	ldr r1, _0221D8B4 ; =0x0000FF9E
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _0221D6F4
	mov r1, #4
	mov r2, #3
	bl ov63_0221C16C
	add r0, r4, #0
	mov r1, #5
	mov r2, #3
	bl ov63_0221C16C
	b _0221D706
_0221D6F4:
	mov r1, #4
	mov r2, #1
	bl ov63_0221C16C
	add r0, r4, #0
	mov r1, #5
	mov r2, #1
	bl ov63_0221C16C
_0221D706:
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D70E:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221D720
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D720:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D726:
	add r0, #0x14
	bl ScheduleWindowCopyToVram
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D734:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221D77A
	mov r2, #0
	add r3, r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #2
	sub r3, #0x10
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #2
	add r3, #0xfd
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DD54
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D77A:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D780:
	ldrh r0, [r4, #0xc]
	cmp r0, #8
	ldr r0, [r4, #0x10]
	bne _0221D7D4
	mov r1, #2
	mov r2, #0
	mov r3, #0x70
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #3
	mov r3, #0xc0
	bl ScheduleSetBgPosText
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	add r3, #0xfd
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xa4
	mov r1, #0x58
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x68
	mov r2, #0x48
	bl sub_0200DDB8
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D7D4:
	mov r1, #2
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #5
	mov r3, #8
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xa4
	mov r1, #0x14
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #0x10
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xa8
	mov r1, #0x17
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #0x13
	bl sub_0200DED0
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D812:
	add r0, #0x24
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl ov63_0221C954
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov63_0221C954
	add r0, r4, #0
	mov r1, #3
	mov r2, #2
	bl ov63_0221C954
	add r0, r4, #0
	mov r1, #5
	mov r2, #2
	bl ov63_0221C954
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D848:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x28
	bne _0221D85A
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D85A:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D860:
	add r0, #0x34
	bl ScheduleWindowCopyToVram
	ldr r1, _0221D8B0 ; =0x00013060
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D87C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221D88E
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D88E:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D894:
	add r0, #0x44
	bl ScheduleWindowCopyToVram
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
	nop
_0221D8A4: .word 0x00013056
_0221D8A8: .word 0x0000328C
_0221D8AC: .word 0x00000113
_0221D8B0: .word 0x00013060
_0221D8B4: .word 0x0000FF9E
_0221D8B8:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xf0
	bne _0221D93A
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #0
	mov r3, #0x48
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	mov r1, #0xfe
	ldr r0, _0221DB20 ; =0x00013058
	lsl r1, r1, #0x16
	str r1, [r4, r0]
	mov r1, #0xff
	lsl r1, r1, #0x16
	add r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D93A:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D940:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	bne _0221DA14
	mov r1, #0
	add r3, r1, #0
	add r2, r1, #0
	sub r3, #0x50
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	sub r3, #0xcb
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #3
	mov r2, #0
	mov r3, #0x3c
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	mov r3, #0xe2
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0x94
	mov r2, #0xfc
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #0x40
	mov r2, #0xc0
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb4
	mov r1, #0x1b
	mvn r1, r1
	ldr r0, [r0]
	sub r2, r1, #2
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb8
	mov r1, #0x1c
	mvn r1, r1
	ldr r0, [r0]
	sub r2, r1, #2
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0x30
	mov r2, #0x80
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x40
	mov r2, #0x70
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa4
	ldr r1, _0221DB24 ; =0x3FE66666
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	add r0, r4, #0
	add r0, #0xa8
	mov r1, #1
	lsl r1, r1, #0x1e
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221DA14:
	mov r1, #0
	mov r2, #2
	mov r3, #8
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #0
	mov r2, #4
	mov r3, #0x14
	bl ScheduleSetBgPosText
	mov r1, #1
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	mov r3, #7
	bl ScheduleSetBgPosText
	mov r1, #2
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	mov r3, #7
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #3
	mov r2, #1
	mov r3, #6
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r4, #0x10]
	mov r2, #5
	add r3, r1, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	mov r1, #0xa
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb0
	mov r1, #0xa
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb4
	mov r1, #5
	mvn r1, r1
	ldr r0, [r0]
	sub r2, r1, #1
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb8
	mov r1, #5
	mvn r1, r1
	ldr r0, [r0]
	sub r2, r1, #1
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xa4
	mov r1, #3
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #4
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xa8
	mov r1, #3
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #4
	bl sub_0200DED0
	ldr r5, _0221DB20 ; =0x00013058
	ldr r0, [r4, r5]
	bl _f2d
	ldr r2, _0221DB28 ; =0x47AE147B
	ldr r3, _0221DB2C ; =0x3FB47AE1
	bl _dadd
	bl _d2f
	str r0, [r4, r5]
	add r0, r5, #4
	ldr r0, [r4, r0]
	bl _f2d
	ldr r2, _0221DB30 ; =0x9999999A
	ldr r3, _0221DB34 ; =0x3FA99999
	bl _dadd
	bl _d2f
	add r1, r5, #4
	str r0, [r4, r1]
	add r0, r4, #0
	sub r1, r1, #4
	add r0, #0xa4
	ldr r1, [r4, r1]
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	add r0, r4, #0
	add r1, r5, #4
	add r0, #0xa8
	ldr r1, [r4, r1]
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221DB0C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221DB16
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221DB16:
	add r0, r0, #1
	strh r0, [r4, #0xc]
_0221DB1A:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221DB20: .word 0x00013058
_0221DB24: .word 0x3FE66666
_0221DB28: .word 0x47AE147B
_0221DB2C: .word 0x3FB47AE1
_0221DB30: .word 0x9999999A
_0221DB34: .word 0x3FA99999
	thumb_func_end ov63_0221D55C

	thumb_func_start ov63_0221DB38
ov63_0221DB38: ; 0x0221DB38
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0xe]
	cmp r1, #0x10
	bls _0221DB44
	b _0221E0F6
_0221DB44:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221DB50: ; jump table
	.short _0221DB72 - _0221DB50 - 2 ; case 0
	.short _0221DC0A - _0221DB50 - 2 ; case 1
	.short _0221DC1C - _0221DB50 - 2 ; case 2
	.short _0221DC34 - _0221DB50 - 2 ; case 3
	.short _0221DCA0 - _0221DB50 - 2 ; case 4
	.short _0221DCEA - _0221DB50 - 2 ; case 5
	.short _0221DD02 - _0221DB50 - 2 ; case 6
	.short _0221DD10 - _0221DB50 - 2 ; case 7
	.short _0221DD5C - _0221DB50 - 2 ; case 8
	.short _0221DDEA - _0221DB50 - 2 ; case 9
	.short _0221DE20 - _0221DB50 - 2 ; case 10
	.short _0221DE38 - _0221DB50 - 2 ; case 11
	.short _0221DE54 - _0221DB50 - 2 ; case 12
	.short _0221DE6C - _0221DB50 - 2 ; case 13
	.short _0221DE90 - _0221DB50 - 2 ; case 14
	.short _0221DF1A - _0221DB50 - 2 ; case 15
	.short _0221E0E8 - _0221DB50 - 2 ; case 16
_0221DB72:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	bne _0221DBCE
	ldr r0, _0221DE7C ; =0x00013056
	mov r2, #0
	ldrh r1, [r4, r0]
	ldr r0, _0221DE80 ; =0x0000328C
	mov r3, #0x48
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0221DE84 ; =0x00000113
	ldrb r5, [r1, r0]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl ScheduleSetBgPosText
	mov r3, #0xff
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #0
	mvn r3, r3
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r5, #0x98
	add r0, #0xac
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #0xa0
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #0x9e
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DBCE:
	mov r1, #1
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	mov r3, #7
	bl ScheduleSetBgPosText
	mov r1, #2
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	mov r3, #7
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0x18
	mov r2, #0
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #0x19
	mov r2, #0
	bl sub_0200DED0
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DC0A:
	ldr r1, _0221DE88 ; =0x00013060
	mov r0, #2
	ldr r2, [r4, r1]
	orr r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DC1C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x32
	bne _0221DC2E
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DC2E:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DC34:
	ldrh r0, [r4, #0xc]
	cmp r0, #6
	bne _0221DC78
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #0xe0
	mov r2, #0x28
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #0xe1
	mov r2, #0x27
	bl sub_0200DDB8
	mov r1, #1
	lsl r1, r1, #8
	add r3, r4, r1
	ldr r1, _0221DE7C ; =0x00013056
	add r0, r4, #0
	ldrh r2, [r4, r1]
	ldr r1, _0221DE80 ; =0x0000328C
	mul r1, r2
	add r1, r3, r1
	bl ov63_0221D2F8
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DC78:
	add r0, r4, #0
	add r0, #0xb4
	mov r1, #0x12
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #7
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb8
	mov r1, #0x13
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #7
	bl sub_0200DED0
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DCA0:
	ldr r1, _0221DE7C ; =0x00013056
	ldrh r2, [r4, r1]
	ldr r1, _0221DE80 ; =0x0000328C
	mul r1, r2
	add r2, r4, r1
	mov r1, #0x43
	lsl r1, r1, #2
	ldrh r2, [r2, r1]
	ldr r1, _0221DE8C ; =0x0000FF9E
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _0221DCD0
	mov r1, #4
	mov r2, #3
	bl ov63_0221C16C
	add r0, r4, #0
	mov r1, #5
	mov r2, #3
	bl ov63_0221C16C
	b _0221DCE2
_0221DCD0:
	mov r1, #4
	mov r2, #1
	bl ov63_0221C16C
	add r0, r4, #0
	mov r1, #5
	mov r2, #1
	bl ov63_0221C16C
_0221DCE2:
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DCEA:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221DCFC
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DCFC:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DD02:
	add r0, #0x14
	bl ScheduleWindowCopyToVram
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DD10:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221DD56
	mov r3, #0x11
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #0
	lsl r3, r3, #4
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #2
	add r3, #0xfd
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DD54
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DD56:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DD5C:
	ldrh r0, [r4, #0xc]
	cmp r0, #8
	ldr r0, [r4, #0x10]
	bne _0221DDB0
	mov r1, #2
	mov r2, #0
	mov r3, #0x90
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #3
	mov r3, #0xc0
	bl ScheduleSetBgPosText
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	add r3, #0xfd
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0xa8
	mov r2, #0x58
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x98
	mov r2, #0x48
	bl sub_0200DDB8
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DDB0:
	mov r1, #2
	add r2, r1, #0
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #5
	mov r3, #8
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0x15
	mov r2, #0x10
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x18
	mov r2, #0x13
	bl sub_0200DED0
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DDEA:
	add r0, #0x54
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl ov63_0221C954
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov63_0221C954
	add r0, r4, #0
	mov r1, #3
	mov r2, #2
	bl ov63_0221C954
	add r0, r4, #0
	mov r1, #5
	mov r2, #2
	bl ov63_0221C954
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE20:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x28
	bne _0221DE32
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE32:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DE38:
	add r0, #0x64
	bl ScheduleWindowCopyToVram
	ldr r1, _0221DE88 ; =0x00013060
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE54:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221DE66
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE66:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DE6C:
	add r0, #0x74
	bl ScheduleWindowCopyToVram
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
	nop
_0221DE7C: .word 0x00013056
_0221DE80: .word 0x0000328C
_0221DE84: .word 0x00000113
_0221DE88: .word 0x00013060
_0221DE8C: .word 0x0000FF9E
_0221DE90:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xf0
	bne _0221DF14
	mov r3, #0xff
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #0
	mvn r3, r3
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #3
	bl sub_0200DD54
	mov r1, #0xfe
	ldr r0, _0221E0FC ; =0x00013058
	lsl r1, r1, #0x16
	str r1, [r4, r0]
	mov r1, #0xff
	lsl r1, r1, #0x16
	add r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DF14:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DF1A:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	bne _0221DFF0
	mov r1, #0
	add r2, r1, #0
	mov r3, #0x50
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	sub r3, #0xcb
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	add r3, r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #2
	sub r3, #0xb8
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #3
	mov r2, #0
	mov r3, #0xc4
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	mov r3, #0xe2
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	mov r1, #0x41
	ldr r0, [r0]
	lsl r1, r1, #2
	mov r2, #0xfc
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb0
	mov r1, #0xc0
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb4
	mov r1, #0xa4
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0xc2
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xb8
	mov r1, #0xa5
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0xc4
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0xd0
	mov r2, #0x80
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0xc0
	mov r2, #0x70
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xa4
	ldr r1, _0221E100 ; =0x3FE66666
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	add r0, r4, #0
	add r0, #0xa8
	mov r1, #1
	lsl r1, r1, #0x1e
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DFF0:
	mov r1, #0
	mov r2, #1
	mov r3, #8
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #0
	mov r2, #4
	mov r3, #0x14
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #1
	mov r2, #2
	mov r3, #7
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #2
	mov r2, #1
	mov r3, #7
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #3
	mov r2, #2
	mov r3, #6
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r4, #0x10]
	mov r2, #5
	add r3, r1, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0xac
	mov r1, #9
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #0xa
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb0
	mov r1, #9
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #0xa
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb4
	mov r1, #6
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0xd
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xb8
	mov r1, #6
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0xd
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xa4
	mov r1, #4
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DED0
	add r0, r4, #0
	add r0, #0xa8
	mov r1, #4
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DED0
	ldr r5, _0221E0FC ; =0x00013058
	ldr r0, [r4, r5]
	bl _f2d
	ldr r2, _0221E104 ; =0x47AE147B
	ldr r3, _0221E108 ; =0x3FB47AE1
	bl _dadd
	bl _d2f
	str r0, [r4, r5]
	add r0, r5, #4
	ldr r0, [r4, r0]
	bl _f2d
	ldr r2, _0221E10C ; =0x9999999A
	ldr r3, _0221E110 ; =0x3FA99999
	bl _dadd
	bl _d2f
	add r1, r5, #4
	str r0, [r4, r1]
	add r0, r4, #0
	sub r1, r1, #4
	add r0, #0xa4
	ldr r1, [r4, r1]
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	add r0, r4, #0
	add r1, r5, #4
	add r0, #0xa8
	ldr r1, [r4, r1]
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221E0E8:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221E0F2
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221E0F2:
	add r0, r0, #1
	strh r0, [r4, #0xc]
_0221E0F6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221E0FC: .word 0x00013058
_0221E100: .word 0x3FE66666
_0221E104: .word 0x47AE147B
_0221E108: .word 0x3FB47AE1
_0221E10C: .word 0x9999999A
_0221E110: .word 0x3FA99999
	thumb_func_end ov63_0221DB38

	thumb_func_start ov63_0221E114
ov63_0221E114: ; 0x0221E114
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	ldr r3, _0221E2F8 ; =ov63_0221FC38
	add r2, sp, #0x20
	add r6, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xb4
	mov r1, #0x3e
	bl NARC_ctor
	str r0, [sp, #0x18]
	ldr r0, [r6]
	mov r7, #0
	ldr r0, [r0, #4]
	bl GetPartyCount
	cmp r0, #0
	bhi _0221E148
	b _0221E2EC
_0221E148:
	mov r0, #1
	lsl r0, r0, #8
	add r0, r6, r0
	str r0, [sp, #0x1c]
_0221E150:
	ldr r0, [r6]
	add r1, r7, #0
	ldr r0, [r0, #4]
	bl GetPartyMonByIndex
	add r4, r0, #0
	bl AcquireMonLock
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0221E172
	b _0221E2D4
_0221E172:
	ldr r0, _0221E2FC ; =0x00013048
	mov r2, #0
	ldr r1, [r6, r0]
	ldr r0, _0221E300 ; =0x0000328C
	mul r0, r1
	ldr r1, [sp, #0x1c]
	add r5, r1, r0
	str r4, [r1, r0]
	add r0, r4, #0
	mov r1, #5
	bl GetMonData
	mov r1, #0
	strh r0, [r5, #0xc]
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [r5, #8]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #0x10]
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #0x11]
	ldr r0, [r5, #8]
	mov r2, #0
	str r0, [sp]
	ldrh r0, [r5, #0xc]
	ldrb r1, [r5, #0x11]
	ldrb r3, [r5, #0x10]
	bl sub_020708D8
	add r0, #8
	strb r0, [r5, #0x13]
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	str r0, [r5, #0x14]
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0xe]
	str r7, [r5, #0x18]
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1d
	beq _0221E1E8
	cmp r0, #0x20
	bne _0221E1EE
_0221E1E8:
	mov r0, #0
	strb r0, [r5, #0x12]
	b _0221E1F2
_0221E1EE:
	mov r0, #1
	strb r0, [r5, #0x12]
_0221E1F2:
	ldrh r0, [r5, #0xc]
	bl SpeciesToOverworldModelIndexOffset
	add r2, r0, #0
	add r0, r5, #4
	mov r1, #0x8d
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0x40
	add r1, r4, #0
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	add r0, r5, #0
	add r0, #0x6c
	str r0, [sp]
	ldr r0, [r5, #8]
	add r1, sp, #0x20
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	mov r2, #0x3e
	add r3, sp, #0x20
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl sub_02014510
	ldr r0, _0221E304 ; =0x00000CEC
	add r1, sp, #0x20
	add r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #0x3e
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	add r3, sp, #0x30
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl sub_02014510
	add r0, sp, #0x40
	add r1, r4, #0
	mov r2, #0
	bl GetPokemonSpriteCharAndPlttNarcIds
	ldr r0, _0221E308 ; =0x0000196C
	add r1, sp, #0x20
	add r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #0x3e
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	add r3, sp, #0x20
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl sub_02014510
	ldr r0, _0221E30C ; =0x000025EC
	add r1, sp, #0x20
	add r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #0x3e
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	add r3, sp, #0x30
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl sub_02014510
	add r1, r5, #0
	ldrh r2, [r5, #0xc]
	ldr r0, [sp, #0x18]
	add r1, #0x1c
	mov r3, #1
	bl sub_02072914
	ldrh r2, [r5, #0xc]
	add r1, r5, #0
	ldr r0, [sp, #0x18]
	add r1, #0x44
	mov r3, #0
	bl sub_02072914
	ldr r0, _0221E2FC ; =0x00013048
	ldr r0, [r6, r0]
	add r1, r0, #1
	ldr r0, _0221E2FC ; =0x00013048
	str r1, [r6, r0]
_0221E2D4:
	ldr r1, [sp, #0x14]
	add r0, r4, #0
	bl ReleaseMonLock
	ldr r0, [r6]
	add r7, r7, #1
	ldr r0, [r0, #4]
	bl GetPartyCount
	cmp r7, r0
	bhs _0221E2EC
	b _0221E150
_0221E2EC:
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E2F8: .word ov63_0221FC38
_0221E2FC: .word 0x00013048
_0221E300: .word 0x0000328C
_0221E304: .word 0x00000CEC
_0221E308: .word 0x0000196C
_0221E30C: .word 0x000025EC
	thumb_func_end ov63_0221E114

	thumb_func_start ov63_0221E310
ov63_0221E310: ; 0x0221E310
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl AcquireMonLock
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	sub r1, r0, #1
	cmp r1, #2
	bhi _0221E334
	mov r5, #4
	b _0221E3F6
_0221E334:
	sub r1, r0, #4
	cmp r1, #1
	bhi _0221E33E
	mov r5, #3
	b _0221E3F6
_0221E33E:
	cmp r0, #0xf
	bne _0221E346
	mov r5, #6
	b _0221E3F6
_0221E346:
	sub r0, #0xa
	cmp r0, #2
	bhi _0221E350
	mov r5, #5
	b _0221E3F6
_0221E350:
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0221E362
	mov r5, #7
	b _0221E3F6
_0221E362:
	add r0, r4, #0
	mov r1, #6
	bl MonIsInGameTradePoke
	cmp r0, #1
	bne _0221E372
	mov r5, #8
	b _0221E3F6
_0221E372:
	add r0, r4, #0
	mov r1, #7
	bl MonIsInGameTradePoke
	cmp r0, #1
	bne _0221E382
	mov r5, #9
	b _0221E3F6
_0221E382:
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	beq _0221E39C
	mov r5, #2
	b _0221E3F6
_0221E39C:
	add r1, r5, #0
	add r1, #0x8c
	ldr r1, [r1]
	add r0, r6, #0
	bl PlayerName_FlatToString
	add r2, r5, #0
	add r2, #0x90
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #0x91
	bl GetMonData
	add r0, r5, #0
	add r0, #0x8c
	add r5, #0x90
	ldr r0, [r0]
	ldr r1, [r5]
	bl StringCompare
	cmp r0, #0
	beq _0221E3CC
	mov r5, #2
	b _0221E3F6
_0221E3CC:
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	mov r1, #0x7d
	lsl r1, r1, #4
	cmp r0, r1
	blo _0221E3E2
	mov r5, #7
	b _0221E3F6
_0221E3E2:
	add r0, r4, #0
	mov r1, #0x93
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0221E3F4
	mov r5, #0
	b _0221E3F6
_0221E3F4:
	mov r5, #1
_0221E3F6:
	ldr r1, [sp]
	add r0, r4, #0
	bl ReleaseMonLock
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov63_0221E310

	thumb_func_start ov63_0221E404
ov63_0221E404: ; 0x0221E404
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	cmp r5, #0
	ble _0221E416
	ldr r1, _0221E448 ; =0x000001ED
	cmp r5, r1
	ble _0221E41A
_0221E416:
	mov r4, #1
	b _0221E442
_0221E41A:
	bl SpeciesToOverworldModelIndexOffset
	ldr r1, _0221E44C ; =0x00000129
	add r4, r0, r1
	add r0, r5, #0
	bl OverworldModelLookupHasFemaleForme
	cmp r0, #0
	beq _0221E434
	cmp r7, #1
	bne _0221E442
	add r4, r4, #1
	b _0221E442
_0221E434:
	add r0, r5, #0
	bl OverworldModelLookupFormeCount
	cmp r6, r0
	ble _0221E440
	mov r6, #0
_0221E440:
	add r4, r4, r6
_0221E442:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E448: .word 0x000001ED
_0221E44C: .word 0x00000129
	thumb_func_end ov63_0221E404

	thumb_func_start ov63_0221E450
ov63_0221E450: ; 0x0221E450
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x3e
	mov r1, #0x2c
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r1, r5, r0
	ldr r0, _0221E4D4 ; =0x0000328C
	mul r0, r6
	add r0, r1, r0
	str r0, [r4]
	ldr r0, [sp]
	str r0, [r4, #0x28]
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	str r0, [r4, #0x18]
	lsl r0, r7, #2
	add r0, r5, r0
	add r0, #0xa4
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x18]
	cmp r0, #2
	bne _0221E4B0
	ldr r0, [r4]
	add r0, #0x6c
	str r0, [r4, #0x1c]
	mov r0, #1
	strh r0, [r4, #0x24]
	ldr r1, [r4]
	add r0, r4, #4
	add r1, #0x1c
	bl sub_02009264
	b _0221E4C6
_0221E4B0:
	ldr r1, [r4]
	ldr r0, _0221E4D8 ; =0x0000196C
	add r0, r1, r0
	str r0, [r4, #0x1c]
	mov r0, #0
	strh r0, [r4, #0x24]
	ldr r1, [r4]
	add r0, r4, #4
	add r1, #0x44
	bl sub_02009264
_0221E4C6:
	ldr r0, _0221E4DC ; =ov63_0221E4E0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E4D4: .word 0x0000328C
_0221E4D8: .word 0x0000196C
_0221E4DC: .word ov63_0221E4E0
	thumb_func_end ov63_0221E450

	thumb_func_start ov63_0221E4E0
ov63_0221E4E0: ; 0x0221E4E0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x28]
	cmp r0, #1
	bne _0221E528
	ldr r2, [r4]
	ldrh r3, [r4, #0x24]
	ldrh r2, [r2, #0xc]
	ldr r0, [r4, #0x18]
	add r1, sp, #4
	bl sub_020729A4
	ldr r2, [r4]
	ldr r1, _0221E558 ; =0x000001B9
	ldrh r0, [r2, #0xc]
	cmp r0, r1
	bne _0221E51A
	add r0, sp, #4
	ldrb r0, [r0]
	mov r2, #0x64
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	add r3, r0, #0
	bl sub_02006EA0
	b _0221E524
_0221E51A:
	add r1, sp, #4
	ldrb r1, [r1]
	ldrb r2, [r2, #0x10]
	bl sub_020062E0
_0221E524:
	mov r0, #0
	str r0, [r4, #0x28]
_0221E528:
	add r0, r4, #4
	bl sub_02009284
	cmp r0, #0
	blt _0221E548
	mov r2, #0x32
	ldr r3, [r4, #0x1c]
	lsl r2, r2, #6
	add r1, r0, #0
	mul r1, r2
	add r0, r3, r1
	ldr r1, [r4, #0x20]
	bl ov63_0221C00C
	add sp, #8
	pop {r3, r4, r5, pc}
_0221E548:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221E558: .word 0x000001B9
	thumb_func_end ov63_0221E4E0

	thumb_func_start ov63_0221E55C
ov63_0221E55C: ; 0x0221E55C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r2, #0
	cmp r1, r4
	bne _0221E578
	mov r1, #0
	ldr r0, _0221E59C ; =0x04000050
	mov r2, #0x1c
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
_0221E578:
	mov r0, #1
	lsl r0, r0, #0x14
	bl _u32_div_f
	add r1, r0, #0
	mul r1, r4
	lsr r3, r1, #0x10
	mov r0, #0x10
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _0221E59C ; =0x04000050
	mov r1, #4
	mov r2, #0x1c
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E59C: .word 0x04000050
	thumb_func_end ov63_0221E55C

	thumb_func_start ov63_0221E5A0
ov63_0221E5A0: ; 0x0221E5A0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0221E878 ; =0x00013060
	ldr r0, [r4, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221E5BC
	mov r1, #2
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
_0221E5BC:
	ldr r1, _0221E878 ; =0x00013060
	ldr r0, [r4, r1]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221E638
	add r0, r1, #0
	add r0, #0xa
	ldrh r2, [r4, r0]
	add r0, r1, #0
	add r0, #8
	ldrh r0, [r4, r0]
	cmp r2, r0
	bne _0221E62C
	bl LCRandom
	mov r1, #0xe0
	bl _s32_div_f
	add r1, #0x10
	lsl r0, r1, #0x10
	asr r5, r0, #0x10
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1a
	sub r1, r1, r2
	mov r0, #0x1a
	ror r1, r0
	add r0, r2, r1
	add r0, #0x10
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r1, r5, #0
	bl sub_0200DDB8
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl ov63_0221C16C
	bl LCRandom
	mov r1, #0xff
	bl _s32_div_f
	ldr r0, _0221E87C ; =0x00013068
	add r1, #0x1c
	strh r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	b _0221E638
_0221E62C:
	add r0, r1, #0
	add r0, #0xa
	ldrh r0, [r4, r0]
	add r1, #0xa
	add r0, r0, #1
	strh r0, [r4, r1]
_0221E638:
	ldrh r0, [r4, #0xe]
	cmp r0, #7
	bhi _0221E6B6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E64A: ; jump table
	.short _0221E65A - _0221E64A - 2 ; case 0
	.short _0221E672 - _0221E64A - 2 ; case 1
	.short _0221E6C8 - _0221E64A - 2 ; case 2
	.short _0221E6E0 - _0221E64A - 2 ; case 3
	.short _0221E724 - _0221E64A - 2 ; case 4
	.short _0221E782 - _0221E64A - 2 ; case 5
	.short _0221E7B6 - _0221E64A - 2 ; case 6
	.short _0221E7EC - _0221E64A - 2 ; case 7
_0221E65A:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221E66C
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E66C:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E672:
	ldr r0, _0221E880 ; =0x00013056
	ldr r2, _0221E884 ; =ov63_0221FDB8
	ldrh r1, [r4, r0]
	ldrh r3, [r4, #0xc]
	lsl r0, r1, #2
	add r0, r4, r0
	add r0, #0xa4
	lsl r1, r1, #4
	add r1, r2, r1
	ldr r0, [r0]
	mov r2, #6
	bl ov63_0221C610
	ldrh r0, [r4, #0xc]
	cmp r0, #6
	bne _0221E6C2
	ldr r0, _0221E880 ; =0x00013056
	mov r1, #1
	ldrh r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_0200DF98
	ldr r0, _0221E880 ; =0x00013056
	mov r2, #0
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	strh r2, [r4, #0xc]
	ldrh r1, [r4, r0]
	cmp r1, #6
	beq _0221E6B8
_0221E6B6:
	b _0221E874
_0221E6B8:
	strh r2, [r4, r0]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E6C2:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E6C8:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x20
	bne _0221E6DA
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E6DA:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E6E0:
	ldr r0, _0221E888 ; =0x00013064
	mov r1, #0x28
	str r1, [r4, r0]
	sub r1, r0, #4
	ldr r2, [r4, r1]
	mov r1, #8
	orr r2, r1
	sub r1, r0, #4
	str r2, [r4, r1]
	ldr r2, [r4, r1]
	mov r1, #4
	orr r2, r1
	sub r1, r0, #4
	str r2, [r4, r1]
	ldr r2, [r4, r1]
	mov r1, #0x20
	orr r2, r1
	sub r1, r0, #4
	str r2, [r4, r1]
	ldr r2, [r4, r1]
	mov r1, #0x40
	orr r1, r2
	sub r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E724:
	ldrh r2, [r4, #0xc]
	add r0, r4, #0
	mov r1, #0x50
	bl ov63_0221E55C
	ldr r0, _0221E88C ; =0x00013048
	mov r5, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0221E75A
	ldr r6, _0221E890 ; =ov63_0221FE18
	add r7, r4, #0
_0221E73C:
	add r0, r7, #0
	add r0, #0xbc
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	add r1, r6, #0
	mov r2, #0x50
	bl ov63_0221C610
	ldr r0, _0221E88C ; =0x00013048
	add r5, r5, #1
	ldr r0, [r4, r0]
	add r6, #0x10
	add r7, r7, #4
	cmp r5, r0
	blo _0221E73C
_0221E75A:
	add r0, r4, #0
	add r0, #0xd8
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	ldr r1, _0221E894 ; =ov63_0221FE78
	mov r2, #0x50
	bl ov63_0221C610
	ldrh r0, [r4, #0xc]
	cmp r0, #0x50
	bne _0221E77C
	mov r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E77C:
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E782:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0221E874
	ldr r0, _0221E898 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0221E79C
	bl System_GetTouchNew
	cmp r0, #1
	bne _0221E874
_0221E79C:
	ldr r0, _0221E888 ; =0x00013064
	mov r1, #0xf
	str r1, [r4, r0]
	sub r1, r0, #4
	ldr r2, [r4, r1]
	mov r1, #8
	orr r1, r2
	sub r0, r0, #4
	str r1, [r4, r0]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E7B6:
	ldrh r2, [r4, #0xc]
	add r0, r4, #0
	mov r1, #0x3c
	bl ov63_0221E55C
	ldrh r0, [r4, #0xc]
	cmp r0, #0x1e
	bne _0221E7E8
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0221E7EC
	ldr r0, _0221E888 ; =0x00013064
	mov r1, #0xf
	str r1, [r4, r0]
	sub r1, r0, #4
	ldr r2, [r4, r1]
	mov r1, #0x10
	orr r1, r2
	sub r0, r0, #4
	str r1, [r4, r0]
	ldrh r0, [r4, #0xe]
	add r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E7EC
_0221E7E8:
	add r0, r0, #1
	strh r0, [r4, #0xc]
_0221E7EC:
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E88C ; =0x00013048
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0221E834
	ldr r7, _0221E89C ; =ov63_0221FE88
	ldr r6, _0221E8A0 ; =ov63_0221FEF8
	add r5, r4, #0
_0221E7FE:
	add r0, r5, #0
	add r0, #0xa4
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	add r1, r7, #0
	mov r2, #0x3c
	bl ov63_0221C610
	add r0, r5, #0
	add r0, #0xbc
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	add r1, r6, #0
	mov r2, #0x3c
	bl ov63_0221C610
	ldr r0, [sp]
	add r7, #0x10
	add r0, r0, #1
	str r0, [sp]
	ldr r0, _0221E88C ; =0x00013048
	add r5, r5, #4
	ldr r1, [r4, r0]
	ldr r0, [sp]
	add r6, #0x10
	cmp r0, r1
	blo _0221E7FE
_0221E834:
	add r0, r4, #0
	add r0, #0xd4
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	ldr r1, _0221E8A4 ; =ov63_0221FEE8
	mov r2, #0x3c
	bl ov63_0221C610
	add r0, r4, #0
	add r0, #0xd8
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	ldr r1, _0221E8A8 ; =ov63_0221FF58
	mov r2, #0x3c
	bl ov63_0221C610
	ldrh r0, [r4, #0xe]
	cmp r0, #7
	bne _0221E874
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221E870
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0221E874
	mov r0, #0
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0221E870:
	add r0, r0, #1
	strh r0, [r4, #0xc]
_0221E874:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E878: .word 0x00013060
_0221E87C: .word 0x00013068
_0221E880: .word 0x00013056
_0221E884: .word ov63_0221FDB8
_0221E888: .word 0x00013064
_0221E88C: .word 0x00013048
_0221E890: .word ov63_0221FE18
_0221E894: .word ov63_0221FE78
_0221E898: .word gSystem
_0221E89C: .word ov63_0221FE88
_0221E8A0: .word ov63_0221FEF8
_0221E8A4: .word ov63_0221FEE8
_0221E8A8: .word ov63_0221FF58
	thumb_func_end ov63_0221E5A0

	thumb_func_start ov63_0221E8AC
ov63_0221E8AC: ; 0x0221E8AC
	push {lr}
	sub sp, #0xc
	ldr r1, _0221E8CC ; =0x00013064
	ldr r3, _0221E8D0 ; =0x00007FFF
	ldr r0, [r0, r1]
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, #0x3e
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	.balign 4, 0
_0221E8CC: .word 0x00013064
_0221E8D0: .word 0x00007FFF
	thumb_func_end ov63_0221E8AC

	thumb_func_start ov63_0221E8D4
ov63_0221E8D4: ; 0x0221E8D4
	push {lr}
	sub sp, #0xc
	ldr r1, _0221E8F8 ; =0x00013064
	ldr r0, [r0, r1]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3e
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	nop
_0221E8F8: .word 0x00013064
	thumb_func_end ov63_0221E8D4

	thumb_func_start ov63_0221E8FC
ov63_0221E8FC: ; 0x0221E8FC
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0221E912
	add r0, r4, #0
	blx r1
	cmp r0, #0
	bne _0221E912
	mov r0, #0
	str r0, [r4, #8]
_0221E912:
	add r0, r4, #0
	bl ov63_0221F1D0
	ldr r0, [r4, #0x10]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	add r4, #0xa0
	ldr r0, [r4]
	bl sub_0200D020
	bl sub_0200D034
	ldr r3, _0221E938 ; =0x027E0000
	ldr r1, _0221E93C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_0221E938: .word 0x027E0000
_0221E93C: .word 0x00003FF8
	thumb_func_end ov63_0221E8FC

	thumb_func_start ov63_0221E940
ov63_0221E940: ; 0x0221E940
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _0221E9EC ; =ov63_0221FB00
	add r3, sp, #0x54
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0221E9F0 ; =ov63_0221FBE4
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3e
	bl BG_ClearCharDataRange
	ldr r5, _0221E9F4 ; =ov63_0221FC00
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _0221E9F8 ; =ov63_0221FB90
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x64
	pop {r4, r5, pc}
	nop
_0221E9EC: .word ov63_0221FB00
_0221E9F0: .word ov63_0221FBE4
_0221E9F4: .word ov63_0221FC00
_0221E9F8: .word ov63_0221FB90
	thumb_func_end ov63_0221E940

	thumb_func_start ov63_0221E9FC
ov63_0221E9FC: ; 0x0221E9FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov63_0221E9FC

	thumb_func_start ov63_0221EA24
ov63_0221EA24: ; 0x0221EA24
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	mov r1, #5
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	mov r1, #6
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	mov r1, #7
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3e
	mov r2, #0
	add r4, #0x94
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #8
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #1
	mov r1, #0
	bl BG_SetMaskColor
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov63_0221EA24

	thumb_func_start ov63_0221EAA8
ov63_0221EAA8: ; 0x0221EAA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r5, #0
	ldr r6, _0221EBFC ; =ov63_0221FB20
	mov r7, #0
	add r4, #0x14
_0221EAB6:
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	add r2, r6, #0
	bl AddWindow
	add r7, r7, #1
	add r6, #8
	add r4, #0x10
	cmp r7, #2
	blo _0221EAB6
	add r0, r5, #0
	add r0, #0x14
	mov r1, #1
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x84
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0x10
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0x8c
	mov r0, #0
	ldr r1, [r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	add r2, r5, #0
	lsr r4, r3, #1
	mov r3, #0x80
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC00 ; =0x000F0200
	add r2, #0x8c
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r2]
	add r0, #0x14
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	add r0, #0x14
	bl CopyWindowToVram
	add r0, r5, #0
	add r0, #0x24
	mov r1, #1
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x84
	add r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0x11
	bl ReadMsgDataIntoString
	add r0, r5, #0
	ldr r2, [r5]
	add r0, #0x88
	ldr r0, [r0]
	ldr r2, [r2]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r5]
	ldr r0, [r0]
	bl PlayerProfile_GetTrainerID_VisibleHalf
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	add r0, r5, #0
	str r1, [sp, #4]
	add r0, #0x88
	ldr r0, [r0]
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetIGTHours
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl GetIGTMinutes
	add r2, r0, #0
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #3
	bl BufferIntegerAsString
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x88
	add r1, #0x8c
	add r2, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	add r1, r5, #0
	add r1, #0x8c
	mov r0, #0
	ldr r1, [r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	add r2, r5, #0
	lsr r4, r3, #1
	mov r3, #0x80
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC00 ; =0x000F0200
	add r2, #0x8c
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r2]
	add r0, #0x24
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	add r5, #0x24
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EBFC: .word ov63_0221FB20
_0221EC00: .word 0x000F0200
	thumb_func_end ov63_0221EAA8

	thumb_func_start ov63_0221EC04
ov63_0221EC04: ; 0x0221EC04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x14
_0221EC0C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blo _0221EC0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov63_0221EC04

	thumb_func_start ov63_0221EC1C
ov63_0221EC1C: ; 0x0221EC1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r3, _0221EFA4 ; =ov63_0221FAF0
	add r2, sp, #0x1c
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #8
	mov r1, #0x3e
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221EFA8 ; =0x0000D8D8
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	mov r3, #0x4d
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221EFA8 ; =0x0000D8D8
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	mov r3, #0x4e
	bl sub_0200D71C
	mov r4, #0
_0221EC72:
	ldr r0, _0221EFA8 ; =0x0000D8D8
	add r1, r5, #0
	add r6, r4, r0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	str r6, [sp, #8]
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	mov r3, #0x4c
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r5, #0
	str r6, [sp, #0xc]
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	add r4, r4, #1
	cmp r4, #6
	blo _0221EC72
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EFAC ; =0x0000D8DF
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	mov r3, #0x4c
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221EFB0 ; =0x0000D8E0
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221EFB4 ; =0x0000D8E1
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	add r0, r7, #0
	bl NARC_dtor
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221EFB8 ; =0x0000D8DB
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0x11
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221EFB8 ; =0x0000D8DB
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0x12
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221EFB0 ; =0x0000D8E0
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0x10
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221EFBC ; =0x0000D8E2
	add r1, r5, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	add r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0x13
	bl sub_0200D5D4
	mov r0, #1
	ldr r7, _0221EFC0 ; =ov63_022200A0
	lsl r0, r0, #8
	mov r6, #0
	add r0, r5, r0
	add r4, r5, #0
	str r6, [sp, #0x14]
	str r0, [sp, #0x10]
	str r7, [sp, #0x18]
_0221EDBE:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, #0
	bl sub_0200D734
	add r1, r4, #0
	add r1, #0xa4
	str r0, [r1]
	mov r2, #0x4e
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r3, [sp, #0x14]
	lsl r2, r2, #2
	add r3, r3, r2
	ldr r2, [sp, #0x18]
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r2, r3
	bl sub_0200D734
	add r1, r4, #0
	add r1, #0xbc
	str r0, [r1]
	ldr r0, _0221EFC4 ; =0x00013048
	ldr r0, [r5, r0]
	cmp r6, r0
	bhs _0221EE0E
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	mov r2, #2
	add r3, r6, #0
	bl ov63_0221C8E8
	b _0221EE1A
_0221EE0E:
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
_0221EE1A:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r6, #0
	bl ov63_0221C99C
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov63_0221C954
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DF98
	add r0, r4, #0
	add r0, #0xa4
	mov r1, #0xfe
	lsl r1, r1, #0x16
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200E024
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200E0FC
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	add r0, #0x34
	str r0, [sp, #0x14]
	ldr r0, _0221EFC8 ; =0x0000328C
	add r6, r6, #1
	add r0, r1, r0
	add r7, #0x34
	add r4, r4, #4
	str r0, [sp, #0x10]
	cmp r6, #6
	blo _0221EDBE
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _0221EFCC ; =ov63_02220310
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0xd4
	str r0, [r1]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _0221EFD0 ; =ov63_02220344
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0xd8
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DF98
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DF98
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5]
	ldr r0, [r0]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #1
	add r2, sp, #0x2c
	bne _0221EEFE
	mov r0, #1
	mov r1, #2
	bl sub_02070D84
	b _0221EF06
_0221EEFE:
	mov r0, #0
	mov r1, #2
	bl sub_02070D84
_0221EF06:
	mov r1, #0x19
	mov r0, #0x3e
	lsl r1, r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r4, [sp]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x40]
	mov r2, #0x3e
	add r3, sp, #0x1c
	bl sub_020143E0
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	mov r2, #0x32
	add r1, r0, #0
	add r0, r4, #0
	lsl r2, r2, #6
	bl ov63_0221C00C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3e
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x34]
	mov r2, #1
	bl GfGfxLoader_GXLoadPal
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x9c
	add r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _0221EFD4 ; =ov63_02220378
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0xdc
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	bl ov63_0221C954
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EFA4: .word ov63_0221FAF0
_0221EFA8: .word 0x0000D8D8
_0221EFAC: .word 0x0000D8DF
_0221EFB0: .word 0x0000D8E0
_0221EFB4: .word 0x0000D8E1
_0221EFB8: .word 0x0000D8DB
_0221EFBC: .word 0x0000D8E2
_0221EFC0: .word ov63_022200A0
_0221EFC4: .word 0x00013048
_0221EFC8: .word 0x0000328C
_0221EFCC: .word ov63_02220310
_0221EFD0: .word ov63_02220344
_0221EFD4: .word ov63_02220378
	thumb_func_end ov63_0221EC1C

	thumb_func_start ov63_0221EFD8
ov63_0221EFD8: ; 0x0221EFD8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
_0221EFDE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov63_0221C134
	add r4, r4, #1
	cmp r4, #0xf
	blo _0221EFDE
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F070 ; =0x0000D8E2
	bl sub_0200D968
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F074 ; =0x0000D8E0
	bl sub_0200D958
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F078 ; =0x0000D8DB
	bl sub_0200D978
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F078 ; =0x0000D8DB
	bl sub_0200D988
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F074 ; =0x0000D8E0
	bl sub_0200D968
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F07C ; =0x0000D8DF
	bl sub_0200D958
	ldr r6, _0221F080 ; =0x0000D8D8
	mov r4, #0
_0221F038:
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r1, r4, r6
	bl sub_0200D968
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r1, r4, r6
	bl sub_0200D958
	add r4, r4, #1
	cmp r4, #6
	blo _0221F038
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F084 ; =0x0000D8DA
	bl sub_0200D978
	add r5, #0xa0
	ldr r0, [r5]
	ldr r1, _0221F084 ; =0x0000D8DA
	bl sub_0200D988
	pop {r4, r5, r6, pc}
	nop
_0221F070: .word 0x0000D8E2
_0221F074: .word 0x0000D8E0
_0221F078: .word 0x0000D8DB
_0221F07C: .word 0x0000D8DF
_0221F080: .word 0x0000D8D8
_0221F084: .word 0x0000D8DA
	thumb_func_end ov63_0221EFD8

	thumb_func_start ov63_0221F088
ov63_0221F088: ; 0x0221F088
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _0221F118 ; =0x04000060
	ldr r2, _0221F11C ; =0xFFFFCFFD
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	add r1, r2, #2
	and r3, r1
	mov r1, #0x10
	orr r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _0221F120 ; =0x0000CFFB
	and r1, r3
	strh r1, [r0]
	add r1, r2, #2
	ldrh r3, [r0]
	lsr r2, r2, #0x11
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _0221F124 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _0221F128 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0221F12C ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	mov r1, #0
	add r0, #0x48
	mov r2, #0x1c
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	add r0, r4, #0
	bl ov63_0221F130
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0221F118: .word 0x04000060
_0221F11C: .word 0xFFFFCFFD
_0221F120: .word 0x0000CFFB
_0221F124: .word 0x04000540
_0221F128: .word 0xBFFF0000
_0221F12C: .word 0x04000008
	thumb_func_end ov63_0221F088

	thumb_func_start ov63_0221F130
ov63_0221F130: ; 0x0221F130
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x3e
	bl GF_Camera_Create
	add r1, r4, #0
	add r1, #0xe0
	str r0, [r1]
	add r1, r4, #0
	mov r0, #0
	add r1, #0xe4
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe8
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xec
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xf0
	strh r0, [r1]
	add r1, r4, #0
	add r1, #0xf2
	strh r0, [r1]
	add r1, r4, #0
	add r1, #0xf4
	strh r0, [r1]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r1, #5
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r4, #0
	ldr r3, _0221F1C0 ; =0x00000FA4
	add r0, #0xe4
	lsl r1, r1, #0xc
	add r2, #0xf0
	bl GF_Camera_InitFromTargetDistanceAndAngle
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #0x14]
	add r1, r4, #0
	add r1, #0xe0
	ldr r1, [r1]
	add r0, sp, #0xc
	bl GF_Camera_SetBindTarget
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl GF_Camera_RegisterToStaticPtr
	add r4, #0xe0
	mov r0, #1
	mov r1, #0x7d
	ldr r2, [r4]
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	add sp, #0x18
	pop {r4, pc}
	nop
_0221F1C0: .word 0x00000FA4
	thumb_func_end ov63_0221F130

	thumb_func_start ov63_0221F1C4
ov63_0221F1C4: ; 0x0221F1C4
	ldr r3, _0221F1CC ; =sub_02023120
	add r0, #0xe0
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0221F1CC: .word sub_02023120
	thumb_func_end ov63_0221F1C4

	thumb_func_start ov63_0221F1D0
ov63_0221F1D0: ; 0x0221F1D0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _0221F230 ; =0x04000600
	ldr r1, [r0]
	mov r0, #2
	lsl r0, r0, #0x1a
	tst r0, r1
	bne _0221F22A
	bl G3X_Reset
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov63_0221F580
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #4
	str r2, [sp, #4]
	bl NNS_G3dGeBufferOP_N
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	add r4, #0xfc
	ldr r0, [r4]
	bl ov63_0221FAA0
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	bl NNS_G3dGeBufferOP_N
	ldr r0, _0221F234 ; =0x04000540
	mov r1, #1
	str r1, [r0]
_0221F22A:
	add sp, #8
	pop {r4, pc}
	nop
_0221F230: .word 0x04000600
_0221F234: .word 0x04000540
	thumb_func_end ov63_0221F1D0

	thumb_func_start ov63_0221F238
ov63_0221F238: ; 0x0221F238
	push {r3, r4, r5, lr}
	ldr r1, _0221F278 ; =0x00000844
	add r5, r0, #0
	mov r0, #0x3e
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _0221F27C ; =_022203C0
	mov r1, #1
	str r1, [r0]
	ldr r0, _0221F280 ; =_022203E0
	mov r1, #2
	str r1, [r0]
	ldr r0, _0221F284 ; =0x0000083C
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, _0221F288 ; =ov63_0221F2E8
	add r1, r4, #0
	mov r2, #3
	bl sub_0200E33C
	ldr r1, _0221F28C ; =0x00000838
	mov r2, #1
	str r0, [r4, r1]
	add r1, #8
	str r5, [r4, r1]
	ldr r0, _0221F290 ; =ov63_0221F294
	add r1, r4, #0
	bl sub_0200E33C
	pop {r3, r4, r5, pc}
	nop
_0221F278: .word 0x00000844
_0221F27C: .word _022203C0
_0221F280: .word _022203E0
_0221F284: .word 0x0000083C
_0221F288: .word ov63_0221F2E8
_0221F28C: .word 0x00000838
_0221F290: .word ov63_0221F294
	thumb_func_end ov63_0221F238

	thumb_func_start ov63_0221F294
ov63_0221F294: ; 0x0221F294
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0221F2D8 ; =_022203C0
	ldr r1, [r1]
	cmp r1, #0
	beq _0221F2C8
	add r1, r4, #0
	mov r2, #2
	add r0, r4, #0
	add r1, #0x14
	lsl r2, r2, #0xa
	bl G3_BeginMakeDL
	ldr r1, _0221F2DC ; =0x00007FFF
	ldr r2, _0221F2E0 ; =0x00004210
	add r0, r4, #0
	mov r3, #0
	bl G3B_MaterialColorDiffAmb
	mov r2, #0
	ldr r1, _0221F2E0 ; =0x00004210
	add r0, r4, #0
	add r3, r2, #0
	bl G3B_MaterialColorSpecEmi
	pop {r4, pc}
_0221F2C8:
	ldr r1, _0221F2E4 ; =_022203E0
	ldr r2, [r1]
	sub r2, r2, #1
	str r2, [r1]
	bl DestroySysTask
	pop {r4, pc}
	nop
_0221F2D8: .word _022203C0
_0221F2DC: .word 0x00007FFF
_0221F2E0: .word 0x00004210
_0221F2E4: .word _022203E0
	thumb_func_end ov63_0221F294

	thumb_func_start ov63_0221F2E8
ov63_0221F2E8: ; 0x0221F2E8
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0221F318 ; =_022203C0
	ldr r1, [r1]
	cmp r1, #0
	beq _0221F30A
	add r0, r4, #0
	bl G3_EndMakeDL
	ldr r1, _0221F31C ; =0x00000814
	str r0, [r4, r1]
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x14
	bl DC_FlushRange
	pop {r4, pc}
_0221F30A:
	ldr r1, _0221F320 ; =_022203E0
	ldr r2, [r1]
	sub r2, r2, #1
	str r2, [r1]
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
_0221F318: .word _022203C0
_0221F31C: .word 0x00000814
_0221F320: .word _022203E0
	thumb_func_end ov63_0221F2E8

	thumb_func_start ov63_0221F324
ov63_0221F324: ; 0x0221F324
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl sub_0201F988
	ldr r1, _0221F360 ; =0x0000083C
	add r4, r0, #0
	ldr r3, [r4, r1]
	cmp r3, #8
	bge _0221F35C
	add r1, r5, #0
	add r2, r6, #0
	bl ov63_0221F368
	ldr r2, _0221F360 ; =0x0000083C
	ldr r1, [r4, r2]
	lsl r1, r1, #2
	add r3, r4, r1
	add r1, r2, #0
	sub r1, #0x24
	str r0, [r3, r1]
	ldr r0, _0221F364 ; =_022203E0
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r0, [r4, r2]
	add r0, r0, #1
	str r0, [r4, r2]
_0221F35C:
	pop {r4, r5, r6, pc}
	nop
_0221F360: .word 0x0000083C
_0221F364: .word _022203E0
	thumb_func_end ov63_0221F324

	thumb_func_start ov63_0221F368
ov63_0221F368: ; 0x0221F368
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r1, _0221F3DC ; =0x00000838
	mov r0, #0x3e
	add r7, r2, #0
	add r4, r3, #0
	bl AllocFromHeap
	add r1, r0, #0
	str r6, [r1]
	ldr r0, _0221F3E0 ; =0x00000818
	ldr r2, _0221F3E4 ; =ov63_0221FCF8
	lsl r3, r4, #2
	ldr r3, [r2, r3]
	add r2, r0, #0
	strh r5, [r1, r0]
	sub r2, #8
	str r3, [r1, r2]
	add r2, r0, #0
	mov r3, #0
	sub r2, #0x14
	str r3, [r1, r2]
	add r2, r0, #0
	sub r2, #0x10
	str r7, [r1, r2]
	ldr r2, _0221F3E8 ; =_0221FAE4
	lsl r6, r4, #1
	ldrsh r2, [r2, r6]
	lsl r6, r2, #1
	add r2, r0, #0
	sub r2, #0xc
	str r6, [r1, r2]
	sub r2, r0, #4
	str r4, [r1, r2]
	add r4, r5, #0
	sub r4, #0x50
	add r2, r0, #2
	strh r4, [r1, r2]
	ldr r2, _0221F3EC ; =0xFFFFF000
	add r4, r0, #4
	strh r2, [r1, r4]
	add r4, r0, #6
	strh r3, [r1, r4]
	add r4, r0, #0
	add r5, #0x50
	add r4, #8
	strh r5, [r1, r4]
	add r4, r0, #0
	add r4, #0xa
	strh r2, [r1, r4]
	add r0, #0xc
	strh r3, [r1, r0]
	ldr r0, _0221F3F0 ; =ov63_0221F3F4
	mov r2, #2
	bl sub_0200E33C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F3DC: .word 0x00000838
_0221F3E0: .word 0x00000818
_0221F3E4: .word ov63_0221FCF8
_0221F3E8: .word _0221FAE4
_0221F3EC: .word 0xFFFFF000
_0221F3F0: .word ov63_0221F3F4
	thumb_func_end ov63_0221F368

	thumb_func_start ov63_0221F3F4
ov63_0221F3F4: ; 0x0221F3F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, _0221F564 ; =_022203C0
	ldr r1, [r1]
	cmp r1, #0
	bne _0221F404
	b _0221F552
_0221F404:
	ldr r0, _0221F568 ; =0x00000808
	add r1, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [r5, r1]
	add r1, r2, r1
	str r1, [r5, r0]
	add r1, r0, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r0]
	cmp r1, #0
	ble _0221F432
	mov r1, #0xaa
	lsl r1, r1, #0xc
	cmp r2, r1
	blt _0221F448
	add r1, r0, #4
	ldr r2, [r5, r1]
	mov r1, #0
	mvn r1, r1
	mul r1, r2
	add r0, r0, #4
	str r1, [r5, r0]
	b _0221F448
_0221F432:
	mov r1, #0xa
	lsl r1, r1, #0xc
	cmp r2, r1
	bgt _0221F448
	add r1, r0, #4
	ldr r2, [r5, r1]
	mov r1, #0
	mvn r1, r1
	mul r1, r2
	add r0, r0, #4
	str r1, [r5, r0]
_0221F448:
	ldr r0, _0221F568 ; =0x00000808
	ldr r0, [r5, r0]
	asr r6, r0, #0xc
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDegNoWrap
	mov r2, #0xa
	asr r1, r0, #0x1f
	lsl r2, r2, #0xa
	mov r3, #0
	bl _ll_mul
	ldr r3, _0221F56C ; =0x00000818
	mov r4, #0
	ldrsh r2, [r5, r3]
	sub r3, #0x18
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	add r4, r2, r1
	bl GF_SinDegNoWrap
	mov r2, #0xa
	asr r1, r0, #0x1f
	lsl r2, r2, #0xa
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r6, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r6, #0xc
	orr r1, r0
	lsl r0, r2, #1
	mov r7, #9
	sub r6, r1, r0
	lsl r7, r7, #6
	add r0, r2, #0
	sub r1, r4, r7
	add r0, #0x26
	strh r1, [r5, r0]
	lsl r0, r6, #0x10
	add r1, r2, #0
	asr r0, r0, #0x10
	add r1, #0x28
	strh r0, [r5, r1]
	add r1, r2, #0
	add r1, #0x2a
	strh r3, [r5, r1]
	add r1, r2, #0
	add r4, r4, r7
	add r1, #0x2c
	strh r4, [r5, r1]
	add r1, r2, #0
	add r1, #0x2e
	strh r0, [r5, r1]
	add r0, r2, #0
	add r0, #0x30
	add r2, #0x14
	strh r3, [r5, r0]
	ldr r0, [r5, r2]
	add r1, r3, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r2, r3, #0
	ldr r0, [r5]
	mov r3, #2
	bl G3B_PolygonAttr
	ldr r0, [r5]
	mov r1, #1
	bl G3B_Begin
	mov r1, #0x81
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	ldr r0, [r5]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl G3B_Color
	ldr r3, _0221F570 ; =0x0000081A
	ldr r0, [r5]
	add r2, r3, #2
	ldrsh r1, [r5, r3]
	add r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	bl G3B_Vtx
	mov r3, #0x82
	lsl r3, r3, #4
	add r2, r3, #2
	ldrsh r1, [r5, r3]
	add r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r0, [r5]
	bl G3B_Vtx
	ldr r3, _0221F574 ; =0x0000082C
	ldr r0, [r5]
	add r2, r3, #2
	ldrsh r1, [r5, r3]
	add r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	bl G3B_Vtx
	ldr r3, _0221F578 ; =0x00000826
	ldr r0, [r5]
	add r2, r3, #2
	ldrsh r1, [r5, r3]
	add r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	bl G3B_Vtx
	ldr r0, [r5]
	bl G3B_End
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221F552:
	ldr r1, _0221F57C ; =_022203E0
	ldr r2, [r1]
	sub r2, r2, #1
	str r2, [r1]
	bl DestroySysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221F564: .word _022203C0
_0221F568: .word 0x00000808
_0221F56C: .word 0x00000818
_0221F570: .word 0x0000081A
_0221F574: .word 0x0000082C
_0221F578: .word 0x00000826
_0221F57C: .word _022203E0
	thumb_func_end ov63_0221F3F4

	thumb_func_start ov63_0221F580
ov63_0221F580: ; 0x0221F580
	push {r3, lr}
	cmp r0, #0
	beq _0221F5A6
	bl sub_0201F988
	add r3, r0, #0
	ldr r0, _0221F5A8 ; =0x04000444
	mov r1, #0
	str r1, [r0]
	ldr r2, _0221F5AC ; =0x00000814
	add r1, r3, #0
	ldr r2, [r3, r2]
	mov r0, #3
	add r1, #0x14
	bl MI_SendGXCommand
	ldr r0, _0221F5B0 ; =0x04000448
	mov r1, #1
	str r1, [r0]
_0221F5A6:
	pop {r3, pc}
	.balign 4, 0
_0221F5A8: .word 0x04000444
_0221F5AC: .word 0x00000814
_0221F5B0: .word 0x04000448
	thumb_func_end ov63_0221F580

	thumb_func_start ov63_0221F5B4
ov63_0221F5B4: ; 0x0221F5B4
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0221F5F4 ; =_022203C0
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _0221F5F0
	bl sub_0201F988
	add r6, r0, #0
	ldr r0, _0221F5F8 ; =0x0000083C
	mov r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	ble _0221F5EA
	ldr r7, _0221F5F8 ; =0x0000083C
	add r5, r6, #0
_0221F5D4:
	ldr r0, _0221F5FC ; =0x00000818
	ldr r0, [r5, r0]
	bl sub_0201F988
	bl FreeToHeap
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0221F5D4
_0221F5EA:
	add r0, r6, #0
	bl FreeToHeap
_0221F5F0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F5F4: .word _022203C0
_0221F5F8: .word 0x0000083C
_0221F5FC: .word 0x00000818
	thumb_func_end ov63_0221F5B4

	thumb_func_start ov63_0221F600
ov63_0221F600: ; 0x0221F600
	ldr r0, _0221F610 ; =_022203E0
	ldr r0, [r0]
	cmp r0, #0
	bne _0221F60C
	mov r0, #1
	bx lr
_0221F60C:
	mov r0, #0
	bx lr
	.balign 4, 0
_0221F610: .word _022203E0
	thumb_func_end ov63_0221F600

	thumb_func_start ov63_0221F614
ov63_0221F614: ; 0x0221F614
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r1, _0221F7A8 ; =0x00008D64
	mov r0, #0x3e
	bl AllocFromHeap
	str r0, [sp, #0x28]
	bl LCRandom
	str r0, [sp, #0x20]
	ldr r0, _0221F7AC ; =0x00003594
	bl SetLCRNGSeed
	mov r0, #0
	ldr r4, [sp, #0x28]
	str r0, [sp, #0x24]
	str r0, [sp, #0x1c]
	add r0, r4, #0
	str r0, [sp, #0x18]
	add r0, #0x34
	str r0, [sp, #0x18]
	add r0, r4, #0
	str r0, [sp, #0x14]
	add r0, #0x28
	str r0, [sp, #0x14]
	add r0, r4, #0
	str r0, [sp, #0x10]
	add r0, #0x2e
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xc]
_0221F652:
	ldr r0, [sp, #0x1c]
	lsl r1, r0, #2
	ldr r0, _0221F7B0 ; =ov63_0221FD38
	ldr r0, [r0, r1]
	str r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blo _0221F66A
	mov r0, #0
	str r0, [sp, #0x1c]
_0221F66A:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x13
	sub r1, r1, r2
	mov r0, #0x13
	ror r1, r0
	mov r0, #1
	add r1, r2, r1
	lsl r0, r0, #0xc
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x13
	sub r1, r1, r2
	mov r0, #0x13
	ror r1, r0
	mov r0, #1
	add r1, r2, r1
	lsl r0, r0, #0xc
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	bl LCRandom
	mov r1, #0x29
	lsl r1, r1, #4
	bl _s32_div_f
	mov r0, #0x52
	lsl r0, r0, #2
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	ldr r5, _0221F7B4 ; =ov63_0221FB44
	str r0, [sp]
	mov r7, #0
	add r6, r4, #0
_0221F6C0:
	mov r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [sp, #8]
	add r0, r0, r1
	strh r0, [r6, #0x10]
	mov r0, #2
	ldrsh r1, [r5, r0]
	ldr r0, [sp, #4]
	add r0, r0, r1
	strh r0, [r6, #0x12]
	mov r0, #4
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	add r0, r0, r1
	strh r0, [r6, #0x14]
	mov r0, #0
	strh r0, [r4, #0x28]
	strh r0, [r4, #0x2a]
	strh r0, [r4, #0x2c]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x17
	sub r2, r2, r1
	mov r0, #0x17
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #8
	add r0, r1, r0
	strh r0, [r4, #0x2e]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x17
	sub r2, r2, r1
	mov r0, #0x17
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #8
	add r0, r1, r0
	strh r0, [r4, #0x30]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x17
	sub r2, r2, r1
	mov r0, #0x17
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #8
	add r0, r1, r0
	strh r0, [r4, #0x32]
	ldr r0, [sp, #0x18]
	bl MTX_Identity44_
	add r7, r7, #1
	add r5, r5, #6
	add r6, r6, #6
	cmp r7, #4
	blt _0221F6C0
	bl LCRandom
	mov r1, #7
	and r0, r1
	sub r5, r0, #1
	cmp r0, #0
	beq _0221F75E
_0221F74C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl VEC_Fx16Add
	add r0, r5, #0
	sub r5, r5, #1
	cmp r0, #0
	bne _0221F74C
_0221F75E:
	ldr r0, [sp, #0x18]
	add r4, #0x70
	add r0, #0x70
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, #0x70
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x70
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, #0x70
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #0x30
	bge _0221F784
	b _0221F652
_0221F784:
	ldr r0, [sp, #0x20]
	bl SetLCRNGSeed
	ldr r0, [sp, #0x28]
	mov r2, #0
	str r2, [r0]
	ldr r1, _0221F7B8 ; =0x00008D20
	str r2, [r0, #4]
	str r2, [r0, r1]
	ldr r0, _0221F7BC ; =0x04000440
	mov r1, #2
	str r1, [r0]
	ldr r0, _0221F7C0 ; =ov63_0221F7EC
	ldr r1, [sp, #0x28]
	bl CreateSysTask
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F7A8: .word 0x00008D64
_0221F7AC: .word 0x00003594
_0221F7B0: .word ov63_0221FD38
_0221F7B4: .word ov63_0221FB44
_0221F7B8: .word 0x00008D20
_0221F7BC: .word 0x04000440
_0221F7C0: .word ov63_0221F7EC
	thumb_func_end ov63_0221F614

	thumb_func_start ov63_0221F7C4
ov63_0221F7C4: ; 0x0221F7C4
	push {r4, lr}
	add r4, r0, #0
	beq _0221F7D8
	bl sub_0201F988
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
_0221F7D8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov63_0221F7C4

	thumb_func_start ov63_0221F7DC
ov63_0221F7DC: ; 0x0221F7DC
	push {r3, lr}
	cmp r0, #0
	beq _0221F7EA
	bl sub_0201F988
	mov r1, #1
	str r1, [r0]
_0221F7EA:
	pop {r3, pc}
	thumb_func_end ov63_0221F7DC

	thumb_func_start ov63_0221F7EC
ov63_0221F7EC: ; 0x0221F7EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	add r7, r1, #0
	ldr r0, [r7]
	cmp r0, #0
	bne _0221F7FA
	b _0221FA70
_0221F7FA:
	ldr r1, _0221FA74 ; =0x00001508
	mov r2, #0x1e
	add r0, r7, r1
	add r1, #0x14
	add r1, r7, r1
	lsl r2, r2, #0xa
	bl G3_BeginMakeDL
	mov r0, #0x3f
	str r0, [sp]
	mov r0, #0x1f
	str r0, [sp, #4]
	ldr r0, _0221FA74 ; =0x00001508
	mov r1, #3
	mov r2, #0
	add r0, r7, r0
	add r3, r1, #0
	str r2, [sp, #8]
	bl G3B_PolygonAttr
	ldr r0, _0221FA74 ; =0x00001508
	mov r2, #0
	ldr r1, _0221FA78 ; =0x00005294
	add r0, r7, r0
	add r3, r2, #0
	bl G3B_MaterialColorDiffAmb
	mov r0, #0
	str r0, [sp, #0x1c]
	add r0, r7, #0
	str r0, [sp, #0x18]
	add r0, #0x28
	str r0, [sp, #0x18]
	add r0, r7, #0
	str r0, [sp, #0x14]
	add r0, #0x2e
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r5, r7, #0
	str r5, [sp, #0xc]
	add r5, #0x34
	add r4, r7, #0
	str r0, [sp, #0x10]
	str r5, [sp, #0xc]
_0221F852:
	mov r0, #0x24
	ldrsh r0, [r4, r0]
	sub r0, #0x55
	strh r0, [r4, #0x24]
	mov r0, #0x24
	ldrsh r1, [r4, r0]
	ldr r0, _0221FA7C ; =0xFFFFF000
	cmp r1, r0
	bgt _0221F86C
	mov r0, #2
	lsl r0, r0, #0xc
	add r0, r1, r0
	strh r0, [r4, #0x24]
_0221F86C:
	mov r0, #0x24
	ldrsh r1, [r4, r0]
	ldr r0, _0221FA80 ; =0x0000019A
	ldr r2, [sp, #0x18]
	sub r0, r1, r0
	strh r0, [r4, #0x12]
	mov r0, #0x12
	ldrsh r0, [r4, r0]
	ldr r1, [sp, #0x14]
	strh r0, [r4, #0x18]
	mov r0, #0x24
	ldrsh r0, [r4, r0]
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0x10]
	bl VEC_Fx16Add
	ldr r0, [sp, #0xc]
	bl MTX_Identity44_
	mov r0, #0x14
	ldrsh r0, [r4, r0]
	mov r2, #0x10
	mov r3, #0x12
	str r0, [sp]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl MTX_TransApply44
	ldr r0, _0221FA74 ; =0x00001508
	ldr r2, _0221FA84 ; =0x00002D6B
	add r0, r7, r0
	mov r1, #0
	bl G3B_LightColor
	ldr r2, [r4, #8]
	ldr r0, _0221FA74 ; =0x00001508
	lsl r2, r2, #0x10
	add r0, r7, r0
	mov r1, #1
	lsr r2, r2, #0x10
	bl G3B_LightColor
	mov r1, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, _0221FA88 ; =0x00000FFF
	strh r1, [r0, #2]
	ldr r1, _0221FA8C ; =0xFFFFF001
	strh r1, [r0, #4]
	add r0, sp, #0x20
	add r1, r0, #0
	bl VEC_Fx16Normalize
	add r3, sp, #0x20
	add r1, sp, #0x20
	mov r0, #4
	ldrsh r0, [r1, r0]
	mov r1, #0
	add r2, r1, #0
	str r0, [sp]
	ldr r0, _0221FA74 ; =0x00001508
	ldrsh r2, [r3, r2]
	add r6, r3, #0
	mov r3, #2
	ldrsh r3, [r6, r3]
	add r0, r7, r0
	bl G3B_LightVector
	mov r1, #0
	add r0, r6, #0
	strh r1, [r0]
	ldr r1, _0221FA8C ; =0xFFFFF001
	strh r1, [r0, #2]
	lsr r1, r1, #0x14
	strh r1, [r0, #4]
	add r0, sp, #0x20
	add r1, r0, #0
	bl VEC_Fx16Normalize
	add r1, r6, #0
	mov r0, #4
	ldrsh r0, [r1, r0]
	add r3, r6, #0
	mov r2, #0
	str r0, [sp]
	ldrsh r2, [r3, r2]
	mov r3, #2
	ldr r0, _0221FA74 ; =0x00001508
	ldrsh r3, [r6, r3]
	add r0, r7, r0
	mov r1, #1
	bl G3B_LightVector
	ldrh r0, [r4, #0x28]
	ldr r3, _0221FA90 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0221FA90 ; =FX_SinCosTable_
	add r2, r0, r1
	ldrsh r1, [r3, r1]
	mov r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x28
	bl MTX_RotX44_
	ldr r2, [sp, #0xc]
	add r0, sp, #0x28
	add r1, r5, #0
	bl MTX_Concat44
	ldrh r0, [r4, #0x2a]
	ldr r3, _0221FA90 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0221FA90 ; =FX_SinCosTable_
	add r2, r0, r1
	ldrsh r1, [r3, r1]
	mov r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x28
	bl MTX_RotY44_
	ldr r2, [sp, #0xc]
	add r0, sp, #0x28
	add r1, r5, #0
	bl MTX_Concat44
	ldrh r0, [r4, #0x2c]
	ldr r3, _0221FA90 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0221FA90 ; =FX_SinCosTable_
	add r2, r0, r1
	ldrsh r1, [r3, r1]
	mov r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x28
	bl MTX_RotZ44_
	ldr r2, [sp, #0xc]
	add r0, sp, #0x28
	add r1, r5, #0
	bl MTX_Concat44
	ldr r2, [r4, #8]
	ldr r0, _0221FA74 ; =0x00001508
	lsl r2, r2, #0x10
	ldr r1, _0221FA94 ; =0x00007FFF
	add r0, r7, r0
	lsr r2, r2, #0x10
	mov r3, #0
	bl G3B_MaterialColorSpecEmi
	ldr r0, _0221FA74 ; =0x00001508
	add r0, r7, r0
	bl G3B_PushMtx
	ldr r0, _0221FA74 ; =0x00001508
	add r1, r5, #0
	add r0, r7, r0
	bl G3B_LoadMtx44
	ldr r0, _0221FA74 ; =0x00001508
	mov r1, #1
	add r0, r7, r0
	bl G3B_Begin
	ldr r0, _0221FA74 ; =0x00001508
	mov r1, #0
	ldr r3, _0221FA8C ; =0xFFFFF001
	add r0, r7, r0
	add r2, r1, #0
	bl G3B_Normal
	mov r1, #0x9b
	ldr r0, _0221FA74 ; =0x00001508
	mvn r1, r1
	add r2, r1, #0
	add r0, r7, r0
	sub r2, #0x31
	mov r3, #0
	bl G3B_Vtx
	ldr r0, _0221FA74 ; =0x00001508
	mov r2, #0xcc
	add r0, r7, r0
	mov r1, #0x9c
	mvn r2, r2
	mov r3, #0
	bl G3B_Vtx
	ldr r0, _0221FA74 ; =0x00001508
	mov r1, #0x9c
	add r0, r7, r0
	mov r2, #0xcd
	mov r3, #0
	bl G3B_Vtx
	ldr r0, _0221FA74 ; =0x00001508
	mov r1, #0x9b
	add r0, r7, r0
	mvn r1, r1
	mov r2, #0xcd
	mov r3, #0
	bl G3B_Vtx
	ldr r0, _0221FA74 ; =0x00001508
	add r0, r7, r0
	bl G3B_End
	ldr r0, _0221FA74 ; =0x00001508
	mov r1, #1
	add r0, r7, r0
	bl G3B_PopMtx
	ldr r0, [sp, #0x18]
	add r4, #0x70
	add r0, #0x70
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r5, #0x70
	add r0, #0x70
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x70
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, #0x70
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #0x30
	bge _0221FA46
	b _0221F852
_0221FA46:
	ldr r0, _0221FA74 ; =0x00001508
	add r0, r7, r0
	bl G3_EndMakeDL
	ldr r1, _0221FA98 ; =0x00008D1C
	str r0, [r7, r1]
	ldr r0, _0221FA9C ; =0x0000151C
	ldr r1, [r7, r1]
	add r0, r7, r0
	bl DC_FlushRange
	ldr r0, _0221FA98 ; =0x00008D1C
	ldr r1, [r7, r0]
	mov r0, #0x1e
	lsl r0, r0, #0xa
	cmp r1, r0
	blo _0221FA6C
	bl GF_AssertFail
_0221FA6C:
	mov r0, #1
	str r0, [r7, #4]
_0221FA70:
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221FA74: .word 0x00001508
_0221FA78: .word 0x00005294
_0221FA7C: .word 0xFFFFF000
_0221FA80: .word 0x0000019A
_0221FA84: .word 0x00002D6B
_0221FA88: .word 0x00000FFF
_0221FA8C: .word 0xFFFFF001
_0221FA90: .word FX_SinCosTable_
_0221FA94: .word 0x00007FFF
_0221FA98: .word 0x00008D1C
_0221FA9C: .word 0x0000151C
	thumb_func_end ov63_0221F7EC

	thumb_func_start ov63_0221FAA0
ov63_0221FAA0: ; 0x0221FAA0
	push {r4, lr}
	cmp r0, #0
	beq _0221FAD0
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0221FAD0
	ldr r0, _0221FAD4 ; =0x04000444
	mov r1, #0
	str r1, [r0]
	ldr r2, _0221FAD8 ; =0x00008D1C
	ldr r1, _0221FADC ; =0x0000151C
	ldr r2, [r4, r2]
	mov r0, #3
	add r1, r4, r1
	bl MI_SendGXCommand
	ldr r0, _0221FAE0 ; =0x04000448
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	str r0, [r4, #4]
_0221FAD0:
	pop {r4, pc}
	nop
_0221FAD4: .word 0x04000444
_0221FAD8: .word 0x00008D1C
_0221FADC: .word 0x0000151C
_0221FAE0: .word 0x04000448
	thumb_func_end ov63_0221FAA0

	.rodata

_0221FAE4:
	.byte 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0A

ov63_0221FAF0: ; 0x0221FAF0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov63_0221FB00: ; 0x0221FB00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov63_0221FB10: ; 0x0221FB10
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FB20: ; 0x0221FB20
	.byte 0x01, 0x00, 0x00, 0x20, 0x02, 0x0F, 0x01, 0x00, 0x01, 0x00, 0x16, 0x20, 0x02, 0x0F, 0x41, 0x00

ov63_0221FB30: ; 0x0221FB30
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x10, 0x00

ov63_0221FB44: ; 0x0221FB44
	.byte 0x64, 0xFF, 0x33, 0xFF, 0x00, 0x00, 0x9C, 0x00, 0x33, 0xFF, 0x00, 0x00
	.byte 0x9C, 0x00, 0xCD, 0x00, 0x00, 0x00, 0x64, 0xFF, 0xCD, 0x00, 0x00, 0x00

ov63_0221FB5C: ; 0x0221FB5C
	.byte 0x09, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov63_0221FB74: ; 0x0221FB74
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x14, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FB90: ; 0x0221FB90
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FBAC: ; 0x0221FBAC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x1C, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FBC8: ; 0x0221FBC8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x18, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov63_0221FBE4: ; 0x0221FBE4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FC00: ; 0x0221FC00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FC1C: ; 0x0221FC1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x10, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FC38: ; 0x0221FC38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov63_0221FC58: ; 0x0221FC58
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_0221FC78: ; 0x0221FC78
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F

ov63_0221FC98: ; 0x0221FC98
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00

ov63_0221FCB8: ; 0x0221FCB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov63_0221FCF8: ; 0x0221FCF8
	.byte 0xFF, 0x33, 0x00, 0x00, 0xFF, 0x43, 0x00, 0x00
	.byte 0x9F, 0x23, 0x00, 0x00, 0xFF, 0x33, 0x00, 0x00, 0xFF, 0x43, 0x00, 0x00, 0x9F, 0x23, 0x00, 0x00
	.byte 0xFF, 0x33, 0x00, 0x00, 0xFF, 0x33, 0x00, 0x00

ov63_0221FD18: ; 0x0221FD18
	.word ov63_0221C1F8
	.word ov63_0221C214
	.word ov63_0221C228
	.word ov63_0221C264
	.word ov63_0221C368
	.word ov63_0221C384
	.word ov63_0221C3CC
	.word ov63_0221C5A0

ov63_0221FD38: ; 0x0221FD38
	.byte 0x90, 0x57, 0x00, 0x00, 0x1F, 0x76, 0x00, 0x00
	.byte 0x08, 0x7D, 0x00, 0x00, 0xE6, 0x7F, 0x00, 0x00, 0xFF, 0x03, 0x00, 0x00, 0xE9, 0x03, 0x00, 0x00
	.byte 0x5F, 0x02, 0x00, 0x00, 0x16, 0x7C, 0x00, 0x00

ov63_0221FD58: ; 0x0221FD58
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov63_0221FD80: ; 0x0221FD80
	.byte 0x00, 0x00, 0x00, 0x20, 0x02, 0x0F, 0x01, 0x00, 0x00, 0x12, 0x03, 0x0E, 0x02, 0x0F, 0x41, 0x00
	.byte 0x00, 0x12, 0x06, 0x0E, 0x04, 0x0F, 0x5D, 0x00, 0x00, 0x12, 0x0C, 0x0E, 0x09, 0x0F, 0x95, 0x00
	.byte 0x00, 0x00, 0x03, 0x0E, 0x02, 0x0F, 0x41, 0x00, 0x00, 0x00, 0x06, 0x0E, 0x04, 0x0F, 0x5D, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0E, 0x09, 0x0F, 0x95, 0x00

ov63_0221FDB8: ; 0x0221FDB8
	.byte 0xA8, 0x00, 0xD8, 0xFF, 0x60, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xA4, 0xFF, 0x58, 0x00, 0xA0, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x5C, 0x01, 0x58, 0x00, 0x38, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x58, 0x00, 0xD8, 0xFF, 0xC8, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x50, 0x01, 0x00, 0x00, 0x28, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xB0, 0xFF, 0x00, 0x00, 0xD8, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F

ov63_0221FE18: ; 0x0221FE18
	.byte 0x5D, 0x00, 0x6E, 0x00, 0x63, 0x00, 0x6E, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x9D, 0x00, 0x6E, 0x00, 0xA3, 0x00, 0x6E, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x35, 0x00, 0x60, 0x00, 0x3B, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xC5, 0x00, 0x60, 0x00, 0xCB, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x25, 0x00, 0x48, 0x00, 0x2B, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xD5, 0x00, 0x48, 0x00, 0xDB, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F

ov63_0221FE78: ; 0x0221FE78
	.byte 0x7D, 0x00, 0x78, 0x00, 0x83, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F

ov63_0221FE88: ; 0x0221FE88
	.byte 0x60, 0x00, 0x78, 0x00, 0x6C, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0xA0, 0x00, 0x78, 0x00, 0x94, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0x38, 0x00, 0x68, 0x00, 0x54, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F, 0xC8, 0x00, 0x68, 0x00, 0xAA, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F, 0x28, 0x00, 0x50, 0x00, 0x40, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x33, 0x33, 0x33, 0x3F, 0xD8, 0x00, 0x50, 0x00, 0xBE, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x33, 0x33, 0x33, 0x3F

ov63_0221FEE8: ; 0x0221FEE8
	.byte 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x33, 0x33, 0x33, 0x3F

ov63_0221FEF8: ; 0x0221FEF8
	.byte 0x60, 0x00, 0x5A, 0x00, 0x6C, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0xA0, 0x00, 0x5A, 0x00, 0x94, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0x38, 0x00, 0x50, 0x00, 0x54, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0xC8, 0x00, 0x50, 0x00, 0xAA, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0x28, 0x00, 0x3C, 0x00, 0x40, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F, 0xD8, 0x00, 0x3C, 0x00, 0xBE, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F

ov63_0221FF58: ; 0x0221FF58
	.byte 0x80, 0x00, 0x64, 0x00, 0x80, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F

ov63_0221FF68: ; 0x0221FF68
	.byte 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00
	.byte 0xD9, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00
	.byte 0xD9, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDE, 0xD8, 0x00, 0x00
	.byte 0xDE, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xDE, 0xD8, 0x00, 0x00, 0xDF, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_022200A0: ; 0x022200A0
	.byte 0xA8, 0x00, 0xD8, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xA4, 0xFF, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x01, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00
	.byte 0xDA, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x00, 0xD8, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xDB, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDC, 0xD8, 0x00, 0x00, 0xDC, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDD, 0xD8, 0x00, 0x00, 0xDD, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9D, 0x00, 0x6E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD9, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x35, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC5, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDC, 0xD8, 0x00, 0x00
	.byte 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD5, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xDD, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_02220310: ; 0x02220310
	.byte 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDF, 0xD8, 0x00, 0x00, 0xE0, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov63_02220344: ; 0x02220344
	.byte 0x7D, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDF, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov63_02220378: ; 0x02220378
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE0, 0xD8, 0x00, 0x00
	.byte 0xE2, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_022203C0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_022203E0:
	.space 0x20
