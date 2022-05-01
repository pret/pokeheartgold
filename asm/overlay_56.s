	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov56_021E5C20
ov56_021E5C20: ; 0x021E5C20
	push {r3, r4, r5, lr}
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x29
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0xc4
	mov r2, #0x29
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0xc4
	add r4, r0, #0
	bl memset
	mov r0, #0x29
	str r0, [r4]
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #0x1c]
	ldrh r0, [r0]
	ldr r1, _021E5C98 ; =0x0000FFFF
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	ldr r0, [r4, #0x1c]
	ldrb r0, [r0, #2]
	strb r0, [r4, #0x11]
	ldr r0, [r4, #0x1c]
	ldrb r0, [r0, #3]
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x11]
	strb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x1c]
	strh r1, [r0]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #4]
	bl Options_GetTextFrameDelay
	strb r0, [r4, #0x10]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #4]
	bl Options_GetFrame
	strb r0, [r4, #0xb]
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #8]
	bl sub_020183F0
	strb r0, [r4, #0xa]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5C98: .word 0x0000FFFF
	thumb_func_end ov56_021E5C20

	thumb_func_start ov56_021E5C9C
ov56_021E5C9C: ; 0x021E5C9C
	push {r3, lr}
	bl OverlayManager_GetData
	bl ov56_021E6228
	cmp r0, #0
	beq _021E5CAE
	mov r0, #1
	pop {r3, pc}
_021E5CAE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov56_021E5C9C

	thumb_func_start ov56_021E5CB4
ov56_021E5CB4: ; 0x021E5CB4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [r4, #0x1c]
	ldrb r1, [r4, #0xa]
	ldr r0, [r0, #8]
	ldr r5, [r4]
	bl sub_02018410
	add r0, r6, #0
	bl OverlayManager_FreeData
	add r0, r5, #0
	bl DestroyHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov56_021E5CB4

	thumb_func_start ov56_021E5CE0
ov56_021E5CE0: ; 0x021E5CE0
	push {r4, r5, r6, lr}
	mov r4, #0
	add r6, r0, #0
	add r5, r4, #0
_021E5CE8:
	ldr r0, [r6, #0x1c]
	add r0, #0x1e
	add r0, r0, r5
	bl MailMsg_IsInit
	cmp r0, #0
	beq _021E5CFA
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E5CFA:
	add r4, r4, #1
	add r5, #8
	cmp r4, #3
	blt _021E5CE8
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov56_021E5CE0

	thumb_func_start ov56_021E5D08
ov56_021E5D08: ; 0x021E5D08
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r1, #0
	ldr r0, _021E5D30 ; =0x00007FFF
	str r1, [sp]
	str r0, [sp, #4]
	ldrb r2, [r4, #0x17]
	ldr r0, [r4, #0x30]
	mov r3, #1
	add r2, #0x22
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl sub_02003E5C
	mov r0, #0
	strb r0, [r4, #0x15]
	strb r0, [r4, #0x14]
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E5D30: .word 0x00007FFF
	thumb_func_end ov56_021E5D08

	thumb_func_start ov56_021E5D34
ov56_021E5D34: ; 0x021E5D34
	push {r3, lr}
	bl ov56_021E5D08
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov56_021E5D34

	thumb_func_start ov56_021E5D40
ov56_021E5D40: ; 0x021E5D40
	mov r0, #0
	bx lr
	thumb_func_end ov56_021E5D40

	thumb_func_start ov56_021E5D44
ov56_021E5D44: ; 0x021E5D44
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	bne _021E5D74
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021E5D5A
	mov r0, #0
	pop {r4, pc}
_021E5D5A:
	ldr r0, _021E5DA0 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E5D9A
	ldr r1, [r4, #0x34]
	cmp r1, #0
	beq _021E5D6C
	add r0, r4, #0
	blx r1
_021E5D6C:
	mov r0, #0
	strb r0, [r4, #0xa]
	mov r0, #1
	pop {r4, pc}
_021E5D74:
	ldr r0, _021E5DA0 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E5D80
	mov r0, #0
	pop {r4, pc}
_021E5D80:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021E5D9A
	ldr r1, [r4, #0x38]
	cmp r1, #0
	beq _021E5D92
	add r0, r4, #0
	blx r1
_021E5D92:
	mov r0, #1
	strb r0, [r4, #0xa]
	mov r0, #0
	pop {r4, pc}
_021E5D9A:
	mov r0, #0
	pop {r4, pc}
	nop
_021E5DA0: .word gSystem
	thumb_func_end ov56_021E5D44

	thumb_func_start ov56_021E5DA4
ov56_021E5DA4: ; 0x021E5DA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E5DD4 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _021E5DB6
	mov r0, #0
	strb r0, [r4, #0xa]
	b _021E5DC8
_021E5DB6:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021E5DC4
	mov r0, #1
	strb r0, [r4, #0xa]
	b _021E5DC8
_021E5DC4:
	mov r0, #0
	pop {r4, pc}
_021E5DC8:
	ldr r0, _021E5DD8 ; =0x000005E3
	bl PlaySE
	mov r0, #1
	pop {r4, pc}
	nop
_021E5DD4: .word gSystem
_021E5DD8: .word 0x000005E3
	thumb_func_end ov56_021E5DA4

	thumb_func_start ov56_021E5DDC
ov56_021E5DDC: ; 0x021E5DDC
	push {r3, r4, r5, lr}
	ldr r1, _021E5EEC ; =gSystem
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #1
	add r5, r2, #0
	mov r3, #0
	tst r5, r1
	beq _021E5E52
	ldrb r1, [r4, #0x11]
	cmp r1, #3
	bne _021E5E38
	ldrb r1, [r4, #0x12]
	cmp r1, #0
	bne _021E5E2A
	bl ov56_021E5CE0
	cmp r0, #0
	beq _021E5E10
	ldr r0, _021E5EF0 ; =0x000005DD
	bl PlaySE
	mov r0, #2
	strb r0, [r4, #0xc]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5E10:
	ldr r0, [r4, #0x1c]
	mov r1, #3
	strh r1, [r0]
	ldr r0, _021E5EF4 ; =0x000005E3
	bl PlaySE
	ldr r0, [r4, #0x1c]
	mov r1, #0
	strb r1, [r0, #2]
	ldr r0, [r4, #0x1c]
	strb r1, [r0, #3]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5E2A:
	ldr r0, _021E5EF0 ; =0x000005DD
	bl PlaySE
	mov r0, #3
	strb r0, [r4, #0xc]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5E38:
	ldr r0, [r4, #0x1c]
	strb r1, [r0, #2]
	ldr r1, [r4, #0x1c]
	ldrb r0, [r1, #2]
	strh r0, [r1]
	ldrb r1, [r4, #0x12]
	ldr r0, [r4, #0x1c]
	strb r1, [r0, #3]
	ldr r0, _021E5EF0 ; =0x000005DD
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5E52:
	mov r0, #2
	tst r0, r2
	beq _021E5E66
	ldr r0, _021E5EF0 ; =0x000005DD
	bl PlaySE
	mov r0, #3
	strb r0, [r4, #0xc]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5E66:
	mov r0, #8
	tst r0, r2
	beq _021E5E76
	mov r0, #3
	strb r0, [r4, #0x11]
	strb r3, [r4, #0x12]
	add r3, r1, #0
	b _021E5EC8
_021E5E76:
	mov r0, #0x80
	tst r0, r2
	beq _021E5E92
	ldrb r0, [r4, #0x11]
	add r0, r0, #1
	lsr r3, r0, #0x1f
	lsl r2, r0, #0x1e
	sub r2, r2, r3
	mov r0, #0x1e
	ror r2, r0
	add r0, r3, r2
	strb r0, [r4, #0x11]
	add r3, r1, #0
	b _021E5EC8
_021E5E92:
	mov r0, #0x40
	tst r0, r2
	beq _021E5EAE
	ldrb r0, [r4, #0x11]
	add r0, r0, #3
	lsr r3, r0, #0x1f
	lsl r2, r0, #0x1e
	sub r2, r2, r3
	mov r0, #0x1e
	ror r2, r0
	add r0, r3, r2
	strb r0, [r4, #0x11]
	add r3, r1, #0
	b _021E5EC8
_021E5EAE:
	mov r0, #0x30
	tst r0, r2
	beq _021E5EC4
	ldrb r0, [r4, #0x11]
	cmp r0, #3
	bne _021E5EC8
	ldrb r0, [r4, #0x12]
	add r3, r1, #0
	eor r0, r1
	strb r0, [r4, #0x12]
	b _021E5EC8
_021E5EC4:
	add r0, r3, #0
	pop {r3, r4, r5, pc}
_021E5EC8:
	cmp r3, #0
	bne _021E5ED0
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5ED0:
	ldr r0, _021E5EF8 ; =0x000005DC
	bl PlaySE
	ldrb r1, [r4, #0x11]
	cmp r1, #3
	bne _021E5EE4
	ldrb r0, [r4, #0x12]
	add r0, r1, r0
	strb r0, [r4, #0x16]
	b _021E5EE6
_021E5EE4:
	strb r1, [r4, #0x16]
_021E5EE6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E5EEC: .word gSystem
_021E5EF0: .word 0x000005DD
_021E5EF4: .word 0x000005E3
_021E5EF8: .word 0x000005DC
	thumb_func_end ov56_021E5DDC

	thumb_func_start ov56_021E5EFC
ov56_021E5EFC: ; 0x021E5EFC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021E5FA4 ; =ov56_021E6E20
	bl sub_02025224
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _021E5F18
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5F18:
	mov r1, #1
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E5FA8 ; =gSystem + 0x40
	ldr r0, [r5, #0x18]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	mov r1, #2
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #1
	bne _021E5F3A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5F3A:
	cmp r4, #3
	bne _021E5F4E
	ldr r0, _021E5FAC ; =0x000005DD
	bl PlaySE
	mov r0, #3
	strb r0, [r5, #0xc]
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5F4E:
	bge _021E5F6C
	ldr r0, [r5, #0x1c]
	strb r4, [r0, #2]
	ldr r1, [r5, #0x1c]
	ldrb r0, [r1, #2]
	strh r0, [r1]
	ldrb r1, [r5, #0x12]
	ldr r0, [r5, #0x1c]
	strb r1, [r0, #3]
	ldr r0, _021E5FAC ; =0x000005DD
	bl PlaySE
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5F6C:
	add r0, r5, #0
	bl ov56_021E5CE0
	cmp r0, #0
	beq _021E5F86
	ldr r0, _021E5FAC ; =0x000005DD
	bl PlaySE
	mov r0, #2
	strb r0, [r5, #0xc]
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5F86:
	ldr r0, [r5, #0x1c]
	mov r1, #3
	strh r1, [r0]
	ldr r0, _021E5FB0 ; =0x000005E3
	bl PlaySE
	ldr r0, [r5, #0x1c]
	mov r1, #0
	strb r1, [r0, #2]
	ldr r0, [r5, #0x1c]
	strb r1, [r0, #3]
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021E5FA4: .word ov56_021E6E20
_021E5FA8: .word gSystem + 0x40
_021E5FAC: .word 0x000005DD
_021E5FB0: .word 0x000005E3
	thumb_func_end ov56_021E5EFC

	thumb_func_start ov56_021E5FB4
ov56_021E5FB4: ; 0x021E5FB4
	push {r4, lr}
	add r4, r0, #0
	bl ov56_021E5D44
	cmp r0, #0
	beq _021E5FC4
	mov r0, #0
	pop {r4, pc}
_021E5FC4:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021E5FD2
	add r0, r4, #0
	bl ov56_021E5DDC
	pop {r4, pc}
_021E5FD2:
	add r0, r4, #0
	bl ov56_021E5EFC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov56_021E5FB4

	thumb_func_start ov56_021E5FDC
ov56_021E5FDC: ; 0x021E5FDC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrh r1, [r5, #8]
	mov r0, #0
	add r4, r0, #0
	cmp r1, #0
	beq _021E5FF2
	cmp r1, #1
	beq _021E603E
	b _021E6088
_021E5FF2:
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #1
	mov r2, #0xa
	mov r3, #6
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r1, [r5]
	mov r0, #0x4c
	bl String_ctor
	add r4, r0, #0
	ldr r0, [r5, #0x20]
	mov r1, #2
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6094 ; =0x0001020F
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	b _021E6088
_021E603E:
	ldr r1, _021E6098 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	beq _021E604E
	mov r4, #1
	strb r0, [r5, #0xa]
	b _021E6060
_021E604E:
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E6060
	mov r4, #1
	add r0, r5, #0
	strb r4, [r5, #0xa]
	bl ov56_021E5D08
_021E6060:
	cmp r4, #0
	bne _021E606A
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E606A:
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x9c
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0
	strh r0, [r5, #8]
	ldrb r1, [r5, #0xd]
	add sp, #0x10
	strb r1, [r5, #0xc]
	pop {r3, r4, r5, pc}
_021E6088:
	ldrh r0, [r5, #8]
	add r0, r0, #1
	strh r0, [r5, #8]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6094: .word 0x0001020F
_021E6098: .word gSystem
	thumb_func_end ov56_021E5FDC

	thumb_func_start ov56_021E609C
ov56_021E609C: ; 0x021E609C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021E60F0 ; =0x000001BB
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #0x18
	strb r0, [r1, #0x10]
	mov r0, #0xa
	strb r0, [r1, #0x11]
	ldrb r3, [r1, #0x12]
	mov r0, #0xf
	ldrb r2, [r4, #0xa]
	bic r3, r0
	mov r0, #0xf
	and r0, r2
	orr r0, r3
	strb r0, [r1, #0x12]
	ldrb r2, [r1, #0x12]
	mov r0, #0xf0
	bic r2, r0
	strb r2, [r1, #0x12]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r2, [r4, #0x30]
	add r1, sp, #0
	bl sub_02016704
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021E60F0: .word 0x000001BB
	thumb_func_end ov56_021E609C

	thumb_func_start ov56_021E60F4
ov56_021E60F4: ; 0x021E60F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021E610A
	cmp r0, #2
	beq _021E610E
	b _021E6112
_021E610A:
	mov r4, #1
	b _021E6118
_021E610E:
	mov r4, #0
	b _021E6118
_021E6112:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021E6118:
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_020169C0
	add r6, r0, #0
	ldrb r0, [r5, #0xa]
	cmp r6, r0
	beq _021E613E
	cmp r0, #0
	bne _021E6136
	ldr r1, [r5, #0x34]
	add r0, r5, #0
	blx r1
	b _021E613C
_021E6136:
	ldr r1, [r5, #0x38]
	add r0, r5, #0
	blx r1
_021E613C:
	strb r6, [r5, #0xa]
_021E613E:
	add r5, #0xac
	ldr r0, [r5]
	bl sub_020169CC
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov56_021E60F4

	thumb_func_start ov56_021E614C
ov56_021E614C: ; 0x021E614C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrh r1, [r5, #8]
	cmp r1, #0
	beq _021E6162
	cmp r1, #1
	beq _021E61BC
	cmp r1, #2
	beq _021E61D4
	b _021E6212
_021E6162:
	mov r1, #1
	add r0, #0x9c
	mov r2, #0xa
	mov r3, #6
	strb r1, [r5, #0x13]
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r1, [r5]
	mov r0, #0x4c
	bl String_ctor
	add r4, r0, #0
	ldr r0, [r5, #0x20]
	mov r1, #3
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	ldrb r0, [r5, #0x10]
	mov r1, #1
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, _021E6220 ; =0x0001020F
	str r0, [sp, #8]
	add r0, r5, #0
	str r3, [sp, #0xc]
	add r0, #0x9c
	bl AddTextPrinterParameterized2
	strb r0, [r5, #0xf]
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl ov56_021E5D08
	ldrb r0, [r5, #0x16]
	strb r0, [r5, #0x17]
	b _021E6212
_021E61BC:
	ldrb r0, [r5, #0xf]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021E61CC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E61CC:
	add r0, r5, #0
	bl ov56_021E609C
	b _021E6212
_021E61D4:
	bl ov56_021E60F4
	add r4, r0, #0
	bpl _021E61E2
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E61E2:
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x9c
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0
	strh r0, [r5, #8]
	cmp r4, #0
	beq _021E6208
	ldr r1, _021E6224 ; =0x0000FFFF
	ldr r0, [r5, #0x1c]
	add sp, #0x10
	strh r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6208:
	ldrb r1, [r5, #0xd]
	add sp, #0x10
	strb r1, [r5, #0xc]
	strb r0, [r5, #0x13]
	pop {r3, r4, r5, pc}
_021E6212:
	ldrh r0, [r5, #8]
	add r0, r0, #1
	strh r0, [r5, #8]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6220: .word 0x0001020F
_021E6224: .word 0x0000FFFF
	thumb_func_end ov56_021E614C

	thumb_func_start ov56_021E6228
ov56_021E6228: ; 0x021E6228
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #5
	bls _021E6236
	b _021E639A
_021E6236:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6242: ; jump table
	.short _021E624E - _021E6242 - 2 ; case 0
	.short _021E6294 - _021E6242 - 2 ; case 1
	.short _021E62DE - _021E6242 - 2 ; case 2
	.short _021E62FA - _021E6242 - 2 ; case 3
	.short _021E6334 - _021E6242 - 2 ; case 4
	.short _021E6386 - _021E6242 - 2 ; case 5
_021E624E:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E63A8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E63AC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	b _021E639A
_021E6294:
	bl ov56_021E647C
	cmp r0, #0
	bne _021E62A2
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E62A2:
	ldr r0, _021E63B0 ; =ov56_021E63C0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r1, #4
	ldr r0, _021E63B4 ; =0x04000050
	mov r2, #8
	mov r3, #0x1c
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #5
	ldr r0, [r4, #0x30]
	ldr r2, _021E63B8 ; =0x0000FFFF
	sub r3, r1, #6
	bl sub_02003370
	b _021E639A
_021E62DE:
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	beq _021E62EA
	bl sub_0200D020
_021E62EA:
	ldr r0, [r4, #0x30]
	bl sub_02003B44
	cmp r0, #0
	beq _021E639A
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E62FA:
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6306
	bl sub_0200D020
_021E6306:
	ldrb r1, [r4, #0xc]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _021E63BC ; =ov56_021E6DE4
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _021E631C
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E631C:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #5
	ldr r0, [r4, #0x30]
	ldr r2, _021E63B8 ; =0x0000FFFF
	sub r3, r1, #6
	bl sub_02003370
	b _021E639A
_021E6334:
	ldr r0, [r4, #0x30]
	bl sub_02003B44
	cmp r0, #0
	beq _021E6350
	add r4, #0xb4
	ldr r0, [r4]
	cmp r0, #0
	beq _021E634A
	bl sub_0200D020
_021E634A:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E6350:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E63A8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E63AC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	b _021E639A
_021E6386:
	bl ov56_021E64C8
	cmp r0, #0
	beq _021E6394
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E6394:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E639A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E63A8: .word 0xFFFFE0FF
_021E63AC: .word 0x04001000
_021E63B0: .word ov56_021E63C0
_021E63B4: .word 0x04000050
_021E63B8: .word 0x0000FFFF
_021E63BC: .word ov56_021E6DE4
	thumb_func_end ov56_021E6228

	thumb_func_start ov56_021E63C0
ov56_021E63C0: ; 0x021E63C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _021E63CE
	bl sub_0200398C
_021E63CE:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _021E63DC
	bl sub_0200D034
_021E63DC:
	bl NNS_GfdDoVramTransfer
	ldr r0, [r4, #0x18]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E63F4 ; =0x027E0000
	ldr r1, _021E63F8 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E63F4: .word 0x027E0000
_021E63F8: .word 0x00003FF8
	thumb_func_end ov56_021E63C0

	thumb_func_start ov56_021E63FC
ov56_021E63FC: ; 0x021E63FC
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r1, [r4, #0x30]
	cmp r1, #0
	bne _021E6410
	bl DestroySysTask
	add sp, #8
	pop {r4, pc}
_021E6410:
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	bne _021E6474
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	beq _021E6474
	ldrb r1, [r4, #0x17]
	ldrb r0, [r4, #0x16]
	cmp r1, r0
	beq _021E642E
	add r0, r4, #0
	bl ov56_021E5D08
	ldrb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
_021E642E:
	ldrb r0, [r4, #0x14]
	mov r1, #0
	mov r3, #1
	str r0, [sp]
	ldr r0, _021E6478 ; =0x00007FFF
	str r0, [sp, #4]
	ldrb r2, [r4, #0x16]
	ldr r0, [r4, #0x30]
	add r2, #0x22
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl sub_02003E5C
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x14]
	cmp r0, #0
	beq _021E6464
	sub r0, r1, #1
	strb r0, [r4, #0x14]
	cmp r1, #1
	bne _021E6474
	ldrb r1, [r4, #0x15]
	mov r0, #1
	add sp, #8
	eor r0, r1
	strb r0, [r4, #0x15]
	pop {r4, pc}
_021E6464:
	add r0, r1, #1
	strb r0, [r4, #0x14]
	cmp r1, #0xc
	bne _021E6474
	ldrb r1, [r4, #0x15]
	mov r0, #1
	eor r0, r1
	strb r0, [r4, #0x15]
_021E6474:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E6478: .word 0x00007FFF
	thumb_func_end ov56_021E63FC

	thumb_func_start ov56_021E647C
ov56_021E647C: ; 0x021E647C
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #3
	bhi _021E64BE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6492: ; jump table
	.short _021E649A - _021E6492 - 2 ; case 0
	.short _021E64A0 - _021E6492 - 2 ; case 1
	.short _021E64A6 - _021E6492 - 2 ; case 2
	.short _021E64B2 - _021E6492 - 2 ; case 3
_021E649A:
	bl ov56_021E6514
	b _021E64BE
_021E64A0:
	bl ov56_021E6650
	b _021E64BE
_021E64A6:
	bl ov56_021E696C
	add r0, r4, #0
	bl ov56_021E6AA4
	b _021E64BE
_021E64B2:
	bl ov56_021E6BB4
	mov r0, #0
	strh r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021E64BE:
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov56_021E647C

	thumb_func_start ov56_021E64C8
ov56_021E64C8: ; 0x021E64C8
	push {r4, lr}
	add r4, r0, #0
	bl ov56_021E6D90
	add r0, r4, #0
	add r0, #0x24
	beq _021E64DC
	ldr r0, [r4, #0x20]
	bl DestroyMsgData
_021E64DC:
	add r0, r4, #0
	bl ov56_021E6A7C
	add r0, r4, #0
	bl ov56_021E692C
	add r0, r4, #0
	bl ov56_021E660C
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov56_021E64C8

	thumb_func_start ov56_021E64F4
ov56_021E64F4: ; 0x021E64F4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6510 ; =ov56_021E6E58
	add r3, sp, #0
	mov r2, #5
_021E64FE:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E64FE
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E6510: .word ov56_021E6E58
	thumb_func_end ov56_021E64F4

	thumb_func_start ov56_021E6514
ov56_021E6514: ; 0x021E6514
	push {r4, r5, lr}
	sub sp, #0x9c
	add r4, r0, #0
	bl ov56_021E64F4
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0
	ldr r5, _021E65FC ; =_021E6DD4
	str r0, [r4, #0x18]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r2, _021E6600 ; =0x04000304
	ldr r0, _021E6604 ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _021E6608 ; =ov56_021E6E80
	add r3, sp, #0x10
	and r0, r1
	strh r0, [r2]
	mov r2, #0x11
_021E654A:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E654A
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	ldr r0, [r4, #0x18]
	add r2, sp, #0x10
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #1
	add r2, sp, #0x2c
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #2
	add r2, sp, #0x48
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #3
	add r2, sp, #0x64
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #4
	add r2, sp, #0x80
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	ldr r3, [r4]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E65FC: .word _021E6DD4
_021E6600: .word 0x04000304
_021E6604: .word 0xFFFF7FFF
_021E6608: .word ov56_021E6E80
	thumb_func_end ov56_021E6514

	thumb_func_start ov56_021E660C
ov56_021E660C: ; 0x021E660C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r2, _021E664C ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	pop {r4, pc}
	nop
_021E664C: .word 0x04000304
	thumb_func_end ov56_021E660C

	thumb_func_start ov56_021E6650
ov56_021E6650: ; 0x021E6650
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r1, [r5]
	ldrb r7, [r0, #0x13]
	add r0, r7, #0
	str r0, [sp, #0x20]
	add r0, #0x18
	str r0, [sp, #0x20]
	mov r0, #0x4f
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	add r4, r0, #0
	ldr r0, [r5]
	mov r2, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	mov r3, #4
	bl LoadUserFrameGfx1
	ldrb r0, [r5, #0xb]
	mov r1, #0
	mov r2, #0xa
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #6
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	bl LoadUserFrameGfx2
	add r0, r7, #0
	str r0, [sp, #0x1c]
	add r0, #0xc
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl NARC_GetMemberSize
	add r1, r0, #0
	ldr r0, [r5]
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	add r2, r6, #0
	bl NARC_ReadWholeMember
	add r0, r6, #0
	add r1, sp, #0x28
	bl NNS_G2dGetUnpackedCharacterData
	ldr r3, [sp, #0x28]
	mov r0, #0
	str r0, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r5, #0x18]
	ldr r3, [r3, #0x10]
	mov r1, #1
	bl BG_LoadCharTilesData
	ldr r3, [sp, #0x28]
	mov r0, #0
	str r0, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r5, #0x18]
	ldr r3, [r3, #0x10]
	mov r1, #4
	bl BG_LoadCharTilesData
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	add r1, r7, #0
	bl NARC_GetMemberSize
	add r1, r0, #0
	ldr r0, [r5]
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl NARC_ReadWholeMember
	add r0, r6, #0
	add r1, sp, #0x24
	bl NNS_G2dGetUnpackedPaletteData
	ldr r2, [sp, #0x24]
	mov r0, #4
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #8]
	mov r3, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl BG_LoadPlttData
	ldr r0, [r5]
	bl sub_020030E8
	str r0, [r5, #0x30]
	ldr r3, [r5]
	mov r1, #0
	mov r2, #0xe0
	bl PaletteData_AllocBuffers
	ldr r0, [r5, #0x30]
	ldr r3, [r5]
	mov r1, #2
	mov r2, #0x60
	bl PaletteData_AllocBuffers
	mov r0, #0x60
	str r0, [sp]
	ldr r1, [sp, #0x24]
	mov r2, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r1, #0xc]
	add r3, r2, #0
	bl PaletteData_LoadPalette
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E6768
	mov r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x24]
	ldr r0, [r5, #0x30]
	ldr r1, [r1, #0xc]
	mov r2, #0
	add r1, #0x60
	mov r3, #0x10
	bl PaletteData_LoadPalette
_021E6768:
	mov r0, #2
	str r0, [sp]
	mov r0, #0x60
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r0, [r5, #0x30]
	ldr r3, [r5]
	mov r1, #0x14
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x30
	str r0, [sp, #8]
	ldr r0, [r5, #0x30]
	ldr r3, [r5]
	mov r1, #0x10
	mov r2, #7
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x50
	str r0, [sp, #8]
	ldr r0, [r5, #0x30]
	ldr r3, [r5]
	mov r1, #0x10
	mov r2, #8
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	ldr r0, [r5, #0x30]
	ldr r3, [r5]
	mov r1, #0x26
	mov r2, #0x19
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x60
	str r0, [sp, #8]
	ldrb r2, [r5, #0xb]
	ldr r0, [r5, #0x30]
	ldr r3, [r5]
	mov r1, #0x26
	add r2, #0x1a
	bl PaletteData_LoadNarc
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x30]
	add r2, r1, #0
	mov r3, #0x70
	bl sub_02003E5C
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	ldr r0, [r5, #0x30]
	mov r1, #2
	mov r3, #0x30
	bl sub_02003E5C
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_02003B50
	ldr r0, [r5, #0x30]
	bl sub_0200398C
	add r0, r6, #0
	bl FreeToHeap
	ldr r1, [sp, #0x20]
	add r0, r4, #0
	bl NARC_GetMemberSize
	add r1, r0, #0
	ldr r0, [r5]
	bl AllocFromHeap
	str r0, [r5, #0x3c]
	ldr r1, [sp, #0x20]
	ldr r2, [r5, #0x3c]
	add r0, r4, #0
	bl NARC_ReadWholeMember
	add r1, r5, #0
	ldr r0, [r5, #0x3c]
	add r1, #0x44
	bl NNS_G2dGetUnpackedScreenData
	add r0, r4, #0
	mov r1, #0x24
	bl NARC_GetMemberSize
	add r1, r0, #0
	ldr r0, [r5]
	bl AllocFromHeap
	str r0, [r5, #0x40]
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	mov r1, #0x24
	bl NARC_ReadWholeMember
	add r1, r5, #0
	ldr r0, [r5, #0x40]
	add r1, #0x48
	bl NNS_G2dGetUnpackedScreenData
	add r0, r4, #0
	bl NARC_dtor
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x18]
	ldr r2, _021E691C ; =0x00002001
	mov r1, #4
	bl FillBgTilemapRect
	mov r2, #0
	ldr r0, [r5, #0x44]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x18
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x18]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x18]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x18]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	beq _021E6916
	ldr r0, [r5, #0x48]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x18
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	mov r2, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x18]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x18]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	mov r2, #0
	strb r2, [r5, #0x14]
	ldr r0, _021E6920 ; =ov56_021E63FC
	add r1, r5, #0
	strb r2, [r5, #0x15]
	bl CreateSysTask
	ldr r0, _021E6924 ; =ov56_021E5D40
	str r0, [r5, #0x34]
	ldr r0, _021E6928 ; =ov56_021E5D34
	str r0, [r5, #0x38]
_021E6916:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E691C: .word 0x00002001
_021E6920: .word ov56_021E63FC
_021E6924: .word ov56_021E5D40
_021E6928: .word ov56_021E5D34
	thumb_func_end ov56_021E6650

	thumb_func_start ov56_021E692C
ov56_021E692C: ; 0x021E692C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	bl FreeToHeap
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x30]
	bl sub_02003104
	mov r1, #0
	str r1, [r4, #0x30]
	ldr r0, _021E6968 ; =0x04000050
	add r2, r1, #0
	mov r3, #0x1f
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021E6968: .word 0x04000050
	thumb_func_end ov56_021E692C

	thumb_func_start ov56_021E696C
ov56_021E696C: ; 0x021E696C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r3, #3
	add r6, r0, #0
	str r3, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #1
	add r1, r6, #0
	ldr r0, _021E6A64 ; =0x00000397
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x18]
	add r1, #0x4c
	bl AddWindowParameterized
	mov r0, #8
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #1
	add r1, r6, #0
	ldr r0, _021E6A68 ; =0x0000032F
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x18]
	add r1, #0x5c
	mov r3, #3
	bl AddWindowParameterized
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #1
	add r1, r6, #0
	ldr r0, _021E6A6C ; =0x000002C7
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x18]
	add r1, #0x6c
	mov r3, #3
	bl AddWindowParameterized
	mov r0, #0x14
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r2, #1
	add r1, r6, #0
	ldr r0, _021E6A70 ; =0x000002B7
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x18]
	add r1, #0x7c
	mov r3, #3
	bl AddWindowParameterized
	mov r0, #0x14
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r2, #1
	add r1, r6, #0
	ldr r0, _021E6A74 ; =0x000002A7
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x18]
	add r1, #0x8c
	mov r3, #0x15
	bl AddWindowParameterized
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r0, _021E6A78 ; =0x0000023B
	add r1, r6, #0
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x18]
	add r1, #0x9c
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r4, #0
	add r5, r6, #0
	add r5, #0x4c
	add r7, r4, #0
_021E6A3A:
	add r0, r5, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	cmp r4, #5
	bge _021E6A4C
	add r0, r5, #0
	bl CopyWindowToVram
_021E6A4C:
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _021E6A3A
	ldr r0, [r6]
	bl sub_0201660C
	add r6, #0xac
	str r0, [r6]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E6A64: .word 0x00000397
_021E6A68: .word 0x0000032F
_021E6A6C: .word 0x000002C7
_021E6A70: .word 0x000002B7
_021E6A74: .word 0x000002A7
_021E6A78: .word 0x0000023B
	thumb_func_end ov56_021E696C

	thumb_func_start ov56_021E6A7C
ov56_021E6A7C: ; 0x021E6A7C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_02016624
	mov r5, #0
	add r4, #0x4c
_021E6A8C:
	add r0, r4, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl RemoveWindow
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #6
	blt _021E6A8C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov56_021E6A7C

	thumb_func_start ov56_021E6AA4
ov56_021E6AA4: ; 0x021E6AA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r7, #0
	add r6, r4, #0
	add r5, r7, #0
	add r6, #0x4c
_021E6AB2:
	ldr r0, [r4, #0x1c]
	add r0, #0x1e
	add r0, r0, r5
	bl MailMsg_IsInit
	cmp r0, #0
	beq _021E6AF4
	ldr r0, [r4, #0x1c]
	ldr r1, [r4]
	add r0, #0x1e
	add r0, r0, r5
	bl MailMsg_GetExpandedString
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6BB0 ; =0x00010200
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #1
	mov r3, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl CopyWindowToVram
_021E6AF4:
	add r7, r7, #1
	add r5, #8
	add r6, #0x10
	cmp r7, #3
	blt _021E6AB2
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _021E6B88
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xe9
	bl NewMsgDataFromNarc
	str r0, [r4, #0x20]
	ldr r1, [r4]
	mov r0, #0x10
	bl String_ctor
	add r5, r0, #0
	add r0, r4, #0
	str r0, [sp, #0x18]
	add r0, #0x4c
	mov r6, #0
	str r0, [sp, #0x18]
_021E6B26:
	add r0, r5, #0
	bl StringSetEmpty
	ldr r0, [r4, #0x20]
	add r1, r6, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r0, #1
	add r1, r5, #0
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0x40
	sub r7, r1, r0
	add r0, r6, #3
	lsl r0, r0, #4
	str r0, [sp, #0x14]
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021E6BB0 ; =0x00010200
	lsr r3, r7, #0x1f
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r3, r7, r3
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r2, r5, #0
	add r0, r0, r1
	mov r1, #1
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	bl CopyWindowToVram
	add r6, r6, #1
	cmp r6, #2
	blt _021E6B26
	add r0, r5, #0
	bl String_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_021E6B88:
	mov r1, #1
	str r1, [sp]
	mov r3, #0
	ldr r0, _021E6BB0 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r4, #0x1c]
	add r0, r4, #0
	ldr r2, [r2, #0x14]
	add r0, #0x8c
	bl AddTextPrinterParameterized2
	add r4, #0x8c
	add r0, r4, #0
	bl CopyWindowToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6BB0: .word 0x00010200
	thumb_func_end ov56_021E6AA4

	thumb_func_start ov56_021E6BB4
ov56_021E6BB4: ; 0x021E6BB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x94
	add r5, r0, #0
	bl sub_0203A964
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E6BC6
	b _021E6D7C
_021E6BC6:
	ldr r1, [r5]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r5]
	bl sub_0200CF18
	add r1, r5, #0
	add r1, #0xb0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r5, #0
	add r1, #0xb4
	add r2, sp, #0x40
	ldr r4, _021E6D80 ; =ov56_021E6E38
	str r0, [r1]
	ldmia r4!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	ldr r6, _021E6D84 ; =ov56_021E6DF4
	stmia r2!, {r0, r1}
	add r4, sp, #0x2c
	ldmia r6!, {r0, r1}
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r6]
	ldr r6, _021E6D88 ; =ov56_021E6E08
	str r0, [r4]
	add r4, sp, #0x14
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r5, #0
	add r0, #0xb0
	add r1, r3, #0
	ldr r0, [r0]
	mov r3, #0x20
	bl sub_0200CF70
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xb0
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #3
	bl sub_0200CFF4
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xb0
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x14
	bl sub_0200D3F8
	ldr r0, [r5]
	bl sub_0200B2E0
	bl sub_02074490
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xb0
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x14
	bl sub_0200D564
	bl sub_02074494
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xb0
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xb0
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x14
	bl sub_0200D704
	mov r6, #0
	add r4, r6, #0
	str r6, [sp, #0x10]
	add r7, r5, #0
_021E6CC4:
	ldr r0, [r5, #0x1c]
	add r3, r0, r4
	ldrh r1, [r3, #0x18]
	ldr r0, _021E6D8C ; =0x0000FFFF
	cmp r1, r0
	beq _021E6D7C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrh r3, [r3, #0x18]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xb0
	add r1, #0xb4
	lsl r3, r3, #0x14
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x14
	lsr r3, r3, #0x14
	bl sub_0200E128
	add r0, sp, #0x60
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	ldr r0, [sp, #0x10]
	mov r1, #0x80
	sub r1, r1, r0
	add r0, sp, #0x60
	strh r1, [r0]
	mov r1, #0xa0
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #2
	str r0, [sp, #0x8c]
	ldr r0, [r5, #0x1c]
	add r2, sp, #0x60
	add r0, r0, r4
	ldrh r0, [r0, #0x18]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1c
	str r0, [sp, #0x6c]
	add r0, r1, #0
	str r0, [sp, #0x90]
	mov r0, #1
	str r0, [sp, #0x70]
	add r0, r1, #0
	str r0, [sp, #0x78]
	str r0, [sp, #0x7c]
	str r0, [sp, #0x80]
	sub r0, r1, #1
	str r0, [sp, #0x84]
	sub r0, r1, #1
	str r0, [sp, #0x88]
	add r0, r5, #0
	add r1, r5, #0
	str r6, [sp, #0x74]
	add r0, #0xb0
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D734
	add r1, r7, #0
	add r1, #0xb8
	str r0, [r1]
	ldr r0, [r5, #0x1c]
	add r0, r0, r4
	ldrh r0, [r0, #0x18]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x14
	cmp r0, #7
	bne _021E6D6C
	add r0, r7, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
_021E6D6C:
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r0, #0x28
	add r4, r4, #2
	add r7, r7, #4
	str r0, [sp, #0x10]
	cmp r6, #3
	blt _021E6CC4
_021E6D7C:
	add sp, #0x94
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6D80: .word ov56_021E6E38
_021E6D84: .word ov56_021E6DF4
_021E6D88: .word ov56_021E6E08
_021E6D8C: .word 0x0000FFFF
	thumb_func_end ov56_021E6BB4

	thumb_func_start ov56_021E6D90
ov56_021E6D90: ; 0x021E6D90
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	bne _021E6DD0
	mov r4, #0
	add r5, r6, #0
_021E6D9E:
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6DAC
	bl sub_0200D9DC
_021E6DAC:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021E6D9E
	add r0, r6, #0
	add r1, r6, #0
	add r0, #0xb0
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D998
	add r6, #0xb0
	ldr r0, [r6]
	bl sub_0200D108
	bl GF_DestroyVramTransferManager
_021E6DD0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov56_021E6D90

	.rodata

_021E6DD4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov56_021E6DE4: ; 0x021E6DE4
	.word ov56_021E5DA4
	.word ov56_021E5FB4
	.word ov56_021E5FDC
	.word ov56_021E614C

ov56_021E6DF4: ; 0x021E6DF4
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov56_021E6E08: ; 0x021E6E08
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov56_021E6E20: ; 0x021E6E20
	.byte 0x18, 0x38, 0x18, 0xE8, 0x40, 0x60, 0x18, 0xE8, 0x68, 0x88, 0x18, 0xE8, 0x94, 0xAC, 0xA0, 0xE0
	.byte 0x94, 0xAC, 0x18, 0x58, 0xFF, 0x00, 0x00, 0x00

ov56_021E6E38: ; 0x021E6E38
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov56_021E6E58: ; 0x021E6E58
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov56_021E6E80: ; 0x021E6E80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x021E6F0C
