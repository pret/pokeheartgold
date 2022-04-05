	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov46_02258800
ov46_02258800: ; 0x02258800
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r2, #2
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x77
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, _02258918 ; =0x00000404
	add r0, r4, #0
	mov r2, #0x77
	bl OverlayManager_CreateAndGetData
	ldr r2, _02258918 ; =0x00000404
	mov r1, #0
	add r5, r0, #0
	bl memset
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _0225891C ; =0x0000047D
	str r0, [r5]
	mov r0, #0xb
	mov r2, #0
	bl sub_02004EC4
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #0x77
	bl ov46_02258F78
	mov r0, #2
	str r0, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	mov r0, #0x1b
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r5]
	ldr r3, _02258920 ; =0x0000030A
	str r0, [sp, #0x14]
	mov r0, #0x77
	str r0, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r5, #0xc]
	add r0, #0x40
	mov r2, #1
	bl ov46_022592EC
	mov r0, #2
	str r0, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	mov r0, #0x1b
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r5]
	mov r3, #0x32
	str r0, [sp, #0x14]
	mov r0, #0x77
	str r0, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r5, #0xc]
	add r0, #0x70
	mov r2, #1
	lsl r3, r3, #4
	bl ov46_022592EC
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r5]
	mov r3, #0x32
	str r0, [sp, #0x14]
	mov r0, #0x77
	str r0, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r5, #0xc]
	add r0, #0xa0
	mov r2, #0
	lsl r3, r3, #4
	bl ov46_022592EC
	mov r0, #5
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #0x16
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x81
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5]
	ldr r3, _02258920 ; =0x0000030A
	str r0, [sp, #0x14]
	mov r0, #0x77
	str r0, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r5, #0xc]
	add r0, #0x10
	bl ov46_022592EC
	add r0, r5, #0
	add r0, #0x10
	mov r1, #0x15
	bl ov46_022594E0
	ldr r0, _02258924 ; =ov46_02258F70
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	ldr r0, _02258928 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
_02258918: .word 0x00000404
_0225891C: .word 0x0000047D
_02258920: .word 0x0000030A
_02258924: .word ov46_02258F70
_02258928: .word gSystem + 0x60
	thumb_func_end ov46_02258800

	thumb_func_start ov46_0225892C
ov46_0225892C: ; 0x0225892C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r1, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0xf
	bls _0225894A
	b _02258C24
_0225894A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02258956: ; jump table
	.short _02258976 - _02258956 - 2 ; case 0
	.short _02258994 - _02258956 - 2 ; case 1
	.short _022589A4 - _02258956 - 2 ; case 2
	.short _022589D0 - _02258956 - 2 ; case 3
	.short _02258A0A - _02258956 - 2 ; case 4
	.short _02258A32 - _02258956 - 2 ; case 5
	.short _02258A64 - _02258956 - 2 ; case 6
	.short _02258BF6 - _02258956 - 2 ; case 7
	.short _02258C16 - _02258956 - 2 ; case 8
	.short _02258AB2 - _02258956 - 2 ; case 9
	.short _02258B0E - _02258956 - 2 ; case 10
	.short _02258B4C - _02258956 - 2 ; case 11
	.short _02258B74 - _02258956 - 2 ; case 12
	.short _02258BA6 - _02258956 - 2 ; case 13
	.short _02258BB4 - _02258956 - 2 ; case 14
	.short _02258BD8 - _02258956 - 2 ; case 15
_02258976:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x77
	str r0, [sp, #8]
	ldr r3, _02258C30 ; =0x0000FFFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258994:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022589F0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_022589A4:
	ldr r0, [r6, #8]
	cmp r0, #0
	bne _022589CA
	add r0, r5, #0
	add r0, #0x70
	mov r1, #0x11
	bl ov46_02259374
	mov r1, #0x23
	ldr r0, [r5, #0xc]
	lsl r1, r1, #4
	bl ov46_02259550
	add r5, #0xd0
	str r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_022589CA:
	mov r0, #4
	str r0, [r4]
	b _02258C28
_022589D0:
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_020168F4
	cmp r0, #1
	bne _022589EC
	add r5, #0xd0
	ldr r0, [r5]
	bl sub_02016624
	mov r0, #4
	str r0, [r4]
	b _02258C28
_022589EC:
	cmp r0, #2
	beq _022589F2
_022589F0:
	b _02258C28
_022589F2:
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_02016624
	add r5, #0x40
	add r0, r5, #0
	bl ov46_022593F8
	mov r0, #7
	str r0, [r4]
	b _02258C28
_02258A0A:
	ldr r0, [r6, #4]
	bl ov45_0222A5C0
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_0203976C
	add r0, r5, #0
	add r0, #0x70
	mov r1, #0x17
	bl ov46_02259374
	add r5, #0x70
	add r0, r5, #0
	bl ov46_02259450
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258A32:
	bl sub_020393C8
	cmp r0, #0
	bne _02258A42
	bl sub_020397FC
	cmp r0, #0
	beq _02258A4E
_02258A42:
	add r5, #0x70
	add r0, r5, #0
	bl ov46_02259474
	mov r0, #9
	str r0, [r4]
_02258A4E:
	bl sub_020397E4
	cmp r0, #1
	bne _02258B20
	ldr r0, [r6, #4]
	bl ov45_0222B244
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258A64:
	bl sub_020393C8
	cmp r0, #0
	bne _02258A74
	bl sub_020397FC
	cmp r0, #0
	beq _02258A80
_02258A74:
	add r0, r5, #0
	add r0, #0x70
	bl ov46_02259474
	mov r0, #9
	str r0, [r4]
_02258A80:
	bl sub_02039274
	cmp r0, #0
	beq _02258B20
	add r0, r5, #0
	add r0, #0x70
	bl ov46_02259474
	ldr r0, [r5]
	bl Sav2_GameStats_get
	mov r1, #0x21
	bl GameStats_AddSpecial
	bl GF_RTC_DateTimeToSec
	ldr r2, [r6, #0xc]
	str r0, [r2]
	str r1, [r2, #4]
	mov r0, #1
	str r0, [r6, #0x10]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258AB2:
	bl sub_020393C8
	cmp r0, #0
	beq _02258ACE
	bl sub_020392D8
	add r7, r0, #0
	ldr r0, [r7]
	ldr r1, [r7, #4]
	bl ov45_0222D7CC
	str r0, [sp, #0xc]
	ldr r7, [r7]
	b _02258ADC
_02258ACE:
	bl ov45_0222E7CC
	bl ov45_0222E7FC
	add r7, r0, #0
	mov r0, #0x20
	str r0, [sp, #0xc]
_02258ADC:
	ldr r0, [r6, #4]
	bl ov45_0222B270
	add r0, r5, #0
	add r0, #0x40
	bl ov46_022593F8
	add r0, r5, #0
	add r0, #0x70
	bl ov46_022593F8
	add r0, r5, #0
	add r0, #0xa0
	add r1, r7, #0
	bl ov46_02259534
	add r5, #0xa0
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ov46_02259374
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258B0E:
	ldr r0, _02258C34 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02258B22
	bl System_GetTouchNew
	cmp r0, #1
	beq _02258B22
_02258B20:
	b _02258C28
_02258B22:
	bl sub_020393C8
	cmp r0, #0
	beq _02258B46
	bl sub_020392D8
	add r1, r0, #0
	ldmia r1!, {r0, r1}
	bl ov45_0222D7FC
	cmp r0, #0
	bne _02258B40
	mov r0, #0xb
	str r0, [r4]
	b _02258C28
_02258B40:
	mov r0, #0xe
	str r0, [r4]
	b _02258C28
_02258B46:
	mov r0, #0xb
	str r0, [r4]
	b _02258C28
_02258B4C:
	add r0, r5, #0
	add r0, #0xa0
	bl ov46_022593F8
	add r0, r5, #0
	add r0, #0x40
	mov r1, #0x58
	bl ov46_02259374
	mov r1, #0x23
	ldr r0, [r5, #0xc]
	lsl r1, r1, #4
	bl ov46_02259550
	add r5, #0xd0
	str r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258B74:
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_020168F4
	cmp r0, #1
	bne _02258B94
	add r5, #0xd0
	ldr r0, [r5]
	bl sub_02016624
	bl sub_020397C8
	mov r0, #0xd
	str r0, [r4]
	b _02258C28
_02258B94:
	cmp r0, #2
	bne _02258C28
	add r5, #0xd0
	ldr r0, [r5]
	bl sub_02016624
	mov r0, #0xe
	str r0, [r4]
	b _02258C28
_02258BA6:
	bl sub_02037D78
	cmp r0, #0
	bne _02258C28
	mov r0, #4
	str r0, [r4]
	b _02258C28
_02258BB4:
	add r0, r5, #0
	add r0, #0x40
	bl ov46_022593F8
	add r0, r5, #0
	add r0, #0x70
	bl ov46_022593F8
	add r5, #0xa0
	add r0, r5, #0
	bl ov46_022593F8
	bl sub_020397C8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258BD8:
	bl sub_02037D78
	cmp r0, #0
	bne _02258C28
	add r0, r5, #0
	add r0, #0x40
	bl ov46_022593F8
	add r5, #0x70
	add r0, r5, #0
	bl ov46_022593F8
	mov r0, #7
	str r0, [r4]
	b _02258C28
_02258BF6:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x77
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258C16:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02258C28
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02258C24:
	bl GF_AssertFail
_02258C28:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02258C30: .word 0x0000FFFF
_02258C34: .word gSystem
	thumb_func_end ov46_0225892C

	thumb_func_start ov46_02258C38
ov46_02258C38: ; 0x02258C38
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02258C68
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xd8
	str r1, [r0]
_02258C68:
	add r0, r4, #0
	add r0, #0x40
	bl ov46_02259494
	add r0, r4, #0
	add r0, #0x70
	bl ov46_02259494
	add r0, r4, #0
	add r0, #0xa0
	bl ov46_02259494
	add r0, r4, #0
	add r0, #0x10
	bl ov46_02259494
	add r0, r4, #0
	bl ov46_022592B8
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd8
	str r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x77
	bl DestroyHeap
	ldr r0, _02258CB0 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02258CB0: .word gSystem + 0x60
	thumb_func_end ov46_02258C38

	thumb_func_start ov46_02258CB4
ov46_02258CB4: ; 0x02258CB4
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x77
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, _02258D98 ; =0x00000404
	add r0, r5, #0
	mov r2, #0x77
	bl OverlayManager_CreateAndGetData
	ldr r2, _02258D98 ; =0x00000404
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0]
	mov r1, #0x77
	str r0, [r4]
	add r0, r4, #0
	bl ov46_02258F78
	mov r0, #2
	str r0, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	mov r0, #0x1b
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r4]
	mov r3, #0x32
	str r0, [sp, #0x14]
	mov r0, #0x77
	str r0, [sp, #0x18]
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x40
	mov r2, #1
	lsl r3, r3, #4
	bl ov46_022592EC
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r4]
	mov r3, #0x32
	str r0, [sp, #0x14]
	mov r0, #0x77
	str r0, [sp, #0x18]
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0xa0
	mov r2, #0
	lsl r3, r3, #4
	bl ov46_022592EC
	mov r0, #5
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #0x16
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x81
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r3, _02258D9C ; =0x0000030A
	str r0, [sp, #0x14]
	mov r0, #0x77
	str r0, [sp, #0x18]
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov46_022592EC
	add r0, r4, #0
	add r0, #0x10
	mov r1, #0x15
	bl ov46_022594E0
	bl sub_0203A880
	ldr r0, _02258DA0 ; =ov46_02258F70
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	ldr r0, _02258DA4 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_02258D98: .word 0x00000404
_02258D9C: .word 0x0000030A
_02258DA0: .word ov46_02258F70
_02258DA4: .word gSystem + 0x60
	thumb_func_end ov46_02258CB4

	thumb_func_start ov46_02258DA8
ov46_02258DA8: ; 0x02258DA8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r4, r1, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0xa
	bls _02258DC6
	b _02258EF2
_02258DC6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02258DD2: ; jump table
	.short _02258DE8 - _02258DD2 - 2 ; case 0
	.short _02258E06 - _02258DD2 - 2 ; case 1
	.short _02258E14 - _02258DD2 - 2 ; case 2
	.short _02258E4A - _02258DD2 - 2 ; case 3
	.short _02258E5A - _02258DD2 - 2 ; case 4
	.short _02258E74 - _02258DD2 - 2 ; case 5
	.short _02258E7E - _02258DD2 - 2 ; case 6
	.short _02258E9A - _02258DD2 - 2 ; case 7
	.short _02258EAE - _02258DD2 - 2 ; case 8
	.short _02258EBC - _02258DD2 - 2 ; case 9
	.short _02258EDC - _02258DD2 - 2 ; case 10
_02258DE8:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x77
	str r0, [sp, #8]
	ldr r3, _02258EF8 ; =0x0000FFFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258EF2
_02258E06:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02258EF2
	mov r0, #2
	str r0, [r4]
	b _02258EF2
_02258E14:
	add r0, r5, #0
	add r0, #0x40
	mov r1, #0x1a
	bl ov46_02259374
	bl sub_020393C8
	cmp r0, #0
	bne _02258E2E
	bl sub_020397FC
	cmp r0, #0
	beq _02258E3C
_02258E2E:
	mov r0, #5
	add r5, #0x40
	str r0, [r4]
	add r0, r5, #0
	bl ov46_02259450
	b _02258EF2
_02258E3C:
	mov r0, #3
	add r5, #0x40
	str r0, [r4]
	add r0, r5, #0
	bl ov46_02259450
	b _02258EF2
_02258E4A:
	bl ov45_0222ED7C
	mov r0, #0xe1
	lsl r0, r0, #2
	str r0, [r5, #8]
	mov r0, #4
	str r0, [r4]
	b _02258EF2
_02258E5A:
	ldr r0, [r5, #8]
	sub r0, r0, #1
	str r0, [r5, #8]
	bl ov45_0222EDA8
	cmp r0, #0
	bne _02258E6E
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02258EF2
_02258E6E:
	mov r0, #5
	str r0, [r4]
	b _02258EF2
_02258E74:
	bl sub_020397C8
	mov r0, #6
	str r0, [r4]
	b _02258EF2
_02258E7E:
	bl sub_02037D78
	cmp r0, #0
	bne _02258EF2
	add r5, #0x70
	add r0, r5, #0
	bl ov46_02259474
	ldr r0, [r6, #4]
	bl ov45_0222B270
	mov r0, #7
	str r0, [r4]
	b _02258EF2
_02258E9A:
	add r0, r5, #0
	add r0, #0x40
	mov r1, #0x1b
	bl ov46_02259374
	mov r0, #0x5a
	str r0, [r5, #8]
	mov r0, #8
	str r0, [r4]
	b _02258EF2
_02258EAE:
	ldr r0, [r5, #8]
	sub r0, r0, #1
	str r0, [r5, #8]
	bne _02258EF2
	mov r0, #9
	str r0, [r4]
	b _02258EF2
_02258EBC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x77
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258EF2
_02258EDC:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02258EF2
	add r5, #0x40
	add r0, r5, #0
	bl ov46_02259474
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02258EF2:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02258EF8: .word 0x0000FFFF
	thumb_func_end ov46_02258DA8

	thumb_func_start ov46_02258EFC
ov46_02258EFC: ; 0x02258EFC
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02258F2C
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xd8
	str r1, [r0]
_02258F2C:
	add r0, r4, #0
	add r0, #0x40
	bl ov46_02259494
	add r0, r4, #0
	add r0, #0xa0
	bl ov46_02259494
	add r0, r4, #0
	add r0, #0x10
	bl ov46_02259494
	add r0, r4, #0
	bl ov46_022592B8
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd8
	str r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x77
	bl DestroyHeap
	ldr r0, _02258F6C ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02258F6C: .word gSystem + 0x60
	thumb_func_end ov46_02258EFC

	thumb_func_start ov46_02258F70
ov46_02258F70: ; 0x02258F70
	ldr r3, _02258F74 ; =ov46_022592E0
	bx r3
	.balign 4, 0
_02258F74: .word ov46_022592E0
	thumb_func_end ov46_02258F70

	thumb_func_start ov46_02258F78
ov46_02258F78: ; 0x02258F78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	add r6, r1, #0
	ldr r0, _022591F4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _022591F8 ; =0x04001050
	strh r1, [r0]
	ldr r0, _022591FC ; =ov46_022595B4
	bl GX_SetBanks
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	ldr r0, _02259200 ; =ov46_022595A4
	bl SetBothScreensModesAndDisable
	add r0, r6, #0
	bl BgConfig_Alloc
	ldr r1, [sp, #0x10]
	ldr r4, _02259204 ; =ov46_022595DC
	ldr r5, _02259208 ; =_02259598
	str r0, [r1, #0xc]
	mov r7, #0
_02258FAE:
	ldr r0, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0xc]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5]
	mov r1, #0x20
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, #0
	add r3, r6, #0
	bl BG_ClearCharDataRange
	ldr r0, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0xc]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r7, r7, #1
	add r4, #0x1c
	add r5, r5, #4
	cmp r7, #3
	blt _02258FAE
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	lsl r0, r0, #0x18
	mov r1, #5
	lsr r4, r0, #0x18
	mov r0, #0
	lsl r1, r1, #6
	add r2, r6, #0
	bl LoadFontPal0
	mov r1, #0x12
	mov r0, #0
	lsl r1, r1, #4
	add r2, r6, #0
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r6, [sp, #4]
	ldr r0, [r0, #0xc]
	mov r1, #1
	mov r2, #0x1f
	mov r3, #0xc
	bl LoadUserFrameGfx1
	str r4, [sp]
	mov r1, #1
	ldr r0, [sp, #0x10]
	str r6, [sp, #4]
	ldr r0, [r0, #0xc]
	add r2, r1, #0
	mov r3, #0xb
	bl LoadUserFrameGfx2
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp]
	mov r2, #0
	mov r0, #0x58
	mov r1, #3
	add r3, r2, #0
	str r6, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0x58
	mov r1, #3
	mov r2, #4
	mov r3, #0
	str r6, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	mov r0, #0x58
	mov r1, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	mov r0, #0x58
	mov r1, #0xb
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	mov r0, #0x58
	mov r1, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	mov r0, #0x58
	mov r1, #0xc
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x58
	add r1, r6, #0
	bl NARC_ctor
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	mov r2, #0x33
	add r0, #0xd4
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	ldr r0, [sp, #0x2c]
	mov r1, #5
	add r2, sp, #0x38
	add r3, r6, #0
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	add r4, r0, #0
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	add r1, #0xdc
	mov r2, #0x80
	bl MIi_CpuCopy16
	ldr r0, [sp, #0x38]
	mov r2, #0x57
	ldr r1, [sp, #0x10]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	mov r1, #0x57
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, #0xdc
	str r0, [sp, #0x14]
_02259126:
	mov r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	lsl r1, r0, #5
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x30]
_02259138:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _02259142
	bl GF_AssertFail
_02259142:
	ldr r0, [sp, #0x30]
	mov r7, #1
	add r6, r0, #2
	ldr r0, [sp, #0x18]
	add r4, r0, #2
	ldr r0, [sp, #0x14]
	add r5, r0, #2
	ldr r0, [sp, #0x20]
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x34]
_0225915A:
	add r0, r6, #0
	add r0, #0xdc
	ldrh r0, [r0]
	ldr r3, [sp, #0x34]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	mov r2, #1
	bl sub_02003DE8
	add r7, r7, #1
	add r6, r6, #2
	add r4, r4, #2
	add r5, r5, #2
	cmp r7, #0x10
	blt _0225915A
	ldr r0, [sp, #0x18]
	add r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _022591A6
	mov r0, #3
	ldr r1, [sp, #0x20]
	lsl r0, r0, #8
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02259138
	str r0, [sp, #0x20]
	mov r0, #1
	str r0, [sp, #0x1c]
	b _02259138
_022591A6:
	ldr r0, [sp, #0x14]
	add r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02259126
	mov r1, #0x57
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0x2a
	lsl r1, r1, #4
	bl DC_FlushRange
	ldr r0, [sp, #0x10]
	mov r1, #1
	add r0, #0xd8
	str r1, [r0]
	ldr r0, [sp, #0x10]
	mov r2, #0
	lsl r1, r1, #0xa
	str r2, [r0, r1]
	ldr r1, [sp, #0x10]
	ldr r0, _0225920C ; =ov46_02259210
	add r1, #0xd4
	mov r2, #0x14
	bl sub_0200E33C
	ldr r1, [sp, #0x10]
	add r1, #0xd4
	str r0, [r1]
	ldr r0, [sp, #0x2c]
	str r1, [sp, #0x10]
	bl NARC_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022591F4: .word 0x04000050
_022591F8: .word 0x04001050
_022591FC: .word ov46_022595B4
_02259200: .word ov46_022595A4
_02259204: .word ov46_022595DC
_02259208: .word _02259598
_0225920C: .word ov46_02259210
	thumb_func_end ov46_02258F78

	thumb_func_start ov46_02259210
ov46_02259210: ; 0x02259210
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022592AE
	ldr r1, _022592B0 ; =0x0000032B
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _022592AE
	add r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _02259246
	sub r0, r1, #3
	ldrsh r0, [r4, r0]
	add r2, r4, #0
	add r2, #0x88
	lsl r0, r0, #5
	add r0, r2, r0
	mov r1, #0
	mov r2, #0x20
	bl GX_LoadBGPltt
_02259246:
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02259254
	cmp r0, #2
	bne _0225926A
_02259254:
	mov r0, #0xca
	lsl r0, r0, #2
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x88
	lsl r0, r0, #5
	add r0, r1, r0
	mov r1, #0
	mov r2, #0x20
	bl GXS_LoadBGPltt
_0225926A:
	ldr r0, _022592B4 ; =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _02259292
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _022592AE
	mov r2, #0x13
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	mov r1, #1
	eor r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_02259292:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _022592AE
	mov r2, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eor r1, r2
	strb r1, [r4, r0]
_022592AE:
	pop {r4, pc}
	.balign 4, 0
_022592B0: .word 0x0000032B
_022592B4: .word 0x0000032A
	thumb_func_end ov46_02259210

	thumb_func_start ov46_022592B8
ov46_022592B8: ; 0x022592B8
	push {r4, r5, r6, lr}
	ldr r5, _022592DC ; =_02259598
	add r6, r0, #0
	mov r4, #0
_022592C0:
	ldr r1, [r5]
	ldr r0, [r6, #0xc]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _022592C0
	ldr r0, [r6, #0xc]
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022592DC: .word _02259598
	thumb_func_end ov46_022592B8

	thumb_func_start ov46_022592E0
ov46_022592E0: ; 0x022592E0
	ldr r3, _022592E8 ; =BgConfig_HandleScheduledScrollAndTransferOps
	ldr r0, [r0, #0xc]
	bx r3
	nop
_022592E8: .word BgConfig_HandleScheduledScrollAndTransferOps
	thumb_func_end ov46_022592E0

	thumb_func_start ov46_022592EC
ov46_022592EC: ; 0x022592EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x48]
	add r5, r0, #0
	str r3, [sp, #0x14]
	add r0, r4, #0
	add r7, r1, #0
	add r6, r2, #0
	bl ScrStrBufs_new
	str r0, [r5]
	ldr r2, [sp, #0x14]
	mov r0, #0
	mov r1, #0x1b
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [r5, #4]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0x18]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x44]
	str r6, [r5, #0x20]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	str r0, [r5, #0x28]
	mov r0, #0
	str r0, [r5, #0x2c]
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x38]
	add r5, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	lsl r3, r3, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	add r1, r5, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r7, #0
	mov r2, #1
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov46_022592EC

	thumb_func_start ov46_02259374
ov46_02259374: ; 0x02259374
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x2c]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02259394
	ldr r0, [r5, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_02259394:
	add r0, r5, #0
	add r0, #8
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x1c]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5]
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x1c]
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x18]
	add r0, #8
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r0, [r5, #0x20]
	cmp r0, #0
	bne _022593DE
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	mov r2, #0x1f
	mov r3, #0xc
	bl DrawFrameAndWindow1
	b _022593EC
_022593DE:
	add r0, r5, #0
	mov r1, #1
	add r0, #8
	add r2, r1, #0
	mov r3, #0xb
	bl DrawFrameAndWindow2
_022593EC:
	add r5, #8
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov46_02259374

	thumb_func_start ov46_022593F8
ov46_022593F8: ; 0x022593F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02259414
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_02259414:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _0225942E
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl sub_0200E5D4
	add r4, #8
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
_0225942E:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0225943A
	add r0, r4, #0
	bl ov46_02259474
_0225943A:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #8
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov46_022593F8

	thumb_func_start ov46_02259450
ov46_02259450: ; 0x02259450
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _02259470
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02259464
	bl GF_AssertFail
_02259464:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl sub_0200F0AC
	str r0, [r4, #0x24]
_02259470:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov46_02259450

	thumb_func_start ov46_02259474
ov46_02259474: ; 0x02259474
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _02259492
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02259488
	bl GF_AssertFail
_02259488:
	ldr r0, [r4, #0x24]
	bl sub_0200F450
	mov r0, #0
	str r0, [r4, #0x24]
_02259492:
	pop {r4, pc}
	thumb_func_end ov46_02259474

	thumb_func_start ov46_02259494
ov46_02259494: ; 0x02259494
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _022594B0
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_022594B0:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _022594BC
	add r0, r4, #0
	bl ov46_02259474
_022594BC:
	add r0, r4, #0
	add r0, #8
	bl RemoveWindow
	ldr r0, [r4, #0x1c]
	bl String_dtor
	ldr r0, [r4, #0x18]
	bl String_dtor
	ldr r0, [r4, #4]
	bl DestroyMsgData
	ldr r0, [r4]
	bl ScrStrBufs_delete
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov46_02259494

	thumb_func_start ov46_022594E0
ov46_022594E0: ; 0x022594E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r0, #8
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x1c]
	add r1, r5, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r4, #0x18]
	add r2, r0, #0
	mov r3, #0xb0
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	ldr r0, _02259530 ; =0x000F0E00
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x18]
	add r0, #8
	mov r1, #1
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02259530: .word 0x000F0E00
	thumb_func_end ov46_022594E0

	thumb_func_start ov46_02259534
ov46_02259534: ; 0x02259534
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #2
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov46_02259534

	thumb_func_start ov46_02259550
ov46_02259550: ; 0x02259550
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x77
	add r4, r1, #0
	bl sub_0201660C
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0xd
	str r1, [sp, #0xc]
	str r5, [sp]
	str r4, [sp, #8]
	mov r1, #0x19
	add r2, sp, #0
	strb r1, [r2, #0x10]
	mov r1, #0xa
	strb r1, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf
	add r6, r0, #0
	bic r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf0
	bic r3, r1
	strb r3, [r2, #0x12]
	mov r1, #0
	strb r1, [r2, #0x13]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r6, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov46_02259550

	.rodata

_02259598:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00

ov46_022595A4: ; 0x022595A4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov46_022595B4: ; 0x022595B4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov46_022595DC: ; 0x022595DC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
