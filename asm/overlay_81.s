	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov81_0223DD60
ov81_0223DD60: ; 0x0223DD60
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, _0223DE90 ; =FS_OVERLAY_ID(OVY_80)
	mov r1, #2
	bl HandleLoadOverlay
	bl ov81_02240D2C
	mov r0, #3
	mov r1, #0x64
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r1, _0223DE94 ; =0x0000048C
	add r0, r5, #0
	mov r2, #0x64
	bl OverlayManager_CreateAndGetData
	ldr r2, _0223DE94 ; =0x0000048C
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r2, #2
	mov r1, #0
	ldr r0, _0223DE98 ; =ov81_02242BC8
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0x64
	add r3, r1, #0
	bl GF_3DVramMan_Create
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x64
	bl BgConfig_Alloc
	str r0, [r4, #0x4c]
	str r5, [r4]
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	mov r3, #0x6f
	mov r2, #0xf
	ldr r1, [r0]
	lsl r3, r3, #2
	str r1, [r4, r3]
	ldrb r1, [r0, #4]
	lsl r2, r2, #6
	strb r1, [r4, #9]
	ldrb r1, [r0, #5]
	strb r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	strb r1, [r4, #0xb]
	ldr r1, [r0, #8]
	str r1, [r4, r2]
	ldr r5, [r0, #0xc]
	add r1, r2, #4
	str r5, [r4, r1]
	add r0, #0x10
	add r2, #0x14
	str r0, [r4, r2]
	ldr r0, [r4, r3]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0x6e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #8
	str r0, [r4, #0x14]
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223DE10
	mov r0, #6
	strb r0, [r4, #0x12]
	add r0, r4, #0
	mov r1, #0
	bl ov81_02243240
	ldr r1, _0223DE9C ; =0x00000464
	str r0, [r4, r1]
	b _0223DE4C
_0223DE10:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223DE34
	mov r0, #2
	strb r0, [r4, #0x12]
	mov r0, #3
	strb r0, [r4, #0x1a]
	mov r0, #6
	strb r0, [r4, #0x1b]
	add r0, r4, #0
	mov r1, #0
	bl ov81_022432DC
	ldr r1, _0223DE9C ; =0x00000464
	str r0, [r4, r1]
	b _0223DE4C
_0223DE34:
	mov r0, #3
	strb r0, [r4, #0x12]
	mov r0, #4
	strb r0, [r4, #0x1a]
	mov r0, #5
	strb r0, [r4, #0x1b]
	add r0, r4, #0
	mov r1, #0
	bl ov81_022432AC
	ldr r1, _0223DE9C ; =0x00000464
	str r0, [r4, r1]
_0223DE4C:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223DE5A
	mov r1, #2
	b _0223DE5C
_0223DE5A:
	mov r1, #3
_0223DE5C:
	ldr r0, _0223DEA0 ; =0x0000047C
	str r1, [r4, r0]
	ldr r0, _0223DEA4 ; =0x0000046C
	add r0, r4, r0
	bl ov81_02241BB8
	add r0, r4, #0
	bl ov81_02240D64
	mov r0, #1
	bl sub_02002B8C
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223DE84
	add r0, r4, #0
	bl sub_02096910
_0223DE84:
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0223DE90: .word FS_OVERLAY_ID(OVY_80)
_0223DE94: .word 0x0000048C
_0223DE98: .word ov81_02242BC8
_0223DE9C: .word 0x00000464
_0223DEA0: .word 0x0000047C
_0223DEA4: .word 0x0000046C
	thumb_func_end ov81_0223DD60

	thumb_func_start ov81_0223DEA8
ov81_0223DEA8: ; 0x0223DEA8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, _0223E1A0 ; =0x00000458
	add r4, r0, #0
	ldrh r1, [r4, r1]
	cmp r1, #1
	bne _0223DEF0
	ldr r1, [r5]
	cmp r1, #9
	bhi _0223DEF0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223DECC: ; jump table
	.short _0223DEF0 - _0223DECC - 2 ; case 0
	.short _0223DEF0 - _0223DECC - 2 ; case 1
	.short _0223DEF0 - _0223DECC - 2 ; case 2
	.short _0223DEF0 - _0223DECC - 2 ; case 3
	.short _0223DEF0 - _0223DECC - 2 ; case 4
	.short _0223DEF0 - _0223DECC - 2 ; case 5
	.short _0223DEE0 - _0223DECC - 2 ; case 6
	.short _0223DEE0 - _0223DECC - 2 ; case 7
	.short _0223DEE0 - _0223DECC - 2 ; case 8
	.short _0223DEE0 - _0223DECC - 2 ; case 9
_0223DEE0:
	ldrb r1, [r4, #0x13]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	bne _0223DEF0
	add r1, r5, #0
	mov r2, #0xb
	bl ov81_022404AC
_0223DEF0:
	add r0, r4, #0
	bl ov81_02242514
	ldr r0, [r5]
	cmp r0, #0xe
	bhi _0223DF94
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223DF08: ; jump table
	.short _0223DF26 - _0223DF08 - 2 ; case 0
	.short _0223DF56 - _0223DF08 - 2 ; case 1
	.short _0223DF3C - _0223DF08 - 2 ; case 2
	.short _0223DF84 - _0223DF08 - 2 ; case 3
	.short _0223DFE6 - _0223DF08 - 2 ; case 4
	.short _0223E01A - _0223DF08 - 2 ; case 5
	.short _0223E030 - _0223DF08 - 2 ; case 6
	.short _0223E07A - _0223DF08 - 2 ; case 7
	.short _0223E0CC - _0223DF08 - 2 ; case 8
	.short _0223E12A - _0223DF08 - 2 ; case 9
	.short _0223E17C - _0223DF08 - 2 ; case 10
	.short _0223E1B6 - _0223DF08 - 2 ; case 11
	.short _0223E1E0 - _0223DF08 - 2 ; case 12
	.short _0223E1F6 - _0223DF08 - 2 ; case 13
	.short _0223E204 - _0223DF08 - 2 ; case 14
_0223DF26:
	add r0, r4, #0
	bl ov81_0223E318
	cmp r0, #1
	bne _0223DF94
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov81_022404AC
	b _0223E218
_0223DF3C:
	add r0, r4, #0
	bl ov81_0223EC88
	cmp r0, #1
	bne _0223DF52
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov81_022404AC
	b _0223DF56
_0223DF52:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223DF56:
	add r0, r4, #0
	bl ov81_0223E520
	cmp r0, #1
	bne _0223DF94
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223DF78
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov81_022404AC
	b _0223E218
_0223DF78:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #6
	bl ov81_022404AC
	b _0223E218
_0223DF84:
	add r0, r4, #0
	bl ov81_02241144
	add r0, r4, #0
	bl ov81_0223ECE4
	cmp r0, #1
	beq _0223DF96
_0223DF94:
	b _0223E218
_0223DF96:
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0223DFAC
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov81_022404AC
	b _0223E218
_0223DFAC:
	ldrb r0, [r4, #9]
	bl ov81_02240F18
	ldrb r1, [r4, #0x11]
	cmp r1, r0
	bne _0223DFC4
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov81_022404AC
	b _0223E218
_0223DFC4:
	add r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223DFDA
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223DFDA:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov81_022404AC
	b _0223E218
_0223DFE6:
	add r0, r4, #0
	bl ov81_02241144
	add r0, r4, #0
	bl ov81_0223F1A4
	cmp r0, #1
	bne _0223E0D6
	ldrb r0, [r4, #9]
	bl ov81_02240F18
	ldrb r1, [r4, #0x11]
	cmp r1, r0
	bne _0223E00E
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E00E:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #5
	bl ov81_022404AC
	b _0223E218
_0223E01A:
	add r0, r4, #0
	bl ov81_0223F314
	cmp r0, #1
	bne _0223E0D6
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov81_022404AC
	b _0223E218
_0223E030:
	add r0, r4, #0
	bl ov81_0223F38C
	cmp r0, #1
	bne _0223E0D6
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0223E050
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov81_022404AC
	b _0223E218
_0223E050:
	add r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E06E
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F38
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #7
	bl ov81_022404AC
	b _0223E218
_0223E06E:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xa
	bl ov81_022404AC
	b _0223E218
_0223E07A:
	add r0, r4, #0
	bl ov81_0223F6A8
	cmp r0, #1
	bne _0223E0D6
	add r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E0A2
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F38
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #6
	bl ov81_022404AC
	b _0223E218
_0223E0A2:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223E0C0
	ldrb r1, [r4, #0x13]
	mov r0, #8
	mov r2, #0xb
	bic r1, r0
	strb r1, [r4, #0x13]
	add r0, r4, #0
	add r1, r5, #0
	bl ov81_022404AC
	b _0223E218
_0223E0C0:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E0CC:
	add r0, r4, #0
	bl ov81_0223F770
	cmp r0, #1
	beq _0223E0D8
_0223E0D6:
	b _0223E218
_0223E0D8:
	add r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E0F6
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F38
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #9
	bl ov81_022404AC
	b _0223E218
_0223E0F6:
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _0223E108
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xa
	bl ov81_022404AC
	b _0223E218
_0223E108:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223E11E
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xb
	bl ov81_022404AC
	b _0223E218
_0223E11E:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E12A:
	add r0, r4, #0
	bl ov81_0223FBAC
	cmp r0, #1
	bne _0223E218
	add r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E152
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F38
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl ov81_022404AC
	b _0223E218
_0223E152:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223E170
	ldrb r1, [r4, #0x13]
	mov r0, #8
	mov r2, #0xb
	bic r1, r0
	strb r1, [r4, #0x13]
	add r0, r4, #0
	add r1, r5, #0
	bl ov81_022404AC
	b _0223E218
_0223E170:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E17C:
	add r0, r4, #0
	bl ov81_0223FC74
	cmp r0, #1
	bne _0223E218
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _0223E1A4
	add r0, r4, #0
	bl ov81_0223E8BC
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #6
	bl ov81_022404AC
	b _0223E218
	nop
_0223E1A0: .word 0x00000458
_0223E1A4:
	add r0, r4, #0
	bl ov81_0223EA98
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl ov81_022404AC
	b _0223E218
_0223E1B6:
	add r0, r4, #0
	bl ov81_02240008
	cmp r0, #1
	bne _0223E218
	ldr r0, _0223E230 ; =0x00000458
	ldrh r0, [r4, r0]
	cmp r0, #1
	bne _0223E1D4
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xe
	bl ov81_022404AC
	b _0223E218
_0223E1D4:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xc
	bl ov81_022404AC
	b _0223E218
_0223E1E0:
	add r0, r4, #0
	bl ov81_02240048
	cmp r0, #1
	bne _0223E218
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E1F6:
	add r0, r4, #0
	bl ov81_02240088
	cmp r0, #1
	bne _0223E218
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223E204:
	add r0, r4, #0
	bl ov81_022400D0
	cmp r0, #1
	bne _0223E218
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xc
	bl ov81_022404AC
_0223E218:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202457C
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242C48
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223E230: .word 0x00000458
	thumb_func_end ov81_0223DEA8

	thumb_func_start ov81_0223E234
ov81_0223E234: ; 0x0223E234
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0223E260
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200374C
	ldr r0, _0223E308 ; =0x00000478
	mov r1, #0xff
	str r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223E260:
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223E29A
	ldrb r0, [r4, #9]
	mov r7, #0
	bl ov81_02240F18
	cmp r0, #0
	ble _0223E2CE
	add r6, r4, #0
	add r5, r7, #0
_0223E27C:
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r1, [r6, r0]
	add r0, #0xc
	ldr r0, [r4, r0]
	add r6, r6, #2
	strh r1, [r0, r5]
	ldrb r0, [r4, #9]
	add r5, r5, #2
	add r7, r7, #1
	bl ov81_02240F18
	cmp r7, r0
	blt _0223E27C
	b _0223E2CE
_0223E29A:
	mov r7, #0xf2
	lsl r7, r7, #2
	mov r6, #0
	add r0, r7, #0
	add r3, r4, #0
	add r5, r6, #0
	add r0, #0xc
_0223E2A8:
	ldrh r2, [r3, r7]
	ldr r1, [r4, r0]
	add r6, r6, #1
	strh r2, [r1, r5]
	add r3, r3, #2
	add r5, r5, #2
	cmp r6, #2
	blt _0223E2A8
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _0223E2CE
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r2, #0xff
	strh r2, [r1]
	ldr r0, [r4, r0]
	strh r2, [r0, #2]
_0223E2CE:
	mov r0, #0
	bl sub_02002B8C
	ldr r0, _0223E30C ; =0x0000046C
	ldr r0, [r4, r0]
	bl ov81_02241BC8
	ldr r0, _0223E310 ; =0x00000464
	ldr r0, [r4, r0]
	bl ov81_02243220
	add r0, r4, #0
	bl ov81_02240BB0
	ldr r0, [sp]
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x64
	bl DestroyHeap
	ldr r0, _0223E314 ; =FS_OVERLAY_ID(OVY_80)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E308: .word 0x00000478
_0223E30C: .word 0x0000046C
_0223E310: .word 0x00000464
_0223E314: .word FS_OVERLAY_ID(OVY_80)
	thumb_func_end ov81_0223E234

	thumb_func_start ov81_0223E318
ov81_0223E318: ; 0x0223E318
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #6
	bhi _0223E3EE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E330: ; jump table
	.short _0223E33E - _0223E330 - 2 ; case 0
	.short _0223E35A - _0223E330 - 2 ; case 1
	.short _0223E382 - _0223E330 - 2 ; case 2
	.short _0223E3E6 - _0223E330 - 2 ; case 3
	.short _0223E402 - _0223E330 - 2 ; case 4
	.short _0223E450 - _0223E330 - 2 ; case 5
	.short _0223E46A - _0223E330 - 2 ; case 6
_0223E33E:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223E352
	bl sub_02037BEC
	mov r0, #0xed
	bl sub_02037AC0
_0223E352:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E35A:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223E37A
	mov r0, #0xed
	bl sub_02037B38
	cmp r0, #1
	bne _0223E3EE
	bl sub_02037BEC
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E37A:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E382:
	ldrb r0, [r4, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _0223E3AA
	mov r7, #0x36
	add r5, r4, #0
	lsl r7, r7, #4
_0223E390:
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242F30
	ldr r0, [r5, r7]
	bl ov81_02242F60
	ldrb r0, [r4, #0x12]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0223E390
_0223E3AA:
	mov r3, #0x42
	ldr r0, [r4, #0x4c]
	mov r1, #6
	mov r2, #0
	lsl r3, r3, #2
	bl BgSetPosTextAndCommit
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E3E6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0223E3F0
_0223E3EE:
	b _0223E508
_0223E3F0:
	ldr r0, _0223E510 ; =0x00000611
	bl PlaySE
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E402:
	bl ov81_022404B4
	cmp r0, #1
	bne _0223E508
	ldr r0, _0223E510 ; =0x00000611
	mov r1, #0
	bl StopSE
	ldr r0, _0223E514 ; =0x00000678
	bl PlaySE
	ldrb r0, [r4, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _0223E438
	mov r7, #0x36
	add r5, r4, #0
	lsl r7, r7, #4
_0223E426:
	ldr r0, [r5, r7]
	mov r1, #4
	bl ov81_02242F94
	ldrb r0, [r4, #0x12]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0223E426
_0223E438:
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240658
	mov r0, #8
	str r0, [r4, #0x14]
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E450:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov81_02242DD8
	cmp r0, #1
	beq _0223E508
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E46A:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _0223E4E2
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223E4A8
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldr r0, _0223E518 ; =0x0000FFFF
	mov r1, #0x10
	str r0, [sp]
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0
	mov r3, #1
	bl sub_020090E4
	b _0223E4E2
_0223E4A8:
	ldr r0, _0223E51C ; =0x0000047C
	mov r6, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0223E4CE
	ldr r7, _0223E51C ; =0x0000047C
	add r5, r4, #0
_0223E4B6:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, r7]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blo _0223E4B6
_0223E4CE:
	ldr r0, _0223E518 ; =0x0000FFFF
	mov r1, #0x10
	str r0, [sp]
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0
	mov r3, #1
	bl sub_020090E4
_0223E4E2:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02009138
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	blo _0223E508
	mov r0, #0
	strb r0, [r4, #0x19]
	add r0, r4, #0
	bl ov81_02241398
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223E508:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223E510: .word 0x00000611
_0223E514: .word 0x00000678
_0223E518: .word 0x0000FFFF
_0223E51C: .word 0x0000047C
	thumb_func_end ov81_0223E318

	thumb_func_start ov81_0223E520
ov81_0223E520: ; 0x0223E520
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223E532
	cmp r1, #1
	beq _0223E59E
	b _0223E5AC
_0223E532:
	mov r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223E544
	add r0, r4, #0
	bl ov81_0223E5B4
	b _0223E54A
_0223E544:
	add r0, r4, #0
	bl ov81_0223E8BC
_0223E54A:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223E56C
	mov r2, #0
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x60
	add r3, r2, #0
	str r2, [sp]
	bl ov81_0224093C
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
_0223E56C:
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0223E58E
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
_0223E58E:
	ldrb r1, [r4, #0x13]
	mov r0, #0x10
	orr r0, r1
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223E5AC
_0223E59E:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223E5AC
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0223E5AC:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov81_0223E520

	thumb_func_start ov81_0223E5B4
ov81_0223E5B4: ; 0x0223E5B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldrb r0, [r5, #9]
	bl ov80_02236DD4
	str r0, [sp, #0x18]
	add r0, r5, #0
	mov r1, #0
	bl ov81_02240F38
	add r0, r5, #0
	bl ov81_02241524
	ldr r1, _0223E864 ; =0x00000464
	add r2, sp, #0x28
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r3, sp, #0x24
	bl ov81_02243228
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x28]
	mov r2, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov81_02242D18
	mov r1, #0xe2
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, #0xdc
	ldr r0, [r5, r1]
	mov r1, #6
	add r2, sp, #0x28
	add r3, sp, #0x24
	bl ov81_02243228
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x28]
	mov r2, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov81_02242D18
	mov r1, #0xe3
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	add r1, sp, #0x28
	add r2, sp, #0x24
	bl ov81_02241CA0
	mov r2, #0
	str r2, [sp]
	ldr r0, [sp, #0x28]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	add r3, r2, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov81_02242CBC
	mov r1, #0x39
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov81_02241F50
	add r0, r5, #0
	bl ov81_02241FEC
	add r0, r5, #0
	bl ov81_022420B4
	add r0, r5, #0
	bl ov81_0224218C
	mov r2, #0
	str r2, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #4
	add r3, r2, #0
	bl ov81_02242D18
	mov r1, #0xe5
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #0
	str r2, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #5
	add r3, r2, #0
	bl ov81_02242D18
	mov r2, #0xe6
	lsl r2, r2, #2
	add r1, r2, #0
	str r0, [r5, r2]
	add r1, #0x28
	add r2, #0xd0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r0, r5, #0
	mov r3, #6
	bl ov81_02242218
	ldr r1, _0223E868 ; =0x00000468
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #6
	bl ov81_02242300
	ldr r0, _0223E86C ; =0x00000474
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #7
	add r3, r1, #0
	bl sub_020196E8
	mov r2, #0
	add r1, r5, #0
	str r2, [sp]
	add r0, r5, #0
	add r1, #0x50
	add r3, r2, #0
	bl ov81_022408C4
	ldrb r0, [r5, #0x11]
	mov r6, #0
	cmp r0, #0
	ble _0223E740
	mov r7, #0x36
	add r4, r5, #0
	lsl r7, r7, #4
_0223E6FA:
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F48
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov81_02242FB0
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	mov r1, #1
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, r7]
	bl ov81_02242F94
	ldrb r0, [r5, #0x11]
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, r0
	blt _0223E6FA
_0223E740:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	bl ov81_02243028
	ldrb r2, [r5, #0x11]
	add r0, r5, #0
	mov r1, #0
	add r2, r2, #1
	bl ov81_022408A0
	add r0, r5, #0
	mov r1, #0
	bl ov81_0224086C
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x13]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0223E85A
	add r0, r5, #0
	bl ov81_02241D0C
	str r0, [sp, #0x1c]
	ldrb r0, [r5, #0x11]
	mov r6, #0
	cmp r0, #0
	ble _0223E79E
	mov r7, #0x6b
	add r4, r5, #0
	lsl r7, r7, #2
_0223E78A:
	ldr r0, [r4, r7]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldrb r0, [r5, #0x11]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0223E78A
_0223E79E:
	ldr r0, [sp, #0x1c]
	mov r2, #0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #6
	bl sub_020087A4
	ldr r2, _0223E868 ; =0x00000468
	ldr r1, [sp, #0x1c]
	ldr r2, [r5, r2]
	add r0, r5, #0
	mov r3, #0
	bl ov81_02241E68
	add r0, r5, #0
	bl ov81_02241FEC
	ldr r1, _0223E870 ; =0x0000047C
	ldr r0, [sp, #0x1c]
	ldr r1, [r5, r1]
	add r2, sp, #0x28
	add r3, sp, #0x24
	bl ov81_02241C84
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	bl ov81_02242D94
	add r0, r5, #0
	mov r1, #0xff
	bl ov81_02240658
	add r0, r5, #0
	bl ov81_02241450
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _0223E860
	ldr r0, [sp, #0x18]
	mov r4, #0
	cmp r0, #0
	ble _0223E860
	add r7, r5, #0
	add r6, r5, #0
	add r7, #0x50
_0223E804:
	add r0, r4, #5
	lsl r0, r0, #4
	str r0, [sp, #0x20]
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0x18]
	cmp r4, r0
	bge _0223E844
	mov r0, #0xf
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0223E874 ; =0x0000045A
	ldr r1, [sp, #0x20]
	ldrh r0, [r6, r0]
	mov r2, #0
	add r1, r7, r1
	str r0, [sp, #0x10]
	ldr r0, _0223E878 ; =0x0000045E
	add r3, r2, #0
	ldrh r0, [r6, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ov81_02240AD8
_0223E844:
	ldr r0, [sp, #0x20]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, r0
	blt _0223E804
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_0223E85A:
	add r0, r5, #0
	bl ov81_022414E0
_0223E860:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E864: .word 0x00000464
_0223E868: .word 0x00000468
_0223E86C: .word 0x00000474
_0223E870: .word 0x0000047C
_0223E874: .word 0x0000045A
_0223E878: .word 0x0000045E
	thumb_func_end ov81_0223E5B4

	thumb_func_start ov81_0223E87C
ov81_0223E87C: ; 0x0223E87C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrb r0, [r6, #0x12]
	mov r4, #0
	cmp r0, #0
	ble _0223E8AE
	mov r7, #0x36
	add r5, r6, #0
	lsl r7, r7, #4
_0223E88E:
	add r0, r6, #0
	add r1, r4, #0
	bl ov81_022412C4
	mov r1, #0x36
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r7]
	mov r1, #1
	bl ov81_02242EB8
	ldrb r0, [r6, #0x12]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223E88E
_0223E8AE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_0223E87C

	thumb_func_start ov81_0223E8B0
ov81_0223E8B0: ; 0x0223E8B0
	ldr r3, _0223E8B8 ; =ov81_02241DDC
	mov r1, #0
	bx r3
	nop
_0223E8B8: .word ov81_02241DDC
	thumb_func_end ov81_0223E8B0

	thumb_func_start ov81_0223E8BC
ov81_0223E8BC: ; 0x0223E8BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0
	add r5, r0, #0
	bl ov81_02240F38
	ldr r1, _0223EA88 ; =0x00000464
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov81_02243370
	ldr r1, _0223EA88 ; =0x00000464
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov81_0224185C
	ldr r1, _0223EA88 ; =0x00000464
	add r2, sp, #0x10
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r3, sp, #0xc
	bl ov81_02243228
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov81_02242D18
	mov r1, #0xe2
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #0
	lsr r0, r1, #1
	str r2, [sp]
	str r2, [sp, #4]
	add r0, r5, r0
	mov r1, #1
	add r3, r2, #0
	str r2, [sp, #8]
	bl ov81_02242CBC
	mov r1, #0x39
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov81_02241D38
	ldr r0, _0223EA88 ; =0x00000464
	mov r1, #4
	ldr r0, [r5, r0]
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02243228
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov81_02242D18
	mov r1, #0xe3
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov81_02241F50
	add r0, r5, #0
	mov r1, #0
	bl ov81_02242058
	add r0, r5, #0
	bl ov81_022420B4
	mov r2, #0
	str r2, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #4
	add r3, r2, #0
	bl ov81_02242D18
	mov r1, #0xe5
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #0
	str r2, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #5
	add r3, r2, #0
	bl ov81_02242D18
	mov r2, #0xe6
	lsl r2, r2, #2
	add r1, r2, #0
	str r0, [r5, r2]
	add r1, #0x28
	add r2, #0xd0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r0, r5, #0
	mov r3, #4
	bl ov81_02242218
	mov r1, #0xf
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov81_022423D0
	ldr r0, _0223EA8C ; =0x00000474
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #7
	add r3, r1, #0
	bl sub_020196E8
	mov r2, #0
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x50
	add r3, r2, #0
	str r2, [sp]
	bl ov81_022408C4
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	bl ov81_02243028
	add r0, r5, #0
	mov r1, #9
	bl ov81_0224086C
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x13]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0223EA70
	ldr r0, _0223EA90 ; =0x0000047C
	mov r6, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	bls _0223EA38
	add r4, r5, #0
	add r7, r0, #0
_0223EA20:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldr r1, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r1
	blo _0223EA20
_0223EA38:
	ldr r0, _0223EA94 ; =0x00000468
	add r2, sp, #0x10
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl ov81_02241C84
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl ov81_02242D94
	add r0, r5, #0
	mov r1, #0xff
	bl ov81_02240658
	add r0, r5, #0
	bl ov81_0224174C
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242E08
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0223EA70:
	add r0, r5, #0
	bl ov81_022417B4
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242E08
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223EA88: .word 0x00000464
_0223EA8C: .word 0x00000474
_0223EA90: .word 0x0000047C
_0223EA94: .word 0x00000468
	thumb_func_end ov81_0223E8BC

	thumb_func_start ov81_0223EA98
ov81_0223EA98: ; 0x0223EA98
	push {r3, r4, lr}
	sub sp, #0x14
	ldr r1, _0223EBD8 ; =0x00000464
	add r4, r0, #0
	ldr r1, [r4, r1]
	bl ov81_02243398
	ldr r1, _0223EBD8 ; =0x00000464
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov81_02241A98
	ldr r0, _0223EBD8 ; =0x00000464
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02243228
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov81_02242D18
	mov r1, #0xe2
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0xe0
	add r1, #0xf4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02241C84
	mov r2, #0
	str r2, [sp]
	ldr r0, [sp, #0x10]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r3, r2, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov81_02242CBC
	mov r1, #0x39
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r1, #0xd4
	ldr r0, [r4, r1]
	mov r1, #6
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02243228
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov81_02242D18
	mov r1, #0xe3
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov81_02241F50
	add r0, r4, #0
	mov r1, #1
	bl ov81_02242058
	add r0, r4, #0
	bl ov81_022420B4
	mov r2, #0
	str r2, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #4
	add r3, r2, #0
	bl ov81_02242D18
	mov r1, #0xe5
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #0
	str r2, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #5
	add r3, r2, #0
	bl ov81_02242D18
	mov r1, #0xe6
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r1, #0x2c
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0
	mov r3, #4
	bl ov81_02242218
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242420
	ldr r0, _0223EBDC ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #7
	add r3, r1, #0
	bl sub_020196E8
	mov r2, #0
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x50
	add r3, r2, #0
	str r2, [sp]
	bl ov81_022408C4
	ldr r0, _0223EBE0 ; =0x00000468
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov81_022419E0
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0223EBD8: .word 0x00000464
_0223EBDC: .word 0x00000474
_0223EBE0: .word 0x00000468
	thumb_func_end ov81_0223EA98

	thumb_func_start ov81_0223EBE4
ov81_0223EBE4: ; 0x0223EBE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _0223EC40
	mov r7, #0x36
	add r4, r5, #0
	lsl r7, r7, #4
_0223EBF6:
	add r0, r5, #0
	add r1, r6, #0
	bl ov81_022412C4
	mov r1, #0x36
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r7]
	mov r1, #1
	bl ov81_02242EB8
	ldrb r0, [r5, #0x13]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _0223EC36
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F48
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242FB0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242F94
_0223EC36:
	ldrb r0, [r5, #0x12]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0223EBF6
_0223EC40:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_0223EBE4

	thumb_func_start ov81_0223EC44
ov81_0223EC44: ; 0x0223EC44
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #1
	add r6, r0, #0
	bl ov81_02241DDC
	ldr r0, _0223EC84 ; =0x0000047C
	mov r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _0223EC80
	ldr r7, _0223EC84 ; =0x0000047C
	add r5, r6, #0
_0223EC5C:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r4, #0
	mov r3, #1
	bl ov81_02241E68
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blo _0223EC5C
_0223EC80:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223EC84: .word 0x0000047C
	thumb_func_end ov81_0223EC44

	thumb_func_start ov81_0223EC88
ov81_0223EC88: ; 0x0223EC88
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0223ECDA
	ldr r0, [r4, #4]
	bl OverlayManager_run
	cmp r0, #1
	bne _0223ECDA
	mov r1, #7
	lsl r1, r1, #6
	ldr r0, [r4, r1]
	ldrb r2, [r0, #0x14]
	mov r0, #0xf6
	lsl r0, r0, #2
	str r2, [r4, r0]
	ldr r2, [r4, r1]
	add r0, #0x90
	ldrb r2, [r2, #0x14]
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl FreeToHeap
	ldr r0, [r4, #4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov81_02240CD4
	ldrb r1, [r4, #0x13]
	mov r0, #0x40
	bic r1, r0
	strb r1, [r4, #0x13]
	ldr r0, _0223ECE0 ; =0x00000478
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0223ECDA:
	mov r0, #0
	pop {r4, pc}
	nop
_0223ECE0: .word 0x00000478
	thumb_func_end ov81_0223EC88

	thumb_func_start ov81_0223ECE4
ov81_0223ECE4: ; 0x0223ECE4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #8
	bhi _0223ED5A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223ECFC: ; jump table
	.short _0223ED0E - _0223ECFC - 2 ; case 0
	.short _0223ED1C - _0223ECFC - 2 ; case 1
	.short _0223EE5E - _0223ECFC - 2 ; case 2
	.short _0223EE64 - _0223ECFC - 2 ; case 3
	.short _0223EEB6 - _0223ECFC - 2 ; case 4
	.short _0223EEC2 - _0223ECFC - 2 ; case 5
	.short _0223EED0 - _0223ECFC - 2 ; case 6
	.short _0223EEF6 - _0223ECFC - 2 ; case 7
	.short _0223EF38 - _0223ECFC - 2 ; case 8
_0223ED0E:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r1, [r4, #0x13]
	mov r0, #2
	bic r1, r0
	strb r1, [r4, #0x13]
	b _0223EF42
_0223ED1C:
	ldr r0, _0223EF48 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019BE4
	add r5, r0, #0
	mov r0, #2
	mvn r0, r0
	cmp r5, r0
	bhi _0223ED52
	bhs _0223EDDA
	cmp r5, #8
	bhi _0223ED5A
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223ED40: ; jump table
	.short _0223ED5C - _0223ED40 - 2 ; case 0
	.short _0223ED5C - _0223ED40 - 2 ; case 1
	.short _0223ED5C - _0223ED40 - 2 ; case 2
	.short _0223ED5C - _0223ED40 - 2 ; case 3
	.short _0223ED5C - _0223ED40 - 2 ; case 4
	.short _0223ED5C - _0223ED40 - 2 ; case 5
	.short _0223ED92 - _0223ED40 - 2 ; case 6
	.short _0223EDAA - _0223ED40 - 2 ; case 7
	.short _0223EDC2 - _0223ED40 - 2 ; case 8
_0223ED52:
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	beq _0223EE12
_0223ED5A:
	b _0223EF42
_0223ED5C:
	ldr r0, _0223EF4C ; =0x000005DC
	bl PlaySE
	ldr r0, _0223EF50 ; =0x00000468
	str r5, [r4, r0]
	add r0, r4, #0
	bl ov81_02241C0C
	mov r2, #0xf
	lsl r2, r2, #6
	ldr r1, [r4, r2]
	add r2, #0xa8
	ldr r2, [r4, r2]
	add r0, r4, #0
	mov r3, #6
	bl ov81_02242218
	ldr r1, _0223EF50 ; =0x00000468
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #6
	bl ov81_02242300
	add r0, r4, #0
	bl ov81_02241450
	b _0223EF42
_0223ED92:
	ldr r0, _0223EF4C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xc
	mov r3, #6
	bl ov81_022425C4
	mov r0, #2
	strb r0, [r4, #8]
	b _0223EF42
_0223EDAA:
	ldr r0, _0223EF4C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0xc
	mov r3, #7
	bl ov81_022425C4
	mov r0, #2
	strb r0, [r4, #8]
	b _0223EF42
_0223EDC2:
	ldr r0, _0223EF4C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0xf
	mov r3, #8
	bl ov81_022425C4
	mov r0, #2
	strb r0, [r4, #8]
	b _0223EF42
_0223EDDA:
	ldr r0, _0223EF4C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov81_02241C0C
	ldr r0, _0223EF48 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	mov r1, #0xf
	lsl r1, r1, #6
	add r2, r0, #0
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r3, #6
	bl ov81_02242218
	ldr r0, _0223EF48 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #6
	bl ov81_02242300
	b _0223EF42
_0223EE12:
	ldr r0, _0223EF48 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	cmp r0, #6
	blo _0223EE30
	ldr r0, _0223EF4C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov81_022414E0
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223EE30:
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _0223EE38
	b _0223EF42
_0223EE38:
	ldr r0, _0223EF4C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov81_0223EF5C
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223EE58
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov81_02240FA4
_0223EE58:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223EE5E:
	bl ov81_022425EC
	b _0223EF42
_0223EE64:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223EF42
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0223EE8C
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200374C
	ldr r0, _0223EF54 ; =0x00000478
	mov r1, #0xff
	str r1, [r4, r0]
	b _0223EF42
_0223EE8C:
	add r0, r4, #0
	bl ov81_02240E78
	add r0, r4, #0
	bl ov81_02240BB0
	mov r1, #7
	lsl r1, r1, #6
	ldr r0, _0223EF58 ; =_02103A1C
	ldr r1, [r4, r1]
	mov r2, #0x64
	bl OverlayManager_new
	str r0, [r4, #4]
	ldrb r1, [r4, #0x13]
	mov r0, #2
	add sp, #0xc
	orr r0, r1
	strb r0, [r4, #0x13]
	mov r0, #1
	pop {r4, r5, pc}
_0223EEB6:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0223EF42
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223EEC2:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223EF42
	mov r0, #1
	strb r0, [r4, #8]
	b _0223EF42
_0223EED0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r1, [r4, #0x13]
	mov r0, #0x40
	orr r0, r1
	strb r0, [r4, #0x13]
	mov r0, #3
	strb r0, [r4, #8]
	b _0223EF42
_0223EEF6:
	bl ov81_022414E0
	ldr r0, _0223EF50 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F40
	cmp r0, #0
	bne _0223EF18
	add r0, r4, #0
	bl ov81_0223F038
	b _0223EF1E
_0223EF18:
	add r0, r4, #0
	bl ov81_0223F0BC
_0223EF1E:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223EF32
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov81_02240FA4
_0223EF32:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223EF38:
	bl ov81_022414E0
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223EF42:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223EF48: .word 0x00000464
_0223EF4C: .word 0x000005DC
_0223EF50: .word 0x00000468
_0223EF54: .word 0x00000478
_0223EF58: .word _02103A1C
	thumb_func_end ov81_0223ECE4

	thumb_func_start ov81_0223EF5C
ov81_0223EF5C: ; 0x0223EF5C
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x11]
	mov r2, #1
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #6
	bl sub_020087A4
	ldrb r0, [r4, #0x11]
	add r1, r4, #0
	add r1, #0x50
	add r0, r0, #2
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0x11]
	add r1, r4, #0
	add r1, #0x50
	add r0, r0, #2
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldrb r0, [r4, #0x11]
	mov r1, #0
	sub r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r2, [r4, #0x11]
	add r0, r4, #0
	add r2, r2, #1
	bl ov81_022408A0
	add r0, r4, #0
	mov r1, #0
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x11]
	lsl r0, r0, #1
	add r1, r4, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	sub r0, #0x68
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r0, [r1, r0]
	bl ov81_02242F54
	ldrb r0, [r4, #0x11]
	lsl r0, r0, #1
	add r1, r4, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	sub r0, #0x68
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov81_02242FB0
	ldrb r0, [r4, #0x11]
	lsl r0, r0, #1
	add r1, r4, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	sub r0, #0x68
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov81_02242F94
	ldrb r0, [r4, #0x11]
	mov r2, #0
	lsl r0, r0, #1
	add r1, r4, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	strh r2, [r1, r0]
	add r0, r4, #0
	bl ov81_02241C0C
	add r0, r4, #0
	bl ov81_02241FEC
	add r0, r4, #0
	bl ov81_0224218C
	ldr r0, _0223F034 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #6
	bl ov81_02242300
	pop {r4, pc}
	nop
_0223F034: .word 0x00000464
	thumb_func_end ov81_0223EF5C

	thumb_func_start ov81_0223F038
ov81_0223F038: ; 0x0223F038
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0223F0B8 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F48
	ldr r0, _0223F0B8 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov81_02242FB0
	ldr r0, _0223F0B8 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov81_02242F94
	ldrb r1, [r4, #0x11]
	ldr r0, _0223F0B8 ; =0x00000468
	ldr r2, [r4, r0]
	lsl r1, r1, #1
	add r1, r4, r1
	sub r0, #0xa0
	strh r2, [r1, r0]
	ldrb r0, [r4, #0x11]
	add r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #9]
	ldrb r5, [r4, #0x11]
	bl ov81_02240F18
	cmp r5, r0
	beq _0223F0AA
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #1
	bl ov81_022408A0
	add r0, r4, #0
	mov r1, #0
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223F0AA:
	add r0, r4, #0
	bl ov81_02241FEC
	add r0, r4, #0
	bl ov81_0224218C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223F0B8: .word 0x00000468
	thumb_func_end ov81_0223F038

	thumb_func_start ov81_0223F0BC
ov81_0223F0BC: ; 0x0223F0BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0223F1A0 ; =0x00000468
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F54
	ldr r0, _0223F1A0 ; =0x00000468
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov81_02242FB0
	ldr r0, _0223F1A0 ; =0x00000468
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov81_02242F94
	ldrb r0, [r5, #0x11]
	cmp r0, #2
	blo _0223F130
	mov r2, #0xf2
	lsl r2, r2, #2
	add r0, r2, #0
	add r0, #0xa0
	ldrh r1, [r5, r2]
	ldr r0, [r5, r0]
	cmp r1, r0
	bne _0223F130
	add r0, r2, #2
	ldrh r0, [r5, r0]
	mov r1, #0
	add r3, r1, #0
	strh r0, [r5, r2]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	bl ov81_02241E68
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
_0223F130:
	ldrb r0, [r5, #0x11]
	mov r2, #0
	sub r0, r0, #1
	strb r0, [r5, #0x11]
	ldrb r0, [r5, #0x11]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	strh r2, [r1, r0]
	ldrb r0, [r5, #9]
	bl ov81_02240F18
	add r7, r0, #0
	mov r4, #0
	cmp r7, #0
	ble _0223F168
	add r6, r5, #0
	add r6, #0x50
_0223F156:
	add r0, r4, #2
	lsl r0, r0, #4
	add r0, r6, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	cmp r4, r7
	blt _0223F156
_0223F168:
	ldrb r2, [r5, #0x11]
	add r0, r5, #0
	mov r1, #0
	add r2, r2, #1
	bl ov81_022408A0
	add r0, r5, #0
	mov r1, #0
	bl ov81_0224086C
	strb r0, [r5, #0x10]
	add r0, r5, #0
	bl ov81_02241C0C
	add r0, r5, #0
	bl ov81_02241FEC
	add r0, r5, #0
	bl ov81_0224218C
	ldr r1, _0223F1A0 ; =0x00000468
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #6
	bl ov81_02242300
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F1A0: .word 0x00000468
	thumb_func_end ov81_0223F0BC

	thumb_func_start ov81_0223F1A4
ov81_0223F1A4: ; 0x0223F1A4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	bl ov80_02236DD4
	add r2, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #7
	bhi _0223F254
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223F1C2: ; jump table
	.short _0223F1D2 - _0223F1C2 - 2 ; case 0
	.short _0223F1F6 - _0223F1C2 - 2 ; case 1
	.short _0223F202 - _0223F1C2 - 2 ; case 2
	.short _0223F208 - _0223F1C2 - 2 ; case 3
	.short _0223F214 - _0223F1C2 - 2 ; case 4
	.short _0223F244 - _0223F1C2 - 2 ; case 5
	.short _0223F2C2 - _0223F1C2 - 2 ; case 6
	.short _0223F2FA - _0223F1C2 - 2 ; case 7
_0223F1D2:
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F1F6:
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F202:
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F208:
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F214:
	add r0, r4, #0
	mov r1, #0
	bl ov81_022408A0
	add r0, r4, #0
	mov r1, #1
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldr r0, _0223F310 ; =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	add r0, r4, #0
	mov r1, #1
	bl ov81_02242694
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F244:
	ldr r0, _0223F310 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223F256
	cmp r0, #2
	beq _0223F26E
_0223F254:
	b _0223F30C
_0223F256:
	ldr r0, _0223F310 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F26E:
	ldr r0, _0223F310 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242D88
	ldrb r0, [r4, #0x11]
	mov r2, #0
	sub r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #0x11]
	lsl r0, r0, #1
	add r1, r4, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	strh r2, [r1, r0]
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223F2BE
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov81_02240FA4
_0223F2BE:
	mov r0, #1
	pop {r4, pc}
_0223F2C2:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #0
	bne _0223F2D0
	mov r0, #1
	pop {r4, pc}
_0223F2D0:
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov81_02240FA4
	cmp r0, #1
	bne _0223F30C
	add r0, r4, #0
	mov r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	bl sub_02037BEC
	mov r0, #0xa4
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F2FA:
	mov r0, #0xa4
	bl sub_02037B38
	cmp r0, #1
	bne _0223F30C
	bl sub_02037BEC
	mov r0, #1
	pop {r4, pc}
_0223F30C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223F310: .word 0x0000046C
	thumb_func_end ov81_0223F1A4

	thumb_func_start ov81_0223F314
ov81_0223F314: ; 0x0223F314
	push {r3, lr}
	bl ov81_0223F320
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov81_0223F314

	thumb_func_start ov81_0223F320
ov81_0223F320: ; 0x0223F320
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	bl ov80_02236DD4
	ldr r0, _0223F388 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F54
	ldr r0, _0223F388 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov81_02242FB0
	ldr r0, _0223F388 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov81_02242F94
	ldrb r2, [r4, #0x11]
	add r0, r4, #0
	mov r1, #0
	add r2, r2, #1
	bl ov81_022408A0
	add r0, r4, #0
	mov r1, #0
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	add r0, r4, #0
	bl ov81_02241FEC
	add r0, r4, #0
	bl ov81_0224218C
	pop {r4, pc}
	.balign 4, 0
_0223F388: .word 0x00000468
	thumb_func_end ov81_0223F320

	thumb_func_start ov81_0223F38C
ov81_0223F38C: ; 0x0223F38C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #9
	bhi _0223F408
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223F3A4: ; jump table
	.short _0223F3B8 - _0223F3A4 - 2 ; case 0
	.short _0223F3CC - _0223F3A4 - 2 ; case 1
	.short _0223F592 - _0223F3A4 - 2 ; case 2
	.short _0223F598 - _0223F3A4 - 2 ; case 3
	.short _0223F5EA - _0223F3A4 - 2 ; case 4
	.short _0223F5F6 - _0223F3A4 - 2 ; case 5
	.short _0223F604 - _0223F3A4 - 2 ; case 6
	.short _0223F616 - _0223F3A4 - 2 ; case 7
	.short _0223F63C - _0223F3A4 - 2 ; case 8
	.short _0223F652 - _0223F3A4 - 2 ; case 9
_0223F3B8:
	mov r1, #0
	bl ov81_02240F38
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r1, [r4, #0x13]
	mov r0, #2
	bic r1, r0
	strb r1, [r4, #0x13]
	b _0223F666
_0223F3CC:
	ldr r0, _0223F66C ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019BE4
	add r5, r0, #0
	mov r0, #2
	mvn r0, r0
	cmp r5, r0
	bhi _0223F3FE
	bhs _0223F4DC
	cmp r5, #6
	bhi _0223F408
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223F3F0: ; jump table
	.short _0223F40A - _0223F3F0 - 2 ; case 0
	.short _0223F40A - _0223F3F0 - 2 ; case 1
	.short _0223F40A - _0223F3F0 - 2 ; case 2
	.short _0223F494 - _0223F3F0 - 2 ; case 3
	.short _0223F44C - _0223F3F0 - 2 ; case 4
	.short _0223F464 - _0223F3F0 - 2 ; case 5
	.short _0223F47C - _0223F3F0 - 2 ; case 6
_0223F3FE:
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bne _0223F408
	b _0223F548
_0223F408:
	b _0223F666
_0223F40A:
	ldr r0, _0223F670 ; =0x000005DC
	bl PlaySE
	ldr r2, _0223F674 ; =0x00000468
	add r0, r4, #0
	add r1, r2, #0
	str r5, [r4, r2]
	sub r1, #0xa8
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #4
	bl ov81_02242218
	add r0, r4, #0
	bl ov81_02241D38
	ldr r0, _0223F678 ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #7
	add r3, r1, #0
	bl sub_020196E8
	add r0, r4, #0
	bl ov81_0224174C
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242E08
	b _0223F666
_0223F44C:
	ldr r0, _0223F670 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xc
	mov r3, #7
	bl ov81_022425C4
	mov r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F464:
	ldr r0, _0223F670 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0xc
	mov r3, #8
	bl ov81_022425C4
	mov r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F47C:
	ldr r0, _0223F670 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0xf
	mov r3, #9
	bl ov81_022425C4
	mov r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F494:
	ldr r0, _0223F670 ; =0x000005DC
	bl PlaySE
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	add r0, r4, #0
	add r0, #0xd0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0223F678 ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0201980C
	add r0, r4, #0
	bl ov81_02241D38
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0xf
	mov r3, #6
	bl ov81_022425D8
	mov r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F4DC:
	ldr r0, _0223F670 ; =0x000005DC
	bl PlaySE
	ldr r0, _0223F66C ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r2, r0, #0
	cmp r2, #3
	bne _0223F51C
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	add r0, r4, #0
	add r0, #0xd0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0223F678 ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0201980C
	b _0223F540
_0223F51C:
	mov r1, #0xf
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r3, #3
	bl ov81_02242218
	add r0, r4, #0
	add r0, #0xd0
	bl ScheduleWindowCopyToVram
	ldr r0, _0223F678 ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #7
	add r3, r1, #0
	bl sub_020196E8
_0223F540:
	add r0, r4, #0
	bl ov81_02241D38
	b _0223F666
_0223F548:
	ldr r0, _0223F66C ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	cmp r0, #4
	ldr r0, _0223F670 ; =0x000005DC
	blo _0223F56E
	bl PlaySE
	add r0, r4, #0
	bl ov81_022417B4
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	b _0223F666
_0223F56E:
	bl PlaySE
	add r0, r4, #0
	bl ov81_02241840
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242E08
	add r0, r4, #0
	mov r1, #1
	bl ov81_02240F38
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223F592:
	bl ov81_022425EC
	b _0223F666
_0223F598:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223F666
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0223F5C0
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200374C
	ldr r0, _0223F67C ; =0x00000478
	mov r1, #0xff
	str r1, [r4, r0]
	b _0223F666
_0223F5C0:
	add r0, r4, #0
	bl ov81_02240E78
	add r0, r4, #0
	bl ov81_02240BB0
	mov r1, #7
	lsl r1, r1, #6
	ldr r0, _0223F680 ; =_02103A1C
	ldr r1, [r4, r1]
	mov r2, #0x64
	bl OverlayManager_new
	str r0, [r4, #4]
	ldrb r1, [r4, #0x13]
	mov r0, #2
	add sp, #0xc
	orr r0, r1
	strb r0, [r4, #0x13]
	mov r0, #1
	pop {r4, r5, pc}
_0223F5EA:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0223F666
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223F5F6:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223F666
	mov r0, #1
	strb r0, [r4, #8]
	b _0223F666
_0223F604:
	bl ov81_02241840
	add r0, r4, #0
	mov r1, #1
	bl ov81_02240F38
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223F616:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r1, [r4, #0x13]
	mov r0, #0x40
	orr r0, r1
	strb r0, [r4, #0x13]
	mov r0, #3
	strb r0, [r4, #8]
	b _0223F666
_0223F63C:
	bl ov81_0223F684
	add r0, r4, #0
	bl ov81_022417B4
	add r0, r4, #0
	bl ov81_02241840
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223F652:
	bl ov81_022417B4
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	mov r0, #1
	strb r0, [r4, #8]
_0223F666:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223F66C: .word 0x00000464
_0223F670: .word 0x000005DC
_0223F674: .word 0x00000468
_0223F678: .word 0x00000474
_0223F67C: .word 0x00000478
_0223F680: .word _02103A1C
	thumb_func_end ov81_0223F38C

	thumb_func_start ov81_0223F684
ov81_0223F684: ; 0x0223F684
	ldrb r2, [r0, #0x11]
	ldr r1, _0223F6A4 ; =0x00000468
	ldr r3, [r0, r1]
	lsl r2, r2, #1
	add r2, r0, r2
	sub r1, #0xa0
	strh r3, [r2, r1]
	ldrb r1, [r0, #0x11]
	add r1, r1, #1
	strb r1, [r0, #0x11]
	ldrb r2, [r0, #0x13]
	mov r1, #4
	orr r1, r2
	strb r1, [r0, #0x13]
	bx lr
	nop
_0223F6A4: .word 0x00000468
	thumb_func_end ov81_0223F684

	thumb_func_start ov81_0223F6A8
ov81_0223F6A8: ; 0x0223F6A8
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223F6BC
	cmp r1, #1
	beq _0223F6DE
	cmp r1, #2
	beq _0223F746
	b _0223F74A
_0223F6BC:
	mov r1, #0xa
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldr r0, _0223F750 ; =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	add r0, r4, #0
	mov r1, #1
	bl ov81_02242694
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F74A
_0223F6DE:
	ldr r0, _0223F750 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223F6F0
	cmp r0, #2
	beq _0223F71C
	b _0223F74A
_0223F6F0:
	ldr r0, _0223F750 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223F714
	add r0, r4, #0
	mov r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223F714:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F74A
_0223F71C:
	ldr r0, _0223F750 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	add r0, r4, #0
	bl ov81_0223F754
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223F74A
_0223F746:
	mov r0, #1
	pop {r4, pc}
_0223F74A:
	mov r0, #0
	pop {r4, pc}
	nop
_0223F750: .word 0x0000046C
	thumb_func_end ov81_0223F6A8

	thumb_func_start ov81_0223F754
ov81_0223F754: ; 0x0223F754
	push {r4, lr}
	add r4, r0, #0
	bl ov81_02241804
	add r0, r4, #0
	mov r1, #1
	bl ov81_02240F38
	add r0, r4, #0
	mov r1, #9
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov81_0223F754

	thumb_func_start ov81_0223F770
ov81_0223F770: ; 0x0223F770
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #8
	bhi _0223F7FC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223F786: ; jump table
	.short _0223F798 - _0223F786 - 2 ; case 0
	.short _0223F7BC - _0223F786 - 2 ; case 1
	.short _0223FA4A - _0223F786 - 2 ; case 2
	.short _0223FABC - _0223F786 - 2 ; case 3
	.short _0223FAC0 - _0223F786 - 2 ; case 4
	.short _0223FAC6 - _0223F786 - 2 ; case 5
	.short _0223FAD4 - _0223F786 - 2 ; case 6
	.short _0223FAE4 - _0223F786 - 2 ; case 7
	.short _0223FB24 - _0223F786 - 2 ; case 8
_0223F798:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov81_02243028
	add r0, r4, #0
	mov r1, #0xd
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	mov r0, #1
	strb r0, [r4, #8]
	b _0223FB38
_0223F7BC:
	ldr r0, _0223FB10 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019BE4
	add r5, r0, #0
	mov r0, #2
	mvn r0, r0
	cmp r5, r0
	bhi _0223F7F2
	blo _0223F7D2
	b _0223F956
_0223F7D2:
	cmp r5, #7
	bhi _0223F7FC
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223F7E2: ; jump table
	.short _0223F7FE - _0223F7E2 - 2 ; case 0
	.short _0223F7FE - _0223F7E2 - 2 ; case 1
	.short _0223F7FE - _0223F7E2 - 2 ; case 2
	.short _0223F7FE - _0223F7E2 - 2 ; case 3
	.short _0223F84A - _0223F7E2 - 2 ; case 4
	.short _0223F8B8 - _0223F7E2 - 2 ; case 5
	.short _0223F926 - _0223F7E2 - 2 ; case 6
	.short _0223F93E - _0223F7E2 - 2 ; case 7
_0223F7F2:
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bne _0223F7FC
	b _0223FA02
_0223F7FC:
	b _0223FB38
_0223F7FE:
	ldr r0, _0223FB14 ; =0x000005DC
	bl PlaySE
	ldr r2, _0223FB18 ; =0x00000468
	add r0, r4, #0
	add r1, r2, #0
	str r5, [r4, r2]
	sub r1, #0xa4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #4
	bl ov81_02242218
	ldr r0, _0223FB1C ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #7
	add r3, r1, #0
	bl sub_020196E8
	add r0, r4, #0
	bl ov81_02241D94
	ldr r1, _0223FB18 ; =0x00000468
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl ov81_022424AC
	add r0, r4, #0
	bl ov81_02241980
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242E08
	b _0223FB38
_0223F84A:
	ldr r0, _0223FB14 ; =0x000005DC
	bl PlaySE
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	mov r2, #1
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #6
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0xd0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x50
	add r0, r0, #2
	lsl r0, r0, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0223FB1C ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xf
	mov r3, #5
	bl ov81_022425D8
	mov r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F8B8:
	ldr r0, _0223FB14 ; =0x000005DC
	bl PlaySE
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	mov r2, #1
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #6
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0xd0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x50
	add r0, r0, #2
	lsl r0, r0, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0223FB1C ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0xf
	mov r3, #6
	bl ov81_022425D8
	mov r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F926:
	ldr r0, _0223FB14 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xf
	mov r3, #7
	bl ov81_022425C4
	mov r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F93E:
	ldr r0, _0223FB14 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0xf
	mov r3, #8
	bl ov81_022425C4
	mov r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F956:
	ldr r0, _0223FB14 ; =0x000005DC
	bl PlaySE
	ldr r0, _0223FB10 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r5, r0, #0
	sub r0, r5, #4
	cmp r0, #1
	bhi _0223F9C4
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	mov r2, #1
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #6
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0xd0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x50
	add r0, r0, #2
	lsl r0, r0, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0223FB1C ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0201980C
	b _0223FB38
_0223F9C4:
	cmp r5, #6
	beq _0223FA5A
	cmp r5, #7
	beq _0223FA5A
	mov r1, #0xf1
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r2, r5, #0
	mov r3, #4
	bl ov81_02242218
	add r0, r4, #0
	add r0, #0xd0
	bl ScheduleWindowCopyToVram
	ldr r0, _0223FB1C ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #7
	add r3, r1, #0
	bl sub_020196E8
	add r0, r4, #0
	bl ov81_02241D94
	add r0, r4, #0
	add r1, r5, #0
	bl ov81_022424AC
	b _0223FB38
_0223FA02:
	ldr r0, _0223FB10 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	cmp r0, #6
	ldr r0, _0223FB14 ; =0x000005DC
	blo _0223FA28
	bl PlaySE
	add r0, r4, #0
	bl ov81_022419E0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	b _0223FB38
_0223FA28:
	bl PlaySE
	add r0, r4, #0
	bl ov81_02241A7C
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242E08
	add r0, r4, #0
	mov r1, #1
	bl ov81_02240F38
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223FA4A:
	ldr r0, _0223FB20 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223FA5C
	cmp r0, #2
	beq _0223FA8E
_0223FA5A:
	b _0223FB38
_0223FA5C:
	ldr r0, _0223FB20 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	add r0, r4, #0
	bl ov81_0223FB64
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223FA86
	add r0, r4, #0
	mov r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223FA86:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FB38
_0223FA8E:
	ldr r0, _0223FB20 ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	add r0, r4, #0
	bl ov81_0223FB88
	add r0, r4, #0
	bl ov81_02241A38
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	mov r0, #1
	strb r0, [r4, #8]
	b _0223FB38
_0223FABC:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223FAC0:
	bl ov81_022425EC
	b _0223FB38
_0223FAC6:
	bl ov81_02241A7C
	add r0, r4, #0
	bl ov81_0223FB3C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223FAD4:
	bl ov81_02241A7C
	add r0, r4, #0
	mov r1, #1
	bl ov81_02240F38
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223FAE4:
	bl ov81_022419E0
	add r0, r4, #0
	bl ov81_02241A7C
	ldr r0, _0223FB20 ; =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	add r0, r4, #0
	mov r1, #1
	bl ov81_02242694
	add r0, r4, #0
	mov r1, #0xe
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	mov r0, #2
	strb r0, [r4, #8]
	b _0223FB38
	.balign 4, 0
_0223FB10: .word 0x00000464
_0223FB14: .word 0x000005DC
_0223FB18: .word 0x00000468
_0223FB1C: .word 0x00000474
_0223FB20: .word 0x0000046C
_0223FB24:
	bl ov81_022419E0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	mov r0, #1
	strb r0, [r4, #8]
_0223FB38:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_0223F770

	thumb_func_start ov81_0223FB3C
ov81_0223FB3C: ; 0x0223FB3C
	ldrb r2, [r0, #0x13]
	mov r1, #4
	mov r3, #0xf2
	bic r2, r1
	strb r2, [r0, #0x13]
	ldrb r1, [r0, #0x11]
	lsl r3, r3, #2
	add r2, r3, #0
	sub r1, r1, #1
	strb r1, [r0, #0x11]
	mov r1, #0
	strh r1, [r0, r3]
	add r2, #0xa0
	add r3, #0x9c
	str r1, [r0, r2]
	ldr r0, [r0, r3]
	ldr r3, _0223FB60 ; =sub_02019F7C
	bx r3
	.balign 4, 0
_0223FB60: .word sub_02019F7C
	thumb_func_end ov81_0223FB3C

	thumb_func_start ov81_0223FB64
ov81_0223FB64: ; 0x0223FB64
	ldrb r2, [r0, #0x13]
	mov r1, #8
	orr r1, r2
	strb r1, [r0, #0x13]
	ldrb r2, [r0, #0x11]
	ldr r1, _0223FB84 ; =0x00000468
	ldr r3, [r0, r1]
	lsl r2, r2, #1
	add r2, r0, r2
	sub r1, #0xa0
	strh r3, [r2, r1]
	ldrb r1, [r0, #0x11]
	add r1, r1, #1
	strb r1, [r0, #0x11]
	bx lr
	nop
_0223FB84: .word 0x00000468
	thumb_func_end ov81_0223FB64

	thumb_func_start ov81_0223FB88
ov81_0223FB88: ; 0x0223FB88
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov81_02243028
	add r0, r4, #0
	mov r1, #0xd
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov81_0223FB88

	thumb_func_start ov81_0223FBAC
ov81_0223FBAC: ; 0x0223FBAC
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223FBC0
	cmp r1, #1
	beq _0223FBE2
	cmp r1, #2
	beq _0223FC52
	b _0223FC56
_0223FBC0:
	mov r1, #0xa
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldr r0, _0223FC5C ; =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	add r0, r4, #0
	mov r1, #1
	bl ov81_02242694
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FC56
_0223FBE2:
	ldr r0, _0223FC5C ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0223FBF4
	cmp r0, #2
	beq _0223FC28
	b _0223FC56
_0223FBF4:
	ldr r0, _0223FC5C ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	ldrb r1, [r4, #0x13]
	mov r0, #8
	bic r1, r0
	strb r1, [r4, #0x13]
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223FC20
	add r0, r4, #0
	mov r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223FC20:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FC56
_0223FC28:
	ldr r0, _0223FC5C ; =0x0000046C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl ov81_02242694
	add r0, r4, #0
	bl ov81_0223FC60
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FC56
_0223FC52:
	mov r0, #1
	pop {r4, pc}
_0223FC56:
	mov r0, #0
	pop {r4, pc}
	nop
_0223FC5C: .word 0x0000046C
	thumb_func_end ov81_0223FBAC

	thumb_func_start ov81_0223FC60
ov81_0223FC60: ; 0x0223FC60
	push {r4, lr}
	add r4, r0, #0
	bl ov81_02241A38
	add r0, r4, #0
	mov r1, #1
	bl ov81_02240F38
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_0223FC60

	thumb_func_start ov81_0223FC74
ov81_0223FC74: ; 0x0223FC74
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	bl ov80_02236DD4
	ldrb r0, [r4, #8]
	cmp r0, #6
	bhi _0223FD48
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223FC90: ; jump table
	.short _0223FC9E - _0223FC90 - 2 ; case 0
	.short _0223FD3C - _0223FC90 - 2 ; case 1
	.short _0223FDC2 - _0223FC90 - 2 ; case 2
	.short _0223FE14 - _0223FC90 - 2 ; case 3
	.short _0223FEAA - _0223FC90 - 2 ; case 4
	.short _0223FF0C - _0223FC90 - 2 ; case 5
	.short _0223FF26 - _0223FC90 - 2 ; case 6
_0223FC9E:
	ldrb r1, [r4, #0x13]
	mov r0, #0x20
	orr r0, r1
	strb r0, [r4, #0x13]
	add r0, r4, #0
	add r0, #0x60
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0xa0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0xb0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x50
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x70
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x80
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x90
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0xd0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0223FFF0 ; =0x00000474
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0201980C
	add r0, r4, #0
	add r0, #0xc0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0xc0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x50
	bl ov81_0224300C
	ldr r0, _0223FFF4 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp]
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090E4
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FD3C:
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	bhs _0223FD4A
_0223FD48:
	b _0223FFEC
_0223FD4A:
	ldr r0, _0223FFF8 ; =0x0000047C
	mov r6, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0223FD6C
	ldr r7, _0223FFF8 ; =0x0000047C
	add r5, r4, #0
_0223FD58:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02008780
	ldr r0, [r4, r7]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blo _0223FD58
_0223FD6C:
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242D74
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	add r0, r4, #0
	bl ov81_02241FC0
	add r0, r4, #0
	bl ov81_02242170
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #2
	bl ov81_02242DE4
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FDC2:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02009138
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov81_02242DD8
	cmp r0, #1
	beq _0223FEB4
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	add r0, r4, #0
	mov r1, #6
	bl ov81_02240728
	add r0, r4, #0
	mov r1, #2
	bl ov81_022406E0
	ldr r0, [r4, #0x4c]
	ldr r3, [r4, #0xc]
	mov r1, #6
	mov r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, _0223FFFC ; =0x00000611
	bl PlaySE
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FE14:
	add r0, r4, #0
	bl ov81_02240564
	cmp r0, #1
	bne _0223FEB4
	ldr r0, _0223FFFC ; =0x00000611
	mov r1, #0
	bl StopSE
	ldr r0, _02240000 ; =0x00000678
	bl PlaySE
	mov r0, #8
	str r0, [r4, #0x14]
	ldrb r0, [r4, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _0223FE5A
	add r5, r4, #0
	add r7, r6, #0
_0223FE3C:
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242EA4
	mov r1, #0x36
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	str r7, [r5, r0]
	ldrb r0, [r4, #0x12]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0223FE3C
_0223FE5A:
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223FE74
	ldrb r0, [r4, #0x12]
	cmp r0, #2
	bne _0223FE70
	mov r0, #4
	strb r0, [r4, #0x12]
	b _0223FE74
_0223FE70:
	mov r0, #2
	strb r0, [r4, #0x12]
_0223FE74:
	add r0, r4, #0
	bl ov81_0223EBE4
	ldrb r0, [r4, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _0223FE98
	mov r7, #0x36
	add r5, r4, #0
	lsl r7, r7, #4
_0223FE88:
	ldr r0, [r5, r7]
	bl ov81_02242F60
	ldrb r0, [r4, #0x12]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0223FE88
_0223FE98:
	ldr r0, _0223FFFC ; =0x00000611
	bl PlaySE
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FEAA:
	add r0, r4, #0
	bl ov81_022404B4
	cmp r0, #1
	beq _0223FEB6
_0223FEB4:
	b _0223FFEC
_0223FEB6:
	ldr r0, _0223FFFC ; =0x00000611
	mov r1, #0
	bl StopSE
	ldr r0, _02240000 ; =0x00000678
	bl PlaySE
	ldrb r0, [r4, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _0223FEE4
	mov r7, #0x36
	add r5, r4, #0
	lsl r7, r7, #4
_0223FED2:
	ldr r0, [r5, r7]
	mov r1, #4
	bl ov81_02242F94
	ldrb r0, [r4, #0x12]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0223FED2
_0223FEE4:
	mov r0, #8
	str r0, [r4, #0x14]
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242DE4
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FF0C:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov81_02242DD8
	cmp r0, #1
	beq _0223FFEC
	mov r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FF26:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _0223FFAA
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	ldr r0, _0223FFF8 ; =0x0000047C
	bne _0223FF60
	ldr r0, [r4, r0]
	mov r5, #0
	cmp r0, #0
	bls _0223FF96
	ldr r6, _0223FFF8 ; =0x0000047C
	mov r7, #1
_0223FF4A:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r5, #0
	add r3, r7, #0
	bl ov81_02241E68
	ldr r0, [r4, r6]
	add r5, r5, #1
	cmp r5, r0
	blo _0223FF4A
	b _0223FF96
_0223FF60:
	ldr r0, [r4, r0]
	mov r5, #0
	cmp r0, #0
	bls _0223FF96
	ldr r7, _0223FFF8 ; =0x0000047C
	add r6, r7, #0
	sub r6, #0xb4
_0223FF6E:
	ldrh r0, [r4, r6]
	cmp r5, r0
	bne _0223FF82
	mov r2, #0
	add r0, r4, #0
	add r1, r5, #0
	add r3, r2, #0
	bl ov81_02241EDC
	b _0223FF8E
_0223FF82:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r5, #0
	mov r3, #1
	bl ov81_02241E68
_0223FF8E:
	ldr r0, [r4, r7]
	add r5, r5, #1
	cmp r5, r0
	blo _0223FF6E
_0223FF96:
	ldr r0, _0223FFF4 ; =0x0000FFFF
	mov r1, #0x10
	str r0, [sp]
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0
	mov r3, #1
	bl sub_020090E4
_0223FFAA:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02009138
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #0x19]
	cmp r0, #0x15
	blo _0223FFEC
	add r0, r4, #0
	bl ov81_02241398
	ldrb r1, [r4, #0x13]
	mov r0, #0x20
	bic r1, r0
	strb r1, [r4, #0x13]
	ldrb r0, [r4, #9]
	bl ov80_02237254
	cmp r0, #1
	bne _0223FFE4
	ldr r0, _02240004 ; =0x00000463
	mov r1, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov81_02241144
_0223FFE4:
	mov r0, #0
	strb r0, [r4, #0x19]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223FFEC:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223FFF0: .word 0x00000474
_0223FFF4: .word 0x0000FFFF
_0223FFF8: .word 0x0000047C
_0223FFFC: .word 0x00000611
_02240000: .word 0x00000678
_02240004: .word 0x00000463
	thumb_func_end ov81_0223FC74

	thumb_func_start ov81_02240008
ov81_02240008: ; 0x02240008
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02240018
	cmp r1, #1
	beq _02240030
	b _02240040
_02240018:
	ldrb r2, [r4, #0x13]
	mov r1, #0xa
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1f
	bl ov81_02240FA4
	cmp r0, #1
	bne _02240040
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02240040
_02240030:
	ldr r0, _02240044 ; =0x00000462
	ldrb r1, [r4, r0]
	cmp r1, #2
	blo _02240040
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_02240040:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02240044: .word 0x00000462
	thumb_func_end ov81_02240008

	thumb_func_start ov81_02240048
ov81_02240048: ; 0x02240048
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02240058
	cmp r1, #1
	beq _02240072
	b _02240084
_02240058:
	mov r1, #0xf
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	bl sub_02037BEC
	mov r0, #0xa5
	bl sub_02037AC0
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _02240084
_02240072:
	mov r0, #0xa5
	bl sub_02037B38
	cmp r0, #1
	bne _02240084
	bl sub_02037BEC
	mov r0, #1
	pop {r4, pc}
_02240084:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02240048

	thumb_func_start ov81_02240088
ov81_02240088: ; 0x02240088
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0224009A
	cmp r0, #1
	beq _022400BA
	b _022400C8
_0224009A:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022400C8
_022400BA:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022400C8
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_022400C8:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02240088

	thumb_func_start ov81_022400D0
ov81_022400D0: ; 0x022400D0
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _022400E2
	cmp r0, #1
	beq _022401AC
	b _022401C0
_022400E2:
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02240114
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Delete2dMenu
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_022413E0
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242FC8
	mov r0, #0xdf
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_02240114:
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl ov80_0222A7CC
	mov r1, #0xf
	lsl r1, r1, #6
	ldr r0, [r4, r1]
	add r1, #8
	ldrh r1, [r4, r1]
	add r1, r1, #2
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl ov81_022408B8
	mov r1, #0xf1
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #6
	ldrh r1, [r4, r1]
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl ov81_022408B8
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	bl ov81_02243028
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	mov r3, #1
	str r3, [sp]
	str r0, [sp, #4]
	add r1, r4, #0
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	add r0, r4, #0
	add r1, #0xc0
	mov r2, #0x10
	bl ov81_0224080C
	strb r0, [r4, #0x10]
	add r0, r4, #0
	add r0, #0xc0
	bl ScheduleWindowCopyToVram
	mov r0, #0x50
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _022401C0
_022401AC:
	ldrb r0, [r4, #0x10]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _022401C0
	mov r0, #0
	strb r0, [r4, #0x19]
	add sp, #0x18
	mov r0, #1
	pop {r4, pc}
_022401C0:
	mov r0, #0
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_022400D0

	thumb_func_start ov81_022401C8
ov81_022401C8: ; 0x022401C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02240204
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02009418
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022401EA
	bl sub_0200398C
_022401EA:
	ldr r0, [r4, #0x4c]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _02240208 ; =0x027E0000
	ldr r1, _0224020C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
_02240204:
	pop {r4, pc}
	nop
_02240208: .word 0x027E0000
_0224020C: .word 0x00003FF8
	thumb_func_end ov81_022401C8

	thumb_func_start ov81_02240210
ov81_02240210: ; 0x02240210
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0224022C ; =ov81_0224356C
	add r3, sp, #0
	mov r2, #5
_0224021A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0224021A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0224022C: .word ov81_0224356C
	thumb_func_end ov81_02240210

	thumb_func_start ov81_02240230
ov81_02240230: ; 0x02240230
	push {r4, r5, lr}
	sub sp, #0xd4
	ldr r5, _0224039C ; =ov81_02243480
	add r3, sp, #0xc4
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _022403A0 ; =ov81_022434A8
	add r3, sp, #0xa8
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
	mov r3, #0x64
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022403A4 ; =ov81_022434C4
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
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022403A8 ; =ov81_022434FC
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
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022403AC ; =ov81_02243518
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
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x64
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022403B0 ; =ov81_022434E0
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
	mov r3, #0x64
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022403B4 ; =ov81_02243534
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022403B8 ; =ov81_02243550
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
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r1, _022403BC ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	add sp, #0xd4
	pop {r4, r5, pc}
	.balign 4, 0
_0224039C: .word ov81_02243480
_022403A0: .word ov81_022434A8
_022403A4: .word ov81_022434C4
_022403A8: .word ov81_022434FC
_022403AC: .word ov81_02243518
_022403B0: .word ov81_022434E0
_022403B4: .word ov81_02243534
_022403B8: .word ov81_02243550
_022403BC: .word 0x04000008
	thumb_func_end ov81_02240230

	thumb_func_start ov81_022403C0
ov81_022403C0: ; 0x022403C0
	push {r4, lr}
	add r4, r0, #0
	bl ov81_02240210
	ldr r0, [r4, #0x4c]
	bl ov81_02240230
	mov r0, #0x64
	bl sub_020030E8
	mov r1, #0x1a
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	lsl r2, r1, #8
	mov r3, #0x64
	bl PaletteData_AllocBuffers
	mov r2, #0x1a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	mov r1, #0
	add r2, #0x60
	mov r3, #0x64
	bl PaletteData_AllocBuffers
	bl ov81_02240770
	add r0, r4, #0
	mov r1, #6
	bl ov81_02240728
	add r0, r4, #0
	mov r1, #3
	bl ov81_02240698
	add r0, r4, #0
	mov r1, #2
	bl ov81_022406E0
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _02240426
	ldr r0, [r4, #0x4c]
	ldr r3, [r4, #0xc]
	mov r1, #6
	mov r2, #0
	bl BgSetPosTextAndCommit
_02240426:
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #7
	bl ov81_022407A8
	pop {r4, pc}
	thumb_func_end ov81_022403C0

	thumb_func_start ov81_02240448
ov81_02240448: ; 0x02240448
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r3, _02240454 ; =ov81_0224276C
	add r0, r0, r1
	bx r3
	nop
_02240454: .word ov81_0224276C
	thumb_func_end ov81_02240448

	thumb_func_start ov81_02240458
ov81_02240458: ; 0x02240458
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
	pop {r4, pc}
	thumb_func_end ov81_02240458

	thumb_func_start ov81_022404AC
ov81_022404AC: ; 0x022404AC
	mov r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov81_022404AC

	thumb_func_start ov81_022404B4
ov81_022404B4: ; 0x022404B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x4c]
	mov r1, #6
	mov r2, #1
	mov r3, #8
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x4c]
	mov r1, #6
	bl Bg_GetXpos
	str r0, [r5, #0xc]
	ldrb r0, [r5, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _0224054A
	add r4, r5, #0
_022404DE:
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F30
	add r7, r0, #0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F8C
	ldr r2, [r7]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	sub r1, #8
	cmp r1, r0
	bgt _0224052E
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F8C
	add r7, r0, #0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F90
	add r2, r0, #0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, r7, #0
	bl ov81_02242F10
	mov r0, #1
	str r0, [sp]
	b _02240540
_0224052E:
	mov r1, #0x36
	lsl r1, r1, #4
	mov r2, #7
	ldr r1, [r4, r1]
	add r0, sp, #4
	mvn r2, r2
	mov r3, #0
	bl ov81_02242EC4
_02240540:
	ldrb r0, [r5, #0x12]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _022404DE
_0224054A:
	add r0, r5, #0
	bl ov81_022405F0
	ldr r0, [sp]
	cmp r0, #1
	bne _0224055C
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224055C:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_022404B4

	thumb_func_start ov81_02240564
ov81_02240564: ; 0x02240564
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, [r6, #0x4c]
	mov r1, #6
	mov r2, #1
	mov r3, #8
	mov r4, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r6, #0x4c]
	mov r1, #6
	bl Bg_GetXpos
	str r0, [r6, #0xc]
	ldrb r0, [r6, #0x12]
	add r7, r4, #0
	cmp r0, #0
	ble _022405D6
	add r5, r6, #0
_0224058C:
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242F30
	ldr r1, [r0]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r1, r0, #0xc
	mov r0, #0x17
	sub r1, #8
	mvn r0, r0
	cmp r1, r0
	bge _022405BA
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242EB8
	add r4, r4, #1
	b _022405CC
_022405BA:
	mov r1, #0x36
	lsl r1, r1, #4
	mov r2, #7
	ldr r1, [r5, r1]
	add r0, sp, #0
	mvn r2, r2
	mov r3, #0
	bl ov81_02242EC4
_022405CC:
	ldrb r0, [r6, #0x12]
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, r0
	blt _0224058C
_022405D6:
	add r0, r6, #0
	bl ov81_022405F0
	ldrb r0, [r6, #0x12]
	cmp r4, r0
	bne _022405E8
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022405E8:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_02240564

	thumb_func_start ov81_022405F0
ov81_022405F0: ; 0x022405F0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4, #0x14]
	mov r0, #3
	tst r0, r1
	bne _0224061E
	lsr r0, r1, #2
	cmp r0, #4
	blo _02240608
	mov r0, #0
	str r0, [r4, #0x14]
_02240608:
	mov r3, #0x20
	str r3, [sp]
	ldr r2, [r4, #0x14]
	add r0, r4, #0
	lsr r2, r2, #2
	add r2, r2, #2
	lsl r2, r2, #0x18
	mov r1, #7
	lsr r2, r2, #0x18
	bl ov81_02240628
_0224061E:
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov81_022405F0

	thumb_func_start ov81_02240628
ov81_02240628: ; 0x02240628
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r3, [sp]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r4, r1, #0
	lsl r1, r4, #0x18
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0x4c]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x4c]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov81_02240628

	thumb_func_start ov81_02240658
ov81_02240658: ; 0x02240658
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #5
	bhi _02240688
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224066C: ; jump table
	.short _02240678 - _0224066C - 2 ; case 0
	.short _0224067C - _0224066C - 2 ; case 1
	.short _02240688 - _0224066C - 2 ; case 2
	.short _02240688 - _0224066C - 2 ; case 3
	.short _02240680 - _0224066C - 2 ; case 4
	.short _02240684 - _0224066C - 2 ; case 5
_02240678:
	mov r1, #1
	b _0224068A
_0224067C:
	mov r1, #2
	b _0224068A
_02240680:
	mov r1, #1
	b _0224068A
_02240684:
	mov r1, #2
	b _0224068A
_02240688:
	mov r1, #4
_0224068A:
	add r0, r4, #0
	bl ov81_02241340
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov81_02240658

	thumb_func_start ov81_02240698
ov81_02240698: ; 0x02240698
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x81
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x82
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02240698

	thumb_func_start ov81_022406E0
ov81_022406E0: ; 0x022406E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x92
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #0x91
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_022406E0

	thumb_func_start ov81_02240728
ov81_02240728: ; 0x02240728
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #4
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #8
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02240728

	thumb_func_start ov81_02240770
ov81_02240770: ; 0x02240770
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xb7
	mov r1, #0xc1
	add r2, sp, #0
	mov r3, #0x64
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0x16
	ldr r0, [r0, #0xc]
	lsl r1, r1, #4
	bl DC_FlushRange
	ldr r0, [sp]
	mov r2, #0x16
	ldr r0, [r0, #0xc]
	mov r1, #0
	lsl r2, r2, #4
	bl GX_LoadBGPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02240770

	thumb_func_start ov81_022407A8
ov81_022407A8: ; 0x022407A8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #4
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	mov r1, #7
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x95
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov81_022407A8

	thumb_func_start ov81_0224080C
ov81_0224080C: ; 0x0224080C
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
	ldr r0, [r5, #0x1c]
	ldr r2, [r5, #0x28]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x20]
	ldr r1, [r5, #0x24]
	ldr r2, [r5, #0x28]
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
	ldr r2, [r5, #0x24]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_0224080C

	thumb_func_start ov81_0224086C
ov81_0224086C: ; 0x0224086C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r3, #1
	add r2, r1, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	mov r1, #0xf
	str r1, [sp, #0x10]
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xc0
	str r3, [sp, #0x14]
	bl ov81_0224080C
	add r4, #0xc0
	add r5, r0, #0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_0224086C

	thumb_func_start ov81_022408A0
ov81_022408A0: ; 0x022408A0
	push {r3, lr}
	sub sp, #8
	mov r3, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x20]
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov81_022408A0

	thumb_func_start ov81_022408B8
ov81_022408B8: ; 0x022408B8
	ldr r3, _022408C0 ; =BufferBoxMonSpeciesName
	ldr r0, [r0, #0x20]
	bx r3
	nop
_022408C0: .word BufferBoxMonSpeciesName
	thumb_func_end ov81_022408B8

	thumb_func_start ov81_022408C4
ov81_022408C4: ; 0x022408C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	str r2, [sp, #0x10]
	add r6, r3, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	mov r0, #8
	mov r1, #0x64
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16ArrayToString
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _02240908
	ldr r1, _02240938 ; =0x00070800
	b _0224090C
_02240908:
	mov r1, #0xc1
	lsl r1, r1, #0xa
_0224090C:
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
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02240938: .word 0x00070800
	thumb_func_end ov81_022408C4

	thumb_func_start ov81_0224093C
ov81_0224093C: ; 0x0224093C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	str r2, [sp, #0x10]
	add r6, r3, #0
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02034818
	add r7, r0, #0
	mov r0, #8
	mov r1, #0x64
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	add r1, r4, #0
	bl PlayerName_FlatToString
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _0224097C
	ldr r1, _022409AC ; =0x00070800
	b _02240980
_0224097C:
	mov r1, #0xc1
	lsl r1, r1, #0xa
_02240980:
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
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_022409AC: .word 0x00070800
	thumb_func_end ov81_0224093C

	thumb_func_start ov81_022409B0
ov81_022409B0: ; 0x022409B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r1, #0
	add r1, sp, #0x28
	ldrb r1, [r1, #0x1c]
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	str r3, [sp, #0x10]
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x4c]
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x64
	bl String_ctor
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x1c]
	mov r1, #0x1c
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x20]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	bl StringExpandPlaceholders
	add r0, sp, #0x48
	ldrb r6, [r0]
	ldr r0, [sp, #0x38]
	add r2, sp, #0x28
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldrb r0, [r2, #0x14]
	ldrb r1, [r2, #0x1c]
	ldrb r2, [r2, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #8
	lsl r2, r2, #0x18
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x10]
	add r0, r4, #0
	add r1, r6, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r7, #0
	mov r1, #0xb0
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _02240AC8
	add r0, r7, #0
	bl GetMonGender
	add r7, r0, #0
	add r0, r4, #0
	bl GetWindowWidth
	sub r0, r0, #1
	lsl r0, r0, #3
	sub r0, r0, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	cmp r7, #0
	bne _02240A96
	ldr r0, [r5, #0x1c]
	mov r1, #0x1a
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, [sp, #0x38]
	add r1, r6, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02240AD4 ; =0x00070800
	add r2, r5, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x14]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	b _02240AC8
_02240A96:
	cmp r7, #1
	bne _02240AC8
	ldr r0, [r5, #0x1c]
	mov r1, #0x1b
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, [sp, #0x38]
	add r1, r6, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x14]
	add r0, r4, #0
	add r2, r5, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
_02240AC8:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240AD4: .word 0x00070800
	thumb_func_end ov81_022409B0

	thumb_func_start ov81_02240AD8
ov81_02240AD8: ; 0x02240AD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r1, sp, #0x28
	ldrb r1, [r1, #0x18]
	str r0, [sp, #0x10]
	add r0, r5, #0
	str r2, [sp, #0x14]
	add r6, r3, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #0x64
	bl NewMsgDataFromNarc
	add r1, sp, #0x28
	ldrh r1, [r1, #0x20]
	add r7, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl DestroyMsgData
	add r2, sp, #0x28
	ldrb r0, [r2, #0x1c]
	ldr r3, [sp, #0x14]
	str r0, [sp, #0x1c]
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldrb r0, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	ldrb r2, [r2, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #8
	lsl r2, r2, #0x18
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl GetWindowWidth
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	add r0, sp, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _02240B58
	mov r0, #0x1a
	str r0, [sp, #0x18]
	b _02240B5C
_02240B58:
	mov r0, #0x1b
	str r0, [sp, #0x18]
_02240B5C:
	add r0, sp, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _02240B68
	ldr r7, _02240BAC ; =0x00070800
	b _02240B6C
_02240B68:
	mov r7, #0xc1
	lsl r7, r7, #0xa
_02240B6C:
	add r0, r4, #0
	bl StringSetEmpty
	add r0, sp, #0x4c
	ldrb r0, [r0]
	cmp r0, #2
	beq _02240BA0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #0x1c]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	add r2, r4, #0
	lsl r3, r3, #3
	bl AddTextPrinterParameterized2
_02240BA0:
	add r0, r4, #0
	bl String_dtor
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02240BAC: .word 0x00070800
	thumb_func_end ov81_02240AD8

	thumb_func_start ov81_02240BB0
ov81_02240BB0: ; 0x02240BB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov81_0224275C
	ldrb r0, [r5, #0x12]
	mov r6, #0
	cmp r0, #0
	ble _02240BE0
	mov r7, #0x36
	add r4, r5, #0
	lsl r7, r7, #4
_02240BC6:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02240BD6
	bl ov81_02242EA4
	mov r1, #0x36
	lsl r1, r1, #4
	str r0, [r4, r1]
_02240BD6:
	ldrb r0, [r5, #0x12]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _02240BC6
_02240BE0:
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242D74
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	add r0, r5, #0
	bl ov81_02241364
	add r0, r5, #0
	bl ov81_02241FC0
	add r0, r5, #0
	bl ov81_02242170
	bl sub_0203A914
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02003104
	mov r0, #0x1a
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, #0x24
	add r0, r5, r0
	bl ov81_02242B38
	mov r7, #0x6b
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_02240C62:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02240C6C
	bl sub_02008780
_02240C6C:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	blt _02240C62
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02008524
	ldr r0, [r5, #0x1c]
	bl DestroyMsgData
	ldr r0, [r5, #0x20]
	bl ScrStrBufs_delete
	ldr r0, [r5, #0x24]
	bl String_dtor
	ldr r0, [r5, #0x28]
	bl String_dtor
	mov r6, #0
	add r4, r5, #0
_02240C9A:
	ldr r0, [r4, #0x2c]
	bl String_dtor
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02240C9A
	mov r0, #4
	bl FontID_Release
	add r0, r5, #0
	add r0, #0x50
	bl ov81_0224300C
	ldr r0, [r5, #0x4c]
	bl ov81_02240458
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl NARC_dtor
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl GF_3DVramMan_Delete
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_02240BB0

	thumb_func_start ov81_02240CD4
ov81_02240CD4: ; 0x02240CD4
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov81_02240D2C
	mov r2, #2
	mov r1, #0
	ldr r0, _02240D24 ; =ov81_02242BC8
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0x64
	add r3, r1, #0
	bl GF_3DVramMan_Create
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x64
	bl BgConfig_Alloc
	str r0, [r4, #0x4c]
	add r0, r4, #0
	bl ov81_02240D64
	add r1, r4, #0
	ldr r0, [r4, #0x4c]
	add r1, #0x50
	bl ov81_02242FDC
	ldr r0, _02240D28 ; =0x0000047C
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _02240D1E
	add r4, #0x70
	add r0, r4, #0
	bl ov81_022430E8
_02240D1E:
	add sp, #8
	pop {r4, pc}
	nop
_02240D24: .word ov81_02242BC8
_02240D28: .word 0x0000047C
	thumb_func_end ov81_02240CD4

	thumb_func_start ov81_02240D2C
ov81_02240D2C: ; 0x02240D2C
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
	ldr r0, _02240D5C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02240D60 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_02240D5C: .word 0xFFFFE0FF
_02240D60: .word 0x04001000
	thumb_func_end ov81_02240D2C

	thumb_func_start ov81_02240D64
ov81_02240D64: ; 0x02240D64
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xb7
	mov r1, #0x64
	bl NARC_ctor
	mov r1, #0xf7
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov81_022403C0
	add r0, r5, #0
	bl ov81_02240448
	mov r0, #4
	mov r1, #0x64
	bl FontID_Alloc
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xc2
	mov r3, #0x64
	bl NewMsgDataFromNarc
	str r0, [r5, #0x1c]
	mov r0, #0x64
	bl ScrStrBufs_new
	str r0, [r5, #0x20]
	mov r0, #0x32
	lsl r0, r0, #4
	mov r1, #0x64
	bl String_ctor
	str r0, [r5, #0x24]
	mov r0, #0x32
	lsl r0, r0, #4
	mov r1, #0x64
	bl String_ctor
	str r0, [r5, #0x28]
	mov r6, #0
	add r4, r5, #0
	mov r7, #0x40
_02240DBE:
	add r0, r7, #0
	mov r1, #0x64
	bl String_ctor
	str r0, [r4, #0x2c]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02240DBE
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x64
	bl LoadFontPal0
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x64
	bl LoadFontPal0
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x64
	bl LoadFontPal1
	mov r1, #6
	mov r0, #4
	lsl r1, r1, #6
	mov r2, #0x64
	bl LoadFontPal1
	mov r0, #0x64
	bl sub_02007FD4
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r5, r1]
	bl sub_02037474
	cmp r0, #0
	beq _02240E26
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	bl sub_0203A880
_02240E26:
	add r0, r5, #0
	mov r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _02240E40
	add r0, r5, #0
	bl ov81_0223E87C
	add r0, r5, #0
	bl ov81_0223E8B0
	b _02240E4C
_02240E40:
	add r0, r5, #0
	bl ov81_0223EBE4
	add r0, r5, #0
	bl ov81_0223EC44
_02240E4C:
	add r0, r5, #0
	bl ov81_02242500
	mov r1, #0xf7
	lsl r1, r1, #2
	ldr r0, [r5, #0x4c]
	ldr r1, [r5, r1]
	bl ov81_02243100
	add r0, r5, #0
	bl ov81_0224271C
	bl GX_BothDispOn
	ldr r0, _02240E74 ; =ov81_022401C8
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240E74: .word ov81_022401C8
	thumb_func_end ov81_02240D64

	thumb_func_start ov81_02240E78
ov81_02240E78: ; 0x02240E78
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x64
	mov r1, #0x3c
	bl AllocFromHeap
	mov r1, #7
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	mov r2, #0x3c
	bl memset
	mov r1, #0xf
	mov r2, #7
	lsl r1, r1, #6
	lsl r2, r2, #6
	ldr r3, [r4, r1]
	ldr r0, [r4, r2]
	add r1, #0xa8
	str r3, [r0]
	add r0, r2, #0
	sub r0, #8
	ldr r3, [r4, r0]
	ldr r0, [r4, r2]
	str r3, [r0, #4]
	ldr r0, [r4, r2]
	mov r3, #1
	strb r3, [r0, #0x11]
	ldr r0, [r4, r2]
	strb r3, [r0, #0x12]
	ldrb r3, [r4, #0x12]
	ldr r0, [r4, r2]
	strb r3, [r0, #0x13]
	ldr r1, [r4, r1]
	ldr r0, [r4, r2]
	strb r1, [r0, #0x14]
	ldr r0, [r4, r2]
	mov r1, #0
	strh r1, [r0, #0x18]
	sub r0, r2, #4
	ldr r0, [r4, r0]
	bl SavArray_IsNatDexEnabled
	mov r1, #7
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	str r0, [r2, #0x1c]
	ldr r0, [r4, r1]
	mov r2, #0
	str r2, [r0, #0x2c]
	ldr r0, [r4, r1]
	str r2, [r0, #0x34]
	ldr r0, [r4, r1]
	ldr r1, _02240F04 ; =_02243458
	bl sub_02089D40
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_0208AD34
	pop {r4, pc}
	.balign 4, 0
_02240F04: .word _02243458
	thumb_func_end ov81_02240E78

	thumb_func_start ov81_02240F08
ov81_02240F08: ; 0x02240F08
	ldrb r0, [r0, #0xb]
	cmp r0, r1
	bne _02240F12
	mov r0, #1
	bx lr
_02240F12:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov81_02240F08

	thumb_func_start ov81_02240F18
ov81_02240F18: ; 0x02240F18
	cmp r0, #0
	beq _02240F20
	cmp r0, #1
	bne _02240F24
_02240F20:
	mov r0, #3
	bx lr
_02240F24:
	mov r0, #2
	bx lr
	thumb_func_end ov81_02240F18

	thumb_func_start ov81_02240F28
ov81_02240F28: ; 0x02240F28
	ldrb r0, [r0, #0x13]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02240F34
	mov r0, #1
	bx lr
_02240F34:
	mov r0, #0
	bx lr
	thumb_func_end ov81_02240F28

	thumb_func_start ov81_02240F38
ov81_02240F38: ; 0x02240F38
	ldrb r3, [r0, #0x13]
	mov r2, #1
	bic r3, r2
	mov r2, #1
	and r1, r2
	orr r1, r3
	strb r1, [r0, #0x13]
	bx lr
	thumb_func_end ov81_02240F38

	thumb_func_start ov81_02240F48
ov81_02240F48: ; 0x02240F48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	lsl r4, r1, #2
	ldr r1, [sp, #0x20]
	mov r7, #0x6b
	lsl r7, r7, #2
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	sub r1, r7, #4
	add r5, r0, r7
	ldr r0, [r0, r1]
	mov r1, #0
	add r6, r2, #0
	bl ov81_02242C80
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	add r0, r7, #0
	mov r2, #0x1c
	bl GetMonBaseStat_HandleAlternateForme
	cmp r0, #0
	bne _02240FA0
	ldr r0, [r5, r4]
	ldr r1, [sp, #0x24]
	bl ov81_02242CB0
_02240FA0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_02240F48

	thumb_func_start ov81_02240FA4
ov81_02240FA4: ; 0x02240FA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #9]
	add r4, r1, #0
	add r7, r2, #0
	bl ov80_02237254
	cmp r0, #0
	bne _02240FBA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02240FBA:
	cmp r4, #7
	beq _02240FC8
	cmp r4, #8
	beq _02240FD4
	cmp r4, #0xa
	beq _02240FE2
	b _02240FEE
_02240FC8:
	add r0, r5, #0
	add r1, r4, #0
	mov r6, #0x1d
	bl ov81_02241008
	b _02240FEE
_02240FD4:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r6, #0x1e
	bl ov81_0224102C
	b _02240FEE
_02240FE2:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r6, #0x20
	bl ov81_02241218
_02240FEE:
	mov r1, #0x3e
	lsl r1, r1, #4
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #0x3c
	bl sub_02037030
	cmp r0, #1
	bne _02241004
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241004:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_02240FA4

	thumb_func_start ov81_02241008
ov81_02241008: ; 0x02241008
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	mov r0, #0x3e
	lsl r0, r0, #4
	strh r4, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02241008

	thumb_func_start ov81_02241020
ov81_02241020: ; 0x02241020
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203769C
	cmp r4, r0
	pop {r4, pc}
	thumb_func_end ov81_02241020

	thumb_func_start ov81_0224102C
ov81_0224102C: ; 0x0224102C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r1, #0
	mov r0, #0x3e
	str r1, [sp]
	add r2, r5, #0
	add r4, r1, #0
	lsl r0, r0, #4
_0224103C:
	add r1, r1, #1
	strh r4, [r2, r0]
	add r2, r2, #2
	cmp r1, #0x3c
	blt _0224103C
	ldrb r1, [r5, #0x11]
	mov r0, #0x3e
	lsl r0, r0, #4
	strh r1, [r5, r0]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	ble _0224108C
	ldr r0, [sp]
	add r7, r5, #0
	lsl r0, r0, #1
	add r6, r5, r0
_02241062:
	mov r1, #0xf2
	mov r0, #0xf
	lsl r1, r1, #2
	lsl r0, r0, #6
	ldrh r1, [r7, r1]
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x3e
	lsl r1, r1, #4
	strh r0, [r6, r1]
	ldrb r0, [r5, #0x11]
	add r4, r4, #1
	add r7, r7, #2
	add r6, r6, #2
	cmp r4, r0
	blt _02241062
_0224108C:
	ldr r1, [sp]
	mov r7, #0
	add r1, r1, r0
	cmp r0, #0
	ble _022410C6
	lsl r0, r1, #1
	add r6, r5, #0
	add r4, r5, r0
_0224109C:
	mov r1, #0xf2
	mov r0, #0xf
	lsl r1, r1, #2
	lsl r0, r0, #6
	ldrh r1, [r6, r1]
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	mov r1, #0x3e
	lsl r1, r1, #4
	strh r0, [r4, r1]
	ldrb r0, [r5, #0x11]
	add r7, r7, #1
	add r6, r6, #2
	add r4, r4, #2
	cmp r7, r0
	blt _0224109C
_022410C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_0224102C

	thumb_func_start ov81_022410C8
ov81_022410C8: ; 0x022410C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r3, #0
	add r7, r0, #0
	ldrb r0, [r5, #9]
	add r6, r2, #0
	mov r4, #0
	bl ov80_02236DD4
	bl sub_0203769C
	cmp r7, r0
	beq _0224112C
	ldrh r0, [r6]
	add r4, r4, #1
	strb r0, [r5, #0x18]
	ldrb r3, [r5, #0x18]
	mov r0, #0
	cmp r3, #0
	ble _02241106
	lsl r1, r4, #1
	ldr r7, _02241130 ; =0x0000045A
	add r1, r6, r1
	add r2, r5, #0
_022410F6:
	ldrh r3, [r1]
	add r0, r0, #1
	add r1, r1, #2
	strh r3, [r2, r7]
	ldrb r3, [r5, #0x18]
	add r2, r2, #2
	cmp r0, r3
	blt _022410F6
_02241106:
	add r1, r4, r3
	mov r0, #0
	cmp r3, #0
	ble _02241126
	lsl r1, r1, #1
	add r3, r6, r1
	ldr r1, _02241134 ; =0x0000045E
	add r4, r5, #0
_02241116:
	ldrh r2, [r3]
	add r0, r0, #1
	add r3, r3, #2
	strh r2, [r4, r1]
	ldrb r2, [r5, #0x18]
	add r4, r4, #2
	cmp r0, r2
	blt _02241116
_02241126:
	ldr r0, _02241138 ; =0x00000463
	mov r1, #1
	strb r1, [r5, r0]
_0224112C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241130: .word 0x0000045A
_02241134: .word 0x0000045E
_02241138: .word 0x00000463
	thumb_func_end ov81_022410C8

	thumb_func_start ov81_0224113C
ov81_0224113C: ; 0x0224113C
	ldr r3, _02241140 ; =GF_AssertFail
	bx r3
	.balign 4, 0
_02241140: .word GF_AssertFail
	thumb_func_end ov81_0224113C

	thumb_func_start ov81_02241144
ov81_02241144: ; 0x02241144
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r0, #0
	ldrb r0, [r7, #9]
	bl ov80_02236DD4
	str r0, [sp, #0x18]
	ldrb r0, [r7, #0x13]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02241180
	add r0, r7, #0
	add r0, #0x60
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r7, #0
	add r0, #0xa0
	bl ClearWindowTilemapAndScheduleTransfer
	add r7, #0xb0
	add r0, r7, #0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02241180:
	ldr r0, _0224120C ; =0x00000463
	ldrb r0, [r7, r0]
	cmp r0, #1
	bne _02241200
	ldr r0, [sp, #0x18]
	mov r4, #0
	cmp r0, #0
	ble _022411E8
	add r6, r7, #0
	add r5, r7, #0
	add r6, #0x50
_02241196:
	add r0, r4, #5
	lsl r0, r0, #4
	str r0, [sp, #0x1c]
	add r0, r6, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r7, #0x18]
	cmp r4, r0
	bge _022411D6
	mov r0, #0xf
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _02241210 ; =0x0000045A
	ldr r1, [sp, #0x1c]
	ldrh r0, [r5, r0]
	mov r2, #0
	add r1, r6, r1
	str r0, [sp, #0x10]
	ldr r0, _02241214 ; =0x0000045E
	add r3, r2, #0
	ldrh r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl ov81_02240AD8
_022411D6:
	ldr r0, [sp, #0x1c]
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, r0
	blt _02241196
_022411E8:
	mov r2, #0
	add r1, r7, #0
	add r0, r7, #0
	add r1, #0x60
	add r3, r2, #0
	str r2, [sp]
	bl ov81_0224093C
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
_02241200:
	ldr r0, _0224120C ; =0x00000463
	mov r1, #0
	strb r1, [r7, r0]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224120C: .word 0x00000463
_02241210: .word 0x0000045A
_02241214: .word 0x0000045E
	thumb_func_end ov81_02241144

	thumb_func_start ov81_02241218
ov81_02241218: ; 0x02241218
	mov r3, #0x3e
	lsl r3, r3, #4
	strh r1, [r0, r3]
	add r1, r3, #2
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0x18
	ldrh r2, [r0, r1]
	add r1, r3, #4
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0x16
	ldrh r2, [r0, r1]
	add r1, r3, #6
	strh r2, [r0, r1]
	bx lr
	thumb_func_end ov81_02241218

	thumb_func_start ov81_02241238
ov81_02241238: ; 0x02241238
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _022412BC ; =0x00000462
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _022412BA
	ldrh r0, [r5, #2]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _022412C0 ; =0x00000458
	strh r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _02241294
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02241274
	ldr r0, _022412C0 ; =0x00000458
	mov r1, #0
	strh r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02241274:
	ldr r1, _022412C0 ; =0x00000458
	ldrh r0, [r4, r1]
	cmp r0, #1
	bne _022412BA
	ldrh r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	add r0, r1, #0
	sub r0, #0x90
	strh r2, [r4, r0]
	ldrh r0, [r5, #6]
	sub r1, #0x8e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	strh r0, [r4, r1]
	pop {r4, r5, r6, pc}
_02241294:
	ldr r1, _022412C0 ; =0x00000458
	ldrh r0, [r4, r1]
	cmp r0, #1
	bne _022412BA
	ldrb r2, [r4, #0x13]
	mov r0, #8
	bic r2, r0
	strb r2, [r4, #0x13]
	ldrh r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	add r0, r1, #0
	sub r0, #0x90
	strh r2, [r4, r0]
	ldrh r0, [r5, #6]
	sub r1, #0x8e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	strh r0, [r4, r1]
_022412BA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022412BC: .word 0x00000462
_022412C0: .word 0x00000458
	thumb_func_end ov81_02241238

	thumb_func_start ov81_022412C4
ov81_022412C4: ; 0x022412C4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _022412E0
	ldr r0, _02241320 ; =ov81_02243490
	lsl r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _02241324 ; =ov81_02243492
	ldrh r2, [r0, r2]
	b _02241312
_022412E0:
	ldrb r0, [r5, #9]
	bl ov80_02237254
	cmp r0, #0
	bne _022412F6
	ldr r0, _02241328 ; =ov81_02243464
	lsl r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _0224132C ; =ov81_02243466
	ldrh r2, [r0, r2]
	b _02241312
_022412F6:
	ldrb r0, [r5, #0x12]
	cmp r0, #2
	bne _02241308
	ldr r0, _02241330 ; =ov81_0224345C
	lsl r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _02241334 ; =ov81_0224345E
	ldrh r2, [r0, r2]
	b _02241312
_02241308:
	ldr r0, _02241338 ; =ov81_02243470
	lsl r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _0224133C ; =ov81_02243472
	ldrh r2, [r0, r2]
_02241312:
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r3, #0x64
	bl ov81_02242E50
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02241320: .word ov81_02243490
_02241324: .word ov81_02243492
_02241328: .word ov81_02243464
_0224132C: .word ov81_02243466
_02241330: .word ov81_0224345C
_02241334: .word ov81_0224345E
_02241338: .word ov81_02243470
_0224133C: .word ov81_02243472
	thumb_func_end ov81_022412C4

	thumb_func_start ov81_02241340
ov81_02241340: ; 0x02241340
	push {lr}
	sub sp, #0xc
	add r2, r1, #0
	mov r1, #0xa
	str r1, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	mov r1, #0x7c
	str r1, [sp, #8]
	mov r1, #0x71
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #1
	mov r3, #2
	bl ov81_02242CBC
	add sp, #0xc
	pop {pc}
	thumb_func_end ov81_02241340

	thumb_func_start ov81_02241364
ov81_02241364: ; 0x02241364
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224137E
	bl ov81_02242D74
	mov r0, #0xe
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
_0224137E:
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02241394
	bl ov81_02242D74
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_02241394:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02241364

	thumb_func_start ov81_02241398
ov81_02241398: ; 0x02241398
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x64
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x4c]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r1, r4, #0
	ldr r0, [r4, #0x4c]
	add r1, #0x50
	bl ov81_02242FDC
	ldr r0, _022413DC ; =0x0000047C
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _022413D2
	add r4, #0x70
	add r0, r4, #0
	bl ov81_022430E8
_022413D2:
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	.balign 4, 0
_022413DC: .word 0x0000047C
	thumb_func_end ov81_02241398

	thumb_func_start ov81_022413E0
ov81_022413E0: ; 0x022413E0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_022413E0

	thumb_func_start ov81_022413F4
ov81_022413F4: ; 0x022413F4
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02241418 ; =0x00000464
	add r2, sp, #4
	ldr r0, [r4, r0]
	add r3, sp, #0
	bl ov81_02243228
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02241418: .word 0x00000464
	thumb_func_end ov81_022413F4

	thumb_func_start ov81_0224141C
ov81_0224141C: ; 0x0224141C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _0224144C ; =0x00000464
	add r2, sp, #4
	ldr r0, [r4, r0]
	add r3, sp, #0
	bl ov81_02243228
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl ov81_02242DE4
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0224144C: .word 0x00000464
	thumb_func_end ov81_0224141C

	thumb_func_start ov81_02241450
ov81_02241450: ; 0x02241450
	push {r4, lr}
	mov r1, #0xf7
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	mov r2, #0
	bl ov81_02243140
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _022414D8 ; =0x00000468
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F40
	cmp r0, #0
	bne _02241498
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	b _022414A2
_02241498:
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
_022414A2:
	ldr r0, _022414DC ; =0x00000464
	mov r1, #6
	ldr r0, [r4, r0]
	bl sub_02019F7C
	add r0, r4, #0
	mov r1, #6
	bl ov81_0224141C
	ldr r0, _022414DC ; =0x00000464
	mov r1, #1
	ldr r0, [r4, r0]
	bl ov81_02243270
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242E08
	pop {r4, pc}
	.balign 4, 0
_022414D8: .word 0x00000468
_022414DC: .word 0x00000464
	thumb_func_end ov81_02241450

	thumb_func_start ov81_022414E0
ov81_022414E0: ; 0x022414E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #0
	bl ov81_022431E0
	ldr r1, _02241520 ; =0x00000464
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02019F7C
	ldr r0, _02241520 ; =0x00000464
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov81_02243270
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242E08
	pop {r4, pc}
	.balign 4, 0
_02241520: .word 0x00000464
	thumb_func_end ov81_022414E0

	thumb_func_start ov81_02241524
ov81_02241524: ; 0x02241524
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	lsr r3, r5, #0x1f
	add r0, #0xfe
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #5
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x11
	lsr r3, r5, #0x1f
	lsl r0, r0, #4
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #6
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x12
	lsr r3, r5, #0x1f
	lsl r0, r0, #4
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #8
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x13
	lsr r3, r5, #0x1f
	lsl r0, r0, #4
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #7
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224164C: .word 0x000F0E02
	thumb_func_end ov81_02241524

	thumb_func_start ov81_02241650
ov81_02241650: ; 0x02241650
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _022416C8 ; =0x00000464
	add r2, sp, #4
	ldr r0, [r5, r0]
	add r3, sp, #0
	add r4, r1, #0
	bl ov81_02243228
	cmp r4, #3
	bne _0224169E
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl ov81_02242DE4
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
_0224169E:
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022416C8: .word 0x00000464
	thumb_func_end ov81_02241650

	thumb_func_start ov81_022416CC
ov81_022416CC: ; 0x022416CC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02241748 ; =0x00000464
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r2, sp, #4
	add r3, sp, #0
	bl ov81_02243228
	sub r0, r4, #4
	cmp r0, #1
	bhi _0224171C
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl ov81_02242DE4
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
_0224171C:
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02241748: .word 0x00000464
	thumb_func_end ov81_022416CC

	thumb_func_start ov81_0224174C
ov81_0224174C: ; 0x0224174C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #3
	bl ov81_022431E0
	mov r1, #0xf7
	lsl r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	mov r2, #0
	bl ov81_02243140
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #5
	lsl r0, r0, #6
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _022417B0 ; =0x00000464
	mov r1, #4
	ldr r0, [r4, r0]
	bl sub_02019F7C
	add r0, r4, #0
	mov r1, #4
	bl ov81_0224141C
	ldr r0, _022417B0 ; =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02243314
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242D88
	pop {r4, pc}
	.balign 4, 0
_022417B0: .word 0x00000464
	thumb_func_end ov81_0224174C

	thumb_func_start ov81_022417B4
ov81_022417B4: ; 0x022417B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #0
	bl ov81_022431E0
	mov r1, #0xf7
	lsl r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	mov r2, #3
	bl ov81_02243140
	add r0, r4, #0
	add r0, #0xf0
	bl ScheduleWindowCopyToVram
	ldr r1, _02241800 ; =0x00000464
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02019F7C
	ldr r0, _02241800 ; =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02243314
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.balign 4, 0
_02241800: .word 0x00000464
	thumb_func_end ov81_022417B4

	thumb_func_start ov81_02241804
ov81_02241804: ; 0x02241804
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0224183C ; =0x00000464
	ldr r0, [r5, r0]
	bl sub_02019F74
	mov r1, #0xf7
	lsl r1, r1, #2
	add r4, r0, #0
	ldr r0, [r5, #0x4c]
	ldr r1, [r5, r1]
	mov r2, #3
	bl ov81_02243140
	add r0, r5, #0
	add r0, #0xf0
	bl ScheduleWindowCopyToVram
	cmp r4, #3
	bne _02241838
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
_02241838:
	pop {r3, r4, r5, pc}
	nop
_0224183C: .word 0x00000464
	thumb_func_end ov81_02241804

	thumb_func_start ov81_02241840
ov81_02241840: ; 0x02241840
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #3
	bl ov81_022431E0
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02241840

	thumb_func_start ov81_0224185C
ov81_0224185C: ; 0x0224185C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #5
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0xf0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	lsr r3, r5, #0x1f
	add r0, #0xfe
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #0x14
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #5
	lsl r0, r0, #6
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #5
	lsr r3, r5, #0x1f
	lsl r0, r0, #6
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #0x15
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x13
	lsr r3, r5, #0x1f
	lsl r0, r0, #4
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #0x16
	asr r3, r3, #1
	bl ov81_022430B4
	add r0, r4, #0
	add r0, #0xf0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	lsr r3, r5, #0x1f
	add r0, r4, #0
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, #0xf0
	mov r2, #0x13
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #1
	lsl r0, r0, #8
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #5
	lsl r0, r0, #6
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	add r4, #0xf0
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224197C: .word 0x000F0E02
	thumb_func_end ov81_0224185C

	thumb_func_start ov81_02241980
ov81_02241980: ; 0x02241980
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #2
	bl ov81_022431E0
	mov r1, #0xf7
	lsl r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov81_02243140
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _022419DC ; =0x00000464
	mov r1, #6
	ldr r0, [r4, r0]
	bl sub_02019F7C
	add r0, r4, #0
	mov r1, #6
	bl ov81_0224141C
	ldr r0, _022419DC ; =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_022433FC
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov81_02242D88
	pop {r4, pc}
	nop
_022419DC: .word 0x00000464
	thumb_func_end ov81_02241980

	thumb_func_start ov81_022419E0
ov81_022419E0: ; 0x022419E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #1
	bl ov81_022431E0
	mov r1, #0xf7
	lsl r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	mov r2, #2
	bl ov81_02243140
	add r0, r4, #0
	add r0, #0xe0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0xf0
	bl ScheduleWindowCopyToVram
	ldr r1, _02241A34 ; =0x00000464
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02019F7C
	ldr r0, _02241A34 ; =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_022433FC
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.balign 4, 0
_02241A34: .word 0x00000464
	thumb_func_end ov81_022419E0

	thumb_func_start ov81_02241A38
ov81_02241A38: ; 0x02241A38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02241A78 ; =0x00000464
	ldr r0, [r5, r0]
	bl sub_02019F74
	mov r1, #0xf7
	lsl r1, r1, #2
	add r4, r0, #0
	ldr r0, [r5, #0x4c]
	ldr r1, [r5, r1]
	mov r2, #2
	bl ov81_02243140
	add r0, r5, #0
	add r0, #0xe0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0xf0
	bl ScheduleWindowCopyToVram
	cmp r4, #4
	blo _02241A74
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
_02241A74:
	pop {r3, r4, r5, pc}
	nop
_02241A78: .word 0x00000464
	thumb_func_end ov81_02241A38

	thumb_func_start ov81_02241A7C
ov81_02241A7C: ; 0x02241A7C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #2
	bl ov81_022431E0
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02241A7C

	thumb_func_start ov81_02241A98
ov81_02241A98: ; 0x02241A98
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #2
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0xf0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x15
	lsr r3, r5, #0x1f
	lsl r0, r0, #4
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #0x19
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x16
	lsr r3, r5, #0x1f
	lsl r0, r0, #4
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, r4, r0
	mov r2, #0x16
	asr r3, r3, #1
	bl ov81_022430B4
	add r0, r4, #0
	add r0, #0xe0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	lsr r3, r5, #0x1f
	add r0, r4, #0
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, #0xe0
	mov r2, #0x17
	asr r3, r3, #1
	bl ov81_022430B4
	add r0, r4, #0
	add r0, #0xf0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 ; =0x000F0E02
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	lsr r3, r5, #0x1f
	add r0, r4, #0
	add r3, r5, r3
	ldr r1, [r4, #0x1c]
	add r0, #0xf0
	mov r2, #0x18
	asr r3, r3, #1
	bl ov81_022430B4
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowPixelsToVram_TextMode
	add r0, r4, #0
	add r0, #0xe0
	bl CopyWindowPixelsToVram_TextMode
	add r4, #0xf0
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02241BB4: .word 0x000F0E02
	thumb_func_end ov81_02241A98

	thumb_func_start ov81_02241BB8
ov81_02241BB8: ; 0x02241BB8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x64
	bl sub_0201660C
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02241BB8

	thumb_func_start ov81_02241BC8
ov81_02241BC8: ; 0x02241BC8
	ldr r3, _02241BCC ; =sub_02016624
	bx r3
	.balign 4, 0
_02241BCC: .word sub_02016624
	thumb_func_end ov81_02241BC8

	thumb_func_start ov81_02241BD0
ov81_02241BD0: ; 0x02241BD0
	push {lr}
	sub sp, #0x14
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0xe
	lsl r1, r1, #6
	str r1, [sp, #8]
	mov r1, #0xe
	str r1, [sp, #0xc]
	mov r1, #0x19
	add r2, sp, #0
	strb r1, [r2, #0x10]
	mov r1, #0xa
	strb r1, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf
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
	add sp, #0x14
	pop {pc}
	thumb_func_end ov81_02241BD0

	thumb_func_start ov81_02241C0C
ov81_02241C0C: ; 0x02241C0C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02241C80 ; =0x00000464
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r2, r0, #0
	cmp r2, #6
	bhs _02241C7C
	ldrb r1, [r4, #0x11]
	mov r0, #0
	cmp r1, #0
	ble _02241C3E
	mov r3, #0xf2
	lsl r3, r3, #2
_02241C2A:
	lsl r5, r0, #1
	add r5, r4, r5
	ldrh r5, [r5, r3]
	cmp r2, r5
	beq _02241C3E
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r1
	blt _02241C2A
_02241C3E:
	cmp r1, #0
	beq _02241C5A
	cmp r0, r1
	beq _02241C5A
	lsl r0, r1, #2
	add r1, r4, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	b _02241C76
_02241C5A:
	add r0, r4, #0
	mov r3, #0
	bl ov81_02241E68
	ldrb r0, [r4, #0x11]
	mov r2, #0
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #6
	bl sub_020087A4
_02241C76:
	add r0, r4, #0
	bl ov81_02241CEC
_02241C7C:
	pop {r3, r4, r5, pc}
	nop
_02241C80: .word 0x00000464
	thumb_func_end ov81_02241C0C

	thumb_func_start ov81_02241C84
ov81_02241C84: ; 0x02241C84
	cmp r1, #3
	bne _02241C90
	mov r1, #0x50
	mul r1, r0
	add r1, #0x30
	b _02241C96
_02241C90:
	mov r1, #0x70
	mul r1, r0
	add r1, #0x48
_02241C96:
	str r1, [r2]
	mov r0, #0x90
	str r0, [r3]
	bx lr
	.balign 4, 0
	thumb_func_end ov81_02241C84

	thumb_func_start ov81_02241CA0
ov81_02241CA0: ; 0x02241CA0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02241CE4 ; =0x00000464
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r7, r2, #0
	bl sub_02019F74
	cmp r0, #6
	bhs _02241CE2
	ldrb r2, [r5, #0x11]
	mov r1, #0
	cmp r2, #0
	ble _02241CD4
	mov r3, #0xf2
	lsl r3, r3, #2
_02241CC0:
	lsl r6, r1, #1
	add r6, r5, r6
	ldrh r6, [r6, r3]
	cmp r0, r6
	beq _02241CD4
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, r2
	blt _02241CC0
_02241CD4:
	add r0, r1, #0
	ldr r1, _02241CE8 ; =0x0000047C
	add r2, r4, #0
	ldr r1, [r5, r1]
	add r3, r7, #0
	bl ov81_02241C84
_02241CE2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241CE4: .word 0x00000464
_02241CE8: .word 0x0000047C
	thumb_func_end ov81_02241CA0

	thumb_func_start ov81_02241CEC
ov81_02241CEC: ; 0x02241CEC
	push {r4, lr}
	sub sp, #8
	add r1, sp, #4
	add r2, sp, #0
	add r4, r0, #0
	bl ov81_02241CA0
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242D94
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov81_02241CEC

	thumb_func_start ov81_02241D0C
ov81_02241D0C: ; 0x02241D0C
	push {r4, r5}
	ldr r1, _02241D34 ; =0x00000468
	mov r3, #0
	ldr r5, [r0, r1]
	add r4, r0, #0
	sub r1, #0xa0
_02241D18:
	ldrh r2, [r4, r1]
	cmp r5, r2
	bne _02241D24
	add r0, r3, #0
	pop {r4, r5}
	bx lr
_02241D24:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #3
	blo _02241D18
	ldrb r0, [r0, #0x11]
	pop {r4, r5}
	bx lr
	nop
_02241D34: .word 0x00000468
	thumb_func_end ov81_02241D0C

	thumb_func_start ov81_02241D38
ov81_02241D38: ; 0x02241D38
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02241D8C ; =0x00000464
	ldr r0, [r5, r0]
	bl sub_02019F74
	add r4, r0, #0
	cmp r4, #4
	bhs _02241D88
	cmp r4, #3
	bne _02241D60
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
	add sp, #8
	pop {r3, r4, r5, pc}
_02241D60:
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	ldr r1, _02241D90 ; =0x0000047C
	add r0, r4, #0
	ldr r1, [r5, r1]
	add r2, sp, #4
	add r3, sp, #0
	bl ov81_02241C84
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242D94
_02241D88:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02241D8C: .word 0x00000464
_02241D90: .word 0x0000047C
	thumb_func_end ov81_02241D38

	thumb_func_start ov81_02241D94
ov81_02241D94: ; 0x02241D94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02241DD8 ; =0x00000464
	ldr r0, [r5, r0]
	bl sub_02019F74
	add r4, r0, #0
	cmp r4, #6
	bhs _02241DD4
	cmp r4, #4
	blo _02241DB8
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
	pop {r3, r4, r5, pc}
_02241DB8:
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r1, #0xf2
	lsl r1, r1, #2
	ldrh r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov81_02241EDC
_02241DD4:
	pop {r3, r4, r5, pc}
	nop
_02241DD8: .word 0x00000464
	thumb_func_end ov81_02241D94

	thumb_func_start ov81_02241DDC
ov81_02241DDC: ; 0x02241DDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _02241E64 ; =0x0000047C
	str r1, [sp, #8]
	ldr r1, [r5, r0]
	cmp r1, #3
	bne _02241DF6
	mov r0, #0x30
	str r0, [sp, #0x10]
	mov r0, #0x50
	str r0, [sp, #0xc]
	b _02241DFE
_02241DF6:
	mov r0, #0x48
	str r0, [sp, #0x10]
	mov r0, #0x70
	str r0, [sp, #0xc]
_02241DFE:
	mov r4, #0
	cmp r1, #0
	bls _02241E5E
	str r4, [sp, #0x14]
	str r5, [sp, #0x18]
	add r7, r5, #0
_02241E0A:
	mov r2, #0xf2
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r1, [sp, #0x18]
	lsl r2, r2, #2
	ldrh r1, [r1, r2]
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r2, r0, #0
	mov r0, #0x90
	str r0, [sp]
	ldr r0, [sp, #8]
	lsl r1, r4, #0x18
	str r0, [sp, #4]
	ldr r6, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r3, r6, r3
	bl ov81_02240F48
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r7, r7, #4
	add r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, _02241E64 ; =0x0000047C
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _02241E0A
_02241E5E:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02241E64: .word 0x0000047C
	thumb_func_end ov81_02241DDC

	thumb_func_start ov81_02241E68
ov81_02241E68: ; 0x02241E68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r7, r2, #0
	add r6, r3, #0
	bl sub_02008780
	ldr r0, _02241ED8 ; =0x0000047C
	ldr r1, [r5, r0]
	cmp r1, #3
	bne _02241EB0
	sub r0, #0xbc
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r3, #0x50
	add r2, r0, #0
	mov r0, #0x90
	str r0, [sp]
	lsl r1, r4, #0x18
	mul r3, r4
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r3, #0x30
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241EB0:
	sub r0, #0xbc
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r3, #0x70
	add r2, r0, #0
	mov r0, #0x90
	str r0, [sp]
	lsl r1, r4, #0x18
	mul r3, r4
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r3, #0x48
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241ED8: .word 0x0000047C
	thumb_func_end ov81_02241E68

	thumb_func_start ov81_02241EDC
ov81_02241EDC: ; 0x02241EDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r7, r2, #0
	add r6, r3, #0
	bl sub_02008780
	ldr r0, _02241F4C ; =0x0000047C
	ldr r1, [r5, r0]
	cmp r1, #3
	bne _02241F24
	sub r0, #0xb8
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r3, #0x50
	add r2, r0, #0
	mov r0, #0x90
	str r0, [sp]
	lsl r1, r4, #0x18
	mul r3, r4
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r3, #0x30
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241F24:
	sub r0, #0xb8
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r3, #0x70
	add r2, r0, #0
	mov r0, #0x90
	str r0, [sp]
	lsl r1, r4, #0x18
	mul r3, r4
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r3, #0x48
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241F4C: .word 0x0000047C
	thumb_func_end ov81_02241EDC

	thumb_func_start ov81_02241F50
ov81_02241F50: ; 0x02241F50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	ldr r0, _02241FBC ; =0x0000047C
	ldr r1, [r7, r0]
	cmp r1, #3
	bne _02241F68
	mov r0, #0x30
	str r0, [sp, #0x10]
	mov r0, #0x50
	str r0, [sp, #0xc]
	b _02241F70
_02241F68:
	mov r0, #0x48
	str r0, [sp, #0x10]
	mov r0, #0x70
	str r0, [sp, #0xc]
_02241F70:
	mov r4, #0
	cmp r1, #0
	bls _02241FB8
	add r6, r4, #0
	add r5, r7, #0
_02241F7A:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r1, #1
	add r0, r0, r6
	str r0, [sp, #4]
	mov r0, #0x90
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r7, r0
	mov r2, #3
	add r3, r1, #0
	bl ov81_02242CBC
	mov r1, #0xe7
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r6, r6, r0
	ldr r0, _02241FBC ; =0x0000047C
	add r5, r5, #4
	ldr r0, [r7, r0]
	cmp r4, r0
	blo _02241F7A
_02241FB8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241FBC: .word 0x0000047C
	thumb_func_end ov81_02241F50

	thumb_func_start ov81_02241FC0
ov81_02241FC0: ; 0x02241FC0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02241FE8 ; =0x0000047C
	mov r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _02241FE6
	ldr r7, _02241FE8 ; =0x0000047C
	add r5, r6, #0
_02241FD2:
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blo _02241FD2
_02241FE6:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241FE8: .word 0x0000047C
	thumb_func_end ov81_02241FC0

	thumb_func_start ov81_02241FEC
ov81_02241FEC: ; 0x02241FEC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02242054 ; =0x0000047C
	mov r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _02242052
	mov r7, #0xe7
	add r5, r6, #0
	lsl r7, r7, #2
_02242000:
	ldrb r0, [r6, #0x11]
	cmp r4, r0
	bne _0224201C
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl ov81_02242DFC
	ldr r0, [r5, r7]
	mov r1, #1
	bl ov81_02242D88
	b _02242046
_0224201C:
	cmp r4, r0
	bhs _0224203A
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl ov81_02242DFC
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	b _02242046
_0224203A:
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
_02242046:
	ldr r0, _02242054 ; =0x0000047C
	add r4, r4, #1
	ldr r0, [r6, r0]
	add r5, r5, #4
	cmp r4, r0
	blo _02242000
_02242052:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02242054: .word 0x0000047C
	thumb_func_end ov81_02241FEC

	thumb_func_start ov81_02242058
ov81_02242058: ; 0x02242058
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _022420AC ; =0x0000047C
	add r7, r1, #0
	ldr r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	bls _022420A8
	add r5, r6, #0
_0224206A:
	ldr r0, _022420B0 ; =0x00000468
	ldr r0, [r6, r0]
	cmp r4, r0
	bne _02242084
	cmp r7, #1
	bne _02242084
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl ov81_02242DFC
	b _02242090
_02242084:
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl ov81_02242DFC
_02242090:
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov81_02242D88
	ldr r0, _022420AC ; =0x0000047C
	add r4, r4, #1
	ldr r0, [r6, r0]
	add r5, r5, #4
	cmp r4, r0
	blo _0224206A
_022420A8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022420AC: .word 0x0000047C
_022420B0: .word 0x00000468
	thumb_func_end ov81_02242058

	thumb_func_start ov81_022420B4
ov81_022420B4: ; 0x022420B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0224216C ; =0x0000047C
	ldr r0, [r5, r0]
	cmp r0, #3
	bne _022420CA
	mov r0, #0x50
	mov r7, #0x10
	str r0, [sp, #0xc]
	b _022420D0
_022420CA:
	mov r0, #0x70
	mov r7, #0x28
	str r0, [sp, #0xc]
_022420D0:
	mov r6, #0
	add r4, r6, #0
_022420D4:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	add r1, r0, #0
	mul r1, r4
	add r0, r7, r1
	str r0, [sp, #4]
	mov r0, #0xb0
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #2
	mov r3, #0
	bl ov81_02242CBC
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0xea
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _022420D4
	add r0, r1, #0
	add r0, #0xd4
	ldr r1, [r5, r0]
	cmp r1, #2
	bne _02242124
	sub r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov81_02242D88
_02242124:
	mov r6, #0
	cmp r4, #6
	bhs _02242166
_0224212A:
	lsl r0, r4, #2
	add r7, r5, r0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #3
	add r2, r6, #0
	mov r3, #0
	bl ov81_02242D18
	mov r1, #0xea
	lsl r1, r1, #2
	str r0, [r7, r1]
	add r0, r1, #0
	ldr r0, [r7, r0]
	mov r1, #0
	bl ov81_02242D88
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _0224212A
_02242166:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224216C: .word 0x0000047C
	thumb_func_end ov81_022420B4

	thumb_func_start ov81_02242170
ov81_02242170: ; 0x02242170
	push {r4, r5, r6, lr}
	mov r6, #0xea
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_0224217A:
	ldr r0, [r5, r6]
	bl ov81_02242D74
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _0224217A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov81_02242170

	thumb_func_start ov81_0224218C
ov81_0224218C: ; 0x0224218C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r7, #0xea
	add r5, r0, #0
	mov r4, #3
	lsl r7, r7, #2
_02242198:
	sub r0, r4, #3
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldrb r0, [r5, #0x11]
	cmp r1, r0
	bhs _022421F8
	lsl r0, r1, #1
	add r1, r5, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F30
	add r6, r0, #0
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp]
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #4]
	lsl r0, r4, #2
	add r6, r5, r0
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r1, r2, #0
	bl ov81_02242DCC
	ldr r0, [r6, r7]
	mov r1, #1
	bl ov81_02242D88
	b _02242208
_022421F8:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov81_02242D88
_02242208:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _02242198
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_0224218C

	thumb_func_start ov81_02242218
ov81_02242218: ; 0x02242218
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, r3
	bhs _022422FA
	add r0, r4, #0
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	str r0, [sp, #0x1c]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldr r0, [sp, #0x1c]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	mov r1, #0
	bl GetMonIconNaixEx
	add r1, r0, #0
	mov r0, #0x64
	str r0, [sp]
	mov r0, #0x14
	mov r2, #0
	add r3, sp, #0x24
	bl GfGfxLoader_GetCharData
	str r0, [sp, #0x20]
	mov r0, #0x12
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r2, #2
	lsl r1, r1, #2
	add r1, r5, r1
	sub r0, #0xec
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x24]
	lsl r2, r2, #8
	ldr r1, [r1, #0x14]
	mov r3, #2
	bl ov81_02242E14
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	mov r2, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	mov r0, #0x12
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	sub r0, #0xec
	lsl r2, r2, #2
	add r2, r5, r2
	ldr r0, [r2, r0]
	bl ov81_02242E08
	mov r0, #0x12
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	sub r0, #0xec
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r1, r0]
	mov r1, #1
	bl ov81_02242D88
	mov r1, #0x12
	lsl r1, r1, #6
	ldr r2, [r5, r1]
	mov r0, #1
	eor r0, r2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	sub r1, #0xec
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, r1]
	mov r1, #0
	bl ov81_02242D88
	mov r1, #0
	lsl r2, r6, #0x18
	str r1, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	str r1, [sp, #0x10]
	add r5, #0xd0
	add r1, r5, #0
	lsr r2, r2, #0x18
	mov r3, #4
	str r4, [sp, #0x14]
	bl ov81_022409B0
_022422FA:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_02242218

	thumb_func_start ov81_02242300
ov81_02242300: ; 0x02242300
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, r2
	bhs _022423C8
	mov r4, #0
	str r4, [sp, #0x18]
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	ble _02242364
	add r7, r5, #0
	add r7, #0x50
_0224231A:
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r2, [r1, r0]
	cmp r6, r2
	bne _0224232C
	mov r0, #1
	str r0, [sp, #0x18]
_0224232C:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r4, #2
	lsl r1, r1, #4
	lsl r2, r2, #0x18
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r7, r1
	lsr r2, r2, #0x18
	mov r3, #4
	bl ov81_022409B0
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldrb r0, [r5, #0x11]
	cmp r4, r0
	blt _0224231A
_02242364:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0224239C
	mov r2, #0
	str r2, [sp]
	mov r1, #0xf
	str r1, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	lsl r0, r1, #6
	add r2, r5, #0
	add r1, r4, #2
	ldr r0, [r5, r0]
	add r2, #0x50
	lsl r1, r1, #4
	add r1, r2, r1
	lsl r2, r6, #0x18
	str r0, [sp, #0x14]
	add r0, r5, #0
	lsr r2, r2, #0x18
	mov r3, #4
	bl ov81_022409B0
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224239C:
	ldr r0, _022423CC ; =0x0000047C
	ldr r0, [r5, r0]
	cmp r4, r0
	bhs _022423C8
	add r6, r5, #0
	add r6, #0x50
_022423A8:
	add r0, r4, #2
	lsl r7, r0, #4
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, r7
	bl ScheduleWindowCopyToVram
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, _022423CC ; =0x0000047C
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _022423A8
_022423C8:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022423CC: .word 0x0000047C
	thumb_func_end ov81_02242300

	thumb_func_start ov81_022423D0
ov81_022423D0: ; 0x022423D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _0224241C ; =0x0000047C
	add r7, r1, #0
	ldr r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	bls _02242416
	add r6, r5, #0
	add r6, #0x50
_022423E6:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	add r1, r4, #2
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, r1
	lsr r2, r2, #0x18
	mov r3, #4
	str r7, [sp, #0x14]
	bl ov81_022409B0
	ldr r0, _0224241C ; =0x0000047C
	add r4, r4, #1
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _022423E6
_02242416:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224241C: .word 0x0000047C
	thumb_func_end ov81_022423D0

	thumb_func_start ov81_02242420
ov81_02242420: ; 0x02242420
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _022424A8 ; =0x0000047C
	mov r4, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	bls _022424A4
	add r6, r5, #0
	lsl r0, r1, #0x18
	add r6, #0x50
	lsr r7, r0, #0x18
_02242438:
	mov r0, #0xf2
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, r4
	bne _0224246E
	mov r0, #0
	str r0, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #2
	lsl r1, r1, #4
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r6, r1
	add r2, r7, #0
	mov r3, #4
	bl ov81_022409B0
	b _0224249A
_0224246E:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r4, #2
	lsl r1, r1, #4
	lsl r2, r4, #0x18
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r6, r1
	lsr r2, r2, #0x18
	mov r3, #4
	bl ov81_022409B0
_0224249A:
	ldr r0, _022424A8 ; =0x0000047C
	add r4, r4, #1
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _02242438
_022424A4:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022424A8: .word 0x0000047C
	thumb_func_end ov81_02242420

	thumb_func_start ov81_022424AC
ov81_022424AC: ; 0x022424AC
	push {r4, r5, r6, lr}
	sub sp, #0x18
	mov r6, #0xf2
	lsl r6, r6, #2
	add r2, r1, #0
	ldrh r1, [r0, r6]
	add r1, r1, #2
	cmp r2, #4
	blo _022424CC
	add r0, #0x50
	lsl r1, r1, #4
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0x18
	pop {r4, r5, r6, pc}
_022424CC:
	lsl r4, r1, #4
	mov r1, #0
	str r1, [sp]
	mov r3, #0xf
	str r3, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	sub r1, r6, #4
	add r5, r0, #0
	ldr r1, [r0, r1]
	lsl r2, r2, #0x18
	add r5, #0x50
	str r1, [sp, #0x14]
	add r1, r5, r4
	lsr r2, r2, #0x18
	mov r3, #4
	bl ov81_022409B0
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov81_022424AC

	thumb_func_start ov81_02242500
ov81_02242500: ; 0x02242500
	push {r3, lr}
	mov r1, #0x1a
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #2
	mov r2, #0
	lsl r3, r1, #8
	bl sub_020032A4
	pop {r3, pc}
	thumb_func_end ov81_02242500

	thumb_func_start ov81_02242514
ov81_02242514: ; 0x02242514
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02242580
	ldr r1, _02242584 ; =0x00000478
	ldr r1, [r4, r1]
	cmp r1, #0xff
	beq _02242580
	bl sub_02003B44
	cmp r0, #0
	bne _02242580
	ldr r0, _02242584 ; =0x00000478
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0224255A
	mov r0, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _02242588 ; =0x0000FFFF
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r2, #8
	mov r3, #2
	bl sub_02003370
	b _02242576
_0224255A:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02242588 ; =0x0000FFFF
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r2, #8
	mov r3, #2
	bl sub_02003370
_02242576:
	ldr r1, _02242584 ; =0x00000478
	mov r0, #1
	ldr r2, [r4, r1]
	eor r0, r2
	str r0, [r4, r1]
_02242580:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02242584: .word 0x00000478
_02242588: .word 0x0000FFFF
	thumb_func_end ov81_02242514

	thumb_func_start ov81_0224258C
ov81_0224258C: ; 0x0224258C
	push {r3, r4}
	ldr r4, _022425BC ; =0x00000484
	strb r1, [r0, r4]
	add r1, r4, #1
	strb r2, [r0, r1]
	ldr r2, _022425C0 ; =0xFFFFFFF8
	add r1, r4, #2
	strb r3, [r0, r1]
	add r2, sp
	ldrb r3, [r2, #0x10]
	add r1, r4, #3
	strb r3, [r0, r1]
	ldrb r2, [r2, #0x14]
	add r1, r4, #7
	strb r2, [r0, r1]
	mov r2, #0
	add r1, r4, #4
	strb r2, [r0, r1]
	add r1, r4, #5
	strb r2, [r0, r1]
	add r1, r4, #6
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_022425BC: .word 0x00000484
_022425C0: .word 0xFFFFFFF8
	thumb_func_end ov81_0224258C

	thumb_func_start ov81_022425C4
ov81_022425C4: ; 0x022425C4
	push {r4, lr}
	sub sp, #8
	mov r4, #2
	str r4, [sp]
	str r3, [sp, #4]
	mov r3, #0xc
	bl ov81_0224258C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov81_022425C4

	thumb_func_start ov81_022425D8
ov81_022425D8: ; 0x022425D8
	push {r4, lr}
	sub sp, #8
	mov r4, #2
	str r4, [sp]
	str r3, [sp, #4]
	mov r3, #7
	bl ov81_0224258C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov81_022425D8

	thumb_func_start ov81_022425EC
ov81_022425EC: ; 0x022425EC
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _0224268C ; =0x00000489
	add r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	bne _02242656
	add r0, r3, #1
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _02242624
	sub r0, r3, #3
	ldrb r0, [r4, r0]
	sub r2, r3, #5
	mov r1, #5
	str r0, [sp]
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	sub r3, r3, #4
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0x4c]
	bl BgTilemapRectChangePalette
	b _02242644
_02242624:
	sub r0, r3, #3
	ldrb r0, [r4, r0]
	sub r2, r3, #5
	mov r1, #5
	str r0, [sp]
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	sub r3, r3, #4
	str r0, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0x4c]
	bl BgTilemapRectChangePalette
_02242644:
	ldr r0, [r4, #0x4c]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, _02242690 ; =0x0000048A
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r0, r2
	strb r0, [r4, r1]
_02242656:
	ldr r1, _0224268C ; =0x00000489
	ldrb r0, [r4, r1]
	add r0, r0, #1
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #2
	bne _02242684
	sub r0, r1, #1
	ldrb r0, [r4, r0]
	add r2, r0, #1
	sub r0, r1, #1
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _02242680
	add r0, r1, #2
	ldrb r0, [r4, r0]
	add sp, #0xc
	strb r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, pc}
_02242680:
	mov r0, #0
	strb r0, [r4, r1]
_02242684:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224268C: .word 0x00000489
_02242690: .word 0x0000048A
	thumb_func_end ov81_022425EC

	thumb_func_start ov81_02242694
ov81_02242694: ; 0x02242694
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	cmp r1, #1
	bne _022426D2
	mov r0, #0xa
	str r0, [sp]
	ldr r0, _022426FC ; =0x04001050
	mov r1, #0
	mov r2, #0xf
	mov r3, #6
	bl G2x_SetBlendAlpha_
	ldrb r0, [r5, #0x12]
	mov r6, #0
	cmp r0, #0
	bls _022426FA
	mov r7, #0x36
	add r4, r5, #0
	lsl r7, r7, #4
_022426BA:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _022426C6
	mov r1, #1
	bl ov81_02242FBC
_022426C6:
	ldrb r0, [r5, #0x12]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blo _022426BA
	pop {r3, r4, r5, r6, r7, pc}
_022426D2:
	ldr r0, _02242700 ; =0x04000050
	mov r6, #0
	strh r6, [r0]
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	bls _022426FA
	mov r7, #0x36
	add r4, r5, #0
	lsl r7, r7, #4
_022426E4:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _022426F0
	mov r1, #0
	bl ov81_02242FBC
_022426F0:
	ldrb r0, [r5, #0x12]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blo _022426E4
_022426FA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022426FC: .word 0x04001050
_02242700: .word 0x04000050
	thumb_func_end ov81_02242694

	thumb_func_start ov81_02242704
ov81_02242704: ; 0x02242704
	ldr r3, _0224270C ; =ov80_02237254
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx r3
	.balign 4, 0
_0224270C: .word ov80_02237254
	thumb_func_end ov81_02242704

	thumb_func_start ov81_02242710
ov81_02242710: ; 0x02242710
	ldr r3, _02242718 ; =ov80_02237254
	ldrb r0, [r0, #9]
	bx r3
	nop
_02242718: .word ov80_02237254
	thumb_func_end ov81_02242710

	thumb_func_start ov81_0224271C
ov81_0224271C: ; 0x0224271C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r1, #2
	mov r2, #1
	mov r3, #0x64
	bl sub_0201956C
	ldr r1, _02242758 ; =0x00000474
	mov r2, #4
	str r0, [r4, r1]
	str r2, [sp]
	ldr r0, [r4, r1]
	mov r1, #0
	mov r3, #0x12
	bl sub_020195F4
	mov r0, #1
	ldr r2, _02242758 ; =0x00000474
	str r0, [sp]
	ldr r0, [r4, r2]
	sub r2, #0x98
	ldr r2, [r4, r2]
	mov r1, #0
	mov r3, #0x90
	bl sub_020196B8
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02242758: .word 0x00000474
	thumb_func_end ov81_0224271C

	thumb_func_start ov81_0224275C
ov81_0224275C: ; 0x0224275C
	ldr r1, _02242764 ; =0x00000474
	ldr r3, _02242768 ; =sub_020195C0
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_02242764: .word 0x00000474
_02242768: .word sub_020195C0
	thumb_func_end ov81_0224275C

	thumb_func_start ov81_0224276C
ov81_0224276C: ; 0x0224276C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ov81_02242B90
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x64
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	mov r0, #0x20
	add r1, r5, #4
	mov r2, #0x64
	bl G2dRenderer_Init
	mov r2, #2
	str r0, [r5]
	add r0, r5, #4
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r4, _02242A88 ; =ov81_02243594
	mov r7, #0
	add r6, r5, #0
_022427B0:
	ldrb r0, [r4]
	add r1, r7, #0
	mov r2, #0x64
	bl Create2DGfxResObjMan
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r7, r7, #1
	add r4, r4, #1
	add r6, r6, #4
	cmp r7, #4
	blt _022427B0
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xc8
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x28
	bl AddCharResObjFromNarc
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	add r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x3e
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd0
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x29
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd4
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2a
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xc8
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2b
	bl AddCharResObjFromNarc
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	add r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x3f
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd0
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2c
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd4
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2d
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #0
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xc8
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r3, #1
	bl AddCharResObjFromNarc
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	add r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x34
	bl AddPlttResObjFromNarc
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r2, #2
	str r2, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd0
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd4
	mov r2, #1
	ldr r0, [r5, r0]
	mov r1, #0xb8
	add r3, r2, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xc8
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2b
	mov r3, #1
	bl AddCharResObjFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	add r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x3f
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd0
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2c
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd4
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2d
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r4, #0
	add r6, r5, #0
	mov r7, #2
_022429C8:
	add r0, r4, #4
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xc8
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2e
	mov r3, #1
	bl AddCharResObjFromNarc
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r6, r1]
	bl sub_02074490
	add r2, r0, #0
	add r0, r4, #4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	add r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0x14
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r6, r1]
	add r0, r4, #4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd0
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x2f
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r4, #4
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, #0xd4
	ldr r0, [r5, r0]
	mov r1, #0xb8
	mov r2, #0x30
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r4, r4, #1
	add r6, #0x10
	cmp r4, #2
	blt _022429C8
	add r7, r1, #0
	add r6, r1, #0
	mov r4, #0
	sub r7, #0x4c
	sub r6, #0x48
_02242A60:
	ldr r0, [r5, r7]
	bl sub_0200ACF0
	ldr r0, [r5, r6]
	bl sub_0200AF94
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _02242A60
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02242A88: .word ov81_02243594
	thumb_func_end ov81_0224276C

	thumb_func_start ov81_02242A8C
ov81_02242A8C: ; 0x02242A8C
	push {r4, r5, r6, lr}
	sub sp, #0x80
	add r5, r0, #0
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	add r4, r3, #0
	str r0, [sp, #8]
	mov r3, #0
	ldr r0, [sp, #0x90]
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x4b
	lsl r0, r0, #2
	add r6, r2, #0
	ldr r2, [r5, r0]
	str r2, [sp, #0x14]
	add r2, r0, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r0, #0
	add r2, #8
	ldr r2, [r5, r2]
	add r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	add r2, r1, #0
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	add r0, sp, #0x5c
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5]
	mov r1, #0
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
	str r4, [sp, #0x50]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _02242B00
	mov r0, #1
	str r0, [sp, #0x54]
	b _02242B04
_02242B00:
	mov r0, #2
	str r0, [sp, #0x54]
_02242B04:
	mov r0, #0x64
	str r0, [sp, #0x58]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x14]
	cmp r0, #1
	bne _02242B1A
	mov r0, #2
	ldr r1, [sp, #0x38]
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [sp, #0x38]
_02242B1A:
	add r0, sp, #0x2c
	bl CreateSprite
	add r4, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add sp, #0x80
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov81_02242A8C

	thumb_func_start ov81_02242B38
ov81_02242B38: ; 0x02242B38
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #5
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #6
_02242B42:
	lsl r0, r4, #4
	add r6, r5, r0
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	ldr r0, [r6, r7]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _02242B42
	mov r6, #0x4b
	mov r4, #0
	lsl r6, r6, #2
_02242B66:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl Destroy2DGfxResObjMan
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02242B66
	ldr r0, [r5]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_02242B38

	thumb_func_start ov81_02242B90
ov81_02242B90: ; 0x02242B90
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02242BC0 ; =ov81_02243598
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r1, _02242BC4 ; =0x00100010
	add r0, r2, #0
	add r2, r1, #0
	bl sub_020215C0
	mov r0, #8
	mov r1, #0x64
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02242BC0: .word ov81_02243598
_02242BC4: .word 0x00100010
	thumb_func_end ov81_02242B90

	thumb_func_start ov81_02242BC8
ov81_02242BC8: ; 0x02242BC8
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02242C30 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02242C34 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02242C38 ; =0x0000CFFB
	and r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	sub r2, #0x1c
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _02242C3C ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02242C40 ; =0xBFFF0000
	ldr r0, _02242C44 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_02242C30: .word 0x04000008
_02242C34: .word 0xFFFFCFFD
_02242C38: .word 0x0000CFFB
_02242C3C: .word 0x00007FFF
_02242C40: .word 0xBFFF0000
_02242C44: .word 0x04000580
	thumb_func_end ov81_02242BC8

	thumb_func_start ov81_02242C48
ov81_02242C48: ; 0x02242C48
	push {r4, lr}
	add r4, r0, #0
	bl sub_02026E48
	ldr r2, _02242C78 ; =0x04000440
	mov r3, #0
	add r1, r2, #0
	str r3, [r2]
	add r1, #0x14
	str r3, [r1]
	mov r0, #2
	str r0, [r2]
	str r3, [r1]
	bl NNS_G3dGlbFlushP
	bl NNS_G2dSetupSoftwareSpriteCamera
	add r0, r4, #0
	bl sub_02008120
	ldr r0, _02242C7C ; =0x04000540
	mov r1, #1
	str r1, [r0]
	pop {r4, pc}
	.balign 4, 0
_02242C78: .word 0x04000440
_02242C7C: .word 0x04000540
	thumb_func_end ov81_02242C48

	thumb_func_start ov81_02242C80
ov81_02242C80: ; 0x02242C80
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	add r0, sp, #0x10
	mov r2, #2
	add r6, r3, #0
	bl GetPokemonSpriteCharAndPlttNarcIds
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, sp, #0x10
	add r2, r6, #0
	bl sub_020085EC
	add sp, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end ov81_02242C80

	thumb_func_start ov81_02242CB0
ov81_02242CB0: ; 0x02242CB0
	ldr r3, _02242CB8 ; =sub_020087A4
	add r2, r1, #0
	mov r1, #0x23
	bx r3
	.balign 4, 0
_02242CB8: .word sub_020087A4
	thumb_func_end ov81_02242CB0

	thumb_func_start ov81_02242CBC
ov81_02242CBC: ; 0x02242CBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #0x64
	mov r1, #0xc
	str r2, [sp, #8]
	add r5, r3, #0
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
	strb r1, [r4, #8]
	strb r1, [r4, #9]
	strb r1, [r4, #0xa]
	ldr r0, [sp, #0x24]
	strb r1, [r4, #0xb]
	str r0, [r4]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #8]
	str r0, [r4, #4]
	str r5, [sp]
	str r1, [sp, #4]
	ldr r3, [sp, #0x20]
	add r0, r6, #0
	add r1, r7, #0
	bl ov81_02242A8C
	str r0, [r4, #8]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	add r0, r4, #0
	bl ov81_02242D94
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_02242CBC

	thumb_func_start ov81_02242D18
ov81_02242D18: ; 0x02242D18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #0x64
	mov r1, #0xc
	str r2, [sp, #8]
	add r5, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #8]
	str r0, [r4]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [r4, #4]
	str r5, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	bl ov81_02242A8C
	str r0, [r4, #8]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	add r0, r4, #0
	bl ov81_02242DAC
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov81_02242D18

	thumb_func_start ov81_02242D74
ov81_02242D74: ; 0x02242D74
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02024758
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02242D74

	thumb_func_start ov81_02242D88
ov81_02242D88: ; 0x02242D88
	ldr r3, _02242D90 ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #8]
	bx r3
	nop
_02242D90: .word Set2dSpriteVisibleFlag
	thumb_func_end ov81_02242D88

	thumb_func_start ov81_02242D94
ov81_02242D94: ; 0x02242D94
	push {lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	lsl r1, r2, #0xc
	str r1, [sp, #4]
	ldr r0, [r0, #8]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	thumb_func_end ov81_02242D94

	thumb_func_start ov81_02242DAC
ov81_02242DAC: ; 0x02242DAC
	push {lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r1, #2
	lsl r2, r2, #0xc
	lsl r1, r1, #0x14
	add r1, r2, r1
	str r1, [sp, #4]
	ldr r0, [r0, #8]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov81_02242DAC

	thumb_func_start ov81_02242DCC
ov81_02242DCC: ; 0x02242DCC
	ldr r3, _02242DD4 ; =sub_020247D4
	ldr r0, [r0, #8]
	bx r3
	nop
_02242DD4: .word sub_020247D4
	thumb_func_end ov81_02242DCC

	thumb_func_start ov81_02242DD8
ov81_02242DD8: ; 0x02242DD8
	ldr r3, _02242DE0 ; =sub_02024B68
	ldr r0, [r0, #8]
	bx r3
	nop
_02242DE0: .word sub_02024B68
	thumb_func_end ov81_02242DD8

	thumb_func_start ov81_02242DE4
ov81_02242DE4: ; 0x02242DE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	mov r1, #0
	bl sub_020249D4
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02242DE4

	thumb_func_start ov81_02242DFC
ov81_02242DFC: ; 0x02242DFC
	ldr r3, _02242E04 ; =sub_02024A14
	ldr r0, [r0, #8]
	bx r3
	nop
_02242E04: .word sub_02024A14
	thumb_func_end ov81_02242DFC

	thumb_func_start ov81_02242E08
ov81_02242E08: ; 0x02242E08
	ldr r3, _02242E10 ; =sub_02024A48
	ldr r0, [r0, #8]
	bx r3
	nop
_02242E10: .word sub_02024A48
	thumb_func_end ov81_02242E08

	thumb_func_start ov81_02242E14
ov81_02242E14: ; 0x02242E14
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #8]
	add r6, r3, #0
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02024B1C
	add r1, r6, #0
	bl NNS_G2dGetImageLocation
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl DC_FlushRange
	cmp r6, #1
	bne _02242E42
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl GX_LoadOBJ
	pop {r3, r4, r5, r6, r7, pc}
_02242E42:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl GXS_LoadOBJ
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov81_02242E14

	thumb_func_start ov81_02242E50
ov81_02242E50: ; 0x02242E50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x10
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02242E6A:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02242E6A
	mov r1, #0
	strh r1, [r4]
	str r5, [r4, #4]
	str r6, [r4, #8]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r1, #0
	mov r3, #0xa
	bl ov81_02242A8C
	str r0, [r4, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov81_02242F10
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02024A14
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_02242E50

	thumb_func_start ov81_02242EA4
ov81_02242EA4: ; 0x02242EA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02024758
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02242EA4

	thumb_func_start ov81_02242EB8
ov81_02242EB8: ; 0x02242EB8
	ldr r3, _02242EC0 ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242EC0: .word Set2dSpriteVisibleFlag
	thumb_func_end ov81_02242EB8

	thumb_func_start ov81_02242EC4
ov81_02242EC4: ; 0x02242EC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	lsl r0, r6, #0xc
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	lsl r0, r7, #0xc
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	mov r1, ip
	bl sub_020247D4
	ldr r0, [r4, #0xc]
	bl sub_020248AC
	add r2, r0, #0
	ldmia r2!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r2]
	str r0, [r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov81_02242EC4

	thumb_func_start ov81_02242F10
ov81_02242F10: ; 0x02242F10
	push {lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r1, #2
	lsl r2, r2, #0xc
	lsl r1, r1, #0x14
	add r1, r2, r1
	str r1, [sp, #4]
	ldr r0, [r0, #0xc]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov81_02242F10

	thumb_func_start ov81_02242F30
ov81_02242F30: ; 0x02242F30
	ldr r3, _02242F38 ; =sub_020248AC
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242F38: .word sub_020248AC
	thumb_func_end ov81_02242F30

	thumb_func_start ov81_02242F3C
ov81_02242F3C: ; 0x02242F3C
	strh r1, [r0]
	bx lr
	thumb_func_end ov81_02242F3C

	thumb_func_start ov81_02242F40
ov81_02242F40: ; 0x02242F40
	ldrh r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end ov81_02242F40

	thumb_func_start ov81_02242F48
ov81_02242F48: ; 0x02242F48
	ldr r3, _02242F50 ; =ov81_02242F3C
	mov r1, #1
	bx r3
	nop
_02242F50: .word ov81_02242F3C
	thumb_func_end ov81_02242F48

	thumb_func_start ov81_02242F54
ov81_02242F54: ; 0x02242F54
	ldr r3, _02242F5C ; =ov81_02242F3C
	mov r1, #0
	bx r3
	nop
_02242F5C: .word ov81_02242F3C
	thumb_func_end ov81_02242F54

	thumb_func_start ov81_02242F60
ov81_02242F60: ; 0x02242F60
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov81_02242F30
	ldr r2, [r0]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	add r1, #0xf8
	lsl r1, r1, #0xc
	str r1, [sp]
	ldr r0, [r0, #4]
	add r1, sp, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02242F60

	thumb_func_start ov81_02242F8C
ov81_02242F8C: ; 0x02242F8C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov81_02242F8C

	thumb_func_start ov81_02242F90
ov81_02242F90: ; 0x02242F90
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov81_02242F90

	thumb_func_start ov81_02242F94
ov81_02242F94: ; 0x02242F94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	ldr r0, [r5, #0xc]
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov81_02242F94

	thumb_func_start ov81_02242FB0
ov81_02242FB0: ; 0x02242FB0
	ldr r3, _02242FB8 ; =sub_02024A14
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242FB8: .word sub_02024A14
	thumb_func_end ov81_02242FB0

	thumb_func_start ov81_02242FBC
ov81_02242FBC: ; 0x02242FBC
	ldr r3, _02242FC4 ; =sub_02024B78
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242FC4: .word sub_02024B78
	thumb_func_end ov81_02242FBC

	thumb_func_start ov81_02242FC8
ov81_02242FC8: ; 0x02242FC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02024758
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02242FC8

	thumb_func_start ov81_02242FDC
ov81_02242FDC: ; 0x02242FDC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r4, #0
_02242FE4:
	ldr r2, _02243008 ; =ov81_022435A8
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
	cmp r4, #0x12
	blo _02242FE4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243008: .word ov81_022435A8
	thumb_func_end ov81_02242FDC

	thumb_func_start ov81_0224300C
ov81_0224300C: ; 0x0224300C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_02243012:
	lsl r0, r4, #4
	add r0, r5, r0
	bl RemoveWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _02243012
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov81_0224300C

	thumb_func_start ov81_02243028
ov81_02243028: ; 0x02243028
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	bl GetWindowBgId
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02243064 ; =0x000003E2
	mov r3, #0xb
	bl LoadUserFrameGfx2
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _02243064 ; =0x000003E2
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow2
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02243064: .word 0x000003E2
	thumb_func_end ov81_02243028

	thumb_func_start ov81_02243068
ov81_02243068: ; 0x02243068
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #1
	bne _02243086
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	sub r5, r5, r0
	b _02243096
_02243086:
	cmp r0, #2
	bne _02243096
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r0, r0, #1
	sub r5, r5, r0
_02243096:
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
	thumb_func_end ov81_02243068

	thumb_func_start ov81_022430B4
ov81_022430B4: ; 0x022430B4
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
	bl ov81_02243068
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov81_022430B4

	thumb_func_start ov81_022430E8
ov81_022430E8: ; 0x022430E8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl SetWindowX
	add r4, #0x10
	add r0, r4, #0
	mov r1, #0x12
	bl SetWindowX
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_022430E8

	thumb_func_start ov81_02243100
ov81_02243100: ; 0x02243100
	push {r4, lr}
	sub sp, #0x10
	add r2, r0, #0
	ldr r0, _0224313C ; =0x000003D9
	add r4, r1, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x64
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x86
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x40
	mov r1, #0xc2
	str r0, [sp]
	mov r0, #0x64
	add r3, r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #4
	add r3, #0x5e
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0224313C: .word 0x000003D9
	thumb_func_end ov81_02243100

	thumb_func_start ov81_02243140
ov81_02243140: ; 0x02243140
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r0, #0
	add r4, r2, #0
	mov r0, #0x64
	str r0, [sp]
	add r0, r1, #0
	add r1, r4, #0
	add r1, #0x87
	mov r2, #1
	add r3, sp, #0x24
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [sp, #0x20]
	cmp r4, #0
	bne _0224316A
	mov r0, #0xb
	str r0, [sp, #0x10]
	mov r0, #7
	str r0, [sp, #0x18]
	b _02243172
_0224316A:
	mov r0, #0xe
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x18]
_02243172:
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x1c]
	add r0, #0xc
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bls _022431D2
_02243184:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	mov r4, #0
	add r2, r1, r0
	lsl r1, r0, #6
	ldr r0, [sp, #0x1c]
	add r5, r0, r1
	lsl r0, r2, #0x18
	lsr r6, r0, #0x18
_02243196:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	lsl r2, r4, #1
	ldrh r3, [r5, r2]
	ldr r2, _022431DC ; =0x000003D9
	add r0, r7, #0
	add r2, r3, r2
	lsl r2, r2, #0x10
	mov r1, #5
	lsr r2, r2, #0x10
	add r3, r4, #0
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x20
	blo _02243196
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	blo _02243184
_022431D2:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022431DC: .word 0x000003D9
	thumb_func_end ov81_02243140

	thumb_func_start ov81_022431E0
ov81_022431E0: ; 0x022431E0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #0
	bne _022431F0
	mov r0, #0xb
	mov r1, #7
	b _022431F4
_022431F0:
	mov r0, #0xe
	mov r1, #4
_022431F4:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #9
	mov r2, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl FillBgTilemapRect
	add r0, r4, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov81_022431E0

	thumb_func_start ov81_02243220
ov81_02243220: ; 0x02243220
	ldr r3, _02243224 ; =sub_02019BDC
	bx r3
	.balign 4, 0
_02243224: .word sub_02019BDC
	thumb_func_end ov81_02243220

	thumb_func_start ov81_02243228
ov81_02243228: ; 0x02243228
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0201A018
	ldrb r1, [r0]
	str r1, [r5]
	ldrb r0, [r0, #1]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02243228

	thumb_func_start ov81_0224323C
ov81_0224323C: ; 0x0224323C
	bx lr
	.balign 4, 0
	thumb_func_end ov81_0224323C

	thumb_func_start ov81_02243240
ov81_02243240: ; 0x02243240
	push {lr}
	sub sp, #0xc
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	ldr r0, _02243264 ; =ov81_022436F0
	ldr r1, _02243268 ; =ov81_02243808
	ldr r2, _0224326C ; =ov81_02243658
	bl sub_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_02243264: .word ov81_022436F0
_02243268: .word ov81_02243808
_0224326C: .word ov81_02243658
	thumb_func_end ov81_02243240

	thumb_func_start ov81_02243270
ov81_02243270: ; 0x02243270
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	bne _0224327E
	bl sub_02019FC4
	pop {r4, pc}
_0224327E:
	mov r1, #6
	bl sub_02019FD0
	add r0, r4, #0
	mov r1, #7
	bl sub_02019FD0
	add r0, r4, #0
	mov r1, #8
	bl sub_02019FD0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov81_02243270

	thumb_func_start ov81_02243298
ov81_02243298: ; 0x02243298
	push {r3, lr}
	cmp r1, #6
	blt _022432A4
	bl ov81_0224141C
	pop {r3, pc}
_022432A4:
	bl ov81_022413F4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov81_02243298

	thumb_func_start ov81_022432AC
ov81_022432AC: ; 0x022432AC
	push {lr}
	sub sp, #0xc
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	ldr r0, _022432D0 ; =ov81_02243668
	ldr r1, _022432D4 ; =ov81_02243750
	ldr r2, _022432D8 ; =ov81_02243648
	bl sub_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_022432D0: .word ov81_02243668
_022432D4: .word ov81_02243750
_022432D8: .word ov81_02243648
	thumb_func_end ov81_022432AC

	thumb_func_start ov81_022432DC
ov81_022432DC: ; 0x022432DC
	push {r3, r4, lr}
	sub sp, #0xc
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	ldr r0, _02243308 ; =ov81_02243688
	ldr r1, _0224330C ; =ov81_02243718
	ldr r2, _02243310 ; =ov81_02243648
	bl sub_02019BA4
	mov r1, #2
	add r4, r0, #0
	bl sub_02019FD0
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02243308: .word ov81_02243688
_0224330C: .word ov81_02243718
_02243310: .word ov81_02243648
	thumb_func_end ov81_022432DC

	thumb_func_start ov81_02243314
ov81_02243314: ; 0x02243314
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #1
	bne _0224332C
	bl sub_02019FC4
	add r0, r5, #0
	mov r1, #3
	bl sub_02019FD0
	b _02243348
_0224332C:
	bl sub_02019FC4
	add r0, r5, #0
	mov r1, #4
	bl sub_02019FD0
	add r0, r5, #0
	mov r1, #5
	bl sub_02019FD0
	add r0, r5, #0
	mov r1, #6
	bl sub_02019FD0
_02243348:
	add r0, r4, #0
	bl ov81_02242704
	cmp r0, #1
	bne _0224335A
	add r0, r5, #0
	mov r1, #2
	bl sub_02019FD0
_0224335A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02243314

	thumb_func_start ov81_0224335C
ov81_0224335C: ; 0x0224335C
	push {r3, lr}
	cmp r1, #4
	blt _02243368
	bl ov81_0224141C
	pop {r3, pc}
_02243368:
	bl ov81_02241650
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov81_0224335C

	thumb_func_start ov81_02243370
ov81_02243370: ; 0x02243370
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov81_02243220
	add r0, r4, #0
	bl ov81_02242710
	cmp r0, #1
	bne _0224338E
	add r0, r4, #0
	mov r1, #0
	bl ov81_022432DC
	pop {r4, pc}
_0224338E:
	add r0, r4, #0
	mov r1, #0
	bl ov81_022432AC
	pop {r4, pc}
	thumb_func_end ov81_02243370

	thumb_func_start ov81_02243398
ov81_02243398: ; 0x02243398
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, r1, #0
	bl ov81_02243220
	add r0, r4, #0
	bl ov81_02242710
	cmp r0, #1
	bne _022433CA
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	ldr r0, _022433E8 ; =ov81_022436CC
	ldr r1, _022433EC ; =ov81_02243788
	ldr r2, _022433F0 ; =ov81_02243638
	add r3, r4, #0
	bl sub_02019BA4
	add sp, #0xc
	pop {r3, r4, pc}
_022433CA:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	ldr r0, _022433F4 ; =ov81_022436A8
	ldr r1, _022433F8 ; =ov81_022437C8
	ldr r2, _022433F0 ; =ov81_02243638
	add r3, r4, #0
	bl sub_02019BA4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_022433E8: .word ov81_022436CC
_022433EC: .word ov81_02243788
_022433F0: .word ov81_02243638
_022433F4: .word ov81_022436A8
_022433F8: .word ov81_022437C8
	thumb_func_end ov81_02243398

	thumb_func_start ov81_022433FC
ov81_022433FC: ; 0x022433FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #1
	bne _0224341C
	bl sub_02019FC4
	add r0, r5, #0
	mov r1, #4
	bl sub_02019FD0
	add r0, r5, #0
	mov r1, #5
	bl sub_02019FD0
	b _02243430
_0224341C:
	bl sub_02019FC4
	add r0, r5, #0
	mov r1, #6
	bl sub_02019FD0
	add r0, r5, #0
	mov r1, #7
	bl sub_02019FD0
_02243430:
	add r0, r4, #0
	bl ov81_02242704
	cmp r0, #0
	bne _02243442
	add r0, r5, #0
	mov r1, #3
	bl sub_02019FD0
_02243442:
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_022433FC

	thumb_func_start ov81_02243444
ov81_02243444: ; 0x02243444
	push {r3, lr}
	cmp r1, #6
	blt _02243450
	bl ov81_0224141C
	pop {r3, pc}
_02243450:
	bl ov81_022416CC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov81_02243444

	.rodata

_02243458:
	.byte 0x00, 0x01, 0x03, 0x04

ov81_0224345C: ; 0x0224345C
	.byte 0x60, 0x00

ov81_0224345E: ; 0x0224345E
	.byte 0x40, 0x00
	.byte 0x98, 0x00, 0x40, 0x00

ov81_02243464: ; 0x02243464
	.byte 0x40, 0x00

ov81_02243466: ; 0x02243466
	.byte 0x40, 0x00, 0x78, 0x00, 0x40, 0x00, 0xB0, 0x00, 0x40, 0x00

ov81_02243470: ; 0x02243470
	.byte 0x28, 0x00

ov81_02243472: ; 0x02243472
	.byte 0x40, 0x00, 0x60, 0x00, 0x40, 0x00, 0x98, 0x00, 0x40, 0x00, 0xD0, 0x00, 0x40, 0x00

ov81_02243480: ; 0x02243480
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov81_02243490: ; 0x02243490
	.byte 0x18, 0x00

ov81_02243492: ; 0x02243492
	.byte 0x40, 0x00, 0x40, 0x00, 0x40, 0x00, 0x68, 0x00, 0x40, 0x00, 0x90, 0x00, 0x40, 0x00
	.byte 0xB8, 0x00, 0x40, 0x00, 0xE0, 0x00, 0x40, 0x00

ov81_022434A8: ; 0x022434A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov81_022434C4: ; 0x022434C4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x06, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov81_022434E0: ; 0x022434E0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov81_022434FC: ; 0x022434FC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov81_02243518: ; 0x02243518
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov81_02243534: ; 0x02243534
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov81_02243550: ; 0x02243550
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov81_0224356C: ; 0x0224356C
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov81_02243594: ; 0x02243594
	.byte 0x06, 0x06, 0x06, 0x06

ov81_02243598: ; 0x02243598
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00

ov81_022435A8: ; 0x022435A8
	.byte 0x01, 0x01, 0x08, 0x08, 0x02, 0x0D, 0x01, 0x00
	.byte 0x01, 0x01, 0x01, 0x08, 0x02, 0x0D, 0x11, 0x00, 0x01, 0x01, 0x0B, 0x0A, 0x02, 0x0D, 0x21, 0x00
	.byte 0x01, 0x0B, 0x0B, 0x0A, 0x02, 0x0D, 0x35, 0x00, 0x01, 0x15, 0x0B, 0x0A, 0x02, 0x0D, 0x49, 0x00
	.byte 0x01, 0x04, 0x04, 0x0A, 0x02, 0x0D, 0x6D, 0x00, 0x01, 0x12, 0x04, 0x0A, 0x02, 0x0D, 0x81, 0x00
	.byte 0x05, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00, 0x05, 0x0C, 0x01, 0x0A, 0x02, 0x0D, 0x6D, 0x00
	.byte 0x05, 0x02, 0x0F, 0x07, 0x02, 0x09, 0x81, 0x00, 0x05, 0x17, 0x0F, 0x07, 0x02, 0x09, 0x8F, 0x00
	.byte 0x05, 0x02, 0x0C, 0x0C, 0x02, 0x09, 0x9D, 0x00, 0x05, 0x12, 0x0C, 0x0C, 0x02, 0x09, 0xB5, 0x00
	.byte 0x05, 0x12, 0x0C, 0x0C, 0x02, 0x09, 0xCD, 0x00, 0x05, 0x0A, 0x0F, 0x0C, 0x02, 0x09, 0xE5, 0x00
	.byte 0x05, 0x12, 0x0C, 0x0C, 0x02, 0x09, 0xB5, 0x00, 0x05, 0x02, 0x0F, 0x0C, 0x02, 0x09, 0xCD, 0x00
	.byte 0x05, 0x12, 0x0F, 0x0C, 0x02, 0x09, 0xE5, 0x00

ov81_02243638: ; 0x02243638
	.word ov81_0224323C
	.word ov81_0224323C
	.word ov81_02243444
	.word ov81_02243444

ov81_02243648: ; 0x02243648
	.word ov81_0224323C
	.word ov81_0224323C
	.word ov81_0224335C
	.word ov81_0224335C

ov81_02243658: ; 0x02243658
	.word ov81_0224323C
	.word ov81_0224323C
	.word ov81_02243298
	.word ov81_02243298

ov81_02243668: ; 0x02243668
	.byte 0x2C, 0x53, 0x2C, 0x53, 0x2C, 0x53, 0x64, 0x8B
	.byte 0x2C, 0x53, 0x9C, 0xC3, 0x74, 0x8B, 0xB4, 0xF3, 0x5C, 0x73, 0x0C, 0x73, 0x5C, 0x73, 0x8C, 0xF3
	.byte 0x74, 0x8B, 0x4C, 0xB3, 0xFF, 0x00, 0x00, 0x00

ov81_02243688: ; 0x02243688
	.byte 0x2C, 0x53, 0x4C, 0x73, 0x2C, 0x53, 0x84, 0xAB
	.byte 0x00, 0x00, 0x00, 0x00, 0x74, 0x8B, 0xB4, 0xF3, 0x5C, 0x73, 0x0C, 0x73, 0x5C, 0x73, 0x8C, 0xF3
	.byte 0x74, 0x8B, 0x4C, 0xB3, 0xFF, 0x00, 0x00, 0x00

ov81_022436A8: ; 0x022436A8
	.byte 0x2C, 0x53, 0x2C, 0x53, 0x2C, 0x53, 0x64, 0x8B
	.byte 0x2C, 0x53, 0x9C, 0xC3, 0x00, 0x00, 0x00, 0x00, 0x74, 0x8B, 0x0C, 0x4B, 0x74, 0x8B, 0xB4, 0xF3
	.byte 0x74, 0x8B, 0x0C, 0x73, 0x74, 0x8C, 0x8C, 0xF3, 0xFF, 0x00, 0x00, 0x00

ov81_022436CC: ; 0x022436CC
	.byte 0x2C, 0x53, 0x14, 0x3B
	.byte 0x2C, 0x53, 0x4C, 0x73, 0x2C, 0x53, 0x84, 0xAB, 0x2C, 0x53, 0xBC, 0xE3, 0x74, 0x8B, 0x0C, 0x4B
	.byte 0x74, 0x8B, 0xB4, 0xF3, 0x74, 0x8B, 0x0C, 0x73, 0x74, 0x8C, 0x8C, 0xF3, 0xFF, 0x00, 0x00, 0x00

ov81_022436F0: ; 0x022436F0
	.byte 0x2C, 0x53, 0x04, 0x2B, 0x2C, 0x53, 0x2C, 0x53, 0x2C, 0x53, 0x54, 0x7B, 0x2C, 0x53, 0x7C, 0xA3
	.byte 0x2C, 0x53, 0xA4, 0xCB, 0x2C, 0x53, 0xCC, 0xF3, 0x5C, 0x73, 0x0C, 0x73, 0x5C, 0x73, 0x8C, 0xF3
	.byte 0x74, 0x8B, 0x4C, 0xB3, 0xFF, 0x00, 0x00, 0x00

ov81_02243718: ; 0x02243718
	.byte 0x60, 0x40, 0x00, 0x00, 0x03, 0x03, 0x03, 0x01
	.byte 0x98, 0x40, 0x00, 0x00, 0x03, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x02, 0x02
	.byte 0xD4, 0x80, 0x00, 0x00, 0x80, 0x80, 0x01, 0x00, 0x40, 0x68, 0x00, 0x00, 0x04, 0x06, 0x04, 0x05
	.byte 0xC0, 0x68, 0x00, 0x00, 0x05, 0x06, 0x04, 0x05, 0x80, 0x80, 0x00, 0x00, 0x84, 0x06, 0x06, 0x06

ov81_02243750: ; 0x02243750
	.byte 0x40, 0x40, 0x00, 0x00, 0x03, 0x03, 0x03, 0x01, 0x78, 0x40, 0x00, 0x00, 0x03, 0x03, 0x00, 0x02
	.byte 0xB0, 0x40, 0x00, 0x00, 0x03, 0x03, 0x01, 0x03, 0xD4, 0x80, 0x00, 0x00, 0x80, 0x80, 0x02, 0x00
	.byte 0x40, 0x68, 0x00, 0x00, 0x04, 0x06, 0x04, 0x05, 0xC0, 0x68, 0x00, 0x00, 0x05, 0x06, 0x04, 0x05
	.byte 0x80, 0x80, 0x00, 0x00, 0x84, 0x06, 0x06, 0x06

ov81_02243788: ; 0x02243788
	.byte 0x28, 0x40, 0x00, 0x00, 0x04, 0x04, 0x05, 0x01
	.byte 0x60, 0x40, 0x00, 0x00, 0x04, 0x04, 0x00, 0x02, 0x98, 0x40, 0x00, 0x00, 0x04, 0x04, 0x01, 0x03
	.byte 0xD0, 0x40, 0x00, 0x00, 0x04, 0x04, 0x02, 0x04, 0x2C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x03, 0x05
	.byte 0xD4, 0x80, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x40, 0x80, 0x00, 0x00, 0x06, 0x06, 0x06, 0x07
	.byte 0xC0, 0x80, 0x00, 0x00, 0x07, 0x07, 0x06, 0x07

ov81_022437C8: ; 0x022437C8
	.byte 0x40, 0x40, 0x00, 0x00, 0x04, 0x04, 0x05, 0x01
	.byte 0x78, 0x40, 0x00, 0x00, 0x04, 0x04, 0x00, 0x02, 0xB0, 0x40, 0x00, 0x00, 0x04, 0x04, 0x01, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x03, 0x03, 0x2C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x02, 0x05
	.byte 0xD4, 0x80, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x40, 0x80, 0x00, 0x00, 0x06, 0x06, 0x06, 0x07
	.byte 0xC0, 0x80, 0x00, 0x00, 0x07, 0x07, 0x06, 0x07

ov81_02243808: ; 0x02243808
	.byte 0x18, 0x40, 0x00, 0x00, 0x00, 0x00, 0x05, 0x01
	.byte 0x40, 0x40, 0x00, 0x00, 0x01, 0x01, 0x00, 0x02, 0x68, 0x40, 0x00, 0x00, 0x02, 0x02, 0x01, 0x03
	.byte 0x90, 0x40, 0x00, 0x00, 0x03, 0x03, 0x02, 0x04, 0xB8, 0x40, 0x00, 0x00, 0x04, 0x04, 0x03, 0x05
	.byte 0xE0, 0x40, 0x00, 0x00, 0x05, 0x05, 0x04, 0x00, 0x40, 0x68, 0x00, 0x00, 0x06, 0x08, 0x06, 0x07
	.byte 0xC0, 0x68, 0x00, 0x00, 0x07, 0x08, 0x06, 0x07, 0x80, 0x80, 0x00, 0x00, 0x86, 0x08, 0x08, 0x08
	; 0x02243850
