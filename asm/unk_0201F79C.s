	.include "asm/macros.inc"
	.include "global.inc"

 	.bss

 _021D15A4:
 	.space 0x8

_021D15AC:
	.space 0x9C0

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
	ldr r0, _0201FD34 ; =_021D15A4
	ldr r0, [r0, #4]
	bx lr
	nop
_0201FD34: .word _021D15A4
	thumb_func_end sub_0201FD2C

	thumb_func_start SetLCRNGSeed
SetLCRNGSeed: ; 0x0201FD38
	ldr r1, _0201FD40 ; =_021D15A4
	str r0, [r1, #4]
	bx lr
	nop
_0201FD40: .word _021D15A4
	thumb_func_end SetLCRNGSeed

	thumb_func_start sub_0201FD44
sub_0201FD44: ; 0x0201FD44
	ldr r1, _0201FD5C ; =_021D15A4
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
_0201FD5C: .word _021D15A4
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
	ldr r1, _0201FDA8 ; =_021D15A4
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
_0201FDA8: .word _021D15A4
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
	ldr r4, _0201FEA4 ; =_021D15AC
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
	ldr r2, _0201FEA4 ; =_021D15AC
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
	ldr r1, _0201FEBC ; =_021D15A4
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
	ldr r0, _0201FEA4 ; =_021D15AC
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
_0201FEA4: .word _021D15AC
_0201FEA8: .word 0x0210F6D0
_0201FEAC: .word 0x7FFFFFFF
_0201FEB0: .word 0x00000634
_0201FEB4: .word 0x0000026F
_0201FEB8: .word 0x021D1F24
_0201FEBC: .word _021D15A4
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
	ldr r0, _0201FFA8 ; =_021D15A4
	add r1, r3, #0
	ldr r3, _0201FFAC ; =sub_020E3A2C
	ldr r0, [r0]
	bx r3
	nop
_0201FFA8: .word _021D15A4
_0201FFAC: .word sub_020E3A2C
	thumb_func_end sub_0201FF98

	thumb_func_start sub_0201FFB0
sub_0201FFB0: ; 0x0201FFB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0201FFD8 ; =_021D15A4
	ldr r0, [r0]
	cmp r0, #0
	beq _0201FFC0
	bl GF_AssertFail
_0201FFC0:
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #8
	bl AllocFromHeap
	ldr r1, _0201FFD8 ; =_021D15A4
	str r0, [r1]
	ldr r1, _0201FFDC ; =0x00001021
	bl sub_020E3850
	pop {r4, pc}
	nop
_0201FFD8: .word _021D15A4
_0201FFDC: .word 0x00001021
	thumb_func_end sub_0201FFB0
