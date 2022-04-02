	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov84_0223DD60
ov84_0223DD60: ; 0x0223DD60
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r6, r1, #0
	ldr r0, _0223DEAC ; =FS_OVERLAY_ID(OVY_80)
	mov r1, #2
	bl HandleLoadOverlay
	bl ov84_0223E5C4
	mov r2, #2
	mov r0, #3
	mov r1, #0x6e
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0xf3
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x6e
	bl OverlayManager_CreateAndGetData
	mov r2, #0xf3
	mov r1, #0
	lsl r2, r2, #2
	add r5, r0, #0
	bl memset
	mov r0, #0x6e
	bl BgConfig_Alloc
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	str r4, [r5]
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	add r0, r5, #0
	ldr r1, [r4]
	add r0, #0xdc
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl sub_02030E88
	add r1, r5, #0
	add r1, #0xe0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl sub_02030FA0
	add r1, r5, #0
	add r1, #0xe4
	str r0, [r1]
	ldrb r0, [r4, #4]
	strb r0, [r5, #9]
	ldrh r0, [r4, #0x1e]
	strh r0, [r5, #0x2a]
	ldrh r0, [r4, #0x1c]
	strh r0, [r5, #0x28]
	ldrh r1, [r4, #0x18]
	ldr r0, _0223DEB0 ; =0x000003C2
	strh r1, [r5, r0]
	ldrb r1, [r4, #7]
	sub r0, #0x62
	strb r1, [r5, #0x12]
	add r1, r4, #0
	add r1, #0x38
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r5, #0
	add r1, #0xd8
	str r0, [r1]
	mov r0, #0xd9
	ldr r1, [r4, #0x30]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [r4, #0x34]
	add r0, r0, #4
	str r1, [r5, r0]
	mov r0, #0xff
	strb r0, [r5, #0xe]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl sub_0203107C
	str r0, [r5, #4]
	mov r0, #0xd7
	ldr r1, [r4, #8]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [r4, #0xc]
	add r0, #0x28
	str r1, [r5, #0x1c]
	ldr r1, [r4, #0x10]
	str r1, [r5, #0x20]
	ldr r1, [r4, #0x14]
	add r4, #0x42
	str r1, [r5, #0x24]
	str r0, [r5, #0x18]
	ldrb r0, [r4]
	strb r0, [r5, #0xc]
	mov r2, #0
	mov r1, #0x20
_0223DE42:
	add r0, r5, r2
	add r0, #0x44
	add r2, r2, #1
	strb r1, [r0]
	cmp r2, #0x20
	blt _0223DE42
	add r0, r5, #0
	mov r1, #4
	add r0, #0x2c
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x2d
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0x10
	add r0, #0x2e
	strb r1, [r0]
	mov r0, #0xf
	mov r1, #0
	lsl r0, r0, #6
	strb r1, [r5, r0]
	add r0, r5, #0
	bl ov84_0223EDA0
	ldr r1, [r5, #0x24]
	strh r0, [r1]
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1c
	sub r1, r1, r2
	mov r0, #0x1c
	ror r1, r0
	add r0, r2, r1
	strh r0, [r5, #0x16]
	add r0, r5, #0
	bl ov84_0223E5FC
	ldrb r0, [r5, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223DE9E
	add r0, r5, #0
	bl sub_02096910
_0223DE9E:
	mov r1, #0
	ldr r0, _0223DEB4 ; =_0223FA20
	str r1, [r6]
	strb r1, [r0]
	strb r1, [r0, #1]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223DEAC: .word FS_OVERLAY_ID(OVY_80)
_0223DEB0: .word 0x000003C2
_0223DEB4: .word _0223FA20
	thumb_func_end ov84_0223DD60

	thumb_func_start ov84_0223DEB8
ov84_0223DEB8: ; 0x0223DEB8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldrb r1, [r4, #0xe]
	cmp r1, #0xff
	beq _0223DEEA
	ldr r1, [r5]
	cmp r1, #1
	bne _0223DEEA
	bl ov84_0223F28C
	add r0, r4, #0
	add r0, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r4, #0xe]
	bl ov84_0223EC88
	strb r0, [r4, #0x14]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov84_0223EBE0
_0223DEEA:
	ldr r0, [r5]
	cmp r0, #4
	bhi _0223DF9C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223DEFC: ; jump table
	.short _0223DF06 - _0223DEFC - 2 ; case 0
	.short _0223DF1C - _0223DEFC - 2 ; case 1
	.short _0223DF62 - _0223DEFC - 2 ; case 2
	.short _0223DF78 - _0223DEFC - 2 ; case 3
	.short _0223DF8E - _0223DEFC - 2 ; case 4
_0223DF06:
	add r0, r4, #0
	bl ov84_0223E030
	cmp r0, #1
	bne _0223DF9C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF1C:
	add r0, r4, #0
	bl ov84_0223E1A8
	cmp r0, #1
	bne _0223DF9C
	add r0, r4, #0
	add r0, #0x2f
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	cmp r0, #1
	bne _0223DF40
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF40:
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223DF56
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF56:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF62:
	add r0, r4, #0
	bl ov84_0223E384
	cmp r0, #1
	bne _0223DF9C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF78:
	add r0, r4, #0
	bl ov84_0223E418
	cmp r0, #1
	bne _0223DF9C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF8E:
	add r0, r4, #0
	bl ov84_0223E470
	cmp r0, #1
	bne _0223DF9C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223DF9C:
	ldrb r3, [r4, #0x13]
	add r1, r4, #0
	mov r2, #0xfe
	add r0, r3, #0
	lsl r3, r3, #0x18
	lsr r3, r3, #0x19
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x19
	bic r0, r2
	lsr r3, r3, #0x18
	orr r0, r3
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0x13]
	add r1, #0x13
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	cmp r0, #4
	blo _0223DFE4
	ldrb r0, [r1]
	bic r0, r2
	strb r0, [r1]
	ldrb r3, [r1]
	mov r2, #1
	add r0, r3, #0
	bic r0, r2
	lsl r2, r3, #0x1f
	lsr r2, r2, #0x1f
	mov r3, #1
	eor r2, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	and r2, r3
	orr r0, r2
	strb r0, [r1]
_0223DFE4:
	add r4, #0xe8
	ldr r0, [r4]
	bl sub_0202457C
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223DEB8

	thumb_func_start ov84_0223DFF0
ov84_0223DFF0: ; 0x0223DFF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0x36
	lsl r0, r0, #4
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, r0]
	strh r1, [r0]
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov84_0223E4B8
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x6e
	bl DestroyHeap
	ldr r0, _0223E02C ; =FS_OVERLAY_ID(OVY_80)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223E02C: .word FS_OVERLAY_ID(OVY_80)
	thumb_func_end ov84_0223DFF0

	thumb_func_start ov84_0223E030
ov84_0223E030: ; 0x0223E030
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #9
	bhi _0223E094
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E048: ; jump table
	.short _0223E05C - _0223E048 - 2 ; case 0
	.short _0223E080 - _0223E048 - 2 ; case 1
	.short _0223E0AA - _0223E048 - 2 ; case 2
	.short _0223E0B6 - _0223E048 - 2 ; case 3
	.short _0223E0C2 - _0223E048 - 2 ; case 4
	.short _0223E0CE - _0223E048 - 2 ; case 5
	.short _0223E0F2 - _0223E048 - 2 ; case 6
	.short _0223E11A - _0223E048 - 2 ; case 7
	.short _0223E15A - _0223E048 - 2 ; case 8
	.short _0223E194 - _0223E048 - 2 ; case 9
_0223E05C:
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223E078
	bl sub_02037BEC
	mov r0, #0xc7
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E078:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E080:
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223E0A2
	mov r0, #0xc7
	bl sub_02037B38
	cmp r0, #1
	beq _0223E096
_0223E094:
	b _0223E1A2
_0223E096:
	bl sub_02037BEC
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0A2:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0AA:
	bl ov84_0223EE74
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0B6:
	bl ov84_0223EFE0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0C2:
	bl ov84_0223F094
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0CE:
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223E0EA
	bl sub_02037BEC
	mov r0, #0xc9
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0EA:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0F2:
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223E112
	mov r0, #0xc9
	bl sub_02037B38
	cmp r0, #1
	bne _0223E1A2
	bl sub_02037BEC
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E112:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E11A:
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223E13A
	add r0, r4, #0
	mov r1, #0x1e
	mov r2, #0
	bl ov84_0223ECBC
	cmp r0, #1
	bne _0223E1A2
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E13A:
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E15A:
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #1
	bne _0223E18C
	ldrb r0, [r4, #0xf]
	cmp r0, #2
	blo _0223E1A2
	mov r0, #0
	strb r0, [r4, #0xf]
	mov r1, #6
	str r1, [sp]
	mov r1, #3
	str r1, [sp, #4]
	mov r1, #0x6e
	str r1, [sp, #8]
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E18C:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E194:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223E1A2
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0223E1A2:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov84_0223E030

	thumb_func_start ov84_0223E1A8
ov84_0223E1A8: ; 0x0223E1A8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #8
	bhi _0223E246
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E1BE: ; jump table
	.short _0223E1D0 - _0223E1BE - 2 ; case 0
	.short _0223E1E4 - _0223E1BE - 2 ; case 1
	.short _0223E1FA - _0223E1BE - 2 ; case 2
	.short _0223E23A - _0223E1BE - 2 ; case 3
	.short _0223E274 - _0223E1BE - 2 ; case 4
	.short _0223E2AC - _0223E1BE - 2 ; case 5
	.short _0223E2FC - _0223E1BE - 2 ; case 6
	.short _0223E352 - _0223E1BE - 2 ; case 7
	.short _0223E362 - _0223E1BE - 2 ; case 8
_0223E1D0:
	mov r1, #0
	strb r1, [r4, #0xb]
	ldrh r1, [r4, #0x16]
	strb r1, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	bl ov84_0223EC4C
	mov r0, #1
	strb r0, [r4, #8]
	b _0223E372
_0223E1E4:
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0xa
	blo _0223E246
	mov r0, #0
	strb r0, [r4, #0xb]
	mov r0, #2
	strb r0, [r4, #8]
	b _0223E372
_0223E1FA:
	mov r7, #0xb6
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_0223E202:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E21A
	mov r1, #0x20
	bl ov84_0223F878
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov84_0223F82C
_0223E21A:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x10
	blt _0223E202
	add r0, r4, #0
	mov r1, #3
	bl ov84_0223EB08
	ldr r0, _0223E378 ; =0x00000608
	bl PlaySE
	mov r0, #0x18
	strb r0, [r4, #0xb]
	mov r0, #3
	strb r0, [r4, #8]
	b _0223E372
_0223E23A:
	ldrb r0, [r4, #0xb]
	sub r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0223E248
_0223E246:
	b _0223E372
_0223E248:
	mov r7, #0xb6
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_0223E250:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E25C
	mov r1, #0x21
	bl ov84_0223F878
_0223E25C:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x10
	blt _0223E250
	ldr r0, _0223E378 ; =0x00000608
	bl PlaySE
	mov r0, #0x18
	strb r0, [r4, #0xb]
	mov r0, #4
	strb r0, [r4, #8]
	b _0223E372
_0223E274:
	ldrb r0, [r4, #0xb]
	sub r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E372
	mov r7, #0xb6
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_0223E288:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E294
	mov r1, #0x22
	bl ov84_0223F878
_0223E294:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x10
	blt _0223E288
	ldr r0, _0223E378 ; =0x00000608
	bl PlaySE
	mov r0, #0x18
	strb r0, [r4, #0xb]
	mov r0, #5
	strb r0, [r4, #8]
	b _0223E372
_0223E2AC:
	ldrb r0, [r4, #0xb]
	sub r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E372
	mov r7, #0xb6
	mov r5, #0
	add r6, r4, #0
	lsl r7, r7, #2
_0223E2C0:
	ldr r0, [r6, r7]
	cmp r0, #0
	beq _0223E2D0
	add r1, r4, r5
	add r1, #0x34
	ldrb r1, [r1]
	bl ov84_0223F878
_0223E2D0:
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, #0x10
	blt _0223E2C0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov84_0223F82C
	ldr r0, _0223E37C ; =0x00000623
	bl PlaySE
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov84_0223F878
	mov r0, #6
	strb r0, [r4, #8]
	b _0223E372
_0223E2FC:
	ldr r1, _0223E380 ; =gSystem
	ldr r1, [r1, #0x48]
	bl ov84_0223EBE8
	bl sub_0203769C
	cmp r0, #0
	bne _0223E316
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ble _0223E316
	sub r0, r0, #1
	str r0, [r4, #0x18]
_0223E316:
	add r0, r4, #0
	bl ov84_0223F26C
	cmp r0, #1
	beq _0223E326
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0223E372
_0223E326:
	add r0, r4, #0
	bl ov84_0223EC80
	ldrb r0, [r4, #9]
	bl ov80_02238374
	cmp r0, #0
	bne _0223E33C
	mov r0, #7
	strb r0, [r4, #8]
	b _0223E372
_0223E33C:
	add r0, r4, #0
	add r0, #0x2f
	ldrb r1, [r0]
	mov r0, #0xfe
	add r4, #0x2f
	bic r1, r0
	mov r0, #2
	orr r0, r1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E352:
	ldrb r1, [r4, #0xd]
	bl ov84_0223EE24
	mov r0, #0x1e
	strb r0, [r4, #0xb]
	mov r0, #8
	strb r0, [r4, #8]
	b _0223E372
_0223E362:
	ldrb r0, [r4, #0xb]
	sub r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E372
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E372:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223E378: .word 0x00000608
_0223E37C: .word 0x00000623
_0223E380: .word gSystem
	thumb_func_end ov84_0223E1A8

	thumb_func_start ov84_0223E384
ov84_0223E384: ; 0x0223E384
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #4
	bhi _0223E414
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223E39A: ; jump table
	.short _0223E3A4 - _0223E39A - 2 ; case 0
	.short _0223E3C8 - _0223E39A - 2 ; case 1
	.short _0223E3CE - _0223E39A - 2 ; case 2
	.short _0223E3E6 - _0223E39A - 2 ; case 3
	.short _0223E3F8 - _0223E39A - 2 ; case 4
_0223E3A4:
	ldrb r2, [r4, #0x14]
	mov r1, #0x1f
	bl ov84_0223ECBC
	cmp r0, #1
	bne _0223E414
	add r0, r4, #0
	add r0, #0x2f
	ldrb r1, [r0]
	mov r0, #0xfe
	bic r1, r0
	add r0, r4, #0
	add r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3C8:
	add r0, r1, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3CE:
	ldrb r1, [r4, #0xe]
	cmp r1, #0xff
	beq _0223E414
	mov r1, #0
	strb r1, [r4, #0xf]
	ldrb r1, [r4, #0xe]
	bl ov84_0223EE24
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3E6:
	bl sub_02037BEC
	mov r0, #0x97
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3F8:
	mov r0, #0x97
	bl sub_02037B38
	cmp r0, #1
	bne _0223E414
	bl sub_02037BEC
	mov r0, #0x6e
	bl sub_020379A0
	mov r0, #0xff
	strb r0, [r4, #0xe]
	mov r0, #1
	pop {r4, pc}
_0223E414:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov84_0223E384

	thumb_func_start ov84_0223E418
ov84_0223E418: ; 0x0223E418
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0223E42C
	cmp r0, #1
	beq _0223E438
	cmp r0, #2
	beq _0223E45A
	b _0223E46C
_0223E42C:
	mov r0, #0xf
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E46C
_0223E438:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0223E442
	sub r0, r0, #1
	strb r0, [r4, #0xb]
_0223E442:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E46C
	bl sub_02037BEC
	mov r0, #0x98
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E46C
_0223E45A:
	mov r0, #0x98
	bl sub_02037B38
	cmp r0, #1
	bne _0223E46C
	bl sub_02037BEC
	mov r0, #1
	pop {r4, pc}
_0223E46C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov84_0223E418

	thumb_func_start ov84_0223E470
ov84_0223E470: ; 0x0223E470
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0223E482
	cmp r0, #1
	beq _0223E4A2
	b _0223E4B0
_0223E482:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E4B0
_0223E4A2:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223E4B0
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0223E4B0:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov84_0223E470

	thumb_func_start ov84_0223E4B8
ov84_0223E4B8: ; 0x0223E4B8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223E4CA
	bl ov84_0223F818
_0223E4CA:
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223E4D8
	bl ov84_0223F818
_0223E4D8:
	mov r7, #0xb6
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0223E4E0:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E4EA
	bl ov84_0223F818
_0223E4EA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _0223E4E0
	ldrb r0, [r6, #9]
	mov r1, #1
	bl ov80_022380E8
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _0223E544
	add r4, r6, #0
_0223E504:
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E512
	bl ov84_0223F818
_0223E512:
	mov r0, #0xca
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E520
	bl ov84_0223F818
_0223E520:
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E52E
	bl ov84_0223F818
_0223E52E:
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E53C
	bl ov84_0223F818
_0223E53C:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r7
	blt _0223E504
_0223E544:
	bl sub_0203A914
	add r0, r6, #0
	add r0, #0xd4
	ldr r0, [r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	add r0, r6, #0
	add r0, #0xd4
	ldr r0, [r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	add r0, r6, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl sub_02003104
	add r0, r6, #0
	mov r1, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xe8
	bl ov84_0223F418
	ldr r0, [r6, #0x68]
	bl DestroyMsgData
	ldr r0, [r6, #0x6c]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x70]
	bl String_dtor
	ldr r0, [r6, #0x74]
	bl String_dtor
	mov r5, #0
	add r4, r6, #0
_0223E596:
	ldr r0, [r4, #0x78]
	bl String_dtor
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #2
	blt _0223E596
	add r0, r6, #0
	add r0, #0x94
	bl ov84_0223F8E4
	add r0, r6, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov84_0223E958
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl NARC_dtor
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov84_0223E4B8

	thumb_func_start ov84_0223E5C4
ov84_0223E5C4: ; 0x0223E5C4
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0223E5F4 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0223E5F8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0223E5F4: .word 0xFFFFE0FF
_0223E5F8: .word 0x04001000
	thumb_func_end ov84_0223E5C4

	thumb_func_start ov84_0223E5FC
ov84_0223E5FC: ; 0x0223E5FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x18]
	mov r0, #0xb7
	mov r1, #0x6e
	bl NARC_ctor
	mov r2, #0xdb
	ldr r1, [sp, #0x18]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add r0, r1, #0
	bl ov84_0223E8DC
	ldr r0, [sp, #0x18]
	bl ov84_0223E934
	ldr r2, _0223E8D4 ; =0x000001A9
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x6e
	bl NewMsgDataFromNarc
	ldr r1, [sp, #0x18]
	str r0, [r1, #0x68]
	mov r0, #0x6e
	bl ScrStrBufs_new
	ldr r1, [sp, #0x18]
	str r0, [r1, #0x6c]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x6e
	bl String_ctor
	ldr r1, [sp, #0x18]
	str r0, [r1, #0x70]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x6e
	bl String_ctor
	ldr r1, [sp, #0x18]
	mov r4, #0
	str r0, [r1, #0x74]
	add r5, r1, #0
	mov r6, #0x20
	mov r7, #0x6e
_0223E65C:
	add r0, r6, #0
	add r1, r7, #0
	bl String_ctor
	str r0, [r5, #0x78]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0223E65C
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x6e
	bl LoadFontPal0
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x6e
	bl LoadFontPal1
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, #0x90
	ldr r0, [r0]
	add r1, #0x94
	bl ov84_0223F8B4
	mov r0, #0x23
	str r0, [sp]
	mov r0, #0x44
	str r0, [sp, #4]
	mov r0, #0x24
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x14]
	mov r1, #1
	add r0, #0xe8
	add r2, r1, #0
	add r3, r1, #0
	bl ov84_0223F7A0
	mov r2, #0xb5
	ldr r1, [sp, #0x18]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add r0, r1, #0
	ldr r0, [r0, r2]
	mov r1, #0
	bl ov84_0223F82C
	ldr r4, [sp, #0x18]
	mov r5, #0
	add r6, r4, #0
	mov r7, #0x20
	add r6, #0xe8
_0223E6D4:
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r1, r2, r1
	mov r0, #0x28
	mul r0, r1
	add r0, #0x44
	lsl r0, r0, #0x10
	str r7, [sp]
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	asr r0, r5, #1
	lsr r0, r0, #0x1e
	add r0, r5, r0
	asr r1, r0, #2
	mov r0, #0x28
	mul r0, r1
	mov r1, #1
	add r0, #0x24
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov84_0223F7A0
	mov r1, #0xb6
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov84_0223F82C
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x10
	blt _0223E6D4
	ldr r0, [sp, #0x18]
	mov r1, #1
	ldrb r0, [r0, #9]
	bl ov80_022380E8
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, #9]
	bl ov80_02238374
	cmp r0, #0
	bne _0223E752
	mov r0, #0x32
	mov r7, #0x2e
	str r0, [sp, #0x20]
	b _0223E758
_0223E752:
	mov r0, #0x1a
	mov r7, #0x16
	str r0, [sp, #0x20]
_0223E758:
	ldr r0, [sp, #0x1c]
	mov r5, #0
	cmp r0, #0
	bgt _0223E762
	b _0223E87C
_0223E762:
	ldr r4, [sp, #0x18]
	add r6, r4, #0
	add r6, #0xe8
_0223E768:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov84_0223F7A0
	mov r1, #0xce
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r1, #2
	mov r0, #0
	str r0, [sp]
	mov r0, #0xf6
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	add r2, r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r3, r1, #0
	bl ov84_0223F7A0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #0
	mov r2, #3
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r1, r5, #3
	add r3, r2, #0
	bl ov84_0223F7A0
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #0xee
	str r0, [sp, #4]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #0
	mov r2, #3
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r1, r5, #7
	add r3, r2, #0
	bl ov84_0223F7A0
	mov r1, #0xca
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xd9
	ldr r1, [sp, #0x18]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov84_0223F894
	mov r0, #0xda
	ldr r1, [sp, #0x18]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	mov r0, #0xca
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov84_0223F894
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov84_0223F8A8
	mov r0, #0xca
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov84_0223F8A8
	ldr r0, [sp, #0x20]
	add r5, r5, #1
	add r0, #0x28
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r4, r4, #4
	add r7, #0x28
	cmp r5, r0
	bge _0223E87C
	b _0223E768
_0223E87C:
	ldr r0, [sp, #0x18]
	bl ov84_0223F1BC
	mov r1, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	mov r0, #0x60
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r2, r1, #0
	add r0, #0xe8
	add r3, r1, #0
	bl ov84_0223F7A0
	mov r2, #0xd6
	ldr r1, [sp, #0x18]
	lsl r2, r2, #2
	str r0, [r1, r2]
	bl sub_02037474
	cmp r0, #0
	beq _0223E8C6
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	bl sub_0203A880
_0223E8C6:
	ldr r0, _0223E8D8 ; =ov84_0223E98C
	ldr r1, [sp, #0x18]
	bl Main_SetVBlankIntrCB
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0223E8D4: .word 0x000001A9
_0223E8D8: .word ov84_0223E98C
	thumb_func_end ov84_0223E5FC

	thumb_func_start ov84_0223E8DC
ov84_0223E8DC: ; 0x0223E8DC
	push {r4, lr}
	add r4, r0, #0
	bl ov84_0223E9C4
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov84_0223E9E4
	mov r0, #0x6e
	bl sub_020030E8
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xd4
	mov r1, #2
	ldr r0, [r0]
	lsl r2, r1, #8
	mov r3, #0x6e
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	add r0, #0xd4
	mov r2, #2
	ldr r0, [r0]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x6e
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	mov r1, #3
	bl ov84_0223EAAC
	bl ov84_0223EB44
	add r0, r4, #0
	mov r1, #4
	bl ov84_0223EB78
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov84_0223E8DC

	thumb_func_start ov84_0223E934
ov84_0223E934: ; 0x0223E934
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	bl ov80_02238374
	add r3, r0, #0
	mov r2, #0xd9
	lsl r2, r2, #2
	ldr r1, [r4, r2]
	add r2, r2, #4
	add r0, r4, #0
	lsl r3, r3, #0x18
	ldr r2, [r4, r2]
	add r0, #0xe8
	lsr r3, r3, #0x18
	bl ov84_0223F2B4
	pop {r4, pc}
	thumb_func_end ov84_0223E934

	thumb_func_start ov84_0223E958
ov84_0223E958: ; 0x0223E958
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov84_0223E958

	thumb_func_start ov84_0223E98C
ov84_0223E98C: ; 0x0223E98C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _0223E99C
	bl sub_0200398C
_0223E99C:
	add r4, #0x90
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _0223E9BC ; =0x027E0000
	ldr r1, _0223E9C0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0223E9BC: .word 0x027E0000
_0223E9C0: .word 0x00003FF8
	thumb_func_end ov84_0223E98C

	thumb_func_start ov84_0223E9C4
ov84_0223E9C4: ; 0x0223E9C4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0223E9E0 ; =ov84_0223F9BC
	add r3, sp, #0
	mov r2, #5
_0223E9CE:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0223E9CE
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0223E9E0: .word ov84_0223F9BC
	thumb_func_end ov84_0223E9C4

	thumb_func_start ov84_0223E9E4
ov84_0223E9E4: ; 0x0223E9E4
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _0223EA98 ; =ov84_0223F924
	add r3, sp, #0x54
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0223EA9C ; =ov84_0223F964
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6e
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223EAA0 ; =ov84_0223F980
	add r3, sp, #0x1c
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223EAA4 ; =ov84_0223F948
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r1, _0223EAA8 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x64
	pop {r4, r5, pc}
	.balign 4, 0
_0223EA98: .word ov84_0223F924
_0223EA9C: .word ov84_0223F964
_0223EAA0: .word ov84_0223F980
_0223EAA4: .word ov84_0223F948
_0223EAA8: .word 0x04000008
	thumb_func_end ov84_0223E9E4

	thumb_func_start ov84_0223EAAC
ov84_0223EAAC: ; 0x0223EAAC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6e
	str r0, [sp, #0xc]
	mov r0, #0xdb
	add r2, r5, #0
	lsl r0, r0, #2
	add r2, #0x90
	ldr r0, [r5, r0]
	ldr r2, [r2]
	mov r1, #0x7c
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldrb r0, [r5, #9]
	bl ov80_02238374
	cmp r0, #0
	bne _0223EAE4
	mov r1, #0x78
	b _0223EAE6
_0223EAE4:
	mov r1, #0x7a
_0223EAE6:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r5, #0x90
	ldr r2, [r5]
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223EAAC

	thumb_func_start ov84_0223EB08
ov84_0223EB08: ; 0x0223EB08
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #9]
	add r4, r1, #0
	bl ov80_02238374
	cmp r0, #0
	bne _0223EB1E
	mov r1, #0x79
	b _0223EB20
_0223EB1E:
	mov r1, #0x7b
_0223EB20:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r5, #0x90
	ldr r2, [r5]
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov84_0223EB08

	thumb_func_start ov84_0223EB44
ov84_0223EB44: ; 0x0223EB44
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xb7
	mov r1, #0xba
	add r2, sp, #0
	mov r3, #0x6e
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0xe0
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r2, #0xe0
	bl GX_LoadBGPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov84_0223EB44

	thumb_func_start ov84_0223EB78
ov84_0223EB78: ; 0x0223EB78
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6e
	str r0, [sp, #0xc]
	mov r0, #0xdb
	add r2, r5, #0
	lsl r0, r0, #2
	add r2, #0x90
	ldr r0, [r5, r0]
	ldr r2, [r2]
	mov r1, #0x7e
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0x6e
	str r0, [sp, #4]
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xbb
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r5, #0x90
	ldr r2, [r5]
	mov r1, #0x7d
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov84_0223EB78

	thumb_func_start ov84_0223EBE0
ov84_0223EBE0: ; 0x0223EBE0
	mov r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov84_0223EBE0

	thumb_func_start ov84_0223EBE8
ov84_0223EBE8: ; 0x0223EBE8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldrb r1, [r0]
	ldrb r0, [r4, #0x10]
	lsl r1, r1, #1
	add r0, r0, #1
	strb r0, [r4, #0x10]
	ldr r0, _0223EC44 ; =ov84_0223F913
	ldrb r2, [r4, #0x10]
	ldrb r0, [r0, r1]
	cmp r2, r0
	blo _0223EC42
	mov r0, #0
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _0223EC1E
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1c
	sub r1, r1, r2
	mov r0, #0x1c
	ror r1, r0
	add r0, r2, r1
	b _0223EC22
_0223EC1E:
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
_0223EC22:
	strb r0, [r4, #0xd]
	ldr r0, _0223EC48 ; =0x000005E5
	bl PlaySE
	add r0, r4, #0
	add r0, #0x2e
	ldrb r1, [r4, #0xd]
	ldrb r0, [r0]
	cmp r1, r0
	blo _0223EC3A
	mov r0, #0
	strb r0, [r4, #0xd]
_0223EC3A:
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	bl ov84_0223EC4C
_0223EC42:
	pop {r4, pc}
	.balign 4, 0
_0223EC44: .word ov84_0223F913
_0223EC48: .word 0x000005E5
	thumb_func_end ov84_0223EBE8

	thumb_func_start ov84_0223EC4C
ov84_0223EC4C: ; 0x0223EC4C
	push {r4, lr}
	add r2, r1, #0
	mov r1, #0xb5
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	lsr r4, r2, #0x1f
	lsl r3, r2, #0x1e
	sub r3, r3, r4
	mov r1, #0x1e
	ror r3, r1
	add r1, r4, r3
	mov r3, #0x28
	add r4, r1, #0
	mul r4, r3
	lsr r2, r2, #2
	mul r3, r2
	add r4, #0x44
	add r3, #0x24
	lsl r1, r4, #0x10
	lsl r2, r3, #0x10
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov84_0223F838
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov84_0223EC4C

	thumb_func_start ov84_0223EC80
ov84_0223EC80: ; 0x0223EC80
	ldrb r1, [r0, #0xd]
	strb r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov84_0223EC80

	thumb_func_start ov84_0223EC88
ov84_0223EC88: ; 0x0223EC88
	cmp r1, r0
	blo _0223EC92
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
_0223EC92:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov84_0223EC88

	thumb_func_start ov84_0223EC98
ov84_0223EC98: ; 0x0223EC98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	ldrh r4, [r5, #0x28]
	bl ov80_02238374
	cmp r0, #1
	bne _0223ECB4
	ldr r0, _0223ECB8 ; =0x000003C2
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0x28]
	cmp r1, r0
	bls _0223ECB4
	add r4, r1, #0
_0223ECB4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223ECB8: .word 0x000003C2
	thumb_func_end ov84_0223EC98

	thumb_func_start ov84_0223ECBC
ov84_0223ECBC: ; 0x0223ECBC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	cmp r1, #0x1e
	beq _0223ECCE
	cmp r1, #0x1f
	beq _0223ECD6
	cmp r1, #0x20
	beq _0223ECDE
	b _0223ECE4
_0223ECCE:
	mov r5, #0x47
	bl ov84_0223ED00
	b _0223ECE4
_0223ECD6:
	mov r5, #0x48
	bl ov84_0223ED6C
	b _0223ECE4
_0223ECDE:
	mov r5, #0x49
	bl ov84_0223EDF8
_0223ECE4:
	mov r1, #0x37
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r4, r1
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0223ECFA
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223ECFA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov84_0223ECBC

	thumb_func_start ov84_0223ED00
ov84_0223ED00: ; 0x0223ED00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	mov r0, #0x37
	lsl r0, r0, #4
	strh r4, [r5, r0]
	mov r2, #0
	add r3, r5, #0
	add r1, r0, #4
_0223ED1A:
	add r0, r5, r2
	add r0, #0x34
	ldrb r0, [r0]
	add r2, r2, #1
	strh r0, [r3, r1]
	add r3, r3, #2
	cmp r2, #0x10
	blt _0223ED1A
	ldrh r1, [r5, #0x16]
	mov r0, #0xe5
	lsl r0, r0, #2
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223ED00

	thumb_func_start ov84_0223ED34
ov84_0223ED34: ; 0x0223ED34
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	ldrb r0, [r4, #0xf]
	add r5, r2, #0
	add r0, r0, #1
	strb r0, [r4, #0xf]
	bl sub_0203769C
	cmp r6, r0
	beq _0223ED6A
	bl sub_0203769C
	cmp r0, #0
	beq _0223ED6A
	mov r2, #0
	add r3, r5, #0
_0223ED56:
	ldrh r1, [r3, #4]
	add r0, r4, r2
	add r0, #0x34
	add r2, r2, #1
	add r3, r3, #2
	strb r1, [r0]
	cmp r2, #0x10
	blt _0223ED56
	ldrh r0, [r5, #0x24]
	strh r0, [r4, #0x16]
_0223ED6A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov84_0223ED34

	thumb_func_start ov84_0223ED6C
ov84_0223ED6C: ; 0x0223ED6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x37
	lsl r0, r0, #4
	strh r1, [r5, r0]
	add r4, r2, #0
	add r0, r0, #2
	strh r4, [r5, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _0223ED8C
	ldrb r0, [r5, #0xe]
	cmp r0, #0xff
	bne _0223ED8C
	strb r4, [r5, #0xe]
_0223ED8C:
	ldrb r1, [r5, #0xe]
	mov r0, #0xdd
	lsl r0, r0, #2
	strh r1, [r5, r0]
	ldr r1, [r5, #0x24]
	add r0, r0, #2
	ldrh r1, [r1]
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov84_0223ED6C

	thumb_func_start ov84_0223EDA0
ov84_0223EDA0: ; 0x0223EDA0
	ldr r3, _0223EDA4 ; =LCRandom
	bx r3
	.balign 4, 0
_0223EDA4: .word LCRandom
	thumb_func_end ov84_0223EDA0

	thumb_func_start ov84_0223EDA8
ov84_0223EDA8: ; 0x0223EDA8
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	ldrb r0, [r4, #0xf]
	add r5, r2, #0
	add r0, r0, #1
	strb r0, [r4, #0xf]
	bl sub_0203769C
	cmp r6, r0
	beq _0223EDF2
	ldrh r1, [r5, #2]
	ldr r0, _0223EDF4 ; =0x000003C1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _0223EDE8
	ldrb r0, [r4, #0xe]
	cmp r0, #0xff
	ldr r0, _0223EDF4 ; =0x000003C1
	beq _0223EDDA
	mov r1, #0
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0223EDDA:
	ldrb r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x2e
	ldrb r0, [r0]
	add r0, r1, r0
	strb r0, [r4, #0xe]
	pop {r4, r5, r6, pc}
_0223EDE8:
	ldrh r0, [r5, #4]
	strb r0, [r4, #0xe]
	ldrh r1, [r5, #6]
	ldr r0, [r4, #0x24]
	strh r1, [r0]
_0223EDF2:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223EDF4: .word 0x000003C1
	thumb_func_end ov84_0223EDA8

	thumb_func_start ov84_0223EDF8
ov84_0223EDF8: ; 0x0223EDF8
	mov r2, #0x37
	lsl r2, r2, #4
	strh r1, [r0, r2]
	ldrb r3, [r0, #0xd]
	add r1, r2, #2
	strh r3, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov84_0223EDF8

	thumb_func_start ov84_0223EE08
ov84_0223EE08: ; 0x0223EE08
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0203769C
	cmp r5, r0
	beq _0223EE20
	ldrh r1, [r4, #2]
	mov r0, #0xf
	lsl r0, r0, #6
	strb r1, [r6, r0]
_0223EE20:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov84_0223EE08

	thumb_func_start ov84_0223EE24
ov84_0223EE24: ; 0x0223EE24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, #0x2e
	ldrb r0, [r0]
	bl ov84_0223EC88
	ldr r1, [sp]
	str r0, [sp, #4]
	add r0, r1, r0
	add r0, #0x34
	ldrb r6, [r0]
	add r0, r1, #0
	ldr r0, [r0, #0x20]
	mov r7, #0xb6
	strb r6, [r0]
	mov r4, #0
	add r5, r1, #0
	lsl r7, r7, #2
_0223EE4A:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223EE56
	add r1, r6, #0
	bl ov84_0223F878
_0223EE56:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _0223EE4A
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov84_0223EC4C
	ldr r0, _0223EE70 ; =0x000005E3
	bl PlaySE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223EE70: .word 0x000005E3
	thumb_func_end ov84_0223EE24

	thumb_func_start ov84_0223EE74
ov84_0223EE74: ; 0x0223EE74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r0, [sp, #4]
	add r0, #0x64
	ldr r5, _0223EFD4 ; =ov84_0223F99C
	mov r7, #0
	str r0, [sp, #4]
_0223EE84:
	ldrh r0, [r6, #0x2a]
	cmp r0, #5
	bhi _0223EED2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223EE96: ; jump table
	.short _0223EEA2 - _0223EE96 - 2 ; case 0
	.short _0223EEAA - _0223EE96 - 2 ; case 1
	.short _0223EEB2 - _0223EE96 - 2 ; case 2
	.short _0223EEBA - _0223EE96 - 2 ; case 3
	.short _0223EEC2 - _0223EE96 - 2 ; case 4
	.short _0223EECA - _0223EE96 - 2 ; case 5
_0223EEA2:
	ldrb r0, [r5]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	b _0223EED8
_0223EEAA:
	ldrb r0, [r5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	b _0223EED8
_0223EEB2:
	ldrb r0, [r5]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	b _0223EED8
_0223EEBA:
	ldrb r0, [r5]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	b _0223EED8
_0223EEC2:
	ldrb r0, [r5]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	b _0223EED8
_0223EECA:
	ldrb r0, [r5]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	b _0223EED8
_0223EED2:
	ldrb r0, [r5]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
_0223EED8:
	cmp r0, #1
	bne _0223EFC6
	add r0, r7, #0
	sub r0, #0x18
	mov r4, #0xff
	cmp r0, #7
	bhi _0223EF1C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223EEF2: ; jump table
	.short _0223EF06 - _0223EEF2 - 2 ; case 0
	.short _0223EF0A - _0223EEF2 - 2 ; case 1
	.short _0223EF0E - _0223EEF2 - 2 ; case 2
	.short _0223EF02 - _0223EEF2 - 2 ; case 3
	.short _0223EF12 - _0223EEF2 - 2 ; case 4
	.short _0223EF16 - _0223EEF2 - 2 ; case 5
	.short _0223EF1C - _0223EEF2 - 2 ; case 6
	.short _0223EF1A - _0223EEF2 - 2 ; case 7
_0223EF02:
	mov r4, #0
	b _0223EF1C
_0223EF06:
	mov r4, #1
	b _0223EF1C
_0223EF0A:
	mov r4, #2
	b _0223EF1C
_0223EF0E:
	mov r4, #3
	b _0223EF1C
_0223EF12:
	mov r4, #4
	b _0223EF1C
_0223EF16:
	mov r4, #5
	b _0223EF1C
_0223EF1A:
	mov r4, #6
_0223EF1C:
	add r0, r6, #0
	bl ov84_0223EC98
	mov r1, #7
	str r0, [sp]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	ldr r1, [sp]
	ldr r0, _0223EFD8 ; =0x0000270F
	cmp r1, r0
	blo _0223EF38
	mov r2, #6
_0223EF38:
	cmp r4, #0xff
	beq _0223EFAA
	cmp r2, #7
	bhi _0223EFA2
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223EF4C: ; jump table
	.short _0223EF5C - _0223EF4C - 2 ; case 0
	.short _0223EF66 - _0223EF4C - 2 ; case 1
	.short _0223EF70 - _0223EF4C - 2 ; case 2
	.short _0223EF7A - _0223EF4C - 2 ; case 3
	.short _0223EF84 - _0223EF4C - 2 ; case 4
	.short _0223EF8E - _0223EF4C - 2 ; case 5
	.short _0223EF98 - _0223EF4C - 2 ; case 6
	.short _0223EF98 - _0223EF4C - 2 ; case 7
_0223EF5C:
	ldr r0, _0223EFDC ; =ov84_0223F904
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	b _0223EFAC
_0223EF66:
	ldr r0, _0223EFDC ; =ov84_0223F904
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	b _0223EFAC
_0223EF70:
	ldr r0, _0223EFDC ; =ov84_0223F904
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	b _0223EFAC
_0223EF7A:
	ldr r0, _0223EFDC ; =ov84_0223F904
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	b _0223EFAC
_0223EF84:
	ldr r0, _0223EFDC ; =ov84_0223F904
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	b _0223EFAC
_0223EF8E:
	ldr r0, _0223EFDC ; =ov84_0223F904
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	b _0223EFAC
_0223EF98:
	ldr r0, _0223EFDC ; =ov84_0223F904
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	b _0223EFAC
_0223EFA2:
	bl GF_AssertFail
	mov r0, #1
	b _0223EFAC
_0223EFAA:
	mov r0, #1
_0223EFAC:
	cmp r0, #1
	bne _0223EFC6
	add r0, r6, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r0, r6, r0
	add r0, #0x44
	strb r7, [r0]
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #4]
	strb r1, [r0]
_0223EFC6:
	add r7, r7, #1
	add r5, r5, #1
	cmp r7, #0x20
	bhs _0223EFD0
	b _0223EE84
_0223EFD0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223EFD4: .word ov84_0223F99C
_0223EFD8: .word 0x0000270F
_0223EFDC: .word ov84_0223F904
	thumb_func_end ov84_0223EE74

	thumb_func_start ov84_0223EFE0
ov84_0223EFE0: ; 0x0223EFE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r3, [r5, #0x12]
	ldr r2, _0223F090 ; =_0223F900
	mov r1, #0
_0223EFEC:
	ldrb r0, [r2]
	cmp r3, r0
	bhs _0223EFFA
	add r1, r1, #1
	add r2, r2, #1
	cmp r1, #4
	blo _0223EFEC
_0223EFFA:
	add r0, r5, #0
	strb r1, [r5, #0x11]
	add r0, #0x64
	ldrb r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _0223F08A
	add r0, r5, #0
	str r0, [sp, #4]
	add r0, #0x33
	str r0, [sp, #4]
	add r0, r5, #0
	str r0, [sp]
	add r0, #0x32
	add r7, r5, #0
	add r6, r5, #0
	str r0, [sp]
	add r7, #0x31
	add r6, #0x30
_0223F020:
	add r0, r5, r4
	add r0, #0x44
	ldrb r0, [r0]
	bl ov80_022384BC
	cmp r0, #0
	bne _0223F036
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
	b _0223F07E
_0223F036:
	add r0, r5, r4
	add r0, #0x44
	ldrb r0, [r0]
	bl ov80_022384BC
	cmp r0, #1
	bne _0223F04C
	ldrb r0, [r7]
	add r0, r0, #1
	strb r0, [r7]
	b _0223F07E
_0223F04C:
	add r0, r5, r4
	add r0, #0x44
	ldrb r0, [r0]
	bl ov80_022384BC
	cmp r0, #2
	bne _0223F066
	ldr r0, [sp]
	ldrb r0, [r0]
	add r1, r0, #1
	ldr r0, [sp]
	strb r1, [r0]
	b _0223F07E
_0223F066:
	add r0, r5, r4
	add r0, #0x44
	ldrb r0, [r0]
	bl ov80_022384BC
	cmp r0, #3
	bne _0223F07E
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #4]
	strb r1, [r0]
_0223F07E:
	add r0, r5, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r4, r4, #1
	cmp r4, r0
	blt _0223F020
_0223F08A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F090: .word _0223F900
	thumb_func_end ov84_0223EFE0

	thumb_func_start ov84_0223F094
ov84_0223F094: ; 0x0223F094
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #4]
_0223F09E:
	ldrb r1, [r6, #0x11]
	add r0, r6, #0
	bl ov84_0223F178
	add r5, r0, #0
	add r0, r6, r5
	add r0, #0x30
	mov r4, #0
	ldrb r7, [r0]
	cmp r5, #0
	beq _0223F0F4
	cmp r5, #1
	bne _0223F0C2
	add r0, r6, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r4, r4, r0
	b _0223F0F4
_0223F0C2:
	cmp r5, #2
	bne _0223F0D8
	add r0, r6, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r1, r4, r0
	add r0, r6, #0
	add r0, #0x31
	ldrb r0, [r0]
	add r4, r1, r0
	b _0223F0F4
_0223F0D8:
	cmp r5, #3
	bne _0223F0F4
	add r0, r6, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r1, r4, r0
	add r0, r6, #0
	add r0, #0x31
	ldrb r0, [r0]
	add r1, r1, r0
	add r0, r6, #0
	add r0, #0x32
	ldrb r0, [r0]
	add r4, r1, r0
_0223F0F4:
	bl LCRandom
	add r1, r7, #0
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	add r0, r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	mov r7, #0
_0223F110:
	cmp r7, #0x32
	blt _0223F124
	bl GF_AssertFail
	ldr r0, [sp, #4]
	mov r1, #0
	add r0, r6, r0
	add r0, #0x34
	strb r1, [r0]
	b _0223F16A
_0223F124:
	add r0, r6, r4
	add r0, #0x44
	ldrb r0, [r0]
	bl ov80_022384BC
	cmp r5, r0
	bne _0223F142
	add r0, r6, r4
	add r0, #0x44
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	add r0, r6, r0
	add r0, #0x34
	strb r1, [r0]
	b _0223F16A
_0223F142:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r6, #0
	add r0, #0x64
	ldrb r0, [r0]
	add r7, r7, #1
	cmp r4, r0
	blo _0223F156
	mov r4, #0
_0223F156:
	ldr r0, [sp]
	cmp r4, r0
	bne _0223F110
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _0223F110
	mov r5, #0
	b _0223F110
_0223F16A:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0x10
	blt _0223F09E
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov84_0223F094

	thumb_func_start ov84_0223F178
ov84_0223F178: ; 0x0223F178
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r5, #0
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	ldr r3, _0223F1B8 ; =ov84_0223F934
	lsl r1, r4, #2
	add r0, r5, #0
	add r1, r3, r1
_0223F194:
	ldrb r3, [r1, r0]
	add r3, r5, r3
	lsl r3, r3, #0x18
	lsr r5, r3, #0x18
	cmp r2, r5
	blt _0223F1AA
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #4
	blo _0223F194
_0223F1AA:
	cmp r0, #4
	blo _0223F1B4
	bl GF_AssertFail
	mov r0, #0
_0223F1B4:
	pop {r3, r4, r5, pc}
	nop
_0223F1B8: .word ov84_0223F934
	thumb_func_end ov84_0223F178

	thumb_func_start ov84_0223F1BC
ov84_0223F1BC: ; 0x0223F1BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_022380E8
	add r6, r0, #0
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_0223811C
	add r7, r0, #0
	mov r4, #0
	cmp r6, #0
	bls _0223F21E
_0223F1DA:
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0223F204
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov84_0223F82C
	b _0223F214
_0223F204:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov84_0223F82C
_0223F214:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _0223F1DA
_0223F21E:
	mov r4, #0
	cmp r7, #0
	bls _0223F268
	mov r6, #0xda
	lsl r6, r6, #2
_0223F228:
	ldr r0, [r5, r6]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0223F24E
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov84_0223F82C
	b _0223F25E
_0223F24E:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov84_0223F82C
_0223F25E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r7
	blo _0223F228
_0223F268:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F1BC

	thumb_func_start ov84_0223F26C
ov84_0223F26C: ; 0x0223F26C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223F288 ; =ov84_0223F90B
	bl sub_0202529C
	cmp r0, #0
	bne _0223F284
	add r0, r4, #0
	bl ov84_0223F28C
	mov r0, #1
	pop {r4, pc}
_0223F284:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223F288: .word ov84_0223F90B
	thumb_func_end ov84_0223F26C

	thumb_func_start ov84_0223F28C
ov84_0223F28C: ; 0x0223F28C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223F2AC ; =0x000005DC
	mov r1, #0
	bl StopSE
	ldr r0, _0223F2B0 ; =0x000005E4
	bl PlaySE
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov84_0223F878
	pop {r4, pc}
	.balign 4, 0
_0223F2AC: .word 0x000005DC
_0223F2B0: .word 0x000005E4
	thumb_func_end ov84_0223F28C

	thumb_func_start ov84_0223F2B4
ov84_0223F2B4: ; 0x0223F2B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	str r1, [sp, #0x14]
	mov r0, #0x20
	mov r1, #0x6e
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl GF_CreateVramTransferManager
	bl ov84_0223F480
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x6e
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	mov r0, #0x22
	add r1, r5, #4
	mov r2, #0x6e
	bl G2dRenderer_Init
	ldr r4, _0223F370 ; =ov84_0223F9E4
	str r0, [r5]
	mov r7, #0
	add r6, r5, #0
_0223F2FA:
	ldrb r0, [r4]
	add r1, r7, #0
	mov r2, #0x6e
	bl Create2DGfxResObjMan
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r7, r7, #1
	add r4, r4, #1
	add r6, r6, #4
	cmp r7, #4
	blt _0223F2FA
	add r0, r5, #0
	bl ov84_0223F714
	add r0, r5, #0
	bl ov84_0223F4B4
	add r0, r5, #0
	bl ov84_0223F538
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	bl ov84_0223F5E4
	mov r7, #0x4f
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_0223F33A:
	ldr r0, [r4, r7]
	bl sub_0200ACF0
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0xb
	blt _0223F33A
	mov r6, #5
	mov r4, #0
	lsl r6, r6, #6
_0223F34E:
	ldr r0, [r5, r6]
	bl sub_0200AF94
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _0223F34E
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F370: .word ov84_0223F9E4
	thumb_func_end ov84_0223F2B4

	thumb_func_start ov84_0223F374
ov84_0223F374: ; 0x0223F374
	push {r4, r5, r6, lr}
	sub sp, #0x80
	add r4, r0, #0
	mov r0, #0
	str r3, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r5, #0
	ldr r0, [sp, #0x98]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r6, [r4, r0]
	str r6, [sp, #0x14]
	add r6, r0, #4
	ldr r6, [r4, r6]
	str r6, [sp, #0x18]
	add r6, r0, #0
	add r6, #8
	ldr r6, [r4, r6]
	add r0, #0xc
	str r6, [sp, #0x1c]
	ldr r0, [r4, r0]
	str r0, [sp, #0x20]
	str r5, [sp, #0x24]
	str r5, [sp, #0x28]
	add r0, sp, #0x5c
	bl CreateSpriteResourcesHeader
	ldr r0, [r4]
	mov r1, #1
	lsl r1, r1, #0xc
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	add r0, r5, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r1, [sp, #0x44]
	str r1, [sp, #0x48]
	add r1, sp, #0x2c
	strh r0, [r1, #0x20]
	ldr r1, [sp, #0x94]
	str r1, [sp, #0x50]
	mov r1, #0x6e
	str r1, [sp, #0x58]
	add r1, sp, #0x80
	ldrb r1, [r1, #0x1c]
	cmp r1, #0
	bne _0223F3E6
	mov r0, #1
	str r0, [sp, #0x54]
	b _0223F3F2
_0223F3E6:
	mov r1, #2
	str r1, [sp, #0x54]
	mov r1, #3
	lsl r1, r1, #0x12
	add r0, r0, r1
	str r0, [sp, #0x38]
_0223F3F2:
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #1
	add r4, r0, #0
	bl Set2dSpriteAnimActiveFlag
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r1, [sp, #0x90]
	add r0, r4, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add sp, #0x80
	pop {r4, r5, r6, pc}
	thumb_func_end ov84_0223F374

	thumb_func_start ov84_0223F418
ov84_0223F418: ; 0x0223F418
	push {r4, r5, r6, lr}
	mov r6, #0x4f
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_0223F422:
	lsl r0, r4, #4
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl sub_0200AEB0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xb
	blo _0223F422
	mov r6, #5
	mov r4, #0
	lsl r6, r6, #6
_0223F43C:
	lsl r0, r4, #4
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _0223F43C
	mov r6, #0x4b
	mov r4, #0
	lsl r6, r6, #2
_0223F456:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl Destroy2DGfxResObjMan
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _0223F456
	ldr r0, [r5]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F418

	thumb_func_start ov84_0223F480
ov84_0223F480: ; 0x0223F480
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0223F4B0 ; =ov84_0223F9E8
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #0x10
	add r0, r2, #0
	add r2, r1, #0
	bl sub_020215C0
	mov r0, #0xe
	mov r1, #0x6e
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0223F4B0: .word ov84_0223F9E8
	thumb_func_end ov84_0223F480

	thumb_func_start ov84_0223F4B4
ov84_0223F4B4: ; 0x0223F4B4
	push {r4, lr}
	sub sp, #0x10
	mov r3, #1
	str r3, [sp]
	add r4, r0, #0
	str r3, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x12
	bl AddCharResObjFromNarc
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	add r0, #0xc2
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x38
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xc6
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x14
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xca
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x13
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov84_0223F4B4

	thumb_func_start ov84_0223F538
ov84_0223F538: ; 0x0223F538
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x15
	mov r1, #0x6e
	bl NARC_ctor
	add r4, r0, #0
	bl sub_0207CA9C
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	bl sub_0207CAA0
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	add r0, #0xc2
	ldr r0, [r5, r0]
	mov r1, #0x15
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	bl sub_0207CAA4
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xc6
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	bl sub_0207CAA8
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xca
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223F538

	thumb_func_start ov84_0223F5E4
ov84_0223F5E4: ; 0x0223F5E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #0x14
	mov r1, #0x6e
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	bl NARC_ctor
	str r0, [sp, #0x18]
	bl sub_02074490
	mov r1, #3
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	add r0, #0xc2
	ldr r0, [r6, r0]
	mov r1, #0x14
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r6, r1]
	bl sub_02074498
	add r2, r0, #0
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xc6
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r6, r1]
	bl sub_020744A4
	add r2, r0, #0
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xca
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r4, #0
	add r5, r6, #0
_0223F66A:
	cmp r4, #3
	bne _0223F6A0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0223F68A
	add r0, r7, #0
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x1c]
	b _0223F6B4
_0223F68A:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x1c]
	b _0223F6B4
_0223F6A0:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x1c]
_0223F6B4:
	ldr r0, [sp, #0x20]
	bl Pokemon_GetIconNaix
	add r2, r0, #0
	add r0, r4, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp, #0x1c]
	bl Pokemon_GetIconNaix
	add r2, r0, #0
	add r0, r4, #7
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blo _0223F66A
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F5E4

	thumb_func_start ov84_0223F714
ov84_0223F714: ; 0x0223F714
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x15
	mov r3, #1
	bl AddCharResObjFromNarc
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	add r0, #0xc2
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x39
	bl AddPlttResObjFromNarc
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xc6
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x17
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xca
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x16
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F714

	thumb_func_start ov84_0223F7A0
ov84_0223F7A0: ; 0x0223F7A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x6e
	mov r1, #0x14
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_0223F7BC:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0223F7BC
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, sp, #0x4c
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov84_0223F374
	str r0, [r4, #0x10]
	add r0, sp, #0x28
	ldrh r3, [r0, #0x14]
	strh r3, [r4, #0xc]
	ldrh r1, [r0, #0x18]
	add r0, sp, #0x4c
	ldrb r2, [r0]
	strh r1, [r4, #0xe]
	lsl r0, r3, #0xc
	strb r2, [r4, #0xb]
	lsl r1, r1, #0xc
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	cmp r2, #1
	bne _0223F808
	mov r0, #3
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x18]
_0223F808:
	ldr r0, [r4, #0x10]
	add r1, sp, #0x14
	bl sub_020247D4
	add r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F7A0

	thumb_func_start ov84_0223F818
ov84_0223F818: ; 0x0223F818
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02024758
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov84_0223F818

	thumb_func_start ov84_0223F82C
ov84_0223F82C: ; 0x0223F82C
	ldr r3, _0223F834 ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0223F834: .word Set2dSpriteVisibleFlag
	thumb_func_end ov84_0223F82C

	thumb_func_start ov84_0223F838
ov84_0223F838: ; 0x0223F838
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	lsl r1, r6, #0xc
	str r0, [r2]
	lsl r0, r4, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _0223F86A
	mov r0, #3
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #4]
_0223F86A:
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F838

	thumb_func_start ov84_0223F878
ov84_0223F878: ; 0x0223F878
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	ldr r0, [r5, #0x10]
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl sub_02024950
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F878

	thumb_func_start ov84_0223F894
ov84_0223F894: ; 0x0223F894
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02024AA8
	pop {r4, pc}
	thumb_func_end ov84_0223F894

	thumb_func_start ov84_0223F8A8
ov84_0223F8A8: ; 0x0223F8A8
	ldr r3, _0223F8B0 ; =sub_0202484C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0223F8B0: .word Set2dSpriteAnimActiveFlag
	thumb_func_end ov84_0223F8A8

	thumb_func_start ov84_0223F8B4
ov84_0223F8B4: ; 0x0223F8B4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r4, #0
_0223F8BC:
	ldr r2, _0223F8E0 ; =ov84_0223F9F8
	lsl r6, r4, #4
	lsl r3, r4, #3
	add r0, r7, #0
	add r1, r5, r6
	add r2, r2, r3
	bl AddWindow
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0223F8BC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F8E0: .word ov84_0223F9F8
	thumb_func_end ov84_0223F8B4

	thumb_func_start ov84_0223F8E4
ov84_0223F8E4: ; 0x0223F8E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223F8EA:
	lsl r0, r4, #4
	add r0, r5, r0
	bl RemoveWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #2
	blo _0223F8EA
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F8E4

	.rodata

_0223F900:
	.byte 0x15, 0x10, 0x0A, 0x05

ov84_0223F904: ; 0x0223F904
	.byte 0x3F, 0x3F, 0x3F, 0x3F, 0x15, 0x2A, 0x2A

ov84_0223F90B: ; 0x0223F90B
	.byte 0xFE, 0x80, 0x60, 0x20, 0xFF
	.byte 0x00, 0x00, 0x00

ov84_0223F913: ; 0x0223F913
	.byte 0x14, 0x00, 0x10, 0x00, 0x08, 0x00, 0x04, 0x00, 0x03, 0x00, 0x02, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00

ov84_0223F924: ; 0x0223F924
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov84_0223F934: ; 0x0223F934
	.byte 0x0F, 0x0F, 0x28, 0x1E, 0x23, 0x14, 0x1E, 0x0F, 0x1E, 0x1E, 0x23, 0x05
	.byte 0x19, 0x28, 0x1E, 0x05, 0x0A, 0x4B, 0x0A, 0x05

ov84_0223F948: ; 0x0223F948
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x06, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov84_0223F964: ; 0x0223F964
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov84_0223F980: ; 0x0223F980
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x04, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov84_0223F99C: ; 0x0223F99C
	.byte 0x7E, 0x45, 0x45, 0x45
	.byte 0x70, 0x70, 0x47, 0x78, 0x7E, 0x7E, 0x45, 0x45, 0x45, 0x70, 0x70, 0x47, 0x78, 0x7E, 0x46, 0x46
	.byte 0x46, 0x46, 0x68, 0x68, 0x7F, 0x47, 0x7F, 0x70, 0x78, 0x70, 0x7F, 0x40

ov84_0223F9BC: ; 0x0223F9BC
	.byte 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov84_0223F9E4: ; 0x0223F9E4
	.byte 0x0B, 0x0B, 0x0B, 0x0B

ov84_0223F9E8: ; 0x0223F9E8
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00

ov84_0223F9F8: ; 0x0223F9F8
	.byte 0x01, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00
	.byte 0x01, 0x18, 0x0D, 0x07, 0x04, 0x0D, 0x6D, 0x00
	; 0x0223FA08

	.bss

_0223FA20:
	.space 0x20
