	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov83_0223DD60
ov83_0223DD60: ; 0x0223DD60
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0223DE40 ; =FS_OVERLAY_ID(OVY_80)
	mov r1, #2
	bl HandleLoadOverlay
	bl ov83_0223F1C8
	mov r0, #3
	mov r1, #0x6b
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r1, _0223DE44 ; =0x0000086C
	add r0, r4, #0
	mov r2, #0x6b
	bl OverlayManager_CreateAndGetData
	ldr r2, _0223DE44 ; =0x0000086C
	mov r1, #0
	add r5, r0, #0
	bl memset
	mov r0, #0x6b
	bl BgConfig_Alloc
	str r0, [r5, #0x4c]
	add r0, r4, #0
	str r4, [r5]
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0223DE48 ; =0x0000050C
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	bl sub_02030CC8
	mov r1, #0x51
	lsl r1, r1, #4
	str r0, [r5, r1]
	sub r0, r1, #4
	ldr r0, [r5, r0]
	bl sub_02030E08
	ldr r1, _0223DE4C ; =0x00000514
	add r2, r4, #0
	str r0, [r5, r1]
	ldrb r0, [r4, #4]
	add r2, #0x20
	sub r1, #8
	strb r0, [r5, #9]
	mov r0, #0x7a
	lsl r0, r0, #4
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, _0223DE50 ; =0x00000508
	str r0, [r5, r1]
	ldr r2, [r4, #0x18]
	ldr r0, _0223DE54 ; =0x000007A4
	str r2, [r5, r0]
	mov r2, #0xff
	strb r2, [r5, #0x12]
	ldrh r2, [r4, #0x28]
	add r0, #0x5e
	strh r2, [r5, r0]
	add r0, r1, #4
	ldr r0, [r5, r0]
	bl sub_0203107C
	str r0, [r5, #4]
	ldr r0, _0223DE58 ; =0x000007FF
	mov r3, #0
	mov r2, #1
_0223DDF8:
	add r1, r5, r3
	add r3, r3, #1
	strb r2, [r1, r0]
	cmp r3, #3
	blt _0223DDF8
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223DE10
	mov r0, #3
	b _0223DE12
_0223DE10:
	mov r0, #4
_0223DE12:
	strb r0, [r5, #0x14]
	mov r0, #4
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x15]
	sub r0, r0, #1
	strb r0, [r5, #0xc]
	ldr r0, _0223DE5C ; =0x00000868
	add r0, r5, r0
	bl ov83_022477E4
	add r0, r5, #0
	bl ov83_0223F200
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0223DE3C
	add r0, r5, #0
	bl sub_02096910
_0223DE3C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223DE40: .word FS_OVERLAY_ID(OVY_80)
_0223DE44: .word 0x0000086C
_0223DE48: .word 0x0000050C
_0223DE4C: .word 0x00000514
_0223DE50: .word 0x00000508
_0223DE54: .word 0x000007A4
_0223DE58: .word 0x000007FF
_0223DE5C: .word 0x00000868
	thumb_func_end ov83_0223DD60

	thumb_func_start ov83_0223DE60
ov83_0223DE60: ; 0x0223DE60
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, _0223DFAC ; =0x000007FE
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #1
	bne _0223DEC6
	ldr r2, [r5]
	cmp r2, #1
	bne _0223DEEC
	mov r2, #0
	strb r2, [r4, r1]
	bl ov83_022412A0
	ldr r0, _0223DFB0 ; =0x0000075C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223DE94
	bl ov83_0224753C
	ldrb r1, [r4, #0xe]
	mov r0, #4
	bic r1, r0
	strb r1, [r4, #0xe]
_0223DE94:
	ldr r0, _0223DFB4 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl ov80_0222A7CC
	add r0, r4, #0
	mov r1, #8
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov83_02240DA8
	b _0223DEEC
_0223DEC6:
	ldrb r0, [r4, #0x12]
	cmp r0, #0xff
	beq _0223DEEC
	ldr r0, [r5]
	cmp r0, #1
	beq _0223DED6
	cmp r0, #3
	bne _0223DEEC
_0223DED6:
	ldr r0, _0223DFAC ; =0x000007FE
	mov r1, #0
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov83_022412A0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov83_02240DA8
_0223DEEC:
	ldr r0, [r5]
	cmp r0, #4
	bhi _0223DF9A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223DEFE: ; jump table
	.short _0223DF08 - _0223DEFE - 2 ; case 0
	.short _0223DF1E - _0223DEFE - 2 ; case 1
	.short _0223DF60 - _0223DEFE - 2 ; case 2
	.short _0223DF76 - _0223DEFE - 2 ; case 3
	.short _0223DF8C - _0223DEFE - 2 ; case 4
_0223DF08:
	add r0, r4, #0
	bl ov83_0223E008
	cmp r0, #1
	bne _0223DF9A
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov83_02240DA8
	b _0223DF9A
_0223DF1E:
	add r0, r4, #0
	bl ov83_0223E14C
	cmp r0, #1
	bne _0223DF9A
	ldrb r0, [r4, #0xe]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0223DF3E
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov83_02240DA8
	b _0223DF9A
_0223DF3E:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0223DF54
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov83_02240DA8
	b _0223DF9A
_0223DF54:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov83_02240DA8
	b _0223DF9A
_0223DF60:
	add r0, r4, #0
	bl ov83_0223EEA0
	cmp r0, #1
	bne _0223DF9A
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov83_02240DA8
	b _0223DF9A
_0223DF76:
	add r0, r4, #0
	bl ov83_0223EFA4
	cmp r0, #1
	bne _0223DF9A
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov83_02240DA8
	b _0223DF9A
_0223DF8C:
	add r0, r4, #0
	bl ov83_0223F010
	cmp r0, #1
	bne _0223DF9A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223DF9A:
	add r0, r4, #0
	bl ov83_02241B30
	ldr r0, _0223DFB8 ; =0x00000518
	ldr r0, [r4, r0]
	bl sub_0202457C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223DFAC: .word 0x000007FE
_0223DFB0: .word 0x0000075C
_0223DFB4: .word 0x00000508
_0223DFB8: .word 0x00000518
	thumb_func_end ov83_0223DE60

	thumb_func_start ov83_0223DFBC
ov83_0223DFBC: ; 0x0223DFBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0x7a
	lsl r0, r0, #4
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, r0]
	strh r1, [r0]
	ldr r0, _0223E000 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov83_0223F058
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x6b
	bl DestroyHeap
	ldr r0, _0223E004 ; =FS_OVERLAY_ID(OVY_80)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0223E000: .word 0x04000050
_0223E004: .word FS_OVERLAY_ID(OVY_80)
	thumb_func_end ov83_0223DFBC

	thumb_func_start ov83_0223E008
ov83_0223E008: ; 0x0223E008
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #4
	bhi _0223E104
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223E020: ; jump table
	.short _0223E02A - _0223E020 - 2 ; case 0
	.short _0223E046 - _0223E020 - 2 ; case 1
	.short _0223E06E - _0223E020 - 2 ; case 2
	.short _0223E0B4 - _0223E020 - 2 ; case 3
	.short _0223E0F6 - _0223E020 - 2 ; case 4
_0223E02A:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0223E03E
	bl sub_02037BEC
	mov r0, #0xd7
	bl sub_02037AC0
_0223E03E:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E046:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0223E066
	mov r0, #0xd7
	bl sub_02037B38
	cmp r0, #1
	bne _0223E104
	bl sub_02037BEC
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E066:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E06E:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0223E08E
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl ov83_02241368
	cmp r0, #1
	bne _0223E104
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E08E:
	add r0, r4, #0
	bl ov83_0223E10C
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E0B4:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0223E0EE
	ldrb r0, [r4, #0xf]
	cmp r0, #2
	blo _0223E104
	mov r0, #0
	strb r0, [r4, #0xf]
	add r0, r4, #0
	bl ov83_0223E10C
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E0EE:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E0F6:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223E104
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0223E104:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov83_0223E008

	thumb_func_start ov83_0223E10C
ov83_0223E10C: ; 0x0223E10C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x50
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_0224153C
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02241770
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x80
	bl ov83_02240080
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x70
	bl ov83_02240170
	add r0, r5, #0
	bl ov83_02240290
	bl GX_BothDispOn
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_0223E10C

	thumb_func_start ov83_0223E14C
ov83_0223E14C: ; 0x0223E14C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0x16
	bls _0223E15C
	bl _0223EE86
_0223E15C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E168: ; jump table
	.short _0223E196 - _0223E168 - 2 ; case 0
	.short _0223E254 - _0223E168 - 2 ; case 1
	.short _0223E2D2 - _0223E168 - 2 ; case 2
	.short _0223E42C - _0223E168 - 2 ; case 3
	.short _0223E608 - _0223E168 - 2 ; case 4
	.short _0223E6BA - _0223E168 - 2 ; case 5
	.short _0223E6CC - _0223E168 - 2 ; case 6
	.short _0223E6F2 - _0223E168 - 2 ; case 7
	.short _0223E714 - _0223E168 - 2 ; case 8
	.short _0223E814 - _0223E168 - 2 ; case 9
	.short _0223E8CA - _0223E168 - 2 ; case 10
	.short _0223EA26 - _0223E168 - 2 ; case 11
	.short _0223EB92 - _0223E168 - 2 ; case 12
	.short _0223EC40 - _0223E168 - 2 ; case 13
	.short _0223EC52 - _0223E168 - 2 ; case 14
	.short _0223EC78 - _0223E168 - 2 ; case 15
	.short _0223ECC0 - _0223E168 - 2 ; case 16
	.short _0223ECDA - _0223E168 - 2 ; case 17
	.short _0223ED00 - _0223E168 - 2 ; case 18
	.short _0223EDC2 - _0223E168 - 2 ; case 19
	.short _0223EDE2 - _0223E168 - 2 ; case 20
	.short _0223EE04 - _0223E168 - 2 ; case 21
	.short _0223EE46 - _0223E168 - 2 ; case 22
_0223E196:
	ldrb r1, [r4, #0xe]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1e
	cmp r1, #1
	bne _0223E1C2
	bl ov83_02240348
	ldr r0, _0223E4F0 ; =0x00000778
	mov r1, #0xcc
	ldr r0, [r4, r0]
	mov r2, #0x64
	bl ov83_02247630
	mov r0, #2
	strb r0, [r4, #8]
	ldrb r1, [r4, #0xe]
	mov r0, #0x60
	add sp, #4
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0223E1C2:
	cmp r1, #2
	bne _0223E1E8
	bl ov83_02240384
	ldr r0, _0223E4F0 ; =0x00000778
	mov r1, #0xd3
	ldr r0, [r4, r0]
	mov r2, #0x6a
	bl ov83_02247630
	mov r0, #8
	strb r0, [r4, #8]
	ldrb r1, [r4, #0xe]
	mov r0, #0x60
	add sp, #4
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0223E1E8:
	ldr r0, _0223E4F4 ; =0x00000838
	ldr r0, [r4, r0]
	bl ov83_02247AD4
	cmp r0, #4
	bhi _0223E20A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E200: ; jump table
	.short _0223E216 - _0223E200 - 2 ; case 0
	.short _0223E216 - _0223E200 - 2 ; case 1
	.short _0223E216 - _0223E200 - 2 ; case 2
	.short _0223E216 - _0223E200 - 2 ; case 3
	.short _0223E22A - _0223E200 - 2 ; case 4
_0223E20A:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _0223E236
	bl _0223EE86
_0223E216:
	add r0, r4, #0
	bl ov83_022402F4
	add r0, r4, #0
	bl ov83_02240300
	mov r0, #1
	strb r0, [r4, #8]
	bl _0223EE86
_0223E22A:
	ldr r0, _0223E4F8 ; =0x000005DC
	bl PlaySE
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0223E236:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0x15]
	cmp r1, r0
	beq _0223E2FA
	ldr r0, _0223E4F4 ; =0x00000838
	ldr r0, [r4, r0]
	bl ov83_02247B04
	ldrb r2, [r4, #0xd]
	add r0, r4, #0
	mov r1, #4
	bl ov83_02242AB4
	bl _0223EE86
_0223E254:
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_020186A4
	ldr r1, _0223E4F8 ; =0x000005DC
	add r5, r0, #0
	bl ov83_022477B0
	add r0, r4, #0
	bl ov83_02242DAC
	cmp r5, #5
	bhi _0223E27A
	bhs _0223E2AA
	cmp r5, #0
	beq _0223E296
	bl _0223EE86
_0223E27A:
	cmp r5, #0xb
	bhi _0223E284
	beq _0223E2BE
	bl _0223EE86
_0223E284:
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	blo _0223E2FA
	beq _0223E2BE
	add r0, r0, #1
	cmp r5, r0
	bl _0223EE86
_0223E296:
	add r0, r4, #0
	bl ov83_02240334
	add r0, r4, #0
	bl ov83_02240348
	mov r0, #2
	strb r0, [r4, #8]
	bl _0223EE86
_0223E2AA:
	add r0, r4, #0
	bl ov83_02240334
	add r0, r4, #0
	bl ov83_02240384
	mov r0, #8
	strb r0, [r4, #8]
	bl _0223EE86
_0223E2BE:
	add r0, r4, #0
	bl ov83_02240334
	add r0, r4, #0
	bl ov83_02240290
	mov r0, #0
	strb r0, [r4, #8]
	bl _0223EE86
_0223E2D2:
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_020186A4
	ldr r1, _0223E4F8 ; =0x000005DC
	add r5, r0, #0
	bl ov83_022477B0
	add r0, r4, #0
	bl ov83_02242DFC
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bhi _0223E322
	blo _0223E2F6
	b _0223E418
_0223E2F6:
	cmp r5, #0xb
	bls _0223E2FE
_0223E2FA:
	bl _0223EE86
_0223E2FE:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223E30A: ; jump table
	.short _0223EE86 - _0223E30A - 2 ; case 0
	.short _0223E32C - _0223E30A - 2 ; case 1
	.short _0223E32C - _0223E30A - 2 ; case 2
	.short _0223E32C - _0223E30A - 2 ; case 3
	.short _0223E3A4 - _0223E30A - 2 ; case 4
	.short _0223EE86 - _0223E30A - 2 ; case 5
	.short _0223EE86 - _0223E30A - 2 ; case 6
	.short _0223EE86 - _0223E30A - 2 ; case 7
	.short _0223EE86 - _0223E30A - 2 ; case 8
	.short _0223EE86 - _0223E30A - 2 ; case 9
	.short _0223EE86 - _0223E30A - 2 ; case 10
	.short _0223E418 - _0223E30A - 2 ; case 11
_0223E322:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bl _0223EE86
_0223E32C:
	add r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_0224037C
	ldr r0, _0223E4FC ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	ldr r0, _0223E500 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #0
	bl ov83_0224777C
	ldr r1, _0223E504 ; =0x00000848
	ldr r2, [r4, r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _0223E508 ; =ov83_02247F4C
	ldr r1, [r1, r3]
	cmp r0, r1
	bhs _0223E378
	add r0, r4, #0
	mov r1, #0x21
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E378:
	lsl r3, r2, #1
	ldr r2, _0223E50C ; =ov83_02247D18
	mov r1, #0
	ldrh r2, [r2, r3]
	add r0, r4, #0
	mov r3, #3
	str r1, [sp]
	bl ov83_02240C48
	add r0, r4, #0
	mov r1, #0x37
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02240514
	mov r0, #3
	strb r0, [r4, #8]
	bl _0223EE86
_0223E3A4:
	ldr r0, _0223E500 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #0
	bl ov83_0224777C
	add r6, r0, #0
	cmp r6, #3
	bne _0223E3C8
	ldr r0, _0223E4F8 ; =0x000005DC
	mov r1, #0
	bl StopSE
	ldr r0, _0223E510 ; =0x000005F3
	bl PlaySE
	bl _0223EE86
_0223E3C8:
	strb r5, [r4, #0x13]
	add r0, r4, #0
	bl ov83_0224037C
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	mov r1, #0
	ldr r2, _0223E514 ; =ov83_02247D48
	lsl r3, r6, #1
	ldrh r2, [r2, r3]
	add r0, r4, #0
	mov r3, #4
	str r1, [sp]
	bl ov83_02240C48
	add r0, r4, #0
	mov r1, #0x26
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02240514
	mov r0, #4
	strb r0, [r4, #8]
	bl _0223EE86
_0223E418:
	add r0, r4, #0
	bl ov83_0224037C
	add r0, r4, #0
	bl ov83_02240300
	mov r0, #1
	strb r0, [r4, #8]
	bl _0223EE86
_0223E42C:
	ldr r0, _0223E518 ; =0x0000084C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223E442
	cmp r0, #2
	bne _0223E43E
	b _0223E5F2
_0223E43E:
	bl _0223EE86
_0223E442:
	ldr r0, _0223E518 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _0223E51C ; =0x000007A4
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl sub_020310BC
	add r6, r0, #0
	ldr r0, _0223E500 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #0
	bl ov83_0224777C
	ldr r1, _0223E504 ; =0x00000848
	mov r2, #0xc
	ldr r1, [r4, r1]
	add r3, r1, #0
	mul r3, r2
	ldr r2, _0223E508 ; =ov83_02247F4C
	ldr r2, [r2, r3]
	cmp r0, r2
	bhs _0223E4C0
	ldr r0, _0223E4FC ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	add r0, r4, #0
	mov r1, #0x21
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E4C0:
	ldr r0, _0223E50C ; =ov83_02247D18
	lsl r2, r1, #1
	ldrh r0, [r0, r2]
	cmp r6, r0
	bhs _0223E520
	ldr r0, _0223E4FC ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	add r0, r4, #0
	mov r1, #0x20
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
	.balign 4, 0
_0223E4F0: .word 0x00000778
_0223E4F4: .word 0x00000838
_0223E4F8: .word 0x000005DC
_0223E4FC: .word 0x00000508
_0223E500: .word 0x0000050C
_0223E504: .word 0x00000848
_0223E508: .word ov83_02247F4C
_0223E50C: .word ov83_02247D18
_0223E510: .word 0x000005F3
_0223E514: .word ov83_02247D48
_0223E518: .word 0x0000084C
_0223E51C: .word 0x000007A4
_0223E520:
	cmp r1, #0
	bne _0223E552
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	bne _0223E5AC
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E552:
	cmp r1, #1
	bne _0223E574
	add r0, r5, #0
	bl ov83_022412DC
	cmp r0, #0
	bne _0223E5AC
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E574:
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	bne _0223E5AC
	add r0, r5, #0
	bl ov83_022412DC
	cmp r0, #0
	bne _0223E5AC
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E5AC:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223E5E4
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	sub r2, r2, #1
	lsl r3, r2, #1
	ldr r2, _0223E8D8 ; =ov83_02247D18
	ldrh r2, [r2, r3]
	bl ov80_02237FA4
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	bl ov83_02241770
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_022415F4
	mov r0, #0x13
	strb r0, [r4, #8]
	bl _0223EE86
_0223E5E4:
	ldrb r1, [r4, #0xe]
	mov r0, #2
	add sp, #4
	orr r0, r1
	strb r0, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0223E5F2:
	ldr r0, _0223E8DC ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_02240348
	mov r0, #2
	strb r0, [r4, #8]
	bl _0223EE86
_0223E608:
	ldr r0, _0223E8DC ; =0x0000084C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223E61C
	cmp r0, #2
	beq _0223E6A6
	bl _0223EE86
_0223E61C:
	ldr r0, _0223E8DC ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	add r5, r0, #0
	ldr r0, _0223E8E0 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #0
	bl ov83_0224777C
	lsl r1, r0, #1
	ldr r0, _0223E8E4 ; =ov83_02247D48
	ldrh r0, [r0, r1]
	cmp r5, r0
	bhs _0223E67E
	ldr r0, _0223E8E8 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	add r0, r4, #0
	mov r1, #0x29
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E67E:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223E698
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	mov r2, #4
	bl ov83_02241BC4
	mov r0, #5
	strb r0, [r4, #8]
	b _0223EE86
_0223E698:
	ldrb r1, [r4, #0xe]
	mov r0, #2
	add sp, #4
	orr r0, r1
	strb r0, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0223E6A6:
	ldr r0, _0223E8DC ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_02240348
	mov r0, #2
	strb r0, [r4, #8]
	b _0223EE86
_0223E6BA:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223E754
	mov r0, #6
	strb r0, [r4, #8]
	b _0223EE86
_0223E6CC:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223E754
	ldr r0, _0223E8EC ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_02240348
	ldr r0, _0223E8F0 ; =0x00000778
	mov r1, #0xcc
	ldr r0, [r4, r0]
	mov r2, #0x64
	bl ov83_02247630
	mov r0, #2
	strb r0, [r4, #8]
	b _0223EE86
_0223E6F2:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223E754
	ldr r0, _0223E8EC ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r4, #0
	bl ov83_02240348
	mov r0, #2
	strb r0, [r4, #8]
	b _0223EE86
_0223E714:
	ldr r2, _0223E8F4 ; =0x00000868
	mov r0, #2
	mov r1, #0
	add r2, r4, r2
	bl ov83_022477EC
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_020186A4
	ldr r1, _0223E8EC ; =0x000005DC
	add r5, r0, #0
	bl ov83_022477B0
	add r0, r4, #0
	bl ov83_02242E88
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bhi _0223E756
	bhs _0223E75C
	cmp r5, #8
	bhi _0223E754
	cmp r5, #6
	blo _0223E754
	beq _0223E76E
	cmp r5, #7
	beq _0223E784
	cmp r5, #8
	beq _0223E7C0
_0223E754:
	b _0223EE86
_0223E756:
	add r0, r0, #1
	cmp r5, r0
	b _0223EE86
_0223E75C:
	add r0, r4, #0
	bl ov83_022403B8
	add r0, r4, #0
	bl ov83_02240300
	mov r0, #1
	strb r0, [r4, #8]
	b _0223EE86
_0223E76E:
	add r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_022403B8
	add r0, r4, #0
	mov r1, #6
	bl ov83_022403C0
	mov r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223E784:
	add r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_022403B8
	ldr r0, _0223E8E0 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #1
	bl ov83_0224777C
	cmp r0, #1
	bne _0223E7B2
	add r0, r4, #0
	mov r1, #0x36
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #0xf
	strb r0, [r4, #8]
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0223E7B2:
	add r0, r4, #0
	mov r1, #7
	bl ov83_022403C0
	mov r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223E7C0:
	ldr r0, _0223E8E0 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #1
	bl ov83_0224777C
	add r6, r0, #0
	cmp r6, #3
	bne _0223E7E2
	ldr r0, _0223E8EC ; =0x000005DC
	mov r1, #0
	bl StopSE
	ldr r0, _0223E8F8 ; =0x000005F3
	bl PlaySE
	b _0223EE86
_0223E7E2:
	add r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_022403B8
	mov r1, #0
	ldr r2, _0223E8FC ; =ov83_02247D4E
	lsl r3, r6, #1
	ldrh r2, [r2, r3]
	add r0, r4, #0
	mov r3, #4
	str r1, [sp]
	bl ov83_02240C48
	add r0, r4, #0
	mov r1, #0x26
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02240514
	mov r0, #0xc
	strb r0, [r4, #8]
	b _0223EE86
_0223E814:
	ldr r0, _0223E900 ; =0x0000085C
	ldr r0, [r4, r0]
	bl ov83_02247BC4
	add r5, r0, #0
	mov r0, #2
	mvn r0, r0
	cmp r5, r0
	bhi _0223E84A
	bhs _0223E8AE
	cmp r5, #8
	bhi _0223E852
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223E838: ; jump table
	.short _0223E854 - _0223E838 - 2 ; case 0
	.short _0223E854 - _0223E838 - 2 ; case 1
	.short _0223E854 - _0223E838 - 2 ; case 2
	.short _0223E854 - _0223E838 - 2 ; case 3
	.short _0223E854 - _0223E838 - 2 ; case 4
	.short _0223E854 - _0223E838 - 2 ; case 5
	.short _0223E882 - _0223E838 - 2 ; case 6
	.short _0223E898 - _0223E838 - 2 ; case 7
	.short _0223E8B6 - _0223E838 - 2 ; case 8
_0223E84A:
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	beq _0223E8B6
_0223E852:
	b _0223EE86
_0223E854:
	ldr r0, _0223E904 ; =0x00000862
	mov r1, #6
	ldrsh r2, [r4, r0]
	mul r1, r2
	add r2, r5, r1
	sub r1, r0, #2
	strb r2, [r4, r1]
	sub r0, r0, #1
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _0223E916
	ldr r0, _0223E908 ; =0x000005DD
	bl PlaySE
	lsl r1, r5, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl ov83_02242F18
	mov r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E882:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov83_02242F18
	mov r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E898:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	add r0, r4, #0
	mov r1, #7
	bl ov83_02242F18
	mov r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E8AE:
	ldr r0, _0223E8EC ; =0x000005DC
	bl PlaySE
	b _0223EE86
_0223E8B6:
	ldr r0, _0223E908 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #8
	bl ov83_02242F18
	mov r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E8CA:
	bl ov83_02242F2C
	cmp r0, #1
	beq _0223E916
	ldr r0, _0223E90C ; =0x00000864
	b _0223E910
	nop
_0223E8D8: .word ov83_02247D18
_0223E8DC: .word 0x0000084C
_0223E8E0: .word 0x0000050C
_0223E8E4: .word ov83_02247D48
_0223E8E8: .word 0x00000508
_0223E8EC: .word 0x000005DC
_0223E8F0: .word 0x00000778
_0223E8F4: .word 0x00000868
_0223E8F8: .word 0x000005F3
_0223E8FC: .word ov83_02247D4E
_0223E900: .word 0x0000085C
_0223E904: .word 0x00000862
_0223E908: .word 0x000005DD
_0223E90C: .word 0x00000864
_0223E910:
	ldrh r1, [r4, r0]
	cmp r1, #8
	bls _0223E918
_0223E916:
	b _0223EE86
_0223E918:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223E924: ; jump table
	.short _0223E936 - _0223E924 - 2 ; case 0
	.short _0223E936 - _0223E924 - 2 ; case 1
	.short _0223E936 - _0223E924 - 2 ; case 2
	.short _0223E936 - _0223E924 - 2 ; case 3
	.short _0223E936 - _0223E924 - 2 ; case 4
	.short _0223E936 - _0223E924 - 2 ; case 5
	.short _0223E982 - _0223E924 - 2 ; case 6
	.short _0223E9CA - _0223E924 - 2 ; case 7
	.short _0223EA14 - _0223E924 - 2 ; case 8
_0223E936:
	add r0, r4, #0
	bl ov83_022428A8
	ldr r0, _0223EC84 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	mov r1, #0x86
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240EC4
	add r2, r0, #0
	mov r1, #0
	add r0, r4, #0
	mov r3, #3
	str r1, [sp]
	bl ov83_02240C48
	add r0, r4, #0
	mov r1, #0x37
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02240514
	mov r0, #0xb
	strb r0, [r4, #8]
	b _0223EE86
_0223E982:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _0223E9A2
	sub r0, r0, #3
	ldrb r0, [r4, r0]
	mov r1, #6
	sub r0, r0, #1
	bl _s32_div_f
	ldr r1, _0223EC88 ; =0x00000862
	strh r0, [r4, r1]
_0223E9A2:
	add r0, r4, #0
	bl ov83_02240664
	add r0, r4, #0
	bl ov83_02240748
	add r0, r4, #0
	bl ov83_022407FC
	ldr r0, _0223EC8C ; =0x0000085C
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r4, #0
	bl ov83_022408E0
	mov r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223E9CA:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	sub r0, r0, #3
	ldrb r0, [r4, r0]
	mov r1, #6
	sub r0, r0, #1
	bl _s32_div_f
	ldr r1, _0223EC88 ; =0x00000862
	ldrsh r2, [r4, r1]
	cmp r0, r2
	bge _0223E9EC
	mov r0, #0
	strh r0, [r4, r1]
_0223E9EC:
	add r0, r4, #0
	bl ov83_02240664
	add r0, r4, #0
	bl ov83_02240748
	add r0, r4, #0
	bl ov83_022407FC
	ldr r0, _0223EC8C ; =0x0000085C
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r4, #0
	bl ov83_022408E0
	mov r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223EA14:
	add r0, r4, #0
	bl ov83_0224042C
	add r0, r4, #0
	bl ov83_02240384
	mov r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223EA26:
	ldr r0, _0223EC90 ; =0x0000084C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223EA3A
	cmp r0, #2
	bne _0223EA38
	b _0223EB7E
_0223EA38:
	b _0223EE86
_0223EA3A:
	ldr r0, _0223EC90 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	mov r1, #0x86
	lsl r1, r1, #4
	add r5, r0, #0
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240EC4
	cmp r5, r0
	bhs _0223EA96
	ldr r0, _0223EC84 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	add r0, r4, #0
	mov r1, #0x20
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #0x10
	strb r0, [r4, #8]
	b _0223EE86
_0223EA96:
	ldr r0, _0223EC94 ; =0x00000804
	mov r1, #6
	ldr r5, [r4, r0]
	mov r2, #0
	add r0, r5, #0
	bl GetMonData
	cmp r0, #0
	bne _0223EB36
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223EB0A
	add r0, r4, #0
	bl ov83_0224042C
	ldr r0, _0223EC84 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	mov r1, #0x86
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240EC4
	add r2, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	bl ov80_02237FA4
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	bl ov83_02241770
	mov r1, #0x86
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240F48
	add r2, r0, #0
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	bl ov83_022416A0
	mov r0, #0x13
	strb r0, [r4, #8]
	b _0223EE86
_0223EB0A:
	mov r1, #0x86
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240F48
	strh r0, [r4, #0x10]
	add r0, r4, #0
	bl ov83_0224042C
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	ldrb r1, [r4, #0xe]
	mov r0, #2
	add sp, #4
	orr r0, r1
	strb r0, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0223EB36:
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov83_02240C60
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl BufferItemNameWithIndefArticle
	ldr r0, _0223EC84 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	add r0, r4, #0
	mov r1, #0x3c
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #0x11
	strb r0, [r4, #8]
	b _0223EE86
_0223EB7E:
	ldr r0, _0223EC90 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_0224175C
	mov r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223EB92:
	ldr r0, _0223EC90 ; =0x0000084C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223EBA4
	cmp r0, #2
	beq _0223EC2C
	b _0223EE86
_0223EBA4:
	ldr r0, _0223EC90 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	add r5, r0, #0
	ldr r0, _0223EC98 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #1
	bl ov83_0224777C
	lsl r1, r0, #1
	ldr r0, _0223EC9C ; =ov83_02247D4E
	ldrh r0, [r0, r1]
	cmp r5, r0
	bhs _0223EC04
	ldr r0, _0223EC84 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	add r0, r4, #0
	mov r1, #0x29
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	mov r0, #0xf
	strb r0, [r4, #8]
	b _0223EE86
_0223EC04:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223EC1E
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	mov r2, #8
	bl ov83_02241BC4
	mov r0, #0xd
	strb r0, [r4, #8]
	b _0223EE86
_0223EC1E:
	ldrb r1, [r4, #0xe]
	mov r0, #2
	add sp, #4
	orr r0, r1
	strb r0, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0223EC2C:
	ldr r0, _0223EC90 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_02240384
	mov r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223EC40:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223ED10
	mov r0, #0xe
	strb r0, [r4, #8]
	b _0223EE86
_0223EC52:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223ECA0 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_02240384
	ldr r0, _0223ECA4 ; =0x00000778
	mov r1, #0xd3
	ldr r0, [r4, r0]
	mov r2, #0x6a
	bl ov83_02247630
	mov r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223EC78:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223ECA0 ; =0x000005DC
	b _0223ECA8
	.balign 4, 0
_0223EC84: .word 0x00000508
_0223EC88: .word 0x00000862
_0223EC8C: .word 0x0000085C
_0223EC90: .word 0x0000084C
_0223EC94: .word 0x00000804
_0223EC98: .word 0x0000050C
_0223EC9C: .word ov83_02247D4E
_0223ECA0: .word 0x000005DC
_0223ECA4: .word 0x00000778
_0223ECA8:
	bl PlaySE
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r4, #0
	bl ov83_02240384
	mov r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223ECC0:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223EE8C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_0224175C
	mov r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223ECDA:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223EE8C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x3d
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02240514
	mov r0, #0x12
	strb r0, [r4, #8]
	b _0223EE86
_0223ED00:
	ldr r0, _0223EE90 ; =0x0000084C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223ED12
	cmp r0, #2
	beq _0223EDAE
_0223ED10:
	b _0223EE86
_0223ED12:
	ldr r0, _0223EE90 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_02240664
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223ED82
	add r0, r4, #0
	bl ov83_0224042C
	ldr r0, _0223EE94 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	mov r1, #0x86
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240EC4
	add r2, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	bl ov80_02237FA4
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	bl ov83_02241770
	mov r1, #0x86
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240F48
	add r2, r0, #0
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	bl ov83_022416A0
	mov r0, #0x13
	strb r0, [r4, #8]
	b _0223EE86
_0223ED82:
	mov r1, #0x86
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240F48
	strh r0, [r4, #0x10]
	add r0, r4, #0
	bl ov83_0224042C
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	ldrb r1, [r4, #0xe]
	mov r0, #2
	add sp, #4
	orr r0, r1
	strb r0, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0223EDAE:
	ldr r0, _0223EE90 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_0224175C
	mov r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223EDC2:
	ldr r2, _0223EE98 ; =0x00000868
	mov r0, #2
	mov r1, #0
	add r2, r4, r2
	bl ov83_022477EC
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223EE86
	mov r0, #0x14
	strb r0, [r4, #8]
	b _0223EE86
_0223EDE2:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223EE86
	ldr r0, _0223EE8C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r4, #0
	bl ov83_02240290
	mov r0, #0
	strb r0, [r4, #8]
	b _0223EE86
_0223EE04:
	ldr r1, _0223EE9C ; =gSystem
	ldr r3, [r1, #0x48]
	mov r1, #0x20
	add r2, r3, #0
	tst r2, r1
	beq _0223EE18
	sub r1, #0x21
	bl ov83_02241208
	b _0223EE86
_0223EE18:
	mov r1, #0x10
	tst r1, r3
	beq _0223EE26
	mov r1, #1
	bl ov83_02241208
	b _0223EE86
_0223EE26:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223EE86
	ldr r0, _0223EE8C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_02241B18
	add r0, r4, #0
	bl ov83_02240300
	mov r0, #1
	strb r0, [r4, #8]
	b _0223EE86
_0223EE46:
	ldr r1, _0223EE9C ; =gSystem
	ldr r3, [r1, #0x48]
	mov r1, #0x20
	add r2, r3, #0
	tst r2, r1
	beq _0223EE5A
	sub r1, #0x21
	bl ov83_02241254
	b _0223EE86
_0223EE5A:
	mov r1, #0x10
	tst r1, r3
	beq _0223EE68
	mov r1, #1
	bl ov83_02241254
	b _0223EE86
_0223EE68:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223EE86
	ldr r0, _0223EE8C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_02241B18
	add r0, r4, #0
	bl ov83_02240300
	mov r0, #1
	strb r0, [r4, #8]
_0223EE86:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223EE8C: .word 0x000005DC
_0223EE90: .word 0x0000084C
_0223EE94: .word 0x00000508
_0223EE98: .word 0x00000868
_0223EE9C: .word gSystem
	thumb_func_end ov83_0223E14C

	thumb_func_start ov83_0223EEA0
ov83_0223EEA0: ; 0x0223EEA0
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #4
	bhi _0223EF96
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223EEB6: ; jump table
	.short _0223EEC0 - _0223EEB6 - 2 ; case 0
	.short _0223EEF2 - _0223EEB6 - 2 ; case 1
	.short _0223EF1E - _0223EEB6 - 2 ; case 2
	.short _0223EF40 - _0223EEB6 - 2 ; case 3
	.short _0223EF5E - _0223EEB6 - 2 ; case 4
_0223EEC0:
	ldrb r1, [r4, #0xe]
	mov r0, #0x60
	ldr r2, _0223EF9C ; =0x00000868
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #2
	mov r1, #0
	add r2, r4, r2
	bl ov83_022477EC
	ldrb r2, [r4, #0xd]
	add r0, r4, #0
	mov r1, #0xb
	bl ov83_02241368
	cmp r0, #1
	bne _0223EF96
	ldrb r1, [r4, #0xe]
	mov r0, #2
	bic r1, r0
	strb r1, [r4, #0xe]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EEF2:
	ldrb r1, [r4, #0x12]
	cmp r1, #0xff
	beq _0223EF96
	mov r1, #0
	strb r1, [r4, #0xf]
	ldrb r2, [r4, #0x13]
	cmp r2, #4
	beq _0223EF06
	cmp r2, #8
	bne _0223EF10
_0223EF06:
	ldrb r1, [r4, #0x12]
	add r0, r4, #0
	bl ov83_02241BC4
	b _0223EF16
_0223EF10:
	ldrb r1, [r4, #0x12]
	bl ov83_022418E8
_0223EF16:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EF1E:
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x12]
	bl ov83_0224776C
	add r1, r0, #0
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223EF96
	mov r0, #0x1e
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EF40:
	ldrb r0, [r4, #0xb]
	sub r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223EF96
	bl sub_02037BEC
	mov r0, #0x82
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EF5E:
	mov r0, #0x82
	bl sub_02037B38
	cmp r0, #1
	bne _0223EF96
	bl sub_02037BEC
	mov r0, #0x6b
	bl sub_020379A0
	mov r0, #0xff
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0xe]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	bne _0223EF8C
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r4, #0
	bl ov83_02240290
_0223EF8C:
	ldr r0, _0223EFA0 ; =0x000007FE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0223EF96:
	mov r0, #0
	pop {r4, pc}
	nop
_0223EF9C: .word 0x00000868
_0223EFA0: .word 0x000007FE
	thumb_func_end ov83_0223EEA0

	thumb_func_start ov83_0223EFA4
ov83_0223EFA4: ; 0x0223EFA4
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223EFB8
	cmp r1, #1
	beq _0223EFD0
	cmp r1, #2
	beq _0223EFF2
	b _0223F00C
_0223EFB8:
	mov r1, #0xd
	mov r2, #0
	bl ov83_02241368
	cmp r0, #1
	bne _0223F00C
	mov r0, #0x1e
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F00C
_0223EFD0:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0223EFDA
	sub r0, r0, #1
	strb r0, [r4, #0xb]
_0223EFDA:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223F00C
	bl sub_02037BEC
	mov r0, #0x83
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F00C
_0223EFF2:
	mov r0, #0x83
	bl sub_02037B38
	cmp r0, #1
	bne _0223F00C
	bl sub_02037BEC
	add r4, #0xb0
	add r0, r4, #0
	bl ov83_02241354
	mov r0, #1
	pop {r4, pc}
_0223F00C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov83_0223EFA4

	thumb_func_start ov83_0223F010
ov83_0223F010: ; 0x0223F010
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0223F022
	cmp r0, #1
	beq _0223F042
	b _0223F050
_0223F022:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F050
_0223F042:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223F050
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0223F050:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov83_0223F010

	thumb_func_start ov83_0223F058
ov83_0223F058: ; 0x0223F058
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0223F18C ; =0x0000084C
	add r0, r5, r0
	bl ov83_02247858
	ldr r0, _0223F190 ; =0x0000083C
	ldr r0, [r5, r0]
	bl ov83_02247CC4
	ldr r0, _0223F194 ; =0x00000838
	ldr r0, [r5, r0]
	bl ov83_02247A18
	ldr r0, _0223F198 ; =0x00000734
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F19C ; =0x00000738
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1A0 ; =0x00000778
	ldr r0, [r5, r0]
	bl ov83_0224753C
	mov r0, #0x76
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1A4 ; =0x00000764
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1A8 ; =0x0000077C
	ldr r0, [r5, r0]
	bl ov83_0224753C
	mov r0, #0x1e
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1AC ; =0x0000079C
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B24
	add r7, r0, #0
	mov r6, #0
	cmp r7, #0
	ble _0223F0EA
	add r4, r5, #0
_0223F0CA:
	ldr r0, _0223F1B0 ; =0x0000073C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _0223F1B4 ; =0x0000074C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _0223F1B8 ; =0x00000768
	ldr r0, [r4, r0]
	bl ov83_0224753C
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r7
	blt _0223F0CA
_0223F0EA:
	ldr r7, _0223F1BC ; =0x00000784
	mov r6, #0
	add r4, r5, #0
_0223F0F0:
	ldr r0, [r4, r7]
	bl ov83_0224753C
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blt _0223F0F0
	bl sub_0203A914
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl sub_02003104
	mov r0, #5
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r5, r0]
	add r0, #0x18
	add r0, r5, r0
	bl ov83_022471FC
	ldr r0, [r5, #0x20]
	bl DestroyMsgData
	ldr r0, [r5, #0x1c]
	bl DestroyMsgData
	ldr r0, [r5, #0x24]
	bl ScrStrBufs_delete
	ldr r0, [r5, #0x28]
	bl String_dtor
	ldr r0, [r5, #0x2c]
	bl String_dtor
	ldr r0, _0223F1C0 ; =0x00000504
	ldr r0, [r5, r0]
	bl MessagePrinter_delete
	mov r0, #4
	bl FontID_Release
	mov r6, #0
	add r4, r5, #0
_0223F164:
	ldr r0, [r4, #0x30]
	bl String_dtor
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	blt _0223F164
	add r0, r5, #0
	add r0, #0x50
	mov r1, #0
	bl ov83_0224791C
	ldr r0, [r5, #0x4c]
	bl ov83_0223F734
	ldr r0, _0223F1C4 ; =0x000007A8
	ldr r0, [r5, r0]
	bl NARC_dtor
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F18C: .word 0x0000084C
_0223F190: .word 0x0000083C
_0223F194: .word 0x00000838
_0223F198: .word 0x00000734
_0223F19C: .word 0x00000738
_0223F1A0: .word 0x00000778
_0223F1A4: .word 0x00000764
_0223F1A8: .word 0x0000077C
_0223F1AC: .word 0x0000079C
_0223F1B0: .word 0x0000073C
_0223F1B4: .word 0x0000074C
_0223F1B8: .word 0x00000768
_0223F1BC: .word 0x00000784
_0223F1C0: .word 0x00000504
_0223F1C4: .word 0x000007A8
	thumb_func_end ov83_0223F058

	thumb_func_start ov83_0223F1C8
ov83_0223F1C8: ; 0x0223F1C8
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
	ldr r0, _0223F1F8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0223F1FC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0223F1F8: .word 0xFFFFE0FF
_0223F1FC: .word 0x04001000
	thumb_func_end ov83_0223F1C8

	thumb_func_start ov83_0223F200
ov83_0223F200: ; 0x0223F200
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r0, #0
	mov r0, #0xb7
	mov r1, #0x6b
	bl NARC_ctor
	ldr r1, _0223F594 ; =0x000007A8
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov83_0223F690
	add r0, r5, #0
	bl ov83_0223F70C
	mov r0, #4
	mov r1, #0x6b
	bl FontID_Alloc
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x1f
	mov r3, #0x6b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x20]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xdd
	mov r3, #0x6b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x1c]
	mov r0, #0x6b
	bl ScrStrBufs_new
	str r0, [r5, #0x24]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x6b
	bl String_ctor
	str r0, [r5, #0x28]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x6b
	bl String_ctor
	str r0, [r5, #0x2c]
	mov r6, #0
	add r4, r5, #0
	mov r7, #0x20
_0223F268:
	add r0, r7, #0
	mov r1, #0x6b
	bl String_ctor
	str r0, [r4, #0x30]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	blt _0223F268
	mov r1, #7
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x6b
	bl LoadFontPal0
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x6b
	bl LoadFontPal1
	mov r0, #1
	mov r1, #2
	mov r2, #0
	mov r3, #0x6b
	bl MessagePrinter_new
	ldr r1, _0223F598 ; =0x00000504
	mov r2, #0
	str r0, [r5, r1]
	add r1, r5, #0
	ldr r0, [r5, #0x4c]
	add r1, #0x50
	bl ov83_022478D4
	add r0, sp, #0x30
	add r1, sp, #0x34
	add r3, sp, #0x30
	str r0, [sp]
	add r0, r5, #0
	add r1, #2
	add r2, sp, #0x34
	add r3, #2
	bl ov83_02240F7C
	mov r1, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0xa0
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	ldr r0, _0223F59C ; =0x00000518
	str r1, [sp, #0xc]
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5A0 ; =0x00000734
	str r0, [r5, r1]
	mov r1, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #0xa0
	str r0, [sp, #4]
	mov r0, #0x7c
	str r0, [sp, #8]
	ldr r0, _0223F59C ; =0x00000518
	str r1, [sp, #0xc]
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5A4 ; =0x00000738
	str r0, [r5, r1]
	sub r0, r1, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov83_0224755C
	ldr r0, _0223F5A4 ; =0x00000738
	mov r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223F32C
	mov r0, #0x48
	mov r7, #0x40
	str r0, [sp, #0x18]
	b _0223F332
_0223F32C:
	mov r0, #0x28
	mov r7, #0x20
	str r0, [sp, #0x18]
_0223F332:
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B24
	mov r6, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	bgt _0223F344
	b _0223F45C
_0223F344:
	add r4, r5, #0
_0223F346:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r1, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x3e
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0223F59C ; =0x00000518
	add r2, r1, #0
	add r0, r5, r0
	add r3, r1, #0
	bl ov83_02247454
	ldr r1, _0223F5A8 ; =0x0000074C
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x58
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	str r0, [sp, #0x1c]
	bl GetMonData
	cmp r0, #0
	bne _0223F394
	ldr r0, _0223F5A8 ; =0x0000074C
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov83_0224755C
_0223F394:
	ldr r0, [sp, #0x1c]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x30
	bl sub_020880B0
	add r1, r0, #0
	add r0, r5, #0
	bl ov83_022411B0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x30
	bl sub_020880B0
	add r1, r0, #0
	add r0, r5, #0
	bl ov83_022411DC
	mov r1, #0
	str r0, [sp]
	lsl r0, r7, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x4e
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0223F59C ; =0x00000518
	add r2, r1, #0
	add r0, r5, r0
	add r3, r1, #0
	bl ov83_02247454
	ldr r1, _0223F5AC ; =0x00000768
	mov r2, #0xa
	str r0, [r4, r1]
	ldr r0, [sp, #0x28]
	add r1, r6, #0
	str r0, [sp]
	lsl r0, r7, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x3a
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0223F59C ; =0x00000518
	add r1, #0xa
	add r0, r5, r0
	mov r3, #5
	bl ov83_02247454
	ldr r1, _0223F5B0 ; =0x0000073C
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x68
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _0223F5B0 ; =0x0000073C
	ldr r0, [r4, r0]
	bl ov83_022475EC
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	add r0, #0x40
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r4, r4, #4
	add r7, #0x40
	cmp r6, r0
	bge _0223F45C
	b _0223F346
_0223F45C:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0xa0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0223F59C ; =0x00000518
	str r1, [sp, #0x10]
	mov r1, #3
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov83_022474C4
	ldr r1, _0223F5B4 ; =0x0000079C
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0
	bl ov83_0224755C
	mov r4, #0
	add r6, r5, #0
	add r7, r4, #0
_0223F48C:
	add r1, sp, #0x2c
	add r0, r4, #0
	add r1, #2
	add r2, sp, #0x2c
	bl ov83_02242894
	str r7, [sp]
	add r1, sp, #0x2c
	mov r0, #2
	ldrsh r0, [r1, r0]
	mov r3, #4
	str r0, [sp, #4]
	mov r0, #0
	ldrsh r0, [r1, r0]
	add r1, r4, #4
	add r2, r1, #0
	str r0, [sp, #8]
	ldr r0, _0223F59C ; =0x00000518
	str r7, [sp, #0xc]
	add r0, r5, r0
	str r7, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5B8 ; =0x00000784
	str r0, [r6, r1]
	add r0, r1, #0
	ldr r0, [r6, r0]
	mov r1, #0
	bl ov83_0224755C
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #6
	blt _0223F48C
	add r0, r5, #0
	add r1, sp, #0x3c
	add r2, sp, #0x38
	mov r3, #0
	bl ov83_02240E70
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	mov r1, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	add r2, r1, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _0223F59C ; =0x00000518
	add r3, r1, #0
	add r0, r5, r0
	str r1, [sp, #0x10]
	bl ov83_02247454
	mov r1, #0x76
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	ldr r1, [sp, #0x3c]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #4]
	ldr r1, [sp, #0x38]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #8]
	mov r1, #0
	str r0, [sp, #0xc]
	ldr r0, _0223F59C ; =0x00000518
	add r2, r1, #0
	add r0, r5, r0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5BC ; =0x00000764
	str r0, [r5, r1]
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223F548
	ldr r0, _0223F5BC ; =0x00000764
	mov r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
_0223F548:
	mov r0, #0xb
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _0223F59C ; =0x00000518
	str r1, [sp, #0xc]
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5C0 ; =0x00000778
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0
	bl ov83_0224755C
	mov r1, #0
	mov r0, #3
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _0223F59C ; =0x00000518
	add r2, r1, #0
	add r0, r5, r0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5C4 ; =0x0000077C
	b _0223F5C8
	nop
_0223F594: .word 0x000007A8
_0223F598: .word 0x00000504
_0223F59C: .word 0x00000518
_0223F5A0: .word 0x00000734
_0223F5A4: .word 0x00000738
_0223F5A8: .word 0x0000074C
_0223F5AC: .word 0x00000768
_0223F5B0: .word 0x0000073C
_0223F5B4: .word 0x0000079C
_0223F5B8: .word 0x00000784
_0223F5BC: .word 0x00000764
_0223F5C0: .word 0x00000778
_0223F5C4: .word 0x0000077C
_0223F5C8:
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0
	bl ov83_0224755C
	add r0, r5, #0
	bl ov83_02241E18
	add r0, r5, #0
	bl ov83_02241FF0
	add r0, r5, #0
	mov r1, #1
	bl ov83_022421E0
	mov r1, #0
	str r1, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r0, #0x28
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0223F67C ; =0x00000518
	str r1, [sp, #0x10]
	mov r1, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov83_022474C4
	mov r3, #0x1e
	lsl r3, r3, #6
	add r2, r3, #0
	str r0, [r5, r3]
	add r1, r3, #0
	add r2, #0x8c
	ldr r0, [r5, r3]
	add r1, #0x88
	add r3, #0x94
	ldrh r2, [r5, r2]
	ldr r1, [r5, r1]
	ldr r3, [r5, r3]
	bl ov83_02247668
	ldrb r2, [r5, #0x14]
	add r0, r5, #0
	mov r1, #1
	bl ov83_02247A24
	ldr r1, _0223F680 ; =0x00000838
	str r0, [r5, r1]
	ldr r1, _0223F67C ; =0x00000518
	ldr r0, [r5, r1]
	sub r1, #0x18
	ldr r1, [r5, r1]
	bl ov83_02247CB8
	ldr r1, _0223F684 ; =0x0000083C
	str r0, [r5, r1]
	add r1, #0x10
	add r0, r5, r1
	bl ov83_02247844
	bl sub_02037474
	cmp r0, #0
	beq _0223F660
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	bl sub_0203A880
_0223F660:
	mov r0, #0xa
	str r0, [sp]
	ldr r0, _0223F688 ; =0x04000050
	mov r1, #0
	mov r2, #0xe
	mov r3, #6
	bl G2x_SetBlendAlpha_
	ldr r0, _0223F68C ; =ov83_0223F7A0
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F67C: .word 0x00000518
_0223F680: .word 0x00000838
_0223F684: .word 0x0000083C
_0223F688: .word 0x04000050
_0223F68C: .word ov83_0223F7A0
	thumb_func_end ov83_0223F200

	thumb_func_start ov83_0223F690
ov83_0223F690: ; 0x0223F690
	push {r4, lr}
	ldr r2, _0223F700 ; =0x04000304
	add r4, r0, #0
	ldrh r1, [r2]
	ldr r0, _0223F704 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2]
	bl ov83_0223F7E4
	ldr r0, [r4, #0x4c]
	bl ov83_0223F804
	mov r0, #0x6b
	bl sub_020030E8
	mov r1, #5
	lsl r1, r1, #8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	lsl r2, r1, #8
	mov r3, #0x6b
	bl PaletteData_AllocBuffers
	mov r0, #5
	lsl r0, r0, #8
	mov r2, #2
	ldr r0, [r4, r0]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x6b
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	mov r1, #3
	bl ov83_0223FA00
	bl ov83_0223FA74
	add r0, r4, #0
	mov r1, #2
	bl ov83_0223FAA8
	bl ov83_0223FAF0
	ldr r2, _0223F708 ; =0x00000868
	mov r0, #2
	mov r1, #0
	add r2, r4, r2
	bl ov83_022477EC
	add r0, r4, #0
	mov r1, #4
	bl ov83_0223FBEC
	pop {r4, pc}
	.balign 4, 0
_0223F700: .word 0x04000304
_0223F704: .word 0xFFFF7FFF
_0223F708: .word 0x00000868
	thumb_func_end ov83_0223F690

	thumb_func_start ov83_0223F70C
ov83_0223F70C: ; 0x0223F70C
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	add r2, r0, #0
	ldr r1, _0223F72C ; =0x000007A4
	ldr r0, _0223F730 ; =0x00000518
	lsl r2, r2, #0x18
	ldr r1, [r4, r1]
	add r0, r4, r0
	lsr r2, r2, #0x18
	bl ov83_02246E08
	pop {r4, pc}
	nop
_0223F72C: .word 0x000007A4
_0223F730: .word 0x00000518
	thumb_func_end ov83_0223F70C

	thumb_func_start ov83_0223F734
ov83_0223F734: ; 0x0223F734
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
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	ldr r2, _0223F79C ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_0223F79C: .word 0x04000304
	thumb_func_end ov83_0223F734

	thumb_func_start ov83_0223F7A0
ov83_0223F7A0: ; 0x0223F7A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223F7B2
	bl sub_0200398C
_0223F7B2:
	ldr r0, [r4, #0x4c]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r0, _0223F7D8 ; =0x00000868
	add r0, r4, r0
	bl ov83_0224780C
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _0223F7DC ; =0x027E0000
	ldr r1, _0223F7E0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0223F7D8: .word 0x00000868
_0223F7DC: .word 0x027E0000
_0223F7E0: .word 0x00003FF8
	thumb_func_end ov83_0223F7A0

	thumb_func_start ov83_0223F7E4
ov83_0223F7E4: ; 0x0223F7E4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0223F800 ; =ov83_02247E88
	add r3, sp, #0
	mov r2, #5
_0223F7EE:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0223F7EE
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0223F800: .word ov83_02247E88
	thumb_func_end ov83_0223F7E4

	thumb_func_start ov83_0223F804
ov83_0223F804: ; 0x0223F804
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	ldr r5, _0223F9D8 ; =ov83_02247D38
	add r3, sp, #0xe0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0223F9DC ; =ov83_02247DA0
	add r3, sp, #0xc4
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
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223F9E0 ; =ov83_02247DBC
	add r3, sp, #0xa8
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
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223F9E4 ; =ov83_02247DF4
	add r3, sp, #0x8c
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223F9E8 ; =ov83_02247E10
	add r3, sp, #0x70
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
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223F9EC ; =ov83_02247E2C
	add r3, sp, #0x54
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
	ldr r5, _0223F9F0 ; =ov83_02247E48
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223F9F4 ; =ov83_02247D84
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223F9F8 ; =ov83_02247DD8
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r1, _0223F9FC ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223F9D8: .word ov83_02247D38
_0223F9DC: .word ov83_02247DA0
_0223F9E0: .word ov83_02247DBC
_0223F9E4: .word ov83_02247DF4
_0223F9E8: .word ov83_02247E10
_0223F9EC: .word ov83_02247E2C
_0223F9F0: .word ov83_02247E48
_0223F9F4: .word ov83_02247D84
_0223F9F8: .word ov83_02247DD8
_0223F9FC: .word 0x04000008
	thumb_func_end ov83_0223F804

	thumb_func_start ov83_0223FA00
ov83_0223FA00: ; 0x0223FA00
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FA70 ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x22
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0223FA4E
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FA70 ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x23
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0223FA4E:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FA70 ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x24
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223FA70: .word 0x000007A8
	thumb_func_end ov83_0223FA00

	thumb_func_start ov83_0223FA74
ov83_0223FA74: ; 0x0223FA74
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xb7
	mov r1, #0x9c
	add r2, sp, #0
	mov r3, #0x6b
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
	thumb_func_end ov83_0223FA74

	thumb_func_start ov83_0223FAA8
ov83_0223FAA8: ; 0x0223FAA8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FAEC ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x22
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FAEC ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x2a
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223FAEC: .word 0x000007A8
	thumb_func_end ov83_0223FAA8

	thumb_func_start ov83_0223FAF0
ov83_0223FAF0: ; 0x0223FAF0
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xb7
	mov r1, #0x9c
	add r2, sp, #0
	mov r3, #0x6b
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0x80
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl GX_LoadBGPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov83_0223FAF0

	thumb_func_start ov83_0223FB24
ov83_0223FB24: ; 0x0223FB24
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FB68 ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x22
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FB68 ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x2b
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223FB68: .word 0x000007A8
	thumb_func_end ov83_0223FB24

	thumb_func_start ov83_0223FB6C
ov83_0223FB6C: ; 0x0223FB6C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 ; =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	mov r1, #0x22
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 ; =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	mov r1, #0x26
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 ; =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	mov r1, #0x28
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 ; =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	mov r1, #0x29
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r4, pc}
	nop
_0223FBE8: .word 0x000007A8
	thumb_func_end ov83_0223FB6C

	thumb_func_start ov83_0223FBEC
ov83_0223FBEC: ; 0x0223FBEC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FC44 ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x28
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FC44 ; =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	mov r1, #0x93
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x6b
	str r0, [sp, #4]
	ldr r0, _0223FC44 ; =0x000007A8
	mov r1, #0xbe
	ldr r0, [r5, r0]
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223FC44: .word 0x000007A8
	thumb_func_end ov83_0223FBEC

	thumb_func_start ov83_0223FC48
ov83_0223FC48: ; 0x0223FC48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	add r7, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r3, r7, #0
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x28]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add r5, r0, #0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_0223FC48

	thumb_func_start ov83_0223FCB4
ov83_0223FCB4: ; 0x0223FCB4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	add r6, r3, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x20]
	add r2, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r3, r6, #0
	str r0, [sp, #4]
	add r0, sp, #0x30
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x34
	ldrb r1, [r1]
	ldr r2, [r5, #0x28]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add r5, r0, #0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov83_0223FCB4

	thumb_func_start ov83_0223FD14
ov83_0223FD14: ; 0x0223FD14
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r3, #1
	add r4, r1, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	mov r1, #0xf
	str r1, [sp, #0x10]
	add r5, r0, #0
	add r1, r5, #0
	str r2, [sp, #0x14]
	add r1, #0xb0
	add r2, r4, #0
	bl ov83_0223FC48
	add r5, #0xb0
	add r4, r0, #0
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_0223FD14

	thumb_func_start ov83_0223FD4C
ov83_0223FD4C: ; 0x0223FD4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferItemName
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x46
	mov r3, #1
	bl ov83_0223FF20
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x47
	mov r3, #0x40
	bl ov83_0223FF20
	add r0, r6, #0
	bl GetMonNature
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferNatureName
	mov r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x48
	mov r3, #1
	bl ov83_0223FF20
	mov r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x49
	mov r3, #0x40
	bl ov83_0223FF20
	add r0, r6, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferAbilityName
	mov r0, #0x28
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x4a
	mov r3, #1
	bl ov83_0223FF20
	mov r0, #0x28
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x4b
	mov r3, #0x40
	bl ov83_0223FF20
	add r0, r6, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x38
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x4c
	mov r3, #1
	bl ov83_0223FF20
	mov r3, #0x38
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x4d
	str r3, [sp]
	bl ov83_0223FF20
	add r0, r6, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x38
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x4e
	mov r3, #0x58
	bl ov83_0223FF20
	mov r0, #0x38
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x4f
	mov r3, #0x90
	bl ov83_0223FF20
	add r0, r6, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x48
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x50
	mov r3, #1
	bl ov83_0223FF20
	mov r0, #0x48
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x51
	mov r3, #0x38
	bl ov83_0223FF20
	add r0, r6, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x48
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x52
	mov r3, #0x58
	bl ov83_0223FF20
	mov r0, #0x48
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x53
	mov r3, #0x90
	bl ov83_0223FF20
	add r0, r6, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x58
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x54
	mov r3, #1
	bl ov83_0223FF20
	mov r0, #0x58
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x55
	mov r3, #0x38
	bl ov83_0223FF20
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov83_0223FD4C

	thumb_func_start ov83_0223FF20
ov83_0223FF20: ; 0x0223FF20
	push {r4, lr}
	sub sp, #0x18
	add r4, sp, #0x10
	ldrh r4, [r4, #0x10]
	str r4, [sp]
	mov r4, #0xff
	str r4, [sp, #4]
	mov r4, #1
	str r4, [sp, #8]
	mov r4, #2
	str r4, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	bl ov83_0223FCB4
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov83_0223FF20

	thumb_func_start ov83_0223FF44
ov83_0223FF44: ; 0x0223FF44
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	add r4, r2, #0
	bl FillWindowPixelBuffer
	mov r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, #0x36
	str r0, [sp, #8]
	mov r0, #0x3a
	str r0, [sp, #0xc]
	mov r0, #0x42
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0
	mov r3, #0x60
	bl ov83_0223FFD8
	mov r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, #0x37
	str r0, [sp, #8]
	mov r0, #0x3b
	str r0, [sp, #0xc]
	mov r0, #0x43
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #1
	mov r3, #0x61
	bl ov83_0223FFD8
	mov r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, #0x38
	str r0, [sp, #8]
	mov r0, #0x3c
	str r0, [sp, #0xc]
	mov r0, #0x44
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #2
	mov r3, #0x62
	bl ov83_0223FFD8
	mov r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x3d
	str r0, [sp, #0xc]
	mov r0, #0x45
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #3
	mov r3, #0x63
	bl ov83_0223FFD8
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov83_0223FF44

	thumb_func_start ov83_0223FFD8
ov83_0223FFD8: ; 0x0223FFD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x38]
	mov r2, #0
	add r7, r3, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r4, #0x24]
	add r1, r5, #0
	bl BufferMoveName
	mov r3, #0x18
	add r0, r5, #0
	mul r0, r3
	add r0, #0xc
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov83_0223FCB4
	strb r0, [r4, #0xa]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x3c]
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r4, #0
	mov r1, #4
	mov r3, #3
	bl ov83_02240C48
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x40]
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #5
	mov r3, #3
	bl ov83_02240C48
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r2, [sp, #0x30]
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0x60
	bl ov83_0223FCB4
	strb r0, [r4, #0xa]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_0223FFD8

	thumb_func_start ov83_02240080
ov83_02240080: ; 0x02240080
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B24
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _022400B2
_0224009E:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r7, #0
	lsr r2, r2, #0x18
	mov r3, #0
	bl ov83_022400BC
	add r4, r4, #1
	cmp r4, r6
	blt _0224009E
_022400B2:
	add r0, r7, #0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_02240080

	thumb_func_start ov83_022400BC
ov83_022400BC: ; 0x022400BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _02240168 ; =0x000007A4
	add r4, r2, #0
	add r6, r1, #0
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r7, r3, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0xc]
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022400E2
	mov r0, #0x24
	b _022400E4
_022400E2:
	mov r0, #4
_022400E4:
	cmp r7, #0
	bne _0224010A
	lsl r1, r4, #6
	add r2, r0, r1
	lsl r2, r2, #0x10
	lsr r7, r2, #0x10
	add r2, r0, #0
	add r2, #0x18
	add r2, r2, r1
	add r0, #0x20
	lsl r2, r2, #0x10
	add r0, r0, r1
	lsr r2, r2, #0x10
	lsl r0, r0, #0x10
	str r2, [sp, #0x10]
	lsr r0, r0, #0x10
	mov r4, #1
	str r0, [sp, #0x14]
	b _02240116
_0224010A:
	mov r0, #0x1c
	str r0, [sp, #0x10]
	mov r0, #0x24
	mov r7, #4
	mov r4, #0
	str r0, [sp, #0x14]
_02240116:
	ldr r0, [sp, #0xc]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r6, [sp]
	add r1, r0, #0
	str r7, [sp, #4]
	ldr r0, _0224016C ; =0x00000504
	str r4, [sp, #8]
	ldr r0, [r5, r0]
	mov r2, #3
	mov r3, #1
	bl sub_0200CDF0
	str r4, [sp]
	ldr r0, _0224016C ; =0x00000504
	ldr r3, [sp, #0x10]
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r6, #0
	bl sub_0200CDAC
	ldr r0, [sp, #0xc]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	str r6, [sp]
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	mov r2, #3
	str r0, [sp, #4]
	ldr r0, _0224016C ; =0x00000504
	str r4, [sp, #8]
	ldr r0, [r5, r0]
	mov r3, #0
	bl sub_0200CDF0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02240168: .word 0x000007A4
_0224016C: .word 0x00000504
	thumb_func_end ov83_022400BC

	thumb_func_start ov83_02240170
ov83_02240170: ; 0x02240170
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	add r6, r1, #0
	mov r1, #1
	bl ov80_02237B24
	add r7, r0, #0
	mov r4, #0
	cmp r7, #0
	ble _0224019A
_02240186:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	mov r3, #0
	bl ov83_022401A4
	add r4, r4, #1
	cmp r4, r7
	blt _02240186
_0224019A:
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_02240170

	thumb_func_start ov83_022401A4
ov83_022401A4: ; 0x022401A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r3, [sp, #0x14]
	ldrb r0, [r5, #9]
	str r1, [sp, #0x10]
	add r6, r2, #0
	bl ov80_02237D8C
	cmp r0, #0
	bne _022401C0
	mov r4, #0x28
	mov r7, #0x50
	b _022401C4
_022401C0:
	mov r4, #8
	mov r7, #0x30
_022401C4:
	ldr r0, _02240230 ; =0x000007A4
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _022401E0
	lsl r0, r6, #6
	add r6, r4, r0
	mov r4, #1
	add r7, r7, r0
	b _022401E6
_022401E0:
	mov r6, #4
	mov r4, #0
	mov r7, #0x30
_022401E6:
	ldr r0, [sp, #0x18]
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r1, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, _02240234 ; =0x00000504
	str r4, [sp, #0xc]
	ldr r0, [r5, r0]
	mov r3, #3
	bl sub_0200CE7C
	ldr r0, [sp, #0x18]
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	mov r1, #0
	lsl r0, r0, #0x18
	str r1, [sp]
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r2, r7, #0
	add r3, r4, #0
	bl ov83_02240D64
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02240230: .word 0x000007A4
_02240234: .word 0x00000504
	thumb_func_end ov83_022401A4

	thumb_func_start ov83_02240238
ov83_02240238: ; 0x02240238
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #9]
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	bl ov80_02237D8C
	cmp r0, #0
	bne _02240252
	mov r1, #0x24
	b _02240254
_02240252:
	mov r1, #4
_02240254:
	lsl r0, r4, #6
	add r4, r1, r0
	mov r0, #0x18
	str r0, [sp]
	mov r0, #9
	mov r1, #0
	lsl r2, r4, #0x10
	str r0, [sp, #4]
	add r0, r6, #0
	lsr r2, r2, #0x10
	add r3, r1, #0
	bl FillWindowPixelRect
	str r6, [sp]
	str r4, [sp, #4]
	mov r3, #1
	ldr r0, _0224028C ; =0x00000504
	str r3, [sp, #8]
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #3
	bl sub_0200CDF0
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224028C: .word 0x00000504
	thumb_func_end ov83_02240238

	thumb_func_start ov83_02240290
ov83_02240290: ; 0x02240290
	push {r4, lr}
	sub sp, #0x18
	mov r1, #5
	str r1, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #2
	add r4, r0, #0
	str r1, [sp, #0xc]
	mov r3, #0
	str r3, [sp, #0x10]
	add r1, r4, #0
	str r3, [sp, #0x14]
	add r1, #0x60
	mov r2, #6
	bl ov83_0223FC48
	strb r0, [r4, #0xa]
	ldr r0, _022402F0 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02247944
	mov r3, #1
	add r1, r4, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, #0xc0
	mov r2, #5
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	strb r0, [r4, #0xa]
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_022402F0: .word 0x00000508
	thumb_func_end ov83_02240290

	thumb_func_start ov83_022402F4
ov83_022402F4: ; 0x022402F4
	ldr r3, _022402FC ; =ov83_02241354
	add r0, #0xc0
	bx r3
	nop
_022402FC: .word ov83_02241354
	thumb_func_end ov83_022402F4

	thumb_func_start ov83_02240300
ov83_02240300: ; 0x02240300
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0224032C ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	mov r1, #1
	ldr r0, _02240330 ; =0x00000848
	mvn r1, r1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov83_02242BAC
	add r0, r4, #0
	bl ov83_02242DAC
	pop {r4, pc}
	.balign 4, 0
_0224032C: .word 0x00000508
_02240330: .word 0x00000848
	thumb_func_end ov83_02240300

	thumb_func_start ov83_02240334
ov83_02240334: ; 0x02240334
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r4, #0
	bl ov83_02242D5C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02240334

	thumb_func_start ov83_02240348
ov83_02240348: ; 0x02240348
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02240374 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	mov r1, #1
	ldr r0, _02240378 ; =0x00000848
	mvn r1, r1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov83_02242BF0
	add r0, r4, #0
	bl ov83_02242DFC
	pop {r4, pc}
	.balign 4, 0
_02240374: .word 0x00000508
_02240378: .word 0x00000848
	thumb_func_end ov83_02240348

	thumb_func_start ov83_0224037C
ov83_0224037C: ; 0x0224037C
	ldr r3, _02240380 ; =ov83_02242D5C
	bx r3
	.balign 4, 0
_02240380: .word ov83_02242D5C
	thumb_func_end ov83_0224037C

	thumb_func_start ov83_02240384
ov83_02240384: ; 0x02240384
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _022403B0 ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	mov r1, #1
	ldr r0, _022403B4 ; =0x00000848
	mvn r1, r1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov83_02242CAC
	add r0, r4, #0
	bl ov83_02242E88
	pop {r4, pc}
	.balign 4, 0
_022403B0: .word 0x00000508
_022403B4: .word 0x00000848
	thumb_func_end ov83_02240384

	thumb_func_start ov83_022403B8
ov83_022403B8: ; 0x022403B8
	ldr r3, _022403BC ; =ov83_02242D5C
	bx r3
	.balign 4, 0
_022403BC: .word ov83_02242D5C
	thumb_func_end ov83_022403B8

	thumb_func_start ov83_022403C0
ov83_022403C0: ; 0x022403C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrb r1, [r5, #0xe]
	mov r0, #8
	orr r0, r1
	strb r0, [r5, #0xe]
	add r0, r5, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r5, #0
	add r0, #0xb0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0xe0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	bl ov83_0223FB6C
	ldr r2, _02240428 ; =0x00000868
	mov r0, #2
	mov r1, #1
	add r2, r5, r2
	bl ov83_022477EC
	ldr r2, _02240428 ; =0x00000868
	mov r0, #6
	mov r1, #1
	add r2, r5, r2
	bl ov83_022477EC
	ldr r2, _02240428 ; =0x00000868
	mov r0, #7
	mov r1, #1
	add r2, r5, r2
	bl ov83_022477EC
	mov r0, #0x86
	mov r1, #0
	lsl r0, r0, #4
	strb r1, [r5, r0]
	add r0, r0, #2
	strh r1, [r5, r0]
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02240B54
	pop {r3, r4, r5, pc}
	nop
_02240428: .word 0x00000868
	thumb_func_end ov83_022403C0

	thumb_func_start ov83_0224042C
ov83_0224042C: ; 0x0224042C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xe]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _022404F8
	add r6, r5, #0
	mov r4, #0
	add r6, #0x50
_02240440:
	add r0, r4, #0
	add r0, #0x30
	lsl r0, r0, #4
	add r0, r6, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	cmp r4, #6
	blo _02240440
	mov r0, #0x3b
	lsl r0, r0, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0xf
	lsl r0, r0, #6
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x3f
	lsl r0, r0, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #1
	lsl r0, r0, #0xa
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x41
	lsl r0, r0, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r2, _022404FC ; =0x00000868
	mov r0, #2
	mov r1, #0
	add r2, r5, r2
	bl ov83_022477EC
	ldr r2, _022404FC ; =0x00000868
	mov r0, #6
	mov r1, #0
	add r2, r5, r2
	bl ov83_022477EC
	ldr r2, _022404FC ; =0x00000868
	mov r0, #7
	mov r1, #0
	add r2, r5, r2
	bl ov83_022477EC
	ldr r0, _02240500 ; =0x0000085C
	ldr r0, [r5, r0]
	bl ov83_02247A18
	ldr r0, _02240504 ; =0x000004DC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldr r0, _02240508 ; =0x0000077C
	mov r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
	ldr r0, _0224050C ; =0x0000079C
	mov r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
	ldr r7, _02240510 ; =0x00000784
	mov r6, #0
	add r4, r5, #0
_022404D2:
	ldr r0, [r4, r7]
	mov r1, #0
	bl ov83_0224755C
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blo _022404D2
	mov r0, #0x1e
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x30
	mov r2, #0x28
	bl ov83_0224759C
	ldrb r1, [r5, #0xe]
	mov r0, #8
	bic r1, r0
	strb r1, [r5, #0xe]
_022404F8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022404FC: .word 0x00000868
_02240500: .word 0x0000085C
_02240504: .word 0x000004DC
_02240508: .word 0x0000077C
_0224050C: .word 0x0000079C
_02240510: .word 0x00000784
	thumb_func_end ov83_0224042C

	thumb_func_start ov83_02240514
ov83_02240514: ; 0x02240514
	add r1, r0, #0
	ldr r0, _02240520 ; =0x0000084C
	ldr r3, _02240524 ; =ov83_02247864
	add r0, r1, r0
	ldr r1, [r1, #0x4c]
	bx r3
	.balign 4, 0
_02240520: .word 0x0000084C
_02240524: .word ov83_02247864
	thumb_func_end ov83_02240514

	thumb_func_start ov83_02240528
ov83_02240528: ; 0x02240528
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #4
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r0, r0, #0xa
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x41
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #6
	ldr r0, _02240658 ; =0x00010200
	bne _02240574
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x6a
	bl ov83_022479E4
	b _0224058C
_02240574:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x6b
	bl ov83_022479E4
_0224058C:
	ldr r0, _0224065C ; =0x0000050C
	ldr r0, [r5, r0]
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	mov r0, #8
	mov r1, #0x6b
	bl String_ctor
	add r4, r0, #0
	add r0, r6, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16ArrayToString
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _022405BC
	ldr r0, _02240660 ; =0x00070800
	b _022405C0
_022405BC:
	mov r0, #0xc1
	lsl r0, r0, #0xa
_022405C0:
	mov r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #1
	lsl r0, r0, #0xa
	add r0, r5, r0
	add r1, r4, #0
	add r3, r2, #0
	str r2, [sp, #8]
	bl ov83_02247998
	add r0, r4, #0
	bl String_dtor
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	add r4, r0, #0
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl sub_020310BC
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r3, #4
	bl ov83_02240C48
	mov r0, #0x41
	lsl r0, r0, #4
	add r0, r5, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02240658 ; =0x00010200
	mov r1, #0x41
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #2
	bl ov83_02241DD8
	mov r0, #0x3f
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #1
	lsl r0, r0, #0xa
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x41
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02240658: .word 0x00010200
_0224065C: .word 0x0000050C
_02240660: .word 0x00070800
	thumb_func_end ov83_02240528

	thumb_func_start ov83_02240664
ov83_02240664: ; 0x02240664
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, _02240738 ; =0x00000862
	add r4, r5, #0
	ldrsh r1, [r5, r0]
	mov r0, #6
	mov r6, #0
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	lsl r0, r0, #3
	str r0, [sp, #0x14]
	add r4, #0x50
_02240682:
	add r0, r6, #0
	add r0, #0x30
	lsl r0, r0, #4
	str r0, [sp, #0x1c]
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x18]
	add r1, r0, r6
	ldr r0, _0224073C ; =0x00000861
	ldrb r0, [r5, r0]
	cmp r1, r0
	bge _02240722
	add r0, r6, #0
	add r0, #0x30
	lsl r0, r0, #4
	str r0, [sp, #0x20]
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02240740 ; =0x00010200
	ldr r2, _02240744 ; =0x000004DC
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [r5, r2]
	ldr r2, [sp, #0x14]
	ldr r0, [sp, #0x20]
	add r2, r2, r3
	lsl r7, r6, #3
	ldr r2, [r7, r2]
	add r0, r4, r0
	mov r1, #0
	mov r3, #4
	bl AddTextPrinterParameterized2
	ldr r1, _02240744 ; =0x000004DC
	add r0, r5, #0
	ldr r2, [r5, r1]
	ldr r1, [sp, #0x14]
	add r1, r1, r2
	add r1, r7, r1
	ldr r1, [r1, #4]
	ldrb r2, [r5, #0x13]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov83_02240EC4
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r3, #2
	bl ov83_02240C48
	ldr r0, [sp, #0x20]
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, #4
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _02240740 ; =0x00010200
	ldr r1, [sp, #0x20]
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r4, r1
	mov r3, #0x68
	bl ov83_02241DD8
_02240722:
	ldr r0, [sp, #0x1c]
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #6
	blo _02240682
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02240738: .word 0x00000862
_0224073C: .word 0x00000861
_02240740: .word 0x00010200
_02240744: .word 0x000004DC
	thumb_func_end ov83_02240664

	thumb_func_start ov83_02240748
ov83_02240748: ; 0x02240748
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _022407E8 ; =0x00000862
	mov r4, #0
	ldrsh r1, [r5, r0]
	mov r0, #6
	str r4, [sp, #4]
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	lsl r0, r7, #3
	add r6, r5, #0
	str r0, [sp]
_02240764:
	ldr r0, _022407EC ; =0x00000861
	ldrb r0, [r5, r0]
	cmp r7, r0
	bhs _022407C8
	ldr r1, _022407F0 ; =0x000004DC
	add r0, r5, #0
	ldr r2, [r5, r1]
	ldr r1, [sp]
	add r2, r1, r2
	ldr r1, [sp, #4]
	add r1, r1, r2
	ldr r1, [r1, #4]
	ldrb r2, [r5, #0x13]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov83_02240F48
	str r0, [sp, #8]
	ldr r0, _022407F4 ; =0x00000518
	ldr r2, [sp, #8]
	add r0, r5, r0
	add r1, r4, #4
	bl ov83_02247264
	ldr r0, _022407F4 ; =0x00000518
	ldr r2, [sp, #8]
	add r0, r5, r0
	add r1, r4, #4
	bl ov83_022472A0
	add r1, sp, #0xc
	add r0, r4, #0
	add r1, #2
	add r2, sp, #0xc
	bl ov83_02242894
	ldr r0, _022407F8 ; =0x00000784
	add r1, sp, #0xc
	add r2, sp, #0xc
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	ldr r0, [r6, r0]
	bl ov83_02247568
	ldr r0, _022407F8 ; =0x00000784
	mov r1, #1
	ldr r0, [r6, r0]
	bl ov83_0224755C
	b _022407D2
_022407C8:
	ldr r0, _022407F8 ; =0x00000784
	mov r1, #0
	ldr r0, [r6, r0]
	bl ov83_0224755C
_022407D2:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r0, #8
	add r7, r7, #1
	add r6, r6, #4
	str r0, [sp, #4]
	cmp r4, #6
	blo _02240764
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022407E8: .word 0x00000862
_022407EC: .word 0x00000861
_022407F0: .word 0x000004DC
_022407F4: .word 0x00000518
_022407F8: .word 0x00000784
	thumb_func_end ov83_02240748

	thumb_func_start ov83_022407FC
ov83_022407FC: ; 0x022407FC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x3d
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	ldr r2, _02240880 ; =0x00000862
	str r1, [sp]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	mov r3, #1
	add r2, r2, #1
	bl ov83_02240C48
	ldr r0, _02240884 ; =0x00000861
	mov r1, #6
	ldrb r0, [r4, r0]
	sub r0, r0, #1
	bl _s32_div_f
	add r2, r0, #0
	mov r0, #0
	mov r1, #1
	str r0, [sp]
	add r0, r4, #0
	add r2, r2, #1
	add r3, r1, #0
	bl ov83_02240C48
	mov r0, #0x3d
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02240888 ; =0x00010200
	mov r1, #0x3d
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x67
	bl ov83_02241DD8
	mov r0, #0x3d
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02240880: .word 0x00000862
_02240884: .word 0x00000861
_02240888: .word 0x00010200
	thumb_func_end ov83_022407FC

	thumb_func_start ov83_0224088C
ov83_0224088C: ; 0x0224088C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x3e
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x3e
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _022408DC ; =0x00010200
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x3e
	lsr r3, r5, #0x1f
	lsl r0, r0, #4
	add r3, r5, r3
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x69
	asr r3, r3, #1
	bl ov83_022479E4
	mov r0, #0x3e
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022408DC: .word 0x00010200
	thumb_func_end ov83_0224088C

	thumb_func_start ov83_022408E0
ov83_022408E0: ; 0x022408E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x42
	lsl r0, r0, #4
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _02240970 ; =0x00000862
	mov r0, #6
	ldrsh r2, [r5, r1]
	sub r1, #0xc6
	mul r0, r2
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0
	bl ov83_0224755C
	cmp r4, #6
	bhs _02240960
	ldr r0, _02240974 ; =0x00000861
	ldrb r0, [r5, r0]
	cmp r6, r0
	bge _02240960
	ldrb r2, [r5, #0x13]
	add r0, r5, #0
	add r1, r6, #0
	bl ov83_02240F48
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	ldr r0, _02240978 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x42
	lsl r0, r0, #4
	ldr r1, [r5, #0x1c]
	add r0, r5, r0
	add r2, r4, #0
	bl ov83_022479E4
	ldr r0, _0224097C ; =0x00000518
	mov r1, #3
	add r0, r5, r0
	add r2, r4, #0
	bl ov83_02247264
	ldr r0, _0224097C ; =0x00000518
	mov r1, #3
	add r0, r5, r0
	add r2, r4, #0
	bl ov83_022472A0
	ldr r0, _02240980 ; =0x0000079C
	mov r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224755C
_02240960:
	mov r0, #0x42
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02240970: .word 0x00000862
_02240974: .word 0x00000861
_02240978: .word 0x00010200
_0224097C: .word 0x00000518
_02240980: .word 0x0000079C
	thumb_func_end ov83_022408E0

	thumb_func_start ov83_02240984
ov83_02240984: ; 0x02240984
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x43
	lsl r0, r0, #4
	mov r6, #0x3e
	add r4, r5, r0
	mov r7, #0
_02240994:
	add r0, r4, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0x45
	bls _02240994
	mov r3, #0
	str r3, [sp]
	ldr r0, _02240B34 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x58
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02240B34 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x49
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x46
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02240B34 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x47
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x59
	bl ov83_022479E4
	mov r1, #0
	ldr r2, _02240B38 ; =0x00000818
	str r1, [sp]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0
	str r0, [sp]
	ldr r2, _02240B3C ; =0x0000081A
	add r0, r5, #0
	ldrh r2, [r5, r2]
	mov r1, #1
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x12
	lsl r0, r0, #6
	add r0, r5, r0
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02240B34 ; =0x00010200
	mov r1, #0x12
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	lsl r1, r1, #6
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x5f
	bl ov83_02241DD8
	ldr r0, _02240B40 ; =0x00000804
	ldr r0, [r5, r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferBoxMonNickname
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02240B34 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x43
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x5b
	bl ov83_02241DD8
	ldr r0, _02240B44 ; =0x0000080E
	ldrb r0, [r5, r0]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1f
	bne _02240AC2
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	bne _02240AA2
	mov r3, #0
	str r3, [sp]
	ldr r0, _02240B48 ; =0x00050600
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x11
	lsl r0, r0, #6
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x56
	bl ov83_022479E4
	b _02240AC2
_02240AA2:
	cmp r0, #1
	bne _02240AC2
	mov r3, #0
	str r3, [sp]
	mov r0, #0xc1
	str r3, [sp, #4]
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x11
	lsl r0, r0, #6
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x57
	bl ov83_022479E4
_02240AC2:
	mov r1, #0
	ldr r2, _02240B4C ; =0x0000080F
	str r1, [sp]
	ldrb r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02240C48
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02240B34 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x46
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x5e
	bl ov83_02241DD8
	ldr r2, _02240B50 ; =0x00000812
	ldr r0, [r5, #0x24]
	ldrh r2, [r5, r2]
	mov r1, #0
	bl BufferItemName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02240B34 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x4a
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x47
	bl ov83_02241DD8
	mov r0, #0x43
	lsl r0, r0, #4
	mov r4, #0x3e
	add r5, r5, r0
_02240B22:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x45
	bls _02240B22
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02240B34: .word 0x00010200
_02240B38: .word 0x00000818
_02240B3C: .word 0x0000081A
_02240B40: .word 0x00000804
_02240B44: .word 0x0000080E
_02240B48: .word 0x00050600
_02240B4C: .word 0x0000080F
_02240B50: .word 0x00000812
	thumb_func_end ov83_02240984

	thumb_func_start ov83_02240B54
ov83_02240B54: ; 0x02240B54
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xde
	mov r3, #0x6b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	ldr r0, _02240C28 ; =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	mov r2, #1
	bl ov83_0224777C
	ldr r1, [sp]
	cmp r1, #6
	bne _02240B8A
	sub r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _02240C2C ; =ov83_02247D12
	ldr r6, _02240C30 ; =ov83_02247F88
	ldrh r1, [r0, r1]
	ldr r0, _02240C34 ; =0x00000861
	strb r1, [r5, r0]
	b _02240B98
_02240B8A:
	sub r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _02240C38 ; =ov83_02247D24
	ldr r6, _02240C3C ; =ov83_02247EE0
	ldrh r1, [r0, r1]
	ldr r0, _02240C34 ; =0x00000861
	strb r1, [r5, r0]
_02240B98:
	ldr r0, _02240C34 ; =0x00000861
	mov r1, #0x6b
	ldrb r0, [r5, r0]
	bl ListMenuItems_ctor
	ldr r1, _02240C40 ; =0x000004DC
	mov r4, #0
	str r0, [r5, r1]
	ldr r0, _02240C34 ; =0x00000861
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _02240BCE
_02240BB0:
	ldr r0, _02240C40 ; =0x000004DC
	lsl r2, r4, #1
	ldrh r2, [r6, r2]
	ldr r0, [r5, r0]
	add r1, r7, #0
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02240C34 ; =0x00000861
	ldrb r0, [r5, r0]
	cmp r4, r0
	blt _02240BB0
_02240BCE:
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r5, #0
	bl ov83_02247B7C
	ldr r1, _02240C44 ; =0x0000085C
	str r0, [r5, r1]
	sub r1, #0xe0
	ldr r0, [r5, r1]
	mov r1, #1
	bl ov83_0224755C
	ldr r1, [sp]
	add r0, r5, #0
	bl ov83_02240528
	add r0, r5, #0
	bl ov83_02240664
	add r0, r5, #0
	bl ov83_02240748
	add r0, r5, #0
	bl ov83_022407FC
	add r0, r5, #0
	bl ov83_0224088C
	add r0, r5, #0
	mov r1, #0
	bl ov83_022408E0
	add r0, r5, #0
	bl ov83_02240984
	mov r0, #0x1e
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x30
	mov r2, #0x48
	bl ov83_0224759C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240C28: .word 0x0000050C
_02240C2C: .word ov83_02247D12
_02240C30: .word ov83_02247F88
_02240C34: .word 0x00000861
_02240C38: .word ov83_02247D24
_02240C3C: .word ov83_02247EE0
_02240C40: .word 0x000004DC
_02240C44: .word 0x0000085C
	thumb_func_end ov83_02240B54

	thumb_func_start ov83_02240C48
ov83_02240C48: ; 0x02240C48
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	mov r4, #1
	str r4, [sp, #4]
	ldr r0, [r0, #0x24]
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02240C48

	thumb_func_start ov83_02240C60
ov83_02240C60: ; 0x02240C60
	ldr r3, _02240C68 ; =BufferBoxMonNickname
	ldr r0, [r0, #0x24]
	bx r3
	nop
_02240C68: .word BufferBoxMonNickname
	thumb_func_end ov83_02240C60

	thumb_func_start ov83_02240C6C
ov83_02240C6C: ; 0x02240C6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02240C88 ; =0x0000050C
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	bl BufferPlayersName
	pop {r3, r4, r5, pc}
	nop
_02240C88: .word 0x0000050C
	thumb_func_end ov83_02240C6C

	thumb_func_start ov83_02240C8C
ov83_02240C8C: ; 0x02240C8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	ldr r1, _02240CF4 ; =0x0000050C
	str r2, [sp, #0x10]
	ldr r0, [r0, r1]
	add r6, r3, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	mov r0, #8
	mov r1, #0x6b
	bl String_ctor
	add r4, r0, #0
	add r0, r7, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16ArrayToString
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _02240CC6
	ldr r1, _02240CF8 ; =0x00070800
	b _02240CCA
_02240CC6:
	mov r1, #0xc1
	lsl r1, r1, #0xa
_02240CCA:
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x18
	ldrb r1, [r1, #0x10]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02240CF4: .word 0x0000050C
_02240CF8: .word 0x00070800
	thumb_func_end ov83_02240C8C

	thumb_func_start ov83_02240CFC
ov83_02240CFC: ; 0x02240CFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp, #0x18]
	add r6, r3, #0
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	str r0, [sp, #0x1c]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _02240D22
	ldr r4, _02240D60 ; =0x00070800
	b _02240D26
_02240D22:
	mov r4, #0xc1
	lsl r4, r4, #0xa
_02240D26:
	ldr r0, [r5, #0x24]
	ldr r2, [sp, #0x1c]
	mov r1, #0
	bl BufferPlayersName
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	lsr r0, r4, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsr r0, r4, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #1
	bl ov83_0223FCB4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02240D60: .word 0x00070800
	thumb_func_end ov83_02240CFC

	thumb_func_start ov83_02240D64
ov83_02240D64: ; 0x02240D64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r2, #0
	add r2, r3, #0
	add r3, sp, #0x20
	ldrb r3, [r3, #0x14]
	cmp r3, #0
	bne _02240D7E
	mov r3, #0x56
	mov r4, #7
	mov r5, #8
	mov r6, #0
	b _02240D8A
_02240D7E:
	cmp r3, #1
	bne _02240DA4
	mov r3, #0x57
	mov r4, #3
	mov r5, #4
	mov r6, #0
_02240D8A:
	str r2, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	add r2, sp, #0x20
	ldrb r2, [r2, #0x10]
	str r2, [sp, #0x14]
	add r2, r3, #0
	add r3, r7, #0
	bl ov83_0223FCB4
_02240DA4:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02240D64

	thumb_func_start ov83_02240DA8
ov83_02240DA8: ; 0x02240DA8
	mov r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov83_02240DA8

	thumb_func_start ov83_02240DB0
ov83_02240DB0: ; 0x02240DB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02240DDC ; =0x000005DC
	bl PlaySE
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02240DCE
	ldrb r2, [r4, #0xd]
	add r0, r4, #0
	mov r1, #0xc
	bl ov83_02241368
_02240DCE:
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	mov r2, #0
	bl ov83_02240DE0
	pop {r4, pc}
	nop
_02240DDC: .word 0x000005DC
	thumb_func_end ov83_02240DB0

	thumb_func_start ov83_02240DE0
ov83_02240DE0: ; 0x02240DE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	bne _02240DF8
	mov r0, #0x76
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r2, #1
	mov r1, #0
	b _02240E00
_02240DF8:
	ldr r0, _02240E6C ; =0x00000764
	mov r2, #2
	ldr r4, [r5, r0]
	mov r1, #0x11
_02240E00:
	ldrb r0, [r5, #0x15]
	cmp r7, r0
	blo _02240E26
	add r0, r4, #0
	bl ov83_022475D4
	add r0, r4, #0
	mov r1, #0xe0
	mov r2, #0xa0
	bl ov83_02247568
	cmp r6, #0
	bne _02240E68
	add r0, r5, #0
	mov r1, #0
	bl ov83_02242844
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02240E26:
	add r0, r4, #0
	add r1, r2, #0
	bl ov83_022475D4
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	add r3, r7, #0
	bl ov83_02240E70
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov83_02247568
	cmp r6, #0
	bne _02240E68
	ldrb r1, [r5, #0xc]
	ldrb r0, [r5, #0x15]
	cmp r1, r0
	blo _02240E60
	add r0, r5, #0
	mov r1, #1
	bl ov83_02242844
_02240E60:
	add r0, r5, #0
	mov r1, #0
	bl ov83_02242814
_02240E68:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02240E6C: .word 0x00000764
	thumb_func_end ov83_02240DE0

	thumb_func_start ov83_02240E70
ov83_02240E70: ; 0x02240E70
	push {r4, r5, r6, lr}
	ldrb r0, [r0, #9]
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl ov80_02237D8C
	cmp r0, #1
	bne _02240EA6
	cmp r4, #0
	bne _02240E8C
	mov r0, #0x28
	str r0, [r5]
	b _02240EBE
_02240E8C:
	cmp r4, #1
	bne _02240E96
	mov r0, #0x68
	str r0, [r5]
	b _02240EBE
_02240E96:
	cmp r4, #2
	bne _02240EA0
	mov r0, #0xa8
	str r0, [r5]
	b _02240EBE
_02240EA0:
	mov r0, #0xe8
	str r0, [r5]
	b _02240EBE
_02240EA6:
	cmp r4, #0
	bne _02240EB0
	mov r0, #0x48
	str r0, [r5]
	b _02240EBE
_02240EB0:
	cmp r4, #1
	bne _02240EBA
	mov r0, #0x88
	str r0, [r5]
	b _02240EBE
_02240EBA:
	mov r0, #0xc8
	str r0, [r5]
_02240EBE:
	mov r0, #0x58
	str r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02240E70

	thumb_func_start ov83_02240EC4
ov83_02240EC4: ; 0x02240EC4
	push {r3, r4, r5, lr}
	add r3, r0, #0
	ldr r0, _02240EEC ; =0x0000050C
	add r5, r1, #0
	add r4, r2, #0
	ldrb r1, [r3, #9]
	ldr r0, [r3, r0]
	mov r2, #1
	bl ov83_0224777C
	cmp r4, #6
	bne _02240EE4
	ldr r0, _02240EF0 ; =ov83_02247FC8
	lsl r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
_02240EE4:
	ldr r0, _02240EF4 ; =ov83_02247F16
	lsl r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02240EEC: .word 0x0000050C
_02240EF0: .word ov83_02247FC8
_02240EF4: .word ov83_02247F16
	thumb_func_end ov83_02240EC4

	thumb_func_start ov83_02240EF8
ov83_02240EF8: ; 0x02240EF8
	push {r3, lr}
	ldr r3, _02240F38 ; =ov83_02247EE0
	mov r2, #0
_02240EFE:
	ldrh r1, [r3]
	cmp r0, r1
	bne _02240F0C
	ldr r0, _02240F3C ; =ov83_02247F16
	lsl r1, r2, #1
	ldrh r0, [r0, r1]
	pop {r3, pc}
_02240F0C:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x1b
	blo _02240EFE
	ldr r2, _02240F40 ; =ov83_02247F88
	mov r3, #0
_02240F18:
	ldrh r1, [r2]
	cmp r0, r1
	bne _02240F26
	ldr r0, _02240F44 ; =ov83_02247FC8
	lsl r1, r3, #1
	ldrh r0, [r0, r1]
	pop {r3, pc}
_02240F26:
	add r3, r3, #1
	add r2, r2, #2
	cmp r3, #0x20
	blo _02240F18
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_02240F38: .word ov83_02247EE0
_02240F3C: .word ov83_02247F16
_02240F40: .word ov83_02247F88
_02240F44: .word ov83_02247FC8
	thumb_func_end ov83_02240EF8

	thumb_func_start ov83_02240F48
ov83_02240F48: ; 0x02240F48
	push {r3, r4, r5, lr}
	add r3, r0, #0
	ldr r0, _02240F70 ; =0x0000050C
	add r5, r1, #0
	add r4, r2, #0
	ldrb r1, [r3, #9]
	ldr r0, [r3, r0]
	mov r2, #1
	bl ov83_0224777C
	cmp r4, #6
	bne _02240F68
	ldr r0, _02240F74 ; =ov83_02247F88
	lsl r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
_02240F68:
	ldr r0, _02240F78 ; =ov83_02247EE0
	lsl r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02240F70: .word 0x0000050C
_02240F74: .word ov83_02247F88
_02240F78: .word ov83_02247EE0
	thumb_func_end ov83_02240F48

	thumb_func_start ov83_02240F7C
ov83_02240F7C: ; 0x02240F7C
	push {r3, r4, r5, r6, r7, lr}
	ldrb r0, [r0, #9]
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	ldr r4, [sp, #0x18]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02240F9E
	mov r0, #0x28
	strh r0, [r5]
	mov r0, #0
	strh r0, [r6]
	strh r0, [r7]
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02240F9E:
	mov r1, #0
	strh r1, [r5]
	strh r1, [r6]
	mov r0, #0x80
	strh r0, [r7]
	strh r1, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02240F7C

	thumb_func_start ov83_02240FAC
ov83_02240FAC: ; 0x02240FAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	add r6, r2, #0
	bl ov83_02247768
	add r5, r0, #0
	ldr r0, _0224119C ; =0x000007A4
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	str r0, [sp, #0x14]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	lsl r1, r7, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x30
	bl sub_020880B0
	add r1, r0, #0
	add r0, r4, #0
	bl ov83_022411B0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	lsl r1, r7, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x30
	bl sub_020880B0
	add r1, r0, #0
	add r0, r4, #0
	bl ov83_022411DC
	add r7, r0, #0
	cmp r6, #0xa
	bls _02241018
	b _02241196
_02241018:
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02241024: ; jump table
	.short _02241196 - _02241024 - 2 ; case 0
	.short _02241048 - _02241024 - 2 ; case 1
	.short _02241048 - _02241024 - 2 ; case 2
	.short _02241048 - _02241024 - 2 ; case 3
	.short _0224103A - _02241024 - 2 ; case 4
	.short _02241196 - _02241024 - 2 ; case 5
	.short _0224110C - _02241024 - 2 ; case 6
	.short _0224110C - _02241024 - 2 ; case 7
	.short _0224103A - _02241024 - 2 ; case 8
	.short _0224117A - _02241024 - 2 ; case 9
	.short _02241188 - _02241024 - 2 ; case 10
_0224103A:
	ldrb r1, [r4, #0xe]
	mov r0, #4
	add sp, #0x20
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241048:
	ldrb r1, [r4, #0xe]
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _0224108E
	mov r0, #4
	orr r0, r1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02241064
	mov r1, #0x40
	b _02241066
_02241064:
	mov r1, #0x20
_02241066:
	mov r0, #8
	str r0, [sp]
	lsl r0, r5, #6
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r1, #0
	mov r0, #0x3e
	str r0, [sp, #8]
	ldr r0, _022411A0 ; =0x00000518
	str r1, [sp, #0xc]
	add r0, r4, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _022411A4 ; =0x0000075C
	str r0, [r4, r1]
_0224108E:
	ldr r0, _022411A4 ; =0x0000075C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022410AC
	bl ov83_02247624
	cmp r0, #0
	bne _022410AC
	ldr r0, _022411A4 ; =0x0000075C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _022411A4 ; =0x0000075C
	mov r1, #0
	str r1, [r4, r0]
_022410AC:
	ldr r0, _022411A4 ; =0x0000075C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02241196
	ldr r0, [sp, #0x14]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r3, r0, #0
	add r0, r4, #0
	add r1, #0x80
	add r2, r5, #0
	bl ov83_02240238
	ldrb r0, [r4, #0xd]
	cmp r0, r5
	bne _022410E0
	add r0, r4, #0
	bl ov83_02241E18
	add r0, r4, #0
	mov r1, #0
	bl ov83_022421E0
_022410E0:
	lsl r5, r5, #2
	ldr r0, _022411A8 ; =0x00000768
	add r1, r4, r5
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl ov83_022475D4
	ldr r0, _022411AC ; =0x0000073C
	add r1, r4, r5
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x18]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov83_02247600
	ldrb r1, [r4, #0xe]
	mov r0, #4
	add sp, #0x20
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224110C:
	ldrb r1, [r4, #0xe]
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _02241152
	mov r0, #4
	orr r0, r1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02241128
	mov r1, #0x40
	b _0224112A
_02241128:
	mov r1, #0x20
_0224112A:
	mov r0, #0x10
	str r0, [sp]
	lsl r0, r5, #6
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r1, #0
	mov r0, #0x3e
	str r0, [sp, #8]
	ldr r0, _022411A0 ; =0x00000518
	str r1, [sp, #0xc]
	add r0, r4, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _022411A4 ; =0x0000075C
	str r0, [r4, r1]
_02241152:
	ldr r0, _022411A4 ; =0x0000075C
	ldr r0, [r4, r0]
	bl ov83_02247624
	cmp r0, #0
	bne _02241196
	ldr r0, _022411A4 ; =0x0000075C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _022411A4 ; =0x0000075C
	mov r1, #0
	str r1, [r4, r0]
	ldrb r1, [r4, #0xe]
	mov r0, #4
	add sp, #0x20
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224117A:
	ldrb r1, [r4, #0xe]
	mov r0, #4
	add sp, #0x20
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241188:
	ldrb r1, [r4, #0xe]
	mov r0, #4
	add sp, #0x20
	bic r1, r0
	strb r1, [r4, #0xe]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241196:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224119C: .word 0x000007A4
_022411A0: .word 0x00000518
_022411A4: .word 0x0000075C
_022411A8: .word 0x00000768
_022411AC: .word 0x0000073C
	thumb_func_end ov83_02240FAC

	thumb_func_start ov83_022411B0
ov83_022411B0: ; 0x022411B0
	cmp r1, #4
	bhi _022411D8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022411C0: ; jump table
	.short _022411D8 - _022411C0 - 2 ; case 0
	.short _022411D6 - _022411C0 - 2 ; case 1
	.short _022411D2 - _022411C0 - 2 ; case 2
	.short _022411CE - _022411C0 - 2 ; case 3
	.short _022411CA - _022411C0 - 2 ; case 4
_022411CA:
	mov r0, #1
	bx lr
_022411CE:
	mov r0, #2
	bx lr
_022411D2:
	mov r0, #3
	bx lr
_022411D6:
	mov r0, #4
_022411D8:
	bx lr
	.balign 4, 0
	thumb_func_end ov83_022411B0

	thumb_func_start ov83_022411DC
ov83_022411DC: ; 0x022411DC
	cmp r1, #4
	bhi _02241204
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022411EC: ; jump table
	.short _02241204 - _022411EC - 2 ; case 0
	.short _02241202 - _022411EC - 2 ; case 1
	.short _022411FE - _022411EC - 2 ; case 2
	.short _022411FA - _022411EC - 2 ; case 3
	.short _022411F6 - _022411EC - 2 ; case 4
_022411F6:
	mov r0, #0xf
	bx lr
_022411FA:
	mov r0, #0xf
	bx lr
_022411FE:
	mov r0, #0xe
	bx lr
_02241202:
	mov r0, #0xd
_02241204:
	bx lr
	.balign 4, 0
	thumb_func_end ov83_022411DC

	thumb_func_start ov83_02241208
ov83_02241208: ; 0x02241208
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd
	ldrsb r0, [r4, r0]
	add r0, r0, r1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	ldrb r0, [r4, #0x14]
	bpl _02241222
	sub r0, r0, #1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	b _02241228
_02241222:
	cmp r1, r0
	blt _02241228
	mov r1, #0
_02241228:
	strb r1, [r4, #0xd]
	add r0, r4, #0
	bl ov83_02240DB0
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02241250 ; =0x000007A4
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	add r2, r0, #0
	add r0, r4, #0
	add r4, #0x90
	add r1, r4, #0
	bl ov83_0223FD4C
	pop {r4, pc}
	.balign 4, 0
_02241250: .word 0x000007A4
	thumb_func_end ov83_02241208

	thumb_func_start ov83_02241254
ov83_02241254: ; 0x02241254
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd
	ldrsb r0, [r4, r0]
	add r0, r0, r1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	ldrb r0, [r4, #0x14]
	bpl _0224126E
	sub r0, r0, #1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	b _02241274
_0224126E:
	cmp r1, r0
	blt _02241274
	mov r1, #0
_02241274:
	strb r1, [r4, #0xd]
	add r0, r4, #0
	bl ov83_02240DB0
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _0224129C ; =0x000007A4
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	add r2, r0, #0
	add r0, r4, #0
	add r4, #0x90
	add r1, r4, #0
	bl ov83_0223FF44
	pop {r4, pc}
	.balign 4, 0
_0224129C: .word 0x000007A4
	thumb_func_end ov83_02241254

	thumb_func_start ov83_022412A0
ov83_022412A0: ; 0x022412A0
	push {r4, lr}
	add r4, r0, #0
	bl ov83_02241730
	add r0, r4, #0
	bl ov83_0224042C
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r4, #0
	bl ov83_02241B18
	ldr r2, _022412D4 ; =0x00000868
	mov r0, #2
	mov r1, #0
	add r2, r4, r2
	bl ov83_022477EC
	ldr r0, _022412D8 ; =0x00000778
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov83_0224755C
	pop {r4, pc}
	.balign 4, 0
_022412D4: .word 0x00000868
_022412D8: .word 0x00000778
	thumb_func_end ov83_022412A0

	thumb_func_start ov83_022412DC
ov83_022412DC: ; 0x022412DC
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	mov r1, #0x3a
	add r2, r4, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x42
	add r2, r4, #0
	bl GetMonData
	cmp r6, r0
	beq _022412FC
	mov r4, #1
_022412FC:
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x43
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	beq _02241318
	mov r4, #1
_02241318:
	add r0, r5, #0
	mov r1, #0x3c
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x44
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	beq _02241334
	mov r4, #1
_02241334:
	add r0, r5, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x45
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	beq _02241350
	mov r4, #1
_02241350:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_022412DC

	thumb_func_start ov83_02241354
ov83_02241354: ; 0x02241354
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02241354

	thumb_func_start ov83_02241368
ov83_02241368: ; 0x02241368
	push {r3, r4, r5, lr}
	add r3, r1, #0
	sub r3, #0xa
	add r5, r0, #0
	cmp r3, #3
	bhi _022413A6
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02241380: ; jump table
	.short _02241388 - _02241380 - 2 ; case 0
	.short _02241390 - _02241380 - 2 ; case 1
	.short _02241398 - _02241380 - 2 ; case 2
	.short _022413A0 - _02241380 - 2 ; case 3
_02241388:
	mov r4, #0x31
	bl ov83_022413C4
	b _022413A6
_02241390:
	mov r4, #0x32
	bl ov83_0224143C
	b _022413A6
_02241398:
	mov r4, #0x33
	bl ov83_022414CC
	b _022413A6
_022413A0:
	mov r4, #0x34
	bl ov83_02241504
_022413A6:
	ldr r1, _022413C0 ; =0x000007AC
	add r0, r4, #0
	add r1, r5, r1
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _022413BA
	mov r0, #1
	pop {r3, r4, r5, pc}
_022413BA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_022413C0: .word 0x000007AC
	thumb_func_end ov83_02241368

	thumb_func_start ov83_022413C4
ov83_022413C4: ; 0x022413C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02241400 ; =0x0000050C
	add r4, r1, #0
	ldr r0, [r6, r0]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _02241404 ; =0x000007AC
	strh r4, [r6, r1]
	bl PlayerProfile_GetTrainerGender
	ldr r1, _02241408 ; =0x000007AE
	mov r4, #0
	strh r0, [r6, r1]
	add r5, r6, #4
	sub r7, r1, #2
_022413E4:
	ldr r0, _02241400 ; =0x0000050C
	ldrb r1, [r6, #9]
	lsl r2, r4, #0x18
	ldr r0, [r6, r0]
	lsr r2, r2, #0x18
	bl ov83_0224777C
	strh r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #3
	blt _022413E4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241400: .word 0x0000050C
_02241404: .word 0x000007AC
_02241408: .word 0x000007AE
	thumb_func_end ov83_022413C4

	thumb_func_start ov83_0224140C
ov83_0224140C: ; 0x0224140C
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xf]
	add r6, r2, #0
	add r0, r0, #1
	strb r0, [r4, #0xf]
	bl sub_0203769C
	cmp r5, r0
	beq _02241436
	ldr r0, _02241438 ; =0x000007FF
	mov r3, #0
	add r5, r6, #4
_02241428:
	ldrh r2, [r5]
	add r1, r4, r3
	add r3, r3, #1
	add r5, r5, #2
	strb r2, [r1, r0]
	cmp r3, #3
	blt _02241428
_02241436:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02241438: .word 0x000007FF
	thumb_func_end ov83_0224140C

	thumb_func_start ov83_0224143C
ov83_0224143C: ; 0x0224143C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02241470 ; =0x000007AC
	add r4, r2, #0
	strh r1, [r5, r0]
	add r0, r0, #2
	strh r4, [r5, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _0224145A
	ldrb r0, [r5, #0x12]
	cmp r0, #0xff
	bne _0224145A
	strb r4, [r5, #0x12]
_0224145A:
	ldrb r1, [r5, #0x12]
	mov r0, #0x7b
	lsl r0, r0, #4
	strh r1, [r5, r0]
	ldrh r2, [r5, #0x10]
	add r1, r0, #4
	add r0, r0, #6
	strh r2, [r5, r1]
	ldrb r1, [r5, #0x13]
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02241470: .word 0x000007AC
	thumb_func_end ov83_0224143C

	thumb_func_start ov83_02241474
ov83_02241474: ; 0x02241474
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	ldrb r0, [r4, #0xf]
	add r5, r2, #0
	add r0, r0, #1
	strb r0, [r4, #0xf]
	bl sub_0203769C
	cmp r6, r0
	beq _022414C4
	ldrh r1, [r5, #2]
	ldr r0, _022414C8 ; =0x000007FD
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _022414B8
	ldrb r0, [r4, #0x12]
	cmp r0, #0xff
	ldr r0, _022414C8 ; =0x000007FD
	beq _022414A6
	mov r1, #0
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_022414A6:
	ldrb r1, [r4, r0]
	ldrb r0, [r4, #0x15]
	add r0, r1, r0
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x10]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
_022414B8:
	ldrh r0, [r5, #4]
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x10]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
_022414C4:
	pop {r4, r5, r6, pc}
	nop
_022414C8: .word 0x000007FD
	thumb_func_end ov83_02241474

	thumb_func_start ov83_022414CC
ov83_022414CC: ; 0x022414CC
	ldr r2, _022414D8 ; =0x000007AC
	strh r1, [r0, r2]
	ldrb r3, [r0, #0xd]
	add r1, r2, #2
	strh r3, [r0, r1]
	bx lr
	.balign 4, 0
_022414D8: .word 0x000007AC
	thumb_func_end ov83_022414CC

	thumb_func_start ov83_022414DC
ov83_022414DC: ; 0x022414DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r5, r0
	beq _022414FC
	ldrh r0, [r6, #2]
	ldr r1, _02241500 ; =0x000007FC
	mov r2, #1
	strb r0, [r4, r1]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	bl ov83_02240DE0
_022414FC:
	pop {r4, r5, r6, pc}
	nop
_02241500: .word 0x000007FC
	thumb_func_end ov83_022414DC

	thumb_func_start ov83_02241504
ov83_02241504: ; 0x02241504
	ldr r1, _0224150C ; =0x000007AC
	mov r2, #1
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_0224150C: .word 0x000007AC
	thumb_func_end ov83_02241504

	thumb_func_start ov83_02241510
ov83_02241510: ; 0x02241510
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0203769C
	cmp r5, r0
	beq _02241526
	ldrh r1, [r4]
	ldr r0, _02241528 ; =0x000007FE
	strb r1, [r6, r0]
_02241526:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02241528: .word 0x000007FE
	thumb_func_end ov83_02241510

	thumb_func_start ov83_0224152C
ov83_0224152C: ; 0x0224152C
	push {r3, lr}
	mov r2, #0x6b
	str r2, [sp]
	mov r2, #0
	add r3, r2, #0
	bl UseItemOnPokemon
	pop {r3, pc}
	thumb_func_end ov83_0224152C

	thumb_func_start ov83_0224153C
ov83_0224153C: ; 0x0224153C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #4
	str r1, [sp]
	add r1, sp, #8
	add r3, sp, #4
	add r5, r0, #0
	add r1, #2
	add r2, sp, #8
	add r3, #2
	bl ov83_02240F7C
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02241580
	mov r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #6]
	ldrh r3, [r3, #4]
	add r0, r5, #0
	add r2, r2, #4
	add r3, r3, #1
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl ov83_02240C8C
	b _022415E8
_02241580:
	bl sub_0203769C
	cmp r0, #0
	add r2, sp, #4
	bne _022415BA
	ldrh r0, [r2, #4]
	add r1, r4, #0
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	add r0, r5, #0
	bl ov83_02240C8C
	mov r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r3, #1
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl ov83_02240CFC
	b _022415E8
_022415BA:
	ldrh r0, [r2, #4]
	add r1, r4, #0
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	add r0, r5, #0
	bl ov83_02240CFC
	mov r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r3, #1
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl ov83_02240C8C
_022415E8:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_0224153C

	thumb_func_start ov83_022415F4
ov83_022415F4: ; 0x022415F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x14]
	add r4, r2, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _0224168C ; =0x000007A4
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	ldr r0, _02241690 ; =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	mov r2, #0
	bl ov83_0224777C
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov83_02240C60
	ldr r0, _02241694 ; =0x00000508
	ldr r0, [r5, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xb0
	bl ov83_02247944
	sub r1, r4, #1
	lsl r2, r1, #1
	ldr r1, _02241698 ; =_02247D0C
	add r0, r5, #0
	ldrh r1, [r1, r2]
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r5, #0xa]
	cmp r4, #1
	beq _0224165A
	cmp r4, #2
	beq _02241664
	cmp r4, #3
	beq _0224166E
	b _02241680
_0224165A:
	add r0, r6, #0
	mov r1, #0x18
	bl ov83_0224152C
	b _02241684
_02241664:
	add r0, r6, #0
	mov r1, #0x29
	bl ov83_0224152C
	b _02241684
_0224166E:
	add r0, r6, #0
	mov r1, #0x18
	bl ov83_0224152C
	add r0, r6, #0
	mov r1, #0x29
	bl ov83_0224152C
	b _02241684
_02241680:
	bl GF_AssertFail
_02241684:
	ldr r0, _0224169C ; =0x000005EC
	bl PlaySE
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224168C: .word 0x000007A4
_02241690: .word 0x0000050C
_02241694: .word 0x00000508
_02241698: .word _02247D0C
_0224169C: .word 0x000005EC
	thumb_func_end ov83_022415F4

	thumb_func_start ov83_022416A0
ov83_022416A0: ; 0x022416A0
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x14]
	add r4, r1, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02241724 ; =0x000007A4
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	mov r1, #6
	add r2, sp, #0x18
	add r6, r0, #0
	bl SetMonData
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _022416D6
	add r0, r5, #0
	bl ov83_02241E18
	add r0, r5, #0
	mov r1, #0
	bl ov83_022421E0
_022416D6:
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02241728 ; =0x0000074C
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov83_0224755C
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov83_02240C60
	add r2, sp, #0x10
	ldrh r2, [r2, #8]
	ldr r0, [r5, #0x24]
	mov r1, #1
	bl BufferItemName
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r5, #0xa]
	ldr r0, _0224172C ; =0x00000623
	bl PlaySE
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02241724: .word 0x000007A4
_02241728: .word 0x0000074C
_0224172C: .word 0x00000623
	thumb_func_end ov83_022416A0

	thumb_func_start ov83_02241730
ov83_02241730: ; 0x02241730
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xe]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0224174E
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02018694
	add r0, r4, #0
	bl ov83_02242D5C
_0224174E:
	ldr r0, _02241758 ; =0x0000084C
	add r0, r4, r0
	bl ov83_022478B4
	pop {r4, pc}
	.balign 4, 0
_02241758: .word 0x0000084C
	thumb_func_end ov83_02241730

	thumb_func_start ov83_0224175C
ov83_0224175C: ; 0x0224175C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb0
	bl ov83_02241354
	add r0, r4, #0
	bl ov83_022429E4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_0224175C

	thumb_func_start ov83_02241770
ov83_02241770: ; 0x02241770
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r1, sp, #0x1c
	str r1, [sp]
	add r1, sp, #0x20
	add r3, sp, #0x1c
	add r5, r0, #0
	add r1, #2
	add r2, sp, #0x20
	add r3, #2
	bl ov83_02240F7C
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02241806
	add r1, sp, #0x1c
	ldrh r0, [r1, #6]
	add r0, #0x48
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldrh r0, [r1, #4]
	mov r1, #0
	add r2, r7, #0
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, r6, #0
	bl FillWindowPixelRect
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	str r0, [sp, #0x18]
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x18]
	bl sub_020310BC
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	add r0, r5, #0
	mov r3, #4
	bl ov83_02240C48
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r2, #2
	str r2, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r7, #0
	bl ov83_0223FCB4
	strb r0, [r5, #0xa]
	b _022418D4
_02241806:
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x10
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x40
	add r3, r1, #0
	bl FillWindowPixelRect
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x10
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0xc0
	add r3, r1, #0
	bl FillWindowPixelRect
	bl sub_0203769C
	cmp r0, #0
	bne _0224185A
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	add r1, r6, #0
	bl sub_020310BC
	add r6, r0, #0
	ldr r0, _022418E0 ; =0x00000802
	ldrh r7, [r5, r0]
	b _0224187C
_0224185A:
	ldr r0, _022418E0 ; =0x00000802
	ldrh r6, [r5, r0]
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	add r1, r7, #0
	bl sub_020310BC
	add r7, r0, #0
_0224187C:
	mov r1, #0
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #4
	str r1, [sp]
	bl ov83_02240C48
	mov r0, #0x70
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _022418E4 ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	mov r3, #2
	bl ov83_02241DD8
	mov r1, #0
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #4
	str r1, [sp]
	bl ov83_02240C48
	mov r0, #0xf0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _022418E4 ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02241DD8
_022418D4:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022418E0: .word 0x00000802
_022418E4: .word 0x00010200
	thumb_func_end ov83_02241770

	thumb_func_start ov83_022418E8
ov83_022418E8: ; 0x022418E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02241A4C ; =0x000005E3
	add r7, r1, #0
	add r5, r2, #0
	bl PlaySE
	ldrb r0, [r4, #0x15]
	add r1, r7, #0
	str r0, [sp]
	bl ov83_0224776C
	str r0, [sp, #4]
	cmp r5, #0xa
	bhi _02241940
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02241914: ; jump table
	.short _02241940 - _02241914 - 2 ; case 0
	.short _0224192A - _02241914 - 2 ; case 1
	.short _0224192A - _02241914 - 2 ; case 2
	.short _0224192A - _02241914 - 2 ; case 3
	.short _02241940 - _02241914 - 2 ; case 4
	.short _02241940 - _02241914 - 2 ; case 5
	.short _02241934 - _02241914 - 2 ; case 6
	.short _02241934 - _02241914 - 2 ; case 7
	.short _02241940 - _02241914 - 2 ; case 8
	.short _0224193E - _02241914 - 2 ; case 9
	.short _0224193E - _02241914 - 2 ; case 10
_0224192A:
	sub r0, r5, #1
	lsl r1, r0, #1
	ldr r0, _02241A50 ; =ov83_02247D18
	ldrh r6, [r0, r1]
	b _02241940
_02241934:
	ldrh r0, [r4, #0x10]
	bl ov83_02240EF8
	add r6, r0, #0
	b _02241940
_0224193E:
	mov r6, #0
_02241940:
	bl sub_0203769C
	cmp r0, #0
	bne _02241974
	ldr r0, [sp]
	cmp r7, r0
	bhs _02241962
	add r0, r4, #0
	mov r1, #5
	bl ov83_02240C6C
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	add r2, r6, #0
	bl ov80_02237FA4
	b _0224199E
_02241962:
	ldr r0, [r4, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r0, _02241A54 ; =0x00000802
	ldrh r1, [r4, r0]
	sub r1, r1, r6
	strh r1, [r4, r0]
	b _0224199E
_02241974:
	ldr r0, [sp]
	cmp r7, r0
	bhs _0224198C
	ldr r0, [r4, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r0, _02241A54 ; =0x00000802
	ldrh r1, [r4, r0]
	sub r1, r1, r6
	strh r1, [r4, r0]
	b _0224199E
_0224198C:
	add r0, r4, #0
	mov r1, #5
	bl ov83_02240C6C
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	add r2, r6, #0
	bl ov80_02237FA4
_0224199E:
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	bl ov83_02241770
	add r0, r4, #0
	bl ov83_02241730
	add r0, r4, #0
	bl ov83_02241B18
	add r0, r4, #0
	bl ov83_0224042C
	ldr r2, _02241A58 ; =0x00000868
	mov r0, #2
	mov r1, #0
	add r2, r4, r2
	bl ov83_022477EC
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02241354
	cmp r5, #0xa
	bhi _02241A48
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022419DE: ; jump table
	.short _02241A48 - _022419DE - 2 ; case 0
	.short _022419F4 - _022419DE - 2 ; case 1
	.short _022419F4 - _022419DE - 2 ; case 2
	.short _022419F4 - _022419DE - 2 ; case 3
	.short _02241A48 - _022419DE - 2 ; case 4
	.short _02241A48 - _022419DE - 2 ; case 5
	.short _02241A14 - _022419DE - 2 ; case 6
	.short _02241A14 - _022419DE - 2 ; case 7
	.short _02241A48 - _022419DE - 2 ; case 8
	.short _02241A34 - _022419DE - 2 ; case 9
	.short _02241A40 - _022419DE - 2 ; case 10
_022419F4:
	ldr r0, _02241A5C ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	ldr r1, [sp, #4]
	add r0, r4, #0
	add r2, r5, #0
	bl ov83_022415F4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241A14:
	ldr r0, _02241A5C ; =0x00000508
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xb0
	bl ov83_02247944
	ldrh r2, [r4, #0x10]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov83_022416A0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241A34:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov83_02241A60
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241A40:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov83_02241ABC
_02241A48:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241A4C: .word 0x000005E3
_02241A50: .word ov83_02247D18
_02241A54: .word 0x00000802
_02241A58: .word 0x00000868
_02241A5C: .word 0x00000508
	thumb_func_end ov83_022418E8

	thumb_func_start ov83_02241A60
ov83_02241A60: ; 0x02241A60
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #2
	bl ov83_0223FAA8
	add r0, r5, #0
	add r0, #0xb0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0xa0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #5
	lsl r0, r0, #6
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02241AB4 ; =0x000007A4
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r1, r5, #0
	add r2, r0, #0
	add r0, r5, #0
	add r1, #0x90
	bl ov83_0223FD4C
	ldr r2, _02241AB8 ; =0x00000868
	mov r0, #2
	mov r1, #1
	add r2, r5, r2
	bl ov83_022477EC
	pop {r3, r4, r5, pc}
	nop
_02241AB4: .word 0x000007A4
_02241AB8: .word 0x00000868
	thumb_func_end ov83_02241A60

	thumb_func_start ov83_02241ABC
ov83_02241ABC: ; 0x02241ABC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #2
	bl ov83_0223FB24
	add r0, r5, #0
	add r0, #0xb0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0xa0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #5
	lsl r0, r0, #6
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02241B10 ; =0x000007A4
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r1, r5, #0
	add r2, r0, #0
	add r0, r5, #0
	add r1, #0x90
	bl ov83_0223FF44
	ldr r2, _02241B14 ; =0x00000868
	mov r0, #2
	mov r1, #1
	add r2, r5, r2
	bl ov83_022477EC
	pop {r3, r4, r5, pc}
	nop
_02241B10: .word 0x000007A4
_02241B14: .word 0x00000868
	thumb_func_end ov83_02241ABC

	thumb_func_start ov83_02241B18
ov83_02241B18: ; 0x02241B18
	ldr r2, _02241B28 ; =0x00000868
	add r3, r0, #0
	add r2, r3, r2
	ldr r3, _02241B2C ; =ov83_022477EC
	mov r0, #2
	mov r1, #0
	bx r3
	nop
_02241B28: .word 0x00000868
_02241B2C: .word ov83_022477EC
	thumb_func_end ov83_02241B18

	thumb_func_start ov83_02241B30
ov83_02241B30: ; 0x02241B30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldrb r0, [r6, #9]
	mov r1, #1
	bl ov80_02237B24
	mov r4, #0
	str r0, [sp]
	cmp r0, #0
	ble _02241BB8
	add r5, r6, #0
_02241B48:
	ldr r0, _02241BBC ; =0x000007A4
	add r1, r4, #0
	ldr r0, [r6, r0]
	bl GetPartyMonByIndex
	str r0, [sp, #4]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r7, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bl ov80_0222A43C
	add r1, r0, #0
	ldr r0, _02241BC0 ; =0x0000073C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02241BAE
	bl ov83_02247600
	ldrb r0, [r6, #0x14]
	ldrb r1, [r6, #0xd]
	bl ov83_02247768
	cmp r4, r0
	bne _02241B98
	ldrb r1, [r6, #0xd]
	ldrb r0, [r6, #0x15]
	cmp r1, r0
	blo _02241BA4
_02241B98:
	ldr r0, _02241BC0 ; =0x0000073C
	mov r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224760C
	b _02241BAE
_02241BA4:
	ldr r0, _02241BC0 ; =0x0000073C
	mov r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224760C
_02241BAE:
	ldr r0, [sp]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _02241B48
_02241BB8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241BBC: .word 0x000007A4
_02241BC0: .word 0x0000073C
	thumb_func_end ov83_02241B30

	thumb_func_start ov83_02241BC4
ov83_02241BC4: ; 0x02241BC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r2, [sp]
	ldrb r0, [r5, #9]
	add r6, r1, #0
	mov r1, #0
	bl ov80_02237B24
	ldr r0, [sp]
	cmp r0, #4
	beq _02241BE0
	mov r0, #1
	b _02241BE2
_02241BE0:
	mov r0, #0
_02241BE2:
	ldrb r7, [r5, #0x15]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r7, #0
	add r1, r6, #0
	bl ov83_0224776C
	bl sub_0203769C
	cmp r0, #0
	bne _02241CC4
	cmp r6, r7
	bhs _02241C92
	add r0, r5, #0
	mov r1, #5
	bl ov83_02240C6C
	ldr r0, _02241DC4 ; =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ov83_0224777C
	add r2, r0, #0
	mov r0, #6
	add r6, r4, #0
	mul r6, r0
	ldr r3, _02241DC8 ; =ov83_02247D48
	lsl r2, r2, #1
	add r3, r3, r6
	ldrb r1, [r5, #9]
	ldrh r2, [r2, r3]
	ldr r0, [r5, #4]
	bl ov80_02237FA4
	ldr r0, _02241DC4 ; =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ov83_0224777C
	add r7, r0, #0
	ldr r0, _02241DC4 ; =0x0000050C
	ldr r0, [r5, r0]
	bl sub_0203107C
	str r0, [sp, #4]
	ldrb r0, [r5, #9]
	add r1, r4, #0
	bl sub_0205C174
	str r0, [sp, #8]
	ldrb r0, [r5, #9]
	add r1, r4, #0
	bl sub_0205C174
	bl sub_0205C268
	add r3, r7, #1
	add r2, r0, #0
	lsl r3, r3, #0x10
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	lsr r3, r3, #0x10
	bl sub_02031108
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #1
	beq _02241C72
	b _02241D8C
_02241C72:
	ldr r0, [sp]
	ldrb r1, [r5, #0xe]
	cmp r0, #4
	bne _02241C86
	mov r0, #0x60
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0xe]
	b _02241D8C
_02241C86:
	mov r0, #0x60
	bic r1, r0
	mov r0, #0x40
	orr r0, r1
	strb r0, [r5, #0xe]
	b _02241D8C
_02241C92:
	ldr r0, [r5, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r0, _02241DCC ; =0x000007FF
	add r6, r4, #0
	add r1, r5, r0
	ldrb r7, [r1, r4]
	mov r0, #6
	mul r6, r0
	ldr r0, _02241DCC ; =0x000007FF
	ldr r2, _02241DC8 ; =ov83_02247D48
	add r0, r0, #3
	lsl r3, r7, #1
	add r2, r2, r6
	ldrh r0, [r5, r0]
	ldrh r2, [r3, r2]
	sub r0, r0, r2
	ldr r2, _02241DCC ; =0x000007FF
	add r2, r2, #3
	strh r0, [r5, r2]
	ldrb r0, [r1, r4]
	add r0, r0, #1
	strb r0, [r1, r4]
	b _02241D8C
_02241CC4:
	cmp r6, r7
	bhs _02241CFA
	ldr r0, [r5, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r0, _02241DCC ; =0x000007FF
	add r6, r4, #0
	add r1, r5, r0
	ldrb r7, [r1, r4]
	mov r0, #6
	mul r6, r0
	ldr r0, _02241DCC ; =0x000007FF
	ldr r2, _02241DC8 ; =ov83_02247D48
	add r0, r0, #3
	lsl r3, r7, #1
	add r2, r2, r6
	ldrh r0, [r5, r0]
	ldrh r2, [r3, r2]
	sub r0, r0, r2
	ldr r2, _02241DCC ; =0x000007FF
	add r2, r2, #3
	strh r0, [r5, r2]
	ldrb r0, [r1, r4]
	add r0, r0, #1
	strb r0, [r1, r4]
	b _02241D8C
_02241CFA:
	add r0, r5, #0
	mov r1, #5
	bl ov83_02240C6C
	ldr r0, _02241DC4 ; =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ov83_0224777C
	add r2, r0, #0
	mov r0, #6
	add r6, r4, #0
	mul r6, r0
	ldr r3, _02241DC8 ; =ov83_02247D48
	lsl r2, r2, #1
	add r3, r3, r6
	ldrb r1, [r5, #9]
	ldrh r2, [r2, r3]
	ldr r0, [r5, #4]
	bl ov80_02237FA4
	ldr r0, _02241DC4 ; =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ov83_0224777C
	add r7, r0, #0
	ldr r0, _02241DC4 ; =0x0000050C
	ldr r0, [r5, r0]
	bl sub_0203107C
	str r0, [sp, #0xc]
	ldrb r0, [r5, #9]
	add r1, r4, #0
	bl sub_0205C174
	str r0, [sp, #0x10]
	ldrb r0, [r5, #9]
	add r1, r4, #0
	bl sub_0205C174
	bl sub_0205C268
	add r3, r7, #1
	add r2, r0, #0
	lsl r3, r3, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	lsr r3, r3, #0x10
	bl sub_02031108
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02241D8C
	ldr r0, [sp]
	ldrb r1, [r5, #0xe]
	cmp r0, #4
	bne _02241D82
	mov r0, #0x60
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0xe]
	b _02241D8C
_02241D82:
	mov r0, #0x60
	bic r1, r0
	mov r0, #0x40
	orr r0, r1
	strb r0, [r5, #0xe]
_02241D8C:
	add r0, r5, #0
	bl ov83_02241730
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x50
	bl ov83_02241770
	ldr r0, _02241DD0 ; =0x00000508
	ldr r0, [r5, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xb0
	bl ov83_02247944
	ldr r1, _02241DD4 ; =ov83_02247D5A
	lsl r2, r7, #1
	add r1, r1, r6
	ldrh r1, [r2, r1]
	add r0, r5, #0
	mov r2, #1
	bl ov83_0223FD14
	strb r0, [r5, #0xa]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241DC4: .word 0x0000050C
_02241DC8: .word ov83_02247D48
_02241DCC: .word 0x000007FF
_02241DD0: .word 0x00000508
_02241DD4: .word ov83_02247D5A
	thumb_func_end ov83_02241BC4

	thumb_func_start ov83_02241DD8
ov83_02241DD8: ; 0x02241DD8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	add r1, r3, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [r5, #0x28]
	add r0, r4, #0
	bl ov83_02247998
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov83_02241DD8

	thumb_func_start ov83_02241E18
ov83_02241E18: ; 0x02241E18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02241FA8 ; =0x000007A4
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	bl AcquireMonLock
	str r0, [sp, #4]
	ldr r0, _02241FAC ; =0x00000804
	str r6, [r5, r0]
	add r0, r6, #0
	bl Mon_GetBoxMon
	ldr r1, _02241FB0 ; =0x00000808
	mov r2, #0
	str r0, [r5, r1]
	add r0, r6, #0
	mov r1, #5
	bl GetMonData
	ldr r1, _02241FB4 ; =0x0000080C
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa1
	bl GetMonData
	ldr r1, _02241FB8 ; =0x0000080F
	mov r2, #0
	strb r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa
	bl GetMonData
	mov r1, #0x81
	lsl r1, r1, #4
	strb r0, [r5, r1]
	add r0, r6, #0
	bl GetMonNature
	ldr r1, _02241FBC ; =0x00000811
	mov r2, #0
	strb r0, [r5, r1]
	add r0, r6, #0
	mov r1, #6
	bl GetMonData
	ldr r1, _02241FC0 ; =0x00000812
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa3
	bl GetMonData
	ldr r1, _02241FC4 ; =0x00000818
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa4
	bl GetMonData
	ldr r1, _02241FC8 ; =0x0000081A
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa5
	bl GetMonData
	ldr r1, _02241FCC ; =0x0000081C
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	ldr r1, _02241FD0 ; =0x0000081E
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa6
	bl GetMonData
	mov r1, #0x82
	lsl r1, r1, #4
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	ldr r1, _02241FD4 ; =0x00000822
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa7
	bl GetMonData
	ldr r1, _02241FD8 ; =0x00000824
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0x70
	bl GetMonData
	ldr r1, _02241FDC ; =0x00000826
	strb r0, [r5, r1]
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, _02241FE0 ; =0x00000814
	mov r2, #0
	str r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xb0
	bl GetMonData
	cmp r0, #1
	ldr r1, _02241FE4 ; =0x0000080E
	bne _02241F24
	ldrb r2, [r5, r1]
	mov r0, #0x80
	bic r2, r0
	strb r2, [r5, r1]
	b _02241F2C
_02241F24:
	ldrb r2, [r5, r1]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r5, r1]
_02241F2C:
	add r0, r6, #0
	bl GetMonGender
	ldr r3, _02241FE4 ; =0x0000080E
	mov r2, #0x7f
	ldrb r1, [r5, r3]
	mov r4, #0
	bic r1, r2
	mov r2, #0x7f
	and r0, r2
	orr r0, r1
	strb r0, [r5, r3]
_02241F44:
	lsl r0, r4, #1
	add r0, r5, r0
	add r1, r4, #0
	str r0, [sp]
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, _02241FE8 ; =0x00000828
	add r7, r5, r4
	strh r0, [r2, r1]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	mov r1, #0x83
	lsl r1, r1, #4
	strb r0, [r7, r1]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3e
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	lsl r1, r1, #0x18
	ldr r2, [sp]
	ldr r0, _02241FE8 ; =0x00000828
	lsr r1, r1, #0x18
	ldrh r0, [r2, r0]
	bl WazaGetMaxPp
	ldr r1, _02241FEC ; =0x00000834
	strb r0, [r7, r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _02241F44
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ReleaseMonLock
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241FA8: .word 0x000007A4
_02241FAC: .word 0x00000804
_02241FB0: .word 0x00000808
_02241FB4: .word 0x0000080C
_02241FB8: .word 0x0000080F
_02241FBC: .word 0x00000811
_02241FC0: .word 0x00000812
_02241FC4: .word 0x00000818
_02241FC8: .word 0x0000081A
_02241FCC: .word 0x0000081C
_02241FD0: .word 0x0000081E
_02241FD4: .word 0x00000822
_02241FD8: .word 0x00000824
_02241FDC: .word 0x00000826
_02241FE0: .word 0x00000814
_02241FE4: .word 0x0000080E
_02241FE8: .word 0x00000828
_02241FEC: .word 0x00000834
	thumb_func_end ov83_02241E18

	thumb_func_start ov83_02241FF0
ov83_02241FF0: ; 0x02241FF0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1b
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1d
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1f
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x21
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x23
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x27
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x29
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x2b
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x58
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x4a
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x48
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x1f
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x46
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x59
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x4c
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x50
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x4e
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x52
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _022421DC ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x2b
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x54
	bl ov83_022479E4
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1b
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1d
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1f
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x21
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x23
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x27
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x29
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x2b
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x10
	pop {r4, pc}
	nop
_022421DC: .word 0x00010200
	thumb_func_end ov83_02241FF0

	thumb_func_start ov83_022421E0
ov83_022421E0: ; 0x022421E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	str r1, [sp, #0x14]
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1a
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1e
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #2
	lsl r0, r0, #8
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #9
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xa
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x2a
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xb
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #3
	lsl r0, r0, #8
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x33
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xd
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0224262C ; =0x00000804
	ldr r0, [r4, r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl BufferBoxMonNickname
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x5b
	bl ov83_02241DD8
	ldr r0, _02242634 ; =0x0000080E
	ldrb r0, [r4, r0]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1f
	bne _02242354
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	bne _02242334
	mov r3, #0
	str r3, [sp]
	ldr r0, _02242638 ; =0x00050600
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x56
	bl ov83_022479E4
	b _02242354
_02242334:
	cmp r0, #1
	bne _02242354
	mov r3, #0
	str r3, [sp]
	mov r0, #0xc1
	str r3, [sp, #4]
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x57
	bl ov83_022479E4
_02242354:
	mov r1, #0
	ldr r2, _0224263C ; =0x0000080F
	str r1, [sp]
	ldrb r2, [r4, r2]
	add r0, r4, #0
	mov r3, #3
	bl ov83_02240C48
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x1a
	lsl r1, r1, #4
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x5e
	bl ov83_02241DD8
	mov r2, #0x81
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl BufferAbilityName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #7
	lsl r1, r1, #6
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x4b
	bl ov83_02241DD8
	ldr r2, _02242640 ; =0x00000811
	ldr r0, [r4, #0x24]
	ldrb r2, [r4, r2]
	mov r1, #0
	bl BufferNatureName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x1e
	lsl r1, r1, #4
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x49
	bl ov83_02241DD8
	ldr r2, _02242644 ; =0x00000812
	ldr r0, [r4, #0x24]
	ldrh r2, [r4, r2]
	mov r1, #0
	bl BufferItemName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #2
	lsl r1, r1, #8
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x47
	bl ov83_02241DD8
	mov r1, #0
	ldr r2, _02242648 ; =0x00000818
	str r1, [sp]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0
	str r0, [sp]
	ldr r2, _0224264C ; =0x0000081A
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #1
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 ; =0x00010200
	mov r1, #0x22
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x5f
	bl ov83_02241DD8
	mov r1, #0
	ldr r2, _02242650 ; =0x0000081C
	str r1, [sp]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #9
	lsl r0, r0, #6
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 ; =0x00010200
	mov r1, #9
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #6
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x4d
	bl ov83_02241DD8
	mov r1, #0
	ldr r2, _02242654 ; =0x0000081E
	str r1, [sp]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 ; =0x00010200
	mov r1, #0x26
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x51
	bl ov83_02241DD8
	mov r1, #0
	mov r2, #0x82
	str r1, [sp]
	lsl r2, r2, #4
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0xa
	lsl r0, r0, #6
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 ; =0x00010200
	mov r1, #0xa
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #6
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x4f
	bl ov83_02241DD8
	mov r1, #0
	ldr r2, _02242658 ; =0x00000822
	str r1, [sp]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0x2a
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 ; =0x00010200
	mov r1, #0x2a
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x53
	bl ov83_02241DD8
	mov r1, #0
	ldr r2, _0224265C ; =0x00000824
	str r1, [sp]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r3, #3
	bl ov83_02240C48
	mov r0, #0xb
	lsl r0, r0, #6
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 ; =0x00010200
	mov r1, #0xb
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #6
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r4, r1
	mov r3, #0x55
	bl ov83_02241DD8
	add r6, r4, #0
	mov r5, #0
	str r4, [sp, #0x1c]
	add r6, #0x50
_02242586:
	ldr r3, [sp, #0x1c]
	ldr r2, _02242660 ; =0x00000828
	ldr r0, [r4, #0x24]
	ldrh r2, [r3, r2]
	add r1, r5, #0
	bl BufferMoveName
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 ; =0x00010200
	add r1, r5, #0
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r1, #0x28
	lsl r1, r1, #4
	add r3, r5, #0
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	add r1, r6, r1
	add r3, #0x60
	bl ov83_02241DD8
	ldr r1, [sp, #0x1c]
	ldr r0, _02242660 ; =0x00000828
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _022425F2
	add r0, r5, #0
	add r0, #0x2c
	lsl r7, r0, #4
	add r0, r6, r7
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02242630 ; =0x00010200
	lsl r3, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r6, r7
	lsr r7, r3, #0x1f
	add r7, r3, r7
	ldr r1, [r4, #0x20]
	mov r2, #0x66
	asr r3, r7, #1
	bl ov83_022479E4
	b _02242712
_022425F2:
	ldr r0, [r4, #0x20]
	mov r1, #0x5a
	bl NewString_ReadMsgData
	str r0, [sp, #0x28]
	mov r0, #0
	ldr r1, [sp, #0x28]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x24]
	add r0, r5, #0
	add r0, #0x2c
	lsl r7, r0, #4
	add r0, r6, r7
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp]
	ldr r0, _02242630 ; =0x00010200
	b _02242664
	.balign 4, 0
_0224262C: .word 0x00000804
_02242630: .word 0x00010200
_02242634: .word 0x0000080E
_02242638: .word 0x00050600
_0224263C: .word 0x0000080F
_02242640: .word 0x00000811
_02242644: .word 0x00000812
_02242648: .word 0x00000818
_0224264C: .word 0x0000081A
_02242650: .word 0x0000081C
_02242654: .word 0x0000081E
_02242658: .word 0x00000822
_0224265C: .word 0x00000824
_02242660: .word 0x00000828
_02242664:
	ldr r1, [sp, #0x28]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r2, [sp, #0x20]
	add r0, r6, r7
	mov r3, #0
	bl ov83_02247998
	ldr r0, [sp, #0x28]
	bl String_dtor
	add r0, r4, r5
	str r0, [sp, #0x18]
	mov r0, #0
	mov r2, #0x83
	str r0, [sp]
	ldr r3, [sp, #0x18]
	lsl r2, r2, #4
	ldrb r2, [r3, r2]
	add r0, r4, #0
	mov r1, #0
	mov r3, #2
	bl ov83_02240C48
	ldr r0, [r4, #0x20]
	mov r1, #0x65
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [sp, #0x2c]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r4, #0x28]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov ip, r0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0224280C ; =0x00010200
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r3, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r1, [r4, #0x28]
	sub r2, r3, r2
	mov r3, ip
	sub r2, r2, r3
	add r0, r6, r7
	mov r3, #0
	bl ov83_02247998
	ldr r0, [sp, #0x2c]
	bl String_dtor
	mov r0, #0
	str r0, [sp]
	ldr r3, [sp, #0x18]
	ldr r2, _02242810 ; =0x00000834
	add r0, r4, #0
	ldrb r2, [r3, r2]
	mov r1, #0
	mov r3, #2
	bl ov83_02240C48
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x24]
	mov r3, #0x65
	add r0, r1, r0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0224280C ; =0x00010200
	add r1, r6, r7
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x20]
	add r0, r4, #0
	bl ov83_02241DD8
_02242712:
	ldr r0, [sp, #0x1c]
	add r5, r5, #1
	add r0, r0, #2
	str r0, [sp, #0x1c]
	cmp r5, #4
	bhs _02242720
	b _02242586
_02242720:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _02242740
	mov r0, #0x17
	lsl r0, r0, #4
	mov r5, #0x12
	add r4, r4, r0
_0224272E:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #0x2f
	bls _0224272E
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_02242740:
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1a
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1e
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #2
	lsl r0, r0, #8
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #9
	lsl r0, r0, #6
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0xa
	lsl r0, r0, #6
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x2a
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0xb
	lsl r0, r0, #6
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #3
	lsl r0, r0, #8
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x33
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0xd
	lsl r0, r0, #6
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224280C: .word 0x00010200
_02242810: .word 0x00000834
	thumb_func_end ov83_022421E0

	thumb_func_start ov83_02242814
ov83_02242814: ; 0x02242814
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov83_02241E18
	add r0, r4, #0
	add r1, r5, #0
	bl ov83_022421E0
	mov r3, #0x1e
	lsl r3, r3, #6
	add r2, r3, #0
	add r1, r3, #0
	add r2, #0x8c
	ldr r0, [r4, r3]
	add r1, #0x88
	add r3, #0x94
	ldrh r2, [r4, r2]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	bl ov83_02247668
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_02242814

	thumb_func_start ov83_02242844
ov83_02242844: ; 0x02242844
	push {r4, r5, r6, lr}
	add r6, r0, #0
	cmp r1, #1
	bne _02242870
	mov r0, #0x17
	lsl r0, r0, #4
	mov r4, #0x12
	add r5, r6, r0
_02242854:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x2f
	bls _02242854
	mov r0, #0x1e
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	mov r1, #1
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
_02242870:
	mov r0, #0x17
	lsl r0, r0, #4
	mov r5, #0x12
	add r4, r6, r0
_02242878:
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #0x2f
	bls _02242878
	mov r0, #0x1e
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	mov r1, #0
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02242844

	thumb_func_start ov83_02242894
ov83_02242894: ; 0x02242894
	lsl r3, r0, #0x1f
	lsr r3, r3, #0x18
	add r3, #0x14
	strh r3, [r1]
	lsr r1, r0, #1
	mov r0, #0x28
	mul r0, r1
	add r0, #0x38
	strh r0, [r2]
	bx lr
	thumb_func_end ov83_02242894

	thumb_func_start ov83_022428A8
ov83_022428A8: ; 0x022428A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	str r0, [sp, #0x14]
	add r0, #0x50
	add r7, r1, #0
	mov r4, #0
	add r5, r6, #0
	str r0, [sp, #0x14]
_022428BA:
	add r0, r4, #0
	add r0, #0x30
	lsl r1, r0, #4
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	cmp r4, r7
	ldr r0, _022429CC ; =0x00000784
	beq _022428D8
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov83_0224755C
	b _022428E2
_022428D8:
	ldr r0, [r5, r0]
	mov r1, #0x44
	mov r2, #0x4c
	bl ov83_02247568
_022428E2:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _022428BA
	ldr r0, _022429D0 ; =0x0000077C
	mov r1, #0
	ldr r0, [r6, r0]
	bl ov83_0224755C
	mov r0, #0x6b
	str r0, [sp]
	ldr r0, _022429D4 ; =0x000007A8
	mov r1, #0x27
	ldr r0, [r6, r0]
	mov r2, #1
	add r3, sp, #0x18
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0x18]
	ldr r0, [r6, #0x4c]
	mov r1, #2
	add r2, #0xc
	bl LoadRectToBgTilemapRect
	ldr r0, [r6, #0x4c]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x3b
	lsl r0, r0, #4
	add r0, r6, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xf
	lsl r0, r0, #6
	add r0, r6, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _022429D8 ; =0x00000862
	ldr r2, _022429DC ; =0x000004DC
	ldrsh r1, [r6, r0]
	mov r0, #6
	mul r0, r1
	mov r1, #0
	add r0, r0, r7
	lsl r4, r0, #3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022429E0 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r6, r2]
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r2, [r2, r4]
	add r0, r6, r0
	bl AddTextPrinterParameterized2
	ldr r1, _022429DC ; =0x000004DC
	ldrb r2, [r6, #0x13]
	ldr r1, [r6, r1]
	add r0, r6, #0
	add r1, r1, r4
	ldr r1, [r1, #4]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov83_02240EC4
	add r2, r0, #0
	mov r1, #0
	add r0, r6, #0
	mov r3, #2
	str r1, [sp]
	bl ov83_02240C48
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _022429E0 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0xf
	lsl r1, r1, #6
	ldr r2, [r6, #0x20]
	add r0, r6, #0
	add r1, r6, r1
	mov r3, #0x68
	bl ov83_02241DD8
	mov r0, #0x3b
	lsl r0, r0, #4
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0xf
	lsl r0, r0, #6
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022429CC: .word 0x00000784
_022429D0: .word 0x0000077C
_022429D4: .word 0x000007A8
_022429D8: .word 0x00000862
_022429DC: .word 0x000004DC
_022429E0: .word 0x00010200
	thumb_func_end ov83_022428A8

	thumb_func_start ov83_022429E4
ov83_022429E4: ; 0x022429E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	mov r0, #0x3b
	lsl r0, r0, #4
	add r0, r6, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0xf
	lsl r0, r0, #6
	add r0, r6, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x6b
	str r0, [sp]
	ldr r0, _02242AA0 ; =0x000007A8
	mov r1, #0x26
	ldr r0, [r6, r0]
	mov r2, #1
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r0, [r6, #0x4c]
	mov r1, #2
	add r2, #0xc
	bl LoadRectToBgTilemapRect
	ldr r0, [r6, #0x4c]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, _02242AA4 ; =0x00000862
	mov r4, #0
	ldrsh r1, [r6, r0]
	mov r0, #6
	add r5, r6, #0
	add r7, r1, #0
	mul r7, r0
_02242A46:
	add r1, sp, #0xc
	add r0, r4, #0
	add r1, #2
	add r2, sp, #0xc
	bl ov83_02242894
	ldr r0, _02242AA8 ; =0x00000784
	add r1, sp, #0xc
	add r2, sp, #0xc
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	ldr r0, [r5, r0]
	bl ov83_02247568
	ldr r0, _02242AAC ; =0x00000861
	add r1, r7, r4
	ldrb r0, [r6, r0]
	cmp r1, r0
	bhs _02242A76
	ldr r0, _02242AA8 ; =0x00000784
	mov r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224755C
_02242A76:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _02242A46
	ldr r0, _02242AB0 ; =0x0000077C
	mov r1, #1
	ldr r0, [r6, r0]
	bl ov83_0224755C
	add r0, r6, #0
	bl ov83_02240664
	add r0, r6, #0
	bl ov83_022407FC
	add r0, r6, #0
	bl ov83_0224088C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02242AA0: .word 0x000007A8
_02242AA4: .word 0x00000862
_02242AA8: .word 0x00000784
_02242AAC: .word 0x00000861
_02242AB0: .word 0x0000077C
	thumb_func_end ov83_022429E4

	thumb_func_start ov83_02242AB4
ov83_02242AB4: ; 0x02242AB4
	ldr r3, _02242ABC ; =ov83_02240DB0
	strb r1, [r0, #0xd]
	strb r2, [r0, #0xc]
	bx r3
	.balign 4, 0
_02242ABC: .word ov83_02240DB0
	thumb_func_end ov83_02242AB4

	thumb_func_start ov83_02242AC0
ov83_02242AC0: ; 0x02242AC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02242ADC ; =0x0000077C
	add r4, r3, #0
	ldr r0, [r5, r0]
	bl ov83_02247568
	ldr r0, _02242ADC ; =0x0000077C
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl ov83_022475D4
	pop {r3, r4, r5, pc}
	nop
_02242ADC: .word 0x0000077C
	thumb_func_end ov83_02242AC0

	thumb_func_start ov83_02242AE0
ov83_02242AE0: ; 0x02242AE0
	ldr r3, _02242AE8 ; =ov83_022408E0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bx r3
	.balign 4, 0
_02242AE8: .word ov83_022408E0
	thumb_func_end ov83_02242AE0

	thumb_func_start ov83_02242AEC
ov83_02242AEC: ; 0x02242AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r0, sp, #4
	add r4, r1, #0
	add r0, #2
	add r1, sp, #4
	add r6, r2, #0
	add r7, r3, #0
	bl ov83_02247988
	ldr r0, _02242B9C ; =_02247D0C
	add r1, sp, #4
	ldrh r2, [r0, #0x1e]
	add r3, sp, #8
	strh r2, [r1, #0x1c]
	ldrh r2, [r0, #0x20]
	strh r2, [r1, #0x1e]
	ldrh r2, [r0, #0x22]
	strh r2, [r1, #0x20]
	ldrh r2, [r0, #0x24]
	strh r2, [r1, #0x22]
	ldrh r2, [r0, #0x26]
	ldrh r0, [r0, #0x28]
	strh r2, [r1, #0x24]
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0x22]
	ldrh r2, [r1]
	add r0, r0, r2
	sub r0, #0x1b
	strh r0, [r1, #0x24]
	strh r2, [r1, #0x26]
	ldrh r0, [r1, #0x1c]
	strh r0, [r1, #4]
	ldrh r0, [r1, #0x1e]
	strh r0, [r1, #6]
	ldrh r0, [r1, #0x20]
	strh r0, [r1, #8]
	ldrh r0, [r1, #0x22]
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0x24]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x26]
	strh r0, [r1, #0xe]
	ldr r0, _02242BA0 ; =0x00000844
	ldr r2, [r5, r0]
	sub r0, #8
	str r2, [sp, #0x14]
	ldr r2, [r5, #0x4c]
	str r2, [sp, #0x18]
	strb r4, [r1, #0x18]
	add r1, sp, #0x30
	ldrb r1, [r1, #0x10]
	add r2, r6, #0
	str r1, [sp]
	add r1, r3, #0
	ldr r0, [r5, r0]
	add r3, r7, #0
	bl ov83_02247CCC
	mov r1, #0x21
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldrb r1, [r5, #0xe]
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B24
	add r4, r0, #0
	ldr r0, _02242BA4 ; =0x0000073C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #1
	bl ov83_0224773C
	ldr r0, _02242BA8 ; =0x0000074C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #1
	bl ov83_0224773C
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02242B9C: .word _02247D0C
_02242BA0: .word 0x00000844
_02242BA4: .word 0x0000073C
_02242BA8: .word 0x0000074C
	thumb_func_end ov83_02242AEC

	thumb_func_start ov83_02242BAC
ov83_02242BAC: ; 0x02242BAC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #3
	mov r1, #0x6b
	bl ListMenuItems_ctor
	ldr r1, _02242BE8 ; =0x00000844
	ldr r5, _02242BEC ; =ov83_02247D6C
	str r0, [r6, r1]
	mov r4, #0
	add r7, r1, #0
_02242BC2:
	ldr r0, [r6, r7]
	ldr r1, [r6, #0x20]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	add r5, #8
	cmp r4, #3
	blo _02242BC2
	mov r0, #0xd
	str r0, [sp]
	add r0, r6, #0
	mov r1, #3
	mov r2, #0x11
	mov r3, #8
	bl ov83_02242AEC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02242BE8: .word 0x00000844
_02242BEC: .word ov83_02247D6C
	thumb_func_end ov83_02242BAC

	thumb_func_start ov83_02242BF0
ov83_02242BF0: ; 0x02242BF0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r0, #5
	mov r1, #0x6b
	bl ListMenuItems_ctor
	ldr r1, _02242C9C ; =0x00000844
	mov r2, #0
	str r0, [r4, r1]
	ldr r0, _02242CA0 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	bl ov83_0224777C
	mov r5, #0
	add r7, r0, #0
	add r6, r5, #0
_02242C12:
	mov r0, #0xc
	add r1, r6, #0
	mul r1, r0
	ldr r0, _02242CA4 ; =ov83_02247F4C
	add r2, r0, r1
	ldr r3, [r2, #8]
	cmp r3, #4
	bhi _02242C6A
	add r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02242C2E: ; jump table
	.short _02242C6A - _02242C2E - 2 ; case 0
	.short _02242C38 - _02242C2E - 2 ; case 1
	.short _02242C38 - _02242C2E - 2 ; case 2
	.short _02242C38 - _02242C2E - 2 ; case 3
	.short _02242C52 - _02242C2E - 2 ; case 4
_02242C38:
	ldr r0, [r2]
	cmp r7, r0
	blo _02242C7C
	ldr r0, _02242C9C ; =0x00000844
	ldr r1, [r4, #0x20]
	ldr r0, [r4, r0]
	ldr r2, [r2, #4]
	bl ListMenuItems_AppendFromMsgData
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	b _02242C7C
_02242C52:
	cmp r7, #3
	beq _02242C7C
	ldr r0, _02242C9C ; =0x00000844
	ldr r1, [r4, #0x20]
	ldr r0, [r4, r0]
	ldr r2, [r2, #4]
	bl ListMenuItems_AppendFromMsgData
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	b _02242C7C
_02242C6A:
	ldr r0, _02242C9C ; =0x00000844
	ldr r1, [r4, #0x20]
	ldr r0, [r4, r0]
	ldr r2, [r2, #4]
	bl ListMenuItems_AppendFromMsgData
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02242C7C:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #5
	blo _02242C12
	ldr r3, _02242CA8 ; =ov83_02248008
	mov r0, #0xd
	ldrb r3, [r3, r5]
	str r0, [sp]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x11
	bl ov83_02242AEC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242C9C: .word 0x00000844
_02242CA0: .word 0x0000050C
_02242CA4: .word ov83_02247F4C
_02242CA8: .word ov83_02248008
	thumb_func_end ov83_02242BF0

	thumb_func_start ov83_02242CAC
ov83_02242CAC: ; 0x02242CAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x6b
	bl ListMenuItems_ctor
	ldr r1, _02242D4C ; =0x00000844
	mov r2, #1
	str r0, [r5, r1]
	ldr r0, _02242D50 ; =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	bl ov83_0224777C
	mov r4, #0
	add r7, r0, #0
	add r6, r4, #0
_02242CCE:
	mov r0, #0xc
	add r1, r6, #0
	mul r1, r0
	ldr r0, _02242D54 ; =ov83_02247EB0
	add r2, r0, r1
	ldr r3, [r2, #8]
	cmp r3, #6
	beq _02242CE8
	cmp r3, #7
	beq _02242CE8
	cmp r3, #8
	beq _02242D02
	b _02242D1A
_02242CE8:
	ldr r0, [r2]
	cmp r7, r0
	blo _02242D2C
	ldr r0, _02242D4C ; =0x00000844
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	ldr r2, [r2, #4]
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _02242D2C
_02242D02:
	cmp r7, #3
	beq _02242D2C
	ldr r0, _02242D4C ; =0x00000844
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	ldr r2, [r2, #4]
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _02242D2C
_02242D1A:
	ldr r0, _02242D4C ; =0x00000844
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	ldr r2, [r2, #4]
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02242D2C:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	blo _02242CCE
	ldr r3, _02242D58 ; =ov83_02248008
	mov r0, #0xd
	ldrb r3, [r3, r4]
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x11
	bl ov83_02242AEC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242D4C: .word 0x00000844
_02242D50: .word 0x0000050C
_02242D54: .word ov83_02247EB0
_02242D58: .word ov83_02248008
	thumb_func_end ov83_02242CAC

	thumb_func_start ov83_02242D5C
ov83_02242D5C: ; 0x02242D5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B24
	add r4, r0, #0
	ldr r0, _02242DA0 ; =0x0000073C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	bl ov83_0224773C
	ldr r0, _02242DA4 ; =0x0000074C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	bl ov83_0224773C
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ov83_02247CE8
	ldr r0, _02242DA8 ; =0x00000844
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldrb r1, [r5, #0xe]
	mov r0, #0x10
	bic r1, r0
	strb r1, [r5, #0xe]
	pop {r3, r4, r5, pc}
	nop
_02242DA0: .word 0x0000073C
_02242DA4: .word 0x0000074C
_02242DA8: .word 0x00000844
	thumb_func_end ov83_02242D5C

	thumb_func_start ov83_02242DAC
ov83_02242DAC: ; 0x02242DAC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r1, #0x21
	add r4, r0, #0
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	add r1, #8
	add r2, #0x24
	ldrb r2, [r2]
	ldr r1, [r4, r1]
	cmp r1, r2
	beq _02242DF4
	mov r3, #1
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	lsl r5, r2, #1
	ldr r2, _02242DF8 ; =ov83_02247D1E
	str r3, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	mov r1, #0xf
	str r1, [sp, #0x10]
	add r1, r4, #0
	ldrh r2, [r2, r5]
	add r1, #0xb0
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r0, #8
	add r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02242DF4:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02242DF8: .word ov83_02247D1E
	thumb_func_end ov83_02242DAC

	thumb_func_start ov83_02242DFC
ov83_02242DFC: ; 0x02242DFC
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r1, #0x24
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #8
	ldr r1, [r4, r1]
	cmp r1, r2
	beq _02242E80
	add r0, r0, #4
	ldr r1, [r4, r0]
	lsl r0, r2, #3
	add r0, r1, r0
	ldr r1, [r0, #4]
	cmp r1, #4
	beq _02242E2E
	mov r0, #1
	mvn r0, r0
	cmp r1, r0
	beq _02242E4E
	b _02242E52
_02242E2E:
	ldr r0, _02242E84 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #0
	bl ov83_0224777C
	cmp r0, #3
	bne _02242E42
	mov r2, #0x1b
	b _02242E54
_02242E42:
	cmp r0, #1
	bne _02242E4A
	mov r2, #0x19
	b _02242E54
_02242E4A:
	mov r2, #0x1a
	b _02242E54
_02242E4E:
	mov r2, #0x1c
	b _02242E54
_02242E52:
	mov r2, #0x18
_02242E54:
	mov r3, #1
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r1, r4, #0
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, #0xb0
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r0, #8
	add r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02242E80:
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_02242E84: .word 0x0000050C
	thumb_func_end ov83_02242DFC

	thumb_func_start ov83_02242E88
ov83_02242E88: ; 0x02242E88
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r1, #0x24
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #8
	ldr r1, [r4, r1]
	cmp r1, r2
	beq _02242F10
	add r0, r0, #4
	ldr r1, [r4, r0]
	lsl r0, r2, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	cmp r0, #6
	beq _02242EBA
	cmp r0, #7
	beq _02242EBE
	cmp r0, #8
	beq _02242EC2
	b _02242EE2
_02242EBA:
	mov r2, #0x30
	b _02242EE4
_02242EBE:
	mov r2, #0x31
	b _02242EE4
_02242EC2:
	ldr r0, _02242F14 ; =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #1
	bl ov83_0224777C
	cmp r0, #3
	bne _02242ED6
	mov r2, #0x34
	b _02242EE4
_02242ED6:
	cmp r0, #1
	bne _02242EDE
	mov r2, #0x32
	b _02242EE4
_02242EDE:
	mov r2, #0x33
	b _02242EE4
_02242EE2:
	mov r2, #0x35
_02242EE4:
	mov r3, #1
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r1, r4, #0
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, #0xb0
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	mov r0, #0x21
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r0, #8
	add r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02242F10:
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_02242F14: .word 0x0000050C
	thumb_func_end ov83_02242E88

	thumb_func_start ov83_02242F18
ov83_02242F18: ; 0x02242F18
	ldr r2, _02242F28 ; =0x00000864
	mov r3, #0
	strh r1, [r0, r2]
	add r1, r2, #2
	strb r3, [r0, r1]
	add r1, r2, #3
	strb r3, [r0, r1]
	bx lr
	.balign 4, 0
_02242F28: .word 0x00000864
	thumb_func_end ov83_02242F18

	thumb_func_start ov83_02242F2C
ov83_02242F2C: ; 0x02242F2C
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _02242FD8 ; =0x00000864
	add r4, r0, #0
	ldrh r0, [r4, r1]
	ldr r2, _02242FDC ; =ov83_02247E64
	lsl r0, r0, #2
	add r3, r2, r0
	add r0, r1, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02242F4E
	cmp r0, #1
	beq _02242F78
	cmp r0, #2
	beq _02242FBA
	b _02242FD0
_02242F4E:
	ldrb r0, [r3, #2]
	mov r1, #2
	str r0, [sp]
	ldrb r0, [r3, #3]
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r4, #0x4c]
	bl BgTilemapRectChangePalette
	ldr r0, [r4, #0x4c]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _02242FE0 ; =0x00000866
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02242FD0
_02242F78:
	add r0, r1, #3
	ldrb r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #3
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _02242FD0
	ldrb r0, [r3, #2]
	mov r1, #2
	str r0, [sp]
	ldrb r0, [r3, #3]
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r4, #0x4c]
	bl BgTilemapRectChangePalette
	ldr r0, [r4, #0x4c]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _02242FE4 ; =0x00000867
	mov r1, #0
	strb r1, [r4, r0]
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02242FD0
_02242FBA:
	add r0, r1, #3
	ldrb r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #3
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _02242FD0
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_02242FD0:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02242FD8: .word 0x00000864
_02242FDC: .word ov83_02247E64
_02242FE0: .word 0x00000866
_02242FE4: .word 0x00000867
	thumb_func_end ov83_02242F2C

	thumb_func_start ov83_02242FE8
ov83_02242FE8: ; 0x02242FE8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _022430F0 ; =FS_OVERLAY_ID(OVY_80)
	mov r1, #2
	bl HandleLoadOverlay
	bl ov83_02243F9C
	mov r0, #3
	mov r1, #0x6b
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r1, _022430F4 ; =0x00000614
	add r0, r4, #0
	mov r2, #0x6b
	bl OverlayManager_CreateAndGetData
	ldr r2, _022430F4 ; =0x00000614
	mov r1, #0
	add r5, r0, #0
	bl memset
	mov r0, #0x6b
	bl BgConfig_Alloc
	str r0, [r5, #0x4c]
	add r0, r4, #0
	str r4, [r5]
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	mov r0, #0xaf
	ldr r1, [r4]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	bl sub_02030CC8
	mov r1, #0xb
	lsl r1, r1, #6
	str r0, [r5, r1]
	sub r0, r1, #4
	ldr r0, [r5, r0]
	bl sub_02030E08
	mov r1, #0xb1
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldrb r0, [r4, #4]
	add r2, r4, #0
	add r2, #0x20
	strb r0, [r5, #9]
	ldr r0, _022430F8 ; =0x00000548
	sub r1, #8
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0xae
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r3, r4, #0
	ldr r2, [r4, #0x1c]
	ldr r0, _022430FC ; =0x0000055C
	add r3, #8
	str r2, [r5, r0]
	add r2, r0, #0
	sub r2, #0x10
	str r3, [r5, r2]
	add r3, r4, #0
	add r2, r0, #0
	add r3, #0xc
	sub r2, #0xc
	str r3, [r5, r2]
	add r3, r4, #0
	add r2, r0, #0
	add r3, #0x10
	sub r2, #8
	str r3, [r5, r2]
	add r3, r4, #0
	sub r2, r0, #4
	add r3, #0x14
	str r3, [r5, r2]
	mov r2, #0xff
	strb r2, [r5, #0x11]
	ldrh r2, [r4, #0x28]
	add r0, #0x5e
	strh r2, [r5, r0]
	add r0, r1, #4
	ldr r0, [r5, r0]
	bl sub_0203107C
	str r0, [r5, #4]
	ldr r0, _02243100 ; =0x000005B7
	mov r3, #0
	mov r2, #1
_022430AA:
	add r1, r5, r3
	add r3, r3, #1
	strb r2, [r1, r0]
	cmp r3, #3
	blt _022430AA
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022430C2
	mov r0, #3
	b _022430C4
_022430C2:
	mov r0, #4
_022430C4:
	strb r0, [r5, #0x14]
	mov r0, #4
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x15]
	mov r1, #0
	sub r0, r0, #1
	strb r0, [r5, #0xc]
	ldr r0, _02243104 ; =0x000005B4
	strb r1, [r5, r0]
	add r0, r5, #0
	bl ov83_02243FD4
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _022430EC
	add r0, r5, #0
	bl sub_02096910
_022430EC:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022430F0: .word FS_OVERLAY_ID(OVY_80)
_022430F4: .word 0x00000614
_022430F8: .word 0x00000548
_022430FC: .word 0x0000055C
_02243100: .word 0x000005B7
_02243104: .word 0x000005B4
	thumb_func_end ov83_02242FE8

	thumb_func_start ov83_02243108
ov83_02243108: ; 0x02243108
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, _02243260 ; =0x000005B6
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #1
	bne _02243176
	ldr r2, [r5]
	cmp r2, #1
	bne _022431A2
	mov r2, #0
	strb r2, [r4, r1]
	bl ov83_02245074
	add r0, r4, #0
	bl ov83_022459A0
	ldr r0, _02243264 ; =0x00000504
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02243142
	bl ov83_0224753C
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
_02243142:
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02247944
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl ov80_0222A7CC
	add r0, r4, #0
	mov r1, #7
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov83_02244CD4
	b _022431A2
_02243176:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xff
	beq _022431A2
	ldr r0, [r5]
	cmp r0, #1
	beq _02243186
	cmp r0, #3
	bne _022431A2
_02243186:
	ldr r0, _02243260 ; =0x000005B6
	mov r1, #0
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov83_02245074
	add r0, r4, #0
	bl ov83_022459A0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov83_02244CD4
_022431A2:
	ldr r0, [r5]
	cmp r0, #4
	bhi _0224324C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022431B4: ; jump table
	.short _022431BE - _022431B4 - 2 ; case 0
	.short _022431D4 - _022431B4 - 2 ; case 1
	.short _02243212 - _022431B4 - 2 ; case 2
	.short _02243228 - _022431B4 - 2 ; case 3
	.short _0224323E - _022431B4 - 2 ; case 4
_022431BE:
	add r0, r4, #0
	bl ov83_022432B4
	cmp r0, #1
	bne _0224324C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov83_02244CD4
	b _0224324C
_022431D4:
	add r0, r4, #0
	bl ov83_022433F8
	cmp r0, #1
	bne _0224324C
	ldrb r0, [r4, #0x10]
	cmp r0, #1
	bne _022431F0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov83_02244CD4
	b _0224324C
_022431F0:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02243206
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov83_02244CD4
	b _0224324C
_02243206:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov83_02244CD4
	b _0224324C
_02243212:
	add r0, r4, #0
	bl ov83_02243C88
	cmp r0, #1
	bne _0224324C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov83_02244CD4
	b _0224324C
_02243228:
	add r0, r4, #0
	bl ov83_02243D7C
	cmp r0, #1
	bne _0224324C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov83_02244CD4
	b _0224324C
_0224323E:
	add r0, r4, #0
	bl ov83_02243DE8
	cmp r0, #1
	bne _0224324C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224324C:
	add r0, r4, #0
	bl ov83_022459AC
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202457C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02243260: .word 0x000005B6
_02243264: .word 0x00000504
	thumb_func_end ov83_02243108

	thumb_func_start ov83_02243268
ov83_02243268: ; 0x02243268
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _022432A8 ; =0x00000548
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, r0]
	strh r1, [r0]
	ldr r0, _022432AC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov83_02243E30
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x6b
	bl DestroyHeap
	ldr r0, _022432B0 ; =FS_OVERLAY_ID(OVY_80)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022432A8: .word 0x00000548
_022432AC: .word 0x04000050
_022432B0: .word FS_OVERLAY_ID(OVY_80)
	thumb_func_end ov83_02243268

	thumb_func_start ov83_022432B4
ov83_022432B4: ; 0x022432B4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #4
	bhi _022433B0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022432CC: ; jump table
	.short _022432D6 - _022432CC - 2 ; case 0
	.short _022432F2 - _022432CC - 2 ; case 1
	.short _0224331A - _022432CC - 2 ; case 2
	.short _02243360 - _022432CC - 2 ; case 3
	.short _022433A2 - _022432CC - 2 ; case 4
_022432D6:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _022432EA
	bl sub_02037BEC
	mov r0, #0xd8
	bl sub_02037AC0
_022432EA:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_022432F2:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02243312
	mov r0, #0xd8
	bl sub_02037B38
	cmp r0, #1
	bne _022433B0
	bl sub_02037BEC
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_02243312:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_0224331A:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0224333A
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0
	bl ov83_022450A8
	cmp r0, #1
	bne _022433B0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_0224333A:
	add r0, r4, #0
	bl ov83_022433B8
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_02243360:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _0224339A
	ldrb r0, [r4, #0x17]
	cmp r0, #2
	blo _022433B0
	mov r0, #0
	strb r0, [r4, #0x17]
	add r0, r4, #0
	bl ov83_022433B8
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_0224339A:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_022433A2:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022433B0
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_022433B0:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov83_022432B4

	thumb_func_start ov83_022433B8
ov83_022433B8: ; 0x022433B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x50
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02245584
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_022453DC
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x80
	bl ov83_022448E4
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x70
	bl ov83_022449D4
	add r0, r5, #0
	bl ov83_02244BEC
	bl GX_BothDispOn
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_022433B8

	thumb_func_start ov83_022433F8
ov83_022433F8: ; 0x022433F8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0x12
	bhi _022434BA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224340E: ; jump table
	.short _02243434 - _0224340E - 2 ; case 0
	.short _0224348E - _0224340E - 2 ; case 1
	.short _022434F6 - _0224340E - 2 ; case 2
	.short _0224361E - _0224340E - 2 ; case 3
	.short _022436D4 - _0224340E - 2 ; case 4
	.short _022437D8 - _0224340E - 2 ; case 5
	.short _022438AE - _0224340E - 2 ; case 6
	.short _02243A36 - _0224340E - 2 ; case 7
	.short _02243A76 - _0224340E - 2 ; case 8
	.short _02243AB6 - _0224340E - 2 ; case 9
	.short _02243B5A - _0224340E - 2 ; case 10
	.short _02243B86 - _0224340E - 2 ; case 11
	.short _02243B92 - _0224340E - 2 ; case 12
	.short _02243BBC - _0224340E - 2 ; case 13
	.short _02243BCE - _0224340E - 2 ; case 14
	.short _02243BE0 - _0224340E - 2 ; case 15
	.short _02243BFA - _0224340E - 2 ; case 16
	.short _02243C1C - _0224340E - 2 ; case 17
	.short _02243C4C - _0224340E - 2 ; case 18
_02243434:
	mov r0, #0
	strb r0, [r4, #0xb]
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xf]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	cmp r0, #1
	bne _02243456
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244BEC
	b _02243484
_02243456:
	cmp r0, #2
	bne _0224347C
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244C9C
	mov r0, #0x15
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xc8
	mov r2, #0x69
	bl ov83_02247630
	mov r0, #6
	strb r0, [r4, #8]
	b _02243484
_0224347C:
	cmp r0, #3
	bne _02243484
	mov r0, #0xe
	strb r0, [r4, #8]
_02243484:
	ldrb r1, [r4, #0xf]
	mov r0, #0xf8
	bic r1, r0
	strb r1, [r4, #0xf]
	b _02243C7A
_0224348E:
	mov r0, #0x5f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov83_02247AD4
	cmp r0, #4
	bhi _022434B2
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022434A8: ; jump table
	.short _022434BC - _022434A8 - 2 ; case 0
	.short _022434BC - _022434A8 - 2 ; case 1
	.short _022434BC - _022434A8 - 2 ; case 2
	.short _022434BC - _022434A8 - 2 ; case 3
	.short _022434CE - _022434A8 - 2 ; case 4
_022434B2:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _022434D8
_022434BA:
	b _02243C7A
_022434BC:
	add r0, r4, #0
	bl ov83_02244C4C
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022434CE:
	ldr r0, _022437F0 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, pc}
_022434D8:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0x15]
	cmp r1, r0
	beq _0224351A
	mov r0, #0x5f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov83_02247B04
	ldrb r2, [r4, #0xd]
	add r0, r4, #0
	mov r1, #4
	bl ov83_022469D8
	b _02243C7A
_022434F6:
	ldr r0, _022437F4 ; =0x000005F8
	ldr r0, [r4, r0]
	bl sub_020186A4
	ldr r1, _022437F0 ; =0x000005DC
	add r5, r0, #0
	bl ov83_022477B0
	add r0, r4, #0
	bl ov83_02246CC0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bhi _02243536
	bhs _0224360C
	cmp r5, #6
	bls _0224351C
_0224351A:
	b _02243C7A
_0224351C:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02243528: ; jump table
	.short _0224353E - _02243528 - 2 ; case 0
	.short _022435C6 - _02243528 - 2 ; case 1
	.short _022435FA - _02243528 - 2 ; case 2
	.short _02243C7A - _02243528 - 2 ; case 3
	.short _02243C7A - _02243528 - 2 ; case 4
	.short _02243C7A - _02243528 - 2 ; case 5
	.short _0224360C - _02243528 - 2 ; case 6
_02243536:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	b _02243C7A
_0224353E:
	strb r5, [r4, #0x13]
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r1, _022437F8 ; =0x0000054C
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02243584
	add r0, r4, #0
	bl ov83_02244C88
	add r0, r4, #0
	bl ov83_022453C0
	mov r1, #0
	add r0, r4, #0
	mov r2, #1
	mov r3, #4
	str r1, [sp]
	bl ov83_02244A98
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02244A74
	mov r0, #3
	strb r0, [r4, #8]
	b _02243C7A
_02243584:
	add r0, r4, #0
	bl ov83_02244C88
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _022437FC ; =0x0000055C
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	add r0, r4, #0
	bl ov83_022453C0
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov83_02244AB0
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	mov r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_022435C6:
	add r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_02244C88
	add r0, r4, #0
	bl ov83_022453C0
	mov r2, #0x17
	lsl r2, r2, #6
	ldr r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0
	bl ov83_02244AB0
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02244A88
	mov r0, #4
	strb r0, [r4, #8]
	b _02243C7A
_022435FA:
	add r0, r4, #0
	bl ov83_02244C88
	add r0, r4, #0
	bl ov83_02244C9C
	mov r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_0224360C:
	add r0, r4, #0
	bl ov83_02244C88
	add r0, r4, #0
	bl ov83_02244BEC
	mov r0, #0
	strb r0, [r4, #8]
	b _02243C7A
_0224361E:
	ldr r0, _02243800 ; =0x00000604
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02243630
	cmp r0, #2
	beq _022436B8
	b _02243C7A
_02243630:
	ldr r0, _02243800 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	cmp r0, #1
	bhs _02243678
	add r0, r4, #0
	bl ov83_022453C0
	add r0, r4, #0
	mov r1, #0x1c
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	mov r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_02243678:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022436B2
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	mov r2, #1
	bl ov80_02237FA4
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	bl ov83_022453DC
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	bl ov83_02245748
	add r0, r4, #0
	bl ov83_02246988
	add r0, r4, #0
	mov r1, #0
	bl ov83_02246114
	mov r0, #0xb
	strb r0, [r4, #8]
	b _02243C7A
_022436B2:
	mov r0, #1
	strb r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_022436B8:
	ldr r0, _02243800 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022436D4:
	ldr r0, _022437F4 ; =0x000005F8
	ldr r0, [r4, r0]
	bl sub_020186A4
	ldr r1, _022437F0 ; =0x000005DC
	add r5, r0, #0
	bl ov83_022477B0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bhi _02243700
	bhs _02243706
	cmp r5, #2
	bhi _022436FE
	cmp r5, #0
	beq _02243720
	cmp r5, #1
	beq _0224377C
	cmp r5, #2
	beq _02243706
_022436FE:
	b _02243C7A
_02243700:
	add r0, r0, #1
	cmp r5, r0
	b _02243C7A
_02243706:
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244A90
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_02243720:
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	add r0, r4, #0
	bl ov83_02244A90
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	mov r1, #0x55
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0224376E
	add r0, r4, #0
	bl ov83_022453C0
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	mov r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_0224376E:
	add r0, r4, #0
	mov r1, #1
	bl ov83_02245554
	mov r0, #5
	strb r0, [r4, #8]
	b _02243C7A
_0224377C:
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	add r0, r4, #0
	bl ov83_02244A90
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	mov r1, #0x55
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _022437CA
	add r0, r4, #0
	bl ov83_022453C0
	add r0, r4, #0
	mov r1, #0x1e
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	mov r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_022437CA:
	add r0, r4, #0
	mov r1, #2
	bl ov83_02245554
	mov r0, #5
	strb r0, [r4, #8]
	b _02243C7A
_022437D8:
	ldr r0, _02243800 ; =0x00000604
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _022437EA
	cmp r0, #2
	beq _02243892
	b _02243C7A
_022437EA:
	ldr r0, _02243800 ; =0x00000604
	b _02243804
	nop
_022437F0: .word 0x000005DC
_022437F4: .word 0x000005F8
_022437F8: .word 0x0000054C
_022437FC: .word 0x0000055C
_02243800: .word 0x00000604
_02243804:
	add r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	add r5, r0, #0
	ldrb r0, [r4, #0xe]
	bl ov83_02245068
	cmp r5, r0
	bhs _0224384C
	add r0, r4, #0
	bl ov83_022453C0
	add r0, r4, #0
	mov r1, #0x1c
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	mov r0, #0x10
	strb r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224384C:
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0224388C
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	ldrb r0, [r4, #0xe]
	bl ov83_02245068
	add r2, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	bl ov80_02237FA4
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	bl ov83_022453DC
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xe]
	add r0, r4, #0
	bl ov83_02245838
	mov r0, #0xc
	strb r0, [r4, #8]
	b _02243C7A
_0224388C:
	mov r0, #1
	strb r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_02243892:
	ldr r0, _02243BA8 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022438AE:
	ldr r0, _02243BAC ; =0x000005F8
	ldr r0, [r4, r0]
	bl sub_020186A4
	ldr r1, _02243BB0 ; =0x000005DC
	add r5, r0, #0
	bl ov83_022477B0
	add r0, r4, #0
	bl ov83_02246D40
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bhi _022438E2
	bhs _022438E8
	cmp r5, #5
	bhi _022438E0
	cmp r5, #3
	blo _022438E0
	beq _02243902
	cmp r5, #4
	beq _0224394E
	cmp r5, #5
	beq _022439C0
_022438E0:
	b _02243C7A
_022438E2:
	add r0, r0, #1
	cmp r5, r0
	b _02243C7A
_022438E8:
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244CCC
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_02243902:
	strb r5, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02244CCC
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r1, _02243BB4 ; =0x00000554
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02243948
	add r0, r4, #0
	bl ov83_022453C0
	mov r1, #0
	add r0, r4, #0
	mov r2, #2
	mov r3, #4
	str r1, [sp]
	bl ov83_02244A98
	add r0, r4, #0
	mov r1, #0x2b
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02244A74
	mov r0, #7
	strb r0, [r4, #8]
	b _02243C7A
_02243948:
	mov r0, #0x11
	strb r0, [r4, #8]
	b _02243C7A
_0224394E:
	add r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_02244CCC
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #2
	bl ov83_0224777C
	cmp r0, #1
	bne _0224397C
	add r0, r4, #0
	mov r1, #0x2a
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	mov r0, #0xf
	strb r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224397C:
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r1, _02243BB8 ; =0x00000558
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _022439BA
	add r0, r4, #0
	bl ov83_022453C0
	mov r1, #0
	add r0, r4, #0
	mov r2, #5
	mov r3, #4
	str r1, [sp]
	bl ov83_02244A98
	add r0, r4, #0
	mov r1, #0x4f
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02244A74
	mov r0, #8
	strb r0, [r4, #8]
	b _02243C7A
_022439BA:
	mov r0, #0x12
	strb r0, [r4, #8]
	b _02243C7A
_022439C0:
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #2
	bl ov83_0224777C
	cmp r0, #2
	bne _022439EC
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244CCC
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022439EC:
	strb r5, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02244CCC
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	mov r1, #0
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #4
	str r1, [sp]
	bl ov83_02244A98
	add r0, r4, #0
	mov r1, #0x5b
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	add r0, r4, #0
	bl ov83_02244A74
	mov r0, #9
	strb r0, [r4, #8]
	b _02243C7A
_02243A36:
	ldr r0, _02243BA8 ; =0x00000604
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02243A48
	cmp r0, #2
	beq _02243A62
	b _02243C7A
_02243A48:
	ldr r0, _02243BA8 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	mov r1, #2
	mov r2, #0x2e
	bl ov83_02245A40
	cmp r0, #1
	bne _02243A86
	mov r0, #1
	pop {r3, r4, r5, pc}
_02243A62:
	ldr r0, _02243BA8 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_02244C9C
	mov r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243A76:
	ldr r0, _02243BA8 ; =0x00000604
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02243A88
	cmp r0, #2
	beq _02243AA2
_02243A86:
	b _02243C7A
_02243A88:
	ldr r0, _02243BA8 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	mov r1, #5
	mov r2, #0x52
	bl ov83_02245A40
	cmp r0, #1
	bne _02243AC6
	mov r0, #1
	pop {r3, r4, r5, pc}
_02243AA2:
	ldr r0, _02243BA8 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_02244C9C
	mov r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243AB6:
	ldr r0, _02243BA8 ; =0x00000604
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02243AC8
	cmp r0, #2
	beq _02243B46
_02243AC6:
	b _02243C7A
_02243AC8:
	ldr r0, _02243BA8 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl sub_020310BC
	add r5, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	mov r2, #2
	bl ov83_0224777C
	cmp r5, #0x32
	bhs _02243B26
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02247944
	add r0, r4, #0
	mov r1, #0x52
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	mov r0, #0xf
	strb r0, [r4, #8]
	b _02243C7A
_02243B26:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02243B40
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	mov r2, #5
	bl ov83_02245ACC
	mov r0, #0xa
	strb r0, [r4, #8]
	b _02243C7A
_02243B40:
	mov r0, #1
	strb r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_02243B46:
	ldr r0, _02243BA8 ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	add r0, r4, #0
	bl ov83_02244C9C
	mov r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243B5A:
	bl ov83_02247CF0
	cmp r0, #1
	beq _02243B64
	b _02243C7A
_02243B64:
	add r0, r4, #0
	bl ov83_02244C9C
	add r0, r4, #0
	mov r1, #0
	bl ov83_02246114
	mov r0, #0x15
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xc8
	mov r2, #0x69
	bl ov83_02247630
	mov r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243B86:
	add r1, r4, #0
	add r1, #0x80
	bl ov83_022448E4
	mov r0, #0xc
	strb r0, [r4, #8]
_02243B92:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02244E24
	cmp r0, #1
	bne _02243C7A
	mov r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
	nop
_02243BA8: .word 0x00000604
_02243BAC: .word 0x000005F8
_02243BB0: .word 0x000005DC
_02243BB4: .word 0x00000554
_02243BB8: .word 0x00000558
_02243BBC:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	bl ov83_02244E24
	cmp r0, #1
	bne _02243C7A
	mov r0, #0xe
	strb r0, [r4, #8]
	b _02243C7A
_02243BCE:
	ldrb r0, [r4, #0x13]
	cmp r0, #3
	bne _02243BDA
	mov r0, #0x11
	strb r0, [r4, #8]
	b _02243C7A
_02243BDA:
	mov r0, #0x12
	strb r0, [r4, #8]
	b _02243C7A
_02243BE0:
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_02244C9C
	mov r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243BFA:
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02244BEC
	mov r0, #0
	strb r0, [r4, #8]
	b _02243C7A
_02243C1C:
	ldr r0, _02243C84 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x20
	tst r0, r1
	bne _02243C7A
	mov r0, #0x10
	tst r0, r1
	bne _02243C7A
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_022459A0
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_02243C4C:
	ldr r0, _02243C84 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x20
	tst r0, r1
	bne _02243C7A
	mov r0, #0x10
	tst r0, r1
	bne _02243C7A
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov83_022459A0
	add r0, r4, #0
	bl ov83_02244C58
	mov r0, #2
	strb r0, [r4, #8]
_02243C7A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02243C80: .word 0x000005DC
_02243C84: .word gSystem
	thumb_func_end ov83_022433F8

	thumb_func_start ov83_02243C88
ov83_02243C88: ; 0x02243C88
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #5
	bhi _02243D74
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02243C9E: ; jump table
	.short _02243CAA - _02243C9E - 2 ; case 0
	.short _02243CCE - _02243C9E - 2 ; case 1
	.short _02243CF4 - _02243C9E - 2 ; case 2
	.short _02243D16 - _02243C9E - 2 ; case 3
	.short _02243D34 - _02243C9E - 2 ; case 4
	.short _02243D46 - _02243C9E - 2 ; case 5
_02243CAA:
	ldrb r2, [r4, #0xf]
	mov r1, #0xf8
	bic r2, r1
	mov r1, #8
	orr r1, r2
	strb r1, [r4, #0xf]
	ldrb r2, [r4, #0xd]
	mov r1, #0x15
	bl ov83_022450A8
	cmp r0, #1
	bne _02243D74
	mov r0, #0
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243CCE:
	ldrb r1, [r4, #0x11]
	cmp r1, #0xff
	beq _02243D74
	mov r1, #0
	strb r1, [r4, #0x17]
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #0x11]
	cmp r2, #5
	bne _02243CE8
	mov r2, #5
	bl ov83_02245ACC
	b _02243CEC
_02243CE8:
	bl ov83_0224563C
_02243CEC:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243CF4:
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x11]
	bl ov83_0224776C
	add r1, r0, #0
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02244E24
	cmp r0, #1
	bne _02243D74
	mov r0, #0x1e
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243D16:
	ldrb r0, [r4, #0x16]
	sub r0, r0, #1
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _02243D74
	bl sub_02037BEC
	mov r0, #0x85
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243D34:
	mov r0, #0x85
	bl sub_02037B38
	cmp r0, #1
	bne _02243D74
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243D46:
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x11]
	bl ov83_0224776C
	add r1, r0, #0
	ldrb r2, [r4, #0x13]
	add r0, r4, #0
	bl ov83_02244F60
	cmp r0, #1
	bne _02243D74
	bl sub_02037BEC
	mov r0, #0x6b
	bl sub_020379A0
	mov r0, #0xff
	strb r0, [r4, #0x11]
	ldr r0, _02243D78 ; =0x000005B6
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_02243D74:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02243D78: .word 0x000005B6
	thumb_func_end ov83_02243C88

	thumb_func_start ov83_02243D7C
ov83_02243D7C: ; 0x02243D7C
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02243D90
	cmp r1, #1
	beq _02243DA8
	cmp r1, #2
	beq _02243DCA
	b _02243DE4
_02243D90:
	mov r1, #0x17
	mov r2, #0
	bl ov83_022450A8
	cmp r0, #1
	bne _02243DE4
	mov r0, #0x1e
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243DE4
_02243DA8:
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _02243DB2
	sub r0, r0, #1
	strb r0, [r4, #0x16]
_02243DB2:
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _02243DE4
	bl sub_02037BEC
	mov r0, #0x86
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243DE4
_02243DCA:
	mov r0, #0x86
	bl sub_02037B38
	cmp r0, #1
	bne _02243DE4
	bl sub_02037BEC
	add r4, #0xc0
	add r0, r4, #0
	bl ov83_02245094
	mov r0, #1
	pop {r4, pc}
_02243DE4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov83_02243D7C

	thumb_func_start ov83_02243DE8
ov83_02243DE8: ; 0x02243DE8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _02243DFA
	cmp r0, #1
	beq _02243E1A
	b _02243E28
_02243DFA:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02243E28
_02243E1A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02243E28
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02243E28:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02243DE8

	thumb_func_start ov83_02243E30
ov83_02243E30: ; 0x02243E30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _02243F80 ; =0x00000604
	str r0, [sp]
	add r0, r0, r1
	bl ov83_02247858
	ldr r1, _02243F84 ; =0x000005F4
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_02247CC4
	mov r1, #0x5f
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl ov83_02247A18
	ldr r1, _02243F88 ; =0x00000508
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_0224753C
	ldr r1, _02243F8C ; =0x0000050C
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_0224753C
	mov r1, #0x15
	ldr r0, [sp]
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	bl ov83_0224753C
	ldr r1, _02243F90 ; =0x00000544
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_0224753C
	mov r0, #0
	mov r6, #0x52
	ldr r7, [sp]
	str r0, [sp, #4]
	lsl r6, r6, #4
_02243E88:
	mov r4, #0
	add r5, r7, #0
_02243E8C:
	ldr r0, [r5, r6]
	bl ov83_0224753C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02243E8C
	ldr r0, [sp, #4]
	add r7, #8
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #4
	blt _02243E88
	ldr r0, [sp]
	mov r1, #1
	ldrb r0, [r0, #9]
	bl ov80_02237B58
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _02243EDC
	mov r7, #0x51
	ldr r4, [sp]
	lsl r7, r7, #4
_02243EBE:
	ldr r0, _02243F94 ; =0x000004F4
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _02243F98 ; =0x000004E4
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, [r4, r7]
	bl ov83_0224753C
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r6
	blt _02243EBE
_02243EDC:
	bl sub_0203A914
	mov r1, #0x2b
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r1, #0x2b
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r1, #0x2b
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl sub_02003104
	mov r1, #0x2b
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #4
	str r2, [r0, r1]
	add r1, #0x18
	add r0, r0, r1
	bl ov83_022471FC
	ldr r0, [sp]
	ldr r0, [r0, #0x20]
	bl DestroyMsgData
	ldr r0, [sp]
	ldr r0, [r0, #0x24]
	bl ScrStrBufs_delete
	ldr r0, [sp]
	ldr r0, [r0, #0x28]
	bl String_dtor
	ldr r0, [sp]
	ldr r0, [r0, #0x2c]
	bl String_dtor
	mov r1, #0xad
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl MessagePrinter_delete
	mov r0, #4
	bl FontID_Release
	ldr r4, [sp]
	mov r5, #0
_02243F50:
	ldr r0, [r4, #0x30]
	bl String_dtor
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _02243F50
	ldr r0, [sp]
	mov r1, #1
	add r0, #0x50
	bl ov83_0224791C
	ldr r0, [sp]
	ldr r0, [r0, #0x4c]
	bl ov83_0224442C
	mov r1, #0x56
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl NARC_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243F80: .word 0x00000604
_02243F84: .word 0x000005F4
_02243F88: .word 0x00000508
_02243F8C: .word 0x0000050C
_02243F90: .word 0x00000544
_02243F94: .word 0x000004F4
_02243F98: .word 0x000004E4
	thumb_func_end ov83_02243E30

	thumb_func_start ov83_02243F9C
ov83_02243F9C: ; 0x02243F9C
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
	ldr r0, _02243FCC ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02243FD0 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_02243FCC: .word 0xFFFFE0FF
_02243FD0: .word 0x04001000
	thumb_func_end ov83_02243F9C

	thumb_func_start ov83_02243FD4
ov83_02243FD4: ; 0x02243FD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	mov r0, #0xb7
	mov r1, #0x6b
	bl NARC_ctor
	mov r1, #0x56
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov83_02244394
	add r0, r5, #0
	bl ov83_02244408
	mov r0, #4
	mov r1, #0x6b
	bl FontID_Alloc
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x21
	mov r3, #0x6b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x20]
	mov r0, #0x6b
	bl ScrStrBufs_new
	str r0, [r5, #0x24]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x6b
	bl String_ctor
	str r0, [r5, #0x28]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x6b
	bl String_ctor
	str r0, [r5, #0x2c]
	mov r6, #0
	add r4, r5, #0
	mov r7, #0x20
_02244030:
	add r0, r7, #0
	mov r1, #0x6b
	bl String_ctor
	str r0, [r4, #0x30]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	blt _02244030
	mov r1, #7
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x6b
	bl LoadFontPal0
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x6b
	bl LoadFontPal1
	mov r0, #1
	mov r1, #2
	mov r2, #0
	mov r3, #0x6b
	bl MessagePrinter_new
	mov r1, #0xad
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, r5, #0
	ldr r0, [r5, #0x4c]
	add r1, #0x50
	mov r2, #1
	bl ov83_022478D4
	add r0, sp, #0x28
	add r1, sp, #0x2c
	add r3, sp, #0x28
	str r0, [sp]
	add r0, r5, #0
	add r1, #2
	add r2, sp, #0x2c
	add r3, #2
	bl ov83_02244DF4
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _0224409E
	mov r0, #0x3c
	mov r7, #0x40
	str r0, [sp, #0x1c]
	b _022440A4
_0224409E:
	mov r0, #0x1c
	mov r7, #0x20
	str r0, [sp, #0x1c]
_022440A4:
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B58
	mov r6, #0
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _022441AC
	add r4, r5, #0
_022440B6:
	mov r0, #7
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	mov r1, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x3e
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov83_02247454
	ldr r1, _02244370 ; =0x000004F4
	str r0, [r4, r1]
	mov r1, #0
	mov r0, #0xf
	str r0, [sp]
	lsl r0, r7, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x4e
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov83_02247454
	mov r1, #0x51
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #1
	str r0, [sp]
	lsl r0, r7, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x3a
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #0xb2
	lsl r0, r0, #2
	add r1, r6, #0
	add r0, r5, r0
	add r1, #0xa
	mov r2, #0xa
	mov r3, #5
	bl ov83_02247454
	ldr r1, _02244374 ; =0x000004E4
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x78
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _02244374 ; =0x000004E4
	ldr r0, [r4, r0]
	bl ov83_022475EC
	ldr r0, _02244378 ; =0x0000054C
	ldr r0, [r5, r0]
	ldrb r0, [r0, r6]
	cmp r0, #0
	ldr r0, _02244370 ; =0x000004F4
	bne _0224417C
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov83_0224755C
	ldr r0, _02244374 ; =0x000004E4
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov83_0224755C
	mov r0, #0x51
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov83_0224755C
	b _0224419A
_0224417C:
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov83_0224755C
	ldr r0, _02244374 ; =0x000004E4
	mov r1, #1
	ldr r0, [r4, r0]
	bl ov83_0224755C
	mov r0, #0x51
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov83_0224755C
_0224419A:
	ldr r0, [sp, #0x1c]
	add r6, r6, #1
	add r0, #0x40
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r4, r4, #4
	add r7, #0x40
	cmp r6, r0
	blt _022440B6
_022441AC:
	add r0, r5, #0
	add r1, sp, #0x34
	add r2, sp, #0x30
	mov r3, #0
	bl ov83_02244DA0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x34]
	mov r1, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r2, r1, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r5, r0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0224437C ; =0x00000508
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	ldr r1, [sp, #0x34]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #4]
	ldr r1, [sp, #0x30]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #8]
	mov r1, #0
	str r0, [sp, #0xc]
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _02244380 ; =0x0000050C
	str r0, [r5, r1]
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02244226
	ldr r0, _02244380 ; =0x0000050C
	mov r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
_02244226:
	mov r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x20]
	str r5, [sp, #0x24]
_0224422E:
	mov r7, #0
	ldr r4, [sp, #0x24]
	add r6, r7, #0
_02244234:
	add r0, r5, #0
	add r1, sp, #0x34
	add r2, sp, #0x30
	bl ov83_02245CE8
	mov r0, #0xc
	str r0, [sp]
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x20]
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [sp, #0x30]
	add r2, r1, #0
	add r0, r0, r6
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r5, r0
	add r3, r1, #0
	bl ov83_02247454
	mov r1, #0x52
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov83_0224755C
	add r7, r7, #1
	add r6, #0xc
	add r4, r4, #4
	cmp r7, #2
	blt _02244234
	ldr r0, [sp, #0x20]
	add r0, #0x40
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	add r0, #8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _0224422E
	add r0, r5, #0
	bl ov83_02245C80
	mov r1, #0
	mov r0, #0xb
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xb2
	lsl r0, r0, #2
	str r1, [sp, #0xc]
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	mov r1, #0x15
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0
	bl ov83_0224755C
	add r0, r5, #0
	bl ov83_02245D48
	add r0, r5, #0
	bl ov83_02245F24
	add r0, r5, #0
	mov r1, #1
	bl ov83_02246114
	mov r1, #0
	str r1, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r0, #0x28
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0xb2
	str r1, [sp, #0x10]
	mov r1, #2
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov83_022474C4
	ldr r1, _02244384 ; =0x00000544
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov83_02246988
	ldrb r2, [r5, #0x14]
	add r0, r5, #0
	mov r1, #1
	bl ov83_02247A7C
	mov r1, #0x5f
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r1, #0xb2
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, #0x18
	ldr r1, [r5, r1]
	bl ov83_02247CB8
	ldr r1, _02244388 ; =0x000005F4
	str r0, [r5, r1]
	add r1, #0x10
	add r0, r5, r1
	bl ov83_02247844
	bl sub_02037474
	cmp r0, #0
	beq _02244354
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	bl sub_0203A880
_02244354:
	mov r0, #0xa
	str r0, [sp]
	ldr r0, _0224438C ; =0x04000050
	mov r1, #0
	mov r2, #0xe
	mov r3, #6
	bl G2x_SetBlendAlpha_
	ldr r0, _02244390 ; =ov83_02244488
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02244370: .word 0x000004F4
_02244374: .word 0x000004E4
_02244378: .word 0x0000054C
_0224437C: .word 0x00000508
_02244380: .word 0x0000050C
_02244384: .word 0x00000544
_02244388: .word 0x000005F4
_0224438C: .word 0x04000050
_02244390: .word ov83_02244488
	thumb_func_end ov83_02243FD4

	thumb_func_start ov83_02244394
ov83_02244394: ; 0x02244394
	push {r4, lr}
	ldr r2, _02244400 ; =0x04000304
	add r4, r0, #0
	ldrh r1, [r2]
	ldr r0, _02244404 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2]
	bl ov83_022444C0
	ldr r0, [r4, #0x4c]
	bl ov83_022444E0
	mov r0, #0x6b
	bl sub_020030E8
	mov r1, #0x2b
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	lsl r2, r1, #8
	mov r3, #0x6b
	bl PaletteData_AllocBuffers
	mov r2, #0x2b
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	mov r1, #0
	sub r2, #0xb0
	mov r3, #0x6b
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	mov r1, #3
	bl ov83_0224465C
	bl ov83_022446D0
	add r0, r4, #0
	mov r1, #2
	bl ov83_02244704
	bl ov83_0224474C
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #4
	bl ov83_02244780
	pop {r4, pc}
	nop
_02244400: .word 0x04000304
_02244404: .word 0xFFFF7FFF
	thumb_func_end ov83_02244394

	thumb_func_start ov83_02244408
ov83_02244408: ; 0x02244408
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	add r2, r0, #0
	ldr r1, _02244428 ; =0x0000055C
	mov r0, #0xb2
	lsl r0, r0, #2
	lsl r2, r2, #0x18
	ldr r1, [r4, r1]
	add r0, r4, r0
	lsr r2, r2, #0x18
	bl ov83_02246E08
	pop {r4, pc}
	.balign 4, 0
_02244428: .word 0x0000055C
	thumb_func_end ov83_02244408

	thumb_func_start ov83_0224442C
ov83_0224442C: ; 0x0224442C
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
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	ldr r2, _02244484 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_02244484: .word 0x04000304
	thumb_func_end ov83_0224442C

	thumb_func_start ov83_02244488
ov83_02244488: ; 0x02244488
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x2b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224449A
	bl sub_0200398C
_0224449A:
	ldr r0, [r4, #0x4c]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _022444B8 ; =0x027E0000
	ldr r1, _022444BC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_022444B8: .word 0x027E0000
_022444BC: .word 0x00003FF8
	thumb_func_end ov83_02244488

	thumb_func_start ov83_022444C0
ov83_022444C0: ; 0x022444C0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _022444DC ; =ov83_02248150
	add r3, sp, #0
	mov r2, #5
_022444CA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022444CA
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_022444DC: .word ov83_02248150
	thumb_func_end ov83_022444C0

	thumb_func_start ov83_022444E0
ov83_022444E0: ; 0x022444E0
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	ldr r5, _0224463C ; =ov83_02248044
	add r3, sp, #0xa8
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _02244640 ; =ov83_02248068
	add r3, sp, #0x8c
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
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02244644 ; =ov83_02248084
	add r3, sp, #0x70
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
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02244648 ; =ov83_022480A0
	add r3, sp, #0x54
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0224464C ; =ov83_022480BC
	add r3, sp, #0x38
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
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02244650 ; =ov83_022480D8
	add r3, sp, #0x1c
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
	ldr r5, _02244654 ; =ov83_022480F4
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x6b
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r1, _02244658 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224463C: .word ov83_02248044
_02244640: .word ov83_02248068
_02244644: .word ov83_02248084
_02244648: .word ov83_022480A0
_0224464C: .word ov83_022480BC
_02244650: .word ov83_022480D8
_02244654: .word ov83_022480F4
_02244658: .word 0x04000008
	thumb_func_end ov83_022444E0

	thumb_func_start ov83_0224465C
ov83_0224465C: ; 0x0224465C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6b
	str r0, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x30
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022446AE
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x2c
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
_022446AE:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x2d
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_0224465C

	thumb_func_start ov83_022446D0
ov83_022446D0: ; 0x022446D0
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xb7
	mov r1, #0x9d
	add r2, sp, #0
	mov r3, #0x6b
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0x80
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl GX_LoadBGPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov83_022446D0

	thumb_func_start ov83_02244704
ov83_02244704: ; 0x02244704
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6b
	str r0, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x30
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x2e
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02244704

	thumb_func_start ov83_0224474C
ov83_0224474C: ; 0x0224474C
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xb7
	mov r1, #0x9d
	add r2, sp, #0
	mov r3, #0x6b
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0x80
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl GX_LoadBGPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov83_0224474C

	thumb_func_start ov83_02244780
ov83_02244780: ; 0x02244780
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x6b
	str r0, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x28
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x93
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x6b
	str r0, [sp, #4]
	mov r0, #0x56
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0xbe
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_02244780

	thumb_func_start ov83_022447E0
ov83_022447E0: ; 0x022447E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	add r7, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r3, r7, #0
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x28]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add r5, r0, #0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_022447E0

	thumb_func_start ov83_0224484C
ov83_0224484C: ; 0x0224484C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	add r6, r3, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x20]
	add r2, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r3, r6, #0
	str r0, [sp, #4]
	add r0, sp, #0x30
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x34
	ldrb r1, [r1]
	ldr r2, [r5, #0x28]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add r5, r0, #0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov83_0224484C

	thumb_func_start ov83_022448AC
ov83_022448AC: ; 0x022448AC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r3, #1
	add r4, r1, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	mov r1, #0xf
	str r1, [sp, #0x10]
	add r5, r0, #0
	add r1, r5, #0
	str r2, [sp, #0x14]
	add r1, #0xc0
	add r2, r4, #0
	bl ov83_022447E0
	add r5, #0xc0
	add r4, r0, #0
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_022448AC

	thumb_func_start ov83_022448E4
ov83_022448E4: ; 0x022448E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02244902
	mov r6, #0x24
	b _02244904
_02244902:
	mov r6, #4
_02244904:
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B58
	mov r7, #0
	str r0, [sp, #0xc]
	cmp r0, #0
	ble _022449C0
	add r0, r6, #0
	str r0, [sp, #0x14]
	add r0, #0x18
	str r0, [sp, #0x14]
	add r0, r6, #0
	str r0, [sp, #0x10]
	add r0, #0x20
	str r0, [sp, #0x10]
_02244924:
	ldr r0, _022449CC ; =0x0000054C
	ldr r0, [r5, r0]
	ldrb r0, [r0, r7]
	cmp r0, #0
	bne _02244946
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0x10
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	lsr r2, r2, #0x10
	mov r3, #1
	bl FillWindowPixelRect
	b _022449AA
_02244946:
	ldr r0, _022449D0 ; =0x0000055C
	add r1, r7, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	str r0, [sp, #0x18]
	bl GetMonData
	str r4, [sp]
	add r1, r0, #0
	str r6, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #3
	mov r3, #1
	bl sub_0200CDF0
	mov r0, #1
	str r0, [sp]
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x14]
	mov r1, #0
	add r2, r4, #0
	bl sub_0200CDAC
	ldr r0, [sp, #0x18]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldr r0, [sp, #0x10]
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #3
	mov r3, #0
	bl sub_0200CDF0
_022449AA:
	ldr r0, [sp, #0x14]
	add r7, r7, #1
	add r0, #0x40
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r6, #0x40
	add r0, #0x40
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _02244924
_022449C0:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022449CC: .word 0x0000054C
_022449D0: .word 0x0000055C
	thumb_func_end ov83_022448E4

	thumb_func_start ov83_022449D4
ov83_022449D4: ; 0x022449D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x10]
	add r0, r1, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022449F4
	mov r4, #0x28
	mov r6, #0x50
	b _022449F8
_022449F4:
	mov r4, #8
	mov r6, #0x30
_022449F8:
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B58
	mov r7, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _02244A66
_02244A08:
	ldr r0, _02244A70 ; =0x0000055C
	add r1, r7, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	mov r1, #0xa1
	mov r2, #0
	str r0, [sp, #0x18]
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r1, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #3
	bl sub_0200CE7C
	ldr r0, [sp, #0x18]
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	mov r1, #0
	lsl r0, r0, #0x18
	str r1, [sp]
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl ov83_02244BA8
	ldr r0, [sp, #0x14]
	add r7, r7, #1
	add r4, #0x40
	add r6, #0x40
	cmp r7, r0
	blt _02244A08
_02244A66:
	ldr r0, [sp, #0x10]
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02244A70: .word 0x0000055C
	thumb_func_end ov83_022449D4

	thumb_func_start ov83_02244A74
ov83_02244A74: ; 0x02244A74
	add r1, r0, #0
	ldr r0, _02244A80 ; =0x00000604
	ldr r3, _02244A84 ; =ov83_02247864
	add r0, r1, r0
	ldr r1, [r1, #0x4c]
	bx r3
	.balign 4, 0
_02244A80: .word 0x00000604
_02244A84: .word ov83_02247864
	thumb_func_end ov83_02244A74

	thumb_func_start ov83_02244A88
ov83_02244A88: ; 0x02244A88
	ldr r3, _02244A8C ; =ov83_02246C2C
	bx r3
	.balign 4, 0
_02244A8C: .word ov83_02246C2C
	thumb_func_end ov83_02244A88

	thumb_func_start ov83_02244A90
ov83_02244A90: ; 0x02244A90
	ldr r3, _02244A94 ; =ov83_02246C70
	bx r3
	.balign 4, 0
_02244A94: .word ov83_02246C70
	thumb_func_end ov83_02244A90

	thumb_func_start ov83_02244A98
ov83_02244A98: ; 0x02244A98
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	mov r4, #1
	str r4, [sp, #4]
	ldr r0, [r0, #0x24]
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02244A98

	thumb_func_start ov83_02244AB0
ov83_02244AB0: ; 0x02244AB0
	ldr r3, _02244AB8 ; =BufferBoxMonSpeciesName
	ldr r0, [r0, #0x24]
	bx r3
	nop
_02244AB8: .word BufferBoxMonSpeciesName
	thumb_func_end ov83_02244AB0

	thumb_func_start ov83_02244ABC
ov83_02244ABC: ; 0x02244ABC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	bl BufferPlayersName
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02244ABC

	thumb_func_start ov83_02244AD8
ov83_02244AD8: ; 0x02244AD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	mov r1, #0xaf
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	str r2, [sp, #0x10]
	add r5, r3, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	mov r0, #8
	mov r1, #0x6b
	bl String_ctor
	add r4, r0, #0
	add r0, r6, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16ArrayToString
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _02244B14
	ldr r1, _02244B3C ; =0x00070800
	b _02244B18
_02244B14:
	mov r1, #0xc1
	lsl r1, r1, #0xa
_02244B18:
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x18
	ldrb r1, [r1, #0x10]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02244B3C: .word 0x00070800
	thumb_func_end ov83_02244AD8

	thumb_func_start ov83_02244B40
ov83_02244B40: ; 0x02244B40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp, #0x18]
	add r6, r3, #0
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	str r0, [sp, #0x1c]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _02244B66
	ldr r4, _02244BA4 ; =0x00070800
	b _02244B6A
_02244B66:
	mov r4, #0xc1
	lsl r4, r4, #0xa
_02244B6A:
	ldr r0, [r5, #0x24]
	ldr r2, [sp, #0x1c]
	mov r1, #0
	bl BufferPlayersName
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	lsr r0, r4, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsr r0, r4, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #1
	bl ov83_0224484C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02244BA4: .word 0x00070800
	thumb_func_end ov83_02244B40

	thumb_func_start ov83_02244BA8
ov83_02244BA8: ; 0x02244BA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r2, #0
	add r2, r3, #0
	add r3, sp, #0x20
	ldrb r3, [r3, #0x14]
	cmp r3, #0
	bne _02244BC2
	mov r3, #0x40
	mov r4, #7
	mov r5, #8
	mov r6, #0
	b _02244BCE
_02244BC2:
	cmp r3, #1
	bne _02244BE8
	mov r3, #0x41
	mov r4, #3
	mov r5, #4
	mov r6, #0
_02244BCE:
	str r2, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	add r2, sp, #0x20
	ldrb r2, [r2, #0x10]
	str r2, [sp, #0x14]
	add r2, r3, #0
	add r3, r7, #0
	bl ov83_0224484C
_02244BE8:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02244BA8

	thumb_func_start ov83_02244BEC
ov83_02244BEC: ; 0x02244BEC
	push {r4, lr}
	sub sp, #0x18
	mov r2, #5
	str r2, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #2
	add r4, r0, #0
	str r1, [sp, #0xc]
	mov r3, #0
	str r3, [sp, #0x10]
	add r1, r4, #0
	str r3, [sp, #0x14]
	add r1, #0x60
	bl ov83_022447E0
	strb r0, [r4, #0xa]
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xd0
	bl ov83_02247944
	mov r3, #1
	add r1, r4, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, #0xd0
	mov r2, #4
	str r3, [sp, #0x14]
	bl ov83_022447E0
	strb r0, [r4, #0xa]
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov83_02244BEC

	thumb_func_start ov83_02244C4C
ov83_02244C4C: ; 0x02244C4C
	ldr r3, _02244C54 ; =ov83_02245094
	add r0, #0xd0
	bx r3
	nop
_02244C54: .word ov83_02245094
	thumb_func_end ov83_02244C4C

	thumb_func_start ov83_02244C58
ov83_02244C58: ; 0x02244C58
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02247944
	mov r1, #1
	mov r0, #6
	mvn r1, r1
	lsl r0, r0, #8
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov83_02246AA4
	add r0, r4, #0
	bl ov83_02246CC0
	pop {r4, pc}
	thumb_func_end ov83_02244C58

	thumb_func_start ov83_02244C88
ov83_02244C88: ; 0x02244C88
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc0
	bl ov83_02245094
	add r0, r4, #0
	bl ov83_02246C70
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02244C88

	thumb_func_start ov83_02244C9C
ov83_02244C9C: ; 0x02244C9C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02247944
	mov r1, #1
	mov r0, #6
	mvn r1, r1
	lsl r0, r0, #8
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov83_02246B6C
	add r0, r4, #0
	bl ov83_02246D40
	pop {r4, pc}
	thumb_func_end ov83_02244C9C

	thumb_func_start ov83_02244CCC
ov83_02244CCC: ; 0x02244CCC
	ldr r3, _02244CD0 ; =ov83_02246C70
	bx r3
	.balign 4, 0
_02244CD0: .word ov83_02246C70
	thumb_func_end ov83_02244CCC

	thumb_func_start ov83_02244CD4
ov83_02244CD4: ; 0x02244CD4
	mov r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov83_02244CD4

	thumb_func_start ov83_02244CDC
ov83_02244CDC: ; 0x02244CDC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02244D08 ; =0x000005DC
	bl PlaySE
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02244CFA
	ldrb r2, [r4, #0xd]
	add r0, r4, #0
	mov r1, #0x16
	bl ov83_022450A8
_02244CFA:
	ldrb r1, [r4, #0xd]
	add r0, r4, #0
	mov r2, #0
	bl ov83_02244D0C
	pop {r4, pc}
	nop
_02244D08: .word 0x000005DC
	thumb_func_end ov83_02244CDC

	thumb_func_start ov83_02244D0C
ov83_02244D0C: ; 0x02244D0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	bne _02244D22
	ldr r0, _02244D98 ; =0x00000508
	mov r2, #1
	ldr r4, [r5, r0]
	mov r1, #0
	b _02244D2A
_02244D22:
	ldr r0, _02244D9C ; =0x0000050C
	mov r2, #2
	ldr r4, [r5, r0]
	mov r1, #0x11
_02244D2A:
	ldrb r0, [r5, #0x15]
	cmp r7, r0
	blo _02244D50
	add r0, r4, #0
	bl ov83_022475D4
	add r0, r4, #0
	mov r1, #0xe0
	mov r2, #0xa0
	bl ov83_02247568
	cmp r6, #0
	bne _02244D92
	add r0, r5, #0
	mov r1, #0
	bl ov83_02246938
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02244D50:
	add r0, r4, #0
	add r1, r2, #0
	bl ov83_022475D4
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	add r3, r7, #0
	bl ov83_02244DA0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov83_02247568
	cmp r6, #0
	bne _02244D92
	ldrb r1, [r5, #0xc]
	ldrb r0, [r5, #0x15]
	cmp r1, r0
	blo _02244D8A
	add r0, r5, #0
	mov r1, #1
	bl ov83_02246938
_02244D8A:
	add r0, r5, #0
	mov r1, #0
	bl ov83_0224691C
_02244D92:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02244D98: .word 0x00000508
_02244D9C: .word 0x0000050C
	thumb_func_end ov83_02244D0C

	thumb_func_start ov83_02244DA0
ov83_02244DA0: ; 0x02244DA0
	push {r4, r5, r6, lr}
	ldrb r0, [r0, #9]
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl ov80_02237D8C
	cmp r0, #1
	bne _02244DD6
	cmp r4, #0
	bne _02244DBC
	mov r0, #0x28
	str r0, [r5]
	b _02244DEE
_02244DBC:
	cmp r4, #1
	bne _02244DC6
	mov r0, #0x68
	str r0, [r5]
	b _02244DEE
_02244DC6:
	cmp r4, #2
	bne _02244DD0
	mov r0, #0xa8
	str r0, [r5]
	b _02244DEE
_02244DD0:
	mov r0, #0xe8
	str r0, [r5]
	b _02244DEE
_02244DD6:
	cmp r4, #0
	bne _02244DE0
	mov r0, #0x48
	str r0, [r5]
	b _02244DEE
_02244DE0:
	cmp r4, #1
	bne _02244DEA
	mov r0, #0x88
	str r0, [r5]
	b _02244DEE
_02244DEA:
	mov r0, #0xc8
	str r0, [r5]
_02244DEE:
	mov r0, #0x58
	str r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02244DA0

	thumb_func_start ov83_02244DF4
ov83_02244DF4: ; 0x02244DF4
	push {r3, r4, r5, r6, r7, lr}
	ldrb r0, [r0, #9]
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	ldr r4, [sp, #0x18]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02244E16
	mov r0, #0x28
	strh r0, [r5]
	mov r0, #0
	strh r0, [r6]
	strh r0, [r7]
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02244E16:
	mov r1, #0
	strh r1, [r5]
	strh r1, [r6]
	mov r0, #0x80
	strh r0, [r7]
	strh r1, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02244DF4

	thumb_func_start ov83_02244E24
ov83_02244E24: ; 0x02244E24
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	add r5, r2, #0
	bl ov83_02247768
	add r6, r0, #0
	ldr r0, _02244F58 ; =0x0000055C
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	cmp r5, #5
	bls _02244E44
	b _02244F52
_02244E44:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02244E50: ; jump table
	.short _02244E5C - _02244E50 - 2 ; case 0
	.short _02244E6A - _02244E50 - 2 ; case 1
	.short _02244F52 - _02244E50 - 2 ; case 2
	.short _02244EE8 - _02244E50 - 2 ; case 3
	.short _02244F16 - _02244E50 - 2 ; case 4
	.short _02244F44 - _02244E50 - 2 ; case 5
_02244E5C:
	ldrb r1, [r4, #0xf]
	mov r0, #1
	add sp, #0x14
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02244E6A:
	ldrb r1, [r4, #0xf]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _02244EC0
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #0xf]
	ldrb r0, [r4, #0x12]
	cmp r0, #1
	bne _02244E86
	mov r5, #9
	b _02244E88
_02244E86:
	mov r5, #0xa
_02244E88:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02244E96
	mov r1, #0x50
	b _02244E98
_02244E96:
	mov r1, #0x30
_02244E98:
	lsl r0, r6, #6
	add r0, r1, r0
	lsl r0, r0, #0x10
	str r5, [sp]
	asr r0, r0, #0x10
	str r0, [sp, #4]
	mov r1, #0
	mov r0, #0x32
	str r0, [sp, #8]
	mov r0, #0xb2
	lsl r0, r0, #2
	str r1, [sp, #0xc]
	add r0, r4, r0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _02244F5C ; =0x00000504
	str r0, [r4, r1]
_02244EC0:
	ldr r0, _02244F5C ; =0x00000504
	ldr r0, [r4, r0]
	bl ov83_02247624
	cmp r0, #0
	bne _02244F52
	ldr r0, _02244F5C ; =0x00000504
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _02244F5C ; =0x00000504
	mov r1, #0
	str r1, [r4, r0]
	ldrb r1, [r4, #0xf]
	mov r0, #1
	add sp, #0x14
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02244EE8:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02244F08
	add r0, r4, #0
	mov r1, #0
	bl ov83_02246114
	ldrb r1, [r4, #0xf]
	mov r0, #1
	add sp, #0x14
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F08:
	ldrb r1, [r4, #0xf]
	mov r0, #1
	add sp, #0x14
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F16:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02244F36
	add r0, r4, #0
	mov r1, #0
	bl ov83_02246114
	ldrb r1, [r4, #0xf]
	mov r0, #1
	add sp, #0x14
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F36:
	ldrb r1, [r4, #0xf]
	mov r0, #1
	add sp, #0x14
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F44:
	ldrb r1, [r4, #0xf]
	mov r0, #1
	add sp, #0x14
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F52:
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02244F58: .word 0x0000055C
_02244F5C: .word 0x00000504
	thumb_func_end ov83_02244E24

	thumb_func_start ov83_02244F60
ov83_02244F60: ; 0x02244F60
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	add r6, r2, #0
	ldrb r5, [r4, #0x15]
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02245064 ; =0x0000055C
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	cmp r6, #5
	bhi _02245060
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02244F88: ; jump table
	.short _02244F94 - _02244F88 - 2 ; case 0
	.short _02244F94 - _02244F88 - 2 ; case 1
	.short _02245060 - _02244F88 - 2 ; case 2
	.short _02244FBC - _02244F88 - 2 ; case 3
	.short _0224500E - _02244F88 - 2 ; case 4
	.short _02244FA0 - _02244F88 - 2 ; case 5
_02244F94:
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02244FA0:
	ldrb r0, [r4, #0xf]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02244FB0
	add r0, r4, #0
	mov r1, #0
	bl ov83_02246114
_02244FB0:
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02244FBC:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02244FF0
	bl sub_0203769C
	cmp r0, #0
	ldrb r0, [r4, #0x11]
	bne _02244FE0
	cmp r0, r5
	blo _02244FF0
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02244FE0:
	cmp r0, r5
	bhs _02244FF0
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02244FF0:
	ldrb r1, [r4, #0xf]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _02245060
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x18
	orr r0, r1
	strb r0, [r4, #0xf]
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0224500E:
	ldrb r0, [r4, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02245042
	bl sub_0203769C
	cmp r0, #0
	ldrb r0, [r4, #0x11]
	bne _02245032
	cmp r0, r5
	blo _02245042
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02245032:
	cmp r0, r5
	bhs _02245042
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02245042:
	ldrb r1, [r4, #0xf]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _02245060
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x18
	orr r0, r1
	strb r0, [r4, #0xf]
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02245060:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02245064: .word 0x0000055C
	thumb_func_end ov83_02244F60

	thumb_func_start ov83_02245068
ov83_02245068: ; 0x02245068
	cmp r0, #1
	bne _02245070
	mov r0, #1
	bx lr
_02245070:
	mov r0, #0xf
	bx lr
	thumb_func_end ov83_02245068

	thumb_func_start ov83_02245074
ov83_02245074: ; 0x02245074
	push {r4, lr}
	add r4, r0, #0
	bl ov83_02245390
	add r0, r4, #0
	add r0, #0xc0
	bl ov83_02245094
	mov r0, #0x15
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov83_0224755C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02245074

	thumb_func_start ov83_02245094
ov83_02245094: ; 0x02245094
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02245094

	thumb_func_start ov83_022450A8
ov83_022450A8: ; 0x022450A8
	push {r3, r4, r5, lr}
	add r3, r1, #0
	sub r3, #0x14
	add r5, r0, #0
	cmp r3, #3
	bhi _022450E6
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_022450C0: ; jump table
	.short _022450C8 - _022450C0 - 2 ; case 0
	.short _022450D0 - _022450C0 - 2 ; case 1
	.short _022450D8 - _022450C0 - 2 ; case 2
	.short _022450E0 - _022450C0 - 2 ; case 3
_022450C8:
	mov r4, #0x35
	bl ov83_02245104
	b _022450E6
_022450D0:
	mov r4, #0x36
	bl ov83_0224517C
	b _022450E6
_022450D8:
	mov r4, #0x37
	bl ov83_02245210
	b _022450E6
_022450E0:
	mov r4, #0x38
	bl ov83_02245248
_022450E6:
	ldr r1, _02245100 ; =0x00000564
	add r0, r4, #0
	add r1, r5, r1
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _022450FA
	mov r0, #1
	pop {r3, r4, r5, pc}
_022450FA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02245100: .word 0x00000564
	thumb_func_end ov83_022450A8

	thumb_func_start ov83_02245104
ov83_02245104: ; 0x02245104
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _02245144 ; =0x00000564
	strh r4, [r6, r1]
	bl PlayerProfile_GetTrainerGender
	ldr r1, _02245148 ; =0x00000566
	mov r4, #0
	strh r0, [r6, r1]
	add r5, r6, #4
	sub r7, r1, #2
_02245126:
	mov r0, #0xaf
	lsl r0, r0, #2
	lsl r2, r4, #0x18
	ldrb r1, [r6, #9]
	ldr r0, [r6, r0]
	lsr r2, r2, #0x18
	bl ov83_0224777C
	strh r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #3
	blt _02245126
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245144: .word 0x00000564
_02245148: .word 0x00000566
	thumb_func_end ov83_02245104

	thumb_func_start ov83_0224514C
ov83_0224514C: ; 0x0224514C
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x17]
	add r6, r2, #0
	add r0, r0, #1
	strb r0, [r4, #0x17]
	bl sub_0203769C
	cmp r5, r0
	beq _02245176
	ldr r0, _02245178 ; =0x000005B7
	mov r3, #0
	add r5, r6, #4
_02245168:
	ldrh r2, [r5]
	add r1, r4, r3
	add r3, r3, #1
	add r5, r5, #2
	strb r2, [r1, r0]
	cmp r3, #3
	blt _02245168
_02245176:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02245178: .word 0x000005B7
	thumb_func_end ov83_0224514C

	thumb_func_start ov83_0224517C
ov83_0224517C: ; 0x0224517C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022451B0 ; =0x00000564
	add r4, r2, #0
	strh r1, [r5, r0]
	add r0, r0, #2
	strh r4, [r5, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _0224519A
	ldrb r0, [r5, #0x11]
	cmp r0, #0xff
	bne _0224519A
	strb r4, [r5, #0x11]
_0224519A:
	ldrb r1, [r5, #0x11]
	ldr r0, _022451B4 ; =0x00000568
	strh r1, [r5, r0]
	ldrb r2, [r5, #0x12]
	add r1, r0, #4
	add r0, r0, #6
	strh r2, [r5, r1]
	ldrb r1, [r5, #0x13]
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_022451B0: .word 0x00000564
_022451B4: .word 0x00000568
	thumb_func_end ov83_0224517C

	thumb_func_start ov83_022451B8
ov83_022451B8: ; 0x022451B8
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	ldrb r0, [r4, #0x17]
	add r5, r2, #0
	add r0, r0, #1
	strb r0, [r4, #0x17]
	bl sub_0203769C
	cmp r6, r0
	beq _02245208
	ldrh r1, [r5, #2]
	ldr r0, _0224520C ; =0x000005B5
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _022451FC
	ldrb r0, [r4, #0x11]
	cmp r0, #0xff
	ldr r0, _0224520C ; =0x000005B5
	beq _022451EA
	mov r1, #0
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_022451EA:
	ldrb r1, [r4, r0]
	ldrb r0, [r4, #0x15]
	add r0, r1, r0
	strb r0, [r4, #0x11]
	ldrh r0, [r5, #8]
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
_022451FC:
	ldrh r0, [r5, #4]
	strb r0, [r4, #0x11]
	ldrh r0, [r5, #8]
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
_02245208:
	pop {r4, r5, r6, pc}
	nop
_0224520C: .word 0x000005B5
	thumb_func_end ov83_022451B8

	thumb_func_start ov83_02245210
ov83_02245210: ; 0x02245210
	ldr r2, _0224521C ; =0x00000564
	strh r1, [r0, r2]
	ldrb r3, [r0, #0xd]
	add r1, r2, #2
	strh r3, [r0, r1]
	bx lr
	.balign 4, 0
_0224521C: .word 0x00000564
	thumb_func_end ov83_02245210

	thumb_func_start ov83_02245220
ov83_02245220: ; 0x02245220
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r5, r0
	beq _02245240
	ldrh r0, [r6, #2]
	ldr r1, _02245244 ; =0x000005B4
	mov r2, #1
	strb r0, [r4, r1]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	bl ov83_02244D0C
_02245240:
	pop {r4, r5, r6, pc}
	nop
_02245244: .word 0x000005B4
	thumb_func_end ov83_02245220

	thumb_func_start ov83_02245248
ov83_02245248: ; 0x02245248
	ldr r1, _02245250 ; =0x00000564
	mov r2, #1
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_02245250: .word 0x00000564
	thumb_func_end ov83_02245248

	thumb_func_start ov83_02245254
ov83_02245254: ; 0x02245254
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0203769C
	cmp r5, r0
	beq _0224526A
	ldrh r1, [r4]
	ldr r0, _0224526C ; =0x000005B6
	strb r1, [r6, r0]
_0224526A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224526C: .word 0x000005B6
	thumb_func_end ov83_02245254

	thumb_func_start ov83_02245270
ov83_02245270: ; 0x02245270
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	bl ov83_02247768
	ldr r1, _02245284 ; =0x00000554
	mov r2, #1
	ldr r1, [r4, r1]
	strb r2, [r1, r0]
	pop {r4, pc}
	.balign 4, 0
_02245284: .word 0x00000554
	thumb_func_end ov83_02245270

	thumb_func_start ov83_02245288
ov83_02245288: ; 0x02245288
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	bl ov83_02247944
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _022452F8 ; =0x0000055C
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov83_02244AB0
	add r0, r5, #0
	mov r1, #0x2f
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02245270
	add r0, r5, #0
	bl ov83_02245C80
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _022452F0
	add r0, r5, #0
	bl ov83_02245D48
	add r0, r5, #0
	mov r1, #0
	bl ov83_02246114
_022452F0:
	ldr r0, _022452FC ; =0x00000623
	bl PlaySE
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022452F8: .word 0x0000055C
_022452FC: .word 0x00000623
	thumb_func_end ov83_02245288

	thumb_func_start ov83_02245300
ov83_02245300: ; 0x02245300
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	bl ov83_02247768
	ldr r1, _02245314 ; =0x00000558
	mov r2, #1
	ldr r1, [r4, r1]
	strb r2, [r1, r0]
	pop {r4, pc}
	.balign 4, 0
_02245314: .word 0x00000558
	thumb_func_end ov83_02245300

	thumb_func_start ov83_02245318
ov83_02245318: ; 0x02245318
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	bl ov83_02247944
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02245388 ; =0x0000055C
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov83_02244AB0
	add r0, r5, #0
	mov r1, #0x53
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02245300
	add r0, r5, #0
	bl ov83_02245C80
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _02245380
	add r0, r5, #0
	bl ov83_02245D48
	add r0, r5, #0
	mov r1, #0
	bl ov83_02246114
_02245380:
	ldr r0, _0224538C ; =0x00000623
	bl PlaySE
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02245388: .word 0x0000055C
_0224538C: .word 0x00000623
	thumb_func_end ov83_02245318

	thumb_func_start ov83_02245390
ov83_02245390: ; 0x02245390
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xf]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _022453AC
	ldr r0, _022453B8 ; =0x000005F8
	ldr r0, [r4, r0]
	bl sub_02018694
	add r0, r4, #0
	bl ov83_02246C70
_022453AC:
	ldr r0, _022453BC ; =0x00000604
	add r0, r4, r0
	bl ov83_022478B4
	pop {r4, pc}
	nop
_022453B8: .word 0x000005F8
_022453BC: .word 0x00000604
	thumb_func_end ov83_02245390

	thumb_func_start ov83_022453C0
ov83_022453C0: ; 0x022453C0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r4, #0xc0
	add r1, r0, #0
	add r0, r4, #0
	bl ov83_02247944
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_022453C0

	thumb_func_start ov83_022453DC
ov83_022453DC: ; 0x022453DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r1, sp, #0x1c
	str r1, [sp]
	add r1, sp, #0x20
	add r3, sp, #0x1c
	add r5, r0, #0
	add r1, #2
	add r2, sp, #0x20
	add r3, #2
	bl ov83_02244DF4
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02245472
	add r1, sp, #0x1c
	ldrh r0, [r1, #6]
	add r0, #0x48
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldrh r0, [r1, #4]
	mov r1, #0
	add r2, r7, #0
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, r6, #0
	bl FillWindowPixelRect
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	str r0, [sp, #0x18]
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x18]
	bl sub_020310BC
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	add r0, r5, #0
	mov r3, #4
	bl ov83_02244A98
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r2, #2
	str r2, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r7, #0
	bl ov83_0224484C
	strb r0, [r5, #0xa]
	b _02245540
_02245472:
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x10
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x40
	add r3, r1, #0
	bl FillWindowPixelRect
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x10
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0xc0
	add r3, r1, #0
	bl FillWindowPixelRect
	bl sub_0203769C
	cmp r0, #0
	bne _022454C6
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	add r1, r6, #0
	bl sub_020310BC
	add r6, r0, #0
	ldr r0, _0224554C ; =0x000005BA
	ldrh r7, [r5, r0]
	b _022454E8
_022454C6:
	ldr r0, _0224554C ; =0x000005BA
	ldrh r6, [r5, r0]
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	add r1, r7, #0
	bl sub_020310BC
	add r7, r0, #0
_022454E8:
	mov r1, #0
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #4
	str r1, [sp]
	bl ov83_02244A98
	mov r0, #0x70
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02245550 ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	mov r3, #2
	bl ov83_02245D08
	mov r1, #0
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #4
	str r1, [sp]
	bl ov83_02244A98
	mov r0, #0xf0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02245550 ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02245D08
_02245540:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0224554C: .word 0x000005BA
_02245550: .word 0x00010200
	thumb_func_end ov83_022453DC

	thumb_func_start ov83_02245554
ov83_02245554: ; 0x02245554
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov83_02245068
	add r2, r0, #0
	mov r1, #0
	add r0, r5, #0
	mov r3, #4
	str r1, [sp]
	bl ov83_02244A98
	add r0, r5, #0
	mov r1, #0x19
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	add r0, r5, #0
	bl ov83_02244A74
	strb r4, [r5, #0xe]
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02245554

	thumb_func_start ov83_02245584
ov83_02245584: ; 0x02245584
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #4
	str r1, [sp]
	add r1, sp, #8
	add r3, sp, #4
	add r5, r0, #0
	add r1, #2
	add r2, sp, #8
	add r3, #2
	bl ov83_02244DF4
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022455C8
	mov r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #6]
	ldrh r3, [r3, #4]
	add r0, r5, #0
	add r2, r2, #4
	add r3, r3, #1
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl ov83_02244AD8
	b _02245630
_022455C8:
	bl sub_0203769C
	cmp r0, #0
	add r2, sp, #4
	bne _02245602
	ldrh r0, [r2, #4]
	add r1, r4, #0
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	add r0, r5, #0
	bl ov83_02244AD8
	mov r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r3, #1
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl ov83_02244B40
	b _02245630
_02245602:
	ldrh r0, [r2, #4]
	add r1, r4, #0
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	add r0, r5, #0
	bl ov83_02244B40
	mov r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r3, #1
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl ov83_02244AD8
_02245630:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_02245584

	thumb_func_start ov83_0224563C
ov83_0224563C: ; 0x0224563C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02245740 ; =0x000005E3
	add r7, r1, #0
	add r6, r2, #0
	bl PlaySE
	ldrb r0, [r4, #0x15]
	add r1, r7, #0
	str r0, [sp]
	bl ov83_0224776C
	str r0, [sp, #4]
	cmp r6, #4
	bhi _02245686
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02245668: ; jump table
	.short _02245672 - _02245668 - 2 ; case 0
	.short _02245676 - _02245668 - 2 ; case 1
	.short _02245686 - _02245668 - 2 ; case 2
	.short _02245680 - _02245668 - 2 ; case 3
	.short _02245684 - _02245668 - 2 ; case 4
_02245672:
	mov r5, #1
	b _02245686
_02245676:
	ldrb r0, [r4, #0x12]
	bl ov83_02245068
	add r5, r0, #0
	b _02245686
_02245680:
	mov r5, #2
	b _02245686
_02245684:
	mov r5, #5
_02245686:
	bl sub_0203769C
	cmp r0, #0
	bne _022456BA
	ldr r0, [sp]
	cmp r7, r0
	bhs _022456A8
	add r0, r4, #0
	mov r1, #5
	bl ov83_02244ABC
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	add r2, r5, #0
	bl ov80_02237FA4
	b _022456E4
_022456A8:
	ldr r0, [r4, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r0, _02245744 ; =0x000005BA
	ldrh r1, [r4, r0]
	sub r1, r1, r5
	strh r1, [r4, r0]
	b _022456E4
_022456BA:
	ldr r0, [sp]
	cmp r7, r0
	bhs _022456D2
	ldr r0, [r4, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r0, _02245744 ; =0x000005BA
	ldrh r1, [r4, r0]
	sub r1, r1, r5
	strh r1, [r4, r0]
	b _022456E4
_022456D2:
	add r0, r4, #0
	mov r1, #5
	bl ov83_02244ABC
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	add r2, r5, #0
	bl ov80_02237FA4
_022456E4:
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	bl ov83_022453DC
	add r0, r4, #0
	bl ov83_02245390
	cmp r6, #4
	bhi _0224573C
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02245704: ; jump table
	.short _0224570E - _02245704 - 2 ; case 0
	.short _0224571A - _02245704 - 2 ; case 1
	.short _0224573C - _02245704 - 2 ; case 2
	.short _02245728 - _02245704 - 2 ; case 3
	.short _02245734 - _02245704 - 2 ; case 4
_0224570E:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov83_02245824
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0224571A:
	ldrb r2, [r4, #0x12]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov83_02245838
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02245728:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov83_02245288
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02245734:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov83_02245318
_0224573C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02245740: .word 0x000005E3
_02245744: .word 0x000005BA
	thumb_func_end ov83_0224563C

	thumb_func_start ov83_02245748
ov83_02245748: ; 0x02245748
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x14]
	add r4, r1, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02245810 ; =0x0000055C
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	bl ov83_02247944
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov83_02244AB0
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	ldr r1, _02245814 ; =0x0000054C
	mov r2, #1
	ldr r1, [r5, r1]
	strb r2, [r1, r0]
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02245818 ; =0x000004F4
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov83_0224755C
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0224581C ; =0x000004E4
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov83_0224755C
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x70
	bl ov83_022449D4
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _022457F0
	add r0, r5, #0
	bl ov83_02245D48
	add r0, r5, #0
	mov r1, #0
	bl ov83_02246114
	add r0, r5, #0
	bl ov83_02246988
_022457F0:
	ldrb r0, [r5, #0x14]
	add r1, r4, #0
	bl ov83_02247768
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x51
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov83_0224755C
	ldr r0, _02245820 ; =0x00000623
	bl PlaySE
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02245810: .word 0x0000055C
_02245814: .word 0x0000054C
_02245818: .word 0x000004F4
_0224581C: .word 0x000004E4
_02245820: .word 0x00000623
	thumb_func_end ov83_02245748

	thumb_func_start ov83_02245824
ov83_02245824: ; 0x02245824
	push {r4, lr}
	add r4, r0, #0
	bl ov83_02245748
	add r0, r4, #0
	add r4, #0x80
	add r1, r4, #0
	bl ov83_022448E4
	pop {r4, pc}
	thumb_func_end ov83_02245824

	thumb_func_start ov83_02245838
ov83_02245838: ; 0x02245838
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r1, #0
	add r7, r2, #0
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	bl ov83_02247944
	ldrb r0, [r5, #0x14]
	add r1, r6, #0
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02245994 ; =0x0000055C
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r4, r0, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov83_02244AB0
	cmp r7, #1
	bne _0224588E
	add r0, r5, #0
	mov r1, #0x1f
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	ldr r0, _02245998 ; =0x00000632
	bl PlaySE
	b _022458A0
_0224588E:
	add r0, r5, #0
	mov r1, #0x20
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	ldr r0, _0224599C ; =0x00000633
	bl PlaySE
_022458A0:
	ldrb r0, [r5, #0x14]
	add r1, r6, #0
	bl ov83_02247768
	mov r1, #0x55
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	ldrb r0, [r5, #0x14]
	bne _022458C6
	add r1, r6, #0
	bl ov83_02247768
	mov r1, #0x55
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	strb r7, [r1, r0]
	b _022458D6
_022458C6:
	add r1, r6, #0
	bl ov83_02247768
	mov r1, #0x55
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0
	strb r2, [r1, r0]
_022458D6:
	ldrb r0, [r5, #0x14]
	add r1, r6, #0
	bl ov83_02247768
	mov r1, #0x55
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0224590E
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	b _02245968
_0224590E:
	ldrb r0, [r5, #0x14]
	add r1, r6, #0
	bl ov83_02247768
	mov r1, #0x55
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _02245946
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x37
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	b _02245968
_02245946:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x2d
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_02245968:
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x80
	bl ov83_022448E4
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x70
	bl ov83_022449D4
	ldrb r0, [r5, #0xd]
	cmp r0, r6
	bne _02245990
	add r0, r5, #0
	bl ov83_02245D48
	add r0, r5, #0
	mov r1, #0
	bl ov83_02246114
_02245990:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245994: .word 0x0000055C
_02245998: .word 0x00000632
_0224599C: .word 0x00000633
	thumb_func_end ov83_02245838

	thumb_func_start ov83_022459A0
ov83_022459A0: ; 0x022459A0
	ldr r3, _022459A8 ; =GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bx r3
	.balign 4, 0
_022459A8: .word GX_EngineAToggleLayers
	thumb_func_end ov83_022459A0

	thumb_func_start ov83_022459AC
ov83_022459AC: ; 0x022459AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldrb r0, [r6, #9]
	mov r1, #1
	bl ov80_02237B24
	mov r4, #0
	str r0, [sp]
	cmp r0, #0
	ble _02245A34
	add r5, r6, #0
_022459C4:
	ldr r0, _02245A38 ; =0x0000055C
	add r1, r4, #0
	ldr r0, [r6, r0]
	bl GetPartyMonByIndex
	str r0, [sp, #4]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r7, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bl ov80_0222A43C
	add r1, r0, #0
	ldr r0, _02245A3C ; =0x000004E4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02245A2A
	bl ov83_02247600
	ldrb r0, [r6, #0x14]
	ldrb r1, [r6, #0xd]
	bl ov83_02247768
	cmp r4, r0
	bne _02245A14
	ldrb r1, [r6, #0xd]
	ldrb r0, [r6, #0x15]
	cmp r1, r0
	blo _02245A20
_02245A14:
	ldr r0, _02245A3C ; =0x000004E4
	mov r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224760C
	b _02245A2A
_02245A20:
	ldr r0, _02245A3C ; =0x000004E4
	mov r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224760C
_02245A2A:
	ldr r0, [sp]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _022459C4
_02245A34:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02245A38: .word 0x0000055C
_02245A3C: .word 0x000004E4
	thumb_func_end ov83_022459AC

	thumb_func_start ov83_02245A40
ov83_02245A40: ; 0x02245A40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #9]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [r5, #4]
	add r1, r7, #0
	bl sub_020310BC
	cmp r0, r4
	bhs _02245A82
	add r0, r5, #0
	bl ov83_022453C0
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	mov r0, #0x10
	strb r0, [r5, #8]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02245A82:
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02245AC6
	add r0, r5, #0
	add r0, #0xc0
	bl ov83_02245094
	ldrb r1, [r5, #9]
	ldr r0, [r5, #4]
	add r2, r4, #0
	bl ov80_02237FA4
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x50
	bl ov83_022453DC
	cmp r4, #2
	bne _02245AB6
	ldrb r1, [r5, #0xd]
	add r0, r5, #0
	bl ov83_02245288
	b _02245ABE
_02245AB6:
	ldrb r1, [r5, #0xd]
	add r0, r5, #0
	bl ov83_02245318
_02245ABE:
	mov r0, #0xd
	strb r0, [r5, #8]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02245AC6:
	mov r0, #1
	strb r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02245A40

	thumb_func_start ov83_02245ACC
ov83_02245ACC: ; 0x02245ACC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #9]
	add r4, r1, #0
	mov r1, #0
	add r7, r2, #0
	bl ov80_02237B24
	cmp r7, #5
	bne _02245AE6
	mov r6, #2
	b _02245AEA
_02245AE6:
	bl GF_AssertFail
_02245AEA:
	ldrb r7, [r5, #0x15]
	add r1, r4, #0
	add r0, r7, #0
	bl ov83_0224776C
	bl sub_0203769C
	cmp r0, #0
	bne _02245B9A
	cmp r4, r7
	bhs _02245B7A
	add r0, r5, #0
	mov r1, #5
	bl ov83_02244ABC
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl ov83_0224777C
	ldrb r1, [r5, #9]
	ldr r0, [r5, #4]
	mov r2, #0x32
	bl ov80_02237FA4
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl ov83_0224777C
	add r4, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r7, r0, #0
	ldrb r0, [r5, #9]
	add r1, r6, #0
	bl sub_0205C174
	str r0, [sp]
	ldrb r0, [r5, #9]
	add r1, r6, #0
	bl sub_0205C174
	bl sub_0205C268
	add r3, r4, #1
	lsl r3, r3, #0x10
	add r2, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	lsr r3, r3, #0x10
	bl sub_02031108
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02245C36
	ldrb r1, [r5, #0xf]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0xf]
	b _02245C36
_02245B7A:
	ldr r0, [r5, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r1, _02245C78 ; =0x000005B7
	add r2, r1, #3
	add r0, r5, r1
	ldrh r2, [r5, r2]
	ldrb r4, [r0, r6]
	add r1, r1, #3
	sub r2, #0x32
	strh r2, [r5, r1]
	ldrb r1, [r0, r6]
	add r1, r1, #1
	strb r1, [r0, r6]
	b _02245C36
_02245B9A:
	cmp r4, r7
	bhs _02245BBE
	ldr r0, [r5, #0x24]
	mov r1, #5
	bl ov83_022477C4
	ldr r1, _02245C78 ; =0x000005B7
	add r2, r1, #3
	add r0, r5, r1
	ldrh r2, [r5, r2]
	ldrb r4, [r0, r6]
	add r1, r1, #3
	sub r2, #0x32
	strh r2, [r5, r1]
	ldrb r1, [r0, r6]
	add r1, r1, #1
	strb r1, [r0, r6]
	b _02245C36
_02245BBE:
	add r0, r5, #0
	mov r1, #5
	bl ov83_02244ABC
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl ov83_0224777C
	ldrb r1, [r5, #9]
	ldr r0, [r5, #4]
	mov r2, #0x32
	bl ov80_02237FA4
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl ov83_0224777C
	add r4, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r7, r0, #0
	ldrb r0, [r5, #9]
	add r1, r6, #0
	bl sub_0205C174
	str r0, [sp, #4]
	ldrb r0, [r5, #9]
	add r1, r6, #0
	bl sub_0205C174
	bl sub_0205C268
	add r3, r4, #1
	lsl r3, r3, #0x10
	add r2, r0, #0
	ldr r1, [sp, #4]
	add r0, r7, #0
	lsr r3, r3, #0x10
	bl sub_02031108
	ldrb r0, [r5, #9]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02245C36
	ldrb r1, [r5, #0xf]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0xf]
_02245C36:
	add r0, r5, #0
	bl ov83_02245390
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x50
	bl ov83_022453DC
	mov r0, #0xae
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	bl ov83_02247944
	mov r1, #6
	add r3, r6, #0
	mul r3, r1
	ldr r1, _02245C7C ; =ov83_02248054
	lsl r2, r4, #1
	add r1, r1, r3
	ldrh r1, [r2, r1]
	add r0, r5, #0
	mov r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245C78: .word 0x000005B7
_02245C7C: .word ov83_02248054
	thumb_func_end ov83_02245ACC

	thumb_func_start ov83_02245C80
ov83_02245C80: ; 0x02245C80
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldrb r0, [r6, #9]
	mov r1, #1
	bl ov80_02237B58
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _02245CA4
_02245C94:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov83_02245CA8
	add r4, r4, #1
	cmp r4, r5
	blt _02245C94
_02245CA4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov83_02245C80

	thumb_func_start ov83_02245CA8
ov83_02245CA8: ; 0x02245CA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02245CE0 ; =0x00000554
	add r4, r1, #0
	ldr r1, [r5, r0]
	ldrb r1, [r1, r4]
	cmp r1, #1
	bne _02245CC6
	lsl r1, r4, #3
	add r1, r5, r1
	sub r0, #0x34
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov83_0224755C
_02245CC6:
	ldr r0, _02245CE4 ; =0x00000558
	ldr r1, [r5, r0]
	ldrb r1, [r1, r4]
	cmp r1, #1
	bne _02245CDE
	lsl r1, r4, #3
	add r1, r5, r1
	sub r0, #0x34
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov83_0224755C
_02245CDE:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02245CE0: .word 0x00000554
_02245CE4: .word 0x00000558
	thumb_func_end ov83_02245CA8

	thumb_func_start ov83_02245CE8
ov83_02245CE8: ; 0x02245CE8
	push {r3, r4, r5, lr}
	ldrb r0, [r0, #9]
	add r5, r1, #0
	add r4, r2, #0
	bl ov80_02237D8C
	cmp r0, #1
	bne _02245CFC
	mov r0, #0x40
	b _02245CFE
_02245CFC:
	mov r0, #0x60
_02245CFE:
	str r0, [r5]
	mov r0, #0x3c
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_02245CE8

	thumb_func_start ov83_02245D08
ov83_02245D08: ; 0x02245D08
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	add r1, r3, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [r5, #0x28]
	add r0, r4, #0
	bl ov83_02247998
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov83_02245D08

	thumb_func_start ov83_02245D48
ov83_02245D48: ; 0x02245D48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	add r1, r0, #0
	ldr r0, _02245EDC ; =0x0000055C
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	bl AcquireMonLock
	str r0, [sp, #4]
	ldr r0, _02245EE0 ; =0x000005BC
	str r6, [r5, r0]
	add r0, r6, #0
	bl Mon_GetBoxMon
	mov r1, #0x17
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _02245EE4 ; =0x000005C4
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa1
	bl GetMonData
	ldr r1, _02245EE8 ; =0x000005C7
	mov r2, #0
	strb r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa
	bl GetMonData
	ldr r1, _02245EEC ; =0x000005C8
	strb r0, [r5, r1]
	add r0, r6, #0
	bl GetMonNature
	ldr r1, _02245EF0 ; =0x000005C9
	mov r2, #0
	strb r0, [r5, r1]
	add r0, r6, #0
	mov r1, #6
	bl GetMonData
	ldr r1, _02245EF4 ; =0x000005CA
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa3
	bl GetMonData
	mov r1, #0x5d
	lsl r1, r1, #4
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	ldr r1, _02245EF8 ; =0x000005D2
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa5
	bl GetMonData
	ldr r1, _02245EFC ; =0x000005D4
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	ldr r1, _02245F00 ; =0x000005D6
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa6
	bl GetMonData
	ldr r1, _02245F04 ; =0x000005D8
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa9
	bl GetMonData
	ldr r1, _02245F08 ; =0x000005DA
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xa7
	bl GetMonData
	ldr r1, _02245F0C ; =0x000005DC
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0x70
	bl GetMonData
	ldr r1, _02245F10 ; =0x000005DE
	strb r0, [r5, r1]
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, _02245F14 ; =0x000005CC
	mov r2, #0
	str r0, [r5, r1]
	add r0, r6, #0
	mov r1, #0xb0
	bl GetMonData
	cmp r0, #1
	ldr r1, _02245F18 ; =0x000005C6
	bne _02245E54
	ldrb r2, [r5, r1]
	mov r0, #0x80
	bic r2, r0
	strb r2, [r5, r1]
	b _02245E5C
_02245E54:
	ldrb r2, [r5, r1]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r5, r1]
_02245E5C:
	add r0, r6, #0
	bl GetMonGender
	ldr r3, _02245F18 ; =0x000005C6
	mov r2, #0x7f
	ldrb r1, [r5, r3]
	mov r4, #0
	bic r1, r2
	mov r2, #0x7f
	and r0, r2
	orr r0, r1
	strb r0, [r5, r3]
_02245E74:
	lsl r0, r4, #1
	add r0, r5, r0
	add r1, r4, #0
	str r0, [sp]
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	mov r1, #0x5e
	ldr r2, [sp]
	lsl r1, r1, #4
	strh r0, [r2, r1]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3a
	mov r2, #0
	add r7, r5, r4
	bl GetMonData
	ldr r1, _02245F1C ; =0x000005E8
	mov r2, #0
	strb r0, [r7, r1]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3e
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x5e
	lsl r1, r1, #0x18
	ldr r2, [sp]
	lsl r0, r0, #4
	ldrh r0, [r2, r0]
	lsr r1, r1, #0x18
	bl WazaGetMaxPp
	ldr r1, _02245F20 ; =0x000005EC
	strb r0, [r7, r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _02245E74
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ReleaseMonLock
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245EDC: .word 0x0000055C
_02245EE0: .word 0x000005BC
_02245EE4: .word 0x000005C4
_02245EE8: .word 0x000005C7
_02245EEC: .word 0x000005C8
_02245EF0: .word 0x000005C9
_02245EF4: .word 0x000005CA
_02245EF8: .word 0x000005D2
_02245EFC: .word 0x000005D4
_02245F00: .word 0x000005D6
_02245F04: .word 0x000005D8
_02245F08: .word 0x000005DA
_02245F0C: .word 0x000005DC
_02245F10: .word 0x000005DE
_02245F14: .word 0x000005CC
_02245F18: .word 0x000005C6
_02245F1C: .word 0x000005E8
_02245F20: .word 0x000005EC
	thumb_func_end ov83_02245D48

	thumb_func_start ov83_02245F24
ov83_02245F24: ; 0x02245F24
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1b
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1d
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1f
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x21
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x23
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x42
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x34
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x32
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x30
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x43
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x36
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x1f
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x3a
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x38
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x3c
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246110 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r1, [r4, #0x20]
	add r0, r4, r0
	mov r2, #0x3e
	bl ov83_022479E4
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1b
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1d
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1f
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x21
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x23
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x10
	pop {r4, pc}
	nop
_02246110: .word 0x00010200
	thumb_func_end ov83_02245F24

	thumb_func_start ov83_02246114
ov83_02246114: ; 0x02246114
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0xaf
	str r1, [sp, #0x14]
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	mov r2, #2
	bl ov83_0224777C
	add r6, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	add r4, r0, #0
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #5
	lsl r0, r0, #6
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #6
	lsl r0, r0, #6
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1a
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x1e
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #2
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #9
	lsl r0, r0, #6
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x27
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _02246538 ; =0x000005C6
	ldrb r0, [r5, r0]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1f
	bne _0224621E
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	bne _022461FE
	mov r3, #0
	str r3, [sp]
	ldr r0, _0224653C ; =0x00050600
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x40
	bl ov83_022479E4
	b _0224621E
_022461FE:
	cmp r0, #1
	bne _0224621E
	mov r3, #0
	str r3, [sp]
	mov r0, #0xc1
	str r3, [sp, #4]
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x41
	bl ov83_022479E4
_0224621E:
	mov r1, #0
	ldr r2, _02246540 ; =0x000005C7
	str r1, [sp]
	ldrb r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02244A98
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #5
	lsl r1, r1, #6
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x48
	bl ov83_02245D08
	ldr r0, _02246548 ; =0x0000054C
	ldr r1, [r5, r0]
	ldrb r1, [r1, r4]
	cmp r1, #0
	beq _022462D8
	add r0, #0x70
	ldr r0, [r5, r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x45
	bl ov83_02245D08
	mov r1, #0
	mov r2, #0x5d
	str r1, [sp]
	lsl r2, r2, #4
	ldrh r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02244A98
	mov r0, #0
	str r0, [sp]
	ldr r2, _0224654C ; =0x000005D2
	add r0, r5, #0
	ldrh r2, [r5, r2]
	mov r1, #1
	mov r3, #3
	bl ov83_02244A98
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 ; =0x00010200
	mov r1, #7
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #6
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x4e
	bl ov83_02245D08
	b _0224631C
_022462D8:
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246544 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x4b
	bl ov83_022479E4
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02246544 ; =0x00010200
	mov r2, #0x4d
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #7
	lsl r0, r0, #6
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	lsl r3, r3, #3
	bl ov83_022479E4
_0224631C:
	ldr r2, _02246550 ; =0x00000554
	ldr r0, [r5, r2]
	ldrb r0, [r0, r4]
	cmp r0, #0
	bne _02246328
	b _022464D2
_02246328:
	add r2, #0x74
	ldrb r2, [r5, r2]
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferAbilityName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x16
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x35
	bl ov83_02245D08
	ldr r2, _02246554 ; =0x000005C9
	ldr r0, [r5, #0x24]
	ldrb r2, [r5, r2]
	mov r1, #0
	bl BufferNatureName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #6
	lsl r1, r1, #6
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x33
	bl ov83_02245D08
	ldr r2, _02246558 ; =0x000005CA
	ldr r0, [r5, #0x24]
	ldrh r2, [r5, r2]
	mov r1, #0
	bl BufferItemName
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 ; =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0x1a
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x31
	bl ov83_02245D08
	mov r1, #0
	ldr r2, _0224655C ; =0x000005D4
	str r1, [sp]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02244A98
	mov r0, #0x1e
	lsl r0, r0, #4
	add r0, r5, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 ; =0x00010200
	mov r1, #0x1e
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x37
	bl ov83_02245D08
	mov r1, #0
	ldr r2, _02246560 ; =0x000005D6
	str r1, [sp]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02244A98
	mov r0, #2
	lsl r0, r0, #8
	add r0, r5, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 ; =0x00010200
	mov r1, #1
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	lsl r1, r1, #9
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x3b
	bl ov83_02245D08
	mov r1, #0
	ldr r2, _02246564 ; =0x000005D8
	str r1, [sp]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02244A98
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 ; =0x00010200
	mov r1, #0x22
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x39
	bl ov83_02245D08
	mov r1, #0
	ldr r2, _02246568 ; =0x000005DA
	str r1, [sp]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02244A98
	mov r0, #9
	lsl r0, r0, #6
	add r0, r5, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 ; =0x00010200
	mov r1, #9
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #6
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x3d
	bl ov83_02245D08
	mov r1, #0
	ldr r2, _0224656C ; =0x000005DC
	str r1, [sp]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	mov r3, #3
	bl ov83_02244A98
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r5, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 ; =0x00010200
	mov r1, #0x26
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0x3f
	bl ov83_02245D08
	b _0224662C
_022464D2:
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246544 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x4b
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246544 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x4b
	bl ov83_022479E4
	mov r3, #0
	str r3, [sp]
	ldr r0, _02246544 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x4b
	bl ov83_022479E4
	mov r0, #0x1e
	lsl r0, r0, #4
	add r0, r5, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02246544 ; =0x00010200
	b _02246570
	nop
_02246538: .word 0x000005C6
_0224653C: .word 0x00050600
_02246540: .word 0x000005C7
_02246544: .word 0x00010200
_02246548: .word 0x0000054C
_0224654C: .word 0x000005D2
_02246550: .word 0x00000554
_02246554: .word 0x000005C9
_02246558: .word 0x000005CA
_0224655C: .word 0x000005D4
_02246560: .word 0x000005D6
_02246564: .word 0x000005D8
_02246568: .word 0x000005DA
_0224656C: .word 0x000005DC
_02246570:
	mov r2, #0x4a
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	lsl r3, r3, #3
	bl ov83_022479E4
	mov r0, #2
	lsl r0, r0, #8
	add r0, r5, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C ; =0x00010200
	mov r2, #0x4a
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r0, r0, #9
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	lsl r3, r3, #3
	bl ov83_022479E4
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C ; =0x00010200
	mov r2, #0x4a
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	lsl r3, r3, #3
	bl ov83_022479E4
	mov r0, #9
	lsl r0, r0, #6
	add r0, r5, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C ; =0x00010200
	mov r2, #0x4a
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #9
	lsl r0, r0, #6
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	lsl r3, r3, #3
	bl ov83_022479E4
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r5, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C ; =0x00010200
	mov r2, #0x4a
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	lsl r3, r3, #3
	bl ov83_022479E4
_0224662C:
	cmp r6, #1
	bne _0224664C
	mov r3, #0
	str r3, [sp]
	ldr r0, _0224690C ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r2, #0x4c
	bl ov83_022479E4
	b _02246864
_0224664C:
	ldr r0, _02246910 ; =0x00000558
	ldr r0, [r5, r0]
	ldrb r0, [r0, r4]
	cmp r0, #0
	bne _02246722
	mov r0, #0
	str r0, [sp, #0x20]
_0224665A:
	ldr r0, [sp, #0x20]
	mov r2, #0x4b
	lsl r4, r0, #4
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0224690C ; =0x00010200
	mov r3, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	bl ov83_022479E4
	ldr r0, [r5, #0x20]
	mov r1, #0x44
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x17
	lsr r6, r0, #0x18
	mov r0, #0
	str r0, [sp]
	ldr r0, _0224690C ; =0x00010200
	add r1, r7, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x27
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #0x78
	add r3, r4, #0
	bl ov83_02247998
	add r0, r7, #0
	bl String_dtor
	ldr r0, [r5, #0x20]
	mov r1, #0x49
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0224690C ; =0x00010200
	mov r2, #0x78
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x27
	lsl r0, r0, #4
	sub r2, r2, r6
	sub r2, r2, r3
	add r0, r5, r0
	add r1, r7, #0
	add r3, r4, #0
	bl ov83_02247998
	add r0, r7, #0
	bl String_dtor
	add r6, #0x78
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0224690C ; =0x00010200
	mov r2, #0x49
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	add r3, r6, #0
	bl ov83_022479E4
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	cmp r0, #4
	blo _0224665A
	b _02246864
_02246722:
	mov r4, #0
_02246724:
	lsl r0, r4, #1
	mov r2, #0x5e
	add r7, r5, r0
	lsl r2, r2, #4
	ldrh r2, [r7, r2]
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	bl BufferMoveName
	mov r0, #0
	mov r1, #0x27
	lsl r1, r1, #4
	add r3, r4, #0
	lsl r6, r4, #4
	str r0, [sp]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0224690C ; =0x00010200
	add r1, r5, r1
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	add r3, #0x54
	bl ov83_02245D08
	mov r0, #0x5e
	lsl r0, r0, #4
	ldrh r0, [r7, r0]
	cmp r0, #0
	bne _02246784
	str r6, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0224690C ; =0x00010200
	mov r2, #0x5a
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r1, [r5, #0x20]
	add r0, r5, r0
	mov r3, #0x78
	bl ov83_022479E4
	b _02246858
_02246784:
	ldr r0, [r5, #0x20]
	mov r1, #0x44
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x17
	lsr r6, r0, #0x18
	lsl r0, r4, #4
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp]
	ldr r0, _0224690C ; =0x00010200
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x27
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r7, #0
	mov r2, #0x78
	bl ov83_02247998
	add r0, r7, #0
	bl String_dtor
	add r0, r5, r4
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp]
	ldr r3, [sp, #0x18]
	ldr r2, _02246914 ; =0x000005E8
	add r0, r5, #0
	ldrb r2, [r3, r2]
	mov r1, #0
	mov r3, #2
	bl ov83_02244A98
	ldr r0, [r5, #0x20]
	mov r1, #0x59
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r5, #0x28]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0224690C ; =0x00010200
	mov r3, #0x78
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x27
	sub r3, r3, r6
	lsl r0, r0, #4
	sub r2, r3, r2
	ldr r1, [r5, #0x28]
	ldr r3, [sp, #0x1c]
	add r0, r5, r0
	bl ov83_02247998
	add r0, r7, #0
	bl String_dtor
	mov r0, #0
	str r0, [sp]
	ldr r3, [sp, #0x18]
	ldr r2, _02246918 ; =0x000005EC
	add r0, r5, #0
	ldrb r2, [r3, r2]
	mov r1, #0
	mov r3, #2
	bl ov83_02244A98
	add r6, #0x78
	mov r1, #0x27
	lsl r1, r1, #4
	ldr r0, [sp, #0x1c]
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _0224690C ; =0x00010200
	add r1, r5, r1
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	add r0, r5, #0
	mov r3, #0x59
	bl ov83_02245D08
_02246858:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	bhs _02246864
	b _02246724
_02246864:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _02246884
	mov r4, #0xc
	add r5, #0x50
_0224686E:
	lsl r0, r4, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x22
	bls _0224686E
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02246884:
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #5
	lsl r0, r0, #6
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #6
	lsl r0, r0, #6
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1a
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x1e
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #2
	lsl r0, r0, #8
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #9
	lsl r0, r0, #6
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x26
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x27
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0224690C: .word 0x00010200
_02246910: .word 0x00000558
_02246914: .word 0x000005E8
_02246918: .word 0x000005EC
	thumb_func_end ov83_02246114

	thumb_func_start ov83_0224691C
ov83_0224691C: ; 0x0224691C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov83_02245D48
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02246114
	add r0, r5, #0
	bl ov83_02246988
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_0224691C

	thumb_func_start ov83_02246938
ov83_02246938: ; 0x02246938
	push {r4, r5, r6, lr}
	add r6, r0, #0
	cmp r1, #1
	bne _02246962
	mov r0, #0x11
	lsl r0, r0, #4
	mov r4, #0xc
	add r5, r6, r0
_02246948:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x22
	bls _02246948
	ldr r0, _02246984 ; =0x00000544
	mov r1, #1
	ldr r0, [r6, r0]
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
_02246962:
	mov r0, #0x11
	lsl r0, r0, #4
	mov r5, #0xc
	add r4, r6, r0
_0224696A:
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #0x22
	bls _0224696A
	ldr r0, _02246984 ; =0x00000544
	mov r1, #0
	ldr r0, [r6, r0]
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02246984: .word 0x00000544
	thumb_func_end ov83_02246938

	thumb_func_start ov83_02246988
ov83_02246988: ; 0x02246988
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r3, _022469D4 ; =0x0000054C
	ldr r1, [r4, r3]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _022469B6
	add r0, r3, #0
	add r1, r3, #0
	sub r0, #8
	add r1, #0x74
	add r3, #0x80
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	mov r2, #0
	bl ov83_02247668
	pop {r4, pc}
_022469B6:
	add r2, r3, #0
	add r0, r3, #0
	add r1, r3, #0
	add r2, #0x78
	sub r0, #8
	add r1, #0x74
	add r3, #0x80
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	bl ov83_02247668
	pop {r4, pc}
	nop
_022469D4: .word 0x0000054C
	thumb_func_end ov83_02246988

	thumb_func_start ov83_022469D8
ov83_022469D8: ; 0x022469D8
	ldr r3, _022469E0 ; =ov83_02244CDC
	strb r1, [r0, #0xd]
	strb r2, [r0, #0xc]
	bx r3
	.balign 4, 0
_022469E0: .word ov83_02244CDC
	thumb_func_end ov83_022469D8

	thumb_func_start ov83_022469E4
ov83_022469E4: ; 0x022469E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r0, sp, #4
	add r4, r1, #0
	add r0, #2
	add r1, sp, #4
	add r6, r2, #0
	add r7, r3, #0
	bl ov83_02247988
	ldr r0, _02246A90 ; =ov83_02248018
	add r1, sp, #4
	ldrh r2, [r0]
	add r3, sp, #8
	strh r2, [r1, #0x1c]
	ldrh r2, [r0, #2]
	strh r2, [r1, #0x1e]
	ldrh r2, [r0, #4]
	strh r2, [r1, #0x20]
	ldrh r2, [r0, #6]
	strh r2, [r1, #0x22]
	ldrh r2, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r2, [r1, #0x24]
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0x22]
	ldrh r2, [r1]
	add r0, r0, r2
	sub r0, #0x1b
	strh r0, [r1, #0x24]
	strh r2, [r1, #0x26]
	ldrh r0, [r1, #0x1c]
	strh r0, [r1, #4]
	ldrh r0, [r1, #0x1e]
	strh r0, [r1, #6]
	ldrh r0, [r1, #0x20]
	strh r0, [r1, #8]
	ldrh r0, [r1, #0x22]
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0x24]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x26]
	strh r0, [r1, #0xe]
	ldr r0, _02246A94 ; =0x000005FC
	ldr r2, [r5, r0]
	sub r0, #8
	str r2, [sp, #0x14]
	ldr r2, [r5, #0x4c]
	str r2, [sp, #0x18]
	strb r4, [r1, #0x18]
	add r1, sp, #0x30
	ldrb r1, [r1, #0x10]
	add r2, r6, #0
	str r1, [sp]
	add r1, r3, #0
	ldr r0, [r5, r0]
	add r3, r7, #0
	bl ov83_02247CCC
	ldr r1, _02246A98 ; =0x000005F8
	str r0, [r5, r1]
	ldrb r1, [r5, #0xf]
	mov r0, #4
	orr r0, r1
	strb r0, [r5, #0xf]
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B24
	add r4, r0, #0
	ldr r0, _02246A9C ; =0x000004E4
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #1
	bl ov83_0224773C
	ldr r0, _02246AA0 ; =0x000004F4
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #1
	bl ov83_0224773C
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02246A90: .word ov83_02248018
_02246A94: .word 0x000005FC
_02246A98: .word 0x000005F8
_02246A9C: .word 0x000004E4
_02246AA0: .word 0x000004F4
	thumb_func_end ov83_022469E4

	thumb_func_start ov83_02246AA4
ov83_02246AA4: ; 0x02246AA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x6b
	mov r4, #0
	bl ListMenuItems_ctor
	ldr r1, _02246B5C ; =0x000005FC
	mov r2, #2
	str r0, [r5, r1]
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	bl ov83_0224777C
	add r7, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	add r6, r0, #0
	ldr r0, _02246B60 ; =0x0000054C
	ldr r1, [r5, r0]
	ldrb r1, [r1, r6]
	cmp r1, #0
	bne _02246AEE
	add r0, #0xb0
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	mov r2, #8
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02246AEE:
	ldr r0, _02246B5C ; =0x000005FC
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	mov r2, #9
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02246B64 ; =0x00000554
	ldr r1, [r5, r0]
	ldrb r1, [r1, r6]
	cmp r1, #0
	beq _02246B1A
	add r0, r0, #4
	ldr r0, [r5, r0]
	ldrb r0, [r0, r6]
	cmp r0, #0
	beq _02246B1A
	cmp r7, #2
	beq _02246B2E
_02246B1A:
	ldr r0, _02246B5C ; =0x000005FC
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	mov r2, #0xa
	mov r3, #2
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02246B2E:
	ldr r0, _02246B5C ; =0x000005FC
	mov r2, #0xb
	add r3, r2, #0
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	sub r3, #0xd
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	lsl r1, r3, #0x18
	ldr r4, _02246B68 ; =ov83_02248010
	mov r0, #0xd
	str r0, [sp]
	ldrb r3, [r4, r3]
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0x11
	bl ov83_022469E4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02246B5C: .word 0x000005FC
_02246B60: .word 0x0000054C
_02246B64: .word 0x00000554
_02246B68: .word ov83_02248010
	thumb_func_end ov83_02246AA4

	thumb_func_start ov83_02246B6C
ov83_02246B6C: ; 0x02246B6C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x6b
	mov r4, #0
	bl ListMenuItems_ctor
	ldr r1, _02246C1C ; =0x000005FC
	mov r2, #2
	str r0, [r5, r1]
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	bl ov83_0224777C
	add r6, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	add r7, r0, #0
	ldr r0, _02246C20 ; =0x00000554
	ldr r1, [r5, r0]
	ldrb r1, [r1, r7]
	cmp r1, #0
	bne _02246BB6
	add r0, #0xa8
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	mov r2, #0x21
	mov r3, #3
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02246BB6:
	cmp r6, #1
	beq _02246BD8
	ldr r0, _02246C24 ; =0x00000558
	ldr r1, [r5, r0]
	ldrb r1, [r1, r7]
	cmp r1, #0
	bne _02246BD8
	add r0, #0xa4
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	mov r2, #0x22
	mov r3, #4
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02246BD8:
	cmp r6, #2
	beq _02246BF0
	ldr r0, _02246C1C ; =0x000005FC
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	mov r2, #0x23
	mov r3, #5
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02246BF0:
	ldr r0, _02246C1C ; =0x000005FC
	mov r2, #0x24
	add r3, r2, #0
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	sub r3, #0x26
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	lsl r1, r3, #0x18
	ldr r4, _02246C28 ; =ov83_02248010
	mov r0, #0xd
	str r0, [sp]
	ldrb r3, [r4, r3]
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0x11
	bl ov83_022469E4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02246C1C: .word 0x000005FC
_02246C20: .word 0x00000554
_02246C24: .word 0x00000558
_02246C28: .word ov83_02248010
	thumb_func_end ov83_02246B6C

	thumb_func_start ov83_02246C2C
ov83_02246C2C: ; 0x02246C2C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x6b
	bl ListMenuItems_ctor
	ldr r1, _02246C6C ; =0x000005FC
	mov r4, #0
	str r0, [r5, r1]
	add r6, r1, #0
_02246C42:
	add r2, r4, #0
	ldr r0, [r5, r6]
	ldr r1, [r5, #0x20]
	add r2, #0x16
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	cmp r4, #3
	blo _02246C42
	mov r0, #0xd
	str r0, [sp]
	add r0, r5, #0
	mov r1, #3
	mov r2, #0x11
	mov r3, #8
	bl ov83_022469E4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02246C6C: .word 0x000005FC
	thumb_func_end ov83_02246C2C

	thumb_func_start ov83_02246C70
ov83_02246C70: ; 0x02246C70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	mov r1, #1
	bl ov80_02237B24
	add r4, r0, #0
	ldr r0, _02246CB0 ; =0x000004E4
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	bl ov83_0224773C
	ldr r0, _02246CB4 ; =0x000004F4
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	bl ov83_0224773C
	ldr r0, _02246CB8 ; =0x000005F8
	ldr r0, [r5, r0]
	bl ov83_02247CE8
	ldr r0, _02246CBC ; =0x000005FC
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldrb r1, [r5, #0xf]
	mov r0, #4
	bic r1, r0
	strb r1, [r5, #0xf]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02246CB0: .word 0x000004E4
_02246CB4: .word 0x000004F4
_02246CB8: .word 0x000005F8
_02246CBC: .word 0x000005FC
	thumb_func_end ov83_02246C70

	thumb_func_start ov83_02246CC0
ov83_02246CC0: ; 0x02246CC0
	push {r4, lr}
	sub sp, #0x18
	ldr r1, _02246D3C ; =0x000005F8
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r3, r1, #0
	add r0, #0x24
	add r3, #8
	ldrb r0, [r0]
	ldr r3, [r4, r3]
	cmp r3, r0
	beq _02246D36
	add r1, r1, #4
	ldr r1, [r4, r1]
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r1, [r0, #4]
	cmp r1, #2
	bhi _02246CF4
	cmp r1, #0
	beq _02246CFE
	cmp r1, #1
	beq _02246D02
	cmp r1, #2
	beq _02246D06
	b _02246D0C
_02246CF4:
	mov r0, #1
	mvn r0, r0
	cmp r1, r0
	beq _02246D0A
	b _02246D0C
_02246CFE:
	mov r2, #0xc
	b _02246D0C
_02246D02:
	mov r2, #0xd
	b _02246D0C
_02246D06:
	mov r2, #0xe
	b _02246D0C
_02246D0A:
	mov r2, #0xf
_02246D0C:
	mov r3, #1
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r1, r4, #0
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, #0xc0
	str r3, [sp, #0x14]
	bl ov83_022447E0
	ldr r0, _02246D3C ; =0x000005F8
	ldr r1, [r4, r0]
	add r0, #8
	add r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02246D36:
	add sp, #0x18
	pop {r4, pc}
	nop
_02246D3C: .word 0x000005F8
	thumb_func_end ov83_02246CC0

	thumb_func_start ov83_02246D40
ov83_02246D40: ; 0x02246D40
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #8
	ldr r1, [r5, r0]
	sub r0, #8
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r1, r0
	beq _02246DEA
	mov r0, #0xaf
	lsl r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	mov r2, #2
	bl ov83_0224777C
	cmp r0, #1
	beq _02246D6E
	mov r1, #1
	b _02246D70
_02246D6E:
	mov r1, #0
_02246D70:
	ldr r2, _02246DF0 ; =0x000005FC
	ldr r0, [r5, r2]
	sub r2, r2, #4
	ldr r2, [r5, r2]
	add r2, #0x24
	ldrb r2, [r2]
	lsl r2, r2, #3
	add r0, r0, r2
	ldr r2, [r0, #4]
	cmp r2, #5
	bhi _02246D96
	cmp r2, #3
	blo _02246DBE
	beq _02246DA0
	cmp r2, #4
	beq _02246DA8
	cmp r2, #5
	beq _02246DB0
	b _02246DBE
_02246D96:
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	beq _02246DB8
	b _02246DBE
_02246DA0:
	ldr r0, _02246DF4 ; =ov83_02248024
	lsl r1, r1, #1
	ldrh r4, [r0, r1]
	b _02246DBE
_02246DA8:
	ldr r0, _02246DF8 ; =ov83_02248028
	lsl r1, r1, #1
	ldrh r4, [r0, r1]
	b _02246DBE
_02246DB0:
	ldr r0, _02246DFC ; =ov83_0224802C
	lsl r1, r1, #1
	ldrh r4, [r0, r1]
	b _02246DBE
_02246DB8:
	ldr r0, _02246E00 ; =ov83_02248030
	lsl r1, r1, #1
	ldrh r4, [r0, r1]
_02246DBE:
	mov r3, #1
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r1, r5, #0
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, #0xc0
	add r2, r4, #0
	str r3, [sp, #0x14]
	bl ov83_022447E0
	ldr r0, _02246E04 ; =0x000005F8
	ldr r1, [r5, r0]
	add r0, #8
	add r1, #0x24
	ldrb r1, [r1]
	str r1, [r5, r0]
_02246DEA:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02246DF0: .word 0x000005FC
_02246DF4: .word ov83_02248024
_02246DF8: .word ov83_02248028
_02246DFC: .word ov83_0224802C
_02246E00: .word ov83_02248030
_02246E04: .word 0x000005F8
	thumb_func_end ov83_02246D40

	thumb_func_start ov83_02246E08
ov83_02246E08: ; 0x02246E08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x14]
	mov r0, #0x20
	mov r1, #0x6b
	str r2, [sp, #0x18]
	bl GF_CreateVramTransferManager
	bl ov83_022472DC
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x6b
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	mov r0, #0x28
	add r1, r5, #4
	mov r2, #0x6b
	bl G2dRenderer_Init
	ldr r4, _02247148 ; =ov83_02248178
	str r0, [r5]
	mov r7, #0
	add r6, r5, #0
_02246E4C:
	ldrb r0, [r4]
	add r1, r7, #0
	mov r2, #0x6b
	bl Create2DGfxResObjMan
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r7, r7, #1
	add r4, r4, #1
	add r6, r6, #4
	cmp r7, #4
	blt _02246E4C
	add r0, r5, #0
	bl ov83_022473BC
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc1
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0xf
	bl AddCharResObjFromNarc
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	add r0, #0xc5
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x37
	bl AddPlttResObjFromNarc
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc9
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x11
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xcd
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x10
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x12
	mov r1, #0x6b
	bl NARC_ctor
	add r6, r5, #0
	add r7, r0, #0
	mov r4, #4
	add r6, #0x40
_02246EFC:
	mov r0, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r2, r0, #0
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc1
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r2, r0, #0
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	add r0, #0xc5
	ldr r0, [r5, r0]
	mov r1, #0x12
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r6, r1]
	add r4, r4, #1
	add r6, #0x10
	cmp r4, #9
	ble _02246EFC
	bl GetItemIconCell
	add r2, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc9
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r5, r1]
	bl GetItemIconAnim
	add r2, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xcd
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r2, r0, #0
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	add r0, #0xc5
	ldr r0, [r5, r0]
	mov r1, #0x12
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r7, #0
	bl NARC_dtor
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc1
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x24
	mov r3, #1
	bl AddCharResObjFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc9
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x26
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xcd
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x25
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov83_02247314
	mov r0, #0x14
	mov r1, #0x6b
	bl NARC_ctor
	add r7, r0, #0
	bl sub_02074490
	add r2, r0, #0
	mov r0, #0xa
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	add r0, #0xc5
	ldr r0, [r5, r0]
	mov r1, #0x14
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x1e
	lsl r1, r1, #4
	str r0, [r5, r1]
	bl sub_02074498
	add r2, r0, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc9
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r5, r1]
	bl sub_020744A4
	add r2, r0, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xcd
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x7a
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r4, #0
	add r6, r5, #0
_022470AE:
	cmp r4, #3
	bne _022470CC
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _022470C2
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl GetPartyMonByIndex
	b _022470D4
_022470C2:
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	bl GetPartyMonByIndex
	b _022470D4
_022470CC:
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	bl GetPartyMonByIndex
_022470D4:
	bl Pokemon_GetIconNaix
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xa
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc1
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x77
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r4, r4, #1
	add r6, #0x10
	cmp r4, #4
	blt _022470AE
	add r0, r7, #0
	bl NARC_dtor
	mov r7, #0x4f
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_02247110:
	ldr r0, [r4, r7]
	bl sub_0200ACF0
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0xe
	blt _02247110
	mov r6, #5
	mov r4, #0
	lsl r6, r6, #6
_02247124:
	ldr r0, [r5, r6]
	bl sub_0200AF94
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xb
	blt _02247124
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02247148: .word ov83_02248178
	thumb_func_end ov83_02246E08

	thumb_func_start ov83_0224714C
ov83_0224714C: ; 0x0224714C
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
	add r1, r5, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	ldr r0, [sp, #0x94]
	str r0, [sp, #0x50]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	bne _022471BA
	mov r0, #1
	str r0, [sp, #0x54]
	b _022471BE
_022471BA:
	mov r0, #2
	str r0, [sp, #0x54]
_022471BE:
	mov r0, #0x6b
	str r0, [sp, #0x58]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _022471D4
	mov r0, #3
	ldr r1, [sp, #0x38]
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x38]
_022471D4:
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
	.balign 4, 0
	thumb_func_end ov83_0224714C

	thumb_func_start ov83_022471FC
ov83_022471FC: ; 0x022471FC
	push {r4, r5, r6, lr}
	mov r6, #0x4f
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_02247206:
	lsl r0, r4, #4
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl sub_0200AEB0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xe
	blo _02247206
	mov r6, #5
	mov r4, #0
	lsl r6, r6, #6
_02247220:
	lsl r0, r4, #4
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xb
	blo _02247220
	mov r6, #0x4b
	mov r4, #0
	lsl r6, r6, #2
_0224723A:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl Destroy2DGfxResObjMan
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _0224723A
	ldr r0, [r5]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov83_022471FC

	thumb_func_start ov83_02247264
ov83_02247264: ; 0x02247264
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r2, #0
	bl Get2DGfxResObjById
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x6b
	str r0, [sp, #4]
	add r0, #0xc1
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r2, #0x12
	bl ReplaceCharResObjFromNarc
	add r0, r4, #0
	bl sub_0200AE8C
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02247264

	thumb_func_start ov83_022472A0
ov83_022472A0: ; 0x022472A0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r2, #0
	bl Get2DGfxResObjById
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x6b
	str r0, [sp, #4]
	add r0, #0xc5
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r2, #0x12
	bl ReplacePlttResObjFromNarc
	add r0, r4, #0
	bl sub_0200B084
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_022472A0

	thumb_func_start ov83_022472DC
ov83_022472DC: ; 0x022472DC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0224730C ; =ov83_0224817C
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	ldr r2, _02247310 ; =0x00100010
	mov r1, #0x10
	bl sub_020215C0
	mov r0, #0x20
	mov r1, #0x6b
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0224730C: .word ov83_0224817C
_02247310: .word 0x00100010
	thumb_func_end ov83_022472DC

	thumb_func_start ov83_02247314
ov83_02247314: ; 0x02247314
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x15
	mov r1, #0x6b
	bl NARC_ctor
	add r4, r0, #0
	bl sub_0207CA9C
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc1
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	bl sub_0207CAA0
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	add r0, #0xc5
	ldr r0, [r5, r0]
	mov r1, #0x15
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	bl sub_0207CAA4
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc9
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r5, r1]
	bl sub_0207CAA8
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xcd
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02247314

	thumb_func_start ov83_022473BC
ov83_022473BC: ; 0x022473BC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #8
	mov r1, #0x6b
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc1
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r2, #0x4c
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x6b
	str r0, [sp, #0xc]
	add r0, #0xc5
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r2, #0x4b
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xc9
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r2, #0x4d
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	add r0, #0xcd
	ldr r0, [r5, r0]
	add r1, r4, #0
	mov r2, #0x4e
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_022473BC

	thumb_func_start ov83_02247454
ov83_02247454: ; 0x02247454
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x6b
	mov r1, #8
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	add r0, sp, #0x28
	mov r2, #0x14
	ldrsh r2, [r0, r2]
	ldr r3, [sp, #0x10]
	strh r2, [r4]
	mov r2, #0x18
	ldrsh r0, [r0, r2]
	add r2, r7, #0
	strh r0, [r4, #2]
	ldr r0, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl ov83_0224714C
	str r0, [r4, #4]
	add r1, sp, #0x28
	mov r0, #0x14
	ldrsh r0, [r1, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	mov r0, #0x18
	ldrsh r0, [r1, r0]
	add r1, sp, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	bl sub_020247D4
	add r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02247454

	thumb_func_start ov83_022474C4
ov83_022474C4: ; 0x022474C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x6b
	mov r1, #8
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	add r0, sp, #0x28
	mov r2, #0x14
	ldrsh r2, [r0, r2]
	ldr r3, [sp, #0x10]
	strh r2, [r4]
	mov r2, #0x18
	ldrsh r0, [r0, r2]
	add r2, r7, #0
	strh r0, [r4, #2]
	ldr r0, [sp, #0x38]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x44]
	add r1, r6, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov83_0224714C
	str r0, [r4, #4]
	add r1, sp, #0x28
	mov r0, #0x14
	ldrsh r0, [r1, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	mov r0, #0x18
	ldrsh r1, [r1, r0]
	lsl r0, r0, #0xf
	lsl r1, r1, #0xc
	add r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	bl sub_020247D4
	add r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_022474C4

	thumb_func_start ov83_0224753C
ov83_0224753C: ; 0x0224753C
	push {r4, lr}
	add r4, r0, #0
	bne _0224754A
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0224754A:
	ldr r0, [r4, #4]
	bl sub_02024758
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_0224753C

	thumb_func_start ov83_0224755C
ov83_0224755C: ; 0x0224755C
	ldr r3, _02247564 ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #4]
	bx r3
	nop
_02247564: .word Set2dSpriteVisibleFlag
	thumb_func_end ov83_0224755C

	thumb_func_start ov83_02247568
ov83_02247568: ; 0x02247568
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r7, #0
	str r0, [r2]
	lsl r0, r4, #0xc
	str r0, [sp]
	lsl r0, r6, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_02247568

	thumb_func_start ov83_0224759C
ov83_0224759C: ; 0x0224759C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	lsl r1, r6, #0xc
	str r0, [r2]
	lsl r0, r4, #0xc
	str r0, [sp]
	mov r0, #3
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	add r1, r7, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov83_0224759C

	thumb_func_start ov83_022475D4
ov83_022475D4: ; 0x022475D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	mov r1, #0
	bl sub_020249D4
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_022475D4

	thumb_func_start ov83_022475EC
ov83_022475EC: ; 0x022475EC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl sub_02024AA8
	pop {r4, pc}
	thumb_func_end ov83_022475EC

	thumb_func_start ov83_02247600
ov83_02247600: ; 0x02247600
	ldr r3, _02247608 ; =ov80_0222A3D4
	ldr r0, [r0, #4]
	bx r3
	nop
_02247608: .word ov80_0222A3D4
	thumb_func_end ov83_02247600

	thumb_func_start ov83_0224760C
ov83_0224760C: ; 0x0224760C
	push {r4, lr}
	add r4, r0, #0
	add r3, r1, #0
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #4]
	bl ov80_0222A400
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_0224760C

	thumb_func_start ov83_02247624
ov83_02247624: ; 0x02247624
	ldr r3, _0224762C ; =sub_02024B68
	ldr r0, [r0, #4]
	bx r3
	nop
_0224762C: .word sub_02024B68
	thumb_func_end ov83_02247624

	thumb_func_start ov83_02247630
ov83_02247630: ; 0x02247630
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	mov r1, #0xb
	bl ov83_022475D4
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov83_02247568
	add r0, r5, #0
	mov r1, #1
	bl ov83_0224755C
	ldr r0, _02247660 ; =0x000005E3
	bl PlaySE
	ldr r0, _02247664 ; =0x00000655
	bl PlaySE
	pop {r4, r5, r6, pc}
	nop
_02247660: .word 0x000005E3
_02247664: .word 0x00000655
	thumb_func_end ov83_02247630

	thumb_func_start ov83_02247668
ov83_02247668: ; 0x02247668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r7, r3, #0
	add r6, r2, #0
	ldr r3, _02247738 ; =ov83_0224818C
	add r2, sp, #0x20
	add r5, r0, #0
	str r1, [sp, #0x14]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x32
	mov r0, #0x6b
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	cmp r6, #0
	beq _022476C0
	ldr r1, [sp, #0x14]
	add r0, sp, #0x30
	mov r2, #2
	mov r3, #0
	bl GetBoxmonSpriteCharAndPlttNarcIds
	str r4, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	add r1, sp, #0x1c
	ldrh r0, [r1, #0x14]
	ldrh r1, [r1, #0x16]
	mov r2, #0x6b
	add r3, sp, #0x20
	bl sub_02014510
	add r0, sp, #0x1c
	ldrh r7, [r0, #0x14]
	ldrh r6, [r0, #0x18]
	b _022476EA
_022476C0:
	mov r0, #0x6b
	str r0, [sp]
	mov r0, #0xb8
	mov r1, #0x27
	mov r2, #1
	add r3, sp, #0x1c
	bl GfGfxLoader_GetCharData
	add r6, r0, #0
	ldr r0, [sp, #0x1c]
	mov r2, #0x32
	ldr r0, [r0, #0x14]
	add r1, r4, #0
	lsl r2, r2, #6
	bl MIi_CpuCopy32
	add r0, r6, #0
	bl FreeToHeap
	mov r7, #0xb8
	mov r6, #0x3d
_022476EA:
	ldr r0, [r5, #4]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	mov r1, #0x32
	str r0, [sp, #0x18]
	add r0, r4, #0
	lsl r1, r1, #6
	bl DC_FlushRange
	mov r2, #0x32
	ldr r1, [sp, #0x18]
	add r0, r4, #0
	lsl r2, r2, #6
	bl GXS_LoadOBJ
	ldr r0, [r5, #4]
	bl sub_02024B34
	mov r1, #2
	bl NNS_G2dGetImagePaletteLocation
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x6b
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	mov r2, #5
	bl GfGfxLoader_GXLoadPal
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02247738: .word ov83_0224818C
	thumb_func_end ov83_02247668

	thumb_func_start ov83_0224773C
ov83_0224773C: ; 0x0224773C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	cmp r2, #1
	bne _0224774A
	mov r7, #1
	b _0224774C
_0224774A:
	mov r7, #0
_0224774C:
	mov r4, #0
	cmp r6, #0
	bls _02247764
_02247752:
	ldr r0, [r5]
	add r1, r7, #0
	ldr r0, [r0, #4]
	bl sub_02024B78
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blo _02247752
_02247764:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_0224773C

	thumb_func_start ov83_02247768
ov83_02247768: ; 0x02247768
	add r0, r1, #0
	bx lr
	thumb_func_end ov83_02247768

	thumb_func_start ov83_0224776C
ov83_0224776C: ; 0x0224776C
	cmp r1, r0
	blo _02247776
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
_02247776:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov83_0224776C

	thumb_func_start ov83_0224777C
ov83_0224777C: ; 0x0224777C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0203107C
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C174
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C174
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov83_0224777C

	thumb_func_start ov83_022477B0
ov83_022477B0: ; 0x022477B0
	push {r3, lr}
	mov r2, #0
	mvn r2, r2
	cmp r0, r2
	beq _022477C0
	add r0, r1, #0
	bl PlaySE
_022477C0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov83_022477B0

	thumb_func_start ov83_022477C4
ov83_022477C4: ; 0x022477C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl BufferPlayersName
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_022477C4

	thumb_func_start ov83_022477E4
ov83_022477E4: ; 0x022477E4
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov83_022477E4

	thumb_func_start ov83_022477EC
ov83_022477EC: ; 0x022477EC
	push {r4, r5}
	lsl r5, r0, #2
	add r0, r1, #1
	add r4, r0, #0
	mov r0, #0xf
	add r1, r0, #0
	lsl r1, r5
	sub r0, #0x10
	ldr r3, [r2]
	eor r0, r1
	lsl r4, r5
	and r0, r3
	orr r0, r4
	str r0, [r2]
	pop {r4, r5}
	bx lr
	thumb_func_end ov83_022477EC

	thumb_func_start ov83_0224780C
ov83_0224780C: ; 0x0224780C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #0xf
_02247814:
	ldr r1, [r5]
	lsl r0, r4, #2
	lsr r1, r0
	add r0, r1, #0
	and r0, r6
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _02247832
	sub r1, r1, #1
	lsl r0, r4, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl ToggleBgLayer
_02247832:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #7
	bls _02247814
	add r0, r5, #0
	bl ov83_022477E4
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_0224780C

	thumb_func_start ov83_02247844
ov83_02247844: ; 0x02247844
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6b
	bl sub_0201660C
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02247844

	thumb_func_start ov83_02247858
ov83_02247858: ; 0x02247858
	ldr r3, _02247860 ; =sub_02016624
	ldr r0, [r0]
	bx r3
	nop
_02247860: .word sub_02016624
	thumb_func_end ov83_02247858

	thumb_func_start ov83_02247864
ov83_02247864: ; 0x02247864
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r5, r1, #0
	add r0, sp, #0
	add r0, #2
	add r1, sp, #0
	str r5, [r4, #8]
	bl ov83_02247988
	mov r0, #0
	str r5, [sp, #4]
	str r0, [sp, #8]
	add r2, sp, #0
	ldrh r1, [r2, #2]
	str r1, [sp, #0xc]
	mov r1, #0xb
	str r1, [sp, #0x10]
	mov r1, #0x19
	strb r1, [r2, #0x14]
	mov r1, #0xa
	strb r1, [r2, #0x15]
	ldrb r3, [r2, #0x16]
	mov r1, #0xf
	bic r3, r1
	strb r3, [r2, #0x16]
	ldrb r3, [r2, #0x16]
	mov r1, #0xf0
	bic r3, r1
	strb r3, [r2, #0x16]
	strb r0, [r2, #0x17]
	ldr r0, [r4]
	add r1, sp, #4
	bl sub_020166FC
	mov r0, #1
	str r0, [r4, #4]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov83_02247864

	thumb_func_start ov83_022478B4
ov83_022478B4: ; 0x022478B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022478D0
	ldr r0, [r4]
	bl sub_020169CC
	ldr r0, [r4, #8]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	mov r0, #0
	str r0, [r4, #4]
_022478D0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_022478B4

	thumb_func_start ov83_022478D4
ov83_022478D4: ; 0x022478D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r5, r1, #0
	ldr r0, _02247914 ; =ov83_0224819C
	lsl r1, r2, #3
	ldr r0, [r0, r1]
	mov r4, #0
	str r0, [sp, #4]
	ldr r0, _02247918 ; =ov83_0224819C + 4
	ldr r7, [r0, r1]
	cmp r7, #0
	bls _02247910
_022478EE:
	ldr r2, [sp, #4]
	lsl r6, r4, #4
	lsl r3, r4, #3
	ldr r0, [sp]
	add r1, r5, r6
	add r2, r2, r3
	bl AddWindow
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r7
	blo _022478EE
_02247910:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02247914: .word ov83_0224819C
_02247918: .word ov83_0224819C + 4
	thumb_func_end ov83_022478D4

	thumb_func_start ov83_0224791C
ov83_0224791C: ; 0x0224791C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _02247940 ; =ov83_0224819C + 4
	lsl r1, r1, #3
	ldr r5, [r0, r1]
	mov r4, #0
	cmp r5, #0
	bls _0224793E
_0224792C:
	lsl r0, r4, #4
	add r0, r6, r0
	bl RemoveWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r5
	blo _0224792C
_0224793E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02247940: .word ov83_0224819C + 4
	thumb_func_end ov83_0224791C

	thumb_func_start ov83_02247944
ov83_02247944: ; 0x02247944
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	bl GetWindowBgId
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x6b
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02247984 ; =0x000003D9
	mov r3, #0xa
	bl LoadUserFrameGfx2
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _02247984 ; =0x000003D9
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02247984: .word 0x000003D9
	thumb_func_end ov83_02247944

	thumb_func_start ov83_02247988
ov83_02247988: ; 0x02247988
	mov r2, #0xf0
	strh r2, [r1]
	ldr r1, _02247994 ; =0x000002E9
	strh r1, [r0]
	bx lr
	nop
_02247994: .word 0x000002E9
	thumb_func_end ov83_02247988

	thumb_func_start ov83_02247998
ov83_02247998: ; 0x02247998
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #1
	bne _022479B6
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	sub r5, r5, r0
	b _022479C6
_022479B6:
	cmp r0, #2
	bne _022479C6
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r0, r0, #1
	sub r5, r5, r0
_022479C6:
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r2, r7, #0
	add r3, r5, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02247998

	thumb_func_start ov83_022479E4
ov83_022479E4: ; 0x022479E4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r6, r3, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r1, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov83_02247998
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov83_022479E4

	thumb_func_start ov83_02247A18
ov83_02247A18: ; 0x02247A18
	ldr r3, _02247A1C ; =sub_02019BDC
	bx r3
	.balign 4, 0
_02247A1C: .word sub_02019BDC
	thumb_func_end ov83_02247A18

	thumb_func_start ov83_02247A20
ov83_02247A20: ; 0x02247A20
	bx lr
	.balign 4, 0
	thumb_func_end ov83_02247A20

	thumb_func_start ov83_02247A24
ov83_02247A24: ; 0x02247A24
	push {lr}
	sub sp, #0xc
	add r3, r0, #0
	cmp r2, #3
	bne _02247A4A
	mov r0, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247A68 ; =ov83_02248530
	ldr r1, _02247A6C ; =ov83_022485A8
	ldr r2, _02247A70 ; =ov83_02248500
	bl sub_02019BA4
	add sp, #0xc
	pop {pc}
_02247A4A:
	mov r0, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247A74 ; =ov83_02248558
	ldr r1, _02247A78 ; =ov83_022485E8
	ldr r2, _02247A70 ; =ov83_02248500
	bl sub_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_02247A68: .word ov83_02248530
_02247A6C: .word ov83_022485A8
_02247A70: .word ov83_02248500
_02247A74: .word ov83_02248558
_02247A78: .word ov83_022485E8
	thumb_func_end ov83_02247A24

	thumb_func_start ov83_02247A7C
ov83_02247A7C: ; 0x02247A7C
	push {lr}
	sub sp, #0xc
	add r3, r0, #0
	cmp r2, #3
	bne _02247AA2
	mov r0, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247AC0 ; =ov83_02248530
	ldr r1, _02247AC4 ; =ov83_022485A8
	ldr r2, _02247AC8 ; =ov83_02248510
	bl sub_02019BA4
	add sp, #0xc
	pop {pc}
_02247AA2:
	mov r0, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247ACC ; =ov83_02248558
	ldr r1, _02247AD0 ; =ov83_022485E8
	ldr r2, _02247AC8 ; =ov83_02248510
	bl sub_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_02247AC0: .word ov83_02248530
_02247AC4: .word ov83_022485A8
_02247AC8: .word ov83_02248510
_02247ACC: .word ov83_02248558
_02247AD0: .word ov83_022485E8
	thumb_func_end ov83_02247A7C

	thumb_func_start ov83_02247AD4
ov83_02247AD4: ; 0x02247AD4
	push {r3, lr}
	bl sub_02019BE4
	add r1, r0, #4
	cmp r1, #3
	bhi _02247AF6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02247AEC: ; jump table
	.short _02247AF4 - _02247AEC - 2 ; case 0
	.short _02247AF4 - _02247AEC - 2 ; case 1
	.short _02247AF4 - _02247AEC - 2 ; case 2
	.short _02247AF4 - _02247AEC - 2 ; case 3
_02247AF4:
	pop {r3, pc}
_02247AF6:
	lsl r1, r0, #2
	ldr r0, _02247B00 ; =ov83_02248544
	ldr r0, [r0, r1]
	pop {r3, pc}
	nop
_02247B00: .word ov83_02248544
	thumb_func_end ov83_02247AD4

	thumb_func_start ov83_02247B04
ov83_02247B04: ; 0x02247B04
	push {r4, lr}
	add r4, r0, #0
	bl sub_02019F74
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	add r3, r2, #0
	bl sub_02019F88
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov83_02247B04

	thumb_func_start ov83_02247B1C
ov83_02247B1C: ; 0x02247B1C
	ldr r3, _02247B2C ; =ov83_02248544
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B30 ; =ov83_02242AB4
	bx r3
	nop
_02247B2C: .word ov83_02248544
_02247B30: .word ov83_02242AB4
	thumb_func_end ov83_02247B1C

	thumb_func_start ov83_02247B34
ov83_02247B34: ; 0x02247B34
	ldr r3, _02247B44 ; =ov83_02248544
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B48 ; =ov83_02242AB4
	bx r3
	nop
_02247B44: .word ov83_02248544
_02247B48: .word ov83_02242AB4
	thumb_func_end ov83_02247B34

	thumb_func_start ov83_02247B4C
ov83_02247B4C: ; 0x02247B4C
	ldr r3, _02247B5C ; =ov83_02248544
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B60 ; =ov83_022469D8
	bx r3
	nop
_02247B5C: .word ov83_02248544
_02247B60: .word ov83_022469D8
	thumb_func_end ov83_02247B4C

	thumb_func_start ov83_02247B64
ov83_02247B64: ; 0x02247B64
	ldr r3, _02247B74 ; =ov83_02248544
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B78 ; =ov83_022469D8
	bx r3
	nop
_02247B74: .word ov83_02248544
_02247B78: .word ov83_022469D8
	thumb_func_end ov83_02247B64

	thumb_func_start ov83_02247B7C
ov83_02247B7C: ; 0x02247B7C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247BB8 ; =ov83_022485C8
	ldr r1, _02247BBC ; =ov83_02248610
	ldr r2, _02247BC0 ; =ov83_02248520
	add r3, r4, #0
	bl sub_02019BA4
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x40
	mov r2, #0x34
	mov r3, #3
	bl ov83_02242AC0
	add r0, r4, #0
	mov r1, #0
	bl ov83_02242AE0
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02247BB8: .word ov83_022485C8
_02247BBC: .word ov83_02248610
_02247BC0: .word ov83_02248520
	thumb_func_end ov83_02247B7C

	thumb_func_start ov83_02247BC4
ov83_02247BC4: ; 0x02247BC4
	push {r4, lr}
	add r4, r0, #0
	bl sub_02019BE4
	add r1, r0, #4
	cmp r1, #3
	bhi _02247C28
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02247BDE: ; jump table
	.short _02247BE6 - _02247BDE - 2 ; case 0
	.short _02247BE6 - _02247BDE - 2 ; case 1
	.short _02247BE6 - _02247BDE - 2 ; case 2
	.short _02247BE8 - _02247BDE - 2 ; case 3
_02247BE6:
	pop {r4, pc}
_02247BE8:
	ldr r0, _02247C4C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x20
	tst r0, r1
	beq _02247C08
	add r0, r4, #0
	bl sub_02019F74
	cmp r0, #0
	beq _02247C04
	cmp r0, #2
	beq _02247C04
	cmp r0, #4
	bne _02247C08
_02247C04:
	mov r0, #6
	pop {r4, pc}
_02247C08:
	ldr r0, _02247C4C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x10
	tst r0, r1
	beq _02247C30
	add r0, r4, #0
	bl sub_02019F74
	cmp r0, #1
	beq _02247C24
	cmp r0, #3
	beq _02247C24
	cmp r0, #5
	bne _02247C30
_02247C24:
	mov r0, #7
	pop {r4, pc}
_02247C28:
	lsl r1, r0, #2
	ldr r0, _02247C50 ; =ov83_0224858C
	ldr r0, [r0, r1]
	pop {r4, pc}
_02247C30:
	ldr r0, _02247C54 ; =ov83_022484F4
	bl sub_02025224
	cmp r0, #0
	bne _02247C3E
	mov r0, #6
	pop {r4, pc}
_02247C3E:
	cmp r0, #1
	bne _02247C46
	mov r0, #7
	pop {r4, pc}
_02247C46:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_02247C4C: .word gSystem
_02247C50: .word ov83_0224858C
_02247C54: .word ov83_022484F4
	thumb_func_end ov83_02247BC4

	thumb_func_start ov83_02247C58
ov83_02247C58: ; 0x02247C58
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, _02247C7C ; =ov83_02248610
	lsl r3, r4, #3
	ldr r2, _02247C80 ; =ov83_02248611
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r3, _02247C84 ; =ov83_02248570
	lsl r6, r4, #2
	ldr r3, [r3, r6]
	add r5, r0, #0
	bl ov83_02242AC0
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02242AE0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02247C7C: .word ov83_02248610
_02247C80: .word ov83_02248611
_02247C84: .word ov83_02248570
	thumb_func_end ov83_02247C58

	thumb_func_start ov83_02247C88
ov83_02247C88: ; 0x02247C88
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, _02247CAC ; =ov83_02248610
	lsl r3, r4, #3
	ldr r2, _02247CB0 ; =ov83_02248611
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r3, _02247CB4 ; =ov83_02248570
	lsl r6, r4, #2
	ldr r3, [r3, r6]
	add r5, r0, #0
	bl ov83_02242AC0
	add r0, r5, #0
	add r1, r4, #0
	bl ov83_02242AE0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02247CAC: .word ov83_02248610
_02247CB0: .word ov83_02248611
_02247CB4: .word ov83_02248570
	thumb_func_end ov83_02247C88

	thumb_func_start ov83_02247CB8
ov83_02247CB8: ; 0x02247CB8
	ldr r3, _02247CC0 ; =sub_02018424
	mov r0, #0x6b
	bx r3
	nop
_02247CC0: .word sub_02018424
	thumb_func_end ov83_02247CB8

	thumb_func_start ov83_02247CC4
ov83_02247CC4: ; 0x02247CC4
	ldr r3, _02247CC8 ; =sub_02018474
	bx r3
	.balign 4, 0
_02247CC8: .word sub_02018474
	thumb_func_end ov83_02247CC4

	thumb_func_start ov83_02247CCC
ov83_02247CCC: ; 0x02247CCC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	str r3, [sp]
	add r2, sp, #8
	ldrb r2, [r2, #0x10]
	add r3, r4, #0
	str r2, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	bl sub_020185FC
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov83_02247CCC

	thumb_func_start ov83_02247CE8
ov83_02247CE8: ; 0x02247CE8
	ldr r3, _02247CEC ; =sub_02018680
	bx r3
	.balign 4, 0
_02247CEC: .word sub_02018680
	thumb_func_end ov83_02247CE8

	thumb_func_start ov83_02247CF0
ov83_02247CF0: ; 0x02247CF0
	push {r3, lr}
	ldr r0, _02247D08 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _02247D00
	mov r0, #1
	pop {r3, pc}
_02247D00:
	bl System_GetTouchNew
	pop {r3, pc}
	nop
_02247D08: .word gSystem
	thumb_func_end ov83_02247CF0

	.rodata

_02247D0C:
	.byte 0x22, 0x00, 0x23, 0x00
	.byte 0x24, 0x00

ov83_02247D12: ; 0x02247D12
	.byte 0x08, 0x00, 0x08, 0x00, 0x20, 0x00

ov83_02247D18: ; 0x02247D18
	.byte 0x0A, 0x00, 0x08, 0x00, 0x0C, 0x00

ov83_02247D1E: ; 0x02247D1E
	.byte 0x0E, 0x00
	.byte 0x0F, 0x00, 0x12, 0x00

ov83_02247D24: ; 0x02247D24
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x1B, 0x00, 0x03, 0x00, 0x00, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247D38: ; 0x02247D38
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247D48: ; 0x02247D48
	.byte 0x00, 0x00, 0x64, 0x00, 0x64, 0x00

ov83_02247D4E: ; 0x02247D4E
	.byte 0x00, 0x00
	.byte 0x64, 0x00, 0x96, 0x00, 0x00, 0x00, 0x32, 0x00, 0x32, 0x00

ov83_02247D5A: ; 0x02247D5A
	.byte 0x00, 0x00, 0x2A, 0x00, 0x2B, 0x00
	.byte 0x00, 0x00, 0x44, 0x00, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247D6C: ; 0x02247D6C
	.byte 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0xFE, 0xFF, 0xFF, 0xFF

ov83_02247D84: ; 0x02247D84
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247DA0: ; 0x02247DA0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247DBC: ; 0x02247DBC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247DD8: ; 0x02247DD8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov83_02247DF4: ; 0x02247DF4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247E10: ; 0x02247E10
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247E2C: ; 0x02247E2C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_02247E48: ; 0x02247E48
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov83_02247E64: ; 0x02247E64
	.byte 0x00, 0x04, 0x10, 0x05, 0x10, 0x04, 0x10, 0x05, 0x00, 0x09, 0x10, 0x05
	.byte 0x10, 0x09, 0x10, 0x05, 0x00, 0x0E, 0x10, 0x05, 0x10, 0x0E, 0x10, 0x05, 0x00, 0x14, 0x04, 0x04
	.byte 0x06, 0x14, 0x04, 0x04, 0x19, 0x14, 0x07, 0x04

ov83_02247E88: ; 0x02247E88
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov83_02247EB0: ; 0x02247EB0
	.byte 0x01, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov83_02247EE0: ; 0x02247EE0
	.byte 0xDD, 0x00, 0xD9, 0x00, 0x0F, 0x01, 0xFD, 0x00, 0x15, 0x01, 0x0D, 0x01, 0x1E, 0x01, 0x28, 0x01
	.byte 0x10, 0x01, 0x11, 0x01, 0xEC, 0x00, 0x02, 0x01, 0xD6, 0x00, 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00
	.byte 0xD5, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0xDC, 0x00, 0x29, 0x01, 0x1F, 0x01, 0x0A, 0x01
	.byte 0x0B, 0x01, 0x0C, 0x01, 0x0E, 0x01

ov83_02247F16: ; 0x02247F16
	.byte 0x0A, 0x00, 0x0F, 0x00, 0x05, 0x00, 0x0F, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x05, 0x00
	.byte 0x0F, 0x00, 0x0A, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00
	.byte 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00

ov83_02247F4C: ; 0x02247F4C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov83_02247F88: ; 0x02247F88
	.byte 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x9C, 0x00, 0x9D, 0x00, 0x9E, 0x00, 0xC9, 0x00, 0xCA, 0x00, 0xCB, 0x00, 0xCC, 0x00
	.byte 0xCD, 0x00, 0xCE, 0x00, 0xCF, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00
	.byte 0xBD, 0x00, 0xBE, 0x00, 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00
	.byte 0xC5, 0x00, 0xC6, 0x00, 0xC7, 0x00, 0xC8, 0x00

ov83_02247FC8: ; 0x02247FC8
	.byte 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00
	.byte 0x02, 0x00, 0x02, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00

ov83_02248008: ; 0x02248008
	.byte 0x12, 0x0E, 0x0B, 0x08, 0x05, 0x02, 0x00, 0x00

ov83_02248010: ; 0x02248010
	.byte 0x12, 0x0E, 0x0B, 0x08, 0x05, 0x02, 0x00, 0x00

ov83_02248018: ; 0x02248018
	.byte 0x03, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov83_02248024: ; 0x02248024
	.byte 0x25, 0x00, 0x25, 0x00

ov83_02248028: ; 0x02248028
	.byte 0x26, 0x00, 0x26, 0x00

ov83_0224802C: ; 0x0224802C
	.byte 0x27, 0x00, 0x28, 0x00

ov83_02248030: ; 0x02248030
	.byte 0x29, 0x00, 0x29, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00

ov83_02248044: ; 0x02248044
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov83_02248054: ; 0x02248054
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x5F, 0x00, 0x5F, 0x00, 0x00, 0x00

ov83_02248068: ; 0x02248068
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov83_02248084: ; 0x02248084
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_022480A0: ; 0x022480A0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_022480BC: ; 0x022480BC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x02
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov83_022480D8: ; 0x022480D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov83_022480F4: ; 0x022480F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0x21, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov83_02248150: ; 0x02248150
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov83_02248178: ; 0x02248178
	.byte 0x0E, 0x0E, 0x0E, 0x0E

ov83_0224817C: ; 0x0224817C
	.byte 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00

ov83_0224818C: ; 0x0224818C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov83_0224819C: ; 0x0224819C
	.word ov83_022482C4
	.byte 0x46, 0x00, 0x00, 0x00
	.word ov83_022481AC
	.byte 0x23, 0x00, 0x00, 0x00

ov83_022481AC:
	.byte 0x01, 0x01, 0x01, 0x1E
	.byte 0x02, 0x0E, 0x01, 0x00, 0x01, 0x1A, 0x13, 0x04, 0x03, 0x0E, 0x3D, 0x00, 0x01, 0x00, 0x04, 0x20
	.byte 0x02, 0x0E, 0x49, 0x00, 0x01, 0x00, 0x09, 0x20, 0x02, 0x0E, 0x89, 0x00, 0x00, 0x04, 0x0A, 0x1A
	.byte 0x0E, 0x0E, 0x01, 0x00, 0x00, 0x17, 0x0F, 0x08, 0x08, 0x0E, 0x01, 0x00, 0x00, 0x16, 0x09, 0x09
	.byte 0x08, 0x0E, 0x6D, 0x01, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0xB5, 0x01, 0x00, 0x02, 0x13, 0x14
	.byte 0x04, 0x0D, 0x21, 0x02, 0x00, 0x02, 0x13, 0x11, 0x04, 0x0D, 0x71, 0x02, 0x00, 0x18, 0x0D, 0x07
	.byte 0x04, 0x0E, 0xB5, 0x02, 0x00, 0x18, 0x0B, 0x07, 0x06, 0x0E, 0xD1, 0x02, 0x05, 0x0D, 0x01, 0x08
	.byte 0x02, 0x0F, 0xF0, 0x03, 0x05, 0x15, 0x01, 0x01, 0x02, 0x0F, 0xEE, 0x03, 0x05, 0x17, 0x01, 0x03
	.byte 0x02, 0x0F, 0xE8, 0x03, 0x05, 0x1A, 0x01, 0x03, 0x02, 0x0F, 0xE2, 0x03, 0x05, 0x0D, 0x04, 0x07
	.byte 0x02, 0x0F, 0xD4, 0x03, 0x05, 0x14, 0x04, 0x0B, 0x02, 0x0F, 0xBE, 0x03, 0x05, 0x0D, 0x07, 0x06
	.byte 0x02, 0x0F, 0xB2, 0x03, 0x05, 0x14, 0x07, 0x08, 0x02, 0x0F, 0xA2, 0x03, 0x05, 0x0D, 0x0A, 0x06
	.byte 0x02, 0x0F, 0x96, 0x03, 0x05, 0x13, 0x0A, 0x0C, 0x02, 0x0F, 0x7E, 0x03, 0x05, 0x01, 0x0B, 0x02
	.byte 0x02, 0x0F, 0x7A, 0x03, 0x05, 0x04, 0x0B, 0x07, 0x02, 0x0F, 0x6C, 0x03, 0x05, 0x01, 0x0D, 0x06
	.byte 0x02, 0x0F, 0x58, 0x03, 0x05, 0x08, 0x0D, 0x03, 0x02, 0x0F, 0x52, 0x03, 0x05, 0x01, 0x11, 0x07
	.byte 0x02, 0x0F, 0x44, 0x03, 0x05, 0x08, 0x11, 0x03, 0x02, 0x0F, 0x3E, 0x03, 0x05, 0x01, 0x0F, 0x06
	.byte 0x02, 0x0F, 0x32, 0x03, 0x05, 0x08, 0x0F, 0x03, 0x02, 0x0F, 0x2C, 0x03, 0x05, 0x01, 0x13, 0x07
	.byte 0x02, 0x0F, 0x1E, 0x03, 0x05, 0x08, 0x13, 0x03, 0x02, 0x0F, 0x18, 0x03, 0x05, 0x01, 0x15, 0x06
	.byte 0x02, 0x0F, 0x0C, 0x03, 0x05, 0x08, 0x15, 0x03, 0x02, 0x0F, 0x06, 0x03, 0x05, 0x0D, 0x0E, 0x12
	.byte 0x08, 0x0F, 0x76, 0x02

ov83_022482C4:
	.byte 0x01, 0x01, 0x01, 0x1E, 0x02, 0x0E, 0x01, 0x00, 0x01, 0x1A, 0x13, 0x04
	.byte 0x03, 0x0E, 0x3D, 0x00, 0x01, 0x00, 0x04, 0x20, 0x02, 0x0E, 0x49, 0x00, 0x01, 0x00, 0x09, 0x20
	.byte 0x02, 0x0E, 0x89, 0x00, 0x00, 0x05, 0x0A, 0x18, 0x0E, 0x0E, 0x01, 0x00, 0x00, 0x0C, 0x02, 0x13
	.byte 0x0C, 0x0E, 0x01, 0x00, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0xEF, 0x01, 0x00, 0x02, 0x13, 0x14
	.byte 0x04, 0x0D, 0x5B, 0x02, 0x00, 0x02, 0x13, 0x11, 0x04, 0x0D, 0xAB, 0x02, 0x00, 0x17, 0x11, 0x08
	.byte 0x06, 0x0E, 0xEF, 0x02, 0x00, 0x14, 0x07, 0x0B, 0x0A, 0x0E, 0x1F, 0x03, 0x00, 0x16, 0x09, 0x09
	.byte 0x08, 0x0E, 0x1F, 0x03, 0x00, 0x07, 0x11, 0x17, 0x06, 0x0D, 0x5B, 0x02, 0x00, 0x18, 0x0D, 0x07
	.byte 0x04, 0x0E, 0xE5, 0x02, 0x00, 0x18, 0x0B, 0x07, 0x06, 0x0E, 0x01, 0x03, 0x00, 0x01, 0x01, 0x08
	.byte 0x04, 0x0E, 0x2B, 0x03, 0x00, 0x01, 0x07, 0x0A, 0x02, 0x0E, 0x4B, 0x03, 0x00, 0x01, 0x0D, 0x0B
	.byte 0x02, 0x0E, 0x5F, 0x03, 0x05, 0x0D, 0x01, 0x08, 0x02, 0x0F, 0xF0, 0x03, 0x05, 0x15, 0x01, 0x01
	.byte 0x02, 0x0F, 0xEE, 0x03, 0x05, 0x17, 0x01, 0x03, 0x02, 0x0F, 0xE8, 0x03, 0x05, 0x1A, 0x01, 0x03
	.byte 0x02, 0x0F, 0xE2, 0x03, 0x05, 0x0D, 0x04, 0x07, 0x02, 0x0F, 0xD4, 0x03, 0x05, 0x14, 0x04, 0x0B
	.byte 0x02, 0x0F, 0xBE, 0x03, 0x05, 0x0D, 0x07, 0x06, 0x02, 0x0F, 0xB2, 0x03, 0x05, 0x14, 0x07, 0x08
	.byte 0x02, 0x0F, 0xA2, 0x03, 0x05, 0x0D, 0x0A, 0x06, 0x02, 0x0F, 0x96, 0x03, 0x05, 0x13, 0x0A, 0x0C
	.byte 0x02, 0x0F, 0x7E, 0x03, 0x05, 0x01, 0x0B, 0x02, 0x02, 0x0F, 0x7A, 0x03, 0x05, 0x04, 0x0B, 0x07
	.byte 0x02, 0x0F, 0x6C, 0x03, 0x05, 0x01, 0x0D, 0x06, 0x02, 0x0F, 0x58, 0x03, 0x05, 0x08, 0x0D, 0x03
	.byte 0x02, 0x0F, 0x52, 0x03, 0x05, 0x01, 0x11, 0x07, 0x02, 0x0F, 0x44, 0x03, 0x05, 0x08, 0x11, 0x03
	.byte 0x02, 0x0F, 0x3E, 0x03, 0x05, 0x01, 0x0F, 0x06, 0x02, 0x0F, 0x32, 0x03, 0x05, 0x08, 0x0F, 0x03
	.byte 0x02, 0x0F, 0x2C, 0x03, 0x05, 0x01, 0x13, 0x07, 0x02, 0x0F, 0x1E, 0x03, 0x05, 0x08, 0x13, 0x03
	.byte 0x02, 0x0F, 0x18, 0x03, 0x05, 0x01, 0x15, 0x07, 0x02, 0x0F, 0x0A, 0x03, 0x05, 0x08, 0x15, 0x03
	.byte 0x02, 0x0F, 0x04, 0x03, 0x05, 0x0D, 0x0E, 0x0B, 0x02, 0x0F, 0xEE, 0x02, 0x05, 0x0D, 0x10, 0x0B
	.byte 0x02, 0x0F, 0xD8, 0x02, 0x05, 0x0D, 0x12, 0x0B, 0x02, 0x0F, 0xC2, 0x02, 0x05, 0x0D, 0x14, 0x0B
	.byte 0x02, 0x0F, 0xAC, 0x02, 0x05, 0x1A, 0x0E, 0x05, 0x02, 0x0F, 0xA2, 0x02, 0x05, 0x1A, 0x10, 0x05
	.byte 0x02, 0x0F, 0x98, 0x02, 0x05, 0x1A, 0x12, 0x05, 0x02, 0x0F, 0x8E, 0x02, 0x05, 0x1A, 0x14, 0x05
	.byte 0x02, 0x0F, 0x84, 0x02, 0x00, 0x03, 0x04, 0x0D, 0x05, 0x0E, 0x01, 0x00, 0x00, 0x13, 0x04, 0x0D
	.byte 0x05, 0x0E, 0x42, 0x00, 0x00, 0x03, 0x09, 0x0D, 0x05, 0x0E, 0x83, 0x00, 0x00, 0x13, 0x09, 0x0D
	.byte 0x05, 0x0E, 0xC4, 0x00, 0x00, 0x03, 0x0E, 0x0D, 0x05, 0x0E, 0x05, 0x01, 0x00, 0x13, 0x0E, 0x0D
	.byte 0x05, 0x0E, 0x46, 0x01, 0x00, 0x0A, 0x08, 0x0C, 0x02, 0x0E, 0x87, 0x01, 0x00, 0x16, 0x08, 0x05
	.byte 0x02, 0x0E, 0x9F, 0x01, 0x00, 0x0E, 0x15, 0x04, 0x02, 0x0E, 0xA9, 0x01, 0x00, 0x1A, 0x15, 0x05
	.byte 0x02, 0x0E, 0xB1, 0x01, 0x00, 0x02, 0x01, 0x0C, 0x02, 0x0E, 0xBB, 0x01, 0x00, 0x10, 0x01, 0x08
	.byte 0x02, 0x0E, 0xD3, 0x01, 0x00, 0x18, 0x01, 0x06, 0x02, 0x0E, 0xE3, 0x01, 0x07, 0x04, 0x11, 0x1B
	.byte 0x06, 0x0F, 0x5E, 0x03, 0x07, 0x0D, 0x05, 0x08, 0x02, 0x0F, 0x4E, 0x03, 0x07, 0x15, 0x05, 0x01
	.byte 0x02, 0x0F, 0x4C, 0x03, 0x07, 0x17, 0x05, 0x03, 0x02, 0x0F, 0x46, 0x03, 0x07, 0x1A, 0x05, 0x03
	.byte 0x02, 0x0F, 0x40, 0x03, 0x07, 0x0D, 0x08, 0x02, 0x02, 0x0F, 0x3C, 0x03, 0x07, 0x10, 0x08, 0x08
	.byte 0x02, 0x0F, 0x2C, 0x03, 0x07, 0x0D, 0x0B, 0x06, 0x02, 0x0F, 0x20, 0x03, 0x07, 0x13, 0x0B, 0x0C
	.byte 0x02, 0x0F, 0x08, 0x03

ov83_022484F4: ; 0x022484F4
	.byte 0xA0, 0xBF, 0x00, 0x27, 0xA0, 0xBF, 0x28, 0x4F, 0xFF, 0x00, 0x00, 0x00

ov83_02248500: ; 0x02248500
	.word ov83_02247A20
	.word ov83_02247A20
	.word ov83_02247B1C
	.word ov83_02247B34

ov83_02248510: ; 0x02248510
	.word ov83_02247A20
	.word ov83_02247A20
	.word ov83_02247B4C
	.word ov83_02247B64

ov83_02248520: ; 0x02248520
	.word ov83_02247A20
	.word ov83_02247A20
	.word ov83_02247C58
	.word ov83_02247C88

ov83_02248530: ; 0x02248530
	.byte 0x98, 0xAF, 0xC8, 0xF7, 0x20, 0x4F, 0x20, 0x5F, 0x20, 0x4F, 0x60, 0x9F, 0x20, 0x4F, 0xA0, 0xDF
	.byte 0xFF, 0x00, 0x00, 0x00

ov83_02248544: ; 0x02248544
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov83_02248558: ; 0x02248558
	.byte 0x98, 0xAF, 0xC8, 0xF7, 0x20, 0x4F, 0x00, 0x3F
	.byte 0x20, 0x4F, 0x40, 0x7F, 0x20, 0x4F, 0x80, 0xBF, 0x20, 0x4F, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov83_02248570: ; 0x02248570
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00

ov83_0224858C: ; 0x0224858C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00

ov83_022485A8: ; 0x022485A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x03
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x01

ov83_022485C8: ; 0x022485C8
	.byte 0x20, 0x47, 0x00, 0x7F, 0x20, 0x47, 0x80, 0xFF
	.byte 0x48, 0x6F, 0x00, 0x7F, 0x48, 0x6F, 0x80, 0xFF, 0x70, 0x97, 0x00, 0x7F, 0x70, 0x97, 0x80, 0xFF
	.byte 0xA0, 0xBF, 0xC8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov83_022485E8: ; 0x022485E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x03
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x03, 0x01

ov83_02248610: ; 0x02248610
	.byte 0x40

ov83_02248611: ; 0x02248611
	.byte 0x34, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0xC0, 0x34, 0x00, 0x00, 0x01, 0x03, 0x00, 0x01
	.byte 0x40, 0x5C, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03, 0xC0, 0x5C, 0x00, 0x00, 0x01, 0x05, 0x02, 0x03
	.byte 0x40, 0x84, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xC0, 0x84, 0x00, 0x00, 0x03, 0x06, 0x04, 0x05
	.byte 0xE4, 0xB0, 0x00, 0x00, 0x85, 0x06, 0x06, 0x06
	; 0x02248648
