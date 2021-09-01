	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0201F79C
sub_0201F79C: ; 0x0201F79C
	str r0, [r1]
	add r0, r0, #4
	str r0, [r1, #8]
	str r0, [r1, #4]
	mov r0, #0
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	str r0, [r1, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201F79C

	thumb_func_start sub_0201F7B0
sub_0201F7B0: ; 0x0201F7B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	mov r7, #0
	cmp r0, #0
	ble _0201F7DE
	add r4, r7, #0
	add r6, r7, #0
_0201F7C0:
	ldr r1, [r5, #0x24]
	add r0, r5, #0
	add r1, r1, r4
	bl sub_0201F79C
	ldr r0, [r5, #0x24]
	add r7, r7, #1
	add r1, r0, r4
	ldr r0, [r5, #0x20]
	add r4, #0x1c
	str r1, [r0, r6]
	ldrh r0, [r5]
	add r6, r6, #4
	cmp r7, r0
	blt _0201F7C0
_0201F7DE:
	mov r0, #0
	strh r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0201F7B0

	thumb_func_start sub_0201F7E4
sub_0201F7E4: ; 0x0201F7E4
	ldrh r3, [r0, #2]
	ldrh r1, [r0]
	cmp r3, r1
	bne _0201F7F0
	mov r0, #0
	bx lr
_0201F7F0:
	ldr r2, [r0, #0x20]
	lsl r1, r3, #2
	ldr r2, [r2, r1]
	add r1, r3, #1
	strh r1, [r0, #2]
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201F7E4

	thumb_func_start sub_0201F800
sub_0201F800: ; 0x0201F800
	ldrh r2, [r0, #2]
	cmp r2, #0
	bne _0201F80A
	mov r0, #0
	bx lr
_0201F80A:
	str r0, [r1]
	add r2, r0, #4
	str r2, [r1, #8]
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	ldrh r2, [r0, #2]
	sub r2, r2, #1
	strh r2, [r0, #2]
	ldr r2, [r0, #0x20]
	ldrh r0, [r0, #2]
	lsl r0, r0, #2
	str r1, [r2, r0]
	mov r0, #1
	bx lr
	thumb_func_end sub_0201F800

	thumb_func_start sub_0201F82C
sub_0201F82C: ; 0x0201F82C
	lsl r0, r0, #5
	add r0, #0x34
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201F82C

	thumb_func_start sub_0201F834
sub_0201F834: ; 0x0201F834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _0201F840
	bl GF_AssertFail
_0201F840:
	add r1, r4, #0
	add r1, #0x34
	lsl r0, r5, #2
	str r1, [r4, #0x20]
	add r0, r1, r0
	str r0, [r4, #0x24]
	strh r5, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	str r0, [r4, #0x28]
	add r0, r4, #0
	bl sub_0201F860
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201F834

	thumb_func_start sub_0201F860
sub_0201F860: ; 0x0201F860
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F7B0
	str r4, [r4, #4]
	add r0, r4, #4
	str r0, [r4, #0xc]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0201F860

	thumb_func_start sub_0201F880
sub_0201F880: ; 0x0201F880
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _0201F8BC
	ldr r1, [r5, #0xc]
	add r4, r5, #4
	str r1, [r5, #0x2c]
	cmp r1, r4
	beq _0201F8B8
	mov r6, #0
_0201F896:
	ldr r0, [r1, #8]
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x2c]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _0201F8AE
	ldr r2, [r0, #0x14]
	cmp r2, #0
	beq _0201F8B0
	ldr r1, [r0, #0x10]
	blx r2
	b _0201F8B0
_0201F8AE:
	str r6, [r0, #0x18]
_0201F8B0:
	ldr r1, [r5, #0x30]
	str r1, [r5, #0x2c]
	cmp r1, r4
	bne _0201F896
_0201F8B8:
	mov r0, #0
	str r0, [r1, #0x14]
_0201F8BC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0201F880

	thumb_func_start sub_0201F8C0
sub_0201F8C0: ; 0x0201F8C0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #1
	str r5, [r4, #0x28]
	bl sub_0201F8D4
	mov r1, #0
	str r1, [r4, #0x28]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201F8C0

	thumb_func_start sub_0201F8D4
sub_0201F8D4: ; 0x0201F8D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_0201F7E4
	cmp r0, #0
	bne _0201F8EA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F8EA:
	str r4, [r0, #0xc]
	str r7, [r0, #0x10]
	str r6, [r0, #0x14]
	ldr r2, [r5, #0x2c]
	ldr r1, [r2, #0x14]
	cmp r1, #0
	beq _0201F90A
	ldr r1, [r2, #0xc]
	cmp r1, r4
	bhi _0201F904
	mov r1, #1
	str r1, [r0, #0x18]
	b _0201F90E
_0201F904:
	mov r1, #0
	str r1, [r0, #0x18]
	b _0201F90E
_0201F90A:
	mov r1, #0
	str r1, [r0, #0x18]
_0201F90E:
	ldr r3, [r5, #0xc]
	add r2, r5, #4
	cmp r3, r2
	beq _0201F93A
	ldr r4, [r0, #0xc]
_0201F918:
	ldr r1, [r3, #0xc]
	cmp r1, r4
	bls _0201F934
	ldr r1, [r3, #4]
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r3, #4]
	str r0, [r1, #8]
	str r0, [r3, #4]
	ldr r1, [r5, #0x30]
	cmp r3, r1
	bne _0201F952
	str r0, [r5, #0x30]
	pop {r3, r4, r5, r6, r7, pc}
_0201F934:
	ldr r3, [r3, #8]
	cmp r3, r2
	bne _0201F918
_0201F93A:
	ldr r2, [r5, #0x30]
	add r1, r5, #4
	cmp r2, r1
	bne _0201F944
	str r0, [r5, #0x30]
_0201F944:
	ldr r1, [r5, #8]
	str r1, [r0, #4]
	add r1, r5, #4
	str r1, [r0, #8]
	ldr r1, [r5, #8]
	str r0, [r1, #8]
	str r0, [r5, #8]
_0201F952:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0201F8D4

	thumb_func_start sub_0201F954
sub_0201F954: ; 0x0201F954
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0201F962
	bl GF_AssertFail
_0201F962:
	ldr r1, [r4]
	ldr r0, [r1, #0x30]
	cmp r0, r4
	bne _0201F96E
	ldr r0, [r4, #8]
	str r0, [r1, #0x30]
_0201F96E:
	ldr r1, [r4, #8]
	ldr r0, [r4, #4]
	str r1, [r0, #8]
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	str r1, [r0, #4]
	ldr r0, [r4]
	add r1, r4, #0
	bl sub_0201F800
	pop {r4, pc}
	thumb_func_end sub_0201F954

	thumb_func_start sub_0201F984
sub_0201F984: ; 0x0201F984
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_0201F984

	thumb_func_start sub_0201F988
sub_0201F988: ; 0x0201F988
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_0201F988

	thumb_func_start sub_0201F98C
sub_0201F98C: ; 0x0201F98C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0201F98C

	thumb_func_start sub_0201F990
sub_0201F990: ; 0x0201F990
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r6, r1, #0
	add r4, r0, #0
	add r5, r2, #0
	ldmia r6!, {r0, r1}
	add r2, sp, #0x1c
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	add r7, r3, #0
	str r0, [r2]
	cmp r4, #0
	beq _0201F9AE
	add r4, #0x14
	b _0201F9B0
_0201F9AE:
	mov r4, #0
_0201F9B0:
	mov r0, #0x20
	ldrsh r0, [r4, r0]
	mov r1, #0x1a
	mov r2, #0x1c
	str r0, [sp]
	mov r0, #0x22
	ldrsh r0, [r4, r0]
	mov r3, #0x1e
	str r0, [sp, #4]
	add r0, sp, #0x28
	str r0, [sp, #8]
	mov r0, #0x18
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	bl sub_0201FAA4
	add r0, sp, #0x1c
	bl NNS_G3dGlbSetBaseTrans
	ldr r1, _0201FA2C ; =0x021DA558
	add r0, r5, #0
	bl MI_Copy36B
	ldr r1, _0201FA30 ; =0x021DA51C
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	add r0, r7, #0
	str r2, [r1, #0x7c]
	bl NNS_G3dGlbSetBaseScale
	bl NNS_G3dGlbFlushP
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl sub_020C2528
	ldr r0, [r4, #0x24]
	add r1, sp, #0x10
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	mov r0, #0x1b
	mov r2, #3
	bl sub_020C2528
	add r0, sp, #0x28
	bl sub_0201FAC8
	add r4, r0, #0
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	bl sub_020C2528
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0201FA2C: .word 0x021DA558
_0201FA30: .word 0x021DA51C
	thumb_func_end sub_0201F990

	thumb_func_start sub_0201FA34
sub_0201FA34: ; 0x0201FA34
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #2
	ldrsh r0, [r4, r0]
	str r0, [sp]
	mov r0, #4
	ldrsh r0, [r4, r0]
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	mov r0, #0
	ldrsh r3, [r4, r0]
	add r1, r0, #0
	add r2, r0, #0
	bl sub_0201FAA4
	add r0, r5, #0
	bl NNS_G3dGlbSetBaseTrans
	bl NNS_G3dGlbFlushP
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl sub_020C2528
	ldr r0, [r4, #0x10]
	lsl r2, r0, #0xc
	ldr r0, [r4, #0xc]
	lsl r1, r0, #0xc
	ldr r0, [r4, #8]
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	mov r0, #0x1b
	add r1, sp, #0x10
	mov r2, #3
	bl sub_020C2528
	add r0, sp, #0x1c
	bl sub_0201FAC8
	add r4, r0, #0
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	bl sub_020C2528
	add r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201FA34

	thumb_func_start sub_0201FAA4
sub_0201FAA4: ; 0x0201FAA4
	push {r3, r4}
	ldr r4, [sp, #0x10]
	strh r0, [r4]
	strh r1, [r4, #2]
	ldr r1, _0201FAC4 ; =0xFFFFFFF8
	strh r2, [r4, #4]
	strh r3, [r4, #6]
	add r1, sp
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	strh r0, [r4, #8]
	mov r0, #0x14
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0xa]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0201FAC4: .word 0xFFFFFFF8
	thumb_func_end sub_0201FAA4

	thumb_func_start sub_0201FAC8
sub_0201FAC8: ; 0x0201FAC8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0201FB18 ; =0x000030C1
	mov r2, #1
	str r0, [sp, #4]
	mov r0, #0x29
	add r1, sp, #4
	str r2, [sp, #8]
	bl sub_020C2528
	mov r0, #0
	str r0, [sp]
	mov r0, #0x40
	add r1, sp, #0
	mov r2, #1
	bl sub_020C2528
	mov r1, #0
	mov r0, #0x41
	add r2, r1, #0
	bl sub_020C2528
	mov r0, #0x70
	add r1, r4, #0
	mov r2, #3
	bl sub_020C2528
	bl sub_020C23F4
	add r4, sp, #8
_0201FB06:
	add r0, r4, #0
	bl sub_020CFA38
	cmp r0, #0
	bne _0201FB06
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0201FB18: .word 0x000030C1
	thumb_func_end sub_0201FAC8

	thumb_func_start MsgArray_SkipControlCode
MsgArray_SkipControlCode: ; 0x0201FB1C
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0201FB40 ; =0x0000FFFE
	cmp r1, r0
	beq _0201FB2C
	bl GF_AssertFail
_0201FB2C:
	ldrh r1, [r4]
	ldr r0, _0201FB40 ; =0x0000FFFE
	cmp r1, r0
	bne _0201FB3C
	ldrh r0, [r4, #4]
	add r1, r4, #6
	lsl r0, r0, #1
	add r4, r1, r0
_0201FB3C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0201FB40: .word 0x0000FFFE
	thumb_func_end MsgArray_SkipControlCode

	thumb_func_start MsgArray_GetControlCode
MsgArray_GetControlCode: ; 0x0201FB44
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0201FB58 ; =0x0000FFFE
	cmp r1, r0
	beq _0201FB54
	bl GF_AssertFail
_0201FB54:
	ldrh r0, [r4, #2]
	pop {r4, pc}
	.balign 4, 0
_0201FB58: .word 0x0000FFFE
	thumb_func_end MsgArray_GetControlCode

	thumb_func_start MsgArray_ControlCodeIsStrVar
MsgArray_ControlCodeIsStrVar: ; 0x0201FB5C
	push {r3, lr}
	bl MsgArray_GetControlCode
	mov r1, #0xff
	lsl r1, r1, #8
	add r2, r0, #0
	and r2, r1
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	beq _0201FB88
	mov r0, #3
	lsl r0, r0, #8
	cmp r2, r0
	beq _0201FB88
	lsl r0, r1, #2
	cmp r2, r0
	beq _0201FB88
	mov r0, #0xd
	lsl r0, r0, #0xa
	cmp r2, r0
	bne _0201FB8C
_0201FB88:
	mov r0, #1
	pop {r3, pc}
_0201FB8C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end MsgArray_ControlCodeIsStrVar

	thumb_func_start MsgArray_ControlCodeGetField
MsgArray_ControlCodeGetField: ; 0x0201FB90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrh r1, [r5]
	ldr r0, _0201FBB4 ; =0x0000FFFE
	cmp r1, r0
	beq _0201FBA2
	bl GF_AssertFail
_0201FBA2:
	ldrh r0, [r5, #4]
	cmp r4, r0
	blo _0201FBAC
	bl GF_AssertFail
_0201FBAC:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #6]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0201FBB4: .word 0x0000FFFE
	thumb_func_end MsgArray_ControlCodeGetField

	thumb_func_start sub_0201FBB8
sub_0201FBB8: ; 0x0201FBB8
	push {r4, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r0, r1
	blo _0201FBC6
	mov r0, #0
	pop {r4, pc}
_0201FBC6:
	bl sub_0201FCD4
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0201FC28 ; =0x021094DC
	ldrsh r4, [r0, r1]
	add r0, r4, #0
	bl _itof
	ldr r1, _0201FC2C ; =0x45800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _0201FC06
	add r0, r4, #0
	bl _itof
	ldr r1, _0201FC2C ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FC2C ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0201FC22
_0201FC06:
	add r0, r4, #0
	bl _itof
	ldr r1, _0201FC2C ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FC2C ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0201FC22:
	bl _ftoi
	pop {r4, pc}
	.balign 4, 0
_0201FC28: .word 0x021094DC
_0201FC2C: .word 0x45800000
	thumb_func_end sub_0201FBB8

	thumb_func_start sub_0201FC30
sub_0201FC30: ; 0x0201FC30
	push {r4, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r0, r1
	blo _0201FC3E
	mov r0, #0
	pop {r4, pc}
_0201FC3E:
	bl sub_0201FCD4
	asr r0, r0, #4
	lsl r0, r0, #1
	add r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _0201FCA4 ; =0x021094DC
	ldrsh r4, [r0, r1]
	add r0, r4, #0
	bl _itof
	ldr r1, _0201FCA8 ; =0x45800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _0201FC82
	add r0, r4, #0
	bl _itof
	ldr r1, _0201FCA8 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FCA8 ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0201FC9E
_0201FC82:
	add r0, r4, #0
	bl _itof
	ldr r1, _0201FCA8 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FCA8 ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0201FC9E:
	bl _ftoi
	pop {r4, pc}
	.balign 4, 0
_0201FCA4: .word 0x021094DC
_0201FCA8: .word 0x45800000
	thumb_func_end sub_0201FC30

	thumb_func_start sub_0201FCAC
sub_0201FCAC: ; 0x0201FCAC
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FBB8
	pop {r3, pc}
	thumb_func_end sub_0201FCAC

	thumb_func_start sub_0201FCC0
sub_0201FCC0: ; 0x0201FCC0
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FC30
	pop {r3, pc}
	thumb_func_end sub_0201FCC0

	thumb_func_start sub_0201FCD4
sub_0201FCD4: ; 0x0201FCD4
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r0, r1
	blo _0201FCE2
	mov r0, #0
	pop {r3, pc}
_0201FCE2:
	lsl r0, r0, #0xc
	ldr r2, _0201FCF8 ; =0x0B60B60B
	asr r1, r0, #0x1f
	mov r3, #0xb6
	bl _ll_mul
	ldr r0, _0201FCFC ; =0x00000800
	adc r1, r0
	lsl r0, r1, #4
	lsr r0, r0, #0x10
	pop {r3, pc}
	.balign 4, 0
_0201FCF8: .word 0x0B60B60B
_0201FCFC: .word 0x00000800
	thumb_func_end sub_0201FCD4

	thumb_func_start sub_0201FD00
sub_0201FD00: ; 0x0201FD00
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FCD4
	pop {r3, pc}
	thumb_func_end sub_0201FD00

	thumb_func_start sub_0201FD14
sub_0201FD14: ; 0x0201FD14
	ldr r3, _0201FD1C ; =sub_0201FCAC
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bx r3
	.balign 4, 0
_0201FD1C: .word sub_0201FCAC
	thumb_func_end sub_0201FD14

	thumb_func_start sub_0201FD20
sub_0201FD20: ; 0x0201FD20
	ldr r3, _0201FD28 ; =sub_0201FCC0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bx r3
	.balign 4, 0
_0201FD28: .word sub_0201FCC0
	thumb_func_end sub_0201FD20

	thumb_func_start sub_0201FD2C
sub_0201FD2C: ; 0x0201FD2C
	ldr r0, _0201FD34 ; =0x021D15A4
	ldr r0, [r0, #4]
	bx lr
	nop
_0201FD34: .word 0x021D15A4
	thumb_func_end sub_0201FD2C

	thumb_func_start SetLCRNGSeed
SetLCRNGSeed: ; 0x0201FD38
	ldr r1, _0201FD40 ; =0x021D15A4
	str r0, [r1, #4]
	bx lr
	nop
_0201FD40: .word 0x021D15A4
	thumb_func_end SetLCRNGSeed

	thumb_func_start sub_0201FD44
sub_0201FD44: ; 0x0201FD44
	ldr r1, _0201FD5C ; =0x021D15A4
	ldr r0, _0201FD60 ; =0x41C64E6D
	ldr r2, [r1, #4]
	add r3, r2, #0
	mul r3, r0
	ldr r0, _0201FD64 ; =0x00006073
	add r0, r3, r0
	str r0, [r1, #4]
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	.balign 4, 0
_0201FD5C: .word 0x021D15A4
_0201FD60: .word 0x41C64E6D
_0201FD64: .word 0x00006073
	thumb_func_end sub_0201FD44

	thumb_func_start sub_0201FD68
sub_0201FD68: ; 0x0201FD68
	ldr r1, _0201FD70 ; =0x6C078965
	mul r1, r0
	add r0, r1, #1
	bx lr
	.balign 4, 0
_0201FD70: .word 0x6C078965
	thumb_func_end sub_0201FD68

	thumb_func_start SetMTRNGSeed
SetMTRNGSeed: ; 0x0201FD74
	push {r4, r5}
	ldr r1, _0201FDA8 ; =0x021D15A4
	mov r4, #0x27
	str r0, [r1, #8]
	ldr r1, _0201FDAC ; =0x0210F6CC
	mov r0, #1
	str r0, [r1]
	ldr r1, _0201FDB0 ; =0x021D15B0
	ldr r3, _0201FDB4 ; =0x6C078965
	lsl r4, r4, #4
_0201FD88:
	sub r2, r1, #4
	ldr r5, [r2]
	lsr r2, r5, #0x1e
	eor r2, r5
	add r5, r2, #0
	mul r5, r3
	add r2, r0, r5
	add r0, r0, #1
	stmia r1!, {r2}
	cmp r0, r4
	blt _0201FD88
	ldr r1, _0201FDAC ; =0x0210F6CC
	str r0, [r1]
	pop {r4, r5}
	bx lr
	nop
_0201FDA8: .word 0x021D15A4
_0201FDAC: .word 0x0210F6CC
_0201FDB0: .word 0x021D15B0
_0201FDB4: .word 0x6C078965
	thumb_func_end SetMTRNGSeed

	thumb_func_start sub_0201FDB8
sub_0201FDB8: ; 0x0201FDB8
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _0201FE9C ; =0x0210F6CC
	ldr r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	cmp r1, r0
	blt _0201FE70
	add r0, r0, #1
	cmp r1, r0
	bne _0201FDD2
	ldr r0, _0201FEA0 ; =0x00001571
	bl SetMTRNGSeed
_0201FDD2:
	ldr r4, _0201FEA4 ; =0x021D15AC
	ldr r1, _0201FEA8 ; =0x0210F6D0
	ldr r5, _0201FEAC ; =0x7FFFFFFF
	ldr r6, _0201FEB0 ; =0x00000634
	mov r0, #0
_0201FDDC:
	mov r2, #2
	ldr r3, [r4]
	lsl r2, r2, #0x1e
	and r3, r2
	ldr r2, [r4, #4]
	add r0, r0, #1
	and r2, r5
	orr r3, r2
	lsr r7, r3, #1
	lsl r3, r3, #0x1f
	ldr r2, [r4, r6]
	lsr r3, r3, #0x1d
	ldr r3, [r1, r3]
	eor r2, r7
	eor r2, r3
	stmia r4!, {r2}
	cmp r0, #0xe3
	blt _0201FDDC
	ldr r1, _0201FEB4 ; =0x0000026F
	cmp r0, r1
	bge _0201FE3C
	ldr r2, _0201FEA4 ; =0x021D15AC
	lsl r1, r0, #2
	add r1, r2, r1
	mov r2, #0xe3
	ldr r4, _0201FEA8 ; =0x0210F6D0
	ldr r3, _0201FEB4 ; =0x0000026F
	lsl r2, r2, #2
_0201FE14:
	mov r5, #2
	ldr r6, [r1]
	lsl r5, r5, #0x1e
	and r5, r6
	ldr r7, [r1, #4]
	ldr r6, _0201FEAC ; =0x7FFFFFFF
	add r0, r0, #1
	and r6, r7
	orr r6, r5
	lsr r5, r6, #1
	sub r7, r1, r2
	lsl r6, r6, #0x1f
	ldr r7, [r7]
	lsr r6, r6, #0x1d
	ldr r6, [r4, r6]
	eor r5, r7
	eor r5, r6
	stmia r1!, {r5}
	cmp r0, r3
	blt _0201FE14
_0201FE3C:
	ldr r2, _0201FEB8 ; =0x021D1F24
	mov r0, #2
	ldr r1, [r2, #0x44]
	lsl r0, r0, #0x1e
	add r3, r1, #0
	ldr r1, _0201FEBC ; =0x021D15A4
	and r3, r0
	ldr r1, [r1, #8]
	sub r0, r0, #1
	and r0, r1
	add r4, r3, #0
	orr r4, r0
	ldr r0, _0201FEC0 ; =0x021D1BA4
	ldr r1, [r0, #0x38]
	lsr r0, r4, #1
	add r3, r1, #0
	eor r3, r0
	lsl r0, r4, #0x1f
	lsr r1, r0, #0x1d
	ldr r0, _0201FEA8 ; =0x0210F6D0
	ldr r0, [r0, r1]
	mov r1, #0
	eor r0, r3
	str r0, [r2, #0x44]
	ldr r0, _0201FE9C ; =0x0210F6CC
	str r1, [r0]
_0201FE70:
	ldr r0, _0201FE9C ; =0x0210F6CC
	ldr r2, [r0]
	add r1, r2, #1
	str r1, [r0]
	ldr r0, _0201FEA4 ; =0x021D15AC
	lsl r1, r2, #2
	ldr r1, [r0, r1]
	lsr r0, r1, #0xb
	add r2, r1, #0
	eor r2, r0
	ldr r0, _0201FEC4 ; =0x9D2C5680
	lsl r1, r2, #7
	and r0, r1
	eor r2, r0
	ldr r0, _0201FEC8 ; =0xEFC60000
	lsl r1, r2, #0xf
	and r0, r1
	add r1, r2, #0
	eor r1, r0
	lsr r0, r1, #0x12
	eor r0, r1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201FE9C: .word 0x0210F6CC
_0201FEA0: .word 0x00001571
_0201FEA4: .word 0x021D15AC
_0201FEA8: .word 0x0210F6D0
_0201FEAC: .word 0x7FFFFFFF
_0201FEB0: .word 0x00000634
_0201FEB4: .word 0x0000026F
_0201FEB8: .word 0x021D1F24
_0201FEBC: .word 0x021D15A4
_0201FEC0: .word 0x021D1BA4
_0201FEC4: .word 0x9D2C5680
_0201FEC8: .word 0xEFC60000
	thumb_func_end sub_0201FDB8

	thumb_func_start sub_0201FECC
sub_0201FECC: ; 0x0201FECC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, sp, #0
	ldrb r0, [r0, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #1
	bne _0201FEE6
	ldr r0, _0201FF20 ; =0x0000FFFF
	mul r0, r1
	lsl r0, r0, #8
	lsr r1, r0, #0x10
	b _0201FEFA
_0201FEE6:
	cmp r0, #2
	bne _0201FEFA
	ldr r0, _0201FF20 ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
_0201FEFA:
	asr r0, r1, #4
	lsl r3, r0, #1
	lsl r1, r3, #1
	ldr r2, _0201FF24 ; =0x021094DC
	add r3, r3, #1
	lsl r3, r3, #1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, r5, #0
	bl MTX_Rot22_
	add r0, r5, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl MTX_ScaleApply22
	pop {r4, r5, r6, pc}
	nop
_0201FF20: .word 0x0000FFFF
_0201FF24: .word 0x021094DC
	thumb_func_end sub_0201FECC

	thumb_func_start sub_0201FF28
sub_0201FF28: ; 0x0201FF28
	push {r3, r4}
	mov r3, #0
	add r4, r3, #0
	cmp r1, #0
	bls _0201FF3E
_0201FF32:
	ldrb r2, [r0]
	add r4, r4, #1
	add r0, r0, #1
	add r3, r3, r2
	cmp r4, r1
	blo _0201FF32
_0201FF3E:
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0201FF28

	thumb_func_start sub_0201FF44
sub_0201FF44: ; 0x0201FF44
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	lsr r6, r1, #1
	beq _0201FF66
	add r7, sp, #0x20
_0201FF52:
	add r0, r7, #0
	bl sub_0201FF78
	ldrh r1, [r5]
	add r4, r4, #1
	eor r0, r1
	strh r0, [r5]
	add r5, r5, #2
	cmp r4, r6
	blo _0201FF52
_0201FF66:
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end sub_0201FF44

	thumb_func_start sub_0201FF70
sub_0201FF70: ; 0x0201FF70
	ldr r3, _0201FF74 ; =sub_0201FF44
	bx r3
	.balign 4, 0
_0201FF74: .word sub_0201FF44
	thumb_func_end sub_0201FF70

	thumb_func_start sub_0201FF78
sub_0201FF78: ; 0x0201FF78
	ldr r2, [r0]
	ldr r1, _0201FF90 ; =0x41C64E6D
	add r3, r2, #0
	mul r3, r1
	ldr r1, _0201FF94 ; =0x00006073
	add r1, r3, r1
	str r1, [r0]
	lsr r0, r1, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_0201FF90: .word 0x41C64E6D
_0201FF94: .word 0x00006073
	thumb_func_end sub_0201FF78

	thumb_func_start sub_0201FF98
sub_0201FF98: ; 0x0201FF98
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, _0201FFA8 ; =0x021D15A4
	add r1, r3, #0
	ldr r3, _0201FFAC ; =sub_020E3A2C
	ldr r0, [r0]
	bx r3
	nop
_0201FFA8: .word 0x021D15A4
_0201FFAC: .word sub_020E3A2C
	thumb_func_end sub_0201FF98

	thumb_func_start sub_0201FFB0
sub_0201FFB0: ; 0x0201FFB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0201FFD8 ; =0x021D15A4
	ldr r0, [r0]
	cmp r0, #0
	beq _0201FFC0
	bl GF_AssertFail
_0201FFC0:
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #8
	bl AllocFromHeap
	ldr r1, _0201FFD8 ; =0x021D15A4
	str r0, [r1]
	ldr r1, _0201FFDC ; =0x00001021
	bl sub_020E3850
	pop {r4, pc}
	nop
_0201FFD8: .word 0x021D15A4
_0201FFDC: .word 0x00001021
	thumb_func_end sub_0201FFB0

	thumb_func_start sub_0201FFE0
sub_0201FFE0: ; 0x0201FFE0
	ldr r1, _0201FFE8 ; =0x0210F6D8
	str r0, [r1]
	bx lr
	nop
_0201FFE8: .word 0x0210F6D8
	thumb_func_end sub_0201FFE0

	thumb_func_start sub_0201FFEC
sub_0201FFEC: ; 0x0201FFEC
	push {r4, r5, r6, lr}
	ldr r4, _0202001C ; =0x021D1F74
	mov r5, #0
_0201FFF2:
	ldr r3, [r4]
	cmp r3, #0
	bne _0202000C
	ldr r6, _0202001C ; =0x021D1F74
	lsl r4, r5, #2
	bl sub_0200E358
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	cmp r0, #0
	bne _02020014
	mov r5, #8
	b _02020014
_0202000C:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	blt _0201FFF2
_02020014:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
	nop
_0202001C: .word 0x021D1F74
	thumb_func_end sub_0201FFEC

	thumb_func_start sub_02020020
sub_02020020: ; 0x02020020
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r5, #8
	blo _0202002C
	bl GF_AssertFail
_0202002C:
	ldr r6, _02020064 ; =0x021D1F74
	lsl r4, r5, #2
	ldr r0, [r6, r4]
	cmp r0, #0
	bne _0202003A
	bl GF_AssertFail
_0202003A:
	cmp r5, #8
	bhs _02020060
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _02020060
	bl sub_0201F988
	add r5, r0, #0
	beq _02020056
	bl sub_02020548
	add r0, r5, #0
	bl FreeToHeap
_02020056:
	ldr r0, [r6, r4]
	bl sub_0200E390
	mov r0, #0
	str r0, [r6, r4]
_02020060:
	pop {r4, r5, r6, pc}
	nop
_02020064: .word 0x021D1F74
	thumb_func_end sub_02020020

	thumb_func_start sub_02020068
sub_02020068: ; 0x02020068
	lsl r1, r0, #2
	ldr r0, _0202007C ; =0x021D1F74
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02020076
	mov r0, #1
	bx lr
_02020076:
	mov r0, #0
	bx lr
	nop
_0202007C: .word 0x021D1F74
	thumb_func_end sub_02020068

	thumb_func_start sub_02020080
sub_02020080: ; 0x02020080
	mov r1, #0
	ldr r2, _02020090 ; =0x021D1F74
	add r0, r1, #0
_02020086:
	add r1, r1, #1
	stmia r2!, {r0}
	cmp r1, #8
	blt _02020086
	bx lr
	.balign 4, 0
_02020090: .word 0x021D1F74
	thumb_func_end sub_02020080

	thumb_func_start sub_02020094
sub_02020094: ; 0x02020094
	push {r3, lr}
	bl sub_02020068
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02020094

	thumb_func_start sub_020200A0
sub_020200A0: ; 0x020200A0
	ldr r3, _020200A4 ; =sub_02020020
	bx r3
	.balign 4, 0
_020200A4: .word sub_02020020
	thumb_func_end sub_020200A0

	thumb_func_start AddTextPrinterParameterized
AddTextPrinterParameterized: ; 0x020200A8
	push {lr}
	sub sp, #0x1c
	str r2, [sp]
	str r0, [sp, #4]
	add r2, sp, #0
	strb r1, [r2, #9]
	ldr r0, [sp, #0x20]
	strb r3, [r2, #0xa]
	strb r0, [r2, #0xb]
	strh r3, [r2, #0xc]
	strh r0, [r2, #0xe]
	ldr r0, _020200F8 ; =0x0210F6D8
	lsl r1, r1, #3
	ldr r0, [r0]
	add r1, r0, r1
	ldrb r0, [r1, #2]
	strh r0, [r2, #0x10]
	ldrb r0, [r1, #3]
	strh r0, [r2, #0x12]
	ldrb r0, [r1, #4]
	strb r0, [r2, #0x14]
	ldrb r0, [r1, #5]
	strb r0, [r2, #0x15]
	ldrb r0, [r1, #6]
	strb r0, [r2, #0x16]
	ldrb r0, [r1, #7]
	ldr r1, [sp, #0x24]
	strb r0, [r2, #0x17]
	mov r0, #0
	strh r0, [r2, #0x18]
	strb r0, [r2, #0x1a]
	mov r0, #0xff
	strb r0, [r2, #0x1b]
	ldr r2, [sp, #0x28]
	add r0, sp, #0
	bl sub_020201A4
	add sp, #0x1c
	pop {pc}
	nop
_020200F8: .word 0x0210F6D8
	thumb_func_end AddTextPrinterParameterized

	thumb_func_start sub_020200FC
sub_020200FC: ; 0x020200FC
	push {lr}
	sub sp, #0x1c
	str r2, [sp]
	str r0, [sp, #4]
	add r2, sp, #0
	strb r1, [r2, #9]
	ldr r0, [sp, #0x20]
	strb r3, [r2, #0xa]
	strb r0, [r2, #0xb]
	strh r3, [r2, #0xc]
	strh r0, [r2, #0xe]
	ldr r0, _0202014C ; =0x0210F6D8
	lsl r1, r1, #3
	ldr r0, [r0]
	add r1, r0, r1
	ldrb r0, [r1, #2]
	strh r0, [r2, #0x10]
	ldrb r0, [r1, #3]
	strh r0, [r2, #0x12]
	ldrb r0, [r1, #4]
	ldr r1, [sp, #0x28]
	strb r0, [r2, #0x14]
	lsr r0, r1, #0x10
	strb r0, [r2, #0x15]
	lsr r0, r1, #8
	strb r0, [r2, #0x17]
	strb r1, [r2, #0x16]
	mov r0, #0
	strh r0, [r2, #0x18]
	strb r0, [r2, #0x1a]
	mov r0, #0xff
	strb r0, [r2, #0x1b]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x2c]
	add r0, sp, #0
	bl sub_020201A4
	add sp, #0x1c
	pop {pc}
	nop
_0202014C: .word 0x0210F6D8
	thumb_func_end sub_020200FC

	thumb_func_start AddTextPrinterParameterized3
AddTextPrinterParameterized3: ; 0x02020150
	push {lr}
	sub sp, #0x1c
	str r2, [sp]
	str r0, [sp, #4]
	add r2, sp, #0
	strb r1, [r2, #9]
	ldr r0, [sp, #0x20]
	strb r3, [r2, #0xa]
	strb r0, [r2, #0xb]
	strh r3, [r2, #0xc]
	strh r0, [r2, #0xe]
	ldr r0, [sp, #0x2c]
	strh r0, [r2, #0x10]
	ldr r0, [sp, #0x30]
	strh r0, [r2, #0x12]
	ldr r0, _020201A0 ; =0x0210F6D8
	ldr r3, [r0]
	lsl r0, r1, #3
	add r0, r3, r0
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0x28]
	strb r0, [r2, #0x14]
	lsr r0, r1, #0x10
	strb r0, [r2, #0x15]
	lsr r0, r1, #8
	strb r0, [r2, #0x17]
	strb r1, [r2, #0x16]
	mov r0, #0
	strh r0, [r2, #0x18]
	strb r0, [r2, #0x1a]
	mov r0, #0xff
	strb r0, [r2, #0x1b]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x34]
	add r0, sp, #0
	bl sub_020201A4
	add sp, #0x1c
	pop {pc}
	nop
_020201A0: .word 0x0210F6D8
	thumb_func_end AddTextPrinterParameterized3

	thumb_func_start sub_020201A4
sub_020201A4: ; 0x020201A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _020202E0 ; =0x0210F6D8
	add r6, r1, #0
	ldr r0, [r0]
	add r5, r2, #0
	cmp r0, #0
	bne _020201B8
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_020201B8:
	mov r0, #0
	mov r1, #0x34
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #1
	add r0, #0x27
	strb r1, [r0]
	add r0, r4, #0
	mov r3, #0
	add r0, #0x28
	strb r3, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r2, [r0]
	mov r0, #0x7f
	bic r2, r0
	lsl r0, r6, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x7f
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x2a
	strb r3, [r0]
	add r0, r4, #0
	add r0, #0x2b
	strb r3, [r0]
	add r0, r4, #0
	add r0, #0x2d
	strb r3, [r0]
	add r1, r3, #0
_02020200:
	add r0, r4, r3
	add r0, #0x20
	add r3, r3, #1
	strb r1, [r0]
	cmp r3, #7
	blt _02020200
	add r3, r7, #0
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4]
	bl String_c_str
	str r0, [r4]
	ldr r0, _020202E4 ; =0x021D1F6C
	str r5, [r4, #0x1c]
	mov r1, #0
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020204B8
	cmp r6, #0xff
	beq _02020286
	cmp r6, #0
	beq _02020286
	add r0, r4, #0
	add r0, #0x29
	ldrb r2, [r0]
	mov r1, #0x7f
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x19
	lsr r1, r1, #0x19
	add r1, #0xff
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x7f
	and r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r1, [r0]
	mov r0, #0x80
	mov r2, #1
	orr r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	ldr r0, _020202E8 ; =sub_020202EC
	add r1, r4, #0
	bl sub_0201FFEC
	add r1, r4, #0
	add r1, #0x2c
	strb r0, [r1]
	add r4, #0x2c
	ldrb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02020286:
	add r0, r4, #0
	add r0, #0x29
	ldrb r1, [r0]
	mov r0, #0x7f
	mov r5, #0
	bic r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r1, [r0]
	mov r0, #0x80
	bic r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	ldrb r0, [r7, #0x15]
	ldrb r1, [r7, #0x16]
	ldrb r2, [r7, #0x17]
	bl sub_0202036C
	mov r7, #1
	lsl r7, r7, #0xa
_020202B6:
	add r0, r4, #0
	bl sub_02020358
	cmp r0, #1
	beq _020202C6
	add r5, r5, #1
	cmp r5, r7
	blo _020202B6
_020202C6:
	cmp r6, #0xff
	beq _020202D0
	ldr r0, [r4, #4]
	bl CopyWindowToVram
_020202D0:
	add r0, r4, #0
	bl sub_02020548
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020202E0: .word 0x0210F6D8
_020202E4: .word 0x021D1F6C
_020202E8: .word sub_020202EC
	thumb_func_end sub_020201A4

	thumb_func_start sub_020202EC
sub_020202EC: ; 0x020202EC
	push {r4, lr}
	ldr r0, _02020354 ; =0x021D1F6C
	add r4, r1, #0
	ldrb r0, [r0]
	cmp r0, #0
	bne _02020352
	add r0, r4, #0
	add r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02020346
	mov r0, #0
	strh r0, [r4, #0x2e]
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x16]
	ldrb r2, [r4, #0x17]
	bl sub_0202036C
	add r0, r4, #0
	bl sub_02020358
	cmp r0, #0
	beq _02020324
	cmp r0, #1
	beq _0202033C
	cmp r0, #3
	beq _0202032A
	pop {r4, pc}
_02020324:
	ldr r0, [r4, #4]
	bl CopyWindowToVram
_0202032A:
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	beq _02020352
	ldrh r1, [r4, #0x2e]
	add r0, r4, #0
	blx r2
	add r4, #0x2d
	strb r0, [r4]
	pop {r4, pc}
_0202033C:
	add r4, #0x2c
	ldrb r0, [r4]
	bl sub_02020020
	pop {r4, pc}
_02020346:
	ldrh r1, [r4, #0x2e]
	ldr r2, [r4, #0x1c]
	add r0, r4, #0
	blx r2
	add r4, #0x2d
	strb r0, [r4]
_02020352:
	pop {r4, pc}
	.balign 4, 0
_02020354: .word 0x021D1F6C
	thumb_func_end sub_020202EC

	thumb_func_start sub_02020358
sub_02020358: ; 0x02020358
	push {r4, lr}
	add r4, r0, #0
_0202035C:
	ldrb r0, [r4, #9]
	add r1, r4, #0
	bl sub_02002E98
	cmp r0, #2
	beq _0202035C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02020358

	thumb_func_start sub_0202036C
sub_0202036C: ; 0x0202036C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, _02020408 ; =0x021D1F6C
	mov r5, #0
	str r5, [sp, #0x20]
	str r0, [sp, #0x24]
	str r2, [sp, #0x28]
	str r1, [sp, #0x2c]
	strh r1, [r3, #6]
	strh r0, [r3, #2]
	add r0, sp, #0x20
	strh r2, [r3, #4]
	str r5, [sp, #0x14]
	str r0, [sp, #8]
	mov ip, r0
	mov lr, r0
	str r0, [sp, #0x18]
_0202038E:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r0, [r0]
	str r0, [sp, #0x1c]
_0202039C:
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, lr
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	lsl r7, r0, #4
_020203AA:
	ldr r0, [sp]
	mov r3, #0
	ldr r0, [r0]
	mov r4, ip
	lsl r6, r0, #8
_020203B4:
	ldr r0, [r4]
	add r1, r7, #0
	lsl r0, r0, #0xc
	orr r0, r6
	orr r1, r0
	ldr r0, [sp, #0x1c]
	add r3, r3, #1
	add r2, r0, #0
	orr r2, r1
	lsl r1, r5, #1
	ldr r0, _0202040C ; =0x021D1F94
	add r5, r5, #1
	add r4, r4, #4
	strh r2, [r0, r1]
	cmp r3, #4
	blt _020203B4
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _020203AA
	ldr r0, [sp, #4]
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0202039C
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _0202038E
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020408: .word 0x021D1F6C
_0202040C: .word 0x021D1F94
	thumb_func_end sub_0202036C

	thumb_func_start sub_02020410
sub_02020410: ; 0x02020410
	ldrh r2, [r0]
	lsr r2, r2, #8
	lsl r3, r2, #1
	ldr r2, _020204B4 ; =0x021D1F94
	ldrh r3, [r2, r3]
	strh r3, [r1]
	ldrh r3, [r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #2]
	ldrh r3, [r0, #2]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #4]
	ldrh r3, [r0, #2]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #6]
	ldrh r3, [r0, #4]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #8]
	ldrh r3, [r0, #4]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0xa]
	ldrh r3, [r0, #6]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0xc]
	ldrh r3, [r0, #6]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0xe]
	ldrh r3, [r0, #8]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x10]
	ldrh r3, [r0, #8]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x12]
	ldrh r3, [r0, #0xa]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x14]
	ldrh r3, [r0, #0xa]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x16]
	ldrh r3, [r0, #0xc]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x18]
	ldrh r3, [r0, #0xc]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x1a]
	ldrh r3, [r0, #0xe]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x1c]
	ldrh r0, [r0, #0xe]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x17
	ldrh r0, [r2, r0]
	strh r0, [r1, #0x1e]
	bx lr
	.balign 4, 0
_020204B4: .word 0x021D1F94
	thumb_func_end sub_02020410

	thumb_func_start sub_020204B8
sub_020204B8: ; 0x020204B8
	mov r1, #0
	str r1, [r0, #0x30]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020204B8

	thumb_func_start sub_020204C0
sub_020204C0: ; 0x020204C0
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #8
	bl AllocFromHeap
	mov r2, #0
	add r5, r0, #0
	str r2, [sp]
	mov r0, #0x10
	mov r1, #6
	add r3, sp, #4
	bl GfGfxLoader_GetCharData
	add r4, r0, #0
	ldr r0, [sp, #4]
	mov r2, #6
	ldr r0, [r0, #0x14]
	add r1, r5, #0
	lsl r2, r2, #8
	bl MIi_CpuCopy32
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020204C0

	thumb_func_start sub_020204FC
sub_020204FC: ; 0x020204FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	add r7, r3, #0
	ldr r5, [r4, #4]
	cmp r0, #0
	bne _02020512
	bl sub_020204C0
	str r0, [r4, #0x30]
_02020512:
	mov r0, #6
	lsl r0, r0, #6
	add r6, r7, #0
	mul r6, r0
	add r0, r5, #0
	ldr r4, [r4, #0x30]
	bl GetWindowWidth
	sub r0, r0, #3
	lsl r0, r0, #0x13
	mov r1, #0x18
	lsr r2, r0, #0x10
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, r6
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020204FC

	thumb_func_start sub_02020548
sub_02020548: ; 0x02020548
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0202055A
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x30]
_0202055A:
	pop {r4, pc}
	thumb_func_end sub_02020548

	thumb_func_start sub_0202055C
sub_0202055C: ; 0x0202055C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020205A8 ; =0x021D2194
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _0202056E
	bl GF_AssertFail
_0202056E:
	add r0, r4, #0
	mov r1, #0xc
	bl AllocFromHeap
	ldr r1, _020205A8 ; =0x021D2194
	cmp r0, #0
	str r0, [r1]
	bne _02020582
	bl GF_AssertFail
_02020582:
	add r0, r4, #0
	lsl r1, r5, #4
	bl AllocFromHeap
	ldr r1, _020205A8 ; =0x021D2194
	ldr r2, [r1]
	str r0, [r2, #8]
	ldr r0, [r1]
	mov r2, #0
	str r5, [r0]
	ldr r0, [r1]
	str r2, [r0, #4]
	ldr r1, [r1]
	ldr r0, [r1, #8]
	ldr r1, [r1]
	bl sub_020B62C8
	pop {r3, r4, r5, pc}
	nop
_020205A8: .word 0x021D2194
	thumb_func_end sub_0202055C

	thumb_func_start sub_020205AC
sub_020205AC: ; 0x020205AC
	push {r3, lr}
	ldr r0, _020205D4 ; =0x021D2194
	ldr r0, [r0]
	cmp r0, #0
	bne _020205BA
	bl GF_AssertFail
_020205BA:
	ldr r0, _020205D4 ; =0x021D2194
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl FreeToHeap
	ldr r0, _020205D4 ; =0x021D2194
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020205D4 ; =0x021D2194
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_020205D4: .word 0x021D2194
	thumb_func_end sub_020205AC

	thumb_func_start sub_020205D8
sub_020205D8: ; 0x020205D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02020618 ; =0x021D2194
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	bne _020205EE
	bl GF_AssertFail
_020205EE:
	ldr r1, _02020618 ; =0x021D2194
	ldr r0, [r1]
	ldr r2, [r0, #4]
	add r2, r2, #1
	str r2, [r0, #4]
	ldr r0, [r1]
	ldr r1, [r0, #4]
	ldr r0, [r0]
	cmp r1, r0
	blo _0202060A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202060A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_020B634C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020618: .word 0x021D2194
	thumb_func_end sub_020205D8

	thumb_func_start sub_0202061C
sub_0202061C: ; 0x0202061C
	push {r3, lr}
	ldr r0, _02020634 ; =0x021D2194
	ldr r0, [r0]
	cmp r0, #0
	beq _02020632
	bl sub_020B62EC
	ldr r0, _02020634 ; =0x021D2194
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #4]
_02020632:
	pop {r3, pc}
	.balign 4, 0
_02020634: .word 0x021D2194
	thumb_func_end sub_0202061C

	thumb_func_start sub_02020638
sub_02020638: ; 0x02020638
	push {r3, lr}
	ldr r0, _02020650 ; =0x021D2194
	ldr r0, [r0]
	cmp r0, #0
	bne _02020646
	bl GF_AssertFail
_02020646:
	ldr r0, _02020650 ; =0x021D2194
	ldr r0, [r0]
	ldr r0, [r0, #4]
	pop {r3, pc}
	nop
_02020650: .word 0x021D2194
	thumb_func_end sub_02020638

	thumb_func_start sub_02020654
sub_02020654: ; 0x02020654
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0x30
	mul r1, r4
	bl AllocFromHeap
	ldr r2, _02020670 ; =sub_02020684
	add r1, r4, #0
	add r5, r0, #0
	bl sub_020BAD38
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02020670: .word sub_02020684
	thumb_func_end sub_02020654

	thumb_func_start sub_02020674
sub_02020674: ; 0x02020674
	ldr r3, _02020678 ; =sub_020BAD9C
	bx r3
	.balign 4, 0
_02020678: .word sub_020BAD9C
	thumb_func_end sub_02020674

	thumb_func_start sub_0202067C
sub_0202067C: ; 0x0202067C
	ldr r3, _02020680 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02020680: .word FreeToHeap
	thumb_func_end sub_0202067C

	thumb_func_start sub_02020684
sub_02020684: ; 0x02020684
	push {r3, lr}
	bl sub_020205D8
	pop {r3, pc}
	thumb_func_end sub_02020684

	thumb_func_start sub_0202068C
sub_0202068C: ; 0x0202068C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0x14
	add r4, r0, #0
	add r0, r6, #0
	mul r1, r5
	bl AllocFromHeap
	str r0, [r4]
	mov r6, #0
	str r5, [r4, #4]
	cmp r5, #0
	ble _020206C4
	add r5, r6, #0
_020206B2:
	ldr r0, [r4]
	add r0, r0, r5
	bl sub_02020770
	ldr r0, [r4, #4]
	add r6, r6, #1
	add r5, #0x14
	cmp r6, r0
	blt _020206B2
_020206C4:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202068C

	thumb_func_start sub_020206C8
sub_020206C8: ; 0x020206C8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02020740
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020206C8

	thumb_func_start sub_020206E0
sub_020206E0: ; 0x020206E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r4, #0
	add r7, r2, #0
	mov ip, r1
	add r6, r3, #0
	add r2, r4, #0
	cmp r0, #0
	ble _0202070E
	ldr r5, [r5]
	add r3, r5, #0
_020206F8:
	ldr r1, [r3]
	cmp r1, #0
	bne _02020706
	mov r0, #0x14
	mul r0, r2
	add r4, r5, r0
	b _0202070E
_02020706:
	add r2, r2, #1
	add r3, #0x14
	cmp r2, r0
	blt _020206F8
_0202070E:
	cmp r4, #0
	bne _02020716
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02020716:
	mov r0, ip
	str r0, [r4]
	str r7, [r4, #4]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	str r6, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0xff
	strb r0, [r4, #0x10]
	lsl r1, r1, #4
	strb r0, [r4, #0x11]
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02020780
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020206E0

	thumb_func_start sub_02020738
sub_02020738: ; 0x02020738
	ldr r3, _0202073C ; =sub_02020770
	bx r3
	.balign 4, 0
_0202073C: .word sub_02020770
	thumb_func_end sub_02020738

	thumb_func_start sub_02020740
sub_02020740: ; 0x02020740
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _02020760
	add r4, r6, #0
_0202074E:
	ldr r0, [r5]
	add r0, r0, r4
	bl sub_02020770
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _0202074E
_02020760:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02020740

	thumb_func_start sub_02020764
sub_02020764: ; 0x02020764
	ldr r3, _0202076C ; =sub_02020780
	lsl r1, r1, #4
	lsr r1, r1, #0x10
	bx r3
	.balign 4, 0
_0202076C: .word sub_02020780
	thumb_func_end sub_02020764

	thumb_func_start sub_02020770
sub_02020770: ; 0x02020770
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r1, [r0, #0x10]
	strb r1, [r0, #0x11]
	bx lr
	thumb_func_end sub_02020770

	thumb_func_start sub_02020780
sub_02020780: ; 0x02020780
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02026DE0
	add r2, sp, #0
	strb r0, [r2]
	lsr r0, r0, #8
	strb r0, [r2, #1]
	ldrb r0, [r2]
	add r1, sp, #0
	add r1, #2
	strb r0, [r2, #2]
	ldrb r0, [r2, #1]
	strb r0, [r2, #3]
	ldrb r3, [r4, #0x10]
	ldrb r0, [r2, #2]
	cmp r3, r0
	beq _020207AE
	add r0, r4, #0
	bl sub_020207C8
_020207AE:
	add r0, sp, #0
	ldrb r1, [r4, #0x11]
	ldrb r0, [r0, #3]
	cmp r1, r0
	beq _020207C2
	add r1, sp, #0
	add r0, r4, #0
	add r1, #2
	bl sub_020207F4
_020207C2:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02020780

	thumb_func_start sub_020207C8
sub_020207C8: ; 0x020207C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02020820
	ldr r3, [r5, #8]
	add r2, r0, #0
	lsl r1, r3, #0x10
	ldr r6, _020207F0 ; =0x7FFF0000
	mov r0, #0
	and r3, r6
	lsr r3, r3, #0x10
	lsr r1, r1, #0xd
	lsl r3, r3, #4
	bl sub_020205D8
	ldrb r0, [r4]
	strb r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
	nop
_020207F0: .word 0x7FFF0000
	thumb_func_end sub_020207C8

	thumb_func_start sub_020207F4
sub_020207F4: ; 0x020207F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202082C
	ldr r3, [r5, #0xc]
	add r2, r0, #0
	lsl r1, r3, #0x10
	ldr r6, _0202081C ; =0xFFFF0000
	mov r0, #1
	and r3, r6
	lsr r3, r3, #0x10
	lsr r1, r1, #0xd
	lsl r3, r3, #3
	bl sub_020205D8
	ldrb r0, [r4, #1]
	strb r0, [r5, #0x11]
	pop {r4, r5, r6, pc}
	nop
_0202081C: .word 0xFFFF0000
	thumb_func_end sub_020207F4

	thumb_func_start sub_02020820
sub_02020820: ; 0x02020820
	ldr r3, _02020828 ; =sub_02020838
	ldr r0, [r0, #4]
	ldrb r1, [r1]
	bx r3
	.balign 4, 0
_02020828: .word sub_02020838
	thumb_func_end sub_02020820

	thumb_func_start sub_0202082C
sub_0202082C: ; 0x0202082C
	ldr r3, _02020834 ; =sub_02020888
	ldr r0, [r0, #4]
	ldrb r1, [r1, #1]
	bx r3
	.balign 4, 0
_02020834: .word sub_02020888
	thumb_func_end sub_0202082C

	thumb_func_start sub_02020838
sub_02020838: ; 0x02020838
	push {r3, r4}
	cmp r0, #0
	beq _02020864
	add r2, r0, #0
	add r2, #0x3c
	beq _02020860
	add r3, r0, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r1, r3
	bhs _02020860
	add r3, r0, #0
	add r3, #0x42
	ldrh r4, [r3]
	add r3, r2, r4
	ldrh r2, [r2, r4]
	add r3, r3, #4
	mul r1, r2
	add r3, r3, r1
	b _02020866
_02020860:
	mov r3, #0
	b _02020866
_02020864:
	mov r3, #0
_02020866:
	cmp r3, #0
	bne _02020870
	mov r0, #0
	pop {r3, r4}
	bx lr
_02020870:
	ldr r1, [r0, #0x14]
	add r2, r0, r1
	ldr r1, [r3]
	ldr r0, [r0, #8]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r0, r1, r0
	lsl r0, r0, #3
	add r0, r2, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020838

	thumb_func_start sub_02020888
sub_02020888: ; 0x02020888
	push {r3, r4}
	cmp r0, #0
	beq _020208B0
	ldrh r2, [r0, #0x34]
	cmp r2, #0
	beq _020208B0
	add r4, r0, r2
	beq _020208AC
	ldrb r2, [r4, #1]
	cmp r1, r2
	bhs _020208AC
	ldrh r2, [r4, #6]
	add r3, r4, r2
	ldrh r2, [r4, r2]
	add r3, r3, #4
	mul r1, r2
	add r2, r3, r1
	b _020208B2
_020208AC:
	mov r2, #0
	b _020208B2
_020208B0:
	mov r2, #0
_020208B2:
	cmp r2, #0
	bne _020208BC
	mov r0, #0
	pop {r3, r4}
	bx lr
_020208BC:
	ldr r1, [r0, #0x38]
	add r1, r0, r1
	ldrh r0, [r2]
	lsl r0, r0, #3
	add r0, r1, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020888

	thumb_func_start sub_020208CC
sub_020208CC: ; 0x020208CC
	ldr r1, [r1]
	ldr r0, [r0, #8]
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	lsr r1, r1, #0xd
	lsr r0, r0, #0xd
	add r0, r1, r0
	bx lr
	thumb_func_end sub_020208CC

	thumb_func_start sub_020208DC
sub_020208DC: ; 0x020208DC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, sp, #0
	bl sub_02020B3C
	cmp r4, #0
	beq _020208FA
	add r0, r4, #0
	add r0, #0x3c
	add r1, sp, #0
	bl sub_020C3818
	add r1, r0, #0
	b _020208FC
_020208FA:
	mov r1, #0
_020208FC:
	cmp r1, #0
	bne _02020906
	add sp, #0x10
	mov r0, #0
	pop {r4, pc}
_02020906:
	add r0, r4, #0
	bl sub_020208CC
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_020208DC

	thumb_func_start sub_02020910
sub_02020910: ; 0x02020910
	push {r4, lr}
	cmp r0, #0
	beq _0202093C
	add r2, r0, #0
	add r2, #0x3c
	beq _02020938
	add r3, r0, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r1, r3
	bhs _02020938
	add r3, r0, #0
	add r3, #0x42
	ldrh r4, [r3]
	add r3, r2, r4
	ldrh r2, [r2, r4]
	add r3, r3, #4
	mul r1, r2
	add r1, r3, r1
	b _0202093E
_02020938:
	mov r1, #0
	b _0202093E
_0202093C:
	mov r1, #0
_0202093E:
	cmp r1, #0
	bne _02020946
	mov r0, #0
	pop {r4, pc}
_02020946:
	bl sub_020208CC
	pop {r4, pc}
	thumb_func_end sub_02020910

	thumb_func_start sub_0202094C
sub_0202094C: ; 0x0202094C
	push {r3, lr}
	ldr r0, [r1]
	mov r1, #7
	lsl r1, r1, #0x1a
	and r1, r0
	lsr r1, r1, #0x1a
	cmp r1, #6
	bhi _0202098A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02020968: ; jump table
	.short _0202098A - _02020968 - 2 ; case 0
	.short _02020982 - _02020968 - 2 ; case 1
	.short _02020976 - _02020968 - 2 ; case 2
	.short _0202097A - _02020968 - 2 ; case 3
	.short _0202097E - _02020968 - 2 ; case 4
	.short _0202098A - _02020968 - 2 ; case 5
	.short _02020986 - _02020968 - 2 ; case 6
_02020976:
	mov r1, #4
	b _0202098E
_0202097A:
	mov r1, #2
	b _0202098E
_0202097E:
	mov r1, #1
	b _0202098E
_02020982:
	mov r1, #1
	b _0202098E
_02020986:
	mov r1, #1
	b _0202098E
_0202098A:
	mov r0, #0
	pop {r3, pc}
_0202098E:
	mov r3, #7
	lsl r3, r3, #0x14
	add r2, r0, #0
	and r2, r3
	lsl r3, r3, #3
	and r0, r3
	lsr r2, r2, #0x14
	lsr r0, r0, #0x17
	lsl r2, r2, #4
	lsl r0, r0, #4
	mul r0, r2
	bl _u32_div_f
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202094C

	thumb_func_start sub_020209AC
sub_020209AC: ; 0x020209AC
	push {r4, lr}
	cmp r0, #0
	beq _020209D8
	add r2, r0, #0
	add r2, #0x3c
	beq _020209D4
	add r3, r0, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r1, r3
	bhs _020209D4
	add r3, r0, #0
	add r3, #0x42
	ldrh r4, [r3]
	add r3, r2, r4
	ldrh r2, [r2, r4]
	add r3, r3, #4
	mul r1, r2
	add r1, r3, r1
	b _020209DA
_020209D4:
	mov r1, #0
	b _020209DA
_020209D8:
	mov r1, #0
_020209DA:
	bl sub_0202094C
	pop {r4, pc}
	thumb_func_end sub_020209AC

	thumb_func_start sub_020209E0
sub_020209E0: ; 0x020209E0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, sp, #0
	bl sub_02020B3C
	cmp r4, #0
	beq _020209FE
	add r0, r4, #0
	add r0, #0x3c
	add r1, sp, #0
	bl sub_020C3818
	add r1, r0, #0
	b _02020A00
_020209FE:
	mov r1, #0
_02020A00:
	add r0, r4, #0
	bl sub_0202094C
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020209E0

	thumb_func_start sub_02020A0C
sub_02020A0C: ; 0x02020A0C
	ldrb r3, [r0]
	strb r3, [r1]
	ldrb r0, [r0, #1]
	strb r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020A0C

	thumb_func_start sub_02020A18
sub_02020A18: ; 0x02020A18
	ldrb r3, [r0, #2]
	strb r3, [r1]
	ldrb r0, [r0, #3]
	strb r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020A18

	thumb_func_start sub_02020A24
sub_02020A24: ; 0x02020A24
	push {r4, r5}
	ldr r5, _02020A9C ; =0xFFFFFFF8
	ldr r4, [sp, #0xc]
	add r5, sp
	ldrb r5, [r5, #0x18]
	cmp r5, #3
	bhi _02020A64
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_02020A3E: ; jump table
	.short _02020A46 - _02020A3E - 2 ; case 0
	.short _02020A4E - _02020A3E - 2 ; case 1
	.short _02020A56 - _02020A3E - 2 ; case 2
	.short _02020A5E - _02020A3E - 2 ; case 3
_02020A46:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #4]
	b _02020A64
_02020A4E:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #5]
	b _02020A64
_02020A56:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #6]
	b _02020A64
_02020A5E:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #7]
_02020A64:
	cmp r1, #0
	beq _02020A6E
	lsl r5, r4, #3
	ldrb r5, [r0, r5]
	strb r5, [r1]
_02020A6E:
	cmp r2, #0
	beq _02020A7A
	lsl r1, r4, #3
	add r1, r0, r1
	ldrb r1, [r1, #1]
	strb r1, [r2]
_02020A7A:
	cmp r3, #0
	beq _02020A86
	lsl r1, r4, #3
	add r1, r0, r1
	ldrb r1, [r1, #2]
	strb r1, [r3]
_02020A86:
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _02020A94
	lsl r1, r4, #3
	add r0, r0, r1
	ldrb r0, [r0, #3]
	strb r0, [r2]
_02020A94:
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	nop
_02020A9C: .word 0xFFFFFFF8
	thumb_func_end sub_02020A24

	thumb_func_start sub_02020AA0
sub_02020AA0: ; 0x02020AA0
	mov r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0
	beq _02020AB0
_02020AA8:
	add r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _02020AA8
_02020AB0:
	add r0, r2, #0
	bx lr
	thumb_func_end sub_02020AA0

	thumb_func_start sub_02020AB4
sub_02020AB4: ; 0x02020AB4
	push {r4, r5}
	mov r4, #1
	mov r3, #0
	lsl r4, r4, #8
_02020ABC:
	ldrsb r5, [r0, r3]
	strb r5, [r1, r3]
	ldrsb r5, [r0, r3]
	cmp r2, r5
	beq _02020ACA
	cmp r5, #0
	bne _02020AEA
_02020ACA:
	mov r4, #0
	strb r4, [r1, r3]
	cmp r2, #0xd
	bne _02020AE2
	add r1, r3, #1
	ldrsb r1, [r0, r1]
	cmp r1, #0xa
	bne _02020AE2
	add r1, r3, #2
	add r0, r0, r1
	pop {r4, r5}
	bx lr
_02020AE2:
	add r1, r3, #1
	add r0, r0, r1
	pop {r4, r5}
	bx lr
_02020AEA:
	add r3, r3, #1
	cmp r3, r4
	blt _02020ABC
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020AB4

	thumb_func_start sub_02020AF8
sub_02020AF8: ; 0x02020AF8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_02020AA0
	mov r5, #1
	mov r6, #0
	sub r3, r0, #1
	bmi _02020B36
	sub r1, r6, #1
	mov r0, #0xa
_02020B0C:
	ldrsb r2, [r4, r3]
	cmp r2, #0x30
	blt _02020B1E
	cmp r2, #0x39
	bgt _02020B1E
	sub r2, #0x30
	mul r2, r5
	add r6, r6, r2
	b _02020B30
_02020B1E:
	cmp r3, #0
	bne _02020B2A
	cmp r2, #0x2d
	bne _02020B30
	mul r6, r1
	b _02020B30
_02020B2A:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02020B30:
	mul r5, r0
	sub r3, r3, #1
	bpl _02020B0C
_02020B36:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02020AF8

	thumb_func_start sub_02020B3C
sub_02020B3C: ; 0x02020B3C
	push {r3, r4, r5, lr}
	mov r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
_02020B46:
	lsl r0, r2, #2
	str r1, [r5, r0]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _02020B46
	add r0, r4, #0
	bl sub_02020AA0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r2, _02020B74 ; =0x00000000
	beq _02020B70
_02020B62:
	ldrsb r0, [r4, r2]
	strb r0, [r5, r2]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, r1
	blo _02020B62
_02020B70:
	pop {r3, r4, r5, pc}
	nop
_02020B74: .word 0x00000000
	thumb_func_end sub_02020B3C

	thumb_func_start sub_02020B78
sub_02020B78: ; 0x02020B78
	ldr r1, _02020B88 ; =0x00000121
	cmp r0, r1
	bhs _02020B82
	mov r0, #1
	bx lr
_02020B82:
	mov r0, #0
	bx lr
	nop
_02020B88: .word 0x00000121
	thumb_func_end sub_02020B78

	thumb_func_start sub_02020B8C
sub_02020B8C: ; 0x02020B8C
	cmp r0, r1
	blt _02020B92
	add r0, r1, #0
_02020B92:
	bx lr
	thumb_func_end sub_02020B8C

	thumb_func_start sub_02020B94
sub_02020B94: ; 0x02020B94
	cmp r0, r1
	bgt _02020B9A
	add r0, r1, #0
_02020B9A:
	bx lr
	thumb_func_end sub_02020B94

	thumb_func_start sub_02020B9C
sub_02020B9C: ; 0x02020B9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r5, r0, #0
	add r3, sp, #0x14
	mov r0, #0
	str r0, [r3]
	str r0, [r3, #4]
	str r0, [r3, #8]
	add r0, r2, #0
	add r4, r1, #0
	add r2, sp, #0x44
	bl VEC_Subtract
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x38
	bl VEC_Subtract
	ldr r0, [sp, #0x48]
	ldr r5, [sp, #0x4c]
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x44]
	asr r4, r5, #0x1f
	str r0, [sp, #4]
	asr r7, r0, #0x1f
	add r0, sp, #0x44
	add r1, sp, #0x38
	bl VEC_DotProduct
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r5, #0
	add r3, r4, #0
	bl _ll_mul
	add r6, r0, #0
	ldr r0, [sp, #4]
	add r4, r1, #0
	add r1, r7, #0
	add r2, r0, #0
	add r3, r7, #0
	bl _ll_mul
	str r0, [sp, #0xc]
	add r5, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	add r2, r0, #0
	add r3, r1, #0
	bl _ll_mul
	mov r2, #2
	add r3, r1, #0
	add r7, r0, #0
	mov r1, #0
	lsl r2, r2, #0xa
	add r2, r6, r2
	adc r4, r1
	lsl r4, r4, #0x14
	lsr r2, r2, #0xc
	orr r2, r4
	mov r4, #2
	ldr r6, [sp, #0xc]
	lsl r4, r4, #0xa
	add r4, r6, r4
	adc r5, r1
	lsl r5, r5, #0x14
	lsr r4, r4, #0xc
	orr r4, r5
	mov r5, #2
	lsl r5, r5, #0xa
	add r5, r7, r5
	adc r3, r1
	lsl r1, r3, #0x14
	lsr r3, r5, #0xc
	orr r3, r1
	add r1, r4, r3
	ldr r0, [sp, #8]
	add r1, r2, r1
	bl FX_Div
	add r1, sp, #0x44
	add r2, sp, #0x14
	add r3, sp, #0x20
	bl VEC_MultAdd
	add r0, sp, #0x20
	add r1, sp, #0x38
	add r2, sp, #0x2c
	bl VEC_Subtract
	add r0, sp, #0x2c
	bl VEC_Mag
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02020B9C

	thumb_func_start sub_02020C64
sub_02020C64: ; 0x02020C64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r1, sp, #0x24
	bl VEC_Normalize
	add r0, r4, #0
	add r1, sp, #0x18
	bl VEC_Normalize
	ldr r0, [sp, #0x24]
	ldr r4, [sp, #0x18]
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	asr r6, r4, #0x1f
	str r0, [sp, #8]
	asr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #8]
	asr r7, r0, #0x1f
	ldr r3, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp, #0x10]
	bl _ll_mul
	str r0, [sp, #0x14]
	add r5, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	add r3, r6, #0
	bl _ll_mul
	mov r2, #2
	ldr r3, [sp, #0x14]
	lsl r2, r2, #0xa
	add r3, r3, r2
	ldr r2, _02020D28 ; =0x00000000
	adc r5, r2
	lsl r2, r5, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	mov r2, #2
	lsl r2, r2, #0xa
	add r0, r0, r2
	ldr r2, _02020D28 ; =0x00000000
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r5, r3, r0
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl _ll_mul
	add r6, r0, #0
	add r4, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r6, r6, r2
	adc r4, r3
	lsl r4, r4, #0x14
	lsr r6, r6, #0xc
	orr r6, r4
	add r4, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r4, #0xc
	orr r1, r0
	sub r0, r6, r1
	cmp r5, #0
	bne _02020D1E
	cmp r0, #0
	ble _02020D16
	add sp, #0x30
	lsl r0, r2, #3
	pop {r3, r4, r5, r6, r7, pc}
_02020D16:
	mov r0, #3
	add sp, #0x30
	lsl r0, r0, #0xe
	pop {r3, r4, r5, r6, r7, pc}
_02020D1E:
	add r1, r5, #0
	bl FX_Atan2Idx
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020D28: .word 0x00000000
	thumb_func_end sub_02020C64

	thumb_func_start sub_02020D2C
sub_02020D2C: ; 0x02020D2C
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, [r4]
	ldr r3, _02020DA0 ; =0x021094DC
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	asr r1, r1, #4
	lsl r2, r1, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r5, r0, #0
	bl MTX_RotX33_
	ldr r0, [r4, #4]
	ldr r3, _02020DA0 ; =0x021094DC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotY33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	ldr r3, _02020DA0 ; =0x021094DC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02020DA0: .word 0x021094DC
	thumb_func_end sub_02020D2C

	thumb_func_start sub_02020DA4
sub_02020DA4: ; 0x02020DA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0201FC30
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0201FBB8
	add r1, r0, #0
	ldr r0, [sp]
	add r2, r7, #0
	bl MTX_RotX33_
	add r0, r4, #0
	bl sub_0201FC30
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0201FBB8
	add r1, r0, #0
	add r0, sp, #4
	add r2, r5, #0
	bl MTX_RotY33_
	ldr r0, [sp]
	add r1, sp, #4
	add r2, r0, #0
	bl MTX_Concat33
	add r0, r6, #0
	bl sub_0201FC30
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0201FBB8
	add r1, r0, #0
	add r0, sp, #4
	add r2, r4, #0
	bl MTX_RotZ33_
	ldr r0, [sp]
	add r1, sp, #4
	add r2, r0, #0
	bl MTX_Concat33
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02020DA4

	thumb_func_start sub_02020E10
sub_02020E10: ; 0x02020E10
	push {r3, r4, r5, r6, r7, lr}
	asr r0, r0, #4
	add r7, r2, #0
	lsl r2, r0, #1
	add r6, r1, #0
	lsl r0, r2, #1
	ldr r1, _02020E7C ; =0x021094DC
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	add r5, r3, #0
	ldr r4, [sp, #0x18]
	bl FX_Div
	add r2, r0, #0
	asr r1, r6, #0x1f
	add r0, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r6, #2
	mov r2, #0
	lsl r6, r6, #0xa
	add r0, r0, r6
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r3, r0, #0x1f
	lsr r1, r0, #0x13
	lsl r3, r3, #0xd
	orr r3, r1
	lsl r0, r0, #0xd
	add r0, r0, r6
	adc r3, r2
	lsl r1, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r1, r0, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	str r0, [r4]
	bl _ll_mul
	mov r3, #0
	add r2, r6, #0
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020E7C: .word 0x021094DC
	thumb_func_end sub_02020E10

	thumb_func_start sub_02020E80
sub_02020E80: ; 0x02020E80
	push {r4, r5, r6, r7}
	ldr r6, [r2, #4]
	ldr r7, [r1]
	ldr r4, [r0, #4]
	ldr r5, [r1, #4]
	sub r1, r6, r4
	add r3, r7, #0
	mul r3, r1
	ldr r2, [r2]
	sub r1, r4, r5
	mul r1, r2
	ldr r2, [r0]
	sub r0, r5, r6
	mul r0, r2
	add r0, r1, r0
	add r0, r3, r0
	bmi _02020EA8
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_02020EA8:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020E80

	thumb_func_start sub_02020EB0
sub_02020EB0: ; 0x02020EB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r3, #0
	str r2, [sp]
	bl sub_02020E80
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl sub_02020E80
	eor r0, r6
	cmp r0, #1
	bne _02020EF0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02020E80
	add r5, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02020E80
	eor r0, r5
	cmp r0, #1
	bne _02020EF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02020EF0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02020EB0

	thumb_func_start sub_02020EF4
sub_02020EF4: ; 0x02020EF4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	sub r1, r3, r4
	ldr r0, [sp, #0x18]
	add r6, r2, #0
	sub r0, r0, r6
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	beq _02020F1A
	lsl r0, r0, #0xc
	lsl r1, r1, #0xc
	bl FX_Div
	str r0, [sp]
	b _02020F20
_02020F1A:
	mov r0, #0xff
	lsl r0, r0, #0xc
	str r0, [sp]
_02020F20:
	ldr r0, [sp]
	lsl r2, r4, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	mov r4, #0
	lsl r3, r3, #0xa
	lsl r2, r6, #0xc
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	ldr r0, [sp]
	sub r1, r2, r1
	str r0, [r5]
	str r1, [sp, #4]
	str r1, [r5, #4]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02020EF4

	thumb_func_start sub_02020F4C
sub_02020F4C: ; 0x02020F4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, [sp, #0x48]
	add r7, r0, #0
	add r5, r1, #0
	add r6, r3, #0
	str r2, [sp, #4]
	cmp r4, #0
	beq _02020F64
	ldr r0, _0202109C ; =0x0000FFFF
	str r0, [r4]
	str r0, [r4, #4]
_02020F64:
	ldr r2, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02020EB0
	cmp r0, #0
	bne _02020F7A
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02020F7A:
	ldr r0, [r5, #4]
	str r0, [sp]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, [r5]
	add r0, sp, #0x24
	bl sub_02020EF4
	ldr r0, [r6, #4]
	ldr r1, [sp, #4]
	str r0, [sp]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r2, [r2, #4]
	ldr r3, [r6]
	add r0, sp, #0x1c
	bl sub_02020EF4
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x24]
	cmp r3, r1
	bne _02020FAC
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02020FAC:
	ldr r2, [sp, #0x20]
	ldr r0, [sp, #0x28]
	sub r1, r3, r1
	sub r0, r2, r0
	bl FX_Div
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	ldr r0, [sp, #0x20]
	mov r3, #0
	str r0, [sp, #0x10]
	mov r0, #2
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsr r0, r0, #0xc
	lsl r1, r1, #0x14
	str r0, [sp, #0x14]
	orr r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r1, sp, #0x30
	bl FX_Modf
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blt _02020FF8
	ldr r2, [sp, #0x30]
	lsl r0, r1, #1
	add r0, r2, r0
	str r0, [sp, #0x30]
_02020FF8:
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x10]
	asr r0, r0, #0xc
	str r0, [r4]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	add r1, sp, #0x2c
	bl FX_Modf
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blt _0202101A
	ldr r2, [sp, #0x2c]
	lsl r0, r1, #1
	add r0, r2, r0
	str r0, [sp, #0x2c]
_0202101A:
	ldr r0, [sp, #0x2c]
	asr r0, r0, #0xc
	str r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, [r7]
	cmp r0, r1
	blt _0202102C
	mov ip, r0
	b _02021030
_0202102C:
	mov ip, r1
	add r1, r0, #0
_02021030:
	ldr r2, [r5, #4]
	ldr r0, [r7, #4]
	cmp r0, r2
	blt _0202103C
	str r0, [sp, #8]
	b _02021040
_0202103C:
	str r2, [sp, #8]
	add r2, r0, #0
_02021040:
	ldr r0, [sp, #4]
	ldr r3, [r6]
	ldr r0, [r0]
	cmp r0, r3
	blt _0202104E
	str r0, [sp, #0x18]
	b _02021052
_0202104E:
	str r3, [sp, #0x18]
	add r3, r0, #0
_02021052:
	ldr r0, [sp, #4]
	ldr r5, [r6, #4]
	ldr r0, [r0, #4]
	cmp r0, r5
	blt _02021060
	add r7, r0, #0
	b _02021064
_02021060:
	add r7, r5, #0
	add r5, r0, #0
_02021064:
	ldr r0, [r4]
	mov r6, ip
	cmp r6, r0
	blt _02021094
	cmp r1, r0
	bgt _02021094
	ldr r1, [r4, #4]
	ldr r4, [sp, #8]
	cmp r4, r1
	blt _02021094
	cmp r2, r1
	bgt _02021094
	ldr r2, [sp, #0x18]
	cmp r2, r0
	blt _02021094
	cmp r3, r0
	bgt _02021094
	cmp r7, r1
	blt _02021094
	cmp r5, r1
	bgt _02021094
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02021094:
	mov r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0202109C: .word 0x0000FFFF
	thumb_func_end sub_02020F4C

	thumb_func_start sub_020210A0
sub_020210A0: ; 0x020210A0
	mov r0, #0
	ldr r3, _020210B8 ; =0x021D2198
	add r1, r0, #0
	mov r2, #5
_020210A8:
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020210A8
	stmia r3!, {r0, r1}
	str r0, [r3]
	bx lr
	nop
_020210B8: .word 0x021D2198
	thumb_func_end sub_020210A0

	thumb_func_start sub_020210BC
sub_020210BC: ; 0x020210BC
	push {r3, lr}
	ldr r0, _020210D4 ; =0x021D21D8
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020210CA
	bl GF_AssertFail
_020210CA:
	ldr r0, _020210D4 ; =0x021D21D8
	mov r1, #0
	strh r1, [r0, #0x18]
	pop {r3, pc}
	nop
_020210D4: .word 0x021D21D8
	thumb_func_end sub_020210BC

	thumb_func_start sub_020210D8
sub_020210D8: ; 0x020210D8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02021144 ; =0x021D21D8
	add r6, r1, #0
	ldrh r1, [r0, #0x1a]
	add r4, r2, #0
	cmp r1, #0
	beq _02021104
	mov r0, #0
	str r0, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #1
	add r1, r0, #0
	add r2, r5, #0
	add r3, r6, #0
	bl sub_020211AC
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02021104:
	cmp r4, #5
	bhs _0202110C
	cmp r4, #0
	bne _02021112
_0202110C:
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02021112:
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _0202111E
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202111E:
	add r0, r4, #0
	bl sub_02021384
	cmp r0, #1
	bne _0202113E
	mov r0, #0
	str r0, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #1
	add r1, r0, #0
	add r2, r5, #0
	add r3, r6, #0
	bl sub_020211AC
	mov r0, #1
_0202113E:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02021144: .word 0x021D21D8
	thumb_func_end sub_020210D8

	thumb_func_start sub_02021148
sub_02021148: ; 0x02021148
	push {r4, lr}
	sub sp, #8
	ldr r1, _020211A8 ; =0x021D21D8
	add r4, r0, #0
	ldrh r2, [r1, #0x1a]
	cmp r2, #0
	beq _0202116E
	mov r2, #0
	str r2, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #2
	mov r1, #1
	add r3, r2, #0
	bl sub_020211AC
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_0202116E:
	cmp r4, #5
	bhs _02021176
	cmp r4, #0
	bne _0202117C
_02021176:
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_0202117C:
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _02021188
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02021188:
	bl sub_02021384
	cmp r0, #1
	bne _020211A4
	mov r2, #0
	str r2, [sp]
	lsl r0, r4, #1
	str r0, [sp, #4]
	mov r0, #2
	mov r1, #1
	add r3, r2, #0
	bl sub_020211AC
	mov r0, #1
_020211A4:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_020211A8: .word 0x021D21D8
	thumb_func_end sub_02021148

	thumb_func_start sub_020211AC
sub_020211AC: ; 0x020211AC
	push {r4, lr}
	ldr r4, _020211D0 ; =0x021D21D8
	strh r0, [r4, #0x18]
	ldr r0, _020211D4 ; =0x021D116C
	strb r1, [r0, #8]
	ldr r0, _020211D8 ; =0x021D2198
	ldr r1, [sp, #0xc]
	str r2, [r0]
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, [sp, #8]
	str r1, [r0, #0x54]
	ldr r0, _020211DC ; =0x021D21A4
	mov r1, #9
	bl sub_020211E0
	pop {r4, pc}
	nop
_020211D0: .word 0x021D21D8
_020211D4: .word 0x021D116C
_020211D8: .word 0x021D2198
_020211DC: .word 0x021D21A4
	thumb_func_end sub_020211AC

	thumb_func_start sub_020211E0
sub_020211E0: ; 0x020211E0
	mov r3, #0
	cmp r1, #0
	ble _020211F2
	add r2, r3, #0
_020211E8:
	add r3, r3, #1
	strh r2, [r0, #4]
	add r0, #8
	cmp r3, r1
	blt _020211E8
_020211F2:
	bx lr
	thumb_func_end sub_020211E0

	thumb_func_start sub_020211F4
sub_020211F4: ; 0x020211F4
	push {r4, r5, r6, lr}
	ldr r0, _02021234 ; =0x021D21D8
	mov r5, #0
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	bne _02021204
	mov r0, #1
	pop {r4, r5, r6, pc}
_02021204:
	mov r4, #4
	add r6, r4, #0
_02021208:
	bl sub_020DA308
	add r0, r4, #0
	bl sub_020DA804
	add r0, r6, #0
	bl sub_020DA81C
	cmp r0, #0
	beq _0202121E
	add r5, r5, #1
_0202121E:
	cmp r0, #0
	beq _02021226
	cmp r5, #5
	bls _02021208
_02021226:
	cmp r5, #5
	bls _0202122E
	mov r0, #2
	pop {r4, r5, r6, pc}
_0202122E:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02021234: .word 0x021D21D8
	thumb_func_end sub_020211F4

	thumb_func_start sub_02021238
sub_02021238: ; 0x02021238
	push {r4, lr}
	sub sp, #8
	ldr r0, _0202127C ; =0x021D21D8
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	beq _0202125A
	mov r0, #0
	str r0, [sp]
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	str r0, [sp, #4]
	bl sub_020211AC
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_0202125A:
	bl sub_020211F4
	add r4, r0, #0
	cmp r4, #1
	bne _02021274
	mov r0, #0
	str r0, [sp]
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	str r0, [sp, #4]
	bl sub_020211AC
_02021274:
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	nop
_0202127C: .word 0x021D21D8
	thumb_func_end sub_02021238

	thumb_func_start sub_02021280
sub_02021280: ; 0x02021280
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	ldr r2, _020212E4 ; =0x021D21D8
	add r4, r1, #0
	ldrh r3, [r2, #0x1a]
	add r5, r0, #0
	mov r1, #3
	cmp r3, #0
	beq _020212A6
	cmp r5, #0
	beq _0202129A
	bl sub_02021528
_0202129A:
	cmp r4, #2
	bne _020212A2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020212A2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020212A6:
	ldrh r0, [r2, #0x18]
	cmp r0, #0
	beq _020212DE
	bl sub_020DA4E4
	add r6, r0, #0
	ldr r0, _020212E8 ; =0x021D21A4
	mov r1, #9
	bl sub_020212EC
	cmp r5, #0
	beq _020212C6
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02021540
_020212C6:
	ldr r0, _020212E4 ; =0x021D21D8
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	bne _020212DC
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020213C8
	add r1, r0, #0
	b _020212DE
_020212DC:
	mov r1, #1
_020212DE:
	add r0, r1, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020212E4: .word 0x021D21D8
_020212E8: .word 0x021D21A4
	thumb_func_end sub_02021280

	thumb_func_start sub_020212EC
sub_020212EC: ; 0x020212EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r7, #0
	str r1, [sp]
	add r0, r1, #0
	beq _02021322
	add r4, r5, #0
	add r6, sp, #4
_020212FE:
	add r0, sp, #4
	add r1, r5, #0
	bl sub_020DA6E0
	ldrh r0, [r6]
	add r7, r7, #1
	add r5, #8
	strh r0, [r4]
	ldrh r0, [r6, #2]
	strh r0, [r4, #2]
	ldrh r0, [r6, #4]
	strh r0, [r4, #4]
	ldrh r0, [r6, #6]
	strh r0, [r4, #6]
	ldr r0, [sp]
	add r4, #8
	cmp r7, r0
	blo _020212FE
_02021322:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020212EC

	thumb_func_start sub_02021328
sub_02021328: ; 0x02021328
	push {r3, lr}
	ldr r0, _02021354 ; =0x021D21D8
	ldrh r1, [r0, #0x1a]
	cmp r1, #0
	beq _02021350
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _02021350
	ldr r0, _02021358 ; =0x021D2198
	ldr r0, [r0, #8]
	lsr r0, r0, #1
	bl sub_02021384
	cmp r0, #1
	beq _0202134A
	bl GF_AssertFail
_0202134A:
	ldr r0, _02021354 ; =0x021D21D8
	mov r1, #0
	strh r1, [r0, #0x1a]
_02021350:
	pop {r3, pc}
	nop
_02021354: .word 0x021D21D8
_02021358: .word 0x021D2198
	thumb_func_end sub_02021328

	thumb_func_start sub_0202135C
sub_0202135C: ; 0x0202135C
	push {r3, lr}
	ldr r0, _02021380 ; =0x021D21D8
	ldrh r1, [r0, #0x1a]
	cmp r1, #1
	beq _0202137E
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _0202137E
	bl sub_020211F4
	cmp r0, #1
	beq _02021378
	bl GF_AssertFail
_02021378:
	ldr r0, _02021380 ; =0x021D21D8
	mov r1, #1
	strh r1, [r0, #0x1a]
_0202137E:
	pop {r3, pc}
	.balign 4, 0
_02021380: .word 0x021D21D8
	thumb_func_end sub_0202135C

	thumb_func_start sub_02021384
sub_02021384: ; 0x02021384
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	lsl r0, r0, #0x10
	ldr r7, _020213C4 ; =0x021D21A4
	add r6, r5, #0
	lsr r4, r0, #0x10
_02021390:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #9
	bl sub_020DA208
	mov r0, #2
	bl sub_020DA804
	mov r0, #2
	bl sub_020DA81C
	cmp r0, #0
	beq _020213AE
	add r5, r5, #1
_020213AE:
	cmp r0, #0
	beq _020213B6
	cmp r5, #5
	ble _02021390
_020213B6:
	cmp r5, #5
	ble _020213BE
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_020213BE:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020213C4: .word 0x021D21A4
	thumb_func_end sub_02021384

	thumb_func_start sub_020213C8
sub_020213C8: ; 0x020213C8
	push {r3, lr}
	cmp r0, #5
	bhi _020213F2
	add r3, r0, r0
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_020213DA: ; jump table
	.short _020213F2 - _020213DA - 2 ; case 0
	.short _020213E6 - _020213DA - 2 ; case 1
	.short _020213F2 - _020213DA - 2 ; case 2
	.short _020213E6 - _020213DA - 2 ; case 3
	.short _020213EC - _020213DA - 2 ; case 4
	.short _020213EC - _020213DA - 2 ; case 5
_020213E6:
	bl sub_020213F8
	pop {r3, pc}
_020213EC:
	bl sub_020214B0
	pop {r3, pc}
_020213F2:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020213C8

	thumb_func_start sub_020213F8
sub_020213F8: ; 0x020213F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r5, _020214A8 ; =0x021D2198
	str r1, [sp, #4]
	ldr r1, [r5, #8]
	str r0, [sp]
	add r7, r2, #0
	mov r4, #0
	cmp r1, #0
	bls _0202149E
_0202140C:
	ldr r0, [sp, #4]
	sub r0, r0, r1
	add r0, r4, r0
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	bpl _02021420
	add r0, #9
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_02021420:
	lsl r1, r0, #3
	ldr r0, _020214AC ; =0x021D2198
	add r1, r0, r1
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	bne _02021496
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	bne _02021496
	ldr r2, [r5, #0x54]
	ldr r0, [r5]
	lsl r2, r2, #3
	add r2, r0, r2
	add r0, r2, #0
	sub r0, #8
	ldrh r3, [r1, #0xc]
	ldrh r0, [r0]
	cmp r0, r3
	blt _0202144A
	sub r3, r0, r3
	b _0202144C
_0202144A:
	sub r3, r3, r0
_0202144C:
	sub r6, r2, #6
	ldrh r0, [r1, #0xe]
	ldrh r6, [r6]
	cmp r6, r0
	blt _0202145A
	sub r0, r6, r0
	b _0202145C
_0202145A:
	sub r0, r0, r6
_0202145C:
	cmp r3, r7
	bhs _02021464
	cmp r0, r7
	blo _02021496
_02021464:
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x10]
	strh r0, [r2, #4]
	ldrh r0, [r1, #0x12]
	strh r0, [r2, #6]
	ldr r0, [r5, #0x54]
	add r0, r0, #1
	str r0, [r5, #0x54]
	ldr r1, [r5, #4]
	cmp r0, r1
	blo _02021496
	ldr r2, [sp]
	cmp r2, #1
	bne _0202148E
	bl _u32_div_f
	str r1, [r5, #0x54]
	b _02021496
_0202148E:
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02021496:
	ldr r1, [r5, #8]
	add r4, r4, #1
	cmp r4, r1
	blo _0202140C
_0202149E:
	ldr r0, _020214A8 ; =0x021D2198
	ldr r0, [r0, #0x54]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020214A8: .word 0x021D2198
_020214AC: .word 0x021D2198
	thumb_func_end sub_020213F8

	thumb_func_start sub_020214B0
sub_020214B0: ; 0x020214B0
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _02021520 ; =0x021D2198
	str r1, [sp]
	ldr r1, [r5, #8]
	add r7, r0, #0
	mov r4, #0
	cmp r1, #0
	bls _02021518
_020214C0:
	ldr r0, [sp]
	sub r0, r0, r1
	add r0, r4, r0
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	bpl _020214D4
	add r1, #9
	lsl r0, r1, #0x10
	asr r1, r0, #0x10
_020214D4:
	ldr r0, [r5, #0x54]
	lsl r1, r1, #3
	lsl r3, r0, #3
	ldr r0, _02021524 ; =0x021D2198
	ldr r6, [r5]
	add r2, r0, r1
	ldrh r0, [r2, #0xc]
	add r1, r6, r3
	strh r0, [r6, r3]
	ldrh r0, [r2, #0xe]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x10]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x12]
	strh r0, [r1, #6]
	ldr r0, [r5, #0x54]
	add r0, r0, #1
	str r0, [r5, #0x54]
	ldr r1, [r5, #4]
	cmp r0, r1
	blo _02021510
	cmp r7, #4
	bne _0202150A
	bl _u32_div_f
	str r1, [r5, #0x54]
	b _02021510
_0202150A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02021510:
	ldr r1, [r5, #8]
	add r4, r4, #1
	cmp r4, r1
	blo _020214C0
_02021518:
	ldr r0, _02021520 ; =0x021D2198
	ldr r0, [r0, #0x54]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021520: .word 0x021D2198
_02021524: .word 0x021D2198
	thumb_func_end sub_020214B0

	thumb_func_start sub_02021528
sub_02021528: ; 0x02021528
	mov r2, #0
	strh r2, [r0]
	add r1, r2, #0
_0202152E:
	strh r1, [r0, #8]
	strh r1, [r0, #6]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	add r2, r2, #1
	add r0, #8
	cmp r2, #8
	blt _0202152E
	bx lr
	thumb_func_end sub_02021528

	thumb_func_start sub_02021540
sub_02021540: ; 0x02021540
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02021528
	ldr r0, _02021598 ; =0x021D2198
	mov r6, #0
	ldr r1, [r0, #8]
	cmp r1, #0
	bls _02021596
	ldr r2, _0202159C ; =0x021D2198
_02021556:
	sub r1, r4, r1
	add r1, r6, r1
	add r1, r1, #1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bpl _02021568
	add r1, #9
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_02021568:
	lsl r1, r1, #3
	add r3, r2, r1
	ldrh r1, [r3, #0x12]
	cmp r1, #0
	bne _0202158E
	ldrh r1, [r5]
	ldrh r7, [r3, #0xc]
	lsl r1, r1, #3
	add r1, r5, r1
	strh r7, [r1, #2]
	ldrh r7, [r3, #0xe]
	strh r7, [r1, #4]
	ldrh r7, [r3, #0x10]
	strh r7, [r1, #6]
	ldrh r3, [r3, #0x12]
	strh r3, [r1, #8]
	ldrh r1, [r5]
	add r1, r1, #1
	strh r1, [r5]
_0202158E:
	ldr r1, [r0, #8]
	add r6, r6, #1
	cmp r6, r1
	blo _02021556
_02021596:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02021598: .word 0x021D2198
_0202159C: .word 0x021D2198
	thumb_func_end sub_02021540

	thumb_func_start sub_020215A0
sub_020215A0: ; 0x020215A0
	ldr r1, _020215B4 ; =0x04001000
	ldr r2, [r1]
	ldr r1, _020215B8 ; =0x00300010
	lsl r3, r1, #0x16
	ldr r3, [r3]
	and r2, r1
	and r1, r3
	ldr r3, _020215BC ; =sub_020215C0
	bx r3
	nop
_020215B4: .word 0x04001000
_020215B8: .word 0x00300010
_020215BC: .word sub_020215C0
	thumb_func_end sub_020215A0

	thumb_func_start sub_020215C0
sub_020215C0: ; 0x020215C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02021680 ; =0x021D21F4
	str r1, [sp]
	ldr r0, [r0]
	str r2, [sp, #4]
	cmp r0, #0
	bne _0202167A
	ldr r0, [r5, #0xc]
	mov r1, #0x3c
	bl AllocFromHeap
	add r1, r0, #0
	ldr r0, _02021680 ; =0x021D21F4
	mov r2, #0x3c
	str r1, [r0]
	mov r0, #0
	bl sub_020D47EC
	ldr r1, _02021680 ; =0x021D21F4
	ldr r2, [r5]
	ldr r0, [r1]
	str r2, [r0, #4]
	ldr r1, [r1]
	ldr r0, [r5, #0xc]
	ldr r2, [r1, #4]
	mov r1, #0x54
	mul r1, r2
	bl AllocFromHeap
	ldr r7, _02021680 ; =0x021D21F4
	mov r6, #0
	ldr r1, [r7]
	str r0, [r1]
	ldr r0, [r5]
	cmp r0, #0
	ble _02021622
	add r4, r6, #0
_0202160E:
	ldr r0, [r7]
	ldr r0, [r0]
	add r0, r0, r4
	bl sub_02021C08
	ldr r0, [r5]
	add r6, r6, #1
	add r4, #0x54
	cmp r6, r0
	blt _0202160E
_02021622:
	ldr r0, [sp]
	bl sub_02022448
	ldr r1, _02021680 ; =0x021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x2c]
	ldr r0, [sp, #4]
	bl sub_02022448
	ldr r2, _02021680 ; =0x021D21F4
	mov r3, #1
	ldr r1, [r2]
	lsl r3, r3, #0x1a
	str r0, [r1, #0x30]
	ldr r0, [r3]
	ldr r1, _02021684 ; =0xFFCFFFEF
	add r4, r0, #0
	ldr r0, [sp]
	and r4, r1
	orr r0, r4
	str r0, [r3]
	ldr r3, _02021688 ; =0x04001000
	ldr r0, [r3]
	and r1, r0
	ldr r0, [sp, #4]
	orr r0, r1
	str r0, [r3]
	ldr r1, [r2]
	ldr r0, [r5, #4]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r1, _02021680 ; =0x021D21F4
	add r4, r0, #0
	ldr r1, [r1]
	ldr r0, [r5, #8]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	add r1, r0, #0
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	bl sub_020221D0
_0202167A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021680: .word 0x021D21F4
_02021684: .word 0xFFCFFFEF
_02021688: .word 0x04001000
	thumb_func_end sub_020215C0

	thumb_func_start sub_0202168C
sub_0202168C: ; 0x0202168C
	push {r3, lr}
	ldr r0, _020216C4 ; =0x021D21F4
	ldr r0, [r0]
	cmp r0, #0
	beq _020216C2
	ldr r0, [r0, #0x34]
	bl sub_02022238
	ldr r0, _020216C4 ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_02022238
	bl sub_020218D4
	ldr r0, _020216C4 ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020216C4 ; =0x021D21F4
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020216C4 ; =0x021D21F4
	mov r1, #0
	str r1, [r0]
_020216C2:
	pop {r3, pc}
	.balign 4, 0
_020216C4: .word 0x021D21F4
	thumb_func_end sub_0202168C

	thumb_func_start sub_020216C8
sub_020216C8: ; 0x020216C8
	push {r3, lr}
	ldr r0, _020216F0 ; =0x021D21F4
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0xc]
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bl sub_02022278
	ldr r0, _020216F0 ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_02022278
	bl sub_02022060
	pop {r3, pc}
	nop
_020216F0: .word 0x021D21F4
	thumb_func_end sub_020216C8

	thumb_func_start sub_020216F4
sub_020216F4: ; 0x020216F4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r3, r1, #0
	cmp r2, #1
	add r0, sp, #4
	bne _0202172A
	str r0, [sp]
	ldr r0, _02021754 ; =0x021D21F4
	add r2, r3, #0
	ldr r0, [r0]
	add r1, r4, #0
	ldr r0, [r0, #0x1c]
	add r3, sp, #8
	bl sub_0202256C
	ldr r3, [sp, #4]
	cmp r3, #0
	ble _02021750
	mov r2, #0
	str r2, [sp]
	ldr r1, [sp, #8]
	mov r0, #1
	bl sub_02021EC0
	add sp, #0xc
	pop {r3, r4, pc}
_0202172A:
	str r0, [sp]
	ldr r0, _02021754 ; =0x021D21F4
	add r2, r3, #0
	ldr r0, [r0]
	add r1, r4, #0
	ldr r0, [r0, #0x20]
	add r3, sp, #8
	bl sub_0202256C
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _02021750
	str r0, [sp]
	mov r1, #0
	ldr r2, [sp, #8]
	mov r0, #2
	add r3, r1, #0
	bl sub_02021EC0
_02021750:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02021754: .word 0x021D21F4
	thumb_func_end sub_020216F4

	thumb_func_start sub_02021758
sub_02021758: ; 0x02021758
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_0202180C
	cmp r0, #1
	bne _0202176A
	bl GF_AssertFail
_0202176A:
	bl sub_02022024
	add r4, r0, #0
	bne _0202177A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202177A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02021C2C
	cmp r0, #0
	bne _0202178A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202178A:
	add r0, r4, #0
	bl sub_02021C9C
	cmp r0, #0
	bne _0202179E
	ldr r0, [r4, #0xc]
	bl sub_02021884
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202179E:
	ldr r0, _020217AC ; =0x021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020217AC: .word 0x021D21F4
	thumb_func_end sub_02021758

	thumb_func_start sub_020217B0
sub_020217B0: ; 0x020217B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_0202180C
	cmp r0, #1
	bne _020217C2
	bl GF_AssertFail
_020217C2:
	bl sub_02022024
	add r4, r0, #0
	bne _020217D2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_020217D2:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02021C2C
	cmp r0, #0
	bne _020217E2
	mov r0, #0
	pop {r3, r4, r5, pc}
_020217E2:
	mov r0, #1
	str r0, [r4, #0x40]
	add r0, r4, #0
	bl sub_02021C9C
	cmp r0, #0
	bne _020217FA
	ldr r0, [r4, #0xc]
	bl sub_02021884
	mov r0, #0
	pop {r3, r4, r5, pc}
_020217FA:
	ldr r0, _02021808 ; =0x021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02021808: .word 0x021D21F4
	thumb_func_end sub_020217B0

	thumb_func_start sub_0202180C
sub_0202180C: ; 0x0202180C
	push {r3, r4}
	ldr r1, _02021838 ; =0x021D21F4
	mov r2, #0
	ldr r4, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	ble _02021832
	ldr r3, [r4]
_0202181C:
	ldr r1, [r3, #0xc]
	cmp r0, r1
	bne _02021828
	mov r0, #1
	pop {r3, r4}
	bx lr
_02021828:
	ldr r1, [r4, #4]
	add r2, r2, #1
	add r3, #0x54
	cmp r2, r1
	blt _0202181C
_02021832:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02021838: .word 0x021D21F4
	thumb_func_end sub_0202180C

	thumb_func_start sub_0202183C
sub_0202183C: ; 0x0202183C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bne _02021848
	bl GF_AssertFail
_02021848:
	add r0, r4, #0
	bl sub_02021D70
	add r4, r0, #0
	bne _02021856
	bl GF_AssertFail
_02021856:
	str r5, [r4]
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _0202186C
	ldr r1, [r4, #0x34]
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x10]
	mov r0, #0x13
	bl sub_020205D8
_0202186C:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _02021880
	ldr r1, [r4, #0x38]
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x10]
	mov r0, #0x23
	bl sub_020205D8
_02021880:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202183C

	thumb_func_start sub_02021884
sub_02021884: ; 0x02021884
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r5, #1
	mov r7, #0
_0202188C:
	add r0, r6, #0
	bl sub_02021D70
	add r4, r0, #0
	bne _0202189A
	bl GF_AssertFail
_0202189A:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #4
	bne _020218AE
	add r0, r4, #0
	add r0, #0x10
	bl sub_02021A50
	b _020218B0
_020218AE:
	add r5, r7, #0
_020218B0:
	cmp r5, #0
	bne _0202188C
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _020218CE
	add r0, r4, #0
	bl sub_02021D58
	ldr r0, _020218D0 ; =0x021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	sub r0, r0, #1
	str r0, [r1, #8]
_020218CE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020218D0: .word 0x021D21F4
	thumb_func_end sub_02021884

	thumb_func_start sub_020218D4
sub_020218D4: ; 0x020218D4
	push {r4, r5, r6, lr}
	ldr r6, _0202190C ; =0x021D21F4
	mov r4, #0
	ldr r1, [r6]
	ldr r0, [r1, #4]
	cmp r0, #0
	ble _0202190A
	add r5, r4, #0
_020218E4:
	ldr r1, [r1]
	add r0, r1, r5
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _020218FE
	add r0, r1, r5
	bl sub_02021D58
	ldr r1, [r6]
	ldr r0, [r1, #8]
	sub r0, r0, #1
	str r0, [r1, #8]
_020218FE:
	ldr r1, [r6]
	add r4, r4, #1
	ldr r0, [r1, #4]
	add r5, #0x54
	cmp r4, r0
	blt _020218E4
_0202190A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202190C: .word 0x021D21F4
	thumb_func_end sub_020218D4

	thumb_func_start sub_02021910
sub_02021910: ; 0x02021910
	push {r4, lr}
	bl sub_02021D70
	add r4, r0, #0
	bne _0202191E
	bl GF_AssertFail
_0202191E:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0202192C
	mov r0, #0
	pop {r4, pc}
_0202192C:
	add r4, #0x10
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021910

	thumb_func_start sub_02021934
sub_02021934: ; 0x02021934
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r1, #0
	bl sub_02021D70
	add r4, r0, #0
	bne _02021946
	bl GF_AssertFail
_02021946:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _02021956
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_02021956:
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r2, sp, #0x10
	add r3, r5, #0
	bl sub_02021DE4
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #3
	bne _0202197A
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202197A:
	add r0, r4, #0
	mov r1, #3
	add r0, #0x3c
	strb r1, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02021E90
	mov r0, #1
	str r0, [r4, #0x48]
	ldr r0, [sp, #0xc]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #8]
	str r0, [r4, #0x50]
	add r0, r4, #0
	bl sub_02021FB0
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	bl sub_02021EC0
	add r4, #0x10
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02021934

	thumb_func_start sub_020219B8
sub_020219B8: ; 0x020219B8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	bl sub_02021C50
	add r4, r0, #0
	bne _020219C8
	bl GF_AssertFail
_020219C8:
	bl sub_02022024
	add r5, r0, #0
	bne _020219D4
	bl GF_AssertFail
_020219D4:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #3
	beq _020219E4
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_020219E4:
	add r3, r5, #0
	mov r2, #0xa
_020219E8:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020219E8
	ldr r0, [r4]
	mov r1, #4
	str r0, [r3]
	add r0, r5, #0
	add r0, #0x3c
	strb r1, [r0]
	ldr r0, [r5, #4]
	mov r1, #1
	tst r1, r0
	beq _02021A08
	ldr r3, [r5, #0x4c]
	b _02021A0A
_02021A08:
	ldr r3, [r5, #0x50]
_02021A0A:
	add r1, sp, #0xc
	str r1, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl sub_02021DE4
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	bl sub_02021E90
	mov r0, #1
	str r0, [r5, #0x48]
	ldr r0, [sp, #0xc]
	str r0, [r5, #0x4c]
	ldr r0, [sp, #8]
	str r0, [r5, #0x50]
	add r0, r5, #0
	bl sub_02021FB0
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	bl sub_02021EC0
	add r5, #0x10
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020219B8

	thumb_func_start sub_02021A50
sub_02021A50: ; 0x02021A50
	push {r4, r5, r6, lr}
	ldr r2, _02021AC4 ; =0x021D21F4
	mov r1, #0
	ldr r5, [r2]
	ldr r4, [r5, #4]
	cmp r4, #0
	ble _02021A8E
	ldr r2, [r5]
	add r3, r1, #0
_02021A62:
	add r6, r2, #0
	add r6, #0x3c
	ldrb r6, [r6]
	cmp r6, #3
	beq _02021A78
	ldr r6, [r5]
	add r6, r6, r3
	add r6, #0x3c
	ldrb r6, [r6]
	cmp r6, #4
	bne _02021A82
_02021A78:
	ldr r6, [r5]
	add r6, r6, r3
	add r6, #0x10
	cmp r6, r0
	beq _02021A8E
_02021A82:
	ldr r6, [r5, #4]
	add r1, r1, #1
	add r2, #0x54
	add r3, #0x54
	cmp r1, r6
	blt _02021A62
_02021A8E:
	cmp r1, r4
	bge _02021AC2
	mov r0, #0x54
	add r4, r1, #0
	mul r4, r0
	ldr r0, [r5]
	add r0, r0, r4
	bl sub_020223C4
	ldr r0, _02021AC4 ; =0x021D21F4
	ldr r1, [r0]
	ldr r2, [r1]
	add r2, #0x3c
	ldrb r1, [r2, r4]
	cmp r1, #3
	bne _02021AB4
	mov r0, #2
	strb r0, [r2, r4]
	pop {r4, r5, r6, pc}
_02021AB4:
	mov r1, #0
	strb r1, [r2, r4]
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, r0, r4
	bl sub_02021C08
_02021AC2:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02021AC4: .word 0x021D21F4
	thumb_func_end sub_02021A50

	thumb_func_start sub_02021AC8
sub_02021AC8: ; 0x02021AC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r1, #0
	bne _02021B02
	add r1, r5, #0
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl sub_020224C0
	add r7, r0, #0
	beq _02021B52
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02022510
	strh r5, [r4, #8]
	str r6, [r4]
	cmp r5, #1
	bne _02021AF8
	ldr r0, [sp, #0x14]
	b _02021AFA
_02021AF8:
	ldr r0, [sp, #0x10]
_02021AFA:
	str r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #0xa]
	b _02021B52
_02021B02:
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0x14
	add r2, sp, #0x10
	add r3, r6, #0
	bl sub_02021DE4
	add r7, r0, #0
	beq _02021B52
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	bl sub_02021EC0
	strh r5, [r4, #8]
	cmp r5, #1
	bne _02021B3E
	ldr r0, [sp, #0xc]
	str r0, [r4]
	ldr r0, _02021B58 ; =0x021D21F4
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	b _02021B4A
_02021B3E:
	ldr r0, [sp, #8]
	str r0, [r4]
	ldr r0, _02021B58 ; =0x021D21F4
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
_02021B4A:
	add r0, r1, r0
	str r0, [r4, #4]
	mov r0, #1
	strh r0, [r4, #0xa]
_02021B52:
	add r0, r7, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02021B58: .word 0x021D21F4
	thumb_func_end sub_02021AC8

	thumb_func_start sub_02021B5C
sub_02021B5C: ; 0x02021B5C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _02021BCA
	ldrh r1, [r4, #8]
	mov r0, #1
	tst r0, r1
	beq _02021B98
	ldr r1, _02021BCC ; =0x021D21F4
	ldr r0, [r4]
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	add r5, r0, #0
	ldr r0, _02021BCC ; =0x021D21F4
	ldr r1, [r4, #4]
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	sub r0, r1, r0
	ldr r1, [r2, #0x2c]
	bl sub_020224A8
	ldr r2, _02021BCC ; =0x021D21F4
	add r1, r5, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x34]
	bl sub_02022374
_02021B98:
	ldrh r1, [r4, #8]
	mov r0, #2
	tst r0, r1
	beq _02021BCA
	ldr r1, _02021BCC ; =0x021D21F4
	ldr r0, [r4]
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	add r5, r0, #0
	ldr r0, _02021BCC ; =0x021D21F4
	ldr r1, [r4, #4]
	ldr r2, [r0]
	ldr r0, [r2, #0x20]
	sub r0, r1, r0
	ldr r1, [r2, #0x30]
	bl sub_020224A8
	ldr r2, _02021BCC ; =0x021D21F4
	add r1, r5, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x38]
	bl sub_02022374
_02021BCA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02021BCC: .word 0x021D21F4
	thumb_func_end sub_02021B5C

	thumb_func_start sub_02021BD0
sub_02021BD0: ; 0x02021BD0
	push {r3, lr}
	ldr r0, _02021BE8 ; =0x021D21F4
	ldr r0, [r0]
	cmp r0, #0
	bne _02021BDE
	bl GF_AssertFail
_02021BDE:
	ldr r1, _02021BE8 ; =0x021D21F4
	mov r2, #0
	ldr r0, [r1]
	str r2, [r1]
	pop {r3, pc}
	.balign 4, 0
_02021BE8: .word 0x021D21F4
	thumb_func_end sub_02021BD0

	thumb_func_start sub_02021BEC
sub_02021BEC: ; 0x02021BEC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02021C04 ; =0x021D21F4
	ldr r0, [r0]
	cmp r0, #0
	beq _02021BFC
	bl GF_AssertFail
_02021BFC:
	ldr r0, _02021C04 ; =0x021D21F4
	str r4, [r0]
	pop {r4, pc}
	nop
_02021C04: .word 0x021D21F4
	thumb_func_end sub_02021BEC

	thumb_func_start sub_02021C08
sub_02021C08: ; 0x02021C08
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	strb r2, [r0, #8]
	sub r1, r2, #1
	str r1, [r0, #0xc]
	str r2, [r0, #0x34]
	add r1, r0, #0
	str r2, [r0, #0x38]
	add r1, #0x3c
	strb r2, [r1]
	str r2, [r0, #0x40]
	ldr r3, _02021C28 ; =sub_020B8008
	add r0, #0x10
	bx r3
	nop
_02021C28: .word sub_020B8008
	thumb_func_end sub_02021C08

	thumb_func_start sub_02021C2C
sub_02021C2C: ; 0x02021C2C
	ldr r2, [r0]
	str r2, [r1]
	ldr r2, [r0, #8]
	str r2, [r1, #0xc]
	ldr r2, [r0, #4]
	str r2, [r1, #4]
	ldr r2, [r1]
	ldr r2, [r2, #0xc]
	lsr r2, r2, #8
	strb r2, [r1, #8]
	ldr r0, [r0, #0xc]
	str r0, [r1, #0x44]
	mov r0, #0
	str r0, [r1, #0x48]
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	mov r0, #1
	bx lr
	thumb_func_end sub_02021C2C

	thumb_func_start sub_02021C50
sub_02021C50: ; 0x02021C50
	push {r3, r4, r5, r6}
	ldr r2, _02021C98 ; =0x021D21F4
	mov r1, #0
	ldr r5, [r2]
	ldr r4, [r5, #4]
	cmp r4, #0
	ble _02021C82
	ldr r2, [r5]
	add r3, r1, #0
_02021C62:
	add r6, r2, #0
	add r6, #0x3c
	ldrb r6, [r6]
	cmp r6, #0
	beq _02021C76
	ldr r6, [r5]
	add r6, r6, r3
	add r6, #0x10
	cmp r6, r0
	beq _02021C82
_02021C76:
	ldr r6, [r5, #4]
	add r1, r1, #1
	add r2, #0x54
	add r3, #0x54
	cmp r1, r6
	blt _02021C62
_02021C82:
	cmp r1, r4
	blt _02021C8C
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_02021C8C:
	mov r0, #0x54
	ldr r2, [r5]
	mul r0, r1
	add r0, r2, r0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_02021C98: .word 0x021D21F4
	thumb_func_end sub_02021C50

	thumb_func_start sub_02021C9C
sub_02021C9C: ; 0x02021C9C
	push {r3, lr}
	ldrb r1, [r0, #8]
	mov r2, #1
	cmp r1, #0
	beq _02021CAE
	mov r1, #2
	add r0, #0x3c
	strb r1, [r0]
	b _02021CC8
_02021CAE:
	add r1, r0, #0
	add r1, #0x3c
	strb r2, [r1]
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _02021CC2
	bl sub_02021CCC
	add r2, r0, #0
	b _02021CC8
_02021CC2:
	bl sub_02021D00
	add r2, r0, #0
_02021CC8:
	add r0, r2, #0
	pop {r3, pc}
	thumb_func_end sub_02021C9C

	thumb_func_start sub_02021CCC
sub_02021CCC: ; 0x02021CCC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x10]
	add r2, sp, #4
	add r3, sp, #0
	bl sub_020224C0
	add r4, r0, #0
	beq _02021CF8
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl sub_02021DD0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x10]
	bl sub_02022510
_02021CF8:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02021CCC

	thumb_func_start sub_02021D00
sub_02021D00: ; 0x02021D00
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r3, [r4]
	ldr r0, [r4, #4]
	ldr r3, [r3, #0x10]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl sub_02021DE4
	cmp r0, #0
	bne _02021D26
	add sp, #0x18
	mov r0, #0
	pop {r4, pc}
_02021D26:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02021E90
	mov r0, #1
	str r0, [r4, #0x48]
	ldr r0, [sp, #0xc]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #8]
	str r0, [r4, #0x50]
	add r0, r4, #0
	bl sub_02021F28
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	bl sub_02021EC0
	mov r0, #1
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end sub_02021D00

	thumb_func_start sub_02021D58
sub_02021D58: ; 0x02021D58
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x48]
	cmp r1, #0
	beq _02021D66
	bl sub_020223C4
_02021D66:
	add r0, r4, #0
	bl sub_02021C08
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021D58

	thumb_func_start sub_02021D70
sub_02021D70: ; 0x02021D70
	push {r4, r5}
	ldr r2, _02021DA4 ; =0x021D21F4
	mov r1, #0
	ldr r5, [r2]
	ldr r2, [r5, #4]
	cmp r2, #0
	ble _02021D9C
	ldr r2, [r5]
	add r4, r2, #0
_02021D82:
	ldr r3, [r4, #0xc]
	cmp r0, r3
	bne _02021D92
	mov r0, #0x54
	mul r0, r1
	add r0, r2, r0
	pop {r4, r5}
	bx lr
_02021D92:
	ldr r3, [r5, #4]
	add r1, r1, #1
	add r4, #0x54
	cmp r1, r3
	blt _02021D82
_02021D9C:
	mov r0, #0
	pop {r4, r5}
	bx lr
	nop
_02021DA4: .word 0x021D21F4
	thumb_func_end sub_02021D70

	thumb_func_start sub_02021DA8
sub_02021DA8: ; 0x02021DA8
	cmp r1, #1
	bne _02021DB4
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r2, [r1]
	b _02021DB8
_02021DB4:
	ldr r1, _02021DC8 ; =0x04001000
	ldr r2, [r1]
_02021DB8:
	ldr r1, _02021DCC ; =0x00300010
	and r2, r1
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bx lr
	nop
_02021DC8: .word 0x04001000
_02021DCC: .word 0x00300010
	thumb_func_end sub_02021DA8

	thumb_func_start sub_02021DD0
sub_02021DD0: ; 0x02021DD0
	push {r3, lr}
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	ldrb r1, [r0, #8]
	cmp r1, #0
	bne _02021DE0
	bl sub_02021F28
_02021DE0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02021DD0

	thumb_func_start sub_02021DE4
sub_02021DE4: ; 0x02021DE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x1c]
	add r6, r2, #0
	str r0, [sp, #0x1c]
	mov r2, #1
	add r0, r5, #0
	add r4, r1, #0
	str r3, [sp]
	ldr r7, [sp, #0x18]
	tst r0, r2
	beq _02021E3C
	ldr r1, _02021E8C ; =0x021D21F4
	add r0, r3, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_02022488
	ldr r1, _02021E8C ; =0x021D21F4
	str r0, [r7]
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r1, _02021E8C ; =0x021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x34]
	bl sub_020222EC
	mov r1, #0
	mvn r1, r1
	str r0, [r4]
	cmp r0, r1
	bne _02021E30
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02021E30:
	ldr r1, _02021E8C ; =0x021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224B8
	str r0, [r4]
_02021E3C:
	mov r0, #2
	tst r0, r5
	beq _02021E86
	ldr r1, _02021E8C ; =0x021D21F4
	ldr r0, [sp]
	ldr r1, [r1]
	mov r2, #1
	ldr r1, [r1, #0x30]
	bl sub_02022488
	ldr r1, [sp, #0x1c]
	str r0, [r1]
	ldr r1, _02021E8C ; =0x021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r1, _02021E8C ; =0x021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x38]
	bl sub_020222EC
	mov r1, #0
	mvn r1, r1
	str r0, [r6]
	cmp r0, r1
	bne _02021E7A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02021E7A:
	ldr r1, _02021E8C ; =0x021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224B8
	str r0, [r6]
_02021E86:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021E8C: .word 0x021D21F4
	thumb_func_end sub_02021DE4

	thumb_func_start sub_02021E90
sub_02021E90: ; 0x02021E90
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r3, #1
	tst r3, r4
	beq _02021EA4
	ldr r3, _02021EBC ; =0x021D21F4
	ldr r3, [r3]
	ldr r3, [r3, #0x1c]
	add r1, r1, r3
	str r1, [r0, #0x34]
_02021EA4:
	ldr r3, [r0, #4]
	mov r1, #2
	tst r1, r3
	beq _02021EB6
	ldr r1, _02021EBC ; =0x021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	add r1, r2, r1
	str r1, [r0, #0x38]
_02021EB6:
	pop {r3, r4}
	bx lr
	nop
_02021EBC: .word 0x021D21F4
	thumb_func_end sub_02021E90

	thumb_func_start sub_02021EC0
sub_02021EC0: ; 0x02021EC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	add r6, r2, #0
	tst r0, r5
	beq _02021EF4
	ldr r1, _02021F24 ; =0x021D21F4
	add r0, r3, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r1, _02021F24 ; =0x021D21F4
	add r7, r0, #0
	ldr r1, [r1]
	add r0, r4, #0
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r2, _02021F24 ; =0x021D21F4
	add r1, r7, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x34]
	bl sub_02022290
_02021EF4:
	mov r0, #2
	tst r0, r5
	beq _02021F20
	ldr r1, _02021F24 ; =0x021D21F4
	ldr r0, [sp, #0x18]
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r1, _02021F24 ; =0x021D21F4
	add r4, r0, #0
	ldr r1, [r1]
	add r0, r6, #0
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r2, _02021F24 ; =0x021D21F4
	add r1, r4, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x38]
	bl sub_02022290
_02021F20:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021F24: .word 0x021D21F4
	thumb_func_end sub_02021EC0

	thumb_func_start sub_02021F28
sub_02021F28: ; 0x02021F28
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x10
	bl sub_020B8008
	ldr r1, [r4, #4]
	cmp r1, #3
	beq _02021F40
	add r0, r4, #0
	bl sub_02021F54
	pop {r4, pc}
_02021F40:
	add r0, r4, #0
	mov r1, #1
	bl sub_02021F54
	add r0, r4, #0
	mov r1, #2
	bl sub_02021F54
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021F28

	thumb_func_start sub_02021F54
sub_02021F54: ; 0x02021F54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x40]
	add r4, r1, #0
	cmp r2, #0
	beq _02021F66
	bl sub_02021DA8
	b _02021F68
_02021F66:
	add r0, r4, #0
_02021F68:
	cmp r4, #1
	bne _02021F76
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r5, #0x34]
	ldr r2, [r2]
	b _02021F7C
_02021F76:
	ldr r2, _02021FAC ; =0x04001000
	ldr r1, [r5, #0x38]
	ldr r2, [r2]
_02021F7C:
	cmp r0, #0
	ldr r0, [r5]
	bne _02021F8E
	add r5, #0x10
	add r2, r4, #0
	add r3, r5, #0
	bl sub_020B82CC
	b _02021F98
_02021F8E:
	add r5, #0x10
	add r2, r4, #0
	add r3, r5, #0
	bl sub_020B80A0
_02021F98:
	cmp r4, #1
	bne _02021FA4
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_02021FA4:
	ldr r0, _02021FAC ; =0x04001000
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	nop
_02021FAC: .word 0x04001000
	thumb_func_end sub_02021F54

	thumb_func_start sub_02021FB0
sub_02021FB0: ; 0x02021FB0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x10
	bl sub_020B8008
	ldr r1, [r4, #4]
	cmp r1, #3
	beq _02021FC8
	add r0, r4, #0
	bl sub_02021FDC
	pop {r4, pc}
_02021FC8:
	add r0, r4, #0
	mov r1, #1
	bl sub_02021FDC
	add r0, r4, #0
	mov r1, #2
	bl sub_02021FDC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021FB0

	thumb_func_start sub_02021FDC
sub_02021FDC: ; 0x02021FDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x40]
	add r4, r1, #0
	cmp r2, #0
	beq _02021FEC
	bl sub_02021DA8
_02021FEC:
	cmp r4, #1
	bne _02021FFA
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r5, #0x34]
	ldr r0, [r0]
	b _02022000
_02021FFA:
	ldr r0, _02022020 ; =0x04001000
	ldr r1, [r5, #0x38]
	ldr r0, [r0]
_02022000:
	ldr r0, [r5]
	add r5, #0x10
	add r2, r4, #0
	add r3, r5, #0
	bl sub_020B84F8
	cmp r4, #1
	bne _02022018
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_02022018:
	ldr r0, _02022020 ; =0x04001000
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	nop
_02022020: .word 0x04001000
	thumb_func_end sub_02021FDC

	thumb_func_start sub_02022024
sub_02022024: ; 0x02022024
	push {r3, r4}
	ldr r1, _0202205C ; =0x021D21F4
	mov r0, #0
	ldr r4, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	ble _02022054
	ldr r1, [r4]
	add r3, r1, #0
_02022036:
	add r2, r3, #0
	add r2, #0x3c
	ldrb r2, [r2]
	cmp r2, #0
	bne _0202204A
	mov r2, #0x54
	mul r2, r0
	add r0, r1, r2
	pop {r3, r4}
	bx lr
_0202204A:
	ldr r2, [r4, #4]
	add r0, r0, #1
	add r3, #0x54
	cmp r0, r2
	blt _02022036
_02022054:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_0202205C: .word 0x021D21F4
	thumb_func_end sub_02022024

	thumb_func_start sub_02022060
sub_02022060: ; 0x02022060
	push {r3, lr}
	bl sub_020CEBEC
	cmp r0, #0x30
	bgt _02022090
	bge _020220D8
	cmp r0, #0x10
	bgt _0202208A
	bge _020220CC
	cmp r0, #3
	bhi _02022108
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02022082: ; jump table
	.short _020220AA - _02022082 - 2 ; case 0
	.short _020220F0 - _02022082 - 2 ; case 1
	.short _020220F0 - _02022082 - 2 ; case 2
	.short _020220FC - _02022082 - 2 ; case 3
_0202208A:
	cmp r0, #0x20
	beq _020220B4
	b _02022108
_02022090:
	cmp r0, #0x50
	bgt _0202209C
	bge _020220D8
	cmp r0, #0x40
	beq _020220B4
	b _02022108
_0202209C:
	cmp r0, #0x60
	bgt _020220A4
	beq _020220C0
	b _02022108
_020220A4:
	cmp r0, #0x70
	beq _020220E4
	b _02022108
_020220AA:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02022110
_020220B4:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220C0:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220CC:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0x10
	str r1, [r0, #0x14]
	b _02022110
_020220D8:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #5
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220E4:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #6
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220F0:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0x10
	str r1, [r0, #0x14]
	b _02022110
_020220FC:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0x12
	str r1, [r0, #0x14]
	b _02022110
_02022108:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x14]
_02022110:
	bl sub_020CEC1C
	cmp r0, #0
	beq _02022126
	cmp r0, #8
	beq _0202213A
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	beq _02022130
	b _02022146
_02022126:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x18]
	b _0202214E
_02022130:
	ldr r0, _020221B0 ; =0x021D21F4
	lsl r1, r1, #6
	ldr r0, [r0]
	str r1, [r0, #0x18]
	b _0202214E
_0202213A:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0x10
	str r1, [r0, #0x18]
	b _0202214E
_02022146:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x18]
_0202214E:
	ldr r0, _020221B0 ; =0x021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x2c]
	bl sub_020224B8
	ldr r1, _020221B0 ; =0x021D21F4
	ldr r3, [r1]
	ldr r2, [r3, #0x14]
	sub r0, r2, r0
	str r0, [r3, #0x1c]
	ldr r1, [r1]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x30]
	bl sub_020224B8
	ldr r1, _020221B0 ; =0x021D21F4
	ldr r3, [r1]
	ldr r2, [r3, #0x18]
	sub r0, r2, r0
	str r0, [r3, #0x20]
	ldr r1, [r1]
	mov r2, #0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	blt _0202218A
	ldr r0, [r1, #0x20]
	cmp r0, #0
	blt _0202218A
	mov r2, #1
_0202218A:
	cmp r2, #0
	bne _02022192
	bl GF_AssertFail
_02022192:
	ldr r0, _020221B0 ; =0x021D21F4
	mov r2, #0
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	blt _020221A6
	ldr r0, [r1, #0x20]
	cmp r0, #0
	blt _020221A6
	mov r2, #1
_020221A6:
	cmp r2, #0
	bne _020221AE
	bl GF_AssertFail
_020221AE:
	pop {r3, pc}
	.balign 4, 0
_020221B0: .word 0x021D21F4
	thumb_func_end sub_02022060

	thumb_func_start sub_020221B4
sub_020221B4: ; 0x020221B4
	push {r3, lr}
	ldr r0, _020221CC ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bl sub_02022278
	ldr r0, _020221CC ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_02022278
	pop {r3, pc}
	.balign 4, 0
_020221CC: .word 0x021D21F4
	thumb_func_end sub_020221B4

	thumb_func_start sub_020221D0
sub_020221D0: ; 0x020221D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02022234 ; =0x021D21F4
	add r4, r1, #0
	ldr r1, [r0]
	add r6, r2, #0
	str r5, [r1, #0x24]
	ldr r1, [r0]
	str r4, [r1, #0x28]
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _020221EE
	bl FreeToHeap
_020221EE:
	ldr r0, _02022234 ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	cmp r0, #0
	beq _020221FC
	bl FreeToHeap
_020221FC:
	ldr r0, _02022234 ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _02022214
	add r0, r6, #0
	lsr r1, r5, #3
	bl AllocFromHeap
	ldr r1, _02022234 ; =0x021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x34]
_02022214:
	ldr r0, _02022234 ; =0x021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _0202222C
	add r0, r6, #0
	lsr r1, r4, #3
	bl AllocFromHeap
	ldr r1, _02022234 ; =0x021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x38]
_0202222C:
	bl sub_020221B4
	pop {r4, r5, r6, pc}
	nop
_02022234: .word 0x021D21F4
	thumb_func_end sub_020221D0

	thumb_func_start sub_02022238
sub_02022238: ; 0x02022238
	push {r3, lr}
	cmp r0, #0
	beq _0202225A
	ldr r1, _0202225C ; =0x021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x34]
	cmp r0, r1
	bne _02022252
	mov r1, #0
	str r1, [r2, #0x24]
	bl FreeToHeap
	pop {r3, pc}
_02022252:
	mov r1, #0
	str r1, [r2, #0x28]
	bl FreeToHeap
_0202225A:
	pop {r3, pc}
	.balign 4, 0
_0202225C: .word 0x021D21F4
	thumb_func_end sub_02022238

	thumb_func_start sub_02022260
sub_02022260: ; 0x02022260
	ldr r1, _02022274 ; =0x021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x34]
	cmp r0, r1
	bne _0202226E
	ldr r0, [r2, #0x24]
	bx lr
_0202226E:
	ldr r0, [r2, #0x28]
	bx lr
	nop
_02022274: .word 0x021D21F4
	thumb_func_end sub_02022260

	thumb_func_start sub_02022278
sub_02022278: ; 0x02022278
	push {r4, lr}
	add r4, r0, #0
	beq _0202228E
	bl sub_02022260
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	lsr r2, r2, #3
	bl memset
_0202228E:
	pop {r4, pc}
	thumb_func_end sub_02022278

	thumb_func_start sub_02022290
sub_02022290: ; 0x02022290
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	beq _020222E6
	add r0, r4, #0
	bl sub_02022260
	add r6, r5, r6
	add r7, r0, #0
	cmp r5, r6
	bhs _020222E6
_020222AA:
	cmp r5, r7
	bhs _020222E6
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_02022560
	add r0, sp, #0
	ldrb r1, [r0]
	mov r0, #1
	lsl r0, r1
	ldr r1, [sp, #4]
	ldrb r1, [r4, r1]
	tst r0, r1
	beq _020222CC
	bl GF_AssertFail
_020222CC:
	add r2, sp, #0
	ldrb r3, [r2]
	ldr r1, [sp, #4]
	mov r2, #1
	lsl r2, r3
	lsl r2, r2, #0x18
	ldrb r0, [r4, r1]
	lsr r2, r2, #0x18
	add r5, r5, #1
	orr r0, r2
	strb r0, [r4, r1]
	cmp r5, r6
	blo _020222AA
_020222E6:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02022290

	thumb_func_start sub_020222EC
sub_020222EC: ; 0x020222EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	str r1, [sp]
	cmp r1, #0
	beq _0202236A
	add r0, r1, #0
	bl sub_02022260
	mov r6, #0
	str r0, [sp, #4]
	cmp r0, #0
	bls _0202236A
_02022306:
	add r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_02022560
	add r0, sp, #8
	ldrb r1, [r0]
	mov r0, #1
	mov r4, #0
	lsl r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	b _02022348
_02022320:
	add r5, r6, r4
	add r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_02022560
	add r0, sp, #8
	ldrb r1, [r0]
	mov r0, #1
	lsl r0, r1
	lsl r0, r0, #0x18
	ldr r1, [sp, #4]
	lsr r0, r0, #0x18
	cmp r5, r1
	blo _02022346
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02022346:
	add r4, r4, #1
_02022348:
	ldr r2, [sp, #0xc]
	ldr r1, [sp]
	ldrb r1, [r1, r2]
	tst r0, r1
	bne _02022356
	cmp r4, r7
	bls _02022320
_02022356:
	cmp r4, r7
	bls _02022360
	add sp, #0x10
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02022360:
	add r0, r6, r4
	add r6, r0, #1
	ldr r0, [sp, #4]
	cmp r6, r0
	blo _02022306
_0202236A:
	mov r0, #0
	mvn r0, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020222EC

	thumb_func_start sub_02022374
sub_02022374: ; 0x02022374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	beq _020223BE
	add r6, r5, r1
	cmp r5, r6
	bhs _020223BE
	add r7, sp, #0
_02022386:
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_02022560
	ldrb r1, [r7]
	mov r0, #1
	lsl r0, r1
	ldr r1, [sp, #4]
	ldrb r1, [r4, r1]
	tst r0, r1
	bne _020223A2
	bl GF_AssertFail
_020223A2:
	ldrb r0, [r7]
	mov r1, #1
	ldr r3, [sp, #4]
	lsl r1, r0
	mov r0, #0xff
	eor r0, r1
	lsl r0, r0, #0x18
	ldrb r2, [r4, r3]
	lsr r0, r0, #0x18
	add r5, r5, #1
	and r0, r2
	strb r0, [r4, r3]
	cmp r5, r6
	blo _02022386
_020223BE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02022374

	thumb_func_start sub_020223C4
sub_020223C4: ; 0x020223C4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	tst r0, r1
	beq _02022402
	add r0, r4, #0
	add r0, #0x10
	bl sub_020B802C
	ldr r1, _02022444 ; =0x021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	sub r0, r0, r1
	ldr r1, [r2, #0x2c]
	bl sub_020224A8
	ldr r1, _02022444 ; =0x021D21F4
	add r5, r0, #0
	ldr r1, [r1]
	ldr r0, [r4, #0x4c]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r2, _02022444 ; =0x021D21F4
	add r1, r0, #0
	ldr r2, [r2]
	add r0, r5, #0
	ldr r2, [r2, #0x34]
	bl sub_02022374
_02022402:
	ldr r0, [r4, #4]
	mov r1, #2
	tst r0, r1
	beq _0202243C
	add r0, r4, #0
	add r0, #0x10
	bl sub_020B802C
	ldr r1, _02022444 ; =0x021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x20]
	sub r0, r0, r1
	ldr r1, [r2, #0x30]
	bl sub_020224A8
	ldr r1, _02022444 ; =0x021D21F4
	add r5, r0, #0
	ldr r1, [r1]
	ldr r0, [r4, #0x50]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r2, _02022444 ; =0x021D21F4
	add r1, r0, #0
	ldr r2, [r2]
	add r0, r5, #0
	ldr r2, [r2, #0x38]
	bl sub_02022374
_0202243C:
	mov r0, #0
	str r0, [r4, #0x48]
	pop {r3, r4, r5, pc}
	nop
_02022444: .word 0x021D21F4
	thumb_func_end sub_020223C4

	thumb_func_start sub_02022448
sub_02022448: ; 0x02022448
	ldr r1, _0202247C ; =0x00100010
	cmp r0, r1
	bgt _02022456
	bge _0202246C
	cmp r0, #0x10
	beq _02022468
	b _02022478
_02022456:
	ldr r1, _02022480 ; =0x00200010
	cmp r0, r1
	bgt _02022460
	beq _02022470
	b _02022478
_02022460:
	ldr r1, _02022484 ; =0x00300010
	cmp r0, r1
	beq _02022474
	b _02022478
_02022468:
	mov r0, #1
	bx lr
_0202246C:
	mov r0, #2
	bx lr
_02022470:
	mov r0, #4
	bx lr
_02022474:
	mov r0, #8
	bx lr
_02022478:
	mov r0, #1
	bx lr
	.balign 4, 0
_0202247C: .word 0x00100010
_02022480: .word 0x00200010
_02022484: .word 0x00300010
	thumb_func_end sub_02022448

	thumb_func_start sub_02022488
sub_02022488: ; 0x02022488
	push {r4, r5, r6, lr}
	add r4, r1, #0
	lsl r4, r4, #5
	add r1, r4, #0
	add r5, r0, #0
	add r6, r2, #0
	bl _s32_div_f
	cmp r1, #0
	beq _020224A4
	sub r5, r5, r1
	cmp r6, #1
	bne _020224A4
	add r5, r5, r4
_020224A4:
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02022488

	thumb_func_start sub_020224A8
sub_020224A8: ; 0x020224A8
	asr r2, r0, #4
	lsr r2, r2, #0x1b
	add r2, r0, r2
	ldr r3, _020224B4 ; =_s32_div_f
	asr r0, r2, #5
	bx r3
	.balign 4, 0
_020224B4: .word _s32_div_f
	thumb_func_end sub_020224A8

	thumb_func_start sub_020224B8
sub_020224B8: ; 0x020224B8
	mul r1, r0
	lsl r0, r1, #5
	bx lr
	.balign 4, 0
	thumb_func_end sub_020224B8

	thumb_func_start sub_020224C0
sub_020224C0: ; 0x020224C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	mov r0, #1
	add r2, r4, #0
	add r7, r3, #0
	tst r2, r0
	beq _020224EA
	ldr r2, _0202250C ; =0x021D21F4
	ldr r2, [r2]
	ldr r6, [r2, #0xc]
	ldr r2, [r2, #0x1c]
	add r3, r6, r5
	cmp r3, r2
	bls _020224E8
	bl GF_AssertFail
	mov r0, #0
	b _020224EA
_020224E8:
	str r6, [r1]
_020224EA:
	mov r1, #2
	tst r1, r4
	beq _02022508
	ldr r1, _0202250C ; =0x021D21F4
	ldr r1, [r1]
	ldr r3, [r1, #0x10]
	ldr r1, [r1, #0x20]
	add r2, r3, r5
	cmp r2, r1
	bls _02022506
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02022506:
	str r3, [r7]
_02022508:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202250C: .word 0x021D21F4
	thumb_func_end sub_020224C0

	thumb_func_start sub_02022510
sub_02022510: ; 0x02022510
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r2, #1
	add r0, r4, #0
	tst r0, r2
	beq _02022538
	ldr r0, _0202255C ; =0x021D21F4
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	add r1, r1, r5
	str r1, [r3, #0xc]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #0x2c]
	bl sub_02022488
	ldr r1, _0202255C ; =0x021D21F4
	ldr r1, [r1]
	str r0, [r1, #0xc]
_02022538:
	mov r0, #2
	tst r0, r4
	beq _0202255A
	ldr r0, _0202255C ; =0x021D21F4
	ldr r2, [r0]
	ldr r1, [r2, #0x10]
	add r1, r1, r5
	str r1, [r2, #0x10]
	ldr r1, [r0]
	mov r2, #1
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #0x30]
	bl sub_02022488
	ldr r1, _0202255C ; =0x021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x10]
_0202255A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202255C: .word 0x021D21F4
	thumb_func_end sub_02022510

	thumb_func_start sub_02022560
sub_02022560: ; 0x02022560
	asr r3, r0, #3
	str r3, [r1]
	mov r1, #7
	and r0, r1
	strb r0, [r2]
	bx lr
	thumb_func_end sub_02022560

	thumb_func_start sub_0202256C
sub_0202256C: ; 0x0202256C
	push {r3, r4}
	sub r0, r1, r0
	ldr r4, [sp, #8]
	str r0, [r3]
	bpl _02022582
	add r0, r2, r0
	str r0, [r4]
	mov r0, #0
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02022582:
	str r2, [r4]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202256C

	thumb_func_start sub_02022588
sub_02022588: ; 0x02022588
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _020225E0 ; =0x021D21F8
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _020225DC
	add r0, r4, #0
	mov r1, #0x28
	bl AllocFromHeap
	add r1, r0, #0
	ldr r0, _020225E0 ; =0x021D21F8
	mov r2, #0x28
	str r1, [r0]
	mov r0, #0
	bl sub_020D47EC
	ldr r0, _020225E0 ; =0x021D21F8
	mov r1, #0x30
	ldr r0, [r0]
	mul r1, r6
	str r6, [r0, #4]
	add r0, r4, #0
	bl AllocFromHeap
	ldr r7, _020225E0 ; =0x021D21F8
	mov r4, #0
	ldr r1, [r7]
	cmp r6, #0
	str r0, [r1]
	ble _020225DC
	add r5, r4, #0
_020225CA:
	ldr r0, [r7]
	ldr r0, [r0]
	add r0, r0, r5
	bl sub_02022874
	add r4, r4, #1
	add r5, #0x30
	cmp r4, r6
	blt _020225CA
_020225DC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020225E0: .word 0x021D21F8
	thumb_func_end sub_02022588

	thumb_func_start sub_020225E4
sub_020225E4: ; 0x020225E4
	cmp r1, #1
	bne _020225F4
	ldr r1, _02022604 ; =0x021D21F8
	ldr r2, [r1]
	ldrh r1, [r2, #0x24]
	orr r0, r1
	strh r0, [r2, #0x24]
	bx lr
_020225F4:
	cmp r1, #2
	bne _02022602
	ldr r1, _02022604 ; =0x021D21F8
	ldr r2, [r1]
	ldrh r1, [r2, #0x26]
	orr r0, r1
	strh r0, [r2, #0x26]
_02022602:
	bx lr
	.balign 4, 0
_02022604: .word 0x021D21F8
	thumb_func_end sub_020225E4

	thumb_func_start sub_02022608
sub_02022608: ; 0x02022608
	push {r3, lr}
	ldr r0, _02022630 ; =0x021D21F8
	ldr r0, [r0]
	cmp r0, #0
	beq _0202262E
	bl sub_0202276C
	ldr r0, _02022630 ; =0x021D21F8
	ldr r0, [r0]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02022630 ; =0x021D21F8
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02022630 ; =0x021D21F8
	mov r1, #0
	str r1, [r0]
_0202262E:
	pop {r3, pc}
	.balign 4, 0
_02022630: .word 0x021D21F8
	thumb_func_end sub_02022608

	thumb_func_start sub_02022634
sub_02022634: ; 0x02022634
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022634

	thumb_func_start sub_02022638
sub_02022638: ; 0x02022638
	push {r3, lr}
	ldr r0, _0202265C ; =0x021D21F8
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0xc]
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r1, [r0]
	str r2, [r1, #0x14]
	ldr r0, [r0]
	str r2, [r0, #0x18]
	bl sub_020229E0
	ldr r0, _0202265C ; =0x021D21F8
	ldr r0, [r0]
	bl sub_02022AF0
	pop {r3, pc}
	.balign 4, 0
_0202265C: .word 0x021D21F8
	thumb_func_end sub_02022638

	thumb_func_start sub_02022660
sub_02022660: ; 0x02022660
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020229A4
	add r4, r0, #0
	bne _02022674
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02022674:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02022840
	cmp r0, #0
	bne _02022684
	mov r0, #0
	pop {r3, r4, r5, pc}
_02022684:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02022890
	cmp r0, #0
	bne _0202269A
	ldr r0, [r5, #0xc]
	bl sub_02022744
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202269A:
	add r0, r4, #0
	bl sub_02022AF8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02022660

	thumb_func_start sub_020226A4
sub_020226A4: ; 0x020226A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020229A4
	add r4, r0, #0
	bne _020226B8
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_020226B8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02022840
	cmp r0, #0
	bne _020226C8
	mov r0, #0
	pop {r3, r4, r5, pc}
_020226C8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020228E8
	cmp r0, #0
	bne _020226DE
	ldr r0, [r5, #0xc]
	bl sub_02022744
	mov r0, #0
	pop {r3, r4, r5, pc}
_020226DE:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020226A4

	thumb_func_start sub_020226E4
sub_020226E4: ; 0x020226E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bne _020226F0
	bl GF_AssertFail
_020226F0:
	add r0, r4, #0
	bl sub_0202296C
	add r4, r0, #0
	bne _020226FE
	bl GF_AssertFail
_020226FE:
	str r5, [r4]
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _02022716
	ldr r3, [r4, #8]
	ldr r1, [r4, #0x24]
	ldr r2, [r5, #0xc]
	mov r0, #0xe
	lsl r3, r3, #5
	bl sub_020205D8
_02022716:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _0202272C
	ldr r3, [r4, #8]
	ldr r1, [r4, #0x28]
	ldr r2, [r5, #0xc]
	mov r0, #0x1e
	lsl r3, r3, #5
	bl sub_020205D8
_0202272C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020226E4

	thumb_func_start sub_02022730
sub_02022730: ; 0x02022730
	push {r3, lr}
	bl sub_0202296C
	cmp r0, #0
	beq _0202273E
	mov r0, #1
	pop {r3, pc}
_0202273E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02022730

	thumb_func_start sub_02022744
sub_02022744: ; 0x02022744
	push {r4, lr}
	bl sub_0202296C
	add r4, r0, #0
	bne _02022752
	bl GF_AssertFail
_02022752:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	bne _02022768
	add r0, r4, #0
	bl sub_02022B34
	add r0, r4, #0
	bl sub_02022838
_02022768:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02022744

	thumb_func_start sub_0202276C
sub_0202276C: ; 0x0202276C
	push {r4, r5, r6, lr}
	ldr r6, _020227A8 ; =0x021D21F8
	mov r4, #0
	ldr r1, [r6]
	ldr r0, [r1, #4]
	cmp r0, #0
	ble _020227A4
	add r5, r4, #0
_0202277C:
	ldr r1, [r1]
	add r0, r1, r5
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	bne _02022798
	add r0, r1, r5
	bl sub_02022B34
	ldr r0, [r6]
	ldr r0, [r0]
	add r0, r0, r5
	bl sub_02022838
_02022798:
	ldr r1, [r6]
	add r4, r4, #1
	ldr r0, [r1, #4]
	add r5, #0x30
	cmp r4, r0
	blt _0202277C
_020227A4:
	pop {r4, r5, r6, pc}
	nop
_020227A8: .word 0x021D21F8
	thumb_func_end sub_0202276C

	thumb_func_start sub_020227AC
sub_020227AC: ; 0x020227AC
	push {r3, lr}
	bl sub_0202296C
	cmp r0, #0
	bne _020227C0
	bne _020227BC
	bl GF_AssertFail
_020227BC:
	mov r0, #0
	pop {r3, pc}
_020227C0:
	add r1, r0, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #1
	bne _020227CE
	add r0, #0x10
	pop {r3, pc}
_020227CE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020227AC

	thumb_func_start sub_020227D4
sub_020227D4: ; 0x020227D4
	push {r4, lr}
	add r4, r1, #0
	bl sub_0202296C
	cmp r0, #0
	bne _020227EA
	bne _020227E6
	bl GF_AssertFail
_020227E6:
	mov r0, #0
	pop {r4, pc}
_020227EA:
	add r1, r0, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #1
	beq _020227F8
	mov r0, #0
	pop {r4, pc}
_020227F8:
	ldr r1, [r0]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _02022804
	mov r1, #1
	str r1, [r4, #0x18]
_02022804:
	add r0, #0x10
	pop {r4, pc}
	thumb_func_end sub_020227D4

	thumb_func_start sub_02022808
sub_02022808: ; 0x02022808
	push {r4, lr}
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _02022816
	mov r4, #2
	lsl r4, r4, #8
	b _02022822
_02022816:
	ldr r2, [r0]
	cmp r2, #4
	bne _02022820
	mov r4, #0
	b _02022822
_02022820:
	mov r4, #0x20
_02022822:
	cmp r4, #0
	beq _02022832
	bl sub_020B8078
	add r1, r4, #0
	bl _u32_div_f
	pop {r4, pc}
_02022832:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02022808

	thumb_func_start sub_02022838
sub_02022838: ; 0x02022838
	ldr r3, _0202283C ; =sub_02022874
	bx r3
	.balign 4, 0
_0202283C: .word sub_02022874
	thumb_func_end sub_02022838

	thumb_func_start sub_02022840
sub_02022840: ; 0x02022840
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl sub_02022730
	cmp r0, #1
	bne _0202285C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202285C:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	add r1, #0x2c
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r1]
	ldr r1, [r5, #8]
	str r1, [r4, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02022840

	thumb_func_start sub_02022874
sub_02022874: ; 0x02022874
	push {r4, lr}
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #0xc]
	add r4, #0x10
	add r0, r4, #0
	bl sub_020B804C
	pop {r4, pc}
	thumb_func_end sub_02022874

	thumb_func_start sub_02022890
sub_02022890: ; 0x02022890
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	ldr r0, [r6]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020228B0
	ldr r0, _020228E4 ; =0x021D21F8
	ldr r0, [r0]
	add r4, r0, #0
	add r5, r0, #0
	ldr r3, [r0, #0x1c]
	add r4, #0x14
	add r5, #0x18
	ldr r0, [r0, #0x20]
	b _020228C0
_020228B0:
	ldr r0, _020228E4 ; =0x021D21F8
	mov r3, #2
	ldr r5, [r0]
	lsl r3, r3, #8
	add r4, r5, #0
	add r4, #0xc
	add r5, #0x10
	add r0, r3, #0
_020228C0:
	str r0, [sp]
	ldr r1, [r4]
	ldr r2, [r5]
	add r0, r6, #0
	bl sub_02022B70
	add r0, r6, #0
	bl sub_02022A28
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02022BBC
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_020228E4: .word 0x021D21F8
	thumb_func_end sub_02022890

	thumb_func_start sub_020228E8
sub_020228E8: ; 0x020228E8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r0, [r5]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020228F8
	bl GF_AssertFail
_020228F8:
	ldr r1, [r5, #4]
	mov r0, #1
	tst r0, r1
	beq _0202291A
	ldr r0, _02022968 ; =0x021D21F8
	ldr r1, [r5, #8]
	ldr r0, [r0]
	ldrh r0, [r0, #0x24]
	bl sub_02022AB0
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _0202291A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202291A:
	ldr r1, [r5, #4]
	mov r0, #2
	tst r0, r1
	beq _0202293C
	ldr r0, _02022968 ; =0x021D21F8
	ldr r1, [r5, #8]
	ldr r0, [r0]
	ldrh r0, [r0, #0x26]
	bl sub_02022AB0
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0202293C
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202293C:
	ldr r1, [r5, #4]
	mov r0, #1
	tst r0, r1
	beq _02022946
	str r6, [r5, #0x24]
_02022946:
	ldr r1, [r5, #4]
	mov r0, #2
	tst r0, r1
	beq _02022950
	str r4, [r5, #0x28]
_02022950:
	ldr r0, [r5, #8]
	lsl r1, r0, #5
	ldr r0, [r5]
	str r1, [r0, #8]
	add r0, r5, #0
	bl sub_02022A38
	add r0, r5, #0
	bl sub_02022AF8
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02022968: .word 0x021D21F8
	thumb_func_end sub_020228E8

	thumb_func_start sub_0202296C
sub_0202296C: ; 0x0202296C
	push {r4, r5}
	ldr r2, _020229A0 ; =0x021D21F8
	mov r1, #0
	ldr r5, [r2]
	ldr r2, [r5, #4]
	cmp r2, #0
	ble _02022998
	ldr r2, [r5]
	add r4, r2, #0
_0202297E:
	ldr r3, [r4, #0xc]
	cmp r0, r3
	bne _0202298E
	mov r0, #0x30
	mul r0, r1
	add r0, r2, r0
	pop {r4, r5}
	bx lr
_0202298E:
	ldr r3, [r5, #4]
	add r1, r1, #1
	add r4, #0x30
	cmp r1, r3
	blt _0202297E
_02022998:
	mov r0, #0
	pop {r4, r5}
	bx lr
	nop
_020229A0: .word 0x021D21F8
	thumb_func_end sub_0202296C

	thumb_func_start sub_020229A4
sub_020229A4: ; 0x020229A4
	push {r3, r4}
	ldr r1, _020229DC ; =0x021D21F8
	mov r0, #0
	ldr r4, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	ble _020229D4
	ldr r1, [r4]
	add r3, r1, #0
_020229B6:
	add r2, r3, #0
	add r2, #0x2c
	ldrb r2, [r2]
	cmp r2, #0
	bne _020229CA
	mov r2, #0x30
	mul r2, r0
	add r0, r1, r2
	pop {r3, r4}
	bx lr
_020229CA:
	ldr r2, [r4, #4]
	add r0, r0, #1
	add r3, #0x30
	cmp r0, r2
	blt _020229B6
_020229D4:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_020229DC: .word 0x021D21F8
	thumb_func_end sub_020229A4

	thumb_func_start sub_020229E0
sub_020229E0: ; 0x020229E0
	push {r3, lr}
	bl sub_020CEBFC
	cmp r0, #0x20
	beq _020229EE
	cmp r0, #0x40
	bne _020229FA
_020229EE:
	ldr r0, _02022A24 ; =0x021D21F8
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0xc
	str r1, [r0, #0x1c]
	b _02022A02
_020229FA:
	ldr r0, _02022A24 ; =0x021D21F8
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x1c]
_02022A02:
	bl sub_020CEC2C
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	bne _02022A18
	ldr r0, _02022A24 ; =0x021D21F8
	lsl r1, r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x20]
	pop {r3, pc}
_02022A18:
	ldr r0, _02022A24 ; =0x021D21F8
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x20]
	pop {r3, pc}
	nop
_02022A24: .word 0x021D21F8
	thumb_func_end sub_020229E0

	thumb_func_start sub_02022A28
sub_02022A28: ; 0x02022A28
	ldr r1, [r0, #8]
	ldr r3, _02022A34 ; =sub_02022A38
	lsl r2, r1, #5
	ldr r1, [r0]
	str r2, [r1, #8]
	bx r3
	.balign 4, 0
_02022A34: .word sub_02022A38
	thumb_func_end sub_02022A28

	thumb_func_start sub_02022A38
sub_02022A38: ; 0x02022A38
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x10
	bl sub_020B804C
	ldr r0, [r4, #4]
	mov r2, #1
	tst r0, r2
	beq _02022A56
	add r3, r4, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r3, #0x10
	bl NNS_G2dLoadPalette
_02022A56:
	ldr r0, [r4, #4]
	mov r2, #2
	tst r0, r2
	beq _02022A6A
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r4, #0x10
	add r3, r4, #0
	bl NNS_G2dLoadPalette
_02022A6A:
	pop {r4, pc}
	thumb_func_end sub_02022A38

	thumb_func_start sub_02022A6C
sub_02022A6C: ; 0x02022A6C
	push {r4, r5, r6, r7}
	mov r3, #0
	cmp r1, #0
	ble _02022A8A
	mov r5, #1
_02022A76:
	ldrh r7, [r0]
	add r4, r2, r3
	add r6, r5, #0
	lsl r6, r4
	add r4, r7, #0
	orr r4, r6
	add r3, r3, #1
	strh r4, [r0]
	cmp r3, r1
	blt _02022A76
_02022A8A:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022A6C

	thumb_func_start sub_02022A90
sub_02022A90: ; 0x02022A90
	push {r4, r5, r6, r7}
	mov r4, #0
	cmp r1, #0
	ble _02022AAC
	mov r6, #1
_02022A9A:
	add r5, r2, r4
	add r7, r6, #0
	ldrh r3, [r0]
	lsl r7, r5
	bic r3, r7
	add r4, r4, #1
	strh r3, [r0]
	cmp r4, r1
	blt _02022A9A
_02022AAC:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_02022A90

	thumb_func_start sub_02022AB0
sub_02022AB0: ; 0x02022AB0
	push {r4, r5, r6, r7}
	mov r3, #0
	mov r6, #1
	add r2, r3, #0
_02022AB8:
	add r4, r2, #0
	b _02022AC2
_02022ABC:
	cmp r5, #0x10
	bge _02022AD0
	add r4, r4, #1
_02022AC2:
	add r5, r3, r4
	add r7, r6, #0
	lsl r7, r5
	tst r7, r0
	bne _02022AD0
	cmp r4, r1
	blt _02022ABC
_02022AD0:
	cmp r4, r1
	bge _02022ADC
	add r3, r3, r4
	add r3, r3, #1
	cmp r3, #0x10
	blt _02022AB8
_02022ADC:
	cmp r3, #0x10
	blt _02022AE8
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, r7}
	bx lr
_02022AE8:
	lsl r0, r3, #5
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022AB0

	thumb_func_start sub_02022AF0
sub_02022AF0: ; 0x02022AF0
	mov r1, #0
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	bx lr
	thumb_func_end sub_02022AF0

	thumb_func_start sub_02022AF8
sub_02022AF8: ; 0x02022AF8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _02022B14
	ldr r0, _02022B30 ; =0x021D21F8
	ldr r2, [r4, #0x24]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x24
	lsr r2, r2, #5
	bl sub_02022A6C
_02022B14:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _02022B2C
	ldr r0, _02022B30 ; =0x021D21F8
	ldr r2, [r4, #0x28]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x26
	lsr r2, r2, #5
	bl sub_02022A6C
_02022B2C:
	pop {r4, pc}
	nop
_02022B30: .word 0x021D21F8
	thumb_func_end sub_02022AF8

	thumb_func_start sub_02022B34
sub_02022B34: ; 0x02022B34
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _02022B50
	ldr r0, _02022B6C ; =0x021D21F8
	ldr r2, [r4, #0x24]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x24
	lsr r2, r2, #5
	bl sub_02022A90
_02022B50:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _02022B68
	ldr r0, _02022B6C ; =0x021D21F8
	ldr r2, [r4, #0x28]
	ldr r0, [r0]
	ldr r1, [r4, #8]
	add r0, #0x26
	lsr r2, r2, #5
	bl sub_02022A90
_02022B68:
	pop {r4, pc}
	nop
_02022B6C: .word 0x021D21F8
	thumb_func_end sub_02022B34

	thumb_func_start sub_02022B70
sub_02022B70: ; 0x02022B70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	ldr r2, [r5, #4]
	mov r0, #1
	tst r2, r0
	beq _02022B96
	ldr r2, [r5, #8]
	lsl r2, r2, #5
	add r2, r1, r2
	cmp r2, r3
	bls _02022B94
	bl GF_AssertFail
	bl sub_02022634
	mov r0, #0
	b _02022B96
_02022B94:
	str r1, [r5, #0x24]
_02022B96:
	ldr r2, [r5, #4]
	mov r1, #2
	tst r1, r2
	beq _02022BB8
	ldr r1, [r5, #8]
	lsl r1, r1, #5
	add r2, r4, r1
	ldr r1, [sp, #0x10]
	cmp r2, r1
	bls _02022BB6
	bl GF_AssertFail
	bl sub_02022634
	mov r0, #0
	pop {r3, r4, r5, pc}
_02022BB6:
	str r4, [r5, #0x28]
_02022BB8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02022B70

	thumb_func_start sub_02022BBC
sub_02022BBC: ; 0x02022BBC
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r3, #1
	tst r3, r4
	beq _02022BD0
	ldr r3, [r0, #8]
	ldr r4, [r1]
	lsl r3, r3, #5
	add r3, r4, r3
	str r3, [r1]
_02022BD0:
	ldr r3, [r0, #4]
	mov r1, #2
	tst r1, r3
	beq _02022BE2
	ldr r0, [r0, #8]
	ldr r1, [r2]
	lsl r0, r0, #5
	add r0, r1, r0
	str r0, [r2]
_02022BE2:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02022BBC

	thumb_func_start sub_02022BE8
sub_02022BE8: ; 0x02022BE8
	push {r4, lr}
	add r4, r0, #0
	bl sub_020CE89C
	bl sub_020CE8C4
	bl sub_020CE948
	bl sub_020CE970
	bl sub_020CE8B0
	bl sub_020CE8E8
	bl sub_020CE95C
	bl sub_020CE998
	bl sub_020CE90C
	bl sub_020CE920
	ldr r0, [r4]
	bl sub_020CDC04
	ldr r0, [r4, #4]
	bl sub_020CDFE4
	ldr r0, [r4, #8]
	bl sub_020CE650
	ldr r0, [r4, #0xc]
	bl sub_020CE768
	ldr r0, [r4, #0x10]
	bl sub_020CDE94
	ldr r0, [r4, #0x14]
	bl sub_020CE0E4
	ldr r0, [r4, #0x18]
	bl sub_020CE6F8
	ldr r0, [r4, #0x1c]
	bl sub_020CE7E8
	ldr r0, [r4, #0x20]
	bl sub_020CE190
	ldr r0, [r4, #0x24]
	bl sub_020CE368
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02022BE8

	thumb_func_start sub_02022C54
sub_02022C54: ; 0x02022C54
	ldr r0, _02022C5C ; =0x021D21FC
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_02022C5C: .word 0x021D21FC
	thumb_func_end sub_02022C54

	thumb_func_start GX_EngineAToggleLayers
GX_EngineAToggleLayers: ; 0x02022C60
	cmp r1, #1
	bne _02022C6E
	ldr r1, _02022C94 ; =0x021D21FC
	ldr r1, [r1, #4]
	tst r1, r0
	beq _02022C76
	bx lr
_02022C6E:
	ldr r1, _02022C94 ; =0x021D21FC
	ldr r1, [r1, #4]
	tst r1, r0
	beq _02022C90
_02022C76:
	ldr r1, _02022C94 ; =0x021D21FC
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
_02022C94: .word 0x021D21FC
_02022C98: .word 0xFFFFE0FF
	thumb_func_end GX_EngineAToggleLayers

	thumb_func_start sub_02022C9C
sub_02022C9C: ; 0x02022C9C
	ldr r1, _02022CB4 ; =0x021D21FC
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
_02022CB4: .word 0x021D21FC
_02022CB8: .word 0xFFFFE0FF
	thumb_func_end sub_02022C9C

	thumb_func_start sub_02022CBC
sub_02022CBC: ; 0x02022CBC
	ldr r0, _02022CC4 ; =0x021D21FC
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_02022CC4: .word 0x021D21FC
	thumb_func_end sub_02022CBC

	thumb_func_start sub_02022CC8
sub_02022CC8: ; 0x02022CC8
	cmp r1, #1
	bne _02022CD6
	ldr r1, _02022CF8 ; =0x021D21FC
	ldr r1, [r1]
	tst r1, r0
	beq _02022CDE
	bx lr
_02022CD6:
	ldr r1, _02022CF8 ; =0x021D21FC
	ldr r1, [r1]
	tst r1, r0
	beq _02022CF6
_02022CDE:
	ldr r1, _02022CF8 ; =0x021D21FC
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
_02022CF8: .word 0x021D21FC
_02022CFC: .word 0x04001000
_02022D00: .word 0xFFFFE0FF
	thumb_func_end sub_02022CC8

	thumb_func_start sub_02022D04
sub_02022D04: ; 0x02022D04
	ldr r1, _02022D18 ; =0x021D21FC
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
_02022D18: .word 0x021D21FC
_02022D1C: .word 0x04001000
_02022D20: .word 0xFFFFE0FF
	thumb_func_end sub_02022D04

	thumb_func_start sub_02022D24
sub_02022D24: ; 0x02022D24
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
	thumb_func_end sub_02022D24

	thumb_func_start sub_02022D3C
sub_02022D3C: ; 0x02022D3C
	ldr r0, _02022D5C ; =0x021D116C
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
_02022D5C: .word 0x021D116C
_02022D60: .word 0x04000304
_02022D64: .word 0xFFFF7FFF
	thumb_func_end sub_02022D3C

	thumb_func_start sub_02022D68
sub_02022D68: ; 0x02022D68
	ldr r0, _02022D70 ; =0x021D21FC
	ldr r0, [r0, #4]
	bx lr
	nop
_02022D70: .word 0x021D21FC
	thumb_func_end sub_02022D68

	thumb_func_start sub_02022D74
sub_02022D74: ; 0x02022D74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x3e]
	ldr r2, [r5, #0x38]
	ldrh r4, [r5, #0x3c]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02022E50 ; =0x021094DC
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	asr r2, r4, #4
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r3, r2, #1
	ldr r2, _02022E50 ; =0x021094DC
	lsl r1, r1, #0x14
	ldrsh r2, [r2, r3]
	lsr r0, r0, #0xc
	orr r0, r1
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x14]
	ldrh r0, [r5, #0x3e]
	ldr r2, [r5, #0x38]
	asr r0, r0, #4
	lsl r0, r0, #1
	add r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _02022E50 ; =0x021094DC
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	mov r3, #0
	add r0, r0, r2
	adc r1, r3
	ldrh r2, [r5, #0x3c]
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	asr r2, r2, #4
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r3, r2, #1
	ldr r2, _02022E50 ; =0x021094DC
	orr r0, r1
	ldrsh r2, [r2, r3]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	neg r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r1, [r5, #0x1c]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02022E50 ; =0x021094DC
	ldr r2, [r5, #0x38]
	ldrsh r0, [r0, r1]
	asr r3, r2, #0x1f
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r0, r5, #0
	str r1, [r5, #0x18]
	add r0, #0x14
	add r5, #0x20
	add r1, r5, #0
	add r2, r0, #0
	bl VEC_Add
	pop {r3, r4, r5, pc}
	nop
_02022E50: .word 0x021094DC
	thumb_func_end sub_02022D74

	thumb_func_start sub_02022E54
sub_02022E54: ; 0x02022E54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x3e]
	ldr r2, [r5, #0x38]
	ldrh r4, [r5, #0x3c]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02022F34 ; =0x021094DC
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	asr r2, r4, #4
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r3, r2, #1
	ldr r2, _02022F34 ; =0x021094DC
	lsl r1, r1, #0x14
	ldrsh r2, [r2, r3]
	lsr r0, r0, #0xc
	orr r0, r1
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	neg r0, r1
	str r0, [r5, #0x20]
	ldrh r0, [r5, #0x3e]
	ldr r2, [r5, #0x38]
	asr r0, r0, #4
	lsl r0, r0, #1
	add r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _02022F34 ; =0x021094DC
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	mov r3, #0
	add r0, r0, r2
	adc r1, r3
	ldrh r2, [r5, #0x3c]
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	asr r2, r2, #4
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r3, r2, #1
	ldr r2, _02022F34 ; =0x021094DC
	orr r0, r1
	ldrsh r2, [r2, r3]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	neg r0, r1
	str r0, [r5, #0x28]
	neg r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02022F34 ; =0x021094DC
	ldr r2, [r5, #0x38]
	ldrsh r0, [r0, r1]
	asr r3, r2, #0x1f
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	neg r0, r1
	str r0, [r5, #0x24]
	add r0, r5, #0
	add r0, #0x20
	add r5, #0x14
	add r1, r5, #0
	add r2, r0, #0
	bl VEC_Add
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02022F34: .word 0x021094DC
	thumb_func_end sub_02022E54

	thumb_func_start sub_02022F38
sub_02022F38: ; 0x02022F38
	add r2, r1, #0
	add r2, #0x46
	strh r0, [r2]
	asr r0, r0, #4
	lsl r3, r0, #1
	ldr r2, _02022F7C ; =0x021094DC
	lsl r0, r3, #1
	ldrsh r0, [r2, r0]
	str r0, [r1]
	add r0, r3, #1
	lsl r0, r0, #1
	ldrsh r0, [r2, r0]
	mov r2, #0
	str r0, [r1, #4]
	ldr r0, _02022F80 ; =0x00001555
	str r0, [r1, #8]
	mov r0, #0x96
	lsl r0, r0, #0xc
	str r0, [r1, #0xc]
	mov r0, #0xe1
	lsl r0, r0, #0xe
	str r0, [r1, #0x10]
	mov r0, #1
	str r2, [r1, #0x2c]
	lsl r0, r0, #0xc
	str r0, [r1, #0x30]
	str r2, [r1, #0x34]
	str r2, [r1, #0x54]
	str r2, [r1, #0x58]
	str r2, [r1, #0x5c]
	str r2, [r1, #0x60]
	str r2, [r1, #0x64]
	bx lr
	nop
_02022F7C: .word 0x021094DC
_02022F80: .word 0x00001555
	thumb_func_end sub_02022F38

	thumb_func_start sub_02022F84
sub_02022F84: ; 0x02022F84
	ldr r2, [r0, #0x58]
	cmp r2, #0
	bne _02022F8E
	mov r2, #0
	str r2, [r1]
_02022F8E:
	ldr r2, [r0, #0x5c]
	cmp r2, #0
	bne _02022F98
	mov r2, #0
	str r2, [r1, #4]
_02022F98:
	ldr r0, [r0, #0x60]
	cmp r0, #0
	bne _02022FA2
	mov r0, #0
	str r0, [r1, #8]
_02022FA2:
	bx lr
	thumb_func_end sub_02022F84

	thumb_func_start sub_02022FA4
sub_02022FA4: ; 0x02022FA4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, [r6, #0x64]
	add r5, r1, #0
	add r4, r2, #0
	cmp r7, #0
	bne _02022FBC
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02022FBC:
	ldr r0, [r7, #0x24]
	cmp r0, #0
	bne _02022FCC
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02022FCC:
	add r0, r7, #0
	str r0, [sp]
	add r0, #8
	str r0, [sp]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _02022FF6
	add r2, r5, #0
	ldmia r2!, {r0, r1}
	add r3, r4, #0
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	ldr r0, [r6, #0x64]
	ldr r2, [r7, #4]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	bne _0202300A
	mov r1, #1
	str r1, [r0, #0x10]
	b _0202300A
_02022FF6:
	ldr r2, [r7, #4]
	mov r1, #0xc
	ldr r0, [r7, #0x20]
	mul r1, r2
	add r2, r0, r1
	ldmia r2!, {r0, r1}
	add r3, r4, #0
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
_0202300A:
	ldr r1, [r6, #0x64]
	ldr r0, [r7, #4]
	ldr r1, [r1]
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r7, #4]
	ldr r1, [sp]
	ldr r0, [r6, #0x64]
	ldr r2, [r1]
	mov r1, #0xc
	ldr r0, [r0, #0x20]
	mul r1, r2
	add r3, r5, #0
	add r2, r0, r1
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp]
	ldr r1, [r6, #0x64]
	ldr r0, [r0]
	ldr r1, [r1]
	add r0, r0, #1
	bl _s32_div_f
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [r6, #0x64]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0202304E
	ldr r0, [r5]
	str r0, [r4]
_0202304E:
	ldr r0, [r6, #0x64]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _0202305A
	ldr r0, [r5, #4]
	str r0, [r4, #4]
_0202305A:
	ldr r0, [r6, #0x64]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	bne _02023066
	ldr r0, [r5, #8]
	str r0, [r4, #8]
_02023066:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02022FA4

	thumb_func_start sub_02023068
sub_02023068: ; 0x02023068
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	add r7, r1, #0
	str r0, [sp, #0x18]
	ldr r0, [r0, #0x54]
	add r6, r2, #0
	str r3, [sp]
	cmp r0, #0
	beq _020230F6
	add r0, r7, #1
	cmp r0, r5
	ble _02023086
	bl GF_AssertFail
_02023086:
	ldr r0, [sp]
	mov r1, #0x28
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0xc
	ldr r0, [sp]
	mul r1, r5
	bl AllocFromHeap
	mov r1, #0
	str r0, [r4, #0x20]
	cmp r5, #0
	ble _020230BE
	add r2, r1, #0
	add r0, r1, #0
_020230A6:
	ldr r3, [r4, #0x20]
	add r1, r1, #1
	str r0, [r3, r2]
	ldr r3, [r4, #0x20]
	add r3, r3, r2
	str r0, [r3, #4]
	ldr r3, [r4, #0x20]
	add r3, r3, r2
	str r0, [r3, #8]
	add r2, #0xc
	cmp r1, r5
	blt _020230A6
_020230BE:
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	str r7, [r4, #8]
	str r7, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	mov r0, #1
	add r1, r6, #0
	tst r1, r0
	beq _020230DA
	str r0, [r4, #0x14]
_020230DA:
	mov r0, #2
	tst r0, r6
	beq _020230E4
	mov r0, #1
	str r0, [r4, #0x18]
_020230E4:
	mov r0, #4
	tst r0, r6
	beq _020230EE
	mov r0, #1
	str r0, [r4, #0x1c]
_020230EE:
	mov r0, #1
	str r0, [r4, #0x24]
	ldr r0, [sp, #0x18]
	str r4, [r0, #0x64]
_020230F6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02023068

	thumb_func_start sub_020230F8
sub_020230F8: ; 0x020230F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _02023112
	ldr r0, [r0, #0x20]
	bl FreeToHeap
	ldr r0, [r4, #0x64]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x64]
_02023112:
	pop {r4, pc}
	thumb_func_end sub_020230F8

	thumb_func_start sub_02023114
sub_02023114: ; 0x02023114
	ldr r3, _0202311C ; =AllocFromHeap
	mov r1, #0x68
	bx r3
	nop
_0202311C: .word AllocFromHeap
	thumb_func_end sub_02023114

	thumb_func_start sub_02023120
sub_02023120: ; 0x02023120
	ldr r3, _02023124 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02023124: .word FreeToHeap
	thumb_func_end sub_02023120

	thumb_func_start sub_02023128
sub_02023128: ; 0x02023128
	push {r3, r4}
	add r4, r0, #0
	add r3, r1, #0
	mov r2, #0xd
_02023130:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02023130
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02023128

	thumb_func_start sub_0202313C
sub_0202313C: ; 0x0202313C
	ldr r1, _02023144 ; =0x021D2204
	str r0, [r1]
	bx lr
	nop
_02023144: .word 0x021D2204
	thumb_func_end sub_0202313C

	thumb_func_start sub_02023148
sub_02023148: ; 0x02023148
	ldr r0, _02023150 ; =0x021D2204
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_02023150: .word 0x021D2204
	thumb_func_end sub_02023148

	thumb_func_start sub_02023154
sub_02023154: ; 0x02023154
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r0, _020231EC ; =0x021D2204
	ldr r1, [r0]
	cmp r1, #0
	beq _020231E6
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _0202319E
	add r1, #0x48
	add r2, sp, #0xc
	bl VEC_Subtract
	ldr r0, _020231EC ; =0x021D2204
	add r1, sp, #0xc
	ldr r0, [r0]
	bl sub_02022F84
	ldr r0, _020231EC ; =0x021D2204
	add r1, sp, #0xc
	ldr r0, [r0]
	add r2, sp, #0
	bl sub_02022FA4
	ldr r1, _020231EC ; =0x021D2204
	add r0, sp, #0
	ldr r1, [r1]
	bl sub_02023514
	ldr r0, _020231EC ; =0x021D2204
	ldr r3, [r0]
	ldr r2, [r3, #0x54]
	add r3, #0x48
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
_0202319E:
	ldr r0, _020231EC ; =0x021D2204
	ldr r5, _020231F0 ; =0x021DA6DC
	ldr r4, [r0]
	add r3, r4, #0
	add r2, r4, #0
	add r4, #0x14
	add r6, r4, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r2, #0x2c
	str r0, [r5]
	add r6, r2, #0
	ldr r5, _020231F4 ; =0x021DA6E8
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r3, #0x20
	str r0, [r5]
	add r6, r3, #0
	ldr r5, _020231F8 ; =0x021DA6F4
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	add r2, r3, #0
	str r0, [r5]
	ldr r3, _020231FC ; =0x021DA4E8
	add r0, r4, #0
	bl MTX_LookAt
	ldr r1, _02023200 ; =0x021DA51C
	mov r0, #0xe8
	ldr r2, [r1, #0x7c]
	bic r2, r0
	str r2, [r1, #0x7c]
_020231E6:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_020231EC: .word 0x021D2204
_020231F0: .word 0x021DA6DC
_020231F4: .word 0x021DA6E8
_020231F8: .word 0x021DA6F4
_020231FC: .word 0x021DA4E8
_02023200: .word 0x021DA51C
	thumb_func_end sub_02023154

	thumb_func_start sub_02023204
sub_02023204: ; 0x02023204
	add r3, r0, #0
	add r2, r1, #0
	ldmia r3!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_02023204

	thumb_func_start sub_02023214
sub_02023214: ; 0x02023214
	push {r3, r4}
	add r3, r1, #0
	add r4, r0, #0
	str r4, [r3, #0x54]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	add r2, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	mov r0, #1
	str r0, [r3, #0x58]
	str r0, [r3, #0x5c]
	str r0, [r3, #0x60]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02023214

	thumb_func_start sub_02023234
sub_02023234: ; 0x02023234
	mov r1, #0
	str r1, [r0, #0x54]
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	str r1, [r0, #0x60]
	bx lr
	thumb_func_end sub_02023234

	thumb_func_start sub_02023240
sub_02023240: ; 0x02023240
	str r0, [r2, #0xc]
	add r0, r2, #0
	str r1, [r2, #0x10]
	add r0, #0x44
	ldr r3, _02023250 ; =sub_020233D8
	ldrb r0, [r0]
	add r1, r2, #0
	bx r3
	.balign 4, 0
_02023250: .word sub_020233D8
	thumb_func_end sub_02023240

	thumb_func_start sub_02023254
sub_02023254: ; 0x02023254
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x20]
	add r6, r0, #0
	add r7, r1, #0
	add r0, r3, #0
	add r1, r4, #0
	add r5, r2, #0
	bl sub_02022F38
	add r3, r6, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	str r7, [r4, #0x38]
	ldrh r0, [r5]
	strh r0, [r4, #0x3c]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0x3e]
	add r0, r4, #0
	ldrh r1, [r5, #4]
	add r0, #0x40
	strh r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #6]
	add r0, #0x42
	strh r1, [r0]
	add r0, r4, #0
	bl sub_02022D74
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r1, r4, #0
	bl sub_020233D8
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _020232BA
	str r6, [r4, #0x54]
	add r2, r4, #0
	ldmia r6!, {r0, r1}
	add r2, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	str r0, [r2]
	mov r0, #1
	str r0, [r4, #0x58]
	str r0, [r4, #0x5c]
	str r0, [r4, #0x60]
_020232BA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02023254

	thumb_func_start sub_020232BC
sub_020232BC: ; 0x020232BC
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x1c]
	add r6, r0, #0
	add r7, r1, #0
	add r0, r3, #0
	add r1, r4, #0
	add r5, r2, #0
	bl sub_02022F38
	add r2, r4, #0
	ldmia r6!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	str r0, [r2]
	str r7, [r4, #0x38]
	ldrh r0, [r5]
	strh r0, [r4, #0x3c]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0x3e]
	add r0, r4, #0
	ldrh r1, [r5, #4]
	add r0, #0x40
	strh r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #6]
	add r0, #0x42
	strh r1, [r0]
	add r0, r4, #0
	bl sub_02022E54
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r1, r4, #0
	bl sub_020233D8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020232BC

	thumb_func_start sub_02023308
sub_02023308: ; 0x02023308
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r4, [sp, #0x54]
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	add r1, r4, #0
	add r7, r3, #0
	bl sub_02022F38
	add r3, r5, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, r6, #0
	str r0, [r2]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r5, #0
	str r0, [r2]
	add r0, r6, #0
	add r2, sp, #0x30
	bl VEC_Subtract
	add r0, sp, #0x30
	bl VEC_Mag
	str r0, [r4, #0x38]
	mov r6, #0
	add r0, sp, #0x24
	str r6, [r0]
	str r6, [r0, #4]
	str r6, [r0, #8]
	add r0, sp, #0x18
	str r6, [r0]
	str r6, [r0, #4]
	str r6, [r0, #8]
	add r0, sp, #0xc
	str r6, [r0]
	str r6, [r0, #4]
	str r6, [r0, #8]
	mov r0, #1
	lsl r0, r0, #0xc
	add r3, sp, #0x30
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r6, [sp]
	str r0, [r2]
	str r6, [sp, #4]
	str r6, [sp, #0x10]
	add r0, sp, #0
	add r1, sp, #0xc
	bl sub_02020C64
	strh r0, [r4, #0x3e]
	add r1, r6, #0
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r1, [sp, #4]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	str r1, [sp, #8]
	str r0, [sp, #0x14]
	str r1, [sp, #0x10]
	add r0, sp, #0
	add r1, sp, #0xc
	bl sub_02020C64
	strh r0, [r4, #0x3c]
	add r0, r4, #0
	add r1, r6, #0
	add r0, #0x40
	strh r1, [r0]
	add r0, r7, #0
	add r1, r4, #0
	bl sub_020233D8
	ldr r0, [sp, #0x50]
	cmp r0, #0
	beq _020233D2
	str r5, [r4, #0x54]
	add r2, r4, #0
	ldmia r5!, {r0, r1}
	add r2, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	mov r0, #1
	str r0, [r4, #0x58]
	str r0, [r4, #0x5c]
	str r0, [r4, #0x60]
_020233D2:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02023308

	thumb_func_start sub_020233D8
sub_020233D8: ; 0x020233D8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	cmp r0, #0
	bne _02023414
	ldr r0, [r5, #0x10]
	str r0, [sp]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	ldr r0, _02023488 ; =0x021DA4A4
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	ldr r3, [r5, #0xc]
	bl MTX_PerspectiveW
	ldr r1, _0202348C ; =0x021DA51C
	mov r0, #0x50
	ldr r2, [r1, #0x7c]
	add r5, #0x44
	bic r2, r0
	str r2, [r1, #0x7c]
	mov r1, #0
	ldr r0, _02023490 ; =0x0210F6DC
	strb r1, [r5]
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_02023414:
	ldr r4, [r5, #0x38]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	bl FX_Div
	asr r1, r0, #0x1f
	asr r3, r4, #0x1f
	add r2, r4, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsr r4, r2, #0xc
	lsl r0, r1, #0x14
	orr r4, r0
	ldr r2, [r5, #8]
	asr r1, r4, #0x1f
	add r0, r4, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r6, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r3, r6, #0xc
	orr r3, r0
	ldr r0, [r5, #0xc]
	neg r1, r4
	str r0, [sp]
	ldr r0, [r5, #0x10]
	str r0, [sp, #4]
	lsl r0, r2, #1
	str r0, [sp, #8]
	ldr r0, _02023488 ; =0x021DA4A4
	neg r2, r3
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl MTX_OrthoW
	ldr r1, _0202348C ; =0x021DA51C
	mov r0, #0x50
	ldr r2, [r1, #0x7c]
	add r5, #0x44
	bic r2, r0
	str r2, [r1, #0x7c]
	mov r0, #1
	strb r0, [r5]
	ldr r0, _02023490 ; =0x0210F6DC
	mov r1, #0
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02023488: .word 0x021DA4A4
_0202348C: .word 0x021DA51C
_02023490: .word 0x0210F6DC
	thumb_func_end sub_020233D8

	thumb_func_start sub_02023494
sub_02023494: ; 0x02023494
	add r2, r1, #0
	add r2, #0x46
	strh r0, [r2]
	add r0, r1, #0
	add r0, #0x46
	ldrh r0, [r0]
	ldr r3, _020234C8 ; =sub_020233D8
	asr r0, r0, #4
	lsl r2, r0, #2
	ldr r0, _020234CC ; =0x021094DC
	ldrsh r2, [r0, r2]
	str r2, [r1]
	add r2, r1, #0
	add r2, #0x46
	ldrh r2, [r2]
	asr r2, r2, #4
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r0, [r0, r2]
	str r0, [r1, #4]
	add r0, r1, #0
	add r0, #0x44
	ldrb r0, [r0]
	bx r3
	nop
_020234C8: .word sub_020233D8
_020234CC: .word 0x021094DC
	thumb_func_end sub_02023494

	thumb_func_start sub_020234D0
sub_020234D0: ; 0x020234D0
	add r2, r1, #0
	add r2, #0x46
	ldrh r2, [r2]
	ldr r3, _0202350C ; =sub_020233D8
	add r2, r2, r0
	add r0, r1, #0
	add r0, #0x46
	strh r2, [r0]
	add r0, r1, #0
	add r0, #0x46
	ldrh r0, [r0]
	asr r0, r0, #4
	lsl r2, r0, #2
	ldr r0, _02023510 ; =0x021094DC
	ldrsh r2, [r0, r2]
	str r2, [r1]
	add r2, r1, #0
	add r2, #0x46
	ldrh r2, [r2]
	asr r2, r2, #4
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r0, [r0, r2]
	str r0, [r1, #4]
	add r0, r1, #0
	add r0, #0x44
	ldrb r0, [r0]
	bx r3
	nop
_0202350C: .word sub_020233D8
_02023510: .word 0x021094DC
	thumb_func_end sub_020234D0

	thumb_func_start sub_02023514
sub_02023514: ; 0x02023514
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	add r2, r0, #0
	bl VEC_Add
	add r4, #0x20
	add r0, r4, #0
	add r1, r5, #0
	add r2, r4, #0
	bl VEC_Add
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023514

	thumb_func_start sub_02023534
sub_02023534: ; 0x02023534
	ldrh r2, [r0]
	strh r2, [r1, #0x3c]
	ldrh r2, [r0, #2]
	strh r2, [r1, #0x3e]
	add r2, r1, #0
	ldrh r3, [r0, #4]
	add r2, #0x40
	strh r3, [r2]
	ldrh r2, [r0, #6]
	add r0, r1, #0
	add r0, #0x42
	strh r2, [r0]
	ldr r3, _02023554 ; =sub_02022E54
	add r0, r1, #0
	bx r3
	nop
_02023554: .word sub_02022E54
	thumb_func_end sub_02023534

	thumb_func_start sub_02023558
sub_02023558: ; 0x02023558
	ldrh r2, [r0]
	strh r2, [r1, #0x3c]
	ldrh r2, [r0, #2]
	strh r2, [r1, #0x3e]
	add r2, r1, #0
	ldrh r3, [r0, #4]
	add r2, #0x40
	strh r3, [r2]
	ldrh r2, [r0, #6]
	add r0, r1, #0
	add r0, #0x42
	strh r2, [r0]
	ldr r3, _02023578 ; =sub_02022D74
	add r0, r1, #0
	bx r3
	nop
_02023578: .word sub_02022D74
	thumb_func_end sub_02023558

	thumb_func_start sub_0202357C
sub_0202357C: ; 0x0202357C
	ldrh r3, [r1, #0x3c]
	ldrh r2, [r0]
	add r2, r3, r2
	strh r2, [r1, #0x3c]
	ldrh r3, [r1, #0x3e]
	ldrh r2, [r0, #2]
	add r2, r3, r2
	strh r2, [r1, #0x3e]
	add r2, r1, #0
	add r2, #0x40
	ldrh r2, [r2]
	ldrh r0, [r0, #4]
	ldr r3, _020235A4 ; =sub_02022E54
	add r2, r2, r0
	add r0, r1, #0
	add r0, #0x40
	strh r2, [r0]
	add r0, r1, #0
	bx r3
	nop
_020235A4: .word sub_02022E54
	thumb_func_end sub_0202357C

	thumb_func_start sub_020235A8
sub_020235A8: ; 0x020235A8
	ldrh r3, [r1, #0x3c]
	ldrh r2, [r0]
	add r2, r3, r2
	strh r2, [r1, #0x3c]
	ldrh r3, [r1, #0x3e]
	ldrh r2, [r0, #2]
	add r2, r3, r2
	strh r2, [r1, #0x3e]
	add r2, r1, #0
	add r2, #0x40
	ldrh r2, [r2]
	ldrh r0, [r0, #4]
	ldr r3, _020235D0 ; =sub_02022D74
	add r2, r2, r0
	add r0, r1, #0
	add r0, #0x40
	strh r2, [r0]
	add r0, r1, #0
	bx r3
	nop
_020235D0: .word sub_02022D74
	thumb_func_end sub_020235A8

	thumb_func_start sub_020235D4
sub_020235D4: ; 0x020235D4
	ldr r3, _020235DC ; =sub_02022D74
	str r0, [r1, #0x38]
	add r0, r1, #0
	bx r3
	.balign 4, 0
_020235DC: .word sub_02022D74
	thumb_func_end sub_020235D4

	thumb_func_start sub_020235E0
sub_020235E0: ; 0x020235E0
	push {r4, lr}
	add r3, r1, #0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	add r0, r3, #0
	bl sub_02022D74
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020235E0

	thumb_func_start sub_020235FC
sub_020235FC: ; 0x020235FC
	ldr r2, [r1, #0x38]
	ldr r3, _02023608 ; =sub_02022D74
	add r0, r2, r0
	str r0, [r1, #0x38]
	add r0, r1, #0
	bx r3
	.balign 4, 0
_02023608: .word sub_02022D74
	thumb_func_end sub_020235FC

	thumb_func_start sub_0202360C
sub_0202360C: ; 0x0202360C
	add r0, #0x46
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202360C

	thumb_func_start sub_02023614
sub_02023614: ; 0x02023614
	ldr r0, [r0, #0x38]
	bx lr
	thumb_func_end sub_02023614

	thumb_func_start sub_02023618
sub_02023618: ; 0x02023618
	ldrh r2, [r1, #0x3c]
	strh r2, [r0]
	ldrh r2, [r1, #0x3e]
	strh r2, [r0, #2]
	add r2, r1, #0
	add r2, #0x40
	ldrh r2, [r2]
	add r1, #0x42
	strh r2, [r0, #4]
	ldrh r1, [r1]
	strh r1, [r0, #6]
	bx lr
	thumb_func_end sub_02023618

	thumb_func_start sub_02023630
sub_02023630: ; 0x02023630
	add r2, r1, #0
	add r2, #0x20
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_02023630

	thumb_func_start sub_02023640
sub_02023640: ; 0x02023640
	add r2, r1, #0
	add r2, #0x14
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_02023640

	thumb_func_start sub_02023650
sub_02023650: ; 0x02023650
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02023650

	thumb_func_start sub_02023654
sub_02023654: ; 0x02023654
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02023654

	thumb_func_start sub_02023658
sub_02023658: ; 0x02023658
	ldr r0, [r0, #0x54]
	bx lr
	thumb_func_end sub_02023658

	thumb_func_start sub_0202365C
sub_0202365C: ; 0x0202365C
	add r3, r0, #0
	add r2, r1, #0
	ldmia r3!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0202365C

	thumb_func_start sub_0202366C
sub_0202366C: ; 0x0202366C
	add r3, r0, #0
	add r2, r1, #0
	ldmia r3!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0202366C

	thumb_func_start sub_0202367C
sub_0202367C: ; 0x0202367C
	ldr r2, [r0, #0x64]
	cmp r2, #0
	beq _02023690
	cmp r1, #0
	beq _0202368C
	mov r0, #1
	str r0, [r2, #0x24]
	bx lr
_0202368C:
	mov r0, #0
	str r0, [r2, #0x24]
_02023690:
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202367C

	thumb_func_start sub_02023694
sub_02023694: ; 0x02023694
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	str r2, [r0, #4]
	add r1, r0, #0
	str r2, [r0, #8]
	add r1, #0xd0
	str r2, [r1]
	add r1, r0, #0
	add r1, #0xd4
	str r2, [r1]
	add r1, r0, #0
	add r1, #0xd8
	str r2, [r1]
	add r1, r0, #0
	add r1, #0xdc
	str r2, [r1]
	strb r2, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023694

	thumb_func_start sub_020236BC
sub_020236BC: ; 0x020236BC
	mov r3, #0
	str r3, [r0, #0x28]
	add r1, r0, #0
	str r3, [r0, #0x2c]
	add r1, #0x84
	str r3, [r1]
	add r1, r0, #0
	add r1, #0x88
	str r3, [r1]
	add r1, r0, #0
	add r1, #0x8c
	str r3, [r1]
	add r1, r0, #0
	add r1, #0x90
	add r2, r0, #0
	str r3, [r1]
	add r2, #0xa0
	mov r1, #0x10
_020236E0:
	strb r3, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _020236E0
	add r2, r0, #0
	mov r1, #0
	add r2, #0x94
	str r1, [r2]
	add r2, r0, #0
	add r2, #0x98
	str r1, [r2]
	add r2, r0, #0
	add r2, #0x9c
	str r1, [r2]
	add r2, r0, #0
	add r2, #0xb0
	str r1, [r2]
	str r1, [r0]
	str r1, [r0, #4]
	mov r2, #1
	str r1, [r0, #8]
	lsl r2, r2, #0xc
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	str r2, [r0, #0x14]
	add r2, r0, #0
	str r1, [r0, #0x18]
	add r2, #0xb6
	strh r1, [r2]
	add r2, r0, #0
	add r2, #0xb4
	strb r1, [r2]
	add r2, r0, #0
	add r2, #0xbc
	str r1, [r2]
	add r2, r0, #0
	add r2, #0xc0
	str r1, [r2]
	add r2, r0, #0
	add r2, #0x24
	strb r1, [r2]
	str r1, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020236BC

	thumb_func_start sub_02023738
sub_02023738: ; 0x02023738
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02023774 ; =0x021D2208
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _0202374A
	bl GF_AssertFail
_0202374A:
	mov r1, #0xe0
	add r0, r4, #0
	mul r1, r6
	bl AllocFromHeap
	ldr r7, _02023774 ; =0x021D2208
	mov r4, #0
	str r0, [r7]
	str r6, [r7, #4]
	cmp r6, #0
	ble _02023772
	add r5, r4, #0
_02023762:
	ldr r0, [r7]
	add r0, r0, r5
	bl sub_02023694
	add r4, r4, #1
	add r5, #0xe0
	cmp r4, r6
	blt _02023762
_02023772:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02023774: .word 0x021D2208
	thumb_func_end sub_02023738

	thumb_func_start sub_02023778
sub_02023778: ; 0x02023778
	push {r4, r5, r6, lr}
	ldr r6, _020237AC ; =0x021D2208
	mov r4, #0
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _02023798
	add r5, r4, #0
_02023786:
	ldr r0, [r6]
	add r0, r0, r5
	bl sub_02023874
	ldr r0, [r6, #4]
	add r4, r4, #1
	add r5, #0xe0
	cmp r4, r0
	blt _02023786
_02023798:
	ldr r0, _020237AC ; =0x021D2208
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020237AC ; =0x021D2208
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	pop {r4, r5, r6, pc}
	nop
_020237AC: .word 0x021D2208
	thumb_func_end sub_02023778

	thumb_func_start sub_020237B0
sub_020237B0: ; 0x020237B0
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _020237E8 ; =0x021D2208
	mov r4, #0
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _020237E4
	add r5, r4, #0
	mov r7, #2
_020237C0:
	ldr r0, [r6]
	add r0, r0, r5
	ldrb r1, [r0, #1]
	cmp r1, #1
	bne _020237CE
	bl sub_02023950
_020237CE:
	ldr r0, [r6]
	add r1, r0, r5
	ldrb r0, [r1, #3]
	cmp r0, #1
	bne _020237DA
	strb r7, [r1, #3]
_020237DA:
	ldr r0, [r6, #4]
	add r4, r4, #1
	add r5, #0xe0
	cmp r4, r0
	blt _020237C0
_020237E4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020237E8: .word 0x021D2208
	thumb_func_end sub_020237B0

	thumb_func_start sub_020237EC
sub_020237EC: ; 0x020237EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0202391C
	add r4, r0, #0
	bne _02023800
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02023800:
	mov r0, #1
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r2, [r5]
	mov r1, #0xc4
	ldr r0, [r5, #4]
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldr r0, [r5]
	str r0, [r4, #8]
	add r0, r4, #0
	add r0, #0xc
	bl sub_020236BC
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0xc
	add r0, #0xc8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
	ldr r1, [r5]
	ldr r0, [r5, #4]
	lsl r1, r1, #2
	bl AllocFromHeap
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	add r0, r4, #0
	bl sub_02024248
	ldr r0, [r5, #4]
	mov r1, #0x10
	bl AllocFromHeap
	add r1, r4, #0
	add r1, #0xd8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	ldr r1, [r5, #4]
	mov r2, #4
	bl sub_0201AC14
	ldr r0, [r5]
	ldr r1, [r5, #4]
	bl sub_0202068C
	add r1, r4, #0
	add r1, #0xdc
	str r0, [r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020237EC

	thumb_func_start sub_02023874
sub_02023874: ; 0x02023874
	push {r4, lr}
	add r4, r0, #0
	bne _02023882
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_02023882:
	ldrb r1, [r4]
	cmp r1, #0
	beq _020238B6
	bl sub_020238BC
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl sub_020206C8
	add r0, r4, #0
	bl sub_02023694
_020238B6:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023874

	thumb_func_start sub_020238BC
sub_020238BC: ; 0x020238BC
	push {r3, r4, r5, lr}
	cmp r0, #0
	bne _020238CC
	bne _020238C8
	bl GF_AssertFail
_020238C8:
	mov r0, #0
	pop {r3, r4, r5, pc}
_020238CC:
	ldrb r1, [r0]
	cmp r1, #0
	beq _020238F2
	add r1, r0, #0
	add r1, #0xc8
	add r4, r0, #0
	ldr r1, [r1]
	add r4, #0xc
	cmp r1, r4
	beq _020238F2
_020238E0:
	add r0, r1, #0
	add r0, #0xbc
	ldr r5, [r0]
	add r0, r1, #0
	bl sub_02023DA4
	add r1, r5, #0
	cmp r5, r4
	bne _020238E0
_020238F2:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020238BC

	thumb_func_start sub_020238F8
sub_020238F8: ; 0x020238F8
	push {r4, lr}
	add r4, r0, #0
	bne _02023902
	bl GF_AssertFail
_02023902:
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0202390C
	mov r0, #0
	pop {r4, pc}
_0202390C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020238F8

	thumb_func_start sub_02023910
sub_02023910: ; 0x02023910
	ldrb r1, [r0, #3]
	cmp r1, #2
	bne _0202391A
	mov r1, #0
	strb r1, [r0, #3]
_0202391A:
	bx lr
	thumb_func_end sub_02023910

	thumb_func_start sub_0202391C
sub_0202391C: ; 0x0202391C
	push {r3, r4}
	ldr r0, _0202394C ; =0x021D2208
	mov r1, #0
	ldr r3, [r0, #4]
	cmp r3, #0
	ble _02023944
	ldr r4, [r0]
	add r2, r4, #0
_0202392C:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0202393C
	mov r0, #0xe0
	mul r0, r1
	add r0, r4, r0
	pop {r3, r4}
	bx lr
_0202393C:
	add r1, r1, #1
	add r2, #0xe0
	cmp r1, r3
	blt _0202392C
_02023944:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_0202394C: .word 0x021D2208
	thumb_func_end sub_0202391C

	thumb_func_start sub_02023950
sub_02023950: ; 0x02023950
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	bne _0202395C
	bl GF_AssertFail
_0202395C:
	add r0, sp, #0
	bl MTX_Identity33_
	add r0, r5, #0
	add r0, #0xc8
	ldr r4, [r0]
	add r5, #0xc
	cmp r4, r5
	beq _020239CC
	add r6, sp, #0
_02023970:
	add r0, r4, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _020239C4
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _02023986
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	blx r2
_02023986:
	add r0, r4, #0
	bl sub_020243FC
	add r0, r4, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0202399E
	add r0, r4, #0
	bl sub_02023FEC
	b _020239A8
_0202399E:
	cmp r0, #2
	bne _020239A8
	add r0, r4, #0
	bl sub_02023FC0
_020239A8:
	ldr r2, [r4, #0x18]
	cmp r2, #0
	bne _020239B0
	add r2, r6, #0
_020239B0:
	add r0, r4, #0
	add r3, r4, #0
	add r0, #0x30
	add r1, r4, #0
	add r3, #0xc
	bl sub_0201F554
	add r0, r4, #0
	bl sub_0202441C
_020239C4:
	add r4, #0xbc
	ldr r4, [r4]
	cmp r4, r5
	bne _02023970
_020239CC:
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02023950

	thumb_func_start sub_020239D0
sub_020239D0: ; 0x020239D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x28]
	add r4, r1, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02023C04
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023C20
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02023C9C
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02023A06
	add r6, #0xc
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020242E4
_02023A06:
	add r0, r5, #0
	mov r1, #2
	add r0, #0xb4
	strb r1, [r0]
	ldr r0, [r4, #8]
	mov r1, #0
	str r0, [r5, #0x2c]
	add r0, r5, #0
	add r0, #0xb6
	strh r1, [r0]
	add r5, #0xb8
	str r1, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020239D0

	thumb_func_start sub_02023A20
sub_02023A20: ; 0x02023A20
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x28]
	add r4, r1, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02023C04
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023A4A
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x94
	add r1, #0x98
	add r2, #0x9c
	bl sub_02023B70
_02023A4A:
	add r0, r5, #0
	ldr r1, [r4, #0x1c]
	add r0, #0x94
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #0x20]
	add r0, #0x98
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #0x24]
	add r0, #0x9c
	str r1, [r0]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023CF0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023D24
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02023A86
	add r6, #0xc
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020242E4
_02023A86:
	add r0, r5, #0
	mov r1, #3
	add r0, #0xb4
	strb r1, [r0]
	ldr r0, [r4, #8]
	mov r1, #0
	str r0, [r5, #0x2c]
	add r0, r5, #0
	add r0, #0xb6
	strh r1, [r0]
	add r5, #0xb8
	str r1, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02023A20

	thumb_func_start sub_02023AA0
sub_02023AA0: ; 0x02023AA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl NNS_G3dTexGetRequiredSize
	str r0, [sp, #8]
	add r0, r5, #0
	bl NNS_G3dTex4x4GetRequiredSize
	str r0, [sp, #4]
	add r0, r5, #0
	bl NNS_G3dPlttGetRequiredSize
	str r0, [sp]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02023ADE
	ldr r3, _02023B30 ; =0x02110924
	mov r1, #0
	ldr r3, [r3]
	add r2, r1, #0
	blx r3
	str r0, [r4]
	cmp r0, #0
	bne _02023AE2
	bl GF_AssertFail
	b _02023AE2
_02023ADE:
	mov r0, #0
	str r0, [r4]
_02023AE2:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02023AFE
	ldr r3, _02023B30 ; =0x02110924
	mov r1, #1
	ldr r3, [r3]
	mov r2, #0
	blx r3
	str r0, [r6]
	cmp r0, #0
	bne _02023B02
	bl GF_AssertFail
	b _02023B02
_02023AFE:
	mov r0, #0
	str r0, [r6]
_02023B02:
	ldr r0, [sp]
	cmp r0, #0
	beq _02023B26
	ldr r3, _02023B34 ; =0x0211092C
	mov r1, #2
	ldrh r2, [r5, #0x20]
	lsl r1, r1, #0xe
	ldr r3, [r3]
	and r1, r2
	mov r2, #0
	blx r3
	str r0, [r7]
	cmp r0, #0
	bne _02023B2A
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02023B26:
	mov r0, #0
	str r0, [r7]
_02023B2A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02023B30: .word 0x02110924
_02023B34: .word 0x0211092C
	thumb_func_end sub_02023AA0

	thumb_func_start sub_02023B38
sub_02023B38: ; 0x02023B38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl sub_020BE4D0
	add r0, r5, #0
	bl sub_020BE588
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023B38

	thumb_func_start sub_02023B4C
sub_02023B4C: ; 0x02023B4C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r2]
	ldr r2, [r3]
	add r5, r0, #0
	bl NNS_G3dTexSetTexKey
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	ldr r1, [r1]
	bl NNS_G3dPlttSetPlttKey
	add r0, r4, #0
	add r1, r5, #0
	bl NNS_G3dBindMdlSet
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023B4C

	thumb_func_start sub_02023B70
sub_02023B70: ; 0x02023B70
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #0
	beq _02023B82
	ldr r1, _02023B9C ; =0x02110928
	ldr r1, [r1]
	blx r1
_02023B82:
	ldr r0, [r5]
	cmp r0, #0
	beq _02023B8E
	ldr r1, _02023B9C ; =0x02110928
	ldr r1, [r1]
	blx r1
_02023B8E:
	ldr r0, [r4]
	cmp r0, #0
	beq _02023B9A
	ldr r1, _02023BA0 ; =0x02110930
	ldr r1, [r1]
	blx r1
_02023B9A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02023B9C: .word 0x02110928
_02023BA0: .word 0x02110930
	thumb_func_end sub_02023B70

	thumb_func_start sub_02023BA4
sub_02023BA4: ; 0x02023BA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	beq _02023BB4
	cmp r5, #0
	bne _02023BBA
_02023BB4:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02023BBA:
	bl NNS_G3dTexGetRequiredSize
	str r0, [sp]
	add r0, r4, #0
	bl NNS_G3dTex4x4GetRequiredSize
	str r0, [sp, #4]
	add r0, r4, #0
	bl NNS_G3dPlttGetRequiredSize
	add r4, r0, #0
	add r0, r5, #0
	bl NNS_G3dTexGetRequiredSize
	add r6, r0, #0
	add r0, r5, #0
	bl NNS_G3dTex4x4GetRequiredSize
	add r7, r0, #0
	add r0, r5, #0
	bl NNS_G3dPlttGetRequiredSize
	ldr r1, [sp]
	cmp r1, r6
	bne _02023BF6
	ldr r1, [sp, #4]
	cmp r1, r7
	bne _02023BF6
	cmp r4, r0
	beq _02023BFC
_02023BF6:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02023BFC:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02023BA4

	thumb_func_start sub_02023C04
sub_02023C04: ; 0x02023C04
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _02023C1C
	bl sub_02020738
	mov r0, #0
	add r4, #0xb0
	str r0, [r4]
_02023C1C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023C04

	thumb_func_start sub_02023C20
sub_02023C20: ; 0x02023C20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x8c
	ldr r4, [r0]
	add r0, r1, #0
	add r1, r5, #0
	add r2, r5, #0
	add r1, #0x88
	add r2, #0x8c
	bl sub_02024328
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	add r1, r5, #0
	add r1, #0x88
	add r0, r5, #0
	ldr r1, [r1]
	add r0, #0x30
	bl NNS_G3dRenderObjInit
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #3
	beq _02023C62
	add r1, r5, #0
	add r1, #0x8c
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_02023BA4
	b _02023C64
_02023C62:
	mov r0, #0
_02023C64:
	cmp r0, #0
	bne _02023C98
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023C82
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x94
	add r1, #0x98
	add r2, #0x9c
	bl sub_02023B70
_02023C82:
	add r0, r5, #0
	add r0, #0x8c
	add r1, r5, #0
	add r2, r5, #0
	add r5, #0x9c
	ldr r0, [r0]
	add r1, #0x94
	add r2, #0x98
	add r3, r5, #0
	bl sub_02023AA0
_02023C98:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023C20

	thumb_func_start sub_02023C9C
sub_02023C9C: ; 0x02023C9C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	add r0, r4, #0
	bl sub_02024374
	add r1, r5, #0
	add r1, #0x90
	add r3, r5, #0
	add r3, #0xa0
	str r0, [r1]
	add r4, #0xc
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r5, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r1, r2, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	add r2, r5, #0
	add r3, r5, #0
	str r0, [sp, #4]
	add r6, #0xdc
	add r2, #0x90
	add r3, #0x94
	ldr r0, [r6]
	ldr r2, [r2]
	ldr r3, [r3]
	bl sub_020206E0
	add r5, #0xb0
	str r0, [r5]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02023C9C

	thumb_func_start sub_02023CF0
sub_02023CF0: ; 0x02023CF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, r4, #0
	add r1, #0x88
	add r2, #0x8c
	bl sub_02024328
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	add r1, r5, #0
	add r1, #0x88
	add r0, r5, #0
	ldr r1, [r1]
	add r0, #0x30
	bl NNS_G3dRenderObjInit
	add r0, r4, #0
	bl sub_02024374
	add r5, #0x90
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023CF0

	thumb_func_start sub_02023D24
sub_02023D24: ; 0x02023D24
	push {r3, r4}
	add r4, r0, #0
	add r2, r4, #0
	add r3, r1, #0
	add r3, #0xc
	add r2, #0xa0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0
	add r4, #0xb0
	str r0, [r4]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023D24

	thumb_func_start sub_02023D44
sub_02023D44: ; 0x02023D44
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5]
	cmp r6, #0
	bne _02023D52
	mov r0, #0
	pop {r4, r5, r6, pc}
_02023D52:
	add r0, r6, #0
	bl sub_02024280
	add r4, r0, #0
	bne _02023D60
	mov r0, #0
	pop {r4, r5, r6, pc}
_02023D60:
	add r3, r5, #0
	str r6, [r4, #0x28]
	add r3, #8
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, r5, #0
	str r0, [r2]
	add r3, #0x14
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	add r0, r4, #0
	add r0, #0xb6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #1
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xb4
	strb r1, [r0]
	ldr r1, [r5, #4]
	add r0, r4, #0
	bl sub_02024380
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02023D44

	thumb_func_start sub_02023DA4
sub_02023DA4: ; 0x02023DA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _02023DAE
	bl GF_AssertFail
_02023DAE:
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02023DBC
	bl GF_AssertFail
_02023DBC:
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	ldr r4, [r5, #0x28]
	cmp r0, #0
	bne _02023DCC
	mov r0, #0
	pop {r3, r4, r5, pc}
_02023DCC:
	add r0, r5, #0
	bl sub_02024308
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023DEC
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x94
	add r1, #0x98
	add r2, #0x9c
	bl sub_02023B70
_02023DEC:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02023C04
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020242AC
	mov r0, #1
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023DA4

	thumb_func_start sub_02023E04
sub_02023E04: ; 0x02023E04
	push {r3, r4}
	add r4, r0, #0
	str r1, [r4]
	str r2, [r4, #4]
	str r3, [r4, #8]
	ldr r3, [sp, #8]
	add r2, r4, #0
	add r2, #0xc
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp, #0xc]
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x14]
	str r0, [r4, #0x24]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02023E04

	thumb_func_start sub_02023E2C
sub_02023E2C: ; 0x02023E2C
	push {r3, r4}
	add r4, r0, #0
	str r1, [r4]
	str r2, [r4, #4]
	str r3, [r4, #8]
	ldr r3, [sp, #8]
	add r2, r4, #0
	add r2, #0xc
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02023E2C

	thumb_func_start sub_02023E50
sub_02023E50: ; 0x02023E50
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _02023E5E
	bl GF_AssertFail
_02023E5E:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023E50

	thumb_func_start sub_02023E68
sub_02023E68: ; 0x02023E68
	push {r4, lr}
	add r4, r0, #0
	bne _02023E72
	bl GF_AssertFail
_02023E72:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023E68

	thumb_func_start sub_02023E78
sub_02023E78: ; 0x02023E78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _02023E86
	bl GF_AssertFail
_02023E86:
	ldmia r5!, {r0, r1}
	add r4, #0xc
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023E78

	thumb_func_start sub_02023E94
sub_02023E94: ; 0x02023E94
	push {r4, lr}
	add r4, r0, #0
	bne _02023E9E
	bl GF_AssertFail
_02023E9E:
	add r4, #0xc
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02023E94

	thumb_func_start sub_02023EA4
sub_02023EA4: ; 0x02023EA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023EB2
	bl GF_AssertFail
_02023EB2:
	add r5, #0x24
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023EA4

	thumb_func_start sub_02023EB8
sub_02023EB8: ; 0x02023EB8
	push {r4, lr}
	add r4, r0, #0
	bne _02023EC2
	bl GF_AssertFail
_02023EC2:
	add r4, #0x24
	ldrb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023EB8

	thumb_func_start sub_02023EC8
sub_02023EC8: ; 0x02023EC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023ED6
	bl GF_AssertFail
_02023ED6:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02024380
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023EC8

	thumb_func_start sub_02023EE0
sub_02023EE0: ; 0x02023EE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023EEE
	bl GF_AssertFail
_02023EEE:
	add r5, #0xb6
	strh r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023EE0

	thumb_func_start sub_02023EF4
sub_02023EF4: ; 0x02023EF4
	push {r4, lr}
	add r4, r0, #0
	bne _02023EFE
	bl GF_AssertFail
_02023EFE:
	add r4, #0xb6
	ldrh r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023EF4

	thumb_func_start sub_02023F04
sub_02023F04: ; 0x02023F04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023F12
	bl GF_AssertFail
_02023F12:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020243A4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023F04

	thumb_func_start sub_02023F1C
sub_02023F1C: ; 0x02023F1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023F2A
	bl GF_AssertFail
_02023F2A:
	add r5, #0xb8
	str r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023F1C

	thumb_func_start sub_02023F30
sub_02023F30: ; 0x02023F30
	push {r4, lr}
	add r4, r0, #0
	bne _02023F3A
	bl GF_AssertFail
_02023F3A:
	add r4, #0xb8
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023F30

	thumb_func_start sub_02023F40
sub_02023F40: ; 0x02023F40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023F4E
	bl GF_AssertFail
_02023F4E:
	add r1, r5, #0
	add r1, #0xb6
	ldrh r1, [r1]
	add r0, r5, #0
	bl sub_02024394
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	add r5, #0xb8
	add r0, r0, r4
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023F40

	thumb_func_start sub_02023F70
sub_02023F70: ; 0x02023F70
	push {r4, lr}
	add r4, r0, #0
	bne _02023F7A
	bl GF_AssertFail
_02023F7A:
	add r1, r4, #0
	add r1, #0xb6
	ldrh r1, [r1]
	add r0, r4, #0
	bl sub_02024394
	add r4, #0xb8
	ldr r1, [r4]
	sub r0, r1, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023F70

	thumb_func_start sub_02023F90
sub_02023F90: ; 0x02023F90
	push {r4, lr}
	add r4, r0, #0
	bne _02023F9A
	bl GF_AssertFail
_02023F9A:
	add r4, #0x88
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023F90

	thumb_func_start sub_02023FA0
sub_02023FA0: ; 0x02023FA0
	push {r4, lr}
	add r4, r0, #0
	bne _02023FAA
	bl GF_AssertFail
_02023FAA:
	add r4, #0x94
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023FA0

	thumb_func_start sub_02023FB0
sub_02023FB0: ; 0x02023FB0
	push {r4, lr}
	add r4, r0, #0
	bne _02023FBA
	bl GF_AssertFail
_02023FBA:
	add r4, #0x9c
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023FB0

	thumb_func_start sub_02023FC0
sub_02023FC0: ; 0x02023FC0
	push {r3, lr}
	add r1, r0, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023FDA
	add r0, r1, #0
	add r0, #0xb0
	add r1, #0xb8
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_02020764
_02023FDA:
	pop {r3, pc}
	thumb_func_end sub_02023FC0

	thumb_func_start sub_02023FDC
sub_02023FDC: ; 0x02023FDC
	add r0, #0x88
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023FDC

	thumb_func_start sub_02023FE4
sub_02023FE4: ; 0x02023FE4
	str r2, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023FE4

	thumb_func_start sub_02023FEC
sub_02023FEC: ; 0x02023FEC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r0, #0xa0
	lsl r1, r1, #4
	lsr r1, r1, #0x10
	bl sub_02026DE0
	add r2, sp, #0
	strb r0, [r2]
	lsr r0, r0, #8
	strb r0, [r2, #1]
	ldrb r0, [r2]
	add r1, r4, #0
	add r1, #0x90
	strb r0, [r2, #2]
	ldrb r0, [r2, #1]
	strb r0, [r2, #3]
	add r0, r4, #0
	add r0, #0x88
	ldrb r2, [r2, #2]
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0202403C
	add r0, r4, #0
	add r2, sp, #0
	add r0, #0x88
	add r4, #0x90
	ldrb r2, [r2, #3]
	ldr r0, [r0]
	ldr r1, [r4]
	bl sub_02024140
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023FEC

	thumb_func_start sub_0202403C
sub_0202403C: ; 0x0202403C
	push {r3, r4, r5, r6, r7, lr}
	cmp r0, #0
	beq _0202404C
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _0202404C
	add r6, r0, r3
	b _0202404E
_0202404C:
	mov r6, #0
_0202404E:
	ldrh r0, [r6]
	add r4, r6, r0
	cmp r1, #0
	beq _0202407C
	add r0, r1, #0
	add r0, #0x3c
	beq _02024078
	add r3, r1, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r2, r3
	bhs _02024078
	add r1, #0x42
	ldrh r1, [r1]
	add r3, r0, r1
	ldrh r0, [r0, r1]
	add r3, r3, #4
	add r1, r0, #0
	mul r1, r2
	add r0, r3, r1
	b _0202407E
_02024078:
	mov r0, #0
	b _0202407E
_0202407C:
	mov r0, #0
_0202407E:
	ldr r0, [r0]
	mov r5, #0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldrb r0, [r4, #1]
	cmp r0, #0
	ble _020240C0
_0202408C:
	cmp r4, #0
	beq _020240A6
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _020240A6
	ldrh r0, [r4, #6]
	add r1, r4, r0
	ldrh r0, [r4, r0]
	add r2, r1, #4
	add r1, r0, #0
	mul r1, r5
	add r1, r2, r1
	b _020240A8
_020240A6:
	mov r1, #0
_020240A8:
	ldrb r2, [r1, #3]
	mov r0, #1
	tst r0, r2
	beq _020240B8
	add r0, r6, #0
	add r2, r7, #0
	bl sub_020240C4
_020240B8:
	ldrb r0, [r4, #1]
	add r5, r5, #1
	cmp r5, r0
	blt _0202408C
_020240C0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202403C

	thumb_func_start sub_020240C4
sub_020240C4: ; 0x020240C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	ldrh r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r1, #0
	ldrb r0, [r0, #2]
	mov r6, #0
	cmp r0, #0
	ble _02024136
	add r7, r5, #4
_020240E2:
	ldr r0, [sp, #8]
	cmp r5, #0
	ldrb r0, [r0, r6]
	beq _0202410E
	cmp r7, #0
	beq _02024102
	ldrb r1, [r5, #5]
	cmp r0, r1
	bhs _02024102
	ldrh r1, [r5, #0xa]
	add r2, r7, r1
	ldrh r1, [r7, r1]
	add r2, r2, #4
	mul r0, r1
	add r0, r2, r0
	b _02024104
_02024102:
	mov r0, #0
_02024104:
	cmp r0, #0
	beq _0202410E
	ldr r0, [r0]
	add r4, r5, r0
	b _02024110
_0202410E:
	mov r4, #0
_02024110:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [sp, #4]
	add r1, r1, r0
	ldr r0, _0202413C ; =0x0000FFFF
	cmp r1, r0
	bls _02024124
	bl GF_AssertFail
_02024124:
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [sp]
	ldrb r0, [r0, #2]
	cmp r6, r0
	blt _020240E2
_02024136:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0202413C: .word 0x0000FFFF
	thumb_func_end sub_020240C4

	thumb_func_start sub_02024140
sub_02024140: ; 0x02024140
	push {r3, r4, r5, r6, r7, lr}
	cmp r0, #0
	beq _02024150
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _02024150
	add r6, r0, r3
	b _02024152
_02024150:
	mov r6, #0
_02024152:
	ldrh r0, [r6, #2]
	add r4, r6, r0
	cmp r1, #0
	beq _0202417E
	ldrh r0, [r1, #0x34]
	cmp r0, #0
	beq _0202417E
	add r0, r1, r0
	beq _0202417A
	ldrb r1, [r0, #1]
	cmp r2, r1
	bhs _0202417A
	ldrh r1, [r0, #6]
	add r3, r0, r1
	ldrh r0, [r0, r1]
	add r3, r3, #4
	add r1, r0, #0
	mul r1, r2
	add r0, r3, r1
	b _02024180
_0202417A:
	mov r0, #0
	b _02024180
_0202417E:
	mov r0, #0
_02024180:
	ldrh r1, [r0, #2]
	ldrh r7, [r0]
	mov r0, #1
	tst r0, r1
	bne _0202418C
	lsr r7, r7, #1
_0202418C:
	ldrb r0, [r4, #1]
	mov r5, #0
	cmp r0, #0
	bls _020241C8
_02024194:
	cmp r4, #0
	beq _020241AE
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _020241AE
	ldrh r0, [r4, #6]
	add r1, r4, r0
	ldrh r0, [r4, r0]
	add r2, r1, #4
	add r1, r0, #0
	mul r1, r5
	add r1, r2, r1
	b _020241B0
_020241AE:
	mov r1, #0
_020241B0:
	ldrb r2, [r1, #3]
	mov r0, #1
	tst r0, r2
	beq _020241C0
	add r0, r6, #0
	add r2, r7, #0
	bl sub_020241CC
_020241C0:
	ldrb r0, [r4, #1]
	add r5, r5, #1
	cmp r5, r0
	blo _02024194
_020241C8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02024140

	thumb_func_start sub_020241CC
sub_020241CC: ; 0x020241CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	ldrh r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r1, #0
	ldrb r0, [r0, #2]
	mov r6, #0
	cmp r0, #0
	bls _0202423E
	add r7, r5, #4
_020241EA:
	ldr r0, [sp, #8]
	cmp r5, #0
	ldrb r0, [r0, r6]
	beq _02024216
	cmp r7, #0
	beq _0202420A
	ldrb r1, [r5, #5]
	cmp r0, r1
	bhs _0202420A
	ldrh r1, [r5, #0xa]
	add r2, r7, r1
	ldrh r1, [r7, r1]
	add r2, r2, #4
	mul r0, r1
	add r0, r2, r0
	b _0202420C
_0202420A:
	mov r0, #0
_0202420C:
	cmp r0, #0
	beq _02024216
	ldr r0, [r0]
	add r4, r5, r0
	b _02024218
_02024216:
	mov r4, #0
_02024218:
	ldrh r1, [r4, #0x1c]
	ldr r0, _02024244 ; =0x00001FFF
	and r1, r0
	ldr r0, [sp, #4]
	add r1, r1, r0
	ldr r0, _02024244 ; =0x00001FFF
	cmp r1, r0
	bls _0202422C
	bl GF_AssertFail
_0202422C:
	ldrh r1, [r4, #0x1c]
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r1, r0
	strh r0, [r4, #0x1c]
	ldr r0, [sp]
	ldrb r0, [r0, #2]
	cmp r6, r0
	blo _020241EA
_0202423E:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02024244: .word 0x00001FFF
	thumb_func_end sub_020241CC

	thumb_func_start sub_02024248
sub_02024248: ; 0x02024248
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	mov r7, #0
	cmp r0, #0
	ble _02024278
	add r4, r7, #0
	add r6, r7, #0
_02024258:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl sub_020236BC
	ldr r0, [r5, #4]
	add r7, r7, #1
	add r1, r0, r4
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r4, #0xc4
	str r1, [r0, r6]
	ldr r0, [r5, #8]
	add r6, r6, #4
	cmp r7, r0
	blt _02024258
_02024278:
	mov r0, #0
	add r5, #0xd4
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02024248

	thumb_func_start sub_02024280
sub_02024280: ; 0x02024280
	add r1, r0, #0
	add r1, #0xd4
	ldr r3, [r1]
	ldr r1, [r0, #8]
	cmp r3, r1
	blt _02024290
	mov r0, #0
	bx lr
_02024290:
	add r1, r0, #0
	add r1, #0xd0
	ldr r2, [r1]
	lsl r1, r3, #2
	ldr r2, [r2, r1]
	add r1, r0, #0
	add r1, #0xd4
	ldr r1, [r1]
	add r0, #0xd4
	add r1, r1, #1
	str r1, [r0]
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024280

	thumb_func_start sub_020242AC
sub_020242AC: ; 0x020242AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xd4
	ldr r0, [r0]
	add r4, r1, #0
	cmp r0, #0
	bgt _020242BE
	mov r0, #0
	pop {r3, r4, r5, pc}
_020242BE:
	add r0, r4, #0
	bl sub_020236BC
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xd0
	add r5, #0xd4
	ldr r1, [r0]
	ldr r0, [r5]
	lsl r0, r0, #2
	str r4, [r1, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020242AC

	thumb_func_start sub_020242E4
sub_020242E4: ; 0x020242E4
	add r2, r0, #0
	add r2, #0xc0
	ldr r3, [r2]
	add r2, r1, #0
	add r2, #0xc0
	str r3, [r2]
	add r2, r0, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r2, #0xbc
	str r1, [r2]
	add r2, r1, #0
	add r2, #0xbc
	str r0, [r2]
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020242E4

	thumb_func_start sub_02024308
sub_02024308: ; 0x02024308
	add r1, r0, #0
	add r1, #0xbc
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r1, #0xbc
	str r2, [r1]
	add r1, r0, #0
	add r0, #0xbc
	add r1, #0xc0
	ldr r0, [r0]
	ldr r1, [r1]
	add r0, #0xc0
	str r1, [r0]
	bx lr
	thumb_func_end sub_02024308

	thumb_func_start sub_02024328
sub_02024328: ; 0x02024328
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0
	add r5, r2, #0
	bl sub_0202443C
	add r7, r0, #0
	bl NNS_G3dGetMdlSet
	add r4, r0, #0
	beq _0202435E
	add r1, r4, #0
	add r1, #8
	beq _02024352
	ldrb r0, [r4, #9]
	cmp r0, #0
	bls _02024352
	ldrh r0, [r4, #0xe]
	add r0, r1, r0
	add r0, r0, #4
	b _02024354
_02024352:
	mov r0, #0
_02024354:
	cmp r0, #0
	beq _0202435E
	ldr r0, [r0]
	add r0, r4, r0
	b _02024360
_0202435E:
	mov r0, #0
_02024360:
	str r0, [r6]
	cmp r5, #0
	beq _0202436E
	add r0, r7, #0
	bl NNS_G3dGetTex
	str r0, [r5]
_0202436E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02024328

	thumb_func_start sub_02024374
sub_02024374: ; 0x02024374
	ldr r3, _0202437C ; =sub_0202443C
	mov r1, #1
	bx r3
	nop
_0202437C: .word sub_0202443C
	thumb_func_end sub_02024374

	thumb_func_start sub_02024380
sub_02024380: ; 0x02024380
	push {r3, lr}
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	bne _0202438E
	bl sub_020239D0
	pop {r3, pc}
_0202438E:
	bl sub_02023A20
	pop {r3, pc}
	thumb_func_end sub_02024380

	thumb_func_start sub_02024394
sub_02024394: ; 0x02024394
	push {r3, lr}
	ldr r0, [r0, #0x2c]
	bl sub_02024454
	ldr r0, [r0]
	lsl r0, r0, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02024394

	thumb_func_start sub_020243A4
sub_020243A4: ; 0x020243A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r1, #0xb6
	ldrh r1, [r1]
	ldr r0, [r5, #0x2c]
	bl sub_02024454
	add r5, #0xb8
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020243C4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020243A4

	thumb_func_start sub_020243C4
sub_020243C4: ; 0x020243C4
	push {r3, r4, r5, r6}
	ldr r4, [r0]
	ldr r6, [r1]
	lsl r4, r4, #0xc
	mov r3, #0
	cmp r4, r6
	bgt _020243DA
	ldr r5, [r0, #4]
	lsl r5, r5, #0xc
	cmp r5, r6
	bge _020243DE
_020243DA:
	str r4, [r1]
	b _020243F6
_020243DE:
	add r2, r6, r2
	cmp r5, r2
	bge _020243F4
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020243EE
	str r4, [r1]
	b _020243F6
_020243EE:
	mov r3, #1
	str r5, [r1]
	b _020243F6
_020243F4:
	str r2, [r1]
_020243F6:
	add r0, r3, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_020243C4

	thumb_func_start sub_020243FC
sub_020243FC: ; 0x020243FC
	push {r3, lr}
	add r3, r0, #0
	add r0, #0x9c
	str r0, [sp]
	add r0, r3, #0
	add r1, r3, #0
	add r2, r3, #0
	add r0, #0x8c
	add r1, #0x84
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, #0x94
	add r3, #0x98
	bl sub_02023B4C
	pop {r3, pc}
	thumb_func_end sub_020243FC

	thumb_func_start sub_0202441C
sub_0202441C: ; 0x0202441C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_020BEDB0
	add r4, #0x8c
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #8
	add r3, sp, #0
	bl sub_02023B38
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0202441C

	thumb_func_start sub_0202443C
sub_0202443C: ; 0x0202443C
	cmp r1, #0
	beq _02024446
	cmp r1, #1
	beq _0202444A
	b _0202444E
_02024446:
	ldr r0, [r0]
	bx lr
_0202444A:
	ldr r0, [r0, #4]
	bx lr
_0202444E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202443C

	thumb_func_start sub_02024454
sub_02024454: ; 0x02024454
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	bx lr
	thumb_func_end sub_02024454

	thumb_func_start sub_0202445C
sub_0202445C: ; 0x0202445C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _02024466
	bl GF_AssertFail
_02024466:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02024470
	bl GF_AssertFail
_02024470:
	mov r1, #0x49
	ldr r0, [r5, #8]
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	bne _02024482
	bl GF_AssertFail
_02024482:
	add r0, r4, #0
	bl sub_020245D4
	ldr r2, [r5]
	ldr r0, [r5, #8]
	lsl r1, r2, #6
	add r1, r2, r1
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r4]
	cmp r0, #0
	bne _020244A0
	bl GF_AssertFail
_020244A0:
	ldr r0, [r5]
	str r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, [r5, #8]
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r4, #8]
	cmp r0, #0
	bne _020244B8
	bl GF_AssertFail
_020244B8:
	add r0, r4, #0
	bl sub_020250D8
	add r0, r4, #0
	add r0, #0x10
	bl sub_020245FC
	add r2, r4, #0
	mov r1, #0x43
	lsl r1, r1, #2
	add r2, #0x10
	str r2, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r5, #4]
	add r1, #8
	str r0, [r4, r1]
	ldr r0, [r5, #8]
	ldr r1, _02024500 ; =0x0210F6E0
	bl sub_0201A3A4
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, r1, #4
	add r1, r4, r1
	bl NNS_G2dGetUnpackedAnimBank
	mov r0, #0x12
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02024500: .word 0x0210F6E0
	thumb_func_end sub_0202445C

	thumb_func_start sub_02024504
sub_02024504: ; 0x02024504
	push {r4, lr}
	add r4, r0, #0
	bne _0202450E
	mov r0, #0
	pop {r4, pc}
_0202450E:
	ldr r1, [r4]
	cmp r1, #0
	bne _02024518
	mov r0, #1
	pop {r4, pc}
_02024518:
	bl sub_02024544
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl sub_020245D4
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024504

	thumb_func_start sub_02024544
sub_02024544: ; 0x02024544
	push {r4, r5, r6, lr}
	cmp r0, #0
	bne _0202454E
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202454E:
	ldr r1, [r0]
	cmp r1, #0
	bne _02024558
	mov r0, #1
	pop {r4, r5, r6, pc}
_02024558:
	mov r1, #0x11
	lsl r1, r1, #4
	add r4, r0, #0
	ldr r1, [r0, r1]
	add r4, #0x10
	cmp r1, r4
	beq _02024578
	mov r6, #1
	lsl r6, r6, #8
_0202456A:
	ldr r5, [r1, r6]
	add r0, r1, #0
	bl sub_02024758
	add r1, r5, #0
	cmp r5, r4
	bne _0202456A
_02024578:
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02024544

	thumb_func_start sub_0202457C
sub_0202457C: ; 0x0202457C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bne _02024586
	bl GF_AssertFail
_02024586:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _020245C8
	sub r0, #0x10
	add r6, r5, #0
	ldr r4, [r5, r0]
	add r6, #0x10
	cmp r4, r6
	beq _020245C8
	ldr r7, _020245CC ; =0x020F6314
_0202459E:
	add r2, r4, #0
	add r2, #0x34
	ldrb r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r7, r2]
	blx r2
	add r1, r4, #0
	add r1, #0x35
	ldrb r1, [r1]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _020245D0 ; =0x020F631C
	ldr r1, [r1, r2]
	blx r1
	mov r0, #1
	lsl r0, r0, #8
	ldr r4, [r4, r0]
	cmp r4, r6
	bne _0202459E
_020245C8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020245CC: .word 0x020F6314
_020245D0: .word 0x020F631C
	thumb_func_end sub_0202457C

	thumb_func_start sub_020245D4
sub_020245D4: ; 0x020245D4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	str r1, [r4]
	str r1, [r4, #4]
	str r1, [r4, #8]
	mov r0, #0x45
	str r1, [r4, #0xc]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x10
	bl sub_020245FC
	mov r0, #0x12
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020245D4

	thumb_func_start sub_020245FC
sub_020245FC: ; 0x020245FC
	push {r4, lr}
	mov r2, #0x41
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	str r1, [r4, #0x3c]
	bl memset
	add r0, r4, #0
	add r0, #0xb4
	bl sub_020B8008
	add r0, r4, #0
	add r0, #0xd8
	bl sub_020B804C
	mov r0, #0
	str r0, [r4, #0x30]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020245FC

	thumb_func_start sub_02024624
sub_02024624: ; 0x02024624
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_02025110
	add r4, r0, #0
	bne _02024636
	mov r0, #0
	pop {r4, r5, r6, pc}
_02024636:
	ldr r0, [r5]
	add r6, r5, #0
	str r0, [r4, #0x3c]
	add r0, r4, #0
	mov r2, #0
	add r0, #0xf0
	add r6, #8
	strh r2, [r0]
	ldmia r6!, {r0, r1}
	add r3, r4, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r6, r5, #0
	str r0, [r3]
	add r6, #0x14
	add r3, r4, #0
	ldmia r6!, {r0, r1}
	add r3, #0x18
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldrh r0, [r5, #0x20]
	strh r0, [r4, #0x24]
	add r0, r4, #0
	ldr r1, [r5, #0x28]
	add r0, #0xf8
	str r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #0x24]
	add r0, #0xf4
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x26
	strb r2, [r0]
	add r0, r4, #0
	add r0, #0x27
	strb r2, [r0]
	str r2, [r4, #0x2c]
	add r0, r4, #0
	str r2, [r4, #0x30]
	mov r1, #0x11
	add r0, #0x28
	strb r1, [r0]
	mov r0, #0x45
	ldr r1, [r5]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r4, #0
	add r1, #0x26
	ldrb r1, [r1]
	bl sub_020BBEC4
	add r0, r4, #0
	add r0, #0x27
	ldrb r2, [r0]
	mov r0, #0x45
	ldr r1, [r5]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	mov r3, #2
	and r1, r2
	and r2, r3
	bl sub_020BBF84
	add r0, r4, #0
	mov r2, #1
	add r0, #0x34
	strb r2, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x35
	strb r1, [r0]
	lsl r0, r2, #0xd
	str r0, [r4, #0x38]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r3, [r5, #0x2c]
	add r2, r4, #0
	bl sub_02024CD0
	cmp r0, #0
	bne _020246E6
	add r0, r4, #0
	bl sub_02024758
	mov r0, #0
	pop {r4, r5, r6, pc}
_020246E6:
	add r1, r4, #0
	add r1, #0xf8
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0xd8
	bl sub_02024E84
	add r1, r4, #0
	add r1, #0x2a
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x2a
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_02025024
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02024624

	thumb_func_start sub_02024714
sub_02024714: ; 0x02024714
	push {r4, lr}
	sub sp, #0x30
	add r2, r0, #0
	ldr r0, [r2]
	add r4, r2, #0
	str r0, [sp]
	ldr r0, [r2, #4]
	add r4, #8
	str r0, [sp, #4]
	ldmia r4!, {r0, r1}
	add r3, sp, #8
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0
	str r0, [r3]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r0, sp, #0
	strh r1, [r0, #0x20]
	ldr r0, [r2, #0x14]
	str r0, [sp, #0x24]
	ldr r0, [r2, #0x18]
	str r0, [sp, #0x28]
	ldr r0, [r2, #0x1c]
	str r0, [sp, #0x2c]
	add r0, sp, #0
	bl sub_02024624
	add sp, #0x30
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024714

	thumb_func_start sub_02024758
sub_02024758: ; 0x02024758
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0xec
	ldr r1, [r1]
	cmp r1, #0
	beq _020247D0
	add r1, r5, #0
	add r1, #0xfc
	ldr r1, [r1]
	cmp r1, #0
	beq _02024774
	bl sub_020250BC
_02024774:
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #3
	bne _0202479E
	add r1, r5, #0
	add r1, #0xf8
	add r0, r5, #0
	add r4, r5, #0
	ldr r1, [r1]
	add r0, #0xb4
	add r4, #0x40
	bl sub_020B802C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0202479E
	ldr r0, [r4, #0x60]
	bl sub_020BAF3C
_0202479E:
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #2
	bne _020247C0
	add r4, r5, #0
	add r4, #0x40
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _020247B6
	bl FreeToHeap
_020247B6:
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _020247C0
	bl FreeToHeap
_020247C0:
	add r0, r5, #0
	mov r1, #0
	add r0, #0xec
	str r1, [r0]
	ldr r0, [r5, #0x3c]
	add r1, r5, #0
	bl sub_0202512C
_020247D0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02024758

	thumb_func_start sub_020247D4
sub_020247D4: ; 0x020247D4
	add r2, r1, #0
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020247D4

	thumb_func_start sub_020247E4
sub_020247E4: ; 0x020247E4
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_020247E4

	thumb_func_start sub_020247F4
sub_020247F4: ; 0x020247F4
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_020247F4

	thumb_func_start sub_02024804
sub_02024804: ; 0x02024804
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_020247F4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202487C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024804

	thumb_func_start sub_02024818
sub_02024818: ; 0x02024818
	strh r1, [r0, #0x24]
	bx lr
	thumb_func_end sub_02024818

	thumb_func_start sub_0202481C
sub_0202481C: ; 0x0202481C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_02024818
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202487C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202481C

	thumb_func_start sub_02024830
sub_02024830: ; 0x02024830
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202483E
	bl GF_AssertFail
_0202483E:
	cmp r4, #2
	blt _02024846
	bl GF_AssertFail
_02024846:
	add r5, #0x34
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024830

	thumb_func_start sub_0202484C
sub_0202484C: ; 0x0202484C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202485A
	bl GF_AssertFail
_0202485A:
	cmp r4, #2
	blt _02024862
	bl GF_AssertFail
_02024862:
	add r5, #0x35
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202484C

	thumb_func_start sub_02024868
sub_02024868: ; 0x02024868
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02024876
	bl GF_AssertFail
_02024876:
	str r4, [r5, #0x38]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02024868

	thumb_func_start sub_0202487C
sub_0202487C: ; 0x0202487C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202488A
	bl GF_AssertFail
_0202488A:
	add r5, #0x26
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202487C

	thumb_func_start sub_02024890
sub_02024890: ; 0x02024890
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202489E
	bl GF_AssertFail
_0202489E:
	add r0, r5, #0
	add r0, #0x27
	strb r4, [r0]
	mov r0, #0
	add r5, #0x26
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024890

	thumb_func_start sub_020248AC
sub_020248AC: ; 0x020248AC
	bx lr
	.balign 4, 0
	thumb_func_end sub_020248AC

	thumb_func_start sub_020248B0
sub_020248B0: ; 0x020248B0
	add r0, #0x18
	bx lr
	thumb_func_end sub_020248B0

	thumb_func_start sub_020248B4
sub_020248B4: ; 0x020248B4
	ldrh r0, [r0, #0x24]
	bx lr
	thumb_func_end sub_020248B4

	thumb_func_start sub_020248B8
sub_020248B8: ; 0x020248B8
	add r0, #0x34
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020248B8

	thumb_func_start sub_020248C0
sub_020248C0: ; 0x020248C0
	add r0, #0x35
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020248C0

	thumb_func_start sub_020248C8
sub_020248C8: ; 0x020248C8
	push {r4, lr}
	add r4, r0, #0
	bne _020248D2
	bl GF_AssertFail
_020248D2:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _020248E0
	cmp r0, #3
	bne _020248E6
_020248E0:
	ldr r0, [r4, #0x44]
	ldrh r0, [r0]
	pop {r4, pc}
_020248E6:
	add r4, #0xb0
	ldr r0, [r4]
	ldrh r0, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020248C8

	thumb_func_start sub_020248F0
sub_020248F0: ; 0x020248F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020248C8
	cmp r0, r4
	bhi _02024902
	bl GF_AssertFail
_02024902:
	lsl r0, r4, #0x10
	lsr r1, r0, #0x10
	add r0, r5, #0
	add r0, #0xf0
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _0202491A
	cmp r0, #3
	bne _02024936
_0202491A:
	add r5, #0x40
	lsl r1, r4, #0x10
	ldr r0, [r5, #4]
	lsr r1, r1, #0x10
	bl sub_020B6E80
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	bl sub_020B8BC4
	mov r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_02024936:
	add r5, #0x40
	ldr r0, [r5, #0x70]
	bl sub_020B6E80
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	bl sub_020B8E98
	mov r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020248F0

	thumb_func_start sub_02024950
sub_02024950: ; 0x02024950
	push {r3, lr}
	add r2, r0, #0
	add r2, #0xf0
	ldrh r2, [r2]
	cmp r2, r1
	beq _02024960
	bl sub_020248F0
_02024960:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02024950

	thumb_func_start sub_02024964
sub_02024964: ; 0x02024964
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _02024974
	cmp r0, #3
	bne _0202498E
_02024974:
	add r5, r4, #0
	add r5, #0x40
	add r0, r5, #0
	add r0, #8
	bl sub_020B781C
	mov r0, #1
	str r0, [r5, #0x14]
	add r0, r4, #0
	mov r1, #0
	bl sub_020249D4
	pop {r3, r4, r5, pc}
_0202498E:
	add r5, r4, #0
	add r5, #0x40
	add r0, r5, #0
	add r0, #8
	bl sub_020B781C
	mov r0, #1
	str r0, [r5, #0x14]
	add r0, r4, #0
	mov r1, #0
	bl sub_020249D4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024964

	thumb_func_start sub_020249A8
sub_020249A8: ; 0x020249A8
	add r0, #0xf0
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020249A8

	thumb_func_start sub_020249B0
sub_020249B0: ; 0x020249B0
	push {r3, lr}
	add r2, r0, #0
	add r2, #0xec
	ldr r2, [r2]
	cmp r2, #1
	beq _020249C0
	cmp r2, #3
	bne _020249CA
_020249C0:
	add r0, #0x40
	add r0, #8
	bl sub_020B8BDC
	pop {r3, pc}
_020249CA:
	add r0, #0x40
	add r0, #8
	bl sub_020B9044
	pop {r3, pc}
	thumb_func_end sub_020249B0

	thumb_func_start sub_020249D4
sub_020249D4: ; 0x020249D4
	push {r3, lr}
	add r2, r0, #0
	add r2, #0xec
	ldr r2, [r2]
	cmp r2, #1
	beq _020249E4
	cmp r2, #3
	bne _020249EE
_020249E4:
	add r0, #0x40
	add r0, #8
	bl sub_020B8BFC
	pop {r3, pc}
_020249EE:
	add r0, #0x40
	add r0, #8
	bl sub_020B9124
	pop {r3, pc}
	thumb_func_end sub_020249D4

	thumb_func_start sub_020249F8
sub_020249F8: ; 0x020249F8
	ldr r3, _02024A00 ; =sub_020B77A8
	add r0, #0x40
	add r0, #8
	bx r3
	.balign 4, 0
_02024A00: .word sub_020B77A8
	thumb_func_end sub_020249F8

	thumb_func_start sub_02024A04
sub_02024A04: ; 0x02024A04
	add r0, #0xf2
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024A04

	thumb_func_start sub_02024A0C
sub_02024A0C: ; 0x02024A0C
	add r0, #0xf2
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024A0C

	thumb_func_start sub_02024A14
sub_02024A14: ; 0x02024A14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02024A22
	bl GF_AssertFail
_02024A22:
	add r0, r5, #0
	add r0, #0x29
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x28
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x28
	bic r1, r0
	strb r1, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024A14

	thumb_func_start sub_02024A48
sub_02024A48: ; 0x02024A48
	push {r4, lr}
	add r4, r0, #0
	bl sub_02024A14
	add r1, r4, #0
	add r1, #0xf8
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0xd8
	bl sub_02024E84
	add r1, r4, #0
	add r1, #0x29
	ldrb r1, [r1]
	add r4, #0x29
	add r0, r1, r0
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02024A48

	thumb_func_start sub_02024A6C
sub_02024A6C: ; 0x02024A6C
	add r0, #0x29
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024A6C

	thumb_func_start sub_02024A74
sub_02024A74: ; 0x02024A74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02024A82
	bl GF_AssertFail
_02024A82:
	add r0, r5, #0
	add r0, #0x2a
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #0x10
	orr r1, r0
	add r0, r5, #0
	add r0, #0x28
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #2
	add r5, #0x28
	bic r1, r0
	strb r1, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024A74

	thumb_func_start sub_02024AA8
sub_02024AA8: ; 0x02024AA8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02024A74
	add r1, r4, #0
	add r1, #0xf8
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0xd8
	bl sub_02024E84
	add r1, r4, #0
	add r1, #0x2a
	ldrb r1, [r1]
	add r4, #0x2a
	add r0, r1, r0
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02024AA8

	thumb_func_start sub_02024ACC
sub_02024ACC: ; 0x02024ACC
	push {r4, lr}
	add r4, r0, #0
	bne _02024AD6
	bl GF_AssertFail
_02024AD6:
	add r4, #0x2a
	ldrb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02024ACC

	thumb_func_start sub_02024ADC
sub_02024ADC: ; 0x02024ADC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r2, r5, #0
	ldr r4, [r5, #0x3c]
	add r2, #0xf4
	strh r1, [r2]
	bl sub_020250BC
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02025024
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02024ADC

	thumb_func_start sub_02024AF8
sub_02024AF8: ; 0x02024AF8
	add r0, #0xf4
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024AF8

	thumb_func_start sub_02024B00
sub_02024B00: ; 0x02024B00
	push {r3, r4}
	add r3, r0, #0
	add r4, r1, #0
	add r3, #0xb4
	mov r2, #4
_02024B0A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02024B0A
	ldr r0, [r4]
	str r0, [r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024B00

	thumb_func_start sub_02024B1C
sub_02024B1C: ; 0x02024B1C
	add r0, #0xb4
	bx lr
	thumb_func_end sub_02024B1C

	thumb_func_start sub_02024B20
sub_02024B20: ; 0x02024B20
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0xd8
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_02024B20

	thumb_func_start sub_02024B34
sub_02024B34: ; 0x02024B34
	add r0, #0xd8
	bx lr
	thumb_func_end sub_02024B34

	thumb_func_start sub_02024B38
sub_02024B38: ; 0x02024B38
	str r1, [r0, #0x2c]
	cmp r1, #1
	bne _02024B4E
	add r1, r0, #0
	add r1, #0x28
	ldrb r2, [r1]
	mov r1, #4
	add r0, #0x28
	orr r1, r2
	strb r1, [r0]
	bx lr
_02024B4E:
	add r1, r0, #0
	add r1, #0x28
	ldrb r2, [r1]
	mov r1, #4
	eor r1, r2
	add r0, #0x28
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024B38

	thumb_func_start sub_02024B60
sub_02024B60: ; 0x02024B60
	add r0, #0xf8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024B60

	thumb_func_start sub_02024B68
sub_02024B68: ; 0x02024B68
	push {r4, lr}
	add r4, r0, #0
	bne _02024B72
	bl GF_AssertFail
_02024B72:
	ldr r0, [r4, #0x54]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024B68

	thumb_func_start sub_02024B78
sub_02024B78: ; 0x02024B78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _02024B86
	bl GF_AssertFail
_02024B86:
	str r5, [r4, #0x30]
	cmp r5, #0
	bne _02024B9C
	add r0, r4, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #8
	add r4, #0x28
	eor r0, r1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02024B9C:
	add r0, r4, #0
	add r0, #0x28
	ldrb r1, [r0]
	mov r0, #8
	orr r0, r1
	add r4, #0x28
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024B78

	thumb_func_start sub_02024BAC
sub_02024BAC: ; 0x02024BAC
	push {r4, lr}
	add r4, r0, #0
	bne _02024BB6
	bl GF_AssertFail
_02024BB6:
	ldr r0, [r4, #0x30]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024BAC

	thumb_func_start sub_02024BBC
sub_02024BBC: ; 0x02024BBC
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0xb
	mov r2, #1
	lsl r0, r0, #6
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl sub_020D4790
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl DC_FlushRange
	mov r2, #1
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #0xa
	bl sub_020CFDC8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02024BBC

	thumb_func_start sub_02024BF4
sub_02024BF4: ; 0x02024BF4
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0xb
	mov r2, #1
	lsl r0, r0, #6
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl sub_020D4790
	mov r2, #1
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #0xa
	bl sub_020CFE1C
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024BF4

	thumb_func_start sub_02024C24
sub_02024C24: ; 0x02024C24
	push {r3, r4}
	add r3, r0, #0
	add r3, #0xec
	ldr r3, [r3]
	cmp r3, #1
	beq _02024C34
	cmp r3, #3
	bne _02024C38
_02024C34:
	ldr r0, [r0, #0x44]
	b _02024C3C
_02024C38:
	add r0, #0xb0
	ldr r0, [r0]
_02024C3C:
	ldr r4, [r0, #0x14]
	cmp r4, #0
	beq _02024C4A
	ldr r3, [r4]
	ldr r0, _02024C98 ; =0x55414154
	cmp r3, r0
	beq _02024C4C
_02024C4A:
	mov r4, #0
_02024C4C:
	cmp r4, #0
	beq _02024C54
	add r4, #8
	b _02024C56
_02024C54:
	mov r4, #0
_02024C56:
	cmp r4, #0
	beq _02024C92
	lsl r0, r1, #0x10
	lsr r3, r0, #0x10
	ldrh r0, [r4]
	cmp r3, r0
	bhs _02024C6E
	mov r0, #0xc
	ldr r1, [r4, #4]
	mul r0, r3
	add r1, r1, r0
	b _02024C70
_02024C6E:
	mov r1, #0
_02024C70:
	cmp r1, #0
	beq _02024C92
	ldrh r0, [r1]
	cmp r0, #0
	beq _02024C84
	lsl r0, r2, #0x10
	ldr r1, [r1, #8]
	lsr r0, r0, #0xe
	add r0, r1, r0
	b _02024C86
_02024C84:
	mov r0, #0
_02024C86:
	cmp r0, #0
	beq _02024C92
	ldr r0, [r0]
	ldr r0, [r0]
	pop {r3, r4}
	bx lr
_02024C92:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02024C98: .word 0x55414154
	thumb_func_end sub_02024C24

	thumb_func_start sub_02024C9C
sub_02024C9C: ; 0x02024C9C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020249A8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020249F8
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02024C24
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02024C9C

	thumb_func_start sub_02024CB8
sub_02024CB8: ; 0x02024CB8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #2
	bne _02024CC8
	bl GF_AssertFail
_02024CC8:
	add r4, #0x40
	add r4, #8
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02024CB8

	thumb_func_start sub_02024CD0
sub_02024CD0: ; 0x02024CD0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r4, r2, #0
	add r0, r5, #0
	add r7, r3, #0
	bl sub_02024D78
	add r1, r4, #0
	add r1, #0xec
	str r0, [r1]
	add r3, r4, #0
	ldr r6, [r5]
	add r3, #0xb4
	mov r2, #4
_02024CEE:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02024CEE
	ldr r0, [r6]
	add r2, r4, #0
	str r0, [r3]
	ldr r3, [r5, #8]
	add r2, #0xd8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r4, #0
	str r0, [r2]
	ldr r0, [r5, #0xc]
	bl sub_02024D90
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _02024D22
	add r1, r4, #0
	bl sub_02024D94
	b _02024D30
_02024D22:
	mov r1, #0x47
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	add r1, r4, #0
	bl sub_02024D94
_02024D30:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #2
	bne _02024D54
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl sub_02024D98
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl sub_02024DA0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02024E24
	b _02024D6C
_02024D54:
	cmp r0, #3
	bne _02024D64
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02024DC8
	b _02024D6C
_02024D64:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02024DA8
_02024D6C:
	add r5, #0x20
	ldrb r0, [r5]
	add r4, #0xf2
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02024CD0

	thumb_func_start sub_02024D78
sub_02024D78: ; 0x02024D78
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _02024D82
	mov r0, #2
	bx lr
_02024D82:
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	bne _02024D8C
	mov r0, #3
	bx lr
_02024D8C:
	mov r0, #1
	bx lr
	thumb_func_end sub_02024D78

	thumb_func_start sub_02024D90
sub_02024D90: ; 0x02024D90
	str r0, [r1, #0x40]
	bx lr
	thumb_func_end sub_02024D90

	thumb_func_start sub_02024D94
sub_02024D94: ; 0x02024D94
	str r0, [r1, #0x44]
	bx lr
	thumb_func_end sub_02024D94

	thumb_func_start sub_02024D98
sub_02024D98: ; 0x02024D98
	add r1, #0xac
	str r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024D98

	thumb_func_start sub_02024DA0
sub_02024DA0: ; 0x02024DA0
	add r1, #0xb0
	str r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024DA0

	thumb_func_start sub_02024DA8
sub_02024DA8: ; 0x02024DA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x40
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_020B6E80
	add r4, #8
	add r1, r0, #0
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	bl sub_020B8B04
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02024DA8

	thumb_func_start sub_02024DC8
sub_02024DC8: ; 0x02024DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r1, #0
	add r4, r6, #0
	add r4, #0x40
	add r5, r0, #0
	bl sub_020BAEE4
	str r0, [r4, #0x60]
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r5, [r5, #4]
	bl sub_020B6E80
	str r0, [sp, #0x18]
	add r0, r6, #0
	add r0, #0xb4
	mov r1, #1
	bl sub_020B802C
	add r7, r0, #0
	add r0, r6, #0
	add r0, #0xb4
	mov r1, #2
	bl sub_020B802C
	mov r1, #0
	mvn r1, r1
	str r1, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	ldr r2, [r6, #0x40]
	ldr r3, [r4, #0x60]
	add r0, #8
	bl sub_020B8B40
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02024DC8

	thumb_func_start sub_02024E24
sub_02024E24: ; 0x02024E24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x40
	ldr r0, [r4, #0x70]
	add r7, r1, #0
	mov r1, #0
	bl sub_020B6E80
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x6c]
	bl sub_020B8F50
	add r6, r0, #0
	mov r1, #0x28
	add r0, r7, #0
	mul r1, r6
	bl AllocFromHeap
	mov r1, #0x58
	str r0, [r4, #0x74]
	add r0, r7, #0
	mul r1, r6
	bl AllocFromHeap
	str r0, [r4, #0x78]
	ldr r0, [r4, #4]
	add r3, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0x40]
	str r0, [sp, #4]
	ldr r0, [r4, #0x6c]
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, [r4, #0x74]
	ldr r2, [r4, #0x78]
	add r0, #8
	bl sub_020B91D8
	add r4, #8
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl sub_020B8E98
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02024E24

	thumb_func_start sub_02024E84
sub_02024E84: ; 0x02024E84
	push {r4, lr}
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _02024E92
	mov r4, #2
	lsl r4, r4, #8
	b _02024E9E
_02024E92:
	ldr r2, [r0]
	cmp r2, #4
	bne _02024E9C
	mov r4, #0
	b _02024E9E
_02024E9C:
	mov r4, #0x20
_02024E9E:
	cmp r4, #0
	beq _02024EAE
	bl sub_020B8078
	add r1, r4, #0
	bl _u32_div_f
	pop {r4, pc}
_02024EAE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02024E84

	thumb_func_start sub_02024EB4
sub_02024EB4: ; 0x02024EB4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r3, r4, #0
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r4, #0
	str r0, [r2]
	mov r0, #0x45
	lsl r0, r0, #2
	add r2, r4, #0
	ldr r0, [r5, r0]
	add r1, #0xb4
	add r2, #0xd8
	bl sub_020BAB4C
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020BA034
	bl sub_020BA560
	add r1, r4, #0
	mov r0, #0x45
	add r1, #0x26
	lsl r0, r0, #2
	ldrb r1, [r1]
	ldr r0, [r5, r0]
	bl sub_020BBEC4
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	bne _02024F1C
	add r0, r4, #0
	add r0, #0x27
	ldrb r2, [r0]
	mov r0, #0x45
	lsl r0, r0, #2
	mov r1, #1
	ldr r0, [r5, r0]
	mov r3, #2
	and r1, r2
	and r2, r3
	bl sub_020BBF84
	b _02024F2A
_02024F1C:
	mov r0, #0x45
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_020BBF84
_02024F2A:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_020BA7D4
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	beq _02024F78
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	bl sub_020BA7D4
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	ldr r2, [r4, #0x20]
	bl sub_020BA8D0
	ldrh r0, [r4, #0x24]
	ldr r2, _0202500C ; =0x021094DC
	asr r0, r0, #4
	lsl r1, r0, #1
	lsl r0, r1, #1
	add r1, r1, #1
	lsl r1, r1, #1
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	bl sub_020BAA24
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	neg r0, r0
	neg r1, r1
	neg r2, r2
	bl sub_020BA7D4
_02024F78:
	add r0, r4, #0
	add r0, #0x28
	ldrb r3, [r0]
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	add r1, r2, #0
	add r1, #0x84
	ldr r1, [r1]
	add r2, #0x84
	orr r1, r3
	str r1, [r2]
	add r1, r4, #0
	add r1, #0x28
	ldrb r1, [r1]
	mvn r6, r1
	ldr r1, [r5, r0]
	add r2, r1, #0
	add r2, #0x84
	ldr r3, [r2]
	mvn r2, r6
	and r2, r3
	add r1, #0x84
	str r2, [r1]
	add r1, r4, #0
	add r1, #0x29
	ldrb r2, [r1]
	ldr r1, [r5, r0]
	add r1, #0x8a
	strh r2, [r1]
	add r1, r4, #0
	add r1, #0x2a
	ldrb r2, [r1]
	ldr r1, [r5, r0]
	add r1, #0x94
	strh r2, [r1]
	ldr r1, [r5, r0]
	ldr r2, [r4, #0x2c]
	add r1, #0x90
	str r2, [r1]
	ldr r1, [r5, r0]
	ldr r2, [r4, #0x30]
	add r1, #0x8c
	str r2, [r1]
	add r1, r4, #0
	add r1, #0xf2
	ldr r0, [r5, r0]
	ldrb r1, [r1]
	add r0, #0x88
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	beq _02024FEA
	cmp r0, #3
	bne _02024FF6
_02024FEA:
	add r4, #0x40
	add r4, #8
	add r0, r4, #0
	bl sub_020BA148
	b _02025000
_02024FF6:
	add r4, #0x40
	add r4, #8
	add r0, r4, #0
	bl sub_020BA484
_02025000:
	bl sub_020BA784
	bl sub_020BA0DC
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0202500C: .word 0x021094DC
	thumb_func_end sub_02024EB4

	thumb_func_start sub_02025010
sub_02025010: ; 0x02025010
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025010

	thumb_func_start sub_02025014
sub_02025014: ; 0x02025014
	ldr r3, _0202501C ; =sub_020249B0
	ldr r1, [r0, #0x38]
	bx r3
	nop
_0202501C: .word sub_020249B0
	thumb_func_end sub_02025014

	thumb_func_start sub_02025020
sub_02025020: ; 0x02025020
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025020

	thumb_func_start sub_02025024
sub_02025024: ; 0x02025024
	push {r4, r5, r6, r7}
	mov r2, #0x11
	lsl r2, r2, #4
	add r4, r0, #0
	ldr r5, [r0, r2]
	add r4, #0x10
	cmp r5, r4
	bne _02025048
	str r1, [r0, r2]
	sub r3, r2, #4
	str r1, [r0, r3]
	add r0, r1, #0
	add r0, #0xfc
	str r4, [r0]
	sub r2, #0x10
	str r4, [r1, r2]
	pop {r4, r5, r6, r7}
	bx lr
_02025048:
	add r3, r1, #0
	add r3, #0xf4
	ldrh r6, [r3]
	sub r3, r2, #4
	ldr r3, [r0, r3]
	add r7, r3, #0
	add r7, #0xf4
	ldrh r7, [r7]
	cmp r7, r6
	bhi _0202507A
	add r5, r1, #0
	add r5, #0xfc
	str r3, [r5]
	sub r3, r2, #4
	ldr r5, [r0, r3]
	add r3, r2, #0
	sub r3, #0x10
	str r1, [r5, r3]
	add r3, r2, #0
	sub r3, #0x10
	str r4, [r1, r3]
	sub r2, r2, #4
	str r1, [r0, r2]
	pop {r4, r5, r6, r7}
	bx lr
_0202507A:
	cmp r5, r4
	beq _020250B6
	add r0, r2, #0
	sub r0, #0x10
_02025082:
	add r2, r5, #0
	add r2, #0xf4
	ldrh r2, [r2]
	cmp r2, r6
	bls _020250B0
	add r0, r5, #0
	add r0, #0xfc
	mov r2, #1
	ldr r0, [r0]
	lsl r2, r2, #8
	str r1, [r0, r2]
	add r0, r5, #0
	add r0, #0xfc
	ldr r3, [r0]
	add r0, r1, #0
	add r0, #0xfc
	str r3, [r0]
	add r0, r5, #0
	add r0, #0xfc
	str r1, [r0]
	str r5, [r1, r2]
	pop {r4, r5, r6, r7}
	bx lr
_020250B0:
	ldr r5, [r5, r0]
	cmp r5, r4
	bne _02025082
_020250B6:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025024

	thumb_func_start sub_020250BC
sub_020250BC: ; 0x020250BC
	mov r2, #1
	add r1, r0, #0
	lsl r2, r2, #8
	add r1, #0xfc
	ldr r3, [r0, r2]
	ldr r1, [r1]
	str r3, [r1, r2]
	add r1, r0, #0
	add r1, #0xfc
	ldr r0, [r0, r2]
	ldr r1, [r1]
	add r0, #0xfc
	str r1, [r0]
	bx lr
	thumb_func_end sub_020250BC

	thumb_func_start sub_020250D8
sub_020250D8: ; 0x020250D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r7, #0
	cmp r0, #0
	ble _02025108
	add r4, r7, #0
	add r6, r7, #0
_020250E8:
	ldr r0, [r5]
	add r0, r0, r4
	bl sub_020245FC
	ldr r0, [r5]
	add r7, r7, #1
	add r1, r0, r4
	ldr r0, [r5, #8]
	str r1, [r0, r6]
	mov r0, #0x41
	lsl r0, r0, #2
	add r4, r4, r0
	ldr r0, [r5, #4]
	add r6, r6, #4
	cmp r7, r0
	blt _020250E8
_02025108:
	mov r0, #0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020250D8

	thumb_func_start sub_02025110
sub_02025110: ; 0x02025110
	ldr r3, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0202511C
	mov r0, #0
	bx lr
_0202511C:
	ldr r2, [r0, #8]
	lsl r1, r3, #2
	ldr r2, [r2, r1]
	add r1, r3, #1
	str r1, [r0, #0xc]
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025110

	thumb_func_start sub_0202512C
sub_0202512C: ; 0x0202512C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	cmp r0, #0
	bgt _0202513C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202513C:
	add r0, r4, #0
	bl sub_020245FC
	ldr r0, [r5, #0xc]
	sub r0, r0, #1
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	lsl r0, r0, #2
	str r4, [r1, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202512C

	thumb_func_start sub_02025154
sub_02025154: ; 0x02025154
	push {r4, r5, r6, r7}
	ldrb r3, [r0]
	mov r4, #0
	cmp r3, #0xff
	beq _02025196
_0202515E:
	ldrb r7, [r0, #2]
	ldrb r3, [r0, #3]
	ldrb r5, [r0]
	sub r6, r1, r7
	sub r3, r3, r7
	cmp r6, r3
	bhs _02025170
	mov r6, #1
	b _02025172
_02025170:
	mov r6, #0
_02025172:
	ldrb r7, [r0, #1]
	sub r3, r2, r5
	sub r5, r7, r5
	cmp r3, r5
	bhs _02025180
	mov r3, #1
	b _02025182
_02025180:
	mov r3, #0
_02025182:
	tst r3, r6
	beq _0202518C
	add r0, r4, #0
	pop {r4, r5, r6, r7}
	bx lr
_0202518C:
	add r0, r0, #4
	ldrb r3, [r0]
	add r4, r4, #1
	cmp r3, #0xff
	bne _0202515E
_02025196:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025154

	thumb_func_start sub_020251A0
sub_020251A0: ; 0x020251A0
	push {r3, r4}
	ldrb r3, [r0, #1]
	sub r4, r3, r1
	ldrb r1, [r0, #2]
	sub r3, r1, r2
	ldrb r2, [r0, #3]
	add r1, r4, #0
	add r0, r3, #0
	mul r1, r4
	mul r0, r3
	add r1, r1, r0
	add r0, r2, #0
	mul r0, r2
	cmp r1, r0
	bhs _020251C4
	mov r0, #1
	pop {r3, r4}
	bx lr
_020251C4:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020251A0

	thumb_func_start sub_020251CC
sub_020251CC: ; 0x020251CC
	push {r4, r5}
	ldrb r5, [r0, #2]
	ldrb r3, [r0]
	sub r4, r1, r5
	ldrb r1, [r0, #3]
	sub r1, r1, r5
	cmp r4, r1
	bhs _020251E0
	mov r4, #1
	b _020251E2
_020251E0:
	mov r4, #0
_020251E2:
	ldrb r0, [r0, #1]
	sub r1, r2, r3
	sub r0, r0, r3
	cmp r1, r0
	bhs _020251F0
	mov r0, #1
	b _020251F2
_020251F0:
	mov r0, #0
_020251F2:
	tst r0, r4
	beq _020251FC
	mov r0, #1
	pop {r4, r5}
	bx lr
_020251FC:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020251CC

	thumb_func_start sub_02025204
sub_02025204: ; 0x02025204
	push {r3, lr}
	ldr r2, _02025220 ; =0x021D114C
	ldrh r1, [r2, #0x26]
	cmp r1, #0
	beq _02025218
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl sub_02025154
	pop {r3, pc}
_02025218:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	nop
_02025220: .word 0x021D114C
	thumb_func_end sub_02025204

	thumb_func_start sub_02025224
sub_02025224: ; 0x02025224
	push {r3, lr}
	ldr r2, _02025240 ; =0x021D114C
	ldrh r1, [r2, #0x24]
	cmp r1, #0
	beq _02025238
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl sub_02025154
	pop {r3, pc}
_02025238:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	nop
_02025240: .word 0x021D114C
	thumb_func_end sub_02025224

	thumb_func_start sub_02025244
sub_02025244: ; 0x02025244
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02025298 ; =0x021D114C
	add r5, r0, #0
	ldrh r0, [r7, #0x26]
	cmp r0, #0
	beq _02025290
	ldrb r0, [r5]
	mov r6, #0
	cmp r0, #0xff
	beq _02025290
	add r4, r5, #0
_0202525A:
	ldrb r0, [r5]
	cmp r0, #0xfe
	bne _02025272
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251A0
	cmp r0, #0
	beq _02025284
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02025272:
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251CC
	cmp r0, #0
	beq _02025284
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02025284:
	add r5, r5, #4
	ldrb r0, [r5]
	add r4, r4, #4
	add r6, r6, #1
	cmp r0, #0xff
	bne _0202525A
_02025290:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02025298: .word 0x021D114C
	thumb_func_end sub_02025244

	thumb_func_start sub_0202529C
sub_0202529C: ; 0x0202529C
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _020252F0 ; =0x021D114C
	add r5, r0, #0
	ldrh r0, [r7, #0x24]
	cmp r0, #0
	beq _020252E8
	ldrb r0, [r5]
	mov r6, #0
	cmp r0, #0xff
	beq _020252E8
	add r4, r5, #0
_020252B2:
	ldrb r0, [r5]
	cmp r0, #0xfe
	bne _020252CA
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251A0
	cmp r0, #0
	beq _020252DC
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_020252CA:
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251CC
	cmp r0, #0
	beq _020252DC
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_020252DC:
	add r5, r5, #4
	ldrb r0, [r5]
	add r4, r4, #4
	add r6, r6, #1
	cmp r0, #0xff
	bne _020252B2
_020252E8:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020252F0: .word 0x021D114C
	thumb_func_end sub_0202529C

	thumb_func_start sub_020252F4
sub_020252F4: ; 0x020252F4
	push {r3, lr}
	ldr r2, _0202531C ; =0x021D114C
	ldrh r1, [r2, #0x26]
	cmp r1, #0
	beq _02025316
	ldrb r1, [r0]
	cmp r1, #0xfe
	ldrh r1, [r2, #0x20]
	bne _0202530E
	ldrh r2, [r2, #0x22]
	bl sub_020251A0
	pop {r3, pc}
_0202530E:
	ldrh r2, [r2, #0x22]
	bl sub_020251CC
	pop {r3, pc}
_02025316:
	mov r0, #0
	pop {r3, pc}
	nop
_0202531C: .word 0x021D114C
	thumb_func_end sub_020252F4

	thumb_func_start sub_02025320
sub_02025320: ; 0x02025320
	push {r3, lr}
	ldr r2, _02025348 ; =0x021D114C
	ldrh r1, [r2, #0x24]
	cmp r1, #0
	beq _02025342
	ldrb r1, [r0]
	cmp r1, #0xfe
	ldrh r1, [r2, #0x20]
	bne _0202533A
	ldrh r2, [r2, #0x22]
	bl sub_020251A0
	pop {r3, pc}
_0202533A:
	ldrh r2, [r2, #0x22]
	bl sub_020251CC
	pop {r3, pc}
_02025342:
	mov r0, #0
	pop {r3, pc}
	nop
_02025348: .word 0x021D114C
	thumb_func_end sub_02025320

	thumb_func_start sub_0202534C
sub_0202534C: ; 0x0202534C
	ldr r0, _02025354 ; =0x021D114C
	ldrh r0, [r0, #0x26]
	bx lr
	nop
_02025354: .word 0x021D114C
	thumb_func_end sub_0202534C

	thumb_func_start sub_02025358
sub_02025358: ; 0x02025358
	ldr r0, _02025360 ; =0x021D114C
	ldrh r0, [r0, #0x24]
	bx lr
	nop
_02025360: .word 0x021D114C
	thumb_func_end sub_02025358

	thumb_func_start sub_02025364
sub_02025364: ; 0x02025364
	ldr r2, _0202537C ; =0x021D114C
	ldrh r3, [r2, #0x26]
	cmp r3, #0
	beq _02025378
	ldrh r3, [r2, #0x20]
	str r3, [r0]
	ldrh r0, [r2, #0x22]
	str r0, [r1]
	mov r0, #1
	bx lr
_02025378:
	mov r0, #0
	bx lr
	.balign 4, 0
_0202537C: .word 0x021D114C
	thumb_func_end sub_02025364

	thumb_func_start sub_02025380
sub_02025380: ; 0x02025380
	ldr r2, _02025398 ; =0x021D114C
	ldrh r3, [r2, #0x24]
	cmp r3, #0
	beq _02025394
	ldrh r3, [r2, #0x20]
	str r3, [r0]
	ldrh r0, [r2, #0x22]
	str r0, [r1]
	mov r0, #1
	bx lr
_02025394:
	mov r0, #0
	bx lr
	.balign 4, 0
_02025398: .word 0x021D114C
	thumb_func_end sub_02025380

	thumb_func_start sub_0202539C
sub_0202539C: ; 0x0202539C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	ldrb r0, [r5]
	add r6, r1, #0
	add r7, r2, #0
	cmp r0, #0xff
	beq _020253EA
	add r4, r5, #0
_020253B0:
	ldrb r0, [r5]
	cmp r0, #0xfe
	bne _020253C8
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020251A0
	cmp r0, #0
	beq _020253DA
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
_020253C8:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020251CC
	cmp r0, #0
	beq _020253DA
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
_020253DA:
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp]
	ldrb r0, [r5]
	add r4, r4, #4
	cmp r0, #0xff
	bne _020253B0
_020253EA:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202539C

	thumb_func_start sub_020253F0
sub_020253F0: ; 0x020253F0
	push {r3, lr}
	ldrb r3, [r0]
	cmp r3, #0xfe
	bne _020253FE
	bl sub_020251A0
	pop {r3, pc}
_020253FE:
	bl sub_020251CC
	pop {r3, pc}
	thumb_func_end sub_020253F0

	thumb_func_start Init_Timer3
Init_Timer3: ; 0x02025404
	push {r3, lr}
	ldr r0, _0202542C ; =0x021D2210
	mov r2, #0
	str r2, [r0, #4]
	str r2, [r0, #8]
	ldr r1, _02025430 ; =0x0400010E
	str r2, [r0]
	strh r2, [r1]
	sub r0, r1, #2
	strh r2, [r0]
	mov r0, #0xc1
	strh r0, [r1]
	ldr r1, _02025434 ; =sub_02025438
	mov r0, #0x40
	bl sub_020D1004
	mov r0, #0x40
	bl sub_020D11D4
	pop {r3, pc}
	.balign 4, 0
_0202542C: .word 0x021D2210
_02025430: .word 0x0400010E
_02025434: .word sub_02025438
	thumb_func_end Init_Timer3

	thumb_func_start sub_02025438
sub_02025438: ; 0x02025438
	ldr r0, _02025470 ; =0x021D2210
	mov r3, #0
	ldr r1, [r0, #4]
	ldr r2, [r0, #8]
	add r1, r1, #1
	adc r2, r3
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0]
	cmp r1, #0
	beq _0202545C
	ldr r2, _02025474 ; =0x0400010E
	strh r3, [r2]
	sub r1, r2, #2
	strh r3, [r1]
	mov r1, #0xc1
	strh r1, [r2]
	str r3, [r0]
_0202545C:
	ldr r3, _02025478 ; =OSi_IntrTable
	ldr r1, _0202547C ; =0x00003FF8
	mov r0, #0x40
	ldr r2, [r3, r1]
	orr r2, r0
	str r2, [r3, r1]
	ldr r3, _02025480 ; =sub_020D1004
	ldr r1, _02025484 ; =sub_02025438
	bx r3
	nop
_02025470: .word 0x021D2210
_02025474: .word 0x0400010E
_02025478: .word OSi_IntrTable
_0202547C: .word 0x00003FF8
_02025480: .word sub_020D1004
_02025484: .word sub_02025438
	thumb_func_end sub_02025438

	thumb_func_start sub_02025488
sub_02025488: ; 0x02025488
	push {r4, r5, lr}
	sub sp, #0xc
	bl sub_020D3A38
	ldr r1, _020254EC ; =0x0400010C
	add r3, sp, #0
	ldrh r1, [r1]
	ldr r2, _020254F0 ; =0x0000FFFF
	strh r1, [r3]
	ldr r1, _020254F4 ; =0x021D2210
	ldr r5, [r1, #4]
	ldr r4, [r1, #8]
	mov r1, #0
	mvn r1, r1
	and r1, r5
	str r1, [sp, #4]
	and r2, r4
	ldr r1, _020254F8 ; =0x04000214
	str r2, [sp, #8]
	ldr r2, [r1]
	mov r1, #0x40
	tst r2, r1
	beq _020254CC
	ldrh r2, [r3]
	lsl r1, r1, #9
	tst r1, r2
	bne _020254CC
	ldr r2, [sp, #4]
	mov r1, #0
	ldr r3, [sp, #8]
	add r2, r2, #1
	adc r3, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
_020254CC:
	bl sub_020D3A4C
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	lsr r0, r2, #0x10
	lsl r1, r1, #0x10
	orr r1, r0
	add r0, sp, #0
	lsl r3, r2, #0x10
	ldrh r2, [r0]
	asr r0, r2, #0x1f
	orr r1, r0
	add r0, r3, #0
	orr r0, r2
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_020254EC: .word 0x0400010C
_020254F0: .word 0x0000FFFF
_020254F4: .word 0x021D2210
_020254F8: .word 0x04000214
	thumb_func_end sub_02025488

	thumb_func_start sub_020254FC
sub_020254FC: ; 0x020254FC
	ldr r3, _02025500 ; =sub_02025488
	bx r3
	.balign 4, 0
_02025500: .word sub_02025488
	thumb_func_end sub_020254FC

	thumb_func_start sub_02025504
sub_02025504: ; 0x02025504
	push {r3, lr}
	lsr r2, r0, #0x1a
	lsl r1, r1, #6
	orr r1, r2
	ldr r2, _02025518 ; =0x01FF6210
	lsl r0, r0, #6
	mov r3, #0
	bl _ll_udiv
	pop {r3, pc}
	.balign 4, 0
_02025518: .word 0x01FF6210
	thumb_func_end sub_02025504
