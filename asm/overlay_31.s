	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov31_0225D520
ov31_0225D520: ; 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #3
	str r2, [sp]
	mov r1, #8
	lsl r2, r0, #0xf
	str r3, [sp, #4]
	bl CreateHeap
	mov r1, #0x19
	ldr r0, _0225D5FC ; =ov31_0225D7A0
	lsl r1, r1, #4
	mov r2, #0xa
	mov r3, #8
	bl sub_02007200
	add r5, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	str r5, [r4, #8]
	mov r1, #0
	str r1, [r4]
	str r6, [r4, #4]
	ldr r0, [sp]
	str r7, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r1, [r4, #0x30]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl Save_Pokeathlon_get
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, [sp, #4]
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl ov31_0225DAC4
	add r0, r4, #0
	bl ov31_0225DB38
	add r0, r4, #0
	bl ov31_0225D60C
	add r0, r4, #0
	mov r1, #0
	bl ov31_0225D684
	add r0, r4, #0
	bl ov31_0225DE84
	add r0, r4, #0
	bl ov31_0225DF98
	add r0, r4, #0
	bl ov31_0225DD14
	ldr r0, [r4, #0x14]
	bl ov03_022581BC
	ldr r2, _0225D600 ; =0x04001000
	ldr r0, _0225D604 ; =0xFFFF1FFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _0225D608 ; =_0225EE40
	bl sub_02002C20
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D5FC: .word ov31_0225D7A0
_0225D600: .word 0x04001000
_0225D604: .word 0xFFFF1FFF
_0225D608: .word _0225EE40
	thumb_func_end ov31_0225D520

	thumb_func_start ov31_0225D60C
ov31_0225D60C: ; 0x0225D60C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	mov r1, #0x40
	add r2, r0, #0
	bl ScrStrBufs_new_custom
	mov r2, #0x55
	lsl r2, r2, #2
	str r0, [r4, r2]
	mov r0, #0
	mov r1, #0x1b
	add r2, #0x5f
	mov r3, #8
	bl NewMsgDataFromNarc
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xde
	mov r3, #8
	bl NewMsgDataFromNarc
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x90
	mov r1, #8
	bl String_ctor
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov31_0225D60C

	thumb_func_start ov31_0225D654
ov31_0225D654: ; 0x0225D654
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov31_0225D654

	thumb_func_start ov31_0225D684
ov31_0225D684: ; 0x0225D684
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	add r6, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0x11
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x64
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _0225D6DE
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	mov r6, #0x30
	sub r3, r6, r3
	lsr r3, r3, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D70C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x64
	add r3, #8
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	b _0225D6F8
_0225D6DE:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D70C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x64
	mov r3, #5
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0225D6F8:
	add r5, #0x64
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225D70C: .word 0x000F0E00
	thumb_func_end ov31_0225D684

	thumb_func_start ov31_0225D710
ov31_0225D710: ; 0x0225D710
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0201F988
	add r4, r0, #0
	mov r0, #0
	bl sub_02002B8C
	add r0, r4, #0
	bl ov31_0225DBA0
	add r0, r4, #0
	bl ov31_0225D654
	add r0, r6, #0
	bl sub_02007234
	add r0, r5, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r5, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r5, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	mov r0, #8
	bl DestroyHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov31_0225D710

	thumb_func_start ov31_0225D758
ov31_0225D758: ; 0x0225D758
	mov r0, #1
	bx lr
	thumb_func_end ov31_0225D758

	thumb_func_start ov31_0225D75C
ov31_0225D75C: ; 0x0225D75C
	cmp r1, #8
	bhi _0225D796
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225D76C: ; jump table
	.short _0225D77E - _0225D76C - 2 ; case 0
	.short _0225D77E - _0225D76C - 2 ; case 1
	.short _0225D77E - _0225D76C - 2 ; case 2
	.short _0225D77E - _0225D76C - 2 ; case 3
	.short _0225D77E - _0225D76C - 2 ; case 4
	.short _0225D77E - _0225D76C - 2 ; case 5
	.short _0225D792 - _0225D76C - 2 ; case 6
	.short _0225D792 - _0225D76C - 2 ; case 7
	.short _0225D792 - _0225D76C - 2 ; case 8
_0225D77E:
	ldr r3, [r0, #0x14]
	ldr r0, _0225D79C ; =0x00000271
	ldrb r2, [r3, r0]
	sub r0, r0, #1
	ldrb r0, [r3, r0]
	add r1, r1, r2
	cmp r1, r0
	bhs _0225D796
	mov r0, #1
	bx lr
_0225D792:
	mov r0, #1
	bx lr
_0225D796:
	mov r0, #0
	bx lr
	nop
_0225D79C: .word 0x00000271
	thumb_func_end ov31_0225D75C

	thumb_func_start ov31_0225D7A0
ov31_0225D7A0: ; 0x0225D7A0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0225D7B0
	cmp r0, #1
	beq _0225D7BE
	pop {r3, r4, r5, pc}
_0225D7B0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225D836
	mov r0, #1
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
_0225D7BE:
	ldr r1, [r5, #0x14]
	ldr r0, _0225D838 ; =0x00000272
	ldrb r0, [r1, r0]
	cmp r0, #3
	beq _0225D7D2
	cmp r0, #7
	beq _0225D7FA
	cmp r0, #0xb
	beq _0225D814
	b _0225D81A
_0225D7D2:
	add r0, r5, #0
	mov r1, #0
	bl ov31_0225DAA4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0225D81A
	add r0, r5, #0
	add r1, r4, #0
	bl ov31_0225D75C
	cmp r0, #0
	beq _0225D81A
	mov r0, #0xa5
	ldr r1, [r5, #0x14]
	lsl r0, r0, #2
	str r4, [r1, r0]
	b _0225D81A
_0225D7FA:
	add r0, r5, #0
	mov r1, #1
	bl ov31_0225DAA4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0225D81A
	mov r1, #0xa5
	ldr r2, [r5, #0x14]
	lsl r1, r1, #2
	str r0, [r2, r1]
	b _0225D81A
_0225D814:
	add r0, r5, #0
	bl ov31_0225E774
_0225D81A:
	mov r0, #0xa6
	ldr r1, [r5, #0x14]
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _0225D836
	add r0, r5, #0
	bl ov31_0225D83C
	mov r0, #0xa6
	ldr r1, [r5, #0x14]
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r1, r0]
_0225D836:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225D838: .word 0x00000272
	thumb_func_end ov31_0225D7A0

	thumb_func_start ov31_0225D83C
ov31_0225D83C: ; 0x0225D83C
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0xd
	bls _0225D846
	b _0225D9CC
_0225D846:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225D852: ; jump table
	.short _0225D9CC - _0225D852 - 2 ; case 0
	.short _0225D86E - _0225D852 - 2 ; case 1
	.short _0225D882 - _0225D852 - 2 ; case 2
	.short _0225D8D2 - _0225D852 - 2 ; case 3
	.short _0225D910 - _0225D852 - 2 ; case 4
	.short _0225D950 - _0225D852 - 2 ; case 5
	.short _0225D974 - _0225D852 - 2 ; case 6
	.short _0225D980 - _0225D852 - 2 ; case 7
	.short _0225D998 - _0225D852 - 2 ; case 8
	.short _0225D99E - _0225D852 - 2 ; case 9
	.short _0225D9A4 - _0225D852 - 2 ; case 10
	.short _0225D9AA - _0225D852 - 2 ; case 11
	.short _0225D9C2 - _0225D852 - 2 ; case 12
	.short _0225D9C8 - _0225D852 - 2 ; case 13
_0225D86E:
	bl ov31_0225DD14
	add r0, r4, #0
	bl ov31_0225DF98
	add r0, r4, #0
	mov r1, #0
	bl ov31_0225D684
	pop {r4, pc}
_0225D882:
	mov r1, #1
	bl ov31_0225D9D4
	add r0, r4, #0
	bl ov31_0225DCF4
	add r0, r4, #0
	add r0, #0x54
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl ov31_0225EC58
	add r0, r4, #0
	bl ov31_0225E184
	mov r1, #0xa1
	ldr r2, [r4, #0x14]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	add r0, r4, #0
	bl ov31_0225E20C
	ldr r2, [r4, #0x14]
	ldr r1, _0225D9D0 ; =0x00000286
	add r0, r4, #0
	ldrsh r1, [r2, r1]
	bl ov31_0225E2D4
	add r0, r4, #0
	bl ov31_0225E474
	add r0, r4, #0
	mov r1, #1
	bl ov31_0225D684
	add r0, r4, #0
	bl ov31_0225E54C
	pop {r4, pc}
_0225D8D2:
	mov r1, #2
	bl ov31_0225D9D4
	add r0, r4, #0
	bl ov31_0225DCF4
	add r0, r4, #0
	bl ov31_0225EC58
	add r0, r4, #0
	bl ov31_0225E184
	mov r1, #0xa1
	ldr r2, [r4, #0x14]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	add r0, r4, #0
	bl ov31_0225E20C
	add r0, r4, #0
	bl ov31_0225E5FC
	add r0, r4, #0
	add r0, #0x54
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, #0x64
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
_0225D910:
	mov r1, #0
	bl ov31_0225D9D4
	add r0, r4, #0
	bl ov31_0225EDA0
	add r0, r4, #0
	bl ov31_0225DF98
	add r0, r4, #0
	mov r1, #0
	bl ov31_0225D684
	add r0, r4, #0
	bl ov31_0225DCA8
	add r0, r4, #0
	add r0, #0x44
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl ov31_0225DD14
	add r0, r4, #0
	bl ov31_0225DE84
	add r4, #0x64
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
_0225D950:
	mov r1, #0
	bl ov31_0225D9D4
	add r0, r4, #0
	bl ov31_0225DF98
	add r0, r4, #0
	add r0, #0x44
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl ov31_0225DD14
	add r0, r4, #0
	bl ov31_0225DE84
	pop {r4, pc}
_0225D974:
	ldr r2, [r4, #0x14]
	ldr r1, _0225D9D0 ; =0x00000286
	ldrsh r1, [r2, r1]
	bl ov31_0225E2D4
	pop {r4, pc}
_0225D980:
	add r0, #0x64
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl ov31_0225E5FC
	pop {r4, pc}
_0225D998:
	bl ov31_0225E700
	pop {r4, pc}
_0225D99E:
	bl ov31_0225E7D4
	pop {r4, pc}
_0225D9A4:
	bl ov31_0225EA08
	pop {r4, pc}
_0225D9AA:
	add r0, #0x64
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl ov31_0225EA9C
	pop {r4, pc}
_0225D9C2:
	bl ov31_0225EB30
	pop {r4, pc}
_0225D9C8:
	bl ov31_0225EBC4
_0225D9CC:
	pop {r4, pc}
	nop
_0225D9D0: .word 0x00000286
	thumb_func_end ov31_0225D83C

	thumb_func_start ov31_0225D9D4
ov31_0225D9D4: ; 0x0225D9D4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	cmp r1, #0
	beq _0225D9EA
	cmp r1, #1
	beq _0225DA26
	cmp r1, #2
	beq _0225DA64
	add sp, #8
	pop {r3, r4, r5, pc}
_0225D9EA:
	mov r0, #8
	str r0, [sp]
	mov r0, #0x3c
	mov r1, #0x11
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #8
	pop {r3, r4, r5, pc}
_0225DA26:
	ldr r0, [r4, #4]
	mov r1, #5
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	mov r0, #8
	str r0, [sp]
	mov r0, #0x3c
	mov r1, #0x13
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
_0225DA64:
	ldr r0, [r4, #4]
	mov r1, #5
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	mov r0, #8
	str r0, [sp]
	mov r0, #0x3c
	mov r1, #0x14
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov31_0225D9D4

	thumb_func_start ov31_0225DAA4
ov31_0225DAA4: ; 0x0225DAA4
	push {r4, lr}
	add r4, r1, #0
	beq _0225DAB2
	cmp r4, #1
	beq _0225DAB2
	bl GF_AssertFail
_0225DAB2:
	ldr r0, _0225DAC0 ; =_0225EF40
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	bl sub_02025224
	pop {r4, pc}
	nop
_0225DAC0: .word _0225EF40
	thumb_func_end ov31_0225DAA4

	thumb_func_start ov31_0225DAC4
ov31_0225DAC4: ; 0x0225DAC4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	bl GXS_SetGraphicsMode
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #1
	lsl r0, r0, #8
	bl GX_SetBankForSubOBJ
	ldr r2, _0225DB24 ; =0x04001000
	ldr r0, _0225DB28 ; =0xFFCFFFEF
	ldr r1, [r2]
	mov r3, #0
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	ldr r0, [r4, #4]
	ldr r2, _0225DB2C ; =ov31_0225EED0
	mov r1, #4
	bl InitBgFromTemplate
	ldr r0, [r4, #4]
	ldr r2, _0225DB30 ; =ov31_0225EEEC
	mov r1, #5
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #4]
	ldr r2, _0225DB34 ; =ov31_0225EF08
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	ldr r0, [r4, #4]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	pop {r4, pc}
	.balign 4, 0
_0225DB24: .word 0x04001000
_0225DB28: .word 0xFFCFFFEF
_0225DB2C: .word ov31_0225EED0
_0225DB30: .word ov31_0225EEEC
_0225DB34: .word ov31_0225EF08
	thumb_func_end ov31_0225DAC4

	thumb_func_start ov31_0225DB38
ov31_0225DB38: ; 0x0225DB38
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0225DB9C ; =0x04001050
	mov r3, #0
	strh r3, [r0]
	str r3, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #0x3c
	mov r1, #0xf
	mov r2, #4
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x3c
	mov r1, #0x10
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	add r0, r4, #0
	mov r1, #0
	bl ov31_0225D9D4
	mov r1, #0x16
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #8
	bl LoadFontPal1
	mov r1, #6
	mov r0, #4
	lsl r1, r1, #6
	mov r2, #8
	bl LoadFontPal0
	add r0, r4, #0
	bl ov31_0225DBD4
	add r0, r4, #0
	bl ov31_0225DCA8
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0225DB9C: .word 0x04001050
	thumb_func_end ov31_0225DB38

	thumb_func_start ov31_0225DBA0
ov31_0225DBA0: ; 0x0225DBA0
	push {r4, lr}
	add r4, r0, #0
	bl ov31_0225DCF4
	add r0, r4, #0
	add r0, #0x34
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x44
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x74
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x54
	bl RemoveWindow
	add r4, #0x64
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov31_0225DBA0

	thumb_func_start ov31_0225DBD4
ov31_0225DBD4: ; 0x0225DBD4
	push {r3, r4, lr}
	sub sp, #0x14
	mov r1, #1
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x34
	mov r2, #4
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x1d
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, #0x44
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r2, #4
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x89
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, #0x74
	mov r3, #1
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x54
	mov r2, #4
	mov r3, #0xa
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x54
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x64
	mov r2, #4
	mov r3, #0x18
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0
	add r1, r2, #0
_0225DC94:
	add r0, r4, #0
	add r0, #0x84
	add r2, r2, #1
	add r4, #0x10
	str r1, [r0]
	cmp r2, #0xd
	blt _0225DC94
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov31_0225DBD4

	thumb_func_start ov31_0225DCA8
ov31_0225DCA8: ; 0x0225DCA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _0225DCF0 ; =ov31_0225EE88
	mov r6, #0
	add r5, #0x84
_0225DCB6:
	ldr r0, [r4, #4]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	mov r2, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7, #4]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r6, r6, #1
	add r4, #0xc
	add r5, #0x10
	cmp r6, #6
	blt _0225DCB6
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DCF0: .word ov31_0225EE88
	thumb_func_end ov31_0225DCA8

	thumb_func_start ov31_0225DCF4
ov31_0225DCF4: ; 0x0225DCF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x84
_0225DCFC:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _0225DCFC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov31_0225DCF4

	thumb_func_start ov31_0225DD14
ov31_0225DD14: ; 0x0225DD14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
	add r4, #0x84
	add r7, r6, #0
_0225DD22:
	add r0, r4, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #6
	blt _0225DD22
	mov r0, #0x27
	ldr r2, [r5, #0x14]
	lsl r0, r0, #4
	ldrb r1, [r2, r0]
	add r0, r0, #1
	ldrb r0, [r2, r0]
	sub r0, r1, r0
	str r0, [sp, #4]
	cmp r0, #6
	ble _0225DD4C
	mov r0, #6
	str r0, [sp, #4]
	b _0225DD54
_0225DD4C:
	cmp r0, #0
	bge _0225DD54
	mov r0, #0
	str r0, [sp, #4]
_0225DD54:
	ldr r0, [sp, #4]
	mov r4, #0
	cmp r0, #0
	ble _0225DDD6
	add r6, r5, #0
	add r6, #0x84
_0225DD60:
	ldr r0, [r5, #0x14]
	ldr r1, _0225DDF8 ; =0x00000271
	ldrb r1, [r0, r1]
	add r1, r4, r1
	str r1, [sp, #0xc]
	mov r1, #0x9a
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	ldr r0, [sp, #0xc]
	lsl r0, r0, #1
	ldrh r7, [r1, r0]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	add r3, r4, #0
	bl ov31_0225DE00
	ldr r0, [sp, #0x10]
	bl String_dtor
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0xc]
	add r2, r7, #0
	bl ov31_0225E12C
	cmp r0, #0
	beq _0225DDCC
	ldr r0, [r5, #0x14]
	lsl r1, r7, #0x10
	str r0, [sp, #8]
	lsr r1, r1, #0x10
	bl ov03_02258120
	add r3, r0, #0
	ldr r1, [sp, #8]
	ldr r0, _0225DDFC ; =0x00000283
	add r2, r6, #0
	ldrb r0, [r1, r0]
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [sp]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl ov31_0225DE24
_0225DDCC:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r6, #0x10
	cmp r4, r0
	blt _0225DD60
_0225DDD6:
	add r4, r5, #0
	mov r6, #0
	add r4, #0x84
_0225DDDC:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #6
	blt _0225DDDC
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov31_0225E0E4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225DDF8: .word 0x00000271
_0225DDFC: .word 0x00000283
	thumb_func_end ov31_0225DD14

	thumb_func_start ov31_0225DE00
ov31_0225DE00: ; 0x0225DE00
	push {r3, lr}
	sub sp, #0x10
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DE20 ; =0x00010200
	str r0, [sp, #8]
	add r0, r1, #0
	add r1, r3, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, pc}
	nop
_0225DE20: .word 0x00010200
	thumb_func_end ov31_0225DE00

	thumb_func_start ov31_0225DE24
ov31_0225DE24: ; 0x0225DE24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [sp, #0x28]
	add r6, r1, #0
	sub r0, r0, #3
	add r7, r2, #0
	mov r4, #0x12
	cmp r0, #1
	bhi _0225DE3A
	mov r4, #0x13
_0225DE3A:
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, r3, #0
	add r0, r5, #0
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #8
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DE80 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0x24
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DE80: .word 0x00010200
	thumb_func_end ov31_0225DE24

	thumb_func_start ov31_0225DE84
ov31_0225DE84: ; 0x0225DE84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x74
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [r5, #0x14]
	ldr r0, _0225DF90 ; =0x00000283
	ldrb r0, [r1, r0]
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0225DEB0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x21
	bl NewString_ReadMsgData
	b _0225DEBC
_0225DEB0:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1e
	bl NewString_ReadMsgData
_0225DEBC:
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DF94 ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x74
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	mov r0, #0x10
	mov r1, #0xb
	bl String_ctor
	add r4, r0, #0
	ldr r1, [r5, #0x14]
	ldr r0, _0225DF90 ; =0x00000283
	ldrb r0, [r1, r0]
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0225DF12
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl SavePokeathlon_GetAthletePoints
	b _0225DF2A
_0225DF12:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1f
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl PlayerProfile_GetMoney
_0225DF2A:
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r6, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DF94 ; =0x000F0E00
	mov r3, #0x48
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x74
	add r2, r4, #0
	sub r3, r3, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r5, #0x74
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DF90: .word 0x00000283
_0225DF94: .word 0x000F0E00
	thumb_func_end ov31_0225DE84

	thumb_func_start ov31_0225DF98
ov31_0225DF98: ; 0x0225DF98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r0, #0x54
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #6
	mov r1, #0xb
	bl String_ctor
	add r6, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x2b
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r5, [r4, #0x14]
	ldr r0, _0225E058 ; =0x00000271
	mov r1, #6
	ldrb r0, [r5, r0]
	add r0, r0, #6
	bl _s32_div_f
	str r0, [sp, #0x14]
	mov r0, #0x27
	lsl r0, r0, #4
	ldrb r0, [r5, r0]
	mov r1, #6
	str r0, [sp, #0x10]
	bl _s32_div_f
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #6
	bl _s32_div_f
	cmp r1, #0
	beq _0225DFEC
	add r5, r5, #1
_0225DFEC:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x14]
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r1, #1
	str r1, [sp]
	mov r0, #0x55
	str r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r5, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225E05C ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r4, #0x54
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E058: .word 0x00000271
_0225E05C: .word 0x000F0E00
	thumb_func_end ov31_0225DF98

	thumb_func_start ov31_0225E060
ov31_0225E060: ; 0x0225E060
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r6, r0, #0
	add r4, r2, #0
	bl GetBgTilemapBuffer
	str r0, [sp, #0x14]
	cmp r4, #6
	beq _0225E0DA
	ldr r1, _0225E0E0 ; =ov31_0225EF48
	lsl r0, r4, #5
	add r5, r1, r0
	ldr r0, [sp, #0x10]
	mov r7, #0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0225E086:
	ldrb r0, [r5]
	cmp r0, #1
	bne _0225E0B2
	ldrb r0, [r5, #4]
	add r1, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	ldrb r3, [r5, #2]
	ldrb r2, [r5, #1]
	add r0, r6, #0
	lsl r3, r3, #5
	add r2, r2, r3
	lsl r3, r2, #1
	ldr r2, [sp, #0x14]
	add r2, r2, r3
	ldrb r3, [r5, #3]
	bl LoadRectToBgTilemapRect
	b _0225E0D2
_0225E0B2:
	cmp r0, #2
	bne _0225E0D2
	ldrb r0, [r5, #4]
	add r1, r4, #0
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl FillBgTilemapRect
_0225E0D2:
	add r7, r7, #1
	add r5, #8
	cmp r7, #4
	blt _0225E086
_0225E0DA:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E0E0: .word ov31_0225EF48
	thumb_func_end ov31_0225E060

	thumb_func_start ov31_0225E0E4
ov31_0225E0E4: ; 0x0225E0E4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #8
	add r4, r1, #0
	str r0, [sp]
	mov r0, #0x3c
	mov r1, #0x12
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r6, r0, #0
	add r2, r3, #0
	ldr r0, [r5, #4]
	ldr r3, [r3, #8]
	mov r1, #5
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r5, #4]
	mov r1, #5
	add r2, r4, #0
	bl ov31_0225E060
	ldr r0, [r5, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov31_0225E0E4

	thumb_func_start ov31_0225E12C
ov31_0225E12C: ; 0x0225E12C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225E180 ; =0x00000283
	add r4, r1, #0
	ldrb r3, [r5, r0]
	cmp r3, #3
	bne _0225E14E
	sub r0, #0x2f
	ldr r0, [r5, r0]
	bl sub_02031AB8
	cmp r0, #0
	bne _0225E14A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E14A:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225E14E:
	cmp r3, #4
	bne _0225E17A
	sub r0, #0x8a
	sub r0, r2, r0
	mov r1, #6
	bl _s32_div_f
	add r2, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	mov r1, #6
	mul r1, r2
	ldr r0, [r5, r0]
	add r1, r4, r1
	bl sub_02031A78
	cmp r0, #0
	bne _0225E176
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E176:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225E17A:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0225E180: .word 0x00000283
	thumb_func_end ov31_0225E12C

	thumb_func_start ov31_0225E184
ov31_0225E184: ; 0x0225E184
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x29
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r2, [r5, #0x14]
	add r0, r1, #0
	sub r0, #0x1f
	ldr r3, [r2, r1]
	ldrb r0, [r2, r0]
	sub r1, #0x28
	ldr r1, [r2, r1]
	add r6, r3, r0
	lsl r4, r6, #1
	mov r0, #0x57
	lsl r0, r0, #2
	ldrh r1, [r1, r4]
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0xe4
	add r2, r7, #0
	add r3, r6, #0
	bl ov31_0225DE00
	add r0, r7, #0
	bl String_dtor
	mov r2, #0x9a
	ldr r0, [r5, #0x14]
	lsl r2, r2, #2
	ldr r2, [r0, r2]
	add r1, r6, #0
	ldrh r2, [r2, r4]
	bl ov31_0225E12C
	cmp r0, #0
	beq _0225E1FE
	ldr r6, [r5, #0x14]
	mov r1, #0x9a
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r0, r6, #0
	ldrh r1, [r1, r4]
	bl ov03_02258120
	add r3, r0, #0
	ldr r0, _0225E208 ; =0x00000283
	mov r1, #0x55
	ldrb r0, [r6, r0]
	add r2, r5, #0
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, #0xe4
	bl ov31_0225DE24
_0225E1FE:
	add r5, #0xe4
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E208: .word 0x00000283
	thumb_func_end ov31_0225E184

	thumb_func_start ov31_0225E20C
ov31_0225E20C: ; 0x0225E20C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x23
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E2D0 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r2, #0x25
	add r0, r5, r2
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	mov r0, #5
	mov r1, #0xb
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x24
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r1, #0xa1
	ldr r0, [r5, #0x14]
	lsl r1, r1, #2
	ldrh r1, [r0, r1]
	bl ov03_02257978
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r6, r0, #0
	mov r0, #0x14
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E2D0 ; =0x00010200
	mov r3, #0x40
	add r2, #0x25
	str r0, [sp, #8]
	mov r1, #0
	add r0, r5, r2
	add r2, r4, #0
	sub r3, r3, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x49
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E2D0: .word 0x00010200
	thumb_func_end ov31_0225E20C

	thumb_func_start ov31_0225E2D4
ov31_0225E2D4: ; 0x0225E2D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #2
	mov r1, #0xb
	bl String_ctor
	add r6, r0, #0
	mov r0, #2
	mov r1, #0xb
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x2c
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x2d
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	mov r3, #1
	add r2, r0, #0
	str r3, [sp]
	mov r0, #0x55
	str r3, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r2, r1, #0
	mov r1, #1
	str r1, [sp]
	mov r0, #0x55
	str r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl BufferIntegerAsString
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x14]
	add r1, r7, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0xf4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225E470 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xf4
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #4
	str r0, [sp]
	mov r2, #0xff
	mov r1, #0
	ldr r0, _0225E470 ; =0x00010200
	str r2, [sp, #4]
	str r0, [sp, #8]
	add r0, r2, #5
	add r0, r5, r0
	add r2, r7, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x10]
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r5, #0
	add r0, #0xf4
	bl ScheduleWindowCopyToVram
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #9
	mov r1, #0xb
	bl String_ctor
	add r6, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x26
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0xa3
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r3, [r5, #0x14]
	lsl r2, r2, #2
	ldr r3, [r3, r2]
	ldr r0, [r5, r0]
	add r2, r3, #0
	mov r1, #0
	mul r2, r4
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E470 ; =0x00010200
	mov r3, #0x40
	add r2, #0x35
	str r0, [sp, #8]
	mov r1, #0
	add r0, r5, r2
	add r2, r6, #0
	sub r3, r3, r4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E470: .word 0x00010200
	thumb_func_end ov31_0225E2D4

	thumb_func_start ov31_0225E474
ov31_0225E474: ; 0x0225E474
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x2a
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E4B8 ; =0x000F0E00
	add r2, #0x15
	str r0, [sp, #8]
	add r0, r5, r2
	add r2, r4, #0
	mov r3, #4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225E4B8: .word 0x000F0E00
	thumb_func_end ov31_0225E474

	thumb_func_start ov31_0225E4BC
ov31_0225E4BC: ; 0x0225E4BC
	push {r3, lr}
	cmp r0, #4
	bhi _0225E4EA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E4CE: ; jump table
	.short _0225E4D8 - _0225E4CE - 2 ; case 0
	.short _0225E4E2 - _0225E4CE - 2 ; case 1
	.short _0225E4EA - _0225E4CE - 2 ; case 2
	.short _0225E4D8 - _0225E4CE - 2 ; case 3
	.short _0225E4D8 - _0225E4CE - 2 ; case 4
_0225E4D8:
	add r0, r1, #0
	add r1, r3, #0
	bl BufferItemName
	pop {r3, pc}
_0225E4E2:
	add r0, r1, #0
	add r1, r3, #0
	bl BufferDecorationName
_0225E4EA:
	pop {r3, pc}
	thumb_func_end ov31_0225E4BC

	thumb_func_start ov31_0225E4EC
ov31_0225E4EC: ; 0x0225E4EC
	push {r3, lr}
	cmp r0, #4
	bhi _0225E51A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E4FE: ; jump table
	.short _0225E508 - _0225E4FE - 2 ; case 0
	.short _0225E512 - _0225E4FE - 2 ; case 1
	.short _0225E51A - _0225E4FE - 2 ; case 2
	.short _0225E508 - _0225E4FE - 2 ; case 3
	.short _0225E508 - _0225E4FE - 2 ; case 4
_0225E508:
	add r0, r1, #0
	add r1, r3, #0
	bl BufferItemNamePlural
	pop {r3, pc}
_0225E512:
	add r0, r1, #0
	add r1, r3, #0
	bl BufferDecorationName
_0225E51A:
	pop {r3, pc}
	thumb_func_end ov31_0225E4EC

	thumb_func_start ov31_0225E51C
ov31_0225E51C: ; 0x0225E51C
	push {r3, lr}
	cmp r0, #4
	bhi _0225E54A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E52E: ; jump table
	.short _0225E538 - _0225E52E - 2 ; case 0
	.short _0225E542 - _0225E52E - 2 ; case 1
	.short _0225E54A - _0225E52E - 2 ; case 2
	.short _0225E538 - _0225E52E - 2 ; case 3
	.short _0225E538 - _0225E52E - 2 ; case 4
_0225E538:
	add r0, r1, #0
	add r1, r3, #0
	bl BufferItemNameWithIndefArticle
	pop {r3, pc}
_0225E542:
	add r0, r1, #0
	add r1, r3, #0
	bl BufferDecorationName
_0225E54A:
	pop {r3, pc}
	thumb_func_end ov31_0225E51C

	thumb_func_start ov31_0225E54C
ov31_0225E54C: ; 0x0225E54C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r1, #0x55
	lsl r1, r1, #2
	ldr r3, [r5, #0x14]
	ldr r2, _0225E5F4 ; =0x00000283
	ldr r1, [r5, r1]
	ldrb r0, [r3, r2]
	add r2, r2, #1
	ldrh r2, [r3, r2]
	mov r3, #0
	bl ov31_0225E4BC
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xc
	bl NewString_ReadMsgData
	mov r1, #0x55
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225E5F8 ; =0x000001B5
	mov r3, #5
	bl LoadUserFrameGfx2
	mov r2, #0x51
	lsl r2, r2, #2
	add r0, r5, r2
	mov r1, #1
	add r2, #0x71
	mov r3, #5
	bl DrawFrameAndWindow2
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	mov r2, #0x51
	str r0, [sp, #4]
	lsl r2, r2, #2
	add r0, r5, r2
	str r3, [sp, #8]
	add r2, #0x44
	ldr r2, [r5, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xa
	ldr r2, [r5, #0x14]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0225E5F4: .word 0x00000283
_0225E5F8: .word 0x000001B5
	thumb_func_end ov31_0225E54C

	thumb_func_start ov31_0225E5FC
ov31_0225E5FC: ; 0x0225E5FC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, [r4, #0x14]
	ldr r3, _0225E6F8 ; =0x00000283
	ldrb r0, [r2, r3]
	add r1, r0, #0
	add r1, #0xfd
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #1
	bhi _0225E63E
	mov r1, #0x55
	add r3, r3, #1
	lsl r1, r1, #2
	ldrh r2, [r2, r3]
	ldr r1, [r4, r1]
	mov r3, #0
	bl ov31_0225E51C
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x2e
	bl NewString_ReadMsgData
	b _0225E684
_0225E63E:
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x55
	add r3, r3, #3
	lsl r0, r0, #2
	ldrsh r2, [r2, r3]
	ldr r0, [r4, r0]
	mov r3, #2
	bl BufferIntegerAsString
	mov r5, #0xa3
	ldr r2, [r4, #0x14]
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	mov r0, #0x55
	str r1, [sp, #4]
	lsl r5, r5, #2
	ldr r3, [r2, r5]
	sub r5, r5, #6
	ldrsh r2, [r2, r5]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mul r2, r3
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xe
	bl NewString_ReadMsgData
_0225E684:
	mov r1, #0x55
	lsl r1, r1, #2
	add r5, r0, #0
	ldr r0, [r4, r1]
	add r1, #0x34
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	ldr r0, [r4, #4]
	ldr r2, _0225E6FC ; =0x000001B5
	mov r3, #5
	bl LoadUserFrameGfx2
	mov r2, #0x51
	lsl r2, r2, #2
	add r0, r4, r2
	mov r1, #1
	add r2, #0x71
	mov r3, #5
	bl DrawFrameAndWindow2
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	mov r2, #0x51
	str r0, [sp, #4]
	lsl r2, r2, #2
	add r0, r4, r2
	str r3, [sp, #8]
	add r2, #0x44
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225E6F8: .word 0x00000283
_0225E6FC: .word 0x000001B5
	thumb_func_end ov31_0225E5FC

	thumb_func_start ov31_0225E700
ov31_0225E700: ; 0x0225E700
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	mov r2, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #0x60
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r2, [r0, #0x10]
	mov r1, #6
	strb r1, [r0, #0x11]
	ldr r0, [r4, #0x1c]
	add r2, #0xf2
	add r0, r0, r2
	bl sub_020183F0
	add r1, sp, #0
	ldrb r2, [r1, #0x12]
	mov r3, #0xf
	lsl r0, r0, #0x18
	bic r2, r3
	lsr r3, r0, #0x18
	mov r0, #0xf
	and r0, r3
	orr r0, r2
	strb r0, [r1, #0x12]
	ldrb r2, [r1, #0x12]
	mov r0, #0xf0
	bic r2, r0
	strb r2, [r1, #0x12]
	mov r0, #0
	strb r0, [r1, #0x13]
	ldr r0, [r4, #4]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r0, #8
	bl sub_0201660C
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0
	bl sub_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov31_0225E700

	thumb_func_start ov31_0225E774
ov31_0225E774: ; 0x0225E774
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225E786
	mov r0, #0
	pop {r4, pc}
_0225E786:
	bl sub_02016748
	cmp r0, #1
	beq _0225E794
	cmp r0, #2
	beq _0225E7B2
	b _0225E7D0
_0225E794:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #0x17
	mov r2, #0
	lsl r0, r0, #4
	str r2, [r4, r0]
	mov r0, #0xa5
	ldr r1, [r4, #0x14]
	lsl r0, r0, #2
	str r2, [r1, r0]
	mov r0, #1
	pop {r4, pc}
_0225E7B2:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #0x17
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r1, #0xa5
	ldr r2, [r4, #0x14]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r2, r1]
	pop {r4, pc}
_0225E7D0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov31_0225E774

	thumb_func_start ov31_0225E7D4
ov31_0225E7D4: ; 0x0225E7D4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r3, [r4, #0x14]
	ldr r2, _0225E938 ; =0x00000286
	ldrsh r0, [r3, r2]
	cmp r0, #1
	ble _0225E7FA
	sub r0, r2, #3
	mov r1, #0x55
	sub r2, r2, #2
	lsl r1, r1, #2
	ldrb r0, [r3, r0]
	ldrh r2, [r3, r2]
	ldr r1, [r4, r1]
	mov r3, #0
	bl ov31_0225E4EC
	b _0225E80E
_0225E7FA:
	sub r0, r2, #3
	mov r1, #0x55
	sub r2, r2, #2
	lsl r1, r1, #2
	ldrb r0, [r3, r0]
	ldrh r2, [r3, r2]
	ldr r1, [r4, r1]
	mov r3, #0
	bl ov31_0225E4BC
_0225E80E:
	ldr r1, [r4, #0x14]
	ldr r0, _0225E93C ; =0x00000283
	ldrb r2, [r1, r0]
	cmp r2, #4
	bhi _0225E8CC
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225E824: ; jump table
	.short _0225E82E - _0225E824 - 2 ; case 0
	.short _0225E8BC - _0225E824 - 2 ; case 1
	.short _0225E8CC - _0225E824 - 2 ; case 2
	.short _0225E85C - _0225E824 - 2 ; case 3
	.short _0225E8AC - _0225E824 - 2 ; case 4
_0225E82E:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xf
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0xa1
	ldr r1, [r4, #0x14]
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	mov r1, #5
	mov r2, #0xb
	bl GetItemAttr
	add r2, r0, #0
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferPocketName
	b _0225E8DA
_0225E85C:
	add r2, r0, #1
	ldrh r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x9e
	cmp r2, r1
	blo _0225E87E
	sub r0, #0x98
	cmp r2, r0
	bhi _0225E87E
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x31
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0225E8DA
_0225E87E:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xf
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0xa1
	ldr r1, [r4, #0x14]
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	mov r1, #5
	mov r2, #0xb
	bl GetItemAttr
	add r2, r0, #0
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferPocketName
	b _0225E8DA
_0225E8AC:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x31
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0225E8DA
_0225E8BC:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x15
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0225E8DA
_0225E8CC:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x17
	bl NewString_ReadMsgData
	add r5, r0, #0
_0225E8DA:
	mov r1, #0x55
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x34
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	add r0, #0x44
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	ldr r2, _0225E940 ; =0x000001B5
	add r0, #0x44
	mov r1, #1
	mov r3, #5
	bl DrawFrameAndWindow2
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225E944 ; =ov31_0225E948
	mov r2, #0x62
	str r0, [sp, #8]
	lsl r2, r2, #2
	add r0, r4, #0
	ldr r2, [r4, r2]
	add r0, #0x44
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xa
	ldr r2, [r4, #0x14]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0225E938: .word 0x00000286
_0225E93C: .word 0x00000283
_0225E940: .word 0x000001B5
_0225E944: .word ov31_0225E948
	thumb_func_end ov31_0225E7D4

	thumb_func_start ov31_0225E948
ov31_0225E948: ; 0x0225E948
	push {r3, lr}
	cmp r1, #1
	bne _0225E954
	ldr r0, _0225E958 ; =0x00000643
	bl PlaySE
_0225E954:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0225E958: .word 0x00000643
	thumb_func_end ov31_0225E948

	thumb_func_start ov31_0225E95C
ov31_0225E95C: ; 0x0225E95C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225E9C8 ; =0x00000283
	add r4, r1, #0
	ldrb r1, [r5, r0]
	add r1, #0xfd
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #1
	bhi _0225E97A
	sub r0, #0x2f
	ldr r0, [r5, r0]
	bl SavePokeathlon_GetAthletePoints
	b _0225E982
_0225E97A:
	sub r0, #0x3b
	ldr r0, [r5, r0]
	bl PlayerProfile_GetMoney
_0225E982:
	add r1, r0, #0
	add r0, r5, #0
	bl ov03_02257814
	cmp r0, #2
	bne _0225E998
	add r0, r4, #0
	mov r1, #0x19
	bl NewString_ReadMsgData
	pop {r3, r4, r5, pc}
_0225E998:
	cmp r0, #3
	bne _0225E9A6
	add r0, r4, #0
	mov r1, #0x1a
	bl NewString_ReadMsgData
	pop {r3, r4, r5, pc}
_0225E9A6:
	ldr r0, _0225E9C8 ; =0x00000283
	ldrb r0, [r5, r0]
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0225E9BE
	add r0, r4, #0
	mov r1, #0x30
	bl NewString_ReadMsgData
	pop {r3, r4, r5, pc}
_0225E9BE:
	add r0, r4, #0
	mov r1, #0xb
	bl NewString_ReadMsgData
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E9C8: .word 0x00000283
	thumb_func_end ov31_0225E95C

	thumb_func_start ov31_0225E9CC
ov31_0225E9CC: ; 0x0225E9CC
	ldr r2, _0225EA00 ; =0x00000283
	ldrb r0, [r0, r2]
	cmp r0, #0
	bne _0225E9D8
	mov r3, #0x10
	b _0225E9F6
_0225E9D8:
	cmp r0, #1
	bne _0225E9E0
	mov r3, #0x16
	b _0225E9F6
_0225E9E0:
	cmp r0, #2
	bne _0225E9E8
	mov r3, #0x18
	b _0225E9F6
_0225E9E8:
	cmp r0, #3
	bne _0225E9F0
	mov r3, #0x19
	b _0225E9F6
_0225E9F0:
	cmp r0, #4
	bne _0225E9F6
	mov r3, #0x1a
_0225E9F6:
	add r0, r1, #0
	add r1, r3, #0
	ldr r3, _0225EA04 ; =NewString_ReadMsgData
	bx r3
	nop
_0225EA00: .word 0x00000283
_0225EA04: .word NewString_ReadMsgData
	thumb_func_end ov31_0225E9CC

	thumb_func_start ov31_0225EA08
ov31_0225EA08: ; 0x0225EA08
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x56
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, #0x14]
	ldr r1, [r5, r1]
	bl ov31_0225E95C
	mov r1, #0x55
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x44
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EA98 ; =0x000001B5
	mov r3, #5
	bl LoadUserFrameGfx2
	add r0, r5, #0
	ldr r2, _0225EA98 ; =0x000001B5
	add r0, #0x44
	mov r1, #1
	mov r3, #5
	bl DrawFrameAndWindow2
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r2, #0x62
	add r0, r5, #0
	str r3, [sp, #8]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, #0x44
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xa
	ldr r2, [r5, #0x14]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EA98: .word 0x000001B5
	thumb_func_end ov31_0225EA08

	thumb_func_start ov31_0225EA9C
ov31_0225EA9C: ; 0x0225EA9C
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x56
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, #0x14]
	ldr r1, [r5, r1]
	bl ov31_0225E9CC
	mov r1, #0x55
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x44
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EB2C ; =0x000001B5
	mov r3, #5
	bl LoadUserFrameGfx2
	add r0, r5, #0
	ldr r2, _0225EB2C ; =0x000001B5
	add r0, #0x44
	mov r1, #1
	mov r3, #5
	bl DrawFrameAndWindow2
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r2, #0x62
	add r0, r5, #0
	str r3, [sp, #8]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, #0x44
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xa
	ldr r2, [r5, #0x14]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EB2C: .word 0x000001B5
	thumb_func_end ov31_0225EA9C

	thumb_func_start ov31_0225EB30
ov31_0225EB30: ; 0x0225EB30
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x10
	bl NewString_ReadMsgData
	mov r1, #0x55
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x44
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EBC0 ; =0x000001B5
	mov r3, #5
	bl LoadUserFrameGfx2
	add r0, r5, #0
	ldr r2, _0225EBC0 ; =0x000001B5
	add r0, #0x44
	mov r1, #1
	mov r3, #5
	bl DrawFrameAndWindow2
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r2, #0x62
	add r0, r5, #0
	str r3, [sp, #8]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, #0x44
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xa
	ldr r2, [r5, #0x14]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EBC0: .word 0x000001B5
	thumb_func_end ov31_0225EB30

	thumb_func_start ov31_0225EBC4
ov31_0225EBC4: ; 0x0225EBC4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x14
	bl NewString_ReadMsgData
	mov r1, #0x55
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x44
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EC54 ; =0x000001B5
	mov r3, #5
	bl LoadUserFrameGfx2
	add r0, r5, #0
	ldr r2, _0225EC54 ; =0x000001B5
	add r0, #0x44
	mov r1, #1
	mov r3, #5
	bl DrawFrameAndWindow2
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r2, #0x62
	add r0, r5, #0
	str r3, [sp, #8]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, #0x44
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0xa
	ldr r2, [r5, #0x14]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EC54: .word 0x000001B5
	thumb_func_end ov31_0225EBC4

	thumb_func_start ov31_0225EC58
ov31_0225EC58: ; 0x0225EC58
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #7
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r2, #4
	add r1, r4, #0
	str r2, [sp, #8]
	mov r3, #0xc
	str r3, [sp, #0xc]
	mov r0, #0xad
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, #0xe4
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xd9
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0xf4
	mov r2, #4
	mov r3, #0x10
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r1, #0xdf
	str r1, [sp, #0x10]
	add r1, #0x25
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #4
	mov r3, #0x14
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r1, #0xe5
	str r1, [sp, #0x10]
	add r1, #0x2f
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #4
	mov r3, #0xe
	bl AddWindowParameterized
	mov r0, #0xd
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r1, #0xf3
	str r1, [sp, #0x10]
	add r1, #0x31
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #4
	mov r3, #1
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xc
	ldr r1, _0225ED98 ; =0x0000011B
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, #0x19
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #4
	mov r3, #0x17
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	mov r3, #0xc
	ldr r1, _0225ED9C ; =0x00000133
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, #0x11
	ldr r0, [r4, #4]
	add r1, r4, r1
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0xe4
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0xf4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x49
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0225ED98: .word 0x0000011B
_0225ED9C: .word 0x00000133
	thumb_func_end ov31_0225EC58

	thumb_func_start ov31_0225EDA0
ov31_0225EDA0: ; 0x0225EDA0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xe4
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xf4
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x49
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x44
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0xe4
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0xf4
	bl RemoveWindow
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x49
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov31_0225EDA0

	.rodata

_0225EE40:
	.byte 0x00, 0xBF, 0x00, 0xFF

ov31_0225EE44:
	.byte 0x58, 0x6F, 0x78, 0x97, 0x58, 0x6F, 0x98, 0xB7, 0x88, 0x9F, 0x78, 0x97
	.byte 0x88, 0x9F, 0x98, 0xB7, 0xA8, 0xBF, 0x60, 0xAD, 0xA8, 0xBF, 0xB2, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov31_0225EE60:
	.byte 0x20, 0x49, 0x00, 0x7F, 0x20, 0x49, 0x80, 0xFF, 0x4A, 0x75, 0x00, 0x7F, 0x4A, 0x75, 0x80, 0xFF
	.byte 0x76, 0x99, 0x00, 0x7F, 0x76, 0x99, 0x80, 0xFF, 0xA8, 0xBF, 0x00, 0x27, 0xA8, 0xBF, 0x28, 0x4F
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov31_0225EE88: ; 0x0225EE88
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0xAD, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xD9, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x31, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x5D, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x89, 0x01, 0x00, 0x00

ov31_0225EED0: ; 0x0225EED0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov31_0225EEEC: ; 0x0225EEEC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov31_0225EF08: ; 0x0225EF08
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.data

_0225EF40:
	.word ov31_0225EE60
	.word ov31_0225EE44

ov31_0225EF48: ; 0x0225EF48
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x20, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00, 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0A, 0x10, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00, 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0A, 0x20, 0x0A, 0x00, 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x05, 0x00, 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x0A, 0x10, 0x0A, 0x00, 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0F, 0x20, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x0F, 0x10, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x0225F020
