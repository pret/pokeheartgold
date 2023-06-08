	.include "asm/macros.inc"
	.include "overlay_12_0226ADE0.inc"
	.include "global.inc"

	.text

    thumb_func_start ov12_0226ADE0
ov12_0226ADE0: ; 0x0226ADE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #8
	mov r1, #5
	add r7, r2, #0
	bl NARC_New
	add r6, r0, #0
	str r6, [sp]
	mov r0, #0x6e
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0226AE60 ; =0x00004E45
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0226AE64 ; =0x00004FBF
	mov r3, #0x55
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	lsl r3, r3, #2
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _0226AE68 ; =0x00004FB8
	ldr r3, _0226AE6C ; =0x00000155
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _0226AE70 ; =0x00004FAD
	ldr r3, _0226AE74 ; =0x00000156
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0200D71C
	add r0, r6, #0
	bl NARC_Delete
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226AE60: .word 0x00004E45
_0226AE64: .word 0x00004FBF
_0226AE68: .word 0x00004FB8
_0226AE6C: .word 0x00000155
_0226AE70: .word 0x00004FAD
_0226AE74: .word 0x00000156
	thumb_func_end ov12_0226ADE0

	thumb_func_start ov12_0226AE78
ov12_0226AE78: ; 0x0226AE78
	push {r4, lr}
	ldr r1, _0226AE9C ; =0x00004FBF
	add r4, r0, #0
	bl sub_0200D958
	ldr r1, _0226AEA0 ; =0x00004E45
	add r0, r4, #0
	bl sub_0200D968
	ldr r1, _0226AEA4 ; =0x00004FB8
	add r0, r4, #0
	bl sub_0200D978
	ldr r1, _0226AEA8 ; =0x00004FAD
	add r0, r4, #0
	bl sub_0200D988
	pop {r4, pc}
	.balign 4, 0
_0226AE9C: .word 0x00004FBF
_0226AEA0: .word 0x00004E45
_0226AEA4: .word 0x00004FB8
_0226AEA8: .word 0x00004FAD
	thumb_func_end ov12_0226AE78

	thumb_func_start ov12_0226AEAC
ov12_0226AEAC: ; 0x0226AEAC
	push {r4, lr}
	mov r0, #5
	lsl r1, r0, #6
	bl AllocFromHeap
	mov r2, #5
	mov r1, #0
	lsl r2, r2, #6
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0226AEAC

	thumb_func_start ov12_0226AEC8
ov12_0226AEC8: ; 0x0226AEC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0226AED6
	bl GF_AssertFail
_0226AED6:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0226AEC8

	thumb_func_start ov12_0226AEE0
ov12_0226AEE0: ; 0x0226AEE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x38]
	add r6, r1, #0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	str r2, [sp, #0x18]
	str r0, [sp, #0x3c]
	str r3, [sp, #0x1c]
	bl ov12_0226AEAC
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x1c]
	str r1, [sp]
	ldr r3, [sp, #0x38]
	add r1, r6, #0
	add r7, r0, #0
	bl ov12_0226AFEC
	add r5, r7, #0
	mov r4, #0
	add r5, #0x1c
_0226AF0E:
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	ldrb r0, [r0, r4]
	bl ov12_0226B884
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r1, [sp]
	str r4, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	mov r1, #0x4f
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	lsl r1, r1, #2
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, r7, r1
	add r2, r6, #0
	bl ov12_0226B29C
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #6
	blt _0226AF0E
	add r0, r7, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0226AEE0

	thumb_func_start ov12_0226AF48
ov12_0226AF48: ; 0x0226AF48
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _0226AF66
	mov r2, #0
_0226AF50:
	ldr r1, [r0, #0x20]
	cmp r1, #0
	bne _0226AF5E
	add r2, r2, #1
	add r0, #0x30
	cmp r2, #6
	blt _0226AF50
_0226AF5E:
	cmp r2, #6
	bne _0226AF66
	mov r0, #1
	bx lr
_0226AF66:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0226AF48

	thumb_func_start ov12_0226AF6C
ov12_0226AF6C: ; 0x0226AF6C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	cmp r6, #0
	bne _0226AF7C
	bl GF_AssertFail
_0226AF7C:
	add r0, r6, #0
	add r1, r4, #0
	bl ov12_0226B144
	add r5, r6, #0
	mov r4, #0
	add r5, #0x1c
	add r6, #0x18
_0226AF8C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	add r3, r6, #0
	bl ov12_0226B694
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #6
	blt _0226AF8C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0226AF6C

	thumb_func_start ov12_0226AFA4
ov12_0226AFA4: ; 0x0226AFA4
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _0226AFC2
	mov r2, #0
_0226AFAC:
	ldr r1, [r0, #0x20]
	cmp r1, #0
	bne _0226AFBA
	add r2, r2, #1
	add r0, #0x30
	cmp r2, #6
	blt _0226AFAC
_0226AFBA:
	cmp r2, #6
	bne _0226AFC2
	mov r0, #1
	bx lr
_0226AFC2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0226AFA4

	thumb_func_start ov12_0226AFC8
ov12_0226AFC8: ; 0x0226AFC8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl sub_0200D9DC
	mov r4, #0
	add r5, r6, #0
_0226AFD6:
	ldr r0, [r5, #0x1c]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #6
	blt _0226AFD6
	add r0, r6, #0
	bl ov12_0226AEC8
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0226AFC8

	thumb_func_start ov12_0226AFEC
ov12_0226AFEC: ; 0x0226AFEC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	mov r1, #0
	cmp r0, #0
	bne _0226B006
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0226B006
	mov r1, #1
_0226B006:
	cmp r1, #0
	bne _0226B00E
	bl GF_AssertFail
_0226B00E:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	ldr r1, [sp, #0x18]
	ldr r2, _0226B084 ; =ov12_0226EB38
	add r0, r7, #0
	bl sub_0200D734
	str r0, [r5]
	cmp r6, #0
	ldr r0, [r5]
	bne _0226B044
	ldr r2, _0226B088 ; =ov12_0226EB28
	lsl r3, r4, #1
	ldrsh r2, [r2, r3]
	mov r1, #0x16
	lsl r1, r1, #4
	bl sub_0200DDB8
	ldr r0, [r5]
	mov r1, #8
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	b _0226B05C
_0226B044:
	ldr r2, _0226B08C ; =ov12_0226EB20
	lsl r3, r4, #1
	ldrsh r2, [r2, r3]
	mov r1, #0x5f
	mvn r1, r1
	bl sub_0200DDB8
	ldr r0, [r5]
	mov r1, #7
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
_0226B05C:
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0200DC0C
	str r6, [r5, #0xc]
	mov r2, #0x7d
	str r4, [r5, #0x10]
	mov r0, #0
	strb r0, [r5, #0x1a]
	ldr r0, _0226B090 ; =ov12_0226B098
	add r1, r5, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r5, #4]
	ldr r0, _0226B094 ; =0x00000711
	bl PlaySE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226B084: .word ov12_0226EB38
_0226B088: .word ov12_0226EB28
_0226B08C: .word ov12_0226EB20
_0226B090: .word ov12_0226B098
_0226B094: .word 0x00000711
	thumb_func_end ov12_0226AFEC

	thumb_func_start ov12_0226B098
ov12_0226B098: ; 0x0226B098
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldrb r1, [r4, #0x1a]
	cmp r1, #0
	beq _0226B0AA
	cmp r1, #1
	beq _0226B0C6
	b _0226B12E
_0226B0AA:
	add r1, sp, #0
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	lsl r0, r0, #8
	str r0, [r4, #0x14]
	ldrb r0, [r4, #0x1a]
	add r0, r0, #1
	strb r0, [r4, #0x1a]
_0226B0C6:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	cmp r0, #0
	bne _0226B0FE
	mov r0, #0x12
	lsl r0, r0, #8
	sub r1, r1, r0
	mov r0, #0xe
	lsl r0, r0, #0xc
	str r1, [r4, #0x14]
	cmp r1, r0
	bgt _0226B0E6
	str r0, [r4, #0x14]
	ldrb r0, [r4, #0x1a]
	add r0, r0, #1
	strb r0, [r4, #0x1a]
_0226B0E6:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x14]
	lsl r3, r2, #1
	ldr r2, _0226B13C ; =ov12_0226EB28
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, pc}
_0226B0FE:
	mov r0, #0x12
	lsl r0, r0, #8
	add r1, r1, r0
	mov r0, #2
	lsl r0, r0, #0xc
	str r1, [r4, #0x14]
	cmp r1, r0
	blt _0226B116
	str r0, [r4, #0x14]
	ldrb r0, [r4, #0x1a]
	add r0, r0, #1
	strb r0, [r4, #0x1a]
_0226B116:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x14]
	lsl r3, r2, #1
	ldr r2, _0226B140 ; =ov12_0226EB20
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, pc}
_0226B12E:
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0226B13C: .word ov12_0226EB28
_0226B140: .word ov12_0226EB20
	thumb_func_end ov12_0226B098

	thumb_func_start ov12_0226B144
ov12_0226B144: ; 0x0226B144
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	beq _0226B156
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0226B15A
_0226B156:
	bl GF_AssertFail
_0226B15A:
	mov r0, #0
	strb r0, [r5, #0x1a]
	str r4, [r5, #8]
	cmp r4, #0
	bne _0226B168
	mov r0, #4
	b _0226B168
_0226B168:
	strb r0, [r5, #0x1b]
	mov r2, #0x7d
	ldr r0, _0226B17C ; =ov12_0226B180
	add r1, r5, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r5, #4]
	pop {r3, r4, r5, pc}
	nop
_0226B17C: .word ov12_0226B180
	thumb_func_end ov12_0226B144

	thumb_func_start ov12_0226B180
ov12_0226B180: ; 0x0226B180
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	beq _0226B198
	cmp r0, #1
	beq _0226B1CE
	cmp r0, #2
	beq _0226B1FC
	b _0226B27A
_0226B198:
	add r1, sp, #4
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	add r1, sp, #4
	mov r0, #2
	ldrsh r1, [r1, r0]
	lsl r0, r0, #0xb
	mov r2, #0x3f
	lsl r1, r1, #8
	str r1, [r4, #0x14]
	strh r0, [r4, #0x18]
	mov r0, #0x18
	ldrsh r0, [r4, r0]
	mov r1, #0
	asr r3, r0, #8
	mov r0, #0x10
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _0226B28C ; =0x04000050
	bl G2x_SetBlendAlpha_
	ldrb r0, [r4, #0x1a]
	add r0, r0, #1
	strb r0, [r4, #0x1a]
_0226B1CE:
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _0226B1DC
	sub r0, r0, #1
	add sp, #8
	strb r0, [r4, #0x1b]
	pop {r3, r4, r5, pc}
_0226B1DC:
	mov r0, #0x18
	ldrsh r0, [r4, r0]
	asr r1, r0, #8
	mov r0, #0x10
	sub r0, r0, r1
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0226B290 ; =0x04000052
	strh r1, [r0]
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200E0FC
	ldrb r0, [r4, #0x1a]
	add r0, r0, #1
	strb r0, [r4, #0x1a]
_0226B1FC:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0226B240
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	cmp r0, #0
	bne _0226B226
	mov r0, #1
	lsl r0, r0, #0xa
	sub r1, r1, r0
	str r1, [r4, #0x14]
	ldr r2, [r4, #0x10]
	lsl r1, r1, #8
	lsl r3, r2, #1
	ldr r2, _0226B294 ; =ov12_0226EB28
	ldr r0, [r4]
	ldrsh r2, [r2, r3]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	b _0226B240
_0226B226:
	mov r0, #1
	lsl r0, r0, #0xa
	add r1, r1, r0
	str r1, [r4, #0x14]
	ldr r2, [r4, #0x10]
	lsl r1, r1, #8
	lsl r3, r2, #1
	ldr r2, _0226B298 ; =ov12_0226EB20
	ldr r0, [r4]
	ldrsh r2, [r2, r3]
	asr r1, r1, #0x10
	bl sub_0200DDB8
_0226B240:
	mov r1, #0x18
	ldrsh r2, [r4, r1]
	add r0, r1, #0
	add r0, #0xe8
	sub r0, r2, r0
	strh r0, [r4, #0x18]
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0226B264
	mov r1, #0
	strh r1, [r4, #0x18]
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DCE0
	ldrb r0, [r4, #0x1a]
	add r0, r0, #1
	strb r0, [r4, #0x1a]
_0226B264:
	mov r0, #0x18
	ldrsh r0, [r4, r0]
	add sp, #8
	asr r1, r0, #8
	mov r0, #0x10
	sub r0, r0, r1
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0226B290 ; =0x04000052
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_0226B27A:
	bl ov12_0223C340
	add r0, r5, #0
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0226B28C: .word 0x04000050
_0226B290: .word 0x04000052
_0226B294: .word ov12_0226EB28
_0226B298: .word ov12_0226EB20
	thumb_func_end ov12_0226B180

	thumb_func_start ov12_0226B29C
ov12_0226B29C: ; 0x0226B29C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r7, r1, #0
	add r6, r2, #0
	mov r1, #0
	str r3, [sp]
	ldr r4, [sp, #0x1c]
	cmp r0, #0
	bne _0226B2B8
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0226B2B8
	mov r1, #1
_0226B2B8:
	cmp r1, #0
	bne _0226B2C0
	bl GF_AssertFail
_0226B2C0:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x30
	bl MI_CpuFill8
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, _0226B390 ; =ov12_0226EB6C
	bl sub_0200D734
	str r0, [r5]
	cmp r6, #0
	ldr r0, [r5]
	bne _0226B2EE
	ldr r2, [sp, #0x18]
	mov r1, #0x45
	lsl r3, r2, #1
	ldr r2, _0226B394 ; =ov12_0226EB30
	lsl r1, r1, #2
	ldrsh r2, [r2, r3]
	bl sub_0200DDB8
	b _0226B2FE
_0226B2EE:
	ldr r2, [sp, #0x18]
	mov r1, #0x13
	lsl r3, r2, #1
	ldr r2, _0226B398 ; =ov12_0226EB18
	mvn r1, r1
	ldrsh r2, [r2, r3]
	bl sub_0200DDB8
_0226B2FE:
	ldr r0, [r5]
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0200DC0C
	add r0, r5, #0
	str r6, [r5, #8]
	add r0, #0x2d
	strb r4, [r0]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x20]
	bl ov12_0226B8C4
	add r1, r5, #0
	add r1, #0x2e
	strb r0, [r1]
	ldr r0, [sp, #0x20]
	str r7, [r5, #0x14]
	cmp r0, #6
	bne _0226B334
	ldr r0, _0226B39C ; =0x00000713
	b _0226B336
_0226B334:
	ldr r0, _0226B3A0 ; =0x00000712
_0226B336:
	strh r0, [r5, #0x2a]
	cmp r6, #0
	bne _0226B34A
	lsl r0, r4, #4
	add r0, #0xa2
	str r0, [r5, #0x20]
	mov r0, #0xf
	mul r0, r4
	add r0, #0x9c
	b _0226B35C
_0226B34A:
	lsl r1, r4, #4
	mov r0, #0x5e
	sub r0, r0, r1
	str r0, [r5, #0x20]
	mov r0, #0xf
	add r1, r4, #0
	mul r1, r0
	mov r0, #0x64
	sub r0, r0, r1
_0226B35C:
	str r0, [r5, #0x24]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x2c
	strb r1, [r0]
	ldr r0, [sp]
	ldr r2, _0226B3A4 ; =0x000001F5
	cmp r0, #0
	bne _0226B382
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r0, #5
	strh r0, [r5, #0x28]
	ldr r0, _0226B3A8 ; =ov12_0226B3B0
	add r1, r5, #0
	bl CreateSysTask
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226B382:
	ldr r0, _0226B3AC ; =ov12_0226B5B0
	strh r1, [r5, #0x28]
	add r1, r5, #0
	bl CreateSysTask
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226B390: .word ov12_0226EB6C
_0226B394: .word ov12_0226EB30
_0226B398: .word ov12_0226EB18
_0226B39C: .word 0x00000713
_0226B3A0: .word 0x00000712
_0226B3A4: .word 0x000001F5
_0226B3A8: .word ov12_0226B3B0
_0226B3AC: .word ov12_0226B5B0
	thumb_func_end ov12_0226B29C

	thumb_func_start ov12_0226B3B0
ov12_0226B3B0: ; 0x0226B3B0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #6
	bls _0226B3C2
	b _0226B592
_0226B3C2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226B3CE: ; jump table
	.short _0226B3DC - _0226B3CE - 2 ; case 0
	.short _0226B400 - _0226B3CE - 2 ; case 1
	.short _0226B40E - _0226B3CE - 2 ; case 2
	.short _0226B490 - _0226B3CE - 2 ; case 3
	.short _0226B4A8 - _0226B3CE - 2 ; case 4
	.short _0226B4E8 - _0226B3CE - 2 ; case 5
	.short _0226B516 - _0226B3CE - 2 ; case 6
_0226B3DC:
	add r1, sp, #0
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	lsl r0, r0, #8
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B400:
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226B40E
	sub r0, r0, #1
	strh r0, [r4, #0x28]
	pop {r3, r4, r5, pc}
_0226B40E:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	bne _0226B452
	mov r0, #0x12
	lsl r0, r0, #8
	sub r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x24]
	lsl r0, r0, #8
	cmp r1, r0
	bgt _0226B43C
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #0x2a]
	bl PlaySE
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B43C:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	lsl r3, r2, #1
	ldr r2, _0226B5A8 ; =ov12_0226EB30
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	b _0226B486
_0226B452:
	mov r0, #0x12
	lsl r0, r0, #8
	add r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x24]
	lsl r0, r0, #8
	cmp r1, r0
	blt _0226B472
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B472:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	lsl r3, r2, #1
	ldr r2, _0226B5AC ; =ov12_0226EB18
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
_0226B486:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	pop {r3, r4, r5, pc}
_0226B490:
	ldr r1, [r4, #0x14]
	mov r0, #0
	ldrsb r0, [r1, r0]
	add r0, r0, #1
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B4A8:
	ldr r1, [r4, #0x14]
	mov r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #6
	beq _0226B4BC
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	pop {r3, r4, r5, pc}
_0226B4BC:
	ldr r0, [r4, #8]
	cmp r0, #0
	ldr r0, [r4]
	bne _0226B4CE
	ldr r0, [r0]
	mov r1, #1
	bl sub_020249D4
	b _0226B4D6
_0226B4CE:
	ldr r0, [r0]
	mov r1, #1
	bl sub_020249D4
_0226B4D6:
	mov r0, #0
	strh r0, [r4, #0x28]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B4E8:
	mov r0, #0x28
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #0x28]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	blt _0226B5A6
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x2e
	ldrb r1, [r1]
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	strh r0, [r4, #0x28]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B516:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	bne _0226B554
	mov r0, #6
	lsl r0, r0, #8
	add r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	lsl r0, r0, #8
	cmp r1, r0
	blt _0226B53E
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B53E:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	lsl r3, r2, #1
	ldr r2, _0226B5A8 ; =ov12_0226EB30
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	b _0226B588
_0226B554:
	mov r0, #6
	lsl r0, r0, #8
	sub r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	lsl r0, r0, #8
	cmp r1, r0
	bgt _0226B574
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B574:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	lsl r3, r2, #1
	ldr r2, _0226B5AC ; =ov12_0226EB18
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
_0226B588:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	pop {r3, r4, r5, pc}
_0226B592:
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_020249D4
	add r0, r5, #0
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
_0226B5A6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0226B5A8: .word ov12_0226EB30
_0226B5AC: .word ov12_0226EB18
	thumb_func_end ov12_0226B3B0

	thumb_func_start ov12_0226B5B0
ov12_0226B5B0: ; 0x0226B5B0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #0
	beq _0226B5C8
	cmp r1, #1
	beq _0226B5F6
	cmp r1, #2
	beq _0226B606
	b _0226B67E
_0226B5C8:
	add r1, sp, #0
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	mov r1, #0
	lsl r0, r0, #8
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_020249D4
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B5F6:
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226B606
	sub r0, r0, #1
	add sp, #4
	strh r0, [r4, #0x28]
	pop {r3, r4, pc}
_0226B606:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	bne _0226B646
	mov r0, #0x12
	lsl r0, r0, #8
	sub r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	lsl r0, r0, #8
	cmp r1, r0
	bgt _0226B62E
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B62E:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	lsl r3, r2, #1
	ldr r2, _0226B68C ; =ov12_0226EB30
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, pc}
_0226B646:
	mov r0, #0x12
	lsl r0, r0, #8
	add r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	lsl r0, r0, #8
	cmp r1, r0
	blt _0226B666
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B666:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	lsl r3, r2, #1
	ldr r2, _0226B690 ; =ov12_0226EB18
	lsl r1, r1, #8
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, pc}
_0226B67E:
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0226B68C: .word ov12_0226EB30
_0226B690: .word ov12_0226EB18
	thumb_func_end ov12_0226B5B0

	thumb_func_start ov12_0226B694
ov12_0226B694: ; 0x0226B694
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r0, #0
	beq _0226B6AA
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0226B6AE
_0226B6AA:
	bl GF_AssertFail
_0226B6AE:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x2c
	strb r1, [r0]
	cmp r7, #0
	str r4, [r5, #0x18]
	ldr r2, _0226B6EC ; =0x000001F5
	bne _0226B6D8
	lsl r0, r6, #1
	add r0, r6, r0
	strh r0, [r5, #0x28]
	add r0, r5, #0
	mov r1, #4
	add r0, #0x2f
	strb r1, [r0]
	ldr r0, _0226B6F0 ; =ov12_0226B6F8
	add r1, r5, #0
	bl CreateSysTask
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226B6D8:
	add r0, r5, #0
	strh r1, [r5, #0x28]
	add r0, #0x2f
	strb r1, [r0]
	ldr r0, _0226B6F4 ; =ov12_0226B82C
	add r1, r5, #0
	bl CreateSysTask
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226B6EC: .word 0x000001F5
_0226B6F0: .word ov12_0226B6F8
_0226B6F4: .word ov12_0226B82C
	thumb_func_end ov12_0226B694

	thumb_func_start ov12_0226B6F8
ov12_0226B6F8: ; 0x0226B6F8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x18]
	add r5, r0, #0
	mov r0, #0
	ldrsh r1, [r1, r0]
	cmp r1, #0
	bne _0226B712
	add r0, r4, #0
	mov r1, #0x64
	add r0, #0x2c
	strb r1, [r0]
	b _0226B73A
_0226B712:
	mov r0, #1
	lsl r0, r0, #0xc
	cmp r1, r0
	bge _0226B73A
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0226B73A
	ldr r0, [r4]
	cmp r0, #0
	beq _0226B73A
	bl sub_0200E110
	cmp r0, #1
	beq _0226B73A
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200E0FC
_0226B73A:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #2
	bgt _0226B754
	cmp r0, #0
	blt _0226B808
	beq _0226B758
	cmp r0, #1
	beq _0226B77C
	cmp r0, #2
	beq _0226B7A2
	b _0226B808
_0226B754:
	cmp r0, #0x64
	b _0226B808
_0226B758:
	add r1, sp, #0
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	lsl r0, r0, #8
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B77C:
	add r0, r4, #0
	add r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0226B794
	add r0, r4, #0
	add r0, #0x2f
	ldrb r0, [r0]
	add r4, #0x2f
	sub r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0226B794:
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226B7A2
	sub r0, r0, #1
	strh r0, [r4, #0x28]
	pop {r3, r4, r5, pc}
_0226B7A2:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	bne _0226B7C6
	mov r0, #3
	lsl r0, r0, #0xa
	sub r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r2, [r4, #0xc]
	lsl r1, r1, #8
	lsl r3, r2, #1
	ldr r2, _0226B820 ; =ov12_0226EB30
	ldr r0, [r4]
	ldrsh r2, [r2, r3]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	b _0226B7E0
_0226B7C6:
	mov r0, #3
	lsl r0, r0, #0xa
	add r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r2, [r4, #0xc]
	lsl r1, r1, #8
	lsl r3, r2, #1
	ldr r2, _0226B824 ; =ov12_0226EB18
	ldr r0, [r4]
	ldrsh r2, [r2, r3]
	asr r1, r1, #0x10
	bl sub_0200DDB8
_0226B7E0:
	ldr r1, [r4, #0x1c]
	ldr r0, _0226B828 ; =0xFFFFF000
	cmp r1, r0
	blt _0226B7F0
	mov r0, #0x11
	lsl r0, r0, #0xc
	cmp r1, r0
	ble _0226B7FE
_0226B7F0:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x2c
	strb r1, [r0]
_0226B7FE:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	pop {r3, r4, r5, pc}
_0226B808:
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0200DCE0
	add r0, r5, #0
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	nop
_0226B820: .word ov12_0226EB30
_0226B824: .word ov12_0226EB18
_0226B828: .word 0xFFFFF000
	thumb_func_end ov12_0226B6F8

	thumb_func_start ov12_0226B82C
ov12_0226B82C: ; 0x0226B82C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x18]
	add r5, r0, #0
	mov r0, #0
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bne _0226B844
	add r0, r4, #0
	mov r1, #0x64
	add r0, #0x2c
	strb r1, [r0]
_0226B844:
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0226B856
	cmp r0, #1
	beq _0226B880
	cmp r0, #0x64
	b _0226B86C
_0226B856:
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	add r4, #0x2c
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0226B86C:
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0200DCE0
	add r0, r5, #0
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
_0226B880:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0226B82C

	thumb_func_start ov12_0226B884
ov12_0226B884: ; 0x0226B884
	cmp r0, #3
	bhi _0226B89C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226B894: ; jump table
	.short _0226B89C - _0226B894 - 2 ; case 0
	.short _0226B8A0 - _0226B894 - 2 ; case 1
	.short _0226B8AC - _0226B894 - 2 ; case 2
	.short _0226B8B8 - _0226B894 - 2 ; case 3
_0226B89C:
	mov r0, #6
	bx lr
_0226B8A0:
	cmp r1, #0
	bne _0226B8A8
	mov r0, #3
	bx lr
_0226B8A8:
	mov r0, #0
	bx lr
_0226B8AC:
	cmp r1, #0
	bne _0226B8B4
	mov r0, #5
	bx lr
_0226B8B4:
	mov r0, #2
	bx lr
_0226B8B8:
	cmp r1, #0
	bne _0226B8C0
	mov r0, #4
	bx lr
_0226B8C0:
	mov r0, #1
	bx lr
	thumb_func_end ov12_0226B884

	thumb_func_start ov12_0226B8C4
ov12_0226B8C4: ; 0x0226B8C4
	cmp r0, #6
	bhi _0226B8FA
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0226B8D4: ; jump table
	.short _0226B8E8 - _0226B8D4 - 2 ; case 0
	.short _0226B8F8 - _0226B8D4 - 2 ; case 1
	.short _0226B8F0 - _0226B8D4 - 2 ; case 2
	.short _0226B8E4 - _0226B8D4 - 2 ; case 3
	.short _0226B8F4 - _0226B8D4 - 2 ; case 4
	.short _0226B8EC - _0226B8D4 - 2 ; case 5
	.short _0226B8E2 - _0226B8D4 - 2 ; case 6
_0226B8E2:
	bx lr
_0226B8E4:
	mov r0, #0
	bx lr
_0226B8E8:
	mov r0, #3
	bx lr
_0226B8EC:
	mov r0, #2
	bx lr
_0226B8F0:
	mov r0, #5
	bx lr
_0226B8F4:
	mov r0, #1
	bx lr
_0226B8F8:
	mov r0, #4
_0226B8FA:
	bx lr
	thumb_func_end ov12_0226B8C4

    .rodata
ov12_0226EB18: ; 0x0226EB18
	.byte 0x0E, 0x00, 0x32, 0x00, 0x32, 0x00, 0x00, 0x00

ov12_0226EB20: ; 0x0226EB20
	.byte 0x14, 0x00, 0x38, 0x00, 0x38, 0x00, 0x00, 0x00

ov12_0226EB28: ; 0x0226EB28
	.byte 0x54, 0x00, 0x78, 0x00, 0x78, 0x00, 0x00, 0x00

ov12_0226EB30: ; 0x0226EB30
	.byte 0x4E, 0x00, 0x72, 0x00, 0x72, 0x00, 0x00, 0x00

ov12_0226EB38: ; 0x0226EB38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBF, 0x4F, 0x00, 0x00
	.byte 0x45, 0x4E, 0x00, 0x00, 0xB8, 0x4F, 0x00, 0x00, 0xAD, 0x4F, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226EB6C: ; 0x0226EB6C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xBF, 0x4F, 0x00, 0x00, 0x45, 0x4E, 0x00, 0x00, 0xB8, 0x4F, 0x00, 0x00, 0xAD, 0x4F, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
