	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb
    .public NNS_G3dGlb
    .public NNS_G3dGlb
    .public NNS_G3dGlb
    .public NNS_G3dGlb
    .public NNS_G3dGlb
    .public _0210F6DC

	.data

	.public _0210F6DC
_0210F6DC:
	.byte 0x01, 0x00, 0x00, 0x00
	.bss

_021D2204:
	.space 0x4

	.text

	thumb_func_start sub_02022D74
sub_02022D74: ; 0x02022D74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x3e]
	ldr r2, [r5, #0x38]
	ldrh r4, [r5, #0x3c]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02022E50 ; =FX_SinCosTable_
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
	ldr r2, _02022E50 ; =FX_SinCosTable_
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
	ldr r0, _02022E50 ; =FX_SinCosTable_
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
	ldr r2, _02022E50 ; =FX_SinCosTable_
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
	ldr r0, _02022E50 ; =FX_SinCosTable_
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
_02022E50: .word FX_SinCosTable_
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
	ldr r0, _02022F34 ; =FX_SinCosTable_
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
	ldr r2, _02022F34 ; =FX_SinCosTable_
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
	ldr r0, _02022F34 ; =FX_SinCosTable_
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
	ldr r2, _02022F34 ; =FX_SinCosTable_
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
	ldr r0, _02022F34 ; =FX_SinCosTable_
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
_02022F34: .word FX_SinCosTable_
	thumb_func_end sub_02022E54

	thumb_func_start sub_02022F38
sub_02022F38: ; 0x02022F38
	add r2, r1, #0
	add r2, #0x46
	strh r0, [r2]
	asr r0, r0, #4
	lsl r3, r0, #1
	ldr r2, _02022F7C ; =FX_SinCosTable_
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
_02022F7C: .word FX_SinCosTable_
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

	thumb_func_start GF_Camera_Create
GF_Camera_Create: ; 0x02023114
	ldr r3, _0202311C ; =AllocFromHeap
	mov r1, #0x68
	bx r3
	nop
_0202311C: .word AllocFromHeap
	thumb_func_end GF_Camera_Create

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

	thumb_func_start GF_Camera_RegisterToStaticPtr
GF_Camera_RegisterToStaticPtr: ; 0x0202313C
	ldr r1, _02023144 ; =_021D2204
	str r0, [r1]
	bx lr
	nop
_02023144: .word _021D2204
	thumb_func_end GF_Camera_RegisterToStaticPtr

	thumb_func_start sub_02023148
sub_02023148: ; 0x02023148
	ldr r0, _02023150 ; =_021D2204
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_02023150: .word _021D2204
	thumb_func_end sub_02023148

	thumb_func_start sub_02023154
sub_02023154: ; 0x02023154
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r0, _020231EC ; =_021D2204
	ldr r1, [r0]
	cmp r1, #0
	beq _020231E6
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _0202319E
	add r1, #0x48
	add r2, sp, #0xc
	bl VEC_Subtract
	ldr r0, _020231EC ; =_021D2204
	add r1, sp, #0xc
	ldr r0, [r0]
	bl sub_02022F84
	ldr r0, _020231EC ; =_021D2204
	add r1, sp, #0xc
	ldr r0, [r0]
	add r2, sp, #0
	bl sub_02022FA4
	ldr r1, _020231EC ; =_021D2204
	add r0, sp, #0
	ldr r1, [r1]
	bl GF_Camera_ShiftBy
	ldr r0, _020231EC ; =_021D2204
	ldr r3, [r0]
	ldr r2, [r3, #0x54]
	add r3, #0x48
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
_0202319E:
	ldr r0, _020231EC ; =_021D2204
	ldr r5, _020231F0 ; =NNS_G3dGlb + 0x240
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
	ldr r5, _020231F4 ; =NNS_G3dGlb + 0x24C
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r3, #0x20
	str r0, [r5]
	add r6, r3, #0
	ldr r5, _020231F8 ; =NNS_G3dGlb + 0x258
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	add r2, r3, #0
	str r0, [r5]
	ldr r3, _020231FC ; =NNS_G3dGlb + 0x4C
	add r0, r4, #0
	bl MTX_LookAt
	ldr r1, _02023200 ; =NNS_G3dGlb + 0x80
	mov r0, #0xe8
	ldr r2, [r1, #0x7c]
	bic r2, r0
	str r2, [r1, #0x7c]
_020231E6:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_020231EC: .word _021D2204
_020231F0: .word NNS_G3dGlb + 0x240
_020231F4: .word NNS_G3dGlb + 0x24C
_020231F8: .word NNS_G3dGlb + 0x258
_020231FC: .word NNS_G3dGlb + 0x4C
_02023200: .word NNS_G3dGlb + 0x80
	thumb_func_end sub_02023154

	thumb_func_start GF_Camera_SetBindTarget
GF_Camera_SetBindTarget: ; 0x02023204
	add r3, r0, #0
	add r2, r1, #0
	ldmia r3!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end GF_Camera_SetBindTarget

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

	thumb_func_start GF_Camera_SetClipBounds
GF_Camera_SetClipBounds: ; 0x02023240
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
	thumb_func_end GF_Camera_SetClipBounds

	thumb_func_start GF_Camera_InitFromTargetDistanceAndAngle
GF_Camera_InitFromTargetDistanceAndAngle: ; 0x02023254
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
	thumb_func_end GF_Camera_InitFromTargetDistanceAndAngle

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
	ldr r0, _02023488 ; =NNS_G3dGlb + 0x8
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	ldr r3, [r5, #0xc]
	bl MTX_PerspectiveW
	ldr r1, _0202348C ; =NNS_G3dGlb + 0x80
	mov r0, #0x50
	ldr r2, [r1, #0x7c]
	add r5, #0x44
	bic r2, r0
	str r2, [r1, #0x7c]
	mov r1, #0
	ldr r0, _02023490 ; =_0210F6DC
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
	ldr r0, _02023488 ; =NNS_G3dGlb + 0x8
	neg r2, r3
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl MTX_OrthoW
	ldr r1, _0202348C ; =NNS_G3dGlb + 0x80
	mov r0, #0x50
	ldr r2, [r1, #0x7c]
	add r5, #0x44
	bic r2, r0
	str r2, [r1, #0x7c]
	mov r0, #1
	strb r0, [r5]
	ldr r0, _02023490 ; =_0210F6DC
	mov r1, #0
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02023488: .word NNS_G3dGlb + 0x8
_0202348C: .word NNS_G3dGlb + 0x80
_02023490: .word _0210F6DC
	thumb_func_end sub_020233D8

	thumb_func_start GF_Camera_SetPerspectiveAngle
GF_Camera_SetPerspectiveAngle: ; 0x02023494
	add r2, r1, #0
	add r2, #0x46
	strh r0, [r2]
	add r0, r1, #0
	add r0, #0x46
	ldrh r0, [r0]
	ldr r3, _020234C8 ; =sub_020233D8
	asr r0, r0, #4
	lsl r2, r0, #2
	ldr r0, _020234CC ; =FX_SinCosTable_
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
_020234CC: .word FX_SinCosTable_
	thumb_func_end GF_Camera_SetPerspectiveAngle

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
	ldr r0, _02023510 ; =FX_SinCosTable_
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
_02023510: .word FX_SinCosTable_
	thumb_func_end sub_020234D0

	thumb_func_start GF_Camera_ShiftBy
GF_Camera_ShiftBy: ; 0x02023514
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
	thumb_func_end GF_Camera_ShiftBy

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

	thumb_func_start GF_Camera_SetAngle
GF_Camera_SetAngle: ; 0x02023558
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
	thumb_func_end GF_Camera_SetAngle

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

	thumb_func_start GF_Camera_SetDistance
GF_Camera_SetDistance: ; 0x020235D4
	ldr r3, _020235DC ; =sub_02022D74
	str r0, [r1, #0x38]
	add r0, r1, #0
	bx r3
	.balign 4, 0
_020235DC: .word sub_02022D74
	thumb_func_end GF_Camera_SetDistance

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

	thumb_func_start GF_Camera_GetPerspectiveAngle
GF_Camera_GetPerspectiveAngle: ; 0x0202360C
	add r0, #0x46
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end GF_Camera_GetPerspectiveAngle

	thumb_func_start GF_Camera_GetDistance
GF_Camera_GetDistance: ; 0x02023614
	ldr r0, [r0, #0x38]
	bx lr
	thumb_func_end GF_Camera_GetDistance

	thumb_func_start GF_Camera_GetAngle
GF_Camera_GetAngle: ; 0x02023618
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
	thumb_func_end GF_Camera_GetAngle

	thumb_func_start GF_Camera_GetTarget
GF_Camera_GetTarget: ; 0x02023630
	add r2, r1, #0
	add r2, #0x20
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end GF_Camera_GetTarget

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

	thumb_func_start GF_Camera_GetBindTarget
GF_Camera_GetBindTarget: ; 0x02023658
	ldr r0, [r0, #0x54]
	bx lr
	thumb_func_end GF_Camera_GetBindTarget

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
