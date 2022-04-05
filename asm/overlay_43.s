	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov43_02229EE0
ov43_02229EE0: ; 0x02229EE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02229FA4 ; =FS_OVERLAY_ID(OVY_42)
	mov r1, #2
	bl HandleLoadOverlay
	mov r2, #7
	mov r0, #3
	mov r1, #0x33
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, _02229FA8 ; =0x000005A4
	add r0, r5, #0
	mov r2, #0x33
	bl OverlayManager_CreateAndGetData
	ldr r2, _02229FA8 ; =0x000005A4
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	mov r1, #0x9f
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x68
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0x33
	bl ov43_0222A290
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r4, #4
	add r1, r4, r1
	mov r2, #0x33
	bl ov43_0222A48C
	mov r1, #0xa
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0x6c
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222AE5C
	mov r1, #0xb
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0xac
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222B5A8
	mov r0, #0xf
	mov r1, #0x85
	lsl r0, r0, #6
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222CBAC
	mov r0, #0xf3
	mov r1, #0x85
	lsl r0, r0, #2
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222CD90
	ldr r0, _02229FAC ; =0x00000408
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222D134
	ldr r0, _02229FB0 ; =ov43_0222A148
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02229FA4: .word FS_OVERLAY_ID(OVY_42)
_02229FA8: .word 0x000005A4
_02229FAC: .word 0x00000408
_02229FB0: .word ov43_0222A148
	thumb_func_end ov43_02229EE0

	thumb_func_start ov43_02229FB4
ov43_02229FB4: ; 0x02229FB4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02229FCC
	cmp r0, #1
	beq _0222A084
	b _0222A098
_02229FCC:
	ldr r0, [r4]
	cmp r0, #5
	bhi _0222A064
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02229FDE: ; jump table
	.short _02229FEA - _02229FDE - 2 ; case 0
	.short _0222A000 - _02229FDE - 2 ; case 1
	.short _0222A016 - _02229FDE - 2 ; case 2
	.short _0222A032 - _02229FDE - 2 ; case 3
	.short _0222A048 - _02229FDE - 2 ; case 4
	.short _0222A05E - _02229FDE - 2 ; case 5
_02229FEA:
	mov r1, #0xa
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0x6c
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222AE64
	add r6, r0, #0
	b _0222A064
_0222A000:
	mov r1, #0xb
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0xac
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222B5D0
	add r6, r0, #0
	b _0222A064
_0222A016:
	mov r0, #0x33
	str r0, [sp]
	mov r0, #0xf
	mov r2, #0x85
	lsl r0, r0, #6
	lsl r2, r2, #2
	add r0, r4, r0
	add r1, r4, #0
	add r2, r4, r2
	add r3, r4, #4
	bl ov43_0222CBB4
	add r6, r0, #0
	b _0222A064
_0222A032:
	mov r0, #0xf3
	mov r1, #0x85
	lsl r0, r0, #2
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222CD98
	add r6, r0, #0
	b _0222A064
_0222A048:
	ldr r0, _0222A0A4 ; =0x00000408
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	mov r3, #0x33
	bl ov43_0222D15C
	add r6, r0, #0
	b _0222A064
_0222A05E:
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0222A064:
	cmp r6, #1
	bne _0222A098
	ldr r0, _0222A0A8 ; =0x0000021D
	ldrb r1, [r4, r0]
	str r1, [r4]
	add r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	strb r1, [r4, r0]
	mov r0, #0x5a
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #1
	str r0, [r5]
	b _0222A098
_0222A084:
	mov r0, #0x5a
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bgt _0222A098
	mov r0, #0
	str r0, [r5]
_0222A098:
	add r0, r4, #4
	bl ov43_0222A500
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222A0A4: .word 0x00000408
_0222A0A8: .word 0x0000021D
	thumb_func_end ov43_02229FB4

	thumb_func_start ov43_0222A0AC
ov43_0222A0AC: ; 0x0222A0AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r1, #0xa
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0x6c
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222B098
	mov r1, #0xb
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0xac
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222B93C
	mov r0, #0xf
	mov r1, #0x85
	lsl r0, r0, #6
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222CD34
	mov r0, #0xf3
	mov r1, #0x85
	lsl r0, r0, #2
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222CE0C
	ldr r0, _0222A140 ; =0x00000408
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222D228
	add r0, r4, #4
	bl ov43_0222A520
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, #0x68
	ldr r1, [r4, r1]
	bl ov43_0222A2F0
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x33
	bl DestroyHeap
	ldr r0, _0222A144 ; =FS_OVERLAY_ID(OVY_42)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A140: .word 0x00000408
_0222A144: .word FS_OVERLAY_ID(OVY_42)
	thumb_func_end ov43_0222A0AC

	thumb_func_start ov43_0222A148
ov43_0222A148: ; 0x0222A148
	ldr r3, _0222A150 ; =ov43_0222A50C
	add r0, r0, #4
	bx r3
	nop
_0222A150: .word ov43_0222A50C
	thumb_func_end ov43_0222A148

	thumb_func_start ov43_0222A154
ov43_0222A154: ; 0x0222A154
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x85
	add r5, r0, #0
	lsl r1, r1, #2
	add r0, r5, #4
	add r1, r5, r1
	add r2, r4, #0
	bl ov43_0222A48C
	mov r1, #0xa
	lsl r1, r1, #6
	add r0, r5, r1
	sub r1, #0x6c
	add r1, r5, r1
	add r2, r5, #4
	add r3, r4, #0
	bl ov43_0222B0A0
	mov r1, #0xb
	lsl r1, r1, #6
	add r0, r5, r1
	sub r1, #0xac
	add r1, r5, r1
	add r2, r5, #4
	add r3, r4, #0
	bl ov43_0222B944
	mov r0, #0xf
	mov r1, #0x85
	lsl r0, r0, #6
	lsl r1, r1, #2
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, #4
	add r3, r4, #0
	bl ov43_0222CD3C
	mov r0, #0xf3
	mov r1, #0x85
	lsl r0, r0, #2
	lsl r1, r1, #2
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, #4
	add r3, r4, #0
	bl ov43_0222CE48
	ldr r0, _0222A1D4 ; =0x00000408
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, #4
	add r3, r4, #0
	bl ov43_0222D584
	ldr r0, _0222A1D8 ; =ov43_0222A148
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A1D4: .word 0x00000408
_0222A1D8: .word ov43_0222A148
	thumb_func_end ov43_0222A154

	thumb_func_start ov43_0222A1DC
ov43_0222A1DC: ; 0x0222A1DC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r1, #0xa
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0x6c
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222B1D8
	mov r1, #0xb
	lsl r1, r1, #6
	add r0, r4, r1
	sub r1, #0xac
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222BAB8
	mov r0, #0xf
	mov r1, #0x85
	lsl r0, r0, #6
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222CD40
	mov r0, #0xf3
	mov r1, #0x85
	lsl r0, r0, #2
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222D008
	ldr r0, _0222A248 ; =0x00000408
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #4
	bl ov43_0222D610
	add r0, r4, #4
	bl ov43_0222A520
	pop {r4, pc}
	.balign 4, 0
_0222A248: .word 0x00000408
	thumb_func_end ov43_0222A1DC

	thumb_func_start ov43_0222A24C
ov43_0222A24C: ; 0x0222A24C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	add r7, r3, #0
	bl InitWindow
	add r0, sp, #0x18
	ldrb r1, [r0, #0x10]
	add r2, r6, #0
	add r3, r7, #0
	str r1, [sp]
	ldrb r1, [r0, #0x14]
	str r1, [sp, #4]
	ldrb r1, [r0, #0x18]
	str r1, [sp, #8]
	ldrb r1, [r0, #0x1c]
	str r1, [sp, #0xc]
	ldrh r0, [r0, #0x20]
	add r1, r4, #0
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl AddWindowParameterized
	add r1, sp, #0x3c
	ldrb r1, [r1]
	add r0, r4, #0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A24C

	thumb_func_start ov43_0222A290
ov43_0222A290: ; 0x0222A290
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	add r6, r2, #0
	str r0, [r5, #4]
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0x58]
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0x5c]
	ldr r0, [r4, #4]
	bl sub_020183F0
	str r0, [r5]
	ldr r0, [r5, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	bl Options_GetTextFrameDelay
	strb r0, [r5, #0xc]
	add r0, r4, #0
	bl Options_GetFrame
	strb r0, [r5, #0xd]
	add r0, r4, #0
	bl Options_GetButtonMode
	cmp r0, #1
	beq _0222A2DC
	mov r0, #1
	b _0222A2DE
_0222A2DC:
	mov r0, #0
_0222A2DE:
	strb r0, [r5, #0xe]
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #1
	bl sub_02002B8C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A290

	thumb_func_start ov43_0222A2F0
ov43_0222A2F0: ; 0x0222A2F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r4, #4]
	ldr r1, [r5]
	bl sub_02018410
	ldr r0, [r5, #0x58]
	bl String_dtor
	ldr r0, [r5, #0x5c]
	bl String_dtor
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222A2F0

	thumb_func_start ov43_0222A318
ov43_0222A318: ; 0x0222A318
	strb r1, [r0, #9]
	strb r2, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end ov43_0222A318

	thumb_func_start ov43_0222A320
ov43_0222A320: ; 0x0222A320
	ldr r1, _0222A330 ; =gSystem
	ldr r2, [r1, #0x48]
	ldr r1, _0222A334 ; =0x00000CF3
	tst r1, r2
	beq _0222A32E
	mov r1, #0
	str r1, [r0]
_0222A32E:
	bx lr
	.balign 4, 0
_0222A330: .word gSystem
_0222A334: .word 0x00000CF3
	thumb_func_end ov43_0222A320

	thumb_func_start ov43_0222A338
ov43_0222A338: ; 0x0222A338
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	beq _0222A348
	ldr r0, [r5, #0x58]
	bl StringCopy
_0222A348:
	cmp r4, #0
	beq _0222A354
	ldr r0, [r5, #0x5c]
	add r1, r4, #0
	bl StringCopy
_0222A354:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A338

	thumb_func_start ov43_0222A358
ov43_0222A358: ; 0x0222A358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	ldr r0, [r0, #4]
	add r6, r1, #0
	str r2, [sp, #4]
	bl sub_0202C6F4
	add r5, r0, #0
	bl sub_0202C08C
	bl DWC_CreateFriendKey
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	mov r4, #0
_0222A378:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #0
	bne _0222A404
	add r0, r6, #0
	add r1, sp, #0x1c
	bl String_atoi
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	add r6, r1, #0
	cmp r0, #1
	bne _0222A3FE
	ldr r0, [sp, #0xc]
	eor r1, r0
	ldr r0, [sp, #0x10]
	eor r0, r7
	orr r0, r1
	beq _0222A3FE
	add r0, r5, #0
	bl sub_0202C08C
	add r1, r7, #0
	add r2, r6, #0
	bl DWC_CheckFriendKey
	cmp r0, #0
	bne _0222A3BA
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A3BA:
	ldr r0, [sp]
	add r1, r7, #0
	ldr r0, [r0, #4]
	add r2, r6, #0
	add r3, sp, #0x18
	bl sub_0203A128
	cmp r0, #0
	bne _0222A3D2
	add sp, #0x20
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222A3D2:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C23C
	add r1, r7, #0
	add r2, r6, #0
	bl DWC_CreateFriendKeyToken
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C270
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #2
	bl sub_0202C190
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222A3FE:
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A404:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0222A378
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222A358

	thumb_func_start ov43_0222A414
ov43_0222A414: ; 0x0222A414
	str r1, [r0, #0x60]
	mov r1, #1
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end ov43_0222A414

	thumb_func_start ov43_0222A41C
ov43_0222A41C: ; 0x0222A41C
	strb r1, [r0, #0xb]
	bx lr
	thumb_func_end ov43_0222A41C

	thumb_func_start ov43_0222A420
ov43_0222A420: ; 0x0222A420
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x10
	mov r1, #0
	mov r2, #0x48
	bl memset
	ldr r0, [r5, #4]
	bl sub_0202C6F4
	mov r4, #0
	add r6, r5, #0
	add r7, r5, #0
	str r0, [sp]
	str r4, [r5, #0x10]
	add r6, #0x14
	add r7, #0x10
_0222A442:
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #1
	bne _0222A482
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	add r0, r5, r0
	strb r4, [r0, #0x18]
	ldr r0, [sp]
	mov r2, #8
	bl sub_0202C090
	cmp r0, #2
	bne _0222A46C
	ldr r0, [r5, #0x10]
	add r1, r5, r0
	add r1, #0x38
	mov r0, #0xff
	b _0222A47A
_0222A46C:
	ldr r1, [r6]
	ldr r0, [r5, #0x14]
	add r1, r1, #1
	str r1, [r6]
	ldr r1, [r5, #0x10]
	add r1, r5, r1
	add r1, #0x38
_0222A47A:
	strb r0, [r1]
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
_0222A482:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0222A442
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A420

	thumb_func_start ov43_0222A48C
ov43_0222A48C: ; 0x0222A48C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, _0222A4FC ; =gSystem + 0x60
	mov r1, #1
	add r4, r2, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0x55
	add r1, r4, #0
	bl NARC_ctor
	str r0, [r5, #0x58]
	bl ov43_0222A550
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222A570
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222A690
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222A87C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov43_0222A8C0
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222AC28
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222A998
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	pop {r4, r5, r6, pc}
	nop
_0222A4FC: .word gSystem + 0x60
	thumb_func_end ov43_0222A48C

	thumb_func_start ov43_0222A500
ov43_0222A500: ; 0x0222A500
	ldr r3, _0222A508 ; =sub_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_0222A508: .word sub_0202457C
	thumb_func_end ov43_0222A500

	thumb_func_start ov43_0222A50C
ov43_0222A50C: ; 0x0222A50C
	push {r3, lr}
	ldr r0, [r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A50C

	thumb_func_start ov43_0222A520
ov43_0222A520: ; 0x0222A520
	push {r4, lr}
	add r4, r0, #0
	bl ov43_0222ACDC
	add r0, r4, #0
	bl ov43_0222A9D8
	add r0, r4, #0
	bl ov43_0222A960
	add r0, r4, #0
	bl ov43_0222A8A8
	add r0, r4, #0
	bl ov43_0222A81C
	add r0, r4, #0
	bl ov43_0222A66C
	ldr r0, [r4, #0x58]
	bl NARC_dtor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A520

	thumb_func_start ov43_0222A550
ov43_0222A550: ; 0x0222A550
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0222A56C ; =ov43_0222EE5C
	add r3, sp, #0
	mov r2, #5
_0222A55A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222A55A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0222A56C: .word ov43_0222EE5C
	thumb_func_end ov43_0222A550

	thumb_func_start ov43_0222A570
ov43_0222A570: ; 0x0222A570
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	bl BgConfig_Alloc
	add r3, sp, #0x10
	ldr r4, _0222A664 ; =ov43_0222EDC8
	str r0, [r5]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r6, _0222A668 ; =ov43_0222EFFC
	mov r4, #0
_0222A598:
	lsl r1, r4, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	add r3, r7, #0
	bl BG_ClearCharDataRange
	lsl r1, r4, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r4, r4, #1
	add r6, #0x1c
	cmp r4, #7
	blt _0222A598
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp]
	str r7, [sp, #4]
	mov r2, #0
	ldr r0, [r5, #0x58]
	mov r1, #5
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0xa0
	str r0, [sp]
	str r7, [sp, #4]
	mov r1, #4
	ldr r0, [r5, #0x58]
	add r2, r1, #0
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	mov r1, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	mov r1, #7
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	mov r1, #6
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	mov r1, #0xa
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	mov r1, #8
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A664: .word ov43_0222EDC8
_0222A668: .word ov43_0222EFFC
	thumb_func_end ov43_0222A570

	thumb_func_start ov43_0222A66C
ov43_0222A66C: ; 0x0222A66C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0222A672:
	lsl r1, r4, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	cmp r4, #7
	blt _0222A672
	ldr r0, [r5]
	bl FreeToHeap
	mov r0, #0
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A66C

	thumb_func_start ov43_0222A690
ov43_0222A690: ; 0x0222A690
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r7, r1, #0
	add r6, r0, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0x10
	add r1, r7, #0
	bl GF_CreateVramTransferManager
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x1e
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r7, [sp, #0x10]
	bl OamManager_Create
	ldr r4, _0222A814 ; =ov43_0222EDD8
	add r3, sp, #0x2c
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #0x10
	add r0, r2, #0
	add r2, r1, #0
	str r7, [sp, #0x38]
	bl sub_020215C0
	mov r0, #0x40
	add r1, r7, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add r1, r6, #0
	mov r0, #0x40
	add r1, #0xbc
	add r2, r7, #0
	bl G2dRenderer_Init
	str r0, [r6, #4]
	add r0, r6, #0
	add r3, r6, #0
	ldr r1, _0222A818 ; =ov43_0222F0FC
	add r0, #8
	mov r2, #1
	add r3, #0xbc
	bl sub_0200B27C
	mov r4, #0
	add r5, r6, #0
_0222A706:
	mov r0, #0x40
	add r1, r4, #0
	add r2, r7, #0
	bl Create2DGfxResObjMan
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222A706
	mov r0, #0x64
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r7, [sp, #8]
	add r0, r1, #0
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	add r3, r2, #0
	bl AddCharResObjFromOpenNarc
	add r1, r6, #0
	add r1, #0xac
	str r0, [r1]
	mov r0, #0x64
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #0x7a
	str r7, [sp, #0xc]
	lsl r0, r0, #2
	mov r2, #0
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	add r3, r2, #0
	bl AddPlttResObjFromOpenNarc
	add r1, r6, #0
	add r1, #0xb0
	str r0, [r1]
	mov r0, #0x64
	str r0, [sp]
	mov r2, #2
	str r2, [sp, #4]
	mov r0, #0x7b
	str r7, [sp, #8]
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	add r1, r6, #0
	add r1, #0xb4
	str r0, [r1]
	mov r0, #0x64
	str r0, [sp]
	mov r2, #3
	str r2, [sp, #4]
	mov r0, #0x1f
	str r7, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	add r1, r6, #0
	add r1, #0xb8
	str r0, [r1]
	add r0, r6, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200ADA4
	cmp r0, #0
	bne _0222A7AC
	bl GF_AssertFail
_0222A7AC:
	add r0, r6, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_0200B00C
	cmp r0, #0
	bne _0222A7BE
	bl GF_AssertFail
_0222A7BE:
	add r0, r6, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200A740
	add r0, r6, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_0200A740
	mov r1, #0x64
	add r0, r1, #0
	mov r3, #0x79
	str r1, [sp]
	sub r0, #0x65
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r6, r2]
	add r3, #0xc
	str r2, [sp, #0x1c]
	ldr r2, [r6, r3]
	add r6, #0x88
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, #0
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A814: .word ov43_0222EDD8
_0222A818: .word ov43_0222F0FC
	thumb_func_end ov43_0222A690

	thumb_func_start ov43_0222A81C
ov43_0222A81C: ; 0x0222A81C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200AEB0
	add r0, r7, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_0200B0A8
	mov r6, #0x79
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #2
_0222A83A:
	add r1, r5, #0
	add r1, #0xac
	ldr r0, [r5, r6]
	ldr r1, [r1]
	bl DestroySingle2DGfxResObj
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222A83A
	mov r6, #0x79
	mov r5, #0
	add r4, r7, #0
	lsl r6, r6, #2
_0222A856:
	ldr r0, [r4, r6]
	bl Destroy2DGfxResObjMan
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _0222A856
	ldr r0, [r7, #4]
	bl sub_02024504
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	bl GF_DestroyVramTransferManager
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222A81C

	thumb_func_start ov43_0222A87C
ov43_0222A87C: ; 0x0222A87C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ScrStrBufs_new
	str r0, [r5, #0x50]
	ldr r2, _0222A8A4 ; =0x0000030B
	mov r0, #0
	mov r1, #0x1b
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [r5, #0x54]
	mov r0, #4
	add r1, r4, #0
	bl FontID_Alloc
	pop {r3, r4, r5, pc}
	nop
_0222A8A4: .word 0x0000030B
	thumb_func_end ov43_0222A87C

	thumb_func_start ov43_0222A8A8
ov43_0222A8A8: ; 0x0222A8A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #4
	bl FontID_Release
	ldr r0, [r4, #0x54]
	bl DestroyMsgData
	ldr r0, [r4, #0x50]
	bl ScrStrBufs_delete
	pop {r4, pc}
	thumb_func_end ov43_0222A8A8

	thumb_func_start ov43_0222A8C0
ov43_0222A8C0: ; 0x0222A8C0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r1, #0
	mov r1, #0x16
	add r5, r0, #0
	mov r0, #0
	lsl r1, r1, #4
	add r4, r2, #0
	bl LoadFontPal1
	mov r1, #7
	mov r0, #4
	lsl r1, r1, #6
	add r2, r4, #0
	bl LoadFontPal1
	ldrb r0, [r6, #0xd]
	mov r1, #1
	mov r2, #0x46
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5]
	mov r3, #0xc
	bl LoadUserFrameGfx2
	add r0, r5, #0
	add r0, #0x64
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x64
	str r0, [sp, #0x10]
	add r1, r5, #0
	mov r2, #1
	ldr r0, [r5]
	add r1, #0x64
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0x74]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0x78]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0x7c]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	add r1, r5, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0
	bl sub_02018424
	str r0, [r5, #0x5c]
	add r0, r4, #0
	bl sub_0201660C
	str r0, [r5, #0x60]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A8C0

	thumb_func_start ov43_0222A960
ov43_0222A960: ; 0x0222A960
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x60]
	bl sub_02016624
	ldr r0, [r4, #0x5c]
	bl sub_02018474
	ldr r0, [r4, #0x7c]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl String_dtor
	ldr r0, [r4, #0x74]
	bl String_dtor
	ldr r0, [r4, #0x78]
	bl String_dtor
	add r4, #0x64
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A960

	thumb_func_start ov43_0222A998
ov43_0222A998: ; 0x0222A998
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #8]
	mov r1, #0x82
	lsl r1, r1, #2
	ldr r4, _0222A9D4 ; =ov43_0222F0C0
	str r0, [sp, #4]
	mov r7, #0
	add r6, r0, r1
	add r5, r0, #0
_0222A9AC:
	ldr r0, [sp, #8]
	mov r2, #1
	str r0, [sp]
	ldr r0, [sp, #4]
	ldrb r1, [r4]
	ldr r0, [r0, #0x58]
	add r3, r6, #0
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #2
	lsl r1, r1, #8
	str r0, [r5, r1]
	add r7, r7, #1
	add r6, r6, #4
	add r4, r4, #1
	add r5, r5, #4
	cmp r7, #2
	blt _0222A9AC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A9D4: .word ov43_0222F0C0
	thumb_func_end ov43_0222A998

	thumb_func_start ov43_0222A9D8
ov43_0222A9D8: ; 0x0222A9D8
	push {r4, r5, r6, lr}
	mov r6, #2
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #8
_0222A9E2:
	ldr r0, [r5, r6]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0222A9E2
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov43_0222A9D8

	thumb_func_start ov43_0222A9F4
ov43_0222A9F4: ; 0x0222A9F4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r6, r2, #0
	bl TextPrinterCheckActive
	cmp r0, #1
	bne _0222AA22
	mov r0, #0
	bl sub_02002B8C
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_0222AA22:
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x54]
	ldr r2, [r5, #0x78]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x78]
	bl StringExpandPlaceholders
	mov r0, #1
	bl sub_02002B8C
	mov r0, #4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0222AA6C ; =0x000F0200
	mov r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x74]
	add r0, r4, #0
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r5, #0x84
	str r0, [r5]
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222AA6C: .word 0x000F0200
	thumb_func_end ov43_0222A9F4

	thumb_func_start ov43_0222AA70
ov43_0222AA70: ; 0x0222AA70
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #1
	bne _0222AA98
	mov r0, #0
	bl sub_02002B8C
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_0222AA98:
	add r4, #0x64
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222AA70

	thumb_func_start ov43_0222AAA4
ov43_0222AAA4: ; 0x0222AAA4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0222AB18 ; =0x05F5E100
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl _ll_udiv
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r3, #4
	bl BufferIntegerAsString
	ldr r2, _0222AB1C ; =0x00002710
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0222AB1C ; =0x00002710
	mov r3, #0
	bl _ull_mod
	mov r1, #2
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r3, #4
	bl BufferIntegerAsString
	ldr r2, _0222AB1C ; =0x00002710
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl _ull_mod
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r1, #3
	mov r3, #4
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0222AB18: .word 0x05F5E100
_0222AB1C: .word 0x00002710
	thumb_func_end ov43_0222AAA4

	thumb_func_start ov43_0222AB20
ov43_0222AB20: ; 0x0222AB20
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r3, #0
	add r0, r1, #0
	add r6, r2, #0
	bl sub_0202C6F4
	add r7, r0, #0
	add r0, r5, #0
	bl PlayerProfile_new
	add r5, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0202C254
	add r1, r0, #0
	add r0, r5, #0
	bl Sav2_Profile_PlayerName_set
	ldr r0, [r4, #0x50]
	mov r1, #0
	add r2, r5, #0
	bl BufferPlayersName
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222AB20

	thumb_func_start ov43_0222AB5C
ov43_0222AB5C: ; 0x0222AB5C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	add r7, r2, #0
	bl PlayerProfile_new
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202C6F4
	add r1, r7, #0
	bl sub_0202C298
	add r1, r0, #0
	add r0, r4, #0
	bl Sav2_Profile_PlayerName_set
	ldr r0, [r5, #0x50]
	mov r1, #0
	add r2, r4, #0
	bl BufferPlayersName
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222AB5C

	thumb_func_start ov43_0222AB94
ov43_0222AB94: ; 0x0222AB94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	add r0, r1, #0
	bl sub_0202C6F4
	add r1, r4, #0
	mov r2, #6
	add r7, r0, #0
	mov r6, #1
	bl sub_0202C090
	add r2, r0, #0
	bne _0222ABB4
	mov r6, #0
_0222ABB4:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #2
	ldr r0, [r5, #0x50]
	add r3, r1, #0
	bl BufferIntegerAsString
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #4
	bl sub_0202C090
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #5
	bl sub_0202C090
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #1
	bl BufferMonthNameAbbr
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222AB94

	thumb_func_start ov43_0222ABFC
ov43_0222ABFC: ; 0x0222ABFC
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r0, #0x50]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov43_0222ABFC

	thumb_func_start ov43_0222AC18
ov43_0222AC18: ; 0x0222AC18
	ldr r3, _0222AC24 ; =BufferWiFiPlazaActivityName
	add r2, r1, #0
	ldr r0, [r0, #0x50]
	mov r1, #0
	bx r3
	nop
_0222AC24: .word BufferWiFiPlazaActivityName
	thumb_func_end ov43_0222AC18

	thumb_func_start ov43_0222AC28
ov43_0222AC28: ; 0x0222AC28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r5, [sp]
	mov r0, #0
	str r0, [sp, #8]
	ldr r4, _0222ACD0 ; =ov43_0222F14C
	add r0, r5, #0
	str r0, [sp, #0xc]
	add r0, #0x88
	str r1, [sp, #4]
	add r7, r4, #0
	mov r6, #5
	str r0, [sp, #0xc]
_0222AC44:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	str r0, [r4]
	ldr r0, [sp, #0xc]
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	str r0, [r4, #0x2c]
	add r0, r7, #0
	bl CreateSprite
	mov r1, #0x7d
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [sp, #8]
	add r4, #0x30
	add r0, r0, #1
	add r7, #0x30
	add r5, r5, #4
	add r6, r6, #2
	str r0, [sp, #8]
	cmp r0, #2
	blt _0222AC44
	ldr r0, [sp]
	ldr r1, _0222ACD4 ; =ov43_0222F160
	ldr r0, [r0, #4]
	str r0, [r1, #0x4c]
	ldr r0, [sp]
	add r0, #0x88
	str r0, [r1, #0x50]
	ldr r0, [sp, #4]
	str r0, [r1, #0x78]
	ldr r0, _0222ACD8 ; =ov43_0222F1AC
	bl CreateSprite
	mov r2, #0x7f
	ldr r1, [sp]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add r0, r1, #0
	ldr r0, [r0, r2]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r1, #0x7f
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222ACD0: .word ov43_0222F14C
_0222ACD4: .word ov43_0222F160
_0222ACD8: .word ov43_0222F1AC
	thumb_func_end ov43_0222AC28

	thumb_func_start ov43_0222ACDC
ov43_0222ACDC: ; 0x0222ACDC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024758
	mov r6, #0x7d
	mov r4, #0
	lsl r6, r6, #2
_0222ACF0:
	ldr r0, [r5, r6]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0222ACF0
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222ACDC

	thumb_func_start ov43_0222AD00
ov43_0222AD00: ; 0x0222AD00
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x7d
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_0222AD0C:
	ldr r0, [r5, r7]
	add r1, r6, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0222AD0C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222AD00

	thumb_func_start ov43_0222AD20
ov43_0222AD20: ; 0x0222AD20
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x7d
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_0222AD2C:
	ldr r0, [r5, r7]
	add r1, r6, #0
	bl Set2dSpriteAnimActiveFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0222AD2C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222AD20

	thumb_func_start ov43_0222AD40
ov43_0222AD40: ; 0x0222AD40
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	lsl r2, r1, #0x19
	lsr r6, r2, #0x18
	cmp r1, #2
	blo _0222AD52
	sub r1, r1, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
_0222AD52:
	mov r2, #0x7d
	lsl r2, r2, #2
	lsl r4, r1, #2
	add r5, r0, r2
	ldr r0, [r5, r4]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r1, r6, #5
	ldr r0, [r5, r4]
	add r1, r1, r7
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r4]
	bl sub_02024964
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222AD40

	thumb_func_start ov43_0222AD74
ov43_0222AD74: ; 0x0222AD74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0xff
	beq _0222AD8A
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r2, #0
	bl Set2dSpriteAnimSeqNo
_0222AD8A:
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222AD74

	thumb_func_start ov43_0222AD98
ov43_0222AD98: ; 0x0222AD98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r2, #0
	bl sub_02024A04
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_02024ADC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222AD98

	thumb_func_start ov43_0222ADB8
ov43_0222ADB8: ; 0x0222ADB8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #0xd
	str r0, [sp, #0x10]
	add r0, sp, #4
	strb r1, [r0, #0x10]
	mov r1, #9
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	mov r2, #0xf
	bic r1, r2
	ldr r2, [r5]
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	mov r2, #0xf
	and r2, r3
	orr r1, r2
	strb r1, [r0, #0x12]
	ldrb r1, [r0, #0x12]
	mov r2, #0xf0
	bic r1, r2
	lsl r2, r6, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r0, #0x12]
	mov r1, #0
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x60]
	add r1, sp, #4
	bl sub_020166FC
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #8
	mov r2, #0
	mov r3, #0x3d
	bl sub_0200B484
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222ADB8

	thumb_func_start ov43_0222AE2C
ov43_0222AE2C: ; 0x0222AE2C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x60]
	bl sub_020168F4
	add r6, r0, #0
	sub r0, r6, #1
	cmp r0, #1
	bhi _0222AE58
	ldr r0, [r4, #0x60]
	bl sub_020169C0
	str r0, [r5]
	ldr r0, [r4, #0x60]
	bl sub_020169CC
	mov r0, #0
	mov r1, #0x3d
	mov r2, #1
	bl SetBlendBrightness
_0222AE58:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222AE2C

	thumb_func_start ov43_0222AE5C
ov43_0222AE5C: ; 0x0222AE5C
	push {r3, lr}
	bl ov43_0222B0A0
	pop {r3, pc}
	thumb_func_end ov43_0222AE5C

	thumb_func_start ov43_0222AE64
ov43_0222AE64: ; 0x0222AE64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r7, r3, #0
	ldrb r3, [r4, #8]
	add r5, r0, #0
	add r6, r2, #0
	cmp r3, #0xb
	bhi _0222AEF0
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0222AE82: ; jump table
	.short _0222AE9A - _0222AE82 - 2 ; case 0
	.short _0222AEBA - _0222AE82 - 2 ; case 1
	.short _0222AEC8 - _0222AE82 - 2 ; case 2
	.short _0222AED2 - _0222AE82 - 2 ; case 3
	.short _0222AEE6 - _0222AE82 - 2 ; case 4
	.short _0222AF3C - _0222AE82 - 2 ; case 5
	.short _0222AF5A - _0222AE82 - 2 ; case 6
	.short _0222AF68 - _0222AE82 - 2 ; case 7
	.short _0222AF88 - _0222AE82 - 2 ; case 8
	.short _0222AFF4 - _0222AE82 - 2 ; case 9
	.short _0222B00C - _0222AE82 - 2 ; case 10
	.short _0222B058 - _0222AE82 - 2 ; case 11
_0222AE9A:
	bl ov43_0222B1FC
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	mov r1, #0x11
	add r2, r1, #0
	add r3, r0, #0
	str r7, [sp, #8]
	bl BeginNormalPaletteFade
	mov r0, #1
	strb r0, [r4, #8]
	b _0222B08A
_0222AEBA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222AEF0
	mov r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222AEC8:
	bl ov43_0222B1FC
	mov r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222AED2:
	bl ov43_0222B374
	str r0, [sp, #0x10]
	cmp r0, #0
	beq _0222AEF0
	mov r0, #2
	str r0, [r5, #4]
	mov r0, #4
	strb r0, [r4, #8]
	b _0222B08A
_0222AEE6:
	ldr r3, [r5, #4]
	sub r2, r3, #1
	str r2, [r5, #4]
	cmp r3, #0
	beq _0222AEF2
_0222AEF0:
	b _0222B08A
_0222AEF2:
	mov r2, #0
	str r2, [r5, #4]
	bl ov43_0222B574
	cmp r0, #1
	bne _0222AF24
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222B440
	ldr r0, [r5]
	cmp r0, #3
	beq _0222AF10
	cmp r0, #1
	bne _0222AF16
_0222AF10:
	mov r0, #5
	strb r0, [r4, #8]
	b _0222B08A
_0222AF16:
	add r0, r5, #0
	add r1, r6, #0
	bl ov43_0222B458
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0222AF24:
	ldr r0, [r5]
	cmp r0, #1
	bne _0222B01C
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x3a
	add r3, r7, #0
	bl ov43_0222B4BC
	mov r0, #0xb
	strb r0, [r4, #8]
	b _0222B08A
_0222AF3C:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	mov r1, #0x10
	str r7, [sp, #8]
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0222B08A
_0222AF5A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222B01C
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0222AF68:
	bl ov43_0222B1FC
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	mov r1, #0x11
	add r2, r1, #0
	add r3, r0, #0
	str r7, [sp, #8]
	bl BeginNormalPaletteFade
	mov r0, #8
	strb r0, [r4, #8]
	b _0222B08A
_0222AF88:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222B08A
	add r0, r7, #0
	bl PlayerProfile_new
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x58]
	bl String_c_str
	add r1, r0, #0
	ldr r0, [sp, #0xc]
	bl Sav2_Profile_PlayerName_set
	ldr r0, [r6, #0x50]
	ldr r2, [sp, #0xc]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [sp, #0xc]
	bl FreeToHeap
	ldr r0, [r4, #0x5c]
	add r1, sp, #0x10
	bl String_atoi
	add r3, r0, #0
	ldr r0, [sp, #0x10]
	add r2, r1, #0
	cmp r0, #0
	beq _0222AFE2
	add r0, r6, #0
	add r1, r3, #0
	bl ov43_0222AAA4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x37
	add r3, r7, #0
	bl ov43_0222B4BC
	mov r0, #9
	strb r0, [r4, #8]
	b _0222B08A
_0222AFE2:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x38
	add r3, r7, #0
	bl ov43_0222B4BC
	mov r0, #0xb
	strb r0, [r4, #8]
	b _0222B08A
_0222AFF4:
	bl ov43_0222B534
	cmp r0, #0
	beq _0222B08A
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0
	bl ov43_0222ADB8
	mov r0, #0xa
	strb r0, [r4, #8]
	b _0222B08A
_0222B00C:
	add r0, r4, #0
	add r1, r6, #0
	bl ov43_0222AE2C
	cmp r0, #1
	beq _0222B01E
	cmp r0, #2
	beq _0222B04C
_0222B01C:
	b _0222B08A
_0222B01E:
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0x58]
	add r0, r4, #0
	bl ov43_0222A358
	add r2, r0, #0
	bne _0222B038
	add r0, r5, #0
	bl ov43_0222B55C
	mov r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222B038:
	ldr r3, _0222B090 ; =ov43_0222F0C8
	add r0, r5, #0
	ldrb r2, [r3, r2]
	add r1, r6, #0
	add r3, r7, #0
	bl ov43_0222B4BC
	mov r0, #0xb
	strb r0, [r4, #8]
	b _0222B08A
_0222B04C:
	add r0, r5, #0
	bl ov43_0222B55C
	mov r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222B058:
	bl ov43_0222B534
	cmp r0, #0
	beq _0222B08A
	ldr r0, _0222B094 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _0222B078
	mov r0, #2
	tst r0, r1
	bne _0222B078
	bl System_GetTouchNew
	cmp r0, #0
	beq _0222B08A
_0222B078:
	add r0, r5, #0
	bl ov43_0222B55C
	add r0, r5, #0
	add r1, r6, #0
	bl ov43_0222B408
	mov r0, #3
	strb r0, [r4, #8]
_0222B08A:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B090: .word ov43_0222F0C8
_0222B094: .word gSystem
	thumb_func_end ov43_0222AE64

	thumb_func_start ov43_0222B098
ov43_0222B098: ; 0x0222B098
	ldr r3, _0222B09C ; =ov43_0222B1D8
	bx r3
	.balign 4, 0
_0222B09C: .word ov43_0222B1D8
	thumb_func_end ov43_0222B098

	thumb_func_start ov43_0222B0A0
ov43_0222B0A0: ; 0x0222B0A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x14]
	add r0, #8
	add r5, r1, #0
	str r2, [sp, #0x24]
	str r3, [sp, #0x18]
	bl InitWindow
	mov r3, #4
	ldr r1, [sp, #0x14]
	str r3, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x14
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	add r1, #8
	ldr r0, [r0]
	mov r2, #3
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	add r0, #0x20
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0xac
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	add r1, #0x20
	mov r2, #1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	mov r1, #0
	add r0, #8
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	mov r1, #0
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r1, [sp, #0x18]
	mov r0, #0x80
	bl String_ctor
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x3c]
	ldr r0, [r5, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x38]
	ldr r1, [sp, #0x18]
	mov r0, #0x80
	bl String_ctor
	add r4, r0, #0
	ldr r1, [sp, #0x18]
	mov r0, #0x80
	bl String_ctor
	str r0, [sp, #0x1c]
	ldr r0, [r5, #4]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [sp, #0x24]
	mov r1, #0
	ldr r0, [r0, #0x50]
	bl BufferPlayersName
	ldr r0, [sp, #0x14]
	mov r7, #0
	str r0, [sp, #0x20]
	add r0, #8
	mov r5, #8
	str r0, [sp, #0x20]
_0222B160:
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	ldr r0, [r0, #0x54]
	add r1, r7, #1
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	ldr r0, [r0, #0x50]
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #4
	add r1, r4, #0
	mov r2, #0
	bl FontID_String_GetWidth
	mov ip, r0
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222B1D4 ; =0x00010F00
	mov r3, #0xc0
	str r0, [sp, #8]
	mov r0, #0
	mov r6, ip
	str r0, [sp, #0xc]
	sub r3, r3, r6
	ldr r0, [sp, #0x20]
	mov r1, #4
	add r2, r4, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r7, r7, #1
	add r5, #0x28
	cmp r7, #4
	blt _0222B160
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	mov r1, #0xb
	ldr r0, [r0, #0x58]
	mov r2, #1
	add r3, #0x1c
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x18]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B1D4: .word 0x00010F00
	thumb_func_end ov43_0222B0A0

	thumb_func_start ov43_0222B1D8
ov43_0222B1D8: ; 0x0222B1D8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl String_dtor
	add r0, r4, #0
	add r0, #8
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x20
	bl RemoveWindow
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222B1D8

	thumb_func_start ov43_0222B1FC
ov43_0222B1FC: ; 0x0222B1FC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	add r1, r4, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, #0x64
	mov r2, #0
	bl ov43_0222A9F4
	add r0, r5, #0
	add r0, #8
	bl ScheduleWindowCopyToVram
	ldr r2, [r5, #0x1c]
	mov r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl LoadRectToBgTilemapRect
	mov r2, #0
	ldr r0, [r4]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov43_0222AD74
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov43_0222AD98
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222B3A4
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov43_0222B1FC

	thumb_func_start ov43_0222B278
ov43_0222B278: ; 0x0222B278
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222B314 ; =gSystem
	add r4, r2, #0
	ldr r3, [r0, #0x48]
	ldr r0, _0222B318 ; =0x00000CF3
	mov r2, #0
	tst r0, r3
	beq _0222B28C
	str r2, [r1]
_0222B28C:
	ldr r6, _0222B314 ; =gSystem
	mov r0, #1
	ldr r1, [r6, #0x48]
	add r3, r1, #0
	tst r3, r0
	beq _0222B2AA
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222B3C4
	ldr r0, _0222B31C ; =0x000005DD
	bl PlaySE
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222B2AA:
	mov r3, #2
	tst r1, r3
	beq _0222B2BE
	ldr r0, _0222B31C ; =0x000005DD
	bl PlaySE
	mov r0, #3
	str r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222B2BE:
	ldr r1, [r6, #0x4c]
	mov r3, #0x40
	tst r3, r1
	beq _0222B2DC
	ldr r1, [r5]
	cmp r1, #0
	beq _0222B2D4
	sub r1, r1, #1
	str r1, [r5]
	add r2, r0, #0
	b _0222B2F6
_0222B2D4:
	mov r1, #3
	str r1, [r5]
	add r2, r0, #0
	b _0222B2F6
_0222B2DC:
	mov r3, #0x80
	tst r1, r3
	beq _0222B2F6
	ldr r1, [r5]
	cmp r1, #3
	bhs _0222B2F0
	add r1, r1, #1
	str r1, [r5]
	add r2, r0, #0
	b _0222B2F6
_0222B2F0:
	mov r1, #0
	str r1, [r5]
	add r2, r0, #0
_0222B2F6:
	cmp r2, #1
	bne _0222B310
	ldr r0, _0222B320 ; =0x000005E5
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222B3A4
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
_0222B310:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B314: .word gSystem
_0222B318: .word 0x00000CF3
_0222B31C: .word 0x000005DD
_0222B320: .word 0x000005E5
	thumb_func_end ov43_0222B278

	thumb_func_start ov43_0222B324
ov43_0222B324: ; 0x0222B324
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222B36C ; =ov43_0222EE1A
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	bl sub_0202529C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222B340
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222B340:
	mov r1, #1
	str r1, [r7]
	str r1, [r6]
	str r0, [r5]
	ldr r0, _0222B370 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222B3C4
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222B3A4
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B36C: .word ov43_0222EE1A
_0222B370: .word 0x000005DD
	thumb_func_end ov43_0222B324

	thumb_func_start ov43_0222B374
ov43_0222B374: ; 0x0222B374
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r3, #0
	str r3, [sp]
	add r3, sp, #0
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov43_0222B324
	ldr r1, [sp]
	cmp r1, #0
	beq _0222B396
	mov r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_0222B396:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov43_0222B278
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov43_0222B374

	thumb_func_start ov43_0222B3A4
ov43_0222B3A4: ; 0x0222B3A4
	add r2, r0, #0
	ldr r3, [r2]
	mov r2, #0x28
	mul r2, r3
	mov r0, #0x7f
	add r2, #0x30
	lsl r0, r0, #2
	lsl r2, r2, #0x10
	ldr r0, [r1, r0]
	ldr r3, _0222B3C0 ; =sub_0200DD88
	mov r1, #0x80
	asr r2, r2, #0x10
	bx r3
	nop
_0222B3C0: .word sub_0200DD88
	thumb_func_end ov43_0222B3A4

	thumb_func_start ov43_0222B3C4
ov43_0222B3C4: ; 0x0222B3C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r6, r1, #0
	mov r4, #0
	mov r5, #4
_0222B3D0:
	ldr r0, [r7]
	cmp r0, r4
	bne _0222B3DA
	mov r1, #9
	b _0222B3DC
_0222B3DA:
	mov r1, #2
_0222B3DC:
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #2
	lsl r3, r5, #0x18
	ldr r0, [r6]
	add r2, r1, #0
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	add r4, r4, #1
	add r5, r5, #5
	cmp r4, #4
	blt _0222B3D0
	ldr r0, [r6]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222B3C4

	thumb_func_start ov43_0222B408
ov43_0222B408: ; 0x0222B408
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	mov r6, #0
	mov r4, #4
	mov r7, #2
_0222B414:
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	str r7, [sp, #8]
	lsl r3, r4, #0x18
	ldr r0, [r5]
	add r1, r7, #0
	add r2, r7, #0
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r6, r6, #1
	add r4, r4, #5
	cmp r6, #4
	blt _0222B414
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222B408

	thumb_func_start ov43_0222B440
ov43_0222B440: ; 0x0222B440
	add r2, r0, #0
	add r0, r1, #0
	ldr r2, [r2]
	ldr r1, _0222B450 ; =ov43_0222F0CC
	ldr r3, _0222B454 ; =ov43_0222A318
	ldrb r1, [r1, r2]
	mov r2, #0
	bx r3
	.balign 4, 0
_0222B450: .word ov43_0222F0CC
_0222B454: .word ov43_0222A318
	thumb_func_end ov43_0222B440

	thumb_func_start ov43_0222B458
ov43_0222B458: ; 0x0222B458
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov43_0222AA70
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #2
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add r5, #8
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov43_0222AD74
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222B458

	thumb_func_start ov43_0222B4BC
ov43_0222B4BC: ; 0x0222B4BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x80
	add r1, r3, #0
	add r7, r2, #0
	bl String_ctor
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x20
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x54]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	ldr r1, [r5, #0x3c]
	add r2, r6, #0
	bl StringExpandPlaceholders
	mov r0, #1
	bl sub_02002B8C
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x38]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, _0222B530 ; =0x00010200
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x3c]
	add r0, #0x20
	bl AddTextPrinterParameterized2
	str r0, [r5, #0x34]
	add r0, r5, #0
	add r0, #0x20
	mov r1, #1
	mov r2, #0x46
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r5, #0x20
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B530: .word 0x00010200
	thumb_func_end ov43_0222B4BC

	thumb_func_start ov43_0222B534
ov43_0222B534: ; 0x0222B534
	push {r4, lr}
	ldr r0, [r0, #0x34]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222B556
	mov r0, #0
	bl sub_02002B8C
	bl sub_02002C04
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_0222B556:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222B534

	thumb_func_start ov43_0222B55C
ov43_0222B55C: ; 0x0222B55C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x20
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #0x20
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222B55C

	thumb_func_start ov43_0222B574
ov43_0222B574: ; 0x0222B574
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	cmp r0, #1
	bne _0222B59E
	ldr r0, [r1, #4]
	bl sub_0202C6F4
	add r5, r0, #0
	mov r4, #0
_0222B586:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #0
	bne _0222B596
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222B596:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0222B586
	b _0222B5A2
_0222B59E:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222B5A2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222B574

	thumb_func_start ov43_0222B5A8
ov43_0222B5A8: ; 0x0222B5A8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	add r6, r2, #0
	add r7, r3, #0
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	add r1, r5, #0
	add r1, #0xe0
	str r0, [r1]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov43_0222B944
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222B5A8

	thumb_func_start ov43_0222B5D0
ov43_0222B5D0: ; 0x0222B5D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	ldrb r5, [r4, #8]
	add r6, r0, #0
	add r7, r2, #0
	str r3, [sp, #0xc]
	cmp r5, #0x17
	bls _0222B5E4
	b _0222B932
_0222B5E4:
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_0222B5F0: ; jump table
	.short _0222B620 - _0222B5F0 - 2 ; case 0
	.short _0222B62A - _0222B5F0 - 2 ; case 1
	.short _0222B642 - _0222B5F0 - 2 ; case 2
	.short _0222B68A - _0222B5F0 - 2 ; case 3
	.short _0222B694 - _0222B5F0 - 2 ; case 4
	.short _0222B6A2 - _0222B5F0 - 2 ; case 5
	.short _0222B6E0 - _0222B5F0 - 2 ; case 6
	.short _0222B6E8 - _0222B5F0 - 2 ; case 7
	.short _0222B6F4 - _0222B5F0 - 2 ; case 8
	.short _0222B720 - _0222B5F0 - 2 ; case 9
	.short _0222B744 - _0222B5F0 - 2 ; case 10
	.short _0222B780 - _0222B5F0 - 2 ; case 11
	.short _0222B7A2 - _0222B5F0 - 2 ; case 12
	.short _0222B7B8 - _0222B5F0 - 2 ; case 13
	.short _0222B7E2 - _0222B5F0 - 2 ; case 14
	.short _0222B7F0 - _0222B5F0 - 2 ; case 15
	.short _0222B7FA - _0222B5F0 - 2 ; case 16
	.short _0222B808 - _0222B5F0 - 2 ; case 17
	.short _0222B84A - _0222B5F0 - 2 ; case 18
	.short _0222B856 - _0222B5F0 - 2 ; case 19
	.short _0222B8BA - _0222B5F0 - 2 ; case 20
	.short _0222B8C6 - _0222B5F0 - 2 ; case 21
	.short _0222B8E2 - _0222B5F0 - 2 ; case 22
	.short _0222B91E - _0222B5F0 - 2 ; case 23
_0222B620:
	mov r0, #0
	strh r0, [r6]
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r0, [r6, #6]
_0222B62A:
	add r0, r4, #0
	bl ov43_0222A420
	ldr r3, [sp, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov43_0222BB20
	mov r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B642:
	bl ov43_0222BFA4
	cmp r0, #4
	bhi _0222B70A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222B656: ; jump table
	.short _0222B932 - _0222B656 - 2 ; case 0
	.short _0222B660 - _0222B656 - 2 ; case 1
	.short _0222B66C - _0222B656 - 2 ; case 2
	.short _0222B678 - _0222B656 - 2 ; case 3
	.short _0222B67E - _0222B656 - 2 ; case 4
_0222B660:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #2
	bl ov43_0222C53C
	b _0222B932
_0222B66C:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #3
	bl ov43_0222C53C
	b _0222B932
_0222B678:
	mov r0, #0x17
	strb r0, [r4, #8]
	b _0222B932
_0222B67E:
	mov r0, #4
	add r6, #0xf4
	str r0, [r6]
	mov r0, #5
	strb r0, [r4, #8]
	b _0222B932
_0222B68A:
	bl ov43_0222BFD4
	mov r0, #4
	strb r0, [r4, #8]
	b _0222B932
_0222B694:
	bl ov43_0222C024
	cmp r0, #1
	bne _0222B70A
	mov r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B6A2:
	add r2, r6, #0
	add r2, #0xf4
	add r1, r6, #0
	ldr r2, [r2]
	add r1, #0xf4
	sub r3, r2, #1
	add r2, r6, #0
	ldr r1, [r1]
	add r2, #0xf4
	str r3, [r2]
	cmp r1, #0
	bgt _0222B70A
	add r1, r6, #0
	mov r2, #0
	add r1, #0xf4
	str r2, [r1]
	bl ov43_0222C620
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222A41C
	ldr r3, [sp, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov43_0222C148
	mov r0, #6
	strb r0, [r4, #8]
	b _0222B932
_0222B6E0:
	bl ov43_0222C228
	strb r0, [r4, #8]
	b _0222B932
_0222B6E8:
	mov r0, #4
	add r6, #0xf4
	str r0, [r6]
	mov r0, #8
	strb r0, [r4, #8]
	b _0222B932
_0222B6F4:
	add r3, r6, #0
	add r3, #0xf4
	ldr r3, [r3]
	sub r5, r3, #1
	add r3, r6, #0
	add r3, #0xf4
	add r6, #0xf4
	str r5, [r3]
	ldr r3, [r6]
	cmp r3, #0
	ble _0222B70C
_0222B70A:
	b _0222B932
_0222B70C:
	bl ov43_0222BBB8
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov43_0222A318
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B720:
	mov r1, #0xb
	ldrsb r2, [r4, r1]
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	asr r0, r0, #3
	strh r0, [r6]
	ldrsb r0, [r4, r1]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	strh r0, [r6, #4]
	mov r0, #1
	strb r0, [r4, #8]
	b _0222B932
_0222B744:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r3, #0
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x10
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl ov43_0222C620
	add r5, r0, #0
	ldr r0, [r4, #4]
	bl sub_0202C6F4
	add r1, r4, r5
	ldrb r1, [r1, #0x18]
	bl sub_0202C254
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222A414
	mov r0, #0xb
	strb r0, [r4, #8]
	b _0222B932
_0222B780:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222B818
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov43_0222BBB8
	add r0, r4, #0
	mov r1, #2
	mov r2, #4
	bl ov43_0222A318
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B7A2:
	bl ov43_0222C620
	add r5, r0, #0
	ldr r0, [r4, #4]
	bl sub_0202C6F4
	add r1, r4, r5
	ldrb r1, [r1, #0x18]
	ldr r2, [r4, #0x58]
	bl sub_0202C270
_0222B7B8:
	ldr r3, [sp, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov43_0222BB20
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	mov r1, #0x11
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xe
	strb r0, [r4, #8]
	b _0222B932
_0222B7E2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222B818
	mov r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B7F0:
	bl ov43_0222C32C
	mov r0, #0x10
	strb r0, [r4, #8]
	b _0222B932
_0222B7FA:
	bl ov43_0222C358
	cmp r0, #1
	bne _0222B818
	mov r0, #0x11
	strb r0, [r4, #8]
	b _0222B932
_0222B808:
	add r0, r4, #0
	add r1, r7, #0
	bl ov43_0222AE2C
	cmp r0, #1
	beq _0222B81A
	cmp r0, #2
	beq _0222B826
_0222B818:
	b _0222B932
_0222B81A:
	add r0, r6, #0
	bl ov43_0222C600
	mov r0, #0x12
	strb r0, [r4, #8]
	b _0222B932
_0222B826:
	add r0, r6, #0
	bl ov43_0222C600
	add r0, r7, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r2, #4
	add r0, r6, #0
	ldrsh r2, [r6, r2]
	add r0, #8
	add r1, r7, #0
	mov r3, #0
	bl ov43_0222C890
	mov r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B84A:
	add r1, r7, #0
	bl ov43_0222C65C
	mov r0, #0x13
	strb r0, [r4, #8]
	b _0222B932
_0222B856:
	add r1, r7, #0
	bl ov43_0222C714
	cmp r0, #1
	bne _0222B932
	ldr r0, [r4, #4]
	bl sub_0202C6F4
	str r0, [sp, #0x10]
	add r0, r6, #0
	bl ov43_0222C620
	str r0, [sp, #0x14]
	add r5, r4, #0
	ldr r1, [sp, #0x14]
	add r5, #0x18
	ldrb r1, [r5, r1]
	ldr r0, [sp, #0x10]
	bl sub_0202C338
	ldr r0, [r4, #4]
	bl sub_0203107C
	ldr r1, [sp, #0x14]
	ldrb r1, [r5, r1]
	bl sub_020311AC
	add r0, r4, #0
	bl ov43_0222A420
	mov r0, #4
	ldrsh r0, [r6, r0]
	mov r3, #0
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldrsh r3, [r6, r3]
	add r0, r6, #0
	add r2, r7, #0
	bl ov43_0222C378
	add r0, r7, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r0, #0x14
	strb r0, [r4, #8]
	b _0222B932
_0222B8BA:
	add r1, r7, #0
	bl ov43_0222C750
	mov r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B8C6:
	bl ov43_0222C2B0
	cmp r0, #1
	bne _0222B8D4
	mov r0, #0x16
	strb r0, [r4, #8]
	b _0222B932
_0222B8D4:
	add r0, r7, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B8E2:
	bl ov43_0222C5D8
	cmp r0, #0
	beq _0222B932
	ldr r0, _0222B938 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _0222B8FA
	bl System_GetTouchNew
	cmp r0, #0
	beq _0222B932
_0222B8FA:
	add r0, r7, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r2, #4
	add r0, r6, #0
	ldrsh r2, [r6, r2]
	add r0, #8
	add r1, r7, #0
	mov r3, #0
	bl ov43_0222C890
	mov r0, #2
	strb r0, [r4, #8]
	add r0, r6, #0
	bl ov43_0222C600
	b _0222B932
_0222B91E:
	bl ov43_0222BBB8
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov43_0222A318
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B932:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B938: .word gSystem
	thumb_func_end ov43_0222B5D0

	thumb_func_start ov43_0222B93C
ov43_0222B93C: ; 0x0222B93C
	ldr r3, _0222B940 ; =ov43_0222BAB8
	bx r3
	.balign 4, 0
_0222B940: .word ov43_0222BAB8
	thumb_func_end ov43_0222B93C

	thumb_func_start ov43_0222B944
ov43_0222B944: ; 0x0222B944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r0, [sp, #0x18]
	ldr r4, [sp, #0x18]
	mov r0, #0
	ldr r5, _0222BA9C ; =ov43_0222ED74
	ldr r6, _0222BAA0 ; =ov43_0222EE08
	add r7, r2, #0
	str r3, [sp, #0x1c]
	str r0, [sp, #0x28]
	add r4, #8
_0222B95A:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	str r0, [sp]
	ldrh r3, [r5]
	add r0, r4, #0
	add r2, r6, #0
	bl ov43_0222C788
	ldr r0, [sp, #0x28]
	add r5, r5, #2
	add r0, r0, #1
	add r6, r6, #6
	add r4, #0x38
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _0222B95A
	ldr r0, [r7, #4]
	ldr r3, [sp, #0x1c]
	mov r1, #0
	mov r2, #0x10
	bl ov42_02227060
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r1, #0xb4
	str r0, [r1]
	ldr r0, [sp, #0x18]
	mov r1, #1
	add r0, #0xb4
	ldr r0, [r0]
	mov r2, #2
	bl ov42_02227228
	mov r3, #0x15
	ldr r1, [sp, #0x18]
	str r3, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _0222BAA4 ; =0x0000014F
	add r1, #0xb8
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r7]
	mov r2, #1
	bl ov43_0222A24C
	ldr r0, [r7, #0x54]
	mov r1, #7
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222BAA8 ; =0x00010F00
	mov r1, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	add r0, #0xb8
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, _0222BAAC ; =ov43_0222EEE0
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x24]
_0222B9F4:
	ldr r1, [sp, #0x1c]
	mov r0, #4
	bl ListMenuItems_ctor
	add r1, r6, #0
	add r1, #0xe4
	ldr r5, [sp, #0x24]
	str r0, [r1]
	mov r4, #0
_0222BA06:
	add r0, r6, #0
	add r0, #0xe4
	ldr r0, [r0]
	ldr r1, [r7, #0x54]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	add r5, #8
	cmp r4, #4
	blt _0222BA06
	ldr r0, [sp, #0x24]
	add r6, r6, #4
	add r0, #0x20
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #2
	blt _0222B9F4
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _0222BAB0 ; =0x00000161
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x10]
	mov r0, #0xf
	str r0, [sp, #0x14]
	ldr r0, [r7]
	add r1, #0xc8
	mov r2, #1
	mov r3, #2
	bl ov43_0222A24C
	ldr r1, [sp, #0x1c]
	mov r0, #0x80
	bl String_ctor
	ldr r1, [sp, #0x18]
	ldr r4, _0222BAB4 ; =ov43_0222EEB0
	add r1, #0xd8
	str r0, [r1]
	add r3, sp, #0x2c
	mov r2, #6
_0222BA6A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222BA6A
	ldr r0, [r7, #4]
	add r7, #0x88
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x1c]
	str r7, [sp, #0x30]
	str r0, [sp, #0x58]
	add r0, sp, #0x2c
	bl CreateSprite
	ldr r1, [sp, #0x18]
	add r1, #0xf8
	str r0, [r1]
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, #0xf8
	str r0, [sp, #0x18]
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BA9C: .word ov43_0222ED74
_0222BAA0: .word ov43_0222EE08
_0222BAA4: .word 0x0000014F
_0222BAA8: .word 0x00010F00
_0222BAAC: .word ov43_0222EEE0
_0222BAB0: .word 0x00000161
_0222BAB4: .word ov43_0222EEB0
	thumb_func_end ov43_0222B944

	thumb_func_start ov43_0222BAB8
ov43_0222BAB8: ; 0x0222BAB8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r7, r2, #0
	bl sub_02024758
	add r0, r5, #0
	add r0, #0xc8
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl String_dtor
	mov r6, #0
	add r4, r5, #0
_0222BADC:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl ListMenuItems_dtor
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #2
	blt _0222BADC
	add r0, r5, #0
	add r0, #0xb8
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl ov42_02227274
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl ov42_02227114
	mov r4, #0
	add r5, #8
_0222BB0E:
	add r0, r5, #0
	add r1, r7, #0
	bl ov43_0222C7EC
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #3
	blt _0222BB0E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222BAB8

	thumb_func_start ov43_0222BB20
ov43_0222BB20: ; 0x0222BB20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r2, #0
	add r7, r1, #0
	add r1, r4, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, #0x64
	mov r2, #5
	add r6, r3, #0
	bl ov43_0222A9F4
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xe
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	ldrh r2, [r0]
	mov r3, #0x14
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #0x11
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	add r0, #0xb8
	bl ScheduleWindowCopyToVram
	ldr r0, [r4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r0, #4
	ldrsh r0, [r5, r0]
	mov r3, #0
	add r1, r7, #0
	str r0, [sp]
	str r3, [sp, #4]
	str r6, [sp, #8]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	add r2, r4, #0
	bl ov43_0222C378
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov43_0222AD74
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x10
	bl ov43_0222AD98
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222BB20

	thumb_func_start ov43_0222BBB8
ov43_0222BBB8: ; 0x0222BBB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov43_0222AA70
	add r0, r5, #0
	add r0, #0xb8
	bl ClearWindowTilemapAndScheduleTransfer
	mov r7, #2
	mov r6, #0
	add r5, #8
	lsl r7, r7, #8
_0222BBD6:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r4, r7
	bl ov43_0222C9A4
	add r6, r6, #1
	add r5, #0x38
	cmp r6, #3
	blt _0222BBD6
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov43_0222AD74
	add r0, r4, #0
	mov r1, #1
	mov r2, #9
	bl ov43_0222AD98
	add r0, r4, #0
	mov r1, #0
	bl ov43_0222AD00
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xe
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0x11
	str r2, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	ldrh r3, [r0]
	lsl r3, r3, #0x15
	lsr r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r3, #0x14
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl CopyToBgTilemapRect
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0x10
	add r1, r0, #0
	str r2, [sp]
	mov r3, #4
	str r3, [sp, #4]
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #0
	add r3, r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222BBB8

	thumb_func_start ov43_0222BC78
ov43_0222BC78: ; 0x0222BC78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r3, #0
	bne _0222BC9C
	ldr r0, _0222BD14 ; =0x000005DD
	bl PlaySE
	mov r2, #4
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	add r0, #8
	add r1, r4, #0
	mov r3, #1
	bl ov43_0222C890
	mov r0, #3
	pop {r3, r4, r5, pc}
_0222BC9C:
	cmp r3, #5
	bne _0222BCEA
	mov r0, #4
	ldrsh r2, [r5, r0]
	cmp r2, #8
	bne _0222BCC2
	ldr r0, _0222BD14 ; =0x000005DD
	bl PlaySE
	mov r2, #4
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	add r0, #8
	add r1, r4, #0
	mov r3, #1
	bl ov43_0222C890
	mov r0, #3
	pop {r3, r4, r5, pc}
_0222BCC2:
	mov r0, #0
	ldrsh r3, [r5, r0]
	ldr r1, [r1, #0x10]
	lsl r3, r3, #3
	add r2, r2, r3
	cmp r1, r2
	bls _0222BD10
	ldr r0, _0222BD14 ; =0x000005DD
	bl PlaySE
	mov r2, #4
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	add r0, #8
	add r1, r4, #0
	mov r3, #1
	bl ov43_0222C890
	mov r0, #4
	pop {r3, r4, r5, pc}
_0222BCEA:
	cmp r3, #1
	bne _0222BCFC
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov43_0222AD40
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222BCFC:
	cmp r3, #2
	bne _0222BD0E
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov43_0222AD40
	mov r0, #2
	pop {r3, r4, r5, pc}
_0222BD0E:
	mov r0, #0
_0222BD10:
	pop {r3, r4, r5, pc}
	nop
_0222BD14: .word 0x000005DD
	thumb_func_end ov43_0222BC78

	thumb_func_start ov43_0222BD18
ov43_0222BD18: ; 0x0222BD18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0222BEE0 ; =gSystem
	add r6, r1, #0
	ldr r1, [r0, #0x48]
	ldr r0, _0222BEE4 ; =0x00000CF3
	add r7, r2, #0
	tst r0, r1
	beq _0222BD30
	mov r0, #0
	str r0, [r6]
_0222BD30:
	ldr r0, _0222BEE0 ; =gSystem
	mov r2, #1
	ldr r1, [r0, #0x48]
	tst r2, r1
	beq _0222BD4A
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #5
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BD4A:
	mov r2, #2
	tst r1, r2
	beq _0222BD72
	mov r0, #8
	strh r0, [r5, #4]
	mov r2, #4
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	add r0, #8
	add r1, r7, #0
	bl ov43_0222C844
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BD72:
	mov r1, #4
	ldrsh r1, [r5, r1]
	mov r4, #0
	lsl r2, r1, #0x10
	lsr r2, r2, #0x10
	str r2, [sp, #8]
	add r2, r4, #0
	str r2, [sp, #4]
	ldr r2, [r0, #0x4c]
	mov r0, #0x40
	tst r0, r2
	beq _0222BDBA
	cmp r1, #8
	bne _0222BDA0
	mov r0, #6
	ldrsh r0, [r5, r0]
	mov r4, #1
	add r1, r4, #0
	strh r0, [r5, #4]
	add r0, r7, #0
	bl ov43_0222AD00
	b _0222BE62
_0222BDA0:
	cmp r1, #4
	bge _0222BDB0
	cmp r1, #0
	ble _0222BE62
	sub r0, r1, #1
	strh r0, [r5, #4]
	mov r4, #1
	b _0222BE62
_0222BDB0:
	ble _0222BE62
	sub r0, r1, #1
	strh r0, [r5, #4]
	mov r4, #1
	b _0222BE62
_0222BDBA:
	mov r0, #0x80
	tst r0, r2
	beq _0222BDEC
	cmp r1, #3
	beq _0222BDC8
	cmp r1, #7
	bne _0222BDD0
_0222BDC8:
	mov r0, #8
	strh r0, [r5, #4]
	mov r4, #1
	b _0222BE62
_0222BDD0:
	cmp r1, #4
	bge _0222BDE0
	cmp r1, #3
	bge _0222BE62
	add r0, r1, #1
	strh r0, [r5, #4]
	mov r4, #1
	b _0222BE62
_0222BDE0:
	cmp r1, #7
	bge _0222BE62
	add r0, r1, #1
	strh r0, [r5, #4]
	mov r4, #1
	b _0222BE62
_0222BDEC:
	mov r0, #0x20
	tst r0, r2
	beq _0222BE12
	cmp r1, #8
	beq _0222BE62
	cmp r1, #4
	bge _0222BE0A
	add r0, r1, #4
	mov r4, #1
	strh r0, [r5, #4]
	add r0, r4, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp]
	b _0222BE62
_0222BE0A:
	sub r0, r1, #4
	strh r0, [r5, #4]
	mov r4, #1
	b _0222BE62
_0222BE12:
	mov r3, #0x10
	add r0, r2, #0
	tst r0, r3
	beq _0222BE38
	cmp r1, #8
	beq _0222BE62
	cmp r1, #4
	bge _0222BE2A
	add r0, r1, #4
	strh r0, [r5, #4]
	mov r4, #1
	b _0222BE62
_0222BE2A:
	sub r0, r1, #4
	mov r4, #1
	strh r0, [r5, #4]
	add r0, r4, #0
	str r0, [sp, #4]
	str r0, [sp]
	b _0222BE62
_0222BE38:
	ldrb r0, [r6, #0xe]
	cmp r0, #0
	beq _0222BE62
	beq _0222BE50
	lsl r1, r3, #5
	tst r1, r2
	beq _0222BE50
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	str r0, [sp]
	b _0222BE62
_0222BE50:
	cmp r0, #0
	beq _0222BE62
	mov r0, #1
	lsl r0, r0, #8
	tst r0, r2
	beq _0222BE62
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp]
_0222BE62:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0222BEBC
	ldr r0, [sp]
	cmp r0, #0
	beq _0222BE96
	mov r0, #0
	ldrsh r1, [r5, r0]
	mov r3, #2
	strh r1, [r5, #2]
	ldrsh r0, [r5, r0]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	strh r0, [r5]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BE96:
	mov r0, #0
	ldrsh r1, [r5, r0]
	strh r1, [r5, #2]
	ldrsh r1, [r5, r0]
	sub r1, r1, #1
	strh r1, [r5]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _0222BEAC
	add r0, r0, #4
	strh r0, [r5]
_0222BEAC:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #1
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BEBC:
	cmp r4, #1
	bne _0222BED8
	ldr r0, _0222BEE8 ; =0x000005E5
	bl PlaySE
	mov r2, #4
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	add r0, #8
	add r1, r7, #0
	bl ov43_0222C844
	ldr r0, [sp, #8]
	strh r0, [r5, #6]
_0222BED8:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0222BEE0: .word gSystem
_0222BEE4: .word 0x00000CF3
_0222BEE8: .word 0x000005E5
	thumb_func_end ov43_0222BD18

	thumb_func_start ov43_0222BEEC
ov43_0222BEEC: ; 0x0222BEEC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222BF9C ; =ov43_0222EF60
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0202529C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222BF08
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222BF08:
	cmp r0, #8
	bhi _0222BF34
	mov r1, #1
	str r1, [r6]
	strh r0, [r5, #4]
	ldr r0, _0222BFA0 ; =0x000005E5
	bl PlaySE
	mov r2, #4
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	add r0, #8
	add r1, r4, #0
	bl ov43_0222C844
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #5
	bl ov43_0222BC78
	pop {r3, r4, r5, r6, r7, pc}
_0222BF34:
	cmp r0, #9
	beq _0222BF4C
	cmp r0, #0xa
	bne _0222BF40
	mov r1, #1
	b _0222BF4C
_0222BF40:
	mov r1, #0
	ldrsh r1, [r5, r1]
	sub r0, #0xb
	sub r0, r0, r1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
_0222BF4C:
	cmp r1, #0
	bne _0222BF54
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222BF54:
	mov r0, #1
	str r0, [r6]
	mov r0, #0
	ldrsh r2, [r5, r0]
	strh r2, [r5, #2]
	ldrsh r2, [r5, r0]
	add r2, r2, r1
	strh r2, [r5]
	cmp r1, #0
	ldrsh r0, [r5, r0]
	blt _0222BF86
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	strh r0, [r5]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #2
	bl ov43_0222BC78
	pop {r3, r4, r5, r6, r7, pc}
_0222BF86:
	cmp r0, #0
	bge _0222BF8E
	add r0, r0, #4
	strh r0, [r5]
_0222BF8E:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #1
	bl ov43_0222BC78
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BF9C: .word ov43_0222EF60
_0222BFA0: .word 0x000005E5
	thumb_func_end ov43_0222BEEC

	thumb_func_start ov43_0222BFA4
ov43_0222BFA4: ; 0x0222BFA4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r3, #0
	str r3, [sp]
	add r3, sp, #0
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov43_0222BEEC
	ldr r1, [sp]
	cmp r1, #0
	beq _0222BFC6
	mov r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BFC6:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov43_0222BD18
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov43_0222BFA4

	thumb_func_start ov43_0222BFD4
ov43_0222BFD4: ; 0x0222BFD4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0xb2
	ldrh r0, [r0]
	add r4, r2, #0
	cmp r0, #2
	bne _0222BFE8
	mov r2, #2
	b _0222BFEA
_0222BFE8:
	mov r2, #1
_0222BFEA:
	mov r0, #4
	ldrsh r0, [r5, r0]
	str r0, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r3, #0
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	add r2, r4, #0
	bl ov43_0222C378
	add r5, #8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xa
	bl ov43_0222C844
	add r0, r4, #0
	mov r1, #0
	bl ov43_0222AD20
	ldr r0, _0222C020 ; =0x000005E1
	bl PlaySE
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0222C020: .word 0x000005E1
	thumb_func_end ov43_0222BFD4

	thumb_func_start ov43_0222C024
ov43_0222C024: ; 0x0222C024
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0xb0
	ldrsh r0, [r5, r0]
	str r1, [sp, #0xc]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #8
	blt _0222C0B4
	mov r2, #0
	ldr r0, [r4]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r4]
	mov r1, #3
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r3, _0222C140 ; =ov43_0222F0FC
	add r2, sp, #0x10
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r4, #0
	add r0, #8
	add r1, r7, #0
	bl sub_02025C88
	add r0, r5, #0
	add r0, #0xb2
	ldrh r0, [r0]
	cmp r0, #2
	bne _0222C076
	mov r2, #2
	b _0222C078
_0222C076:
	mov r2, #1
_0222C078:
	mov r0, #0x38
	add r1, r5, #0
	mul r0, r2
	mov r2, #2
	add r1, #8
	lsl r2, r2, #8
	add r0, r1, r0
	add r1, r4, #0
	add r2, r4, r2
	bl ov43_0222C9A4
	mov r0, #4
	ldrsh r0, [r5, r0]
	mov r3, #0
	ldr r1, [sp, #0xc]
	str r0, [sp]
	str r3, [sp, #4]
	str r6, [sp, #8]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	add r2, r4, #0
	bl ov43_0222C378
	add r0, r4, #0
	mov r1, #1
	bl ov43_0222AD20
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222C0B4:
	lsl r1, r0, #8
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r6, r0, #3
	add r0, r5, #0
	add r0, #0xb2
	ldrh r0, [r0]
	cmp r0, #2
	bne _0222C0CA
	neg r6, r6
_0222C0CA:
	ldr r0, [r4]
	mov r1, #2
	mov r2, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4]
	mov r1, #3
	mov r2, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	ldr r3, _0222C140 ; =ov43_0222F0FC
	add r2, sp, #0x10
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r1, [sp, #0x10]
	lsl r0, r6, #0xc
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #8
	add r1, r7, #0
	bl sub_02025C88
	mov r0, #0xb0
	ldrsh r3, [r5, r0]
	mov r0, #0x1f
	lsr r2, r3, #0x1f
	lsl r1, r3, #0x1f
	sub r1, r1, r2
	ror r1, r0
	add r0, r2, r1
	beq _0222C130
	add r2, r3, r2
	asr r0, r2, #1
	lsl r1, r0, #2
	ldr r0, _0222C144 ; =ov43_0222F0EC
	ldr r6, [r0, r1]
	cmp r6, #0
	beq _0222C130
	mov r2, #0
	mov r3, #2
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	add r1, r4, #0
	blx r6
_0222C130:
	mov r0, #0xb0
	ldrsh r0, [r5, r0]
	add r5, #0xb0
	add r0, r0, #1
	strh r0, [r5]
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C140: .word ov43_0222F0FC
_0222C144: .word ov43_0222F0EC
	thumb_func_end ov43_0222C024

	thumb_func_start ov43_0222C148
ov43_0222C148: ; 0x0222C148
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #4]
	add r4, r2, #0
	str r3, [sp, #0x18]
	bl sub_0202C6F4
	str r0, [sp, #0x1c]
	add r0, r6, #0
	bl ov43_0222C620
	str r0, [sp, #0x20]
	add r7, r5, #0
	ldr r1, [sp, #0x20]
	add r7, #0x18
	ldrb r1, [r7, r1]
	ldr r0, [sp, #0x1c]
	mov r2, #8
	bl sub_0202C090
	str r0, [sp, #0x24]
	add r0, sp, #0x28
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r1, _0222C220 ; =ov43_0222ED9C
	add r0, sp, #0x28
	ldrh r2, [r1, #4]
	strh r2, [r0]
	ldrh r2, [r1, #6]
	strh r2, [r0, #2]
	ldrh r2, [r1, #8]
	strh r2, [r0, #4]
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #6]
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #0xe]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	ldr r0, [sp, #0x24]
	cmp r0, #2
	bne _0222C1AC
	add r0, r6, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x34]
	b _0222C1B4
_0222C1AC:
	add r0, r6, #0
	add r0, #0xe4
	ldr r0, [r0]
	str r0, [sp, #0x34]
_0222C1B4:
	ldr r0, [r4]
	mov r1, #4
	str r0, [sp, #0x38]
	add r0, sp, #0x28
	strb r1, [r0, #0x14]
	mov r0, #5
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, _0222C224 ; =ov43_0222C630
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5]
	ldr r0, [r4, #0x5c]
	lsl r2, r2, #0x18
	add r1, sp, #0x28
	lsr r2, r2, #0x18
	mov r3, #0xd
	bl sub_02018648
	add r1, r6, #0
	add r1, #0xec
	str r0, [r1]
	ldr r2, [sp, #0x20]
	ldr r1, [r5, #4]
	ldrb r2, [r7, r2]
	ldr r3, [sp, #0x18]
	add r0, r4, #0
	bl ov43_0222AB20
	ldr r3, [sp, #0x18]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0xc
	bl ov43_0222C550
	add r0, r4, #0
	mov r1, #0
	bl ov43_0222AD00
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #8
	mov r2, #0
	mov r3, #0x3d
	bl sub_0200B484
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C220: .word ov43_0222ED9C
_0222C224: .word ov43_0222C630
	thumb_func_end ov43_0222C148

	thumb_func_start ov43_0222C228
ov43_0222C228: ; 0x0222C228
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	bl ov43_0222C5D8
	cmp r0, #0
	bne _0222C23C
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0222C23C:
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	bl sub_020186A4
	add r4, r0, #0
	cmp r4, #3
	beq _0222C25E
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222C25E
	add r0, r0, #1
	cmp r4, r0
	bne _0222C268
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0222C25E:
	add r0, r6, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r4, #2
_0222C268:
	add r0, r5, #0
	bl ov43_0222C600
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	bl sub_02018674
	str r0, [r7]
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	bl sub_02018680
	cmp r4, #2
	bne _0222C2A0
	add r0, r6, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r2, #4
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	add r0, #8
	add r1, r6, #0
	mov r3, #0
	bl ov43_0222C890
_0222C2A0:
	mov r0, #0
	mov r1, #0x3d
	mov r2, #1
	bl SetBlendBrightness
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222C228

	thumb_func_start ov43_0222C2B0
ov43_0222C2B0: ; 0x0222C2B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	add r4, r2, #0
	str r3, [sp, #4]
	bl sub_0202C6F4
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	bl ov43_0222C620
	add r6, r5, #0
	add r7, r0, #0
	add r6, #0x18
	ldrb r1, [r6, r7]
	ldr r0, [sp, #0x1c]
	bl sub_0202C23C
	bl DWC_GetFriendKey
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	mov r2, #0
	eor r0, r2
	ldr r2, [sp, #0x14]
	mov r1, #0
	eor r1, r2
	orr r0, r1
	beq _0222C2F6
	mov r0, #0x3c
	str r0, [sp, #8]
	b _0222C2FA
_0222C2F6:
	mov r0, #0x42
	str r0, [sp, #8]
_0222C2FA:
	ldr r0, _0222C328 ; =0x000005DD
	bl PlaySE
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov43_0222AAA4
	ldrb r2, [r6, r7]
	ldr r1, [r5, #4]
	ldr r3, [sp, #4]
	add r0, r4, #0
	bl ov43_0222AB20
	ldr r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r1, r4, #0
	bl ov43_0222C550
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C328: .word 0x000005DD
	thumb_func_end ov43_0222C2B0

	thumb_func_start ov43_0222C32C
ov43_0222C32C: ; 0x0222C32C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl ov43_0222C620
	add r2, r0, #0
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	ldr r1, [r5, #4]
	add r0, r4, #0
	add r3, r6, #0
	bl ov43_0222AB20
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0x39
	add r3, r6, #0
	bl ov43_0222C550
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222C32C

	thumb_func_start ov43_0222C358
ov43_0222C358: ; 0x0222C358
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl ov43_0222C5D8
	cmp r0, #0
	bne _0222C36A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222C36A:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov43_0222ADB8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222C358

	thumb_func_start ov43_0222C378
ov43_0222C378: ; 0x0222C378
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x34]
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r1, #0
	bne _0222C398
	ldr r1, [sp, #0x30]
	strh r7, [r5]
	strh r1, [r5, #4]
	add r1, r6, #0
	add r2, r7, #0
	bl ov43_0222C3E8
_0222C398:
	ldr r1, [sp, #0x34]
	add r4, r5, #0
	mov r0, #0x38
	mul r0, r1
	mov r2, #2
	lsl r2, r2, #8
	add r4, #8
	str r0, [sp, #0x14]
	add r0, r4, r0
	add r1, r6, #0
	add r2, r6, r2
	bl ov43_0222C7F8
	mov r0, #2
	lsl r0, r0, #8
	add r0, r6, r0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r5, #0xb4
	add r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	ldr r3, [r5]
	add r0, r4, r0
	add r2, r6, #0
	bl ov43_0222C918
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x30]
	add r0, r4, r0
	add r1, r6, #0
	bl ov43_0222C844
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222C378

	thumb_func_start ov43_0222C3E8
ov43_0222C3E8: ; 0x0222C3E8
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r0, #0x83
	add r5, r1, #0
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r2, #0
	mov r2, #0x10
	add r1, r0, #0
	str r2, [sp]
	mov r3, #4
	str r3, [sp, #4]
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r3, [r0]
	lsl r3, r3, #0x15
	lsr r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r3, r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl CopyToBgTilemapRect
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	str r1, [sp]
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	lsl r2, r4, #2
	str r1, [sp, #8]
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	mov r1, #8
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	add r2, #0x10
	lsl r2, r2, #0x18
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #0
	lsr r2, r2, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	add r3, r1, #0
	bl CopyToBgTilemapRect
	ldr r0, [r5]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov43_0222C3E8

	thumb_func_start ov43_0222C46C
ov43_0222C46C: ; 0x0222C46C
	push {r3, r4, lr}
	sub sp, #0x1c
	mov r0, #0x83
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	str r1, [sp]
	lsl r2, r3, #2
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	add r2, #0x10
	str r1, [sp, #8]
	lsl r1, r2, #0x18
	lsr r2, r1, #0x18
	str r2, [sp, #0xc]
	mov r1, #8
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #0
	add r3, r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov43_0222C46C

	thumb_func_start ov43_0222C4B8
ov43_0222C4B8: ; 0x0222C4B8
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r0, #0x83
	add r5, r1, #0
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r2, #0
	mov r2, #0x10
	add r1, r0, #0
	str r2, [sp]
	mov r3, #4
	str r3, [sp, #4]
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r3, [r0]
	lsl r3, r3, #0x15
	lsr r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r3, r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl CopyToBgTilemapRect
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	str r1, [sp]
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	lsl r2, r4, #2
	str r1, [sp, #8]
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	mov r1, #8
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	add r2, #0x10
	lsl r2, r2, #0x18
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #0
	lsr r2, r2, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	add r3, r1, #0
	bl CopyToBgTilemapRect
	ldr r0, [r5]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov43_0222C4B8

	thumb_func_start ov43_0222C53C
ov43_0222C53C: ; 0x0222C53C
	mov r3, #3
	strb r3, [r1, #8]
	add r1, r0, #0
	add r1, #0xb2
	strh r2, [r1]
	mov r1, #0
	add r0, #0xb0
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov43_0222C53C

	thumb_func_start ov43_0222C550
ov43_0222C550: ; 0x0222C550
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	add r0, #0xc8
	mov r1, #0xf
	add r7, r2, #0
	bl FillWindowPixelBuffer
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	add r6, r0, #0
	ldr r0, [r4, #0x54]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0xd8
	ldr r0, [r4, #0x50]
	ldr r1, [r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	mov r0, #1
	bl sub_02002B8C
	mov r3, #0
	add r0, r5, #0
	add r2, r5, #0
	str r3, [sp]
	add r0, #0xe0
	ldr r0, [r0]
	add r2, #0xd8
	str r0, [sp, #4]
	ldr r0, _0222C5D4 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r2]
	add r0, #0xc8
	bl AddTextPrinterParameterized2
	add r1, r5, #0
	add r1, #0xdc
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xc8
	mov r1, #1
	mov r2, #0x46
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r5, #0xc8
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C5D4: .word 0x00010200
	thumb_func_end ov43_0222C550

	thumb_func_start ov43_0222C5D8
ov43_0222C5D8: ; 0x0222C5D8
	push {r4, lr}
	add r0, #0xdc
	ldr r0, [r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222C5FC
	mov r0, #0
	bl sub_02002B8C
	bl sub_02002C04
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_0222C5FC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov43_0222C5D8

	thumb_func_start ov43_0222C600
ov43_0222C600: ; 0x0222C600
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc8
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0xc8
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, #0xb8
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222C600

	thumb_func_start ov43_0222C620
ov43_0222C620: ; 0x0222C620
	mov r1, #0
	ldrsh r1, [r0, r1]
	lsl r2, r1, #3
	mov r1, #4
	ldrsh r0, [r0, r1]
	add r0, r2, r0
	bx lr
	.balign 4, 0
	thumb_func_end ov43_0222C620

	thumb_func_start ov43_0222C630
ov43_0222C630: ; 0x0222C630
	push {r3, lr}
	cmp r3, #1
	bne _0222C63E
	ldr r0, _0222C658 ; =0x000005DC
	bl PlaySE
	pop {r3, pc}
_0222C63E:
	cmp r3, #2
	bne _0222C64A
	ldr r0, _0222C658 ; =0x000005DC
	bl PlaySE
	pop {r3, pc}
_0222C64A:
	cmp r3, #3
	bne _0222C654
	ldr r0, _0222C658 ; =0x000005DC
	bl PlaySE
_0222C654:
	pop {r3, pc}
	nop
_0222C658: .word 0x000005DC
	thumb_func_end ov43_0222C630

	thumb_func_start ov43_0222C65C
ov43_0222C65C: ; 0x0222C65C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0xf8
	add r4, r1, #0
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov43_0222AD74
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	mov r1, #0
	add r0, #0xfc
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #4
	ldrsh r1, [r5, r0]
	mov r0, #0xa
	add r5, #0xf8
	add r3, r1, #0
	mul r3, r0
	ldr r0, _0222C700 ; =ov43_0222EFA0
	ldrsh r0, [r0, r3]
	lsl r2, r0, #3
	ldr r0, _0222C704 ; =ov43_0222EFA2
	str r2, [sp]
	ldrsh r0, [r0, r3]
	lsl r1, r0, #3
	add r1, #0xfc
	lsl r0, r2, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	lsl r0, r1, #0xc
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #0
	bl sub_020247D4
	ldr r1, _0222C708 ; =0x0400004A
	ldr r0, _0222C70C ; =0xFFFFC0FF
	ldrh r2, [r1]
	and r2, r0
	mov r0, #7
	lsl r0, r0, #8
	orr r2, r0
	strh r2, [r1]
	ldrh r3, [r1]
	mov r2, #0x3f
	sub r0, #0xd8
	bic r3, r2
	mov r2, #0x1f
	orr r3, r2
	mov r2, #0x20
	orr r3, r2
	strh r3, [r1]
	lsl r4, r2, #0x15
	ldr r3, [r4]
	ldr r1, _0222C710 ; =0xFFFF1FFF
	and r3, r1
	lsl r1, r2, #0xa
	orr r1, r3
	str r1, [r4]
	bl PlaySE
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0222C700: .word ov43_0222EFA0
_0222C704: .word ov43_0222EFA2
_0222C708: .word 0x0400004A
_0222C70C: .word 0xFFFFC0FF
_0222C710: .word 0xFFFF1FFF
	thumb_func_end ov43_0222C65C

	thumb_func_start ov43_0222C714
ov43_0222C714: ; 0x0222C714
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl sub_02024B68
	cmp r0, #0
	bne _0222C728
	mov r0, #1
	pop {r4, pc}
_0222C728:
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl sub_020249F8
	add r1, r4, #0
	add r1, #0xfc
	ldr r1, [r1]
	sub r1, r0, r1
	cmp r1, #2
	blo _0222C748
	add r4, #0xfc
	str r0, [r4]
	ldr r0, _0222C74C ; =0x00000628
	bl PlaySE
_0222C748:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222C74C: .word 0x00000628
	thumb_func_end ov43_0222C714

	thumb_func_start ov43_0222C750
ov43_0222C750: ; 0x0222C750
	push {r3, r4, r5, lr}
	mov r2, #1
	lsl r2, r2, #0x1a
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r2]
	ldr r0, _0222C784 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r5, #0xf8
	ldr r0, [r5]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xff
	bl ov43_0222AD74
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C784: .word 0xFFFF1FFF
	thumb_func_end ov43_0222C750

	thumb_func_start ov43_0222C788
ov43_0222C788: ; 0x0222C788
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r2, #0
	add r5, r0, #0
	ldrh r0, [r4]
	add r6, r1, #0
	add r7, r3, #0
	strh r0, [r5]
	ldrh r0, [r4, #2]
	strh r0, [r5, #2]
	ldrh r0, [r4, #4]
	strh r0, [r5, #4]
	add r0, r5, #0
	add r0, #8
	bl InitWindow
	mov r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0222C7B2
	neg r1, r1
_0222C7B2:
	mov r0, #0
	ldrsh r3, [r4, r0]
	cmp r3, #0
	bge _0222C7BC
	neg r3, r3
_0222C7BC:
	add r0, r1, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #0x11
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	add r3, r3, #4
	str r0, [sp, #0x10]
	add r5, #8
	lsl r3, r3, #0x18
	ldr r0, [r6]
	add r1, r5, #0
	mov r2, #3
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222C788

	thumb_func_start ov43_0222C7EC
ov43_0222C7EC: ; 0x0222C7EC
	ldr r3, _0222C7F4 ; =RemoveWindow
	add r0, #8
	bx r3
	nop
_0222C7F4: .word RemoveWindow
	thumb_func_end ov43_0222C7EC

	thumb_func_start ov43_0222C7F8
ov43_0222C7F8: ; 0x0222C7F8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	mov r1, #2
	ldrsh r5, [r0, r1]
	cmp r5, #0
	bge _0222C808
	neg r5, r5
_0222C808:
	mov r1, #0
	ldrsh r3, [r0, r1]
	cmp r3, #0
	bge _0222C812
	neg r3, r3
_0222C812:
	lsl r0, r5, #0x18
	ldr r2, [r2, #8]
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r2]
	lsl r3, r3, #0x18
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsr r3, r3, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl LoadRectToBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov43_0222C7F8

	thumb_func_start ov43_0222C844
ov43_0222C844: ; 0x0222C844
	push {r4, lr}
	add r4, r1, #0
	cmp r2, #0xa
	bne _0222C858
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov43_0222AD74
	pop {r4, pc}
_0222C858:
	ldr r1, _0222C88C ; =ov43_0222EFA0
	mov r0, #0xa
	add r3, r2, #0
	mul r3, r0
	add r2, r1, r3
	ldrsh r1, [r1, r3]
	mov r3, #2
	ldrsh r2, [r2, r3]
	mov r0, #0x7f
	lsl r0, r0, #2
	add r1, r1, #7
	add r2, r2, #2
	lsl r1, r1, #0x13
	lsl r2, r2, #0x13
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xff
	bl ov43_0222AD74
	pop {r4, pc}
	nop
_0222C88C: .word ov43_0222EFA0
	thumb_func_end ov43_0222C844

	thumb_func_start ov43_0222C890
ov43_0222C890: ; 0x0222C890
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r5, _0222C914 ; =ov43_0222EFA0
	add r7, r0, #0
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r4, #0
_0222C8A0:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0222C8B0
	ldr r0, [sp, #0x10]
	cmp r0, r4
	bne _0222C8B0
	ldrb r0, [r5, #8]
	b _0222C8B2
_0222C8B0:
	ldrb r0, [r5, #7]
_0222C8B2:
	mov r1, #2
	ldrsh r3, [r7, r1]
	cmp r3, #0
	bge _0222C8BC
	neg r3, r3
_0222C8BC:
	mov r1, #0
	ldrsh r2, [r7, r1]
	cmp r2, #0
	bge _0222C8C6
	neg r2, r2
_0222C8C6:
	ldrb r1, [r5, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r1, [sp]
	ldrb r1, [r5, #5]
	mov r6, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldrsh r6, [r5, r6]
	ldr r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	add r2, r6, r2
	mov r6, #2
	ldrsh r6, [r5, r6]
	lsl r2, r2, #0x18
	ldr r0, [r0]
	add r3, r6, r3
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	add r4, r4, #1
	add r5, #0xa
	cmp r4, #9
	blt _0222C8A0
	ldr r0, [sp, #0xc]
	mov r1, #2
	ldr r0, [r0]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [sp, #0xc]
	mov r1, #0
	ldr r0, [r0]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C914: .word ov43_0222EFA0
	thumb_func_end ov43_0222C890

	thumb_func_start ov43_0222C918
ov43_0222C918: ; 0x0222C918
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r7, r2, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	str r3, [sp, #0x10]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r1, #4]
	bl sub_0202C6F4
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r0, #8
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r1, r7, #0
	bl ov43_0222CA30
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x34]
	lsl r0, r0, #3
	str r0, [sp, #0x18]
	mov r4, #0
	add r5, r1, r0
_0222C954:
	ldr r0, [sp, #0x34]
	ldr r1, [r0]
	ldr r0, [sp, #0x18]
	add r0, r0, r4
	cmp r1, r0
	bls _0222C97C
	ldr r0, [sp, #0x14]
	str r4, [sp]
	str r0, [sp, #4]
	ldrb r0, [r5, #8]
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	ldr r0, [sp, #0x3c]
	add r2, r7, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl ov43_0222CA50
	b _0222C988
_0222C97C:
	ldr r2, [sp, #0x30]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r4, #0
	bl ov43_0222CB34
_0222C988:
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #8
	blt _0222C954
	ldr r0, [r7]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r6, #8
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222C918

	thumb_func_start ov43_0222C9A4
ov43_0222C9A4: ; 0x0222C9A4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl ov43_0222CA30
	add r0, r5, #0
	add r0, #8
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #2
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _0222C9C2
	neg r1, r1
_0222C9C2:
	mov r0, #0
	ldrsh r3, [r5, r0]
	cmp r3, #0
	bge _0222C9CC
	neg r3, r3
_0222C9CC:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #4]
	lsl r3, r3, #0x18
	mov r2, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #5]
	mov r1, #2
	lsr r3, r3, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #2
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _0222C9FC
	neg r1, r1
_0222C9FC:
	mov r0, #0
	ldrsh r3, [r5, r0]
	cmp r3, #0
	bge _0222CA06
	neg r3, r3
_0222CA06:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #4]
	lsl r3, r3, #0x18
	mov r2, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #5]
	mov r1, #3
	lsr r3, r3, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222C9A4

	thumb_func_start ov43_0222CA30
ov43_0222CA30: ; 0x0222CA30
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_0222CA38:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _0222CA44
	bl ov42_0222740C
	str r6, [r5, #0x18]
_0222CA44:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _0222CA38
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov43_0222CA30

	thumb_func_start ov43_0222CA50
ov43_0222CA50: ; 0x0222CA50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	ldr r0, [sp, #0x48]
	add r6, r2, #0
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	mov r2, #7
	str r3, [sp, #0x14]
	ldr r4, [sp, #0x40]
	bl sub_0202C090
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	mov r2, #8
	bl sub_0202C090
	add r7, r0, #0
	cmp r7, #2
	bne _0222CA8C
	ldr r2, [sp, #0x14]
	add r0, r5, #0
	add r1, r6, #0
	add r3, r4, #0
	bl ov43_0222CB34
	b _0222CAD0
_0222CA8C:
	mov r0, #0xa
	add r6, r4, #0
	mul r6, r0
	ldr r2, _0222CB28 ; =ov43_0222EFA0
	mov r1, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r2, r6]
	add r0, #0xfc
	add r1, r1, r2
	lsl r2, r1, #3
	add r2, #8
	add r1, sp, #0x20
	strh r2, [r1]
	mov r2, #2
	ldrsh r3, [r5, r2]
	ldr r2, _0222CB2C ; =ov43_0222EFA2
	ldrsh r2, [r2, r6]
	add r2, r3, r2
	lsl r2, r2, #3
	add r0, r2, r0
	strh r0, [r1, #2]
	mov r0, #8
	strh r0, [r1, #4]
	mov r0, #1
	strh r0, [r1, #6]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x4c]
	add r1, sp, #0x20
	bl ov42_022272BC
	lsl r1, r4, #2
	add r1, r5, r1
	str r0, [r1, #0x18]
_0222CAD0:
	ldr r1, [sp, #0x4c]
	mov r0, #0x80
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	bl sub_0202C254
	add r1, r0, #0
	add r0, r6, #0
	bl CopyU16ArrayToString
	add r3, r4, #0
	mov r0, #0xa
	mul r3, r0
	ldr r0, _0222CB2C ; =ov43_0222EFA2
	ldr r4, _0222CB28 ; =ov43_0222EFA0
	ldrsh r0, [r0, r3]
	ldrsh r3, [r4, r3]
	lsl r1, r7, #2
	lsl r0, r0, #3
	sub r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222CB30 ; =ov43_0222ED94
	add r5, #8
	ldr r0, [r0, r1]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r6, #0
	lsl r3, r3, #3
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CB28: .word ov43_0222EFA0
_0222CB2C: .word ov43_0222EFA2
_0222CB30: .word ov43_0222ED94
	thumb_func_end ov43_0222CA50

	thumb_func_start ov43_0222CB34
ov43_0222CB34: ; 0x0222CB34
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r1, r3, #0
	mov r3, #2
	ldrsh r5, [r0, r3]
	cmp r5, #0
	bge _0222CB46
	neg r5, r5
_0222CB46:
	mov r3, #0
	ldrsh r6, [r0, r3]
	cmp r6, #0
	bge _0222CB50
	neg r6, r6
_0222CB50:
	ldr r0, [r2, #0xc]
	add r3, r1, #0
	mov r1, #3
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	mov r2, #0xa
	str r1, [sp, #0xc]
	mul r3, r2
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	ldr r2, _0222CBA4 ; =ov43_0222EFA0
	ldrsh r2, [r2, r3]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	add r2, r2, r6
	ldr r6, _0222CBA8 ; =ov43_0222EFA2
	ldrh r0, [r0, #2]
	ldrsh r3, [r6, r3]
	lsl r2, r2, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	add r3, r3, r5
	str r0, [sp, #0x18]
	lsl r3, r3, #0x18
	ldr r0, [r4]
	mov r1, #2
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222CBA4: .word ov43_0222EFA0
_0222CBA8: .word ov43_0222EFA2
	thumb_func_end ov43_0222CB34

	thumb_func_start ov43_0222CBAC
ov43_0222CBAC: ; 0x0222CBAC
	push {r3, lr}
	bl ov43_0222CD3C
	pop {r3, pc}
	thumb_func_end ov43_0222CBAC

	thumb_func_start ov43_0222CBB4
ov43_0222CBB4: ; 0x0222CBB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r2, #0
	add r7, r1, #0
	ldrb r1, [r5, #8]
	add r4, r0, #0
	ldr r6, [sp, #0x30]
	cmp r1, #6
	bls _0222CBC8
	b _0222CD26
_0222CBC8:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222CBD4: ; jump table
	.short _0222CBE2 - _0222CBD4 - 2 ; case 0
	.short _0222CC2A - _0222CBD4 - 2 ; case 1
	.short _0222CC64 - _0222CBD4 - 2 ; case 2
	.short _0222CC92 - _0222CBD4 - 2 ; case 3
	.short _0222CCAC - _0222CBD4 - 2 ; case 4
	.short _0222CCCE - _0222CBD4 - 2 ; case 5
	.short _0222CD12 - _0222CBD4 - 2 ; case 6
_0222CBE2:
	add r1, r5, #0
	add r2, r6, #0
	bl ov43_0222CD44
	str r0, [r4, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0xc
	add r2, sp, #8
	bl sub_02085400
	str r0, [r4, #8]
	add r0, r7, #0
	bl ov43_0222A1DC
	ldr r0, _0222CD2C ; =_02102610
	ldr r1, [r4, #4]
	add r2, r6, #0
	bl OverlayManager_new
	str r0, [r4]
	mov r0, #1
	strb r0, [r5, #8]
	b _0222CD26
_0222CC2A:
	ldr r0, [r4]
	bl OverlayManager_run
	cmp r0, #0
	beq _0222CD26
	ldr r0, [r4]
	bl OverlayManager_delete
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0222CC54
	ldr r0, _0222CD30 ; =_02102620
	ldr r1, [r4, #8]
	add r2, r6, #0
	bl OverlayManager_new
	str r0, [r4]
	mov r0, #2
	strb r0, [r5, #8]
	b _0222CD26
_0222CC54:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov43_0222A318
	mov r0, #3
	strb r0, [r5, #8]
	b _0222CD26
_0222CC64:
	ldr r0, [r4]
	bl OverlayManager_run
	cmp r0, #0
	beq _0222CD26
	ldr r0, [r4]
	bl OverlayManager_delete
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r1, [r1, #0x18]
	ldr r2, [r2, #0x1c]
	add r0, r5, #0
	bl ov43_0222A338
	add r0, r5, #0
	mov r1, #0
	mov r2, #7
	bl ov43_0222A318
	mov r0, #3
	strb r0, [r5, #8]
	b _0222CD26
_0222CC92:
	ldr r0, [r4, #4]
	bl sub_0208311C
	ldr r0, [r4, #8]
	bl sub_02085438
	add r0, r7, #0
	add r1, r6, #0
	bl ov43_0222A154
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222CCAC:
	add r1, r5, #0
	add r2, r6, #0
	bl ov43_0222CD44
	str r0, [r4, #4]
	add r0, r7, #0
	bl ov43_0222A1DC
	ldr r0, _0222CD2C ; =_02102610
	ldr r1, [r4, #4]
	add r2, r6, #0
	bl OverlayManager_new
	str r0, [r4]
	mov r0, #5
	strb r0, [r5, #8]
	b _0222CD26
_0222CCCE:
	ldr r0, [r4]
	bl OverlayManager_run
	cmp r0, #0
	beq _0222CD26
	ldr r0, [r4]
	bl OverlayManager_delete
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0222CD02
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xc
	bl ov43_0222A318
	ldr r1, [r4, #4]
	add r0, r5, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	bl ov43_0222A338
	mov r0, #6
	strb r0, [r5, #8]
	b _0222CD26
_0222CD02:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xd
	bl ov43_0222A318
	mov r0, #6
	strb r0, [r5, #8]
	b _0222CD26
_0222CD12:
	ldr r0, [r4, #4]
	bl sub_0208311C
	add r0, r7, #0
	add r1, r6, #0
	bl ov43_0222A154
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222CD26:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CD2C: .word _02102610
_0222CD30: .word _02102620
	thumb_func_end ov43_0222CBB4

	thumb_func_start ov43_0222CD34
ov43_0222CD34: ; 0x0222CD34
	ldr r3, _0222CD38 ; =ov43_0222CD40
	bx r3
	.balign 4, 0
_0222CD38: .word ov43_0222CD40
	thumb_func_end ov43_0222CD34

	thumb_func_start ov43_0222CD3C
ov43_0222CD3C: ; 0x0222CD3C
	bx lr
	.balign 4, 0
	thumb_func_end ov43_0222CD3C

	thumb_func_start ov43_0222CD40
ov43_0222CD40: ; 0x0222CD40
	bx lr
	.balign 4, 0
	thumb_func_end ov43_0222CD40

	thumb_func_start ov43_0222CD44
ov43_0222CD44: ; 0x0222CD44
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r0, [r5, #4]
	add r4, r2, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp]
	mov r2, #0
	mov r1, #7
	str r2, [sp, #4]
	add r0, r4, #0
	add r3, r1, #0
	bl sub_020830D8
	add r4, r0, #0
	ldr r0, [r5, #0x64]
	cmp r0, #1
	bne _0222CD88
	ldr r0, [r5, #0x60]
	ldrh r0, [r0]
	bl sub_02020B78
	cmp r0, #0
	ldr r0, [r4, #0x18]
	bne _0222CD80
	ldr r1, [r5, #0x60]
	bl CopyU16ArrayToString
	b _0222CD84
_0222CD80:
	bl StringSetEmpty
_0222CD84:
	mov r0, #0
	str r0, [r5, #0x64]
_0222CD88:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222CD44

	thumb_func_start ov43_0222CD90
ov43_0222CD90: ; 0x0222CD90
	push {r3, lr}
	bl ov43_0222CE48
	pop {r3, pc}
	thumb_func_end ov43_0222CD90

	thumb_func_start ov43_0222CD98
ov43_0222CD98: ; 0x0222CD98
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldrb r3, [r4, #8]
	add r5, r0, #0
	add r6, r2, #0
	cmp r3, #0
	beq _0222CDB0
	cmp r3, #1
	beq _0222CDBA
	cmp r3, #2
	beq _0222CDDC
	b _0222CE04
_0222CDB0:
	bl ov43_0222D028
	mov r0, #1
	strb r0, [r4, #8]
	b _0222CE04
_0222CDBA:
	bl ov43_0222CE14
	cmp r0, #0
	beq _0222CE04
	ldr r0, _0222CE08 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov43_0222D0F8
	mov r0, #4
	str r0, [r5, #0x38]
	mov r0, #2
	strb r0, [r4, #8]
	b _0222CE04
_0222CDDC:
	ldr r1, [r5, #0x38]
	sub r1, r1, #1
	str r1, [r5, #0x38]
	cmp r1, #0
	bgt _0222CE04
	add r1, r6, #0
	mov r2, #0
	bl ov43_0222D0F8
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov43_0222A318
	add r0, r5, #0
	add r1, r6, #0
	bl ov43_0222D090
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222CE04:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222CE08: .word 0x000005DD
	thumb_func_end ov43_0222CD98

	thumb_func_start ov43_0222CE0C
ov43_0222CE0C: ; 0x0222CE0C
	ldr r3, _0222CE10 ; =ov43_0222D008
	bx r3
	.balign 4, 0
_0222CE10: .word ov43_0222D008
	thumb_func_end ov43_0222CE0C

	thumb_func_start ov43_0222CE14
ov43_0222CE14: ; 0x0222CE14
	push {r4, lr}
	ldr r0, _0222CE40 ; =ov43_0222ED7A
	add r4, r1, #0
	bl sub_0202529C
	cmp r0, #0
	bne _0222CE28
	mov r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222CE28:
	add r0, r4, #0
	bl ov43_0222A320
	ldr r0, _0222CE44 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0222CE3C
	mov r0, #1
	pop {r4, pc}
_0222CE3C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222CE40: .word ov43_0222ED7A
_0222CE44: .word gSystem
	thumb_func_end ov43_0222CE14

	thumb_func_start ov43_0222CE48
ov43_0222CE48: ; 0x0222CE48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	str r1, [sp, #0x14]
	add r4, r2, #0
	add r7, r3, #0
	bl InitWindow
	mov r1, #0xb
	str r1, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r5, #0
	mov r2, #3
	mov r3, #4
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x10
	bl InitWindow
	mov r0, #6
	str r0, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0xc1
	str r0, [sp, #0x10]
	add r1, r5, #0
	ldr r0, [r4]
	add r1, #0x10
	mov r2, #3
	mov r3, #9
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x20
	bl InitWindow
	mov r3, #0x15
	add r1, r5, #0
	str r3, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0xdd
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x20
	mov r2, #3
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x80
	add r1, r7, #0
	bl String_ctor
	add r6, r0, #0
	mov r0, #0x80
	add r1, r7, #0
	bl String_ctor
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #4]
	bl sub_0202C6F4
	bl sub_0202C08C
	bl DWC_CreateFriendKey
	str r1, [sp, #0x1c]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	mov r2, #0
	eor r0, r2
	ldr r2, [sp, #0x24]
	mov r1, #0
	eor r1, r2
	orr r0, r1
	ldr r0, [r4, #0x54]
	beq _0222CF86
	mov r1, #0x35
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	mov r1, #0xc0
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222CFFC ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	bl ov43_0222AAA4
	ldr r0, [r4, #0x54]
	ldr r2, [sp, #0x20]
	mov r1, #0x34
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	ldr r2, [sp, #0x20]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D000 ; =0x000F0200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x10
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	b _0222CFB4
_0222CF86:
	mov r1, #0x36
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	mov r1, #0xc0
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222CFFC ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0222CFB4:
	ldr r0, [r4, #0x54]
	mov r1, #0x33
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D004 ; =0x00010F00
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x20
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x20]
	bl String_dtor
	str r7, [sp]
	add r3, r5, #0
	ldr r0, [r4, #0x58]
	mov r1, #0xe
	mov r2, #1
	add r3, #0x34
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5, #0x30]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CFFC: .word 0x00010200
_0222D000: .word 0x000F0200
_0222D004: .word 0x00010F00
	thumb_func_end ov43_0222CE48

	thumb_func_start ov43_0222D008
ov43_0222D008: ; 0x0222D008
	push {r4, lr}
	add r4, r0, #0
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x10
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x20
	bl RemoveWindow
	ldr r0, [r4, #0x30]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov43_0222D008

	thumb_func_start ov43_0222D028
ov43_0222D028: ; 0x0222D028
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r1, #4]
	add r4, r2, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl BufferPlayersName
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x64
	mov r2, #0x32
	bl ov43_0222A9F4
	ldr r2, [r5, #0x34]
	mov r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl LoadRectToBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r5, #0x20
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222D028

	thumb_func_start ov43_0222D090
ov43_0222D090: ; 0x0222D090
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov43_0222AA70
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #2
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0x10
	bl ClearWindowTilemapAndScheduleTransfer
	add r5, #0x20
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222D090

	thumb_func_start ov43_0222D0F8
ov43_0222D0F8: ; 0x0222D0F8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, _0222D130 ; =_0222ED5C
	add r4, r1, #0
	ldrb r5, [r3, #1]
	ldrb r3, [r3, #2]
	add r1, sp, #0xc
	strb r5, [r1]
	strb r3, [r1, #1]
	mov r1, #0xe
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r0, sp, #0xc
	ldrb r0, [r0, r2]
	mov r1, #2
	mov r2, #0x11
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r3, #0x14
	bl BgTilemapRectChangePalette
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D130: .word _0222ED5C
	thumb_func_end ov43_0222D0F8

	thumb_func_start ov43_0222D134
ov43_0222D134: ; 0x0222D134
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	add r6, r2, #0
	add r7, r3, #0
	bl SavArray_Flags_get
	mov r1, #2
	mov r2, #0x1b
	bl ScriptState_FlypointFlagAction
	str r0, [r5, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov43_0222D584
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D134

	thumb_func_start ov43_0222D15C
ov43_0222D15C: ; 0x0222D15C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldrb r5, [r6, #8]
	add r4, r0, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r5, #6
	bhi _0222D220
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_0222D178: ; jump table
	.short _0222D186 - _0222D178 - 2 ; case 0
	.short _0222D18C - _0222D178 - 2 ; case 1
	.short _0222D19E - _0222D178 - 2 ; case 2
	.short _0222D1A6 - _0222D178 - 2 ; case 3
	.short _0222D1BC - _0222D178 - 2 ; case 4
	.short _0222D1CA - _0222D178 - 2 ; case 5
	.short _0222D20C - _0222D178 - 2 ; case 6
_0222D186:
	mov r0, #0
	strh r0, [r4, #0xe]
	strh r0, [r4]
_0222D18C:
	ldr r3, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov43_0222D654
	mov r0, #2
	strb r0, [r6, #8]
	b _0222D220
_0222D19E:
	bl ov43_0222D47C
	strb r0, [r6, #8]
	b _0222D220
_0222D1A6:
	bl ov43_0222D4C4
	ldr r3, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov43_0222D508
	mov r0, #4
	strb r0, [r6, #8]
	b _0222D220
_0222D1BC:
	bl ov43_0222D508
	cmp r0, #1
	bne _0222D220
	mov r0, #2
	strb r0, [r6, #8]
	b _0222D220
_0222D1CA:
	ldrh r0, [r4, #0xe]
	cmp r0, #0
	beq _0222D1DC
	ldrh r0, [r4, #0xc]
	sub r0, r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0222D220
_0222D1DC:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov43_0222DCC4
	cmp r0, #0
	beq _0222D206
	ldr r0, _0222D224 ; =0x000005E5
	bl PlaySE
	add r0, r4, #0
	add r1, r7, #0
	bl ov43_0222D87C
	add r0, r6, #0
	mov r1, #4
	mov r2, #1
	bl ov43_0222A318
	mov r0, #1
	strh r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0222D206:
	mov r0, #2
	strb r0, [r6, #8]
	b _0222D220
_0222D20C:
	add r1, r7, #0
	bl ov43_0222D778
	add r0, r6, #0
	mov r1, #1
	mov r2, #9
	bl ov43_0222A318
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222D220:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D224: .word 0x000005E5
	thumb_func_end ov43_0222D15C

	thumb_func_start ov43_0222D228
ov43_0222D228: ; 0x0222D228
	ldr r3, _0222D22C ; =ov43_0222D610
	bx r3
	.balign 4, 0
_0222D22C: .word ov43_0222D610
	thumb_func_end ov43_0222D228

	thumb_func_start ov43_0222D230
ov43_0222D230: ; 0x0222D230
	ldr r0, [r0, #0x10]
	cmp r0, #1
	bne _0222D23A
	mov r0, #8
	b _0222D23C
_0222D23A:
	mov r0, #3
_0222D23C:
	sub r0, r0, #1
	cmp r1, r0
	bne _0222D246
	mov r0, #1
	bx lr
_0222D246:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov43_0222D230

	thumb_func_start ov43_0222D24C
ov43_0222D24C: ; 0x0222D24C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r2, #0
	cmp r3, #5
	bhi _0222D2F2
	add r1, r3, r3
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222D262: ; jump table
	.short _0222D26E - _0222D262 - 2 ; case 0
	.short _0222D284 - _0222D262 - 2 ; case 1
	.short _0222D28E - _0222D262 - 2 ; case 2
	.short _0222D2AC - _0222D262 - 2 ; case 3
	.short _0222D2C8 - _0222D262 - 2 ; case 4
	.short _0222D2DE - _0222D262 - 2 ; case 5
_0222D26E:
	mov r1, #0
	ldrsh r1, [r4, r1]
	bl ov43_0222D230
	cmp r0, #0
	beq _0222D2F2
	ldr r0, _0222D2F8 ; =0x000005DD
	bl PlaySE
	mov r0, #6
	pop {r3, r4, r5, pc}
_0222D284:
	ldr r0, _0222D2F8 ; =0x000005DD
	bl PlaySE
	mov r0, #6
	pop {r3, r4, r5, pc}
_0222D28E:
	mov r2, #0
	ldrsh r2, [r4, r2]
	add r1, r5, #0
	bl ov43_0222DB28
	mov r2, #0
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	add r1, r5, #0
	bl ov43_0222DB94
	mov r0, #2
	str r0, [r4, #8]
	mov r0, #3
	pop {r3, r4, r5, pc}
_0222D2AC:
	mov r2, #0
	ldrsh r2, [r4, r2]
	add r1, r5, #0
	bl ov43_0222DB28
	mov r2, #0
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	add r1, r5, #0
	bl ov43_0222DB94
	mov r0, #3
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0222D2C8:
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #4
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov43_0222AD40
	mov r0, #5
	pop {r3, r4, r5, pc}
_0222D2DE:
	mov r2, #1
	str r2, [r4, #8]
	mov r0, #4
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #3
	bl ov43_0222AD40
	mov r0, #5
	pop {r3, r4, r5, pc}
_0222D2F2:
	mov r0, #2
	pop {r3, r4, r5, pc}
	nop
_0222D2F8: .word 0x000005DD
	thumb_func_end ov43_0222D24C

	thumb_func_start ov43_0222D2FC
ov43_0222D2FC: ; 0x0222D2FC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222D3B0 ; =gSystem
	add r4, r1, #0
	ldr r1, [r0, #0x48]
	ldr r0, _0222D3B4 ; =0x00000CF3
	add r6, r2, #0
	tst r0, r1
	beq _0222D312
	mov r0, #0
	str r0, [r4]
_0222D312:
	ldr r1, _0222D3B0 ; =gSystem
	mov r0, #3
	ldr r2, [r1, #0x48]
	tst r0, r2
	beq _0222D32A
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D32A:
	ldr r0, [r1, #0x4c]
	mov r2, #0x20
	add r1, r0, #0
	tst r1, r2
	bne _0222D340
	ldrb r1, [r4, #0xe]
	cmp r1, #0
	beq _0222D358
	lsl r2, r2, #4
	tst r2, r0
	beq _0222D358
_0222D340:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov43_0222ED18
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #2
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D358:
	mov r2, #0x10
	add r3, r0, #0
	tst r3, r2
	bne _0222D36A
	cmp r1, #0
	beq _0222D380
	add r2, #0xf0
	tst r0, r2
	beq _0222D380
_0222D36A:
	add r0, r5, #0
	mov r1, #1
	bl ov43_0222ED18
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #3
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D380:
	ldr r0, _0222D3B0 ; =gSystem
	ldr r1, [r0, #0x44]
	mov r0, #0x40
	tst r0, r1
	beq _0222D398
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #4
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D398:
	mov r0, #0x80
	tst r0, r1
	beq _0222D3AC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #5
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D3AC:
	mov r0, #2
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222D3B0: .word gSystem
_0222D3B4: .word 0x00000CF3
	thumb_func_end ov43_0222D2FC

	thumb_func_start ov43_0222D3B8
ov43_0222D3B8: ; 0x0222D3B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r7, r1, #0
	add r6, r3, #0
	str r2, [sp]
	cmp r0, #0
	beq _0222D3D0
	ldr r0, _0222D474 ; =ov43_0222EE84
	bl sub_0202529C
	b _0222D3D6
_0222D3D0:
	ldr r0, _0222D478 ; =ov43_0222EE42
	bl sub_0202529C
_0222D3D6:
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222D3E4
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222D3E4:
	cmp r4, #0
	bne _0222D3FA
	mov r0, #1
	str r0, [r6]
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #4
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D3FA:
	cmp r4, #1
	bne _0222D410
	mov r0, #1
	str r0, [r6]
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #5
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D410:
	sub r1, r4, #2
	lsl r1, r1, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	bl ov43_0222D230
	cmp r0, #0
	beq _0222D434
	sub r0, r4, #2
	strh r0, [r5]
	mov r3, #1
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	str r3, [r6]
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D434:
	mov r0, #0
	ldrsh r0, [r5, r0]
	sub r1, r4, #2
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	bne _0222D446
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222D446:
	mov r0, #1
	str r0, [r6]
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222ED18
	cmp r4, #0
	blt _0222D464
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #3
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D464:
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #2
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D474: .word ov43_0222EE84
_0222D478: .word ov43_0222EE42
	thumb_func_end ov43_0222D3B8

	thumb_func_start ov43_0222D47C
ov43_0222D47C: ; 0x0222D47C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	ldr r1, _0222D4C0 ; =gSystem
	add r6, r2, #0
	ldr r2, [r1, #0x44]
	add r5, r0, #0
	mov r0, #0
	mov r1, #0xc0
	str r0, [sp]
	tst r1, r2
	bne _0222D496
	strh r0, [r5, #0xe]
_0222D496:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, sp, #0
	bl ov43_0222D3B8
	ldr r1, [sp]
	cmp r1, #0
	beq _0222D4B0
	mov r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_0222D4B0:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov43_0222D2FC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0222D4C0: .word gSystem
	thumb_func_end ov43_0222D47C

	thumb_func_start ov43_0222D4C4
ov43_0222D4C4: ; 0x0222D4C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r0, #0
	add r4, r2, #0
	mov r1, #0
	str r1, [r5, #4]
	add r0, r4, #0
	add r6, r3, #0
	bl ov43_0222AD20
	ldr r0, [r5, #8]
	cmp r0, #2
	bne _0222D4E4
	mov r3, #2
	b _0222D4E6
_0222D4E4:
	mov r3, #1
_0222D4E6:
	mov r0, #0
	ldrsh r0, [r5, r0]
	add r1, r7, #0
	add r2, r4, #0
	str r0, [sp]
	add r0, r5, #0
	str r6, [sp, #4]
	bl ov43_0222DAE8
	ldr r0, _0222D504 ; =0x000005E1
	bl PlaySE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D504: .word 0x000005E1
	thumb_func_end ov43_0222D4C4

	thumb_func_start ov43_0222D508
ov43_0222D508: ; 0x0222D508
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #4
	ble _0222D55C
	mov r2, #0
	ldr r0, [r4]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r4]
	mov r1, #3
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r3, #0
	ldrsh r0, [r5, r3]
	add r1, r7, #0
	add r2, r4, #0
	str r0, [sp]
	add r0, r5, #0
	str r6, [sp, #4]
	bl ov43_0222DAE8
	add r0, r4, #0
	mov r1, #1
	bl ov43_0222AD20
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xff
	bl ov43_0222DB94
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222D55C:
	lsl r1, r0, #8
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r3, r0, #2
	ldr r0, [r5, #8]
	cmp r0, #2
	bne _0222D56E
	neg r3, r3
_0222D56E:
	ldr r0, [r4]
	mov r1, #3
	mov r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D508

	thumb_func_start ov43_0222D584
ov43_0222D584: ; 0x0222D584
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	str r2, [sp, #8]
	add r1, r2, #0
	add r0, #0xf8
	add r2, r3, #0
	str r3, [sp, #0xc]
	bl ov43_0222DD40
	ldr r1, [sp, #8]
	add r0, r7, #0
	bl ov43_0222DDA0
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0222D600 ; =ov43_0222EDAC
	add r7, #0x14
	str r0, [sp, #0x14]
	ldr r0, _0222D604 ; =ov43_0222EE08
	str r0, [sp, #0x10]
_0222D5AE:
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x14]
	str r0, [sp]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r3, [r3]
	add r0, r7, #0
	bl ov43_0222DDF0
	ldr r4, _0222D608 ; =ov43_0222F10C
	ldr r5, _0222D60C ; =ov43_0222F0D0
	mov r6, #0
_0222D5C6:
	ldr r0, [r4]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	str r0, [sp, #4]
	ldrb r3, [r5]
	add r0, r7, #0
	bl ov43_0222DE14
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #1
	cmp r6, #8
	blt _0222D5C6
	ldr r0, [sp, #0x14]
	add r7, #0x4c
	add r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, r0, #6
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _0222D5AE
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D600: .word ov43_0222EDAC
_0222D604: .word ov43_0222EE08
_0222D608: .word ov43_0222F10C
_0222D60C: .word ov43_0222F0D0
	thumb_func_end ov43_0222D584

	thumb_func_start ov43_0222D610
ov43_0222D610: ; 0x0222D610
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r6, #0
	add r5, r0, #0
	str r0, [sp]
	str r2, [sp, #4]
	add r5, #0x14
	add r7, r6, #0
_0222D620:
	add r4, r7, #0
_0222D622:
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222DED0
	add r4, r4, #1
	cmp r4, #8
	blt _0222D622
	add r0, r5, #0
	bl ov43_0222DE10
	add r6, r6, #1
	add r5, #0x4c
	cmp r6, #3
	blt _0222D620
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov43_0222DDD0
	ldr r0, [sp]
	add r0, #0xf8
	str r0, [sp]
	bl ov43_0222DD88
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D610

	thumb_func_start ov43_0222D654
ov43_0222D654: ; 0x0222D654
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r4, r2, #0
	mov r2, #0xb
	ldrsb r2, [r6, r2]
	add r5, r0, #0
	ldr r1, [r6, #4]
	add r2, r6, r2
	ldrb r2, [r2, #0x18]
	add r0, r4, #0
	add r7, r3, #0
	bl ov43_0222AB20
	mov r1, #0x4a
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r5, r1
	mov r2, #0xd
	bl ov43_0222A9F4
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	mov r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	mov r1, #5
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl LoadRectToBgTilemapRect
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	add r0, #0xfc
	mov r1, #0
	ldr r2, [r0]
	add r3, r1, #0
	str r1, [sp]
	ldrh r0, [r2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl LoadRectToBgTilemapRect
	ldr r0, [r4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	mov r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl LoadRectToBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov43_0222D8B8
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov43_0222AD98
	mov r3, #0
	ldrsh r0, [r5, r3]
	add r1, r6, #0
	add r2, r4, #0
	str r0, [sp]
	add r0, r5, #0
	str r7, [sp, #4]
	bl ov43_0222DAE8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xff
	bl ov43_0222DB94
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xf4
	mov r2, #0x18
	bl sub_0200DD88
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl ov43_0222AD40
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xf4
	mov r2, #0x88
	bl sub_0200DD88
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov43_0222AD40
	add r0, r4, #0
	mov r1, #1
	bl ov43_0222AD00
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D654

	thumb_func_start ov43_0222D778
ov43_0222D778: ; 0x0222D778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov43_0222AD00
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #8
	mov r2, #0x62
	bl sub_0200DD88
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov43_0222AD40
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xf8
	mov r2, #0x62
	bl sub_0200DD88
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov43_0222AD40
	add r4, r7, #0
	mov r6, #0
	add r4, #0x14
_0222D7BE:
	add r0, r4, #0
	add r1, r5, #0
	bl ov43_0222DF90
	add r6, r6, #1
	add r4, #0x4c
	cmp r6, #3
	blt _0222D7BE
	add r0, r7, #0
	add r1, r5, #0
	bl ov43_0222DC7C
	add r0, r7, #0
	add r1, r5, #0
	bl ov43_0222DB84
	add r0, r7, #0
	bl ov43_0222DACC
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #5
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #4
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #2
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r5]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x43
	lsl r0, r0, #2
	mov r1, #0
	ldr r2, [r7, r0]
	add r3, r1, #0
	str r1, [sp]
	ldrh r0, [r2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5]
	bl LoadRectToBgTilemapRect
	ldr r0, [r5]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl ov43_0222AA70
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D778

	thumb_func_start ov43_0222D87C
ov43_0222D87C: ; 0x0222D87C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	add r6, r1, #0
	mov r4, #0
	add r5, #0x14
_0222D888:
	add r0, r5, #0
	add r1, r6, #0
	bl ov43_0222DF90
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #3
	blt _0222D888
	mov r0, #0x46
	lsl r0, r0, #2
	mov r5, #0
	add r4, r7, r0
_0222D8A0:
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #5
	ble _0222D8A0
	add r0, r6, #0
	bl ov43_0222AA70
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222D87C

	thumb_func_start ov43_0222D8B8
ov43_0222D8B8: ; 0x0222D8B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #4]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl sub_0202C6F4
	mov r1, #0xb
	ldrsb r1, [r5, r1]
	mov r2, #8
	str r0, [sp, #0x24]
	add r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl sub_0202C090
	str r0, [sp, #0x20]
	mov r0, #0x46
	lsl r0, r0, #2
	mov r6, #0
	add r4, r7, r0
_0222D8E4:
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #8
	blo _0222D8E4
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	mov r3, #2
	add r2, r5, r2
	add r2, #0x38
	ldrb r2, [r2]
	ldr r0, [r0, #0x50]
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r2, [r5, #0x14]
	ldr r0, [r0, #0x50]
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC0 ; =0x000F0200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0x46
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r5, #0
	mov r3, #0x12
	bl ov43_0222ECD4
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0222D94A
	ldr r4, _0222DAC4 ; =0x00050600
	b _0222D956
_0222D94A:
	cmp r0, #1
	bne _0222D954
	mov r4, #0xc1
	lsl r4, r4, #0xa
	b _0222D956
_0222D954:
	ldr r4, _0222DAC8 ; =0x00010200
_0222D956:
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	ldr r1, [r5, #4]
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	ldr r3, [sp, #0x1c]
	bl ov43_0222AB20
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r2, [sp, #0x18]
	add r0, r7, r0
	add r1, r5, #0
	mov r3, #0x11
	str r4, [sp, #8]
	bl ov43_0222ECD4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC0 ; =0x000F0200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r5, #0
	mov r3, #0xf
	bl ov43_0222ECD4
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	ldr r1, [r5, #4]
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	ldr r3, [sp, #0x1c]
	bl ov43_0222AB5C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC8 ; =0x00010200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0x52
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r5, #0
	mov r3, #0x10
	bl ov43_0222ECD4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC0 ; =0x000F0200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0x62
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r5, #0
	mov r3, #0x1b
	bl ov43_0222ECD4
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	ldr r1, [r5, #4]
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl ov43_0222AB94
	cmp r0, #0
	beq _0222DA0E
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC8 ; =0x00010200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0x56
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r5, #0
	mov r3, #0x1c
	bl ov43_0222ECD4
_0222DA0E:
	mov r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x24]
	mov r2, #7
	add r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl sub_0202C090
	add r1, r0, #0
	ldr r0, [sp, #0x20]
	mov r2, #1
	bl sub_0205B46C
	mov r1, #2
	add r2, sp, #0x28
	bl sub_02070D84
	mov r1, #0x32
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #6
	bl AllocFromHeap
	mov r3, #0
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x1c]
	bl sub_020141C4
	mov r0, #0x50
	str r0, [sp]
	mov r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #0x5a
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r4, #0
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	mov r3, #0x1e
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x30]
	mov r2, #4
	lsl r3, r3, #4
	bl GfGfxLoader_GXLoadPal
	mov r1, #4
	mov r0, #0xa
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xf
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r2, r1, #0
	ldr r0, [r0]
	add r3, r1, #0
	bl BgTilemapRectChangePalette
	mov r0, #0x46
	lsl r0, r0, #2
	mov r4, #0
	add r5, r7, r0
_0222DAAC:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blo _0222DAAC
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DAC0: .word 0x000F0200
_0222DAC4: .word 0x00050600
_0222DAC8: .word 0x00010200
	thumb_func_end ov43_0222D8B8

	thumb_func_start ov43_0222DACC
ov43_0222DACC: ; 0x0222DACC
	push {r3, r4, r5, lr}
	mov r1, #0x46
	lsl r1, r1, #2
	mov r4, #0
	add r5, r0, r1
_0222DAD6:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _0222DAD6
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222DACC

	thumb_func_start ov43_0222DAE8
ov43_0222DAE8: ; 0x0222DAE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bne _0222DB00
	ldr r2, [sp, #0x20]
	add r1, r4, #0
	strh r2, [r5]
	bl ov43_0222DB28
_0222DB00:
	mov r0, #1
	lsl r0, r0, #8
	add r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	add r5, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	mov r0, #0x4c
	mul r0, r6
	add r0, r5, r0
	add r1, r7, #0
	add r2, r4, #0
	bl ov43_0222DF4C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222DAE8

	thumb_func_start ov43_0222DB28
ov43_0222DB28: ; 0x0222DB28
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	add r5, r1, #0
	cmp r0, #1
	bne _0222DB4A
	lsl r1, r2, #5
	mov r0, #0x7f
	lsl r0, r0, #2
	add r1, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0xb0
	mov r4, #2
	bl sub_0200DD88
	b _0222DB78
_0222DB4A:
	cmp r2, #2
	bne _0222DB60
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xf0
	mov r2, #0xb0
	mov r4, #2
	bl sub_0200DD88
	b _0222DB78
_0222DB60:
	mov r1, #0x70
	mul r1, r2
	mov r0, #0x7f
	lsl r0, r0, #2
	add r1, #0x38
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0xb0
	mov r4, #1
	bl sub_0200DD88
_0222DB78:
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl ov43_0222AD74
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222DB28

	thumb_func_start ov43_0222DB84
ov43_0222DB84: ; 0x0222DB84
	ldr r3, _0222DB90 ; =ov43_0222AD74
	add r0, r1, #0
	mov r1, #0
	mov r2, #0xff
	bx r3
	nop
_0222DB90: .word ov43_0222AD74
	thumb_func_end ov43_0222DB84

	thumb_func_start ov43_0222DB94
ov43_0222DB94: ; 0x0222DB94
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r6, r0, #0
	ldr r0, [r6, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #1
	bne _0222DBDC
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r1, #0xc
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r3, #0x14
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl CopyToBgTilemapRect
	b _0222DC10
_0222DBDC:
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #0x14
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl CopyToBgTilemapRect
_0222DC10:
	cmp r4, #0xff
	bne _0222DC20
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
_0222DC20:
	mov r0, #0x83
	ldr r1, [r6, #0x10]
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	ldr r2, _0222DC70 ; =ov43_0222EDB8
	lsl r0, r1, #3
	add r2, r2, r0
	ldr r6, _0222DC74 ; =ov43_0222EDF8
	ldrb r2, [r4, r2]
	add r0, r6, r0
	ldrb r0, [r4, r0]
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r3, #0
	add r0, #0xc
	str r0, [sp, #8]
	ldr r0, _0222DC78 ; =ov43_0222F0C4
	str r2, [sp, #0xc]
	ldrb r0, [r0, r1]
	mov r1, #2
	str r0, [sp, #0x10]
	ldrh r0, [r3]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r3, #2]
	mov r3, #0x14
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl CopyToBgTilemapRect
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222DC70: .word ov43_0222EDB8
_0222DC74: .word ov43_0222EDF8
_0222DC78: .word ov43_0222F0C4
	thumb_func_end ov43_0222DB94

	thumb_func_start ov43_0222DC7C
ov43_0222DC7C: ; 0x0222DC7C
	push {r3, r4, lr}
	sub sp, #0x1c
	mov r0, #0x83
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r1, #0x1c
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r3, #0x14
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov43_0222DC7C

	thumb_func_start ov43_0222DCC4
ov43_0222DCC4: ; 0x0222DCC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r7, r1, #0
	bl sub_0202C6F4
	add r6, r0, #0
	mov r0, #0xb
	ldrsb r4, [r5, r0]
	cmp r7, #0
	bne _0222DD0A
	ldr r1, [r5, #0x10]
	mov r7, #0
	sub r0, r1, #1
	beq _0222DD3A
_0222DCE2:
	sub r4, r4, #1
	bpl _0222DCE8
	add r4, r4, r1
_0222DCE8:
	add r1, r5, r4
	ldrb r1, [r1, #0x18]
	add r0, r6, #0
	mov r2, #8
	bl sub_0202C090
	cmp r0, #2
	beq _0222DCFE
	strb r4, [r5, #0xb]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222DCFE:
	ldr r1, [r5, #0x10]
	add r7, r7, #1
	sub r0, r1, #1
	cmp r7, r0
	blo _0222DCE2
	b _0222DD3A
_0222DD0A:
	ldr r1, [r5, #0x10]
	mov r7, #0
	sub r0, r1, #1
	beq _0222DD3A
_0222DD12:
	add r0, r4, #1
	bl _u32_div_f
	add r4, r1, #0
	add r1, r5, r4
	ldrb r1, [r1, #0x18]
	add r0, r6, #0
	mov r2, #8
	bl sub_0202C090
	cmp r0, #2
	beq _0222DD30
	strb r4, [r5, #0xb]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222DD30:
	ldr r1, [r5, #0x10]
	add r7, r7, #1
	sub r0, r1, #1
	cmp r7, r0
	blo _0222DD12
_0222DD3A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222DCC4

	thumb_func_start ov43_0222DD40
ov43_0222DD40: ; 0x0222DD40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	ldr r1, _0222DD84 ; =_0222ED5C
	str r2, [sp, #4]
	ldrh r2, [r1, #0x2e]
	add r5, r0, #0
	add r0, sp, #8
	strh r2, [r0]
	ldrh r2, [r1, #0x30]
	add r4, sp, #8
	mov r6, #0
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x32]
	ldrh r1, [r1, #0x34]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
_0222DD62:
	ldr r0, [sp, #4]
	mov r2, #1
	str r0, [sp]
	ldrh r1, [r4]
	ldr r0, [r7, #0x58]
	add r3, r5, #4
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5]
	add r6, r6, #1
	add r5, #8
	add r4, r4, #2
	cmp r6, #4
	blt _0222DD62
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DD84: .word _0222ED5C
	thumb_func_end ov43_0222DD40

	thumb_func_start ov43_0222DD88
ov43_0222DD88: ; 0x0222DD88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0222DD8E:
	ldr r0, [r5]
	bl FreeToHeap
	add r4, r4, #1
	add r5, #8
	cmp r4, #4
	blt _0222DD8E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222DD88

	thumb_func_start ov43_0222DDA0
ov43_0222DDA0: ; 0x0222DDA0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r4, _0222DDCC ; =ov43_0222EF20
	mov r6, #0
	add r5, r0, r1
_0222DDAE:
	ldr r0, [r7]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #8
	blt _0222DDAE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222DDCC: .word ov43_0222EF20
	thumb_func_end ov43_0222DDA0

	thumb_func_start ov43_0222DDD0
ov43_0222DDD0: ; 0x0222DDD0
	push {r3, r4, r5, lr}
	mov r1, #0x46
	lsl r1, r1, #2
	mov r4, #0
	add r5, r0, r1
_0222DDDA:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _0222DDDA
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222DDD0

	thumb_func_start ov43_0222DDF0
ov43_0222DDF0: ; 0x0222DDF0
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r1, [r2, #2]
	strh r1, [r0, #2]
	ldrh r1, [r2, #4]
	mov r2, #0
	strh r1, [r0, #4]
	str r3, [r0, #8]
	add r1, r2, #0
_0222DE02:
	str r1, [r0, #0xc]
	str r1, [r0, #0x2c]
	add r2, r2, #1
	add r0, r0, #4
	cmp r2, #8
	blt _0222DE02
	bx lr
	thumb_func_end ov43_0222DDF0

	thumb_func_start ov43_0222DE10
ov43_0222DE10: ; 0x0222DE10
	bx lr
	.balign 4, 0
	thumb_func_end ov43_0222DE10

	thumb_func_start ov43_0222DE14
ov43_0222DE14: ; 0x0222DE14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r1, [sp, #0x18]
	add r1, r3, #0
	str r0, [sp, #0x14]
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x44]
	lsr r1, r1, #0x18
	str r3, [sp, #0x1c]
	lsl r4, r2, #2
	bl AllocWindows
	ldr r1, [sp, #0x14]
	add r7, r1, r4
	str r0, [r7, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r7, #0x2c]
	add r0, r1, #0
	ldr r0, [r0, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bls _0222DECA
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x40]
_0222DE4E:
	ldr r0, [r7, #0xc]
	add r0, r0, r4
	bl InitWindow
	ldr r1, [sp, #0x14]
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _0222DE62
	neg r0, r0
_0222DE62:
	ldr r2, [sp, #0x14]
	mov r1, #0
	ldrsh r6, [r2, r1]
	cmp r6, #0
	bge _0222DE6E
	neg r6, r6
_0222DE6E:
	ldrb r1, [r5, #1]
	mov r2, #3
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	ldrb r3, [r5]
	ldr r0, [sp, #0x18]
	ldr r1, [r7, #0xc]
	add r3, r3, r6
	lsl r3, r3, #0x18
	ldr r0, [r0]
	add r1, r1, r4
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [r7, #0xc]
	mov r1, #0
	add r0, r0, r4
	bl FillWindowPixelBuffer
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	add r4, #0x10
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x20]
	add r5, r5, #4
	add r0, r0, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	add r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0x24]
	cmp r1, r0
	blo _0222DE4E
_0222DECA:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222DE14

	thumb_func_start ov43_0222DED0
ov43_0222DED0: ; 0x0222DED0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	lsl r4, r1, #2
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0222DEF4
	add r6, r5, #0
	add r6, #0x2c
	ldr r1, [r6, r4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl WindowArray_dtor
	mov r1, #0
	add r0, r5, r4
	str r1, [r0, #0xc]
	str r1, [r6, r4]
_0222DEF4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov43_0222DED0

	thumb_func_start ov43_0222DEF8
ov43_0222DEF8: ; 0x0222DEF8
	push {r4, r5, r6, lr}
	lsl r1, r1, #2
	add r5, r0, r1
	ldr r0, [r5, #0x2c]
	mov r6, #0
	cmp r0, #0
	bls _0222DF1A
	add r4, r6, #0
_0222DF08:
	ldr r0, [r5, #0xc]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	ldr r0, [r5, #0x2c]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blo _0222DF08
_0222DF1A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222DEF8

	thumb_func_start ov43_0222DF1C
ov43_0222DF1C: ; 0x0222DF1C
	push {r3, r4, r5, r6, r7, lr}
	lsl r1, r1, #2
	add r5, r0, r1
	ldr r0, [r5, #0x2c]
	mov r6, #0
	cmp r0, #0
	bls _0222DF4A
	add r4, r6, #0
	add r7, r6, #0
_0222DF2E:
	ldr r0, [r5, #0xc]
	add r0, r0, r4
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	add r0, r0, r4
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x2c]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blo _0222DF2E
_0222DF4A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222DF1C

	thumb_func_start ov43_0222DF4C
ov43_0222DF4C: ; 0x0222DF4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r7, r1, #0
	add r1, r5, #0
	add r6, r0, #0
	add r4, r3, #0
	bl ov43_0222DF90
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0222DF74
	add r2, r5, #0
	lsl r5, r4, #2
	ldr r4, _0222DF88 ; =ov43_0222F12C
	ldr r3, [sp, #0x20]
	ldr r4, [r4, r5]
	add r0, r6, #0
	add r1, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
_0222DF74:
	add r2, r5, #0
	lsl r5, r4, #2
	ldr r4, _0222DF8C ; =_0222F0E0
	ldr r3, [sp, #0x20]
	ldr r4, [r4, r5]
	add r0, r6, #0
	add r1, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DF88: .word ov43_0222F12C
_0222DF8C: .word _0222F0E0
	thumb_func_end ov43_0222DF4C

	thumb_func_start ov43_0222DF90
ov43_0222DF90: ; 0x0222DF90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0222DF98:
	add r0, r5, #0
	add r1, r4, #0
	bl ov43_0222DF1C
	add r4, r4, #1
	cmp r4, #8
	blt _0222DF98
	add r0, r6, #0
	add r1, r5, #0
	bl ov43_0222EC14
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222DF90

	thumb_func_start ov43_0222DFB0
ov43_0222DFB0: ; 0x0222DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	add r4, r2, #0
	bl sub_0202C6F4
	str r0, [sp, #0x28]
	mov r1, #0
	str r4, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, _0222E0E4 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	add r2, r1, #0
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r3, r5, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x1c]
	bl ov43_0222EC58
	mov r6, #0
	str r6, [sp, #0x24]
_0222DFEE:
	ldr r0, [sp, #0x24]
	str r4, [sp]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r6, #0
	add r0, #0x14
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _0222E0E4 ; =0x00010200
	str r7, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	mov r1, #0
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r2, #2
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	bl ov43_0222EC58
	mov r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x28]
	add r2, r6, #1
	add r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl sub_0202C090
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x16
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _0222E0E4 ; =0x00010200
	str r7, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	mov r1, #0
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r2, #2
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x24]
	add r6, r6, #1
	add r0, #0x18
	str r0, [sp, #0x24]
	cmp r6, #2
	blo _0222DFEE
	str r4, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E0E4 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	mov r2, #1
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r3, r5, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x1c]
	bl ov43_0222EC58
	mov r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x28]
	mov r2, #3
	add r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl sub_0202C090
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E0E4 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	add r4, #0x80
	str r0, [sp, #0x14]
	ldr r0, [r4]
	mov r2, #3
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r1, [sp, #0x1c]
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	mov r1, #0
	bl ov43_0222DEF8
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E0E4: .word 0x00010200
	thumb_func_end ov43_0222DFB0

	thumb_func_start ov43_0222E0E8
ov43_0222E0E8: ; 0x0222E0E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #4]
	add r4, r2, #0
	bl sub_0203107C
	add r7, r0, #0
	str r4, [sp]
	mov r0, #0x1d
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E21C ; =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r3, r5, #0
	str r0, [sp, #0x18]
	add r0, r6, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	add r0, r7, #0
	mov r1, #0x64
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	str r4, [sp]
	add r0, #0x22
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r1, _0222E21C ; =0x00010200
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r4, #0x7c]
	mov r2, #1
	str r1, [sp, #0x14]
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	add r3, r5, #0
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r0, r6, #0
	mov r1, #2
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	add r0, r7, #0
	mov r1, #0x71
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E21C ; =0x00010200
	mov r2, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r3, r5, #0
	str r0, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r0, r6, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #0x18
	str r1, [sp, #0xc]
	ldr r1, _0222E21C ; =0x00010200
	mov r2, #1
	str r1, [sp, #0x10]
	ldr r1, [r4, #0x7c]
	add r3, r5, #0
	str r1, [sp, #0x14]
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r0, r6, #0
	mov r1, #2
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	add r0, r7, #0
	mov r1, #0x70
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222E21C ; =0x00010200
	mov r2, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	add r4, #0x80
	str r0, [sp, #0x14]
	ldr r0, [r4]
	mov r1, #2
	str r0, [sp, #0x18]
	add r0, r6, #0
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	add r0, r6, #0
	mov r1, #2
	bl ov43_0222DEF8
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E21C: .word 0x00010200
	thumb_func_end ov43_0222E0E8

	thumb_func_start ov43_0222E220
ov43_0222E220: ; 0x0222E220
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	add r6, r3, #0
	add r4, r2, #0
	bl sub_0203107C
	str r0, [sp, #0x24]
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	add r6, r0, #0
	str r4, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E5B0 ; =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r2, [sp, #0x1c]
	mov r1, #3
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x26
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	mov r2, #1
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x28
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #2
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #1
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x66
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	cmp r0, #0
	bne _0222E2C8
	mov r0, #0x22
	b _0222E2CA
_0222E2C8:
	mov r0, #0x23
_0222E2CA:
	str r4, [sp]
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	mov r2, #2
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x73
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #2
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x75
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2b
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	mov r2, #2
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r2, #2
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x72
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #2
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x74
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2b
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r2, #2
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x27
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	mov r1, #3
	ldr r0, [sp, #0x20]
	add r2, r1, #0
	add r3, r5, #0
	bl ov43_0222EC58
	mov r1, #3
	str r4, [sp]
	mov r0, #0x28
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	add r2, r1, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #2
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x68
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	cmp r0, #0
	bne _0222E460
	mov r0, #0x22
	b _0222E462
_0222E460:
	mov r0, #0x23
_0222E462:
	str r4, [sp]
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	mov r2, #4
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x77
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #4
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x79
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2b
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 ; =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	mov r2, #4
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r2, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x76
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #4
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x78
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2b
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 ; =0x00010200
	mov r2, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, #3
	add r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	mov r1, #3
	bl ov43_0222DEF8
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E5B0: .word 0x00010200
	thumb_func_end ov43_0222E220

	thumb_func_start ov43_0222E5B4
ov43_0222E5B4: ; 0x0222E5B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	add r6, r3, #0
	add r4, r2, #0
	bl sub_0203107C
	str r0, [sp, #0x24]
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	add r6, r0, #0
	str r4, [sp]
	mov r0, #0x1f
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E788 ; =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r2, [sp, #0x1c]
	mov r1, #4
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x29
	str r0, [sp, #4]
	mov r0, #0x68
	str r0, [sp, #8]
	mov r0, #0x14
	str r0, [sp, #0xc]
	ldr r0, _0222E788 ; =0x00010200
	mov r2, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #4
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x6c
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	cmp r0, #0
	bne _0222E638
	mov r0, #0x22
	b _0222E63A
_0222E638:
	mov r0, #0x23
_0222E63A:
	str r4, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E788 ; =0x00010200
	mov r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x87
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2d
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E788 ; =0x00010200
	mov r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x88
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2c
	str r0, [sp, #4]
	mov r0, #0xa8
	str r0, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E788 ; =0x00010200
	mov r2, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r2, [sp, #0x1c]
	mov r1, #4
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E788 ; =0x00010200
	mov r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x86
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2d
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E788 ; =0x00010200
	mov r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r3, r5, #0
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x8a
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2c
	str r0, [sp, #4]
	mov r0, #0xa8
	str r0, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E788 ; =0x00010200
	mov r2, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #4
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	mov r1, #4
	bl ov43_0222DEF8
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E788: .word 0x00010200
	thumb_func_end ov43_0222E5B4

	thumb_func_start ov43_0222E78C
ov43_0222E78C: ; 0x0222E78C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	str r3, [sp, #0x24]
	add r4, r2, #0
	bl sub_0203107C
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x24]
	mov r0, #0x80
	bl String_ctor
	add r7, r0, #0
	ldr r1, [sp, #0x24]
	mov r0, #0x80
	bl String_ctor
	add r6, r0, #0
	str r4, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E900 ; =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #5
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	mov r1, #0x7c
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	ldr r1, [sp, #0x24]
	bl GetSpeciesName
	str r0, [sp, #0x2c]
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E900 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	str r1, [sp, #0xc]
	ldr r0, [r0, #0x20]
	ldr r2, [sp, #0x2c]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x2c]
	bl String_dtor
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	mov r1, #0x6a
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	cmp r0, #0
	bne _0222E826
	mov r0, #0x22
	b _0222E828
_0222E826:
	mov r0, #0x23
_0222E828:
	str r4, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E900 ; =0x00010200
	mov r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	mov r1, #0x7b
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E900 ; =0x00010200
	mov r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E900 ; =0x00010200
	mov r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	mov r1, #0x7a
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E900 ; =0x00010200
	mov r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	mov r1, #5
	bl ov43_0222DEF8
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E900: .word 0x00010200
	thumb_func_end ov43_0222E78C

	thumb_func_start ov43_0222E904
ov43_0222E904: ; 0x0222E904
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	add r6, r3, #0
	add r4, r2, #0
	bl sub_0203107C
	str r0, [sp, #0x24]
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x80
	add r1, r6, #0
	bl String_ctor
	add r6, r0, #0
	str r4, [sp]
	mov r0, #0x21
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, _0222EA3C ; =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #6
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x6e
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	cmp r0, #0
	bne _0222E964
	mov r0, #0x22
	b _0222E966
_0222E964:
	mov r0, #0x23
_0222E966:
	str r4, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C ; =0x00010200
	mov r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x8f
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2e
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C ; =0x00010200
	mov r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C ; =0x00010200
	mov r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	mov r1, #0x8e
	add r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl sub_020310BC
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x2e
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C ; =0x00010200
	mov r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	mov r1, #6
	bl ov43_0222DEF8
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EA3C: .word 0x00010200
	thumb_func_end ov43_0222E904

	thumb_func_start ov43_0222EA40
ov43_0222EA40: ; 0x0222EA40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	add r4, r2, #0
	add r7, r3, #0
	bl sub_0203107C
	ldr r0, [r5, #4]
	bl sub_0202C6F4
	str r0, [sp, #0x24]
	mov r0, #0x80
	add r1, r7, #0
	bl String_ctor
	add r6, r0, #0
	mov r0, #0x80
	add r1, r7, #0
	bl String_ctor
	add r7, r0, #0
	str r4, [sp]
	mov r0, #0x2f
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, _0222EBD4 ; =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #1
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	add r0, r4, #0
	mov r1, #0
	bl ov43_0222AC18
	str r4, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 ; =0x00010200
	mov r1, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x24]
	mov r2, #0xa
	add r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl sub_0202C090
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x31
	str r0, [sp, #4]
	mov r0, #0x78
	str r0, [sp, #8]
	mov r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 ; =0x00010200
	mov r2, #0
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #1
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	add r0, r4, #0
	mov r1, #1
	bl ov43_0222AC18
	str r4, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 ; =0x00010200
	mov r1, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r2, #0xb
	ldrsb r1, [r5, r2]
	ldr r0, [sp, #0x24]
	add r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl sub_0202C090
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x31
	str r0, [sp, #4]
	mov r0, #0x78
	str r0, [sp, #8]
	mov r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 ; =0x00010200
	mov r2, #0
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #1
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	add r0, r4, #0
	mov r1, #2
	bl ov43_0222AC18
	str r4, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 ; =0x00010200
	mov r1, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	mov r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x24]
	mov r2, #0xc
	add r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl sub_0202C090
	add r1, r0, #0
	add r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	mov r0, #0x31
	str r0, [sp, #4]
	mov r0, #0x78
	str r0, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 ; =0x00010200
	mov r2, #0
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	mov r1, #1
	add r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	mov r1, #1
	bl ov43_0222DEF8
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EBD4: .word 0x00010200
	thumb_func_end ov43_0222EA40

	thumb_func_start ov43_0222EBD8
ov43_0222EBD8: ; 0x0222EBD8
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r3, r1, #0
	str r2, [sp]
	mov r1, #0xe
	str r1, [sp, #4]
	mov r4, #0
	str r4, [sp, #8]
	ldr r1, _0222EC10 ; =0x00010200
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r2, #0x7c]
	add r2, #0x80
	str r1, [sp, #0x14]
	ldr r1, [r2]
	add r5, r0, #0
	str r1, [sp, #0x18]
	mov r1, #7
	add r2, r4, #0
	str r4, [sp, #0x1c]
	bl ov43_0222EC58
	add r0, r5, #0
	mov r1, #7
	bl ov43_0222DEF8
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222EC10: .word 0x00010200
	thumb_func_end ov43_0222EBD8

	thumb_func_start ov43_0222EC14
ov43_0222EC14: ; 0x0222EC14
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #2
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _0222EC24
	neg r2, r2
_0222EC24:
	mov r0, #0
	ldrsh r3, [r1, r0]
	cmp r3, #0
	bge _0222EC2E
	neg r3, r3
_0222EC2E:
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	lsl r3, r3, #0x18
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #3
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov43_0222EC14

	thumb_func_start ov43_0222EC58
ov43_0222EC58: ; 0x0222EC58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r6, [sp, #0x30]
	add r7, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x48]
	ldr r4, [sp, #0x44]
	ldr r5, [sp, #0x38]
	bl ReadMsgDataIntoString
	ldr r0, [r6, #0x50]
	ldr r2, [sp, #0x48]
	add r1, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x4c]
	cmp r0, #1
	beq _0222EC88
	cmp r0, #2
	beq _0222EC9A
	b _0222ECA6
_0222EC88:
	mov r0, #1
	add r1, r4, #0
	mov r2, #0
	bl FontID_String_GetWidth
	add r0, r0, #1
	lsr r0, r0, #1
	sub r5, r5, r0
	b _0222ECA6
_0222EC9A:
	mov r0, #1
	add r1, r4, #0
	mov r2, #0
	bl FontID_String_GetWidth
	sub r5, r5, r0
_0222ECA6:
	ldr r0, [sp, #0x3c]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	add r3, r5, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	lsl r0, r0, #2
	add r0, r7, r0
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #0x14]
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #1
	bl AddTextPrinterParameterized2
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov43_0222EC58

	thumb_func_start ov43_0222ECD4
ov43_0222ECD4: ; 0x0222ECD4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r2, #0
	add r2, #0x80
	add r5, r0, #0
	ldr r0, [r4, #0x54]
	ldr r2, [r2]
	add r1, r3, #0
	bl ReadMsgDataIntoString
	add r2, r4, #0
	add r2, #0x80
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x7c]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	mov r1, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x7c]
	add r0, r5, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov43_0222ECD4

	thumb_func_start ov43_0222ED18
ov43_0222ED18: ; 0x0222ED18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _0222ED26
	mov r2, #8
	b _0222ED28
_0222ED26:
	mov r2, #3
_0222ED28:
	cmp r1, #0
	ble _0222ED40
	mov r0, #0
	ldrsh r3, [r4, r0]
	strh r3, [r4, #2]
	ldrsh r0, [r4, r0]
	add r0, r0, r1
	add r1, r2, #0
	bl _s32_div_f
	strh r1, [r4]
	pop {r4, pc}
_0222ED40:
	bge _0222ED58
	mov r0, #0
	ldrsh r3, [r4, r0]
	strh r3, [r4, #2]
	ldrsh r3, [r4, r0]
	add r1, r3, r1
	strh r1, [r4]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222ED58
	add r0, r0, r2
	strh r0, [r4]
_0222ED58:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov43_0222ED18

	.rodata

_0222ED5C:
	.byte 0x02, 0x02, 0x09
ov43_0222ED5F:
	.byte 0x02, 0x05, 0x1A, 0x0B
ov43_0222ED63:
	.byte 0x01, 0x05, 0x1B, 0x02
ov43_0222ED67:
	.byte 0x02, 0x05, 0x1A, 0x0B
ov43_0222ED6B:
	.byte 0x02, 0x05, 0x1A, 0x0B
ov43_0222ED6F:
	.byte 0x02, 0x05, 0x16, 0x0B, 0x00

ov43_0222ED74: ; 0x0222ED74
	.byte 0x01, 0x00, 0xBB, 0x01, 0xBB, 0x01

ov43_0222ED7A: ; 0x0222ED7A
	.byte 0xA0, 0xC0, 0x88, 0xF8, 0xFF, 0x00
	.byte 0x00, 0x00

ov43_0222ED82:
	.byte 0x05, 0x05, 0x0B, 0x02, 0x05, 0x09, 0x1A, 0x05, 0x0D, 0x00, 0x0C, 0x00, 0x0A, 0x00
	.byte 0x09, 0x00, 0x00, 0x00

ov43_0222ED94: ; 0x0222ED94
	.byte 0x00, 0x05, 0x06, 0x00, 0x00, 0x03, 0x04, 0x00

ov43_0222ED9C: ; 0x0222ED9C
	.byte 0x00, 0x01, 0x0F, 0x00
	.byte 0x03, 0x04, 0x01, 0x0F, 0x00, 0x00, 0xC7, 0x00, 0xAC, 0x00, 0x88, 0x00

ov43_0222EDAC: ; 0x0222EDAC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0xF5, 0x01, 0x00, 0x00, 0xF5, 0x01, 0x00, 0x00

ov43_0222EDB8: ; 0x0222EDB8
	.byte 0x00, 0x0E, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C

ov43_0222EDC8: ; 0x0222EDC8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov43_0222EDD8: ; 0x0222EDD8
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov43_0222EDE8:
	.byte 0x02, 0x05, 0x10, 0x02, 0x02, 0x0C, 0x10, 0x02
	.byte 0x13, 0x05, 0x08, 0x05, 0x17, 0x0C, 0x04, 0x02

ov43_0222EDF8: ; 0x0222EDF8
	.byte 0x0E, 0x0E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04

ov43_0222EE08: ; 0x0222EE08
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x18, 0x20, 0x00
	.byte 0x00, 0x00, 0x20, 0x18, 0xE0, 0xFF, 0x00, 0x00, 0x20, 0x18

ov43_0222EE1A: ; 0x0222EE1A
	.byte 0x22, 0x3E, 0x12, 0xEE, 0x4A, 0x66
	.byte 0x12, 0xEE, 0x72, 0x8E, 0x12, 0xEE, 0x9A, 0xB6, 0x12, 0xEE, 0xFF, 0x00, 0x00, 0x00

ov43_0222EE2E:
	.byte 0x02, 0x01
	.byte 0x0E, 0x02, 0x02, 0x04, 0x1A, 0x02, 0x02, 0x07, 0x1A, 0x04, 0x02, 0x0C, 0x1A, 0x02, 0x02, 0x0F
	.byte 0x1A, 0x04

ov43_0222EE42: ; 0x0222EE42
	.byte 0x08, 0x28, 0xEC, 0x0C, 0x78, 0x98, 0xEC, 0x0C, 0xA0, 0xC0, 0x00, 0x70, 0xA0, 0xC0
	.byte 0x70, 0xE0, 0xA0, 0xC0, 0xE0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

ov43_0222EE5C: ; 0x0222EE5C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov43_0222EE84: ; 0x0222EE84
	.byte 0x08, 0x28, 0xEC, 0x0C, 0x78, 0x98, 0xEC, 0x0C, 0xA0, 0xC0, 0x00, 0x20
	.byte 0xA0, 0xC0, 0x20, 0x40, 0xA0, 0xC0, 0x40, 0x60, 0xA0, 0xC0, 0x60, 0x80, 0xA0, 0xC0, 0x80, 0xA0
	.byte 0xA0, 0xC0, 0xA0, 0xC0, 0xA0, 0xC0, 0xC0, 0xE0, 0xA0, 0xC0, 0xE0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov43_0222EEB0: ; 0x0222EEB0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov43_0222EEE0: ; 0x0222EEE0
	.byte 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov43_0222EF20: ; 0x0222EF20
	.byte 0x04, 0x19, 0x01, 0x06, 0x02, 0x0E, 0x01, 0x00, 0x04, 0x01, 0x00, 0x18, 0x03, 0x0E, 0x0D, 0x00
	.byte 0x04, 0x16, 0x06, 0x09, 0x02, 0x0E, 0x55, 0x00, 0x04, 0x09, 0x11, 0x08, 0x02, 0x0E, 0x73, 0x00
	.byte 0x04, 0x13, 0x15, 0x0B, 0x02, 0x0E, 0xA5, 0x00, 0x04, 0x04, 0x04, 0x0A, 0x0A, 0x0F, 0xBB, 0x00
	.byte 0x04, 0x01, 0x11, 0x06, 0x02, 0x0E, 0x67, 0x00, 0x04, 0x01, 0x15, 0x11, 0x02, 0x0E, 0x83, 0x00

ov43_0222EF60: ; 0x0222EF60
	.byte 0x20, 0x40, 0x10, 0x80, 0x40, 0x60, 0x10, 0x80, 0x60, 0x80, 0x10, 0x80, 0x80, 0xA0, 0x10, 0x80
	.byte 0x20, 0x40, 0x80, 0xF0, 0x40, 0x60, 0x80, 0xF0, 0x60, 0x80, 0x80, 0xF0, 0x80, 0xA0, 0x80, 0xF0
	.byte 0xA0, 0xC0, 0x88, 0xF8, 0x58, 0x68, 0x00, 0x10, 0x58, 0x68, 0xF0, 0x00, 0x00, 0x20, 0x80, 0xA0
	.byte 0x00, 0x20, 0xA0, 0xC0, 0x00, 0x20, 0xC0, 0xE0, 0x00, 0x20, 0xE0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov43_0222EFA0: ; 0x0222EFA0
	.byte 0x02, 0x00

ov43_0222EFA2: ; 0x0222EFA2
	.byte 0x04, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0F, 0x04
	.byte 0x02, 0x02, 0x09, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x02, 0x00
	.byte 0x10, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x10, 0x00, 0x04, 0x00, 0x0F, 0x04, 0x02, 0x02
	.byte 0x09, 0x00, 0x10, 0x00, 0x08, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x10, 0x00, 0x0C, 0x00
	.byte 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x10, 0x00, 0x10, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00
	.byte 0x11, 0x00, 0x14, 0x00, 0x0E, 0x04, 0x00, 0x01, 0x09, 0x00, 0x00, 0x00

ov43_0222EFFC: ; 0x0222EFFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x18, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x19, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x1C, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov43_0222F0C0: ; 0x0222F0C0
	.byte 0x10, 0x11, 0x00, 0x00

ov43_0222F0C4: ; 0x0222F0C4
	.byte 0x18, 0x10, 0x00, 0x00

ov43_0222F0C8: ; 0x0222F0C8
	.byte 0x00, 0x38, 0x3B, 0x00

ov43_0222F0CC: ; 0x0222F0CC
	.byte 0x01, 0x02, 0x03, 0x05

ov43_0222F0D0: ; 0x0222F0D0
	.byte 0x04, 0x01, 0x02, 0x05, 0x01, 0x01, 0x01, 0x01

	.data

_0222F0E0:
	.word ov43_0222DFB0
	.word ov43_0222EA40
	.word ov43_0222EBD8

ov43_0222F0EC: ; 0x0222F0EC
	.word ov43_0222C46C, 0
	.word ov43_0222C4B8, 0

ov43_0222F0FC: ; 0x0222F0FC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x10, 0x00, 0x00, 0xF0, 0x0F, 0x00, 0x00, 0x00, 0x0C, 0x00

ov43_0222F10C: ; 0x0222F10C
	.word ov43_0222EDE8
	.word ov43_0222ED6F
	.word ov43_0222ED82
	.word ov43_0222EE2E
	.word ov43_0222ED5F
	.word ov43_0222ED6B
	.word ov43_0222ED67
	.word ov43_0222ED63

ov43_0222F12C: ; 0x0222F12C
	.word ov43_0222DFB0
	.word ov43_0222EA40
	.word ov43_0222E0E8
	.word ov43_0222E220
	.word ov43_0222E5B4
	.word ov43_0222E78C
	.word ov43_0222E904
	.word ov43_0222EBD8

ov43_0222F14C: ; 0x0222F14C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov43_0222F160: ; 0x0222F160
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov43_0222F1AC: ; 0x0222F1AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x0222F1E0
