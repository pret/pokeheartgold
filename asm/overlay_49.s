	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov49_02258800
ov49_02258800: ; 0x02258800
	mov r3, #0
	ldrsh r2, [r0, r3]
	lsl r2, r2, #0xc
	str r2, [r1]
	mov r2, #2
	ldrsh r0, [r0, r2]
	lsl r0, r0, #0xc
	str r0, [r1, #8]
	str r3, [r1, #4]
	bx lr
	thumb_func_end ov49_02258800

	thumb_func_start ov49_02258814
ov49_02258814: ; 0x02258814
	ldr r3, [r0]
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	asr r2, r2, #0xc
	strh r2, [r1]
	ldr r2, [r0, #8]
	asr r0, r2, #0xb
	lsr r0, r0, #0x14
	add r0, r2, r0
	asr r0, r0, #0xc
	strh r0, [r1, #2]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02258814

	thumb_func_start ov49_02258830
ov49_02258830: ; 0x02258830
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0
	add r7, r3, #0
	bl GfGfxLoader_LoadFromOpenNarc
	add r4, r0, #0
	bl NNS_G3dGetTex
	add r6, r0, #0
	bl AllocAndLoad3dTexResources
	add r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl NNS_G3dTexReleaseTexKey
	add r0, r6, #0
	bl NNS_G3dPlttReleasePlttKey
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02025ACC
	add r6, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl memcpy
	ldr r0, [r5]
	bl NNS_G3dGetTex
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	add r5, r0, #0
	bl NNS_G3dTexSetTexKey
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl NNS_G3dPlttSetPlttKey
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02258830

	thumb_func_start ov49_022588A0
ov49_022588A0: ; 0x022588A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	add r1, sp, #0x54
	add r2, sp, #0x58
	add r3, sp, #0x5c
	bl sub_020182B0
	add r0, r5, #0
	add r1, sp, #0x48
	add r2, sp, #0x4c
	add r3, sp, #0x50
	bl sub_020182CC
	add r0, r5, #0
	mov r1, #0
	bl sub_020182EC
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_020182EC
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl sub_020182EC
	add r5, r0, #0
	add r0, sp, #0x24
	bl MTX_Identity33_
	asr r0, r6, #4
	lsl r3, r0, #1
	lsl r1, r3, #1
	ldr r2, _02258954 ; =FX_SinCosTable_
	add r3, r3, #1
	lsl r3, r3, #1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, sp, #0
	bl MTX_RotX33_
	add r1, sp, #0x24
	add r0, sp, #0
	add r2, r1, #0
	bl MTX_Concat33
	asr r0, r5, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	ldr r3, _02258954 ; =FX_SinCosTable_
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r1, sp, #0x24
	add r0, sp, #0
	add r2, r1, #0
	bl MTX_Concat33
	asr r0, r7, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	ldr r3, _02258954 ; =FX_SinCosTable_
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotY33_
	add r1, sp, #0x24
	add r0, sp, #0
	add r2, r1, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	add r1, sp, #0x54
	add r2, sp, #0x24
	add r3, sp, #0x48
	bl sub_0201F990
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02258954: .word FX_SinCosTable_
	thumb_func_end ov49_022588A0

	thumb_func_start ov49_02258958
ov49_02258958: ; 0x02258958
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #4
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0x23
	mov r1, #0x2a
	add r2, r5, #0
	bl ov42_02227EE0
	str r0, [r4]
	mov r0, #1
	mov r1, #0
	str r0, [sp]
	mov r0, #0xca
	add r2, r1, #0
	add r3, r5, #0
	bl GfGfxLoader_LoadFromNarc
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov42_02227F48
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02258958

	thumb_func_start ov49_02258994
ov49_02258994: ; 0x02258994
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov42_02227F28
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02258994

	thumb_func_start ov49_022589A8
ov49_022589A8: ; 0x022589A8
	mov r0, #0x23
	bx lr
	thumb_func_end ov49_022589A8

	thumb_func_start ov49_022589AC
ov49_022589AC: ; 0x022589AC
	ldr r3, _022589B4 ; =ov42_02227FA4
	ldr r0, [r0]
	bx r3
	nop
_022589B4: .word ov42_02227FA4
	thumb_func_end ov49_022589AC

	thumb_func_start ov49_022589B8
ov49_022589B8: ; 0x022589B8
	push {r3, lr}
	ldr r0, [r0]
	bl ov42_02227FDC
	lsr r0, r0, #0xf
	pop {r3, pc}
	thumb_func_end ov49_022589B8

	thumb_func_start ov49_022589C4
ov49_022589C4: ; 0x022589C4
	push {r3, lr}
	ldr r0, [r0]
	bl ov42_02227FDC
	ldr r1, _022589D4 ; =0x00007FFF
	and r0, r1
	pop {r3, pc}
	nop
_022589D4: .word 0x00007FFF
	thumb_func_end ov49_022589C4

	thumb_func_start ov49_022589D8
ov49_022589D8: ; 0x022589D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r5, #0
	ldr r7, [sp, #0x28]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r5, [sp, #0x10]
_022589EA:
	ldr r0, [sp, #0x10]
	mov r4, #0
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
_022589F2:
	lsl r1, r4, #0x10
	ldr r0, [sp]
	lsr r1, r1, #0x10
	add r2, r6, #0
	bl ov49_022589B8
	ldr r1, [sp, #4]
	cmp r0, r1
	bne _02258A1A
	cmp r5, r7
	blo _02258A18
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	strh r4, [r0]
	ldr r0, [sp, #0xc]
	add sp, #0x14
	strh r1, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02258A18:
	add r5, r5, #1
_02258A1A:
	add r4, r4, #1
	cmp r4, #0x23
	blt _022589F2
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0x2a
	blt _022589EA
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_022589D8

	thumb_func_start ov49_02258A30
ov49_02258A30: ; 0x02258A30
	ldr r3, _02258A4C ; =ov49_02269634
	mov r2, #0
_02258A34:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A3E
	mov r0, #1
	bx lr
_02258A3E:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #0x20
	blo _02258A34
	mov r0, #0
	bx lr
	nop
_02258A4C: .word ov49_02269634
	thumb_func_end ov49_02258A30

	thumb_func_start ov49_02258A50
ov49_02258A50: ; 0x02258A50
	ldr r3, _02258A6C ; =_02269624
	mov r2, #0
_02258A54:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A5E
	mov r0, #1
	bx lr
_02258A5E:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #3
	blo _02258A54
	mov r0, #0
	bx lr
	nop
_02258A6C: .word _02269624
	thumb_func_end ov49_02258A50

	thumb_func_start ov49_02258A70
ov49_02258A70: ; 0x02258A70
	ldr r3, _02258A8C ; =ov49_0226962C
	mov r2, #0
_02258A74:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A7E
	mov r0, #1
	bx lr
_02258A7E:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #7
	blo _02258A74
	mov r0, #0
	bx lr
	nop
_02258A8C: .word ov49_0226962C
	thumb_func_end ov49_02258A70

	thumb_func_start ov49_02258A90
ov49_02258A90: ; 0x02258A90
	ldr r3, _02258AAC ; =ov49_02269628
	mov r2, #0
_02258A94:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A9E
	mov r0, #1
	bx lr
_02258A9E:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #4
	blo _02258A94
	mov r0, #0
	bx lr
	nop
_02258AAC: .word ov49_02269628
	thumb_func_end ov49_02258A90

	thumb_func_start ov49_02258AB0
ov49_02258AB0: ; 0x02258AB0
	ldr r0, [r0]
	bx lr
	thumb_func_end ov49_02258AB0

	thumb_func_start ov49_02258AB4
ov49_02258AB4: ; 0x02258AB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	mov r1, #0x28
	str r2, [sp]
	str r3, [sp, #4]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl memset
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov42_02228010
	str r0, [r4]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0x20]
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_02230498
	str r0, [r4, #4]
	ldr r1, [sp, #4]
	mov r0, #0x20
	bl ov42_02229A40
	str r0, [r4, #0x10]
	mov r0, #0x28
	add r7, r5, #0
	mul r7, r0
	ldr r0, [sp, #4]
	add r1, r7, #0
	strh r5, [r4, #0xc]
	bl AllocFromHeap
	mov r1, #0
	add r2, r7, #0
	str r0, [r4, #8]
	bl memset
	ldr r0, [sp]
	str r0, [r4, #0x14]
	add r0, r4, #0
	strh r6, [r4, #0xe]
	bl ov49_022591D8
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02258AB4

	thumb_func_start ov49_02258B20
ov49_02258B20: ; 0x02258B20
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4, #0x10]
	bl ov42_02229A78
	ldr r0, [r4, #4]
	bl ov45_02230638
	ldr r0, [r4]
	bl ov42_02228050
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov49_02258B20

	thumb_func_start ov49_02258B44
ov49_02258B44: ; 0x02258B44
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov42_0222807C
	add r0, r4, #0
	ldr r1, [r4, #4]
	add r0, #0x18
	bl ov49_02259A54
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02258B44

	thumb_func_start ov49_02258B5C
ov49_02258B5C: ; 0x02258B5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrh r0, [r5, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _02258B8C
	add r4, r6, #0
_02258B6C:
	ldr r0, [r5, #8]
	add r0, r0, r4
	bl ov49_022593FC
	cmp r0, #0
	bne _02258B82
	ldr r0, [r5, #8]
	add r1, r5, #0
	add r0, r0, r4
	ldr r2, [r0, #0x24]
	blx r2
_02258B82:
	ldrh r0, [r5, #0xc]
	add r6, r6, #1
	add r4, #0x28
	cmp r6, r0
	blt _02258B6C
_02258B8C:
	ldr r0, [r5, #0x14]
	bl ov49_02258AB0
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	add r1, sp, #8
	bl ov42_02229AC8
	cmp r0, #1
	bne _02258BC8
	add r7, sp, #0
	add r6, sp, #8
_02258BA4:
	ldr r1, [r5]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov42_02228C80
	cmp r0, #1
	bne _02258BBC
	ldr r0, [r5]
	add r1, r7, #0
	bl ov42_02228068
_02258BBC:
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	bl ov42_02229AC8
	cmp r0, #1
	beq _02258BA4
_02258BC8:
	ldr r0, [r5, #4]
	bl ov45_02230680
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02258B5C

	thumb_func_start ov49_02258BD4
ov49_02258BD4: ; 0x02258BD4
	ldr r3, _02258BDC ; =ov45_022306B4
	ldr r0, [r0, #4]
	bx r3
	nop
_02258BDC: .word ov45_022306B4
	thumb_func_end ov49_02258BD4

	thumb_func_start ov49_02258BE0
ov49_02258BE0: ; 0x02258BE0
	ldr r3, _02258BE8 ; =ov45_022306F4
	ldr r0, [r0, #4]
	bx r3
	nop
_02258BE8: .word ov45_022306F4
	thumb_func_end ov49_02258BE0

	thumb_func_start ov49_02258BEC
ov49_02258BEC: ; 0x02258BEC
	add r3, r0, #0
	add r2, r1, #0
	ldr r1, [r3, #4]
	lsl r3, r2, #2
	ldr r2, _02258C00 ; =ov49_02269660
	add r0, #0x18
	ldr r2, [r2, r3]
	ldr r3, _02258C04 ; =ov49_02259A20
	bx r3
	nop
_02258C00: .word ov49_02269660
_02258C04: .word ov49_02259A20
	thumb_func_end ov49_02258BEC

	thumb_func_start ov49_02258C08
ov49_02258C08: ; 0x02258C08
	lsl r2, r1, #2
	ldr r1, _02258C14 ; =ov49_02269660
	ldr r3, _02258C18 ; =ov49_02259A3C
	add r0, #0x18
	ldr r1, [r1, r2]
	bx r3
	.balign 4, 0
_02258C14: .word ov49_02269660
_02258C18: .word ov49_02259A3C
	thumb_func_end ov49_02258C08

	thumb_func_start ov49_02258C1C
ov49_02258C1C: ; 0x02258C1C
	ldr r3, _02258C24 ; =ov42_02229A8C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_02258C24: .word ov42_02229A8C
	thumb_func_end ov49_02258C1C

	thumb_func_start ov49_02258C28
ov49_02258C28: ; 0x02258C28
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r2, sp, #4
	add r4, r1, #0
	ldr r0, [r5, #0x14]
	mov r1, #3
	add r2, #2
	add r3, sp, #4
	bl ov49_022589D8
	cmp r0, #0
	bne _02258C4A
	bl GF_AssertFail
_02258C4A:
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02258C5C
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02258C28

	thumb_func_start ov49_02258C5C
ov49_02258C5C: ; 0x02258C5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	str r3, [sp]
	bl ov49_022593C0
	add r4, r0, #0
	lsl r0, r7, #4
	add r1, sp, #4
	strh r0, [r1]
	ldr r0, [sp]
	mov r2, #0
	lsl r0, r0, #4
	strh r0, [r1, #2]
	strh r6, [r1, #4]
	strh r2, [r1, #6]
	strh r2, [r1, #8]
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	bne _02258C8C
	strh r2, [r1, #0xa]
	b _02258C90
_02258C8C:
	mov r0, #0x61
	strh r0, [r1, #0xa]
_02258C90:
	ldr r0, [r5]
	add r1, sp, #4
	bl ov42_022280B8
	str r0, [r4]
	ldr r0, [r5, #4]
	ldr r1, [r4]
	bl ov45_0223070C
	str r0, [r4, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	str r4, [r5, #0x20]
	bl ov49_02258EEC
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02258C5C

	thumb_func_start ov49_02258CB8
ov49_02258CB8: ; 0x02258CB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp, #4]
	bl ov49_022593C0
	mov r6, #0
	str r0, [sp, #8]
	add r4, r6, #0
_02258CCC:
	str r4, [sp]
	add r2, sp, #0xc
	ldr r0, [r5, #0x14]
	add r1, r7, #4
	add r2, #2
	add r3, sp, #0xc
	bl ov49_022589D8
	cmp r0, #0
	bne _02258CE6
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02258CE6:
	add r0, r5, #0
	bl ov49_02258DAC
	cmp r0, #0
	bne _02258CF4
	mov r6, #1
	b _02258D06
_02258CF4:
	add r1, sp, #0xc
	add r2, sp, #0xc
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	bl ov49_02258FDC
	cmp r0, #0
	bne _02258D06
	mov r6, #1
_02258D06:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r6, #0
	beq _02258CCC
	add r1, sp, #0xc
	ldrh r0, [r1, #2]
	lsl r0, r0, #4
	strh r0, [r1, #4]
	ldrh r0, [r1]
	lsl r0, r0, #4
	strh r0, [r1, #6]
	strh r7, [r1, #8]
	mov r0, #0
	strh r0, [r1, #0xa]
	mov r0, #1
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	strh r0, [r1, #0xe]
	ldr r0, [r5]
	add r1, sp, #0x10
	bl ov42_022280B8
	ldr r1, [sp, #8]
	str r0, [r1]
	ldr r0, [r5, #4]
	ldr r1, [r1]
	bl ov45_0223070C
	ldr r1, [sp, #8]
	mov r2, #0
	str r0, [r1, #4]
	add r0, r5, #0
	bl ov49_02258EEC
	ldr r0, [sp, #8]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02258CB8

	thumb_func_start ov49_02258D54
ov49_02258D54: ; 0x02258D54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov45_02230884
	ldr r0, [r4]
	bl ov42_02228100
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x28
	bl memset
	pop {r4, pc}
	thumb_func_end ov49_02258D54

	thumb_func_start ov49_02258D70
ov49_02258D70: ; 0x02258D70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0xc]
	add r7, r1, #0
	mov r6, #0
	cmp r0, #0
	ble _02258DA6
	add r4, r6, #0
_02258D80:
	ldr r0, [r5, #8]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _02258D9C
	mov r1, #4
	bl ov42_02228188
	cmp r0, r7
	bne _02258D9C
	mov r0, #0x28
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	pop {r3, r4, r5, r6, r7, pc}
_02258D9C:
	ldrh r0, [r5, #0xc]
	add r6, r6, #1
	add r4, #0x28
	cmp r6, r0
	blt _02258D80
_02258DA6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02258D70

	thumb_func_start ov49_02258DAC
ov49_02258DAC: ; 0x02258DAC
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov49_02258DAC

	thumb_func_start ov49_02258DB0
ov49_02258DB0: ; 0x02258DB0
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end ov49_02258DB0

	thumb_func_start ov49_02258DB4
ov49_02258DB4: ; 0x02258DB4
	push {r0, r1, r2, r3}
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02258DC4
	bl GF_AssertFail
_02258DC4:
	add r1, sp, #8
	ldrh r2, [r1, #4]
	mov r3, sp
	ldr r0, [r4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #8
	mov r3, sp
	ldrh r2, [r1, #4]
	ldr r0, [r4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	ldr r0, [r4]
	mov r1, #5
	mov r2, #0
	bl ov42_022281F8
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov49_02258DB4

	thumb_func_start ov49_02258E04
ov49_02258E04: ; 0x02258E04
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r1, sp, #0x10
	add r4, r2, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r5, r0, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258DB4
	ldr r0, [r5]
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov49_02258E04

	thumb_func_start ov49_02258E34
ov49_02258E34: ; 0x02258E34
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02258E44
	bl GF_AssertFail
_02258E44:
	ldr r0, [r4]
	bl ov42_022282F4
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1, #2]
	ldrh r0, [r1]
	lsl r1, r2, #0x10
	orr r0, r1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02258E34

	thumb_func_start ov49_02258E60
ov49_02258E60: ; 0x02258E60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	bne _02258E70
	bl GF_AssertFail
_02258E70:
	ldr r0, [r5]
	add r1, r4, #0
	bl ov42_02228188
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_02258E60

	thumb_func_start ov49_02258E7C
ov49_02258E7C: ; 0x02258E7C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #5
	add r6, r2, #0
	add r7, r3, #0
	bl ov42_02228188
	cmp r0, #0
	beq _02258E96
	bl GF_AssertFail
_02258E96:
	ldr r0, [r4]
	mov r1, #4
	bl ov42_02228188
	add r3, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02258E7C

	thumb_func_start ov49_02258EAC
ov49_02258EAC: ; 0x02258EAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	add r6, r2, #0
	add r7, r3, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	strh r6, [r1, #8]
	strb r7, [r1, #0xa]
	ldr r0, [r4]
	mov r1, #4
	bl ov42_02228188
	add r1, sp, #0
	strb r0, [r1, #0xb]
	ldr r0, [r5]
	add r1, sp, #4
	bl ov42_02228068
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02258EAC

	thumb_func_start ov49_02258EEC
ov49_02258EEC: ; 0x02258EEC
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	cmp r4, #0xa
	blt _02258EFC
	bl GF_AssertFail
_02258EFC:
	ldrb r0, [r5, #0xb]
	lsl r1, r0, #2
	ldr r0, _02258F30 ; =ov49_02269698
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02258F0E
	add r0, r5, #0
	add r1, r6, #0
	blx r2
_02258F0E:
	mov r2, #0
	strh r2, [r5, #8]
	strb r2, [r5, #0xa]
	add r1, r5, #0
	strb r4, [r5, #0xb]
	add r1, #0xc
	mov r0, #0x18
_02258F1C:
	strb r2, [r1]
	add r1, r1, #1
	sub r0, r0, #1
	bne _02258F1C
	ldr r0, _02258F34 ; =ov49_022696C0
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	str r0, [r5, #0x24]
	pop {r4, r5, r6, pc}
	nop
_02258F30: .word ov49_02269698
_02258F34: .word ov49_022696C0
	thumb_func_end ov49_02258EEC

	thumb_func_start ov49_02258F38
ov49_02258F38: ; 0x02258F38
	ldrb r0, [r0, #0xa]
	bx lr
	thumb_func_end ov49_02258F38

	thumb_func_start ov49_02258F3C
ov49_02258F3C: ; 0x02258F3C
	ldrb r0, [r0, #0xb]
	bx lr
	thumb_func_end ov49_02258F3C

	thumb_func_start ov49_02258F40
ov49_02258F40: ; 0x02258F40
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #6
	bl ov42_02228188
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, [r5]
	bl ov42_022283BC
	cmp r0, #0
	bne _02258F60
	mov r0, #0
	pop {r3, r4, r5, pc}
_02258F60:
	mov r1, #4
	bl ov42_02228188
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_02258D70
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02258F40

	thumb_func_start ov49_02258F70
ov49_02258F70: ; 0x02258F70
	ldr r3, _02258F78 ; =ov45_022308B8
	ldr r0, [r0, #4]
	bx r3
	nop
_02258F78: .word ov45_022308B8
	thumb_func_end ov49_02258F70

	thumb_func_start ov49_02258F7C
ov49_02258F7C: ; 0x02258F7C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	lsl r0, r1, #4
	add r1, sp, #0
	strh r0, [r1]
	lsl r0, r2, #4
	strh r0, [r1, #2]
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022284A4
	cmp r0, #0
	bne _02258FAA
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_02258FAA:
	ldrh r2, [r4, #0xc]
	mov r1, #0
	cmp r2, #0
	ble _02258FD0
	ldr r3, [r4, #8]
_02258FB4:
	ldr r2, [r3]
	cmp r2, r0
	bne _02258FC6
	mov r0, #0x28
	ldr r2, [r4, #8]
	mul r0, r1
	add sp, #4
	add r0, r2, r0
	pop {r3, r4, pc}
_02258FC6:
	ldrh r2, [r4, #0xc]
	add r1, r1, #1
	add r3, #0x28
	cmp r1, r2
	blt _02258FB4
_02258FD0:
	bl GF_AssertFail
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02258F7C

	thumb_func_start ov49_02258FDC
ov49_02258FDC: ; 0x02258FDC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r4, r2, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldr r0, [r5]
	bl ov42_022282E8
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #0xc
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r1, [r2, r1]
	lsl r0, r6, #4
	cmp r1, r0
	bne _0225902C
	mov r1, #0xe
	ldrsh r2, [r2, r1]
	lsl r1, r4, #4
	cmp r2, r1
	bne _0225902C
	add sp, #0x10
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225902C:
	add r2, sp, #0
	mov r1, #8
	ldrsh r1, [r2, r1]
	cmp r1, r0
	bne _02259046
	mov r0, #0xa
	ldrsh r1, [r2, r0]
	lsl r0, r4, #4
	cmp r1, r0
	bne _02259046
	add sp, #0x10
	mov r0, #1
	pop {r4, r5, r6, pc}
_02259046:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_02258FDC

	thumb_func_start ov49_0225904C
ov49_0225904C: ; 0x0225904C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r0, #0
	ldr r0, [r1]
	str r2, [sp]
	str r3, [sp, #4]
	bl ov42_022282DC
	add r4, sp, #0x1c
	strh r0, [r4, #4]
	lsr r0, r0, #0x10
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	mov r5, sp
	ldr r7, _0225912C ; =ov49_02269654
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #6]
	sub r5, r5, #4
	strh r0, [r4, #0xe]
	mov r0, #0
	str r0, [sp, #0x10]
	ldrh r0, [r4, #0xc]
	str r0, [sp, #0x14]
	ldrh r0, [r4, #0xe]
	str r0, [sp, #0x18]
_0225907E:
	ldr r0, [sp, #0x14]
	strh r0, [r5]
	ldr r0, [sp, #0x18]
	strh r0, [r5, #2]
	ldrb r1, [r7]
	ldr r0, [r5]
	bl ov42_02228270
	strh r0, [r4]
	lsr r0, r0, #0x10
	strh r0, [r4, #2]
	ldrh r0, [r4]
	strh r0, [r4, #8]
	ldrh r0, [r4, #2]
	strh r0, [r4, #0xa]
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	str r0, [sp, #0xc]
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, [sp, #0xc]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	lsl r2, r2, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r6, #0x14]
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov49_022589AC
	cmp r0, #1
	beq _02259118
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r6, #0x14]
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov49_022589C4
	cmp r0, #0
	beq _022590E8
	cmp r0, #0x2a
	bne _02259118
_022590E8:
	ldrh r1, [r4, #8]
	ldr r0, [r6]
	strh r1, [r5]
	ldrh r1, [r4, #0xa]
	strh r1, [r5, #2]
	ldr r1, [r5]
	bl ov42_022284A4
	cmp r0, #0
	bne _02259118
	ldr r1, _0225912C ; =ov49_02269654
	ldr r0, [sp, #0x10]
	ldrb r1, [r1, r0]
	ldr r0, [sp]
	str r1, [r0]
	add r1, sp, #0x1c
	ldr r0, [sp, #4]
	ldrh r2, [r1, #8]
	add sp, #0x2c
	strh r2, [r0]
	ldrh r1, [r1, #0xa]
	strh r1, [r0, #2]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02259118:
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0225907E
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0225912C: .word ov49_02269654
	thumb_func_end ov49_0225904C

	thumb_func_start ov49_02259130
ov49_02259130: ; 0x02259130
	ldr r3, _02259138 ; =ov45_0223089C
	ldr r0, [r0, #4]
	bx r3
	nop
_02259138: .word ov45_0223089C
	thumb_func_end ov49_02259130

	thumb_func_start ov49_0225913C
ov49_0225913C: ; 0x0225913C
	ldr r3, _02259144 ; =ov45_022308C0
	ldr r0, [r0, #4]
	bx r3
	nop
_02259144: .word ov45_022308C0
	thumb_func_end ov49_0225913C

	thumb_func_start ov49_02259148
ov49_02259148: ; 0x02259148
	ldr r3, _02259150 ; =ov45_022308E4
	ldr r0, [r0, #4]
	bx r3
	nop
_02259150: .word ov45_022308E4
	thumb_func_end ov49_02259148

	thumb_func_start ov49_02259154
ov49_02259154: ; 0x02259154
	ldr r3, _0225915C ; =ov45_02230908
	ldr r0, [r0, #4]
	bx r3
	nop
_0225915C: .word ov45_02230908
	thumb_func_end ov49_02259154

	thumb_func_start ov49_02259160
ov49_02259160: ; 0x02259160
	ldr r3, _02259168 ; =ov45_02230920
	ldr r0, [r0, #4]
	bx r3
	nop
_02259168: .word ov45_02230920
	thumb_func_end ov49_02259160

	thumb_func_start ov49_0225916C
ov49_0225916C: ; 0x0225916C
	push {r3, lr}
	cmp r1, #0
	ldr r0, [r0, #4]
	beq _0225917C
	mov r1, #1
	bl ov45_0223093C
	pop {r3, pc}
_0225917C:
	bl ov45_02230968
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225916C

	thumb_func_start ov49_02259184
ov49_02259184: ; 0x02259184
	push {r3, lr}
	cmp r1, #0
	ldr r0, [r0, #4]
	beq _02259194
	mov r1, #0
	bl ov45_0223093C
	pop {r3, pc}
_02259194:
	bl ov45_02230968
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02259184

	thumb_func_start ov49_0225919C
ov49_0225919C: ; 0x0225919C
	push {r3, lr}
	cmp r1, #0
	ldr r0, [r0, #4]
	beq _022591AC
	mov r1, #2
	bl ov45_0223093C
	pop {r3, pc}
_022591AC:
	bl ov45_02230968
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225919C

	thumb_func_start ov49_022591B4
ov49_022591B4: ; 0x022591B4
	ldr r3, _022591BC ; =ov45_022308B0
	ldr r0, [r0, #4]
	bx r3
	nop
_022591BC: .word ov45_022308B0
	thumb_func_end ov49_022591B4

	thumb_func_start ov49_022591C0
ov49_022591C0: ; 0x022591C0
	ldr r3, _022591C8 ; =ov45_02230978
	ldr r0, [r0, #4]
	bx r3
	nop
_022591C8: .word ov45_02230978
	thumb_func_end ov49_022591C0

	thumb_func_start ov49_022591CC
ov49_022591CC: ; 0x022591CC
	ldr r3, _022591D4 ; =ov45_02230994
	ldr r0, [r0, #4]
	bx r3
	nop
_022591D4: .word ov45_02230994
	thumb_func_end ov49_022591CC

	thumb_func_start ov49_022591D8
ov49_022591D8: ; 0x022591D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0
	ldr r4, _02259278 ; =ov49_02269678
	str r0, [sp, #8]
_022591E4:
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp]
	ldrb r1, [r4]
	add r2, sp, #0xc
	ldr r0, [r5, #0x14]
	add r2, #2
	add r3, sp, #0xc
	bl ov49_022589D8
	cmp r0, #1
	bne _02259266
	add r7, sp, #0xc
_022591FE:
	add r0, r5, #0
	bl ov49_022593C0
	add r6, r0, #0
	ldrh r0, [r7, #2]
	add r1, sp, #0x10
	lsl r0, r0, #4
	strh r0, [r7, #4]
	ldrh r0, [r7]
	lsl r0, r0, #4
	strh r0, [r7, #6]
	ldrb r0, [r4, #4]
	strh r0, [r7, #8]
	mov r0, #0
	strh r0, [r7, #0xa]
	ldrb r0, [r4, #1]
	strh r0, [r7, #0xc]
	ldrh r0, [r4, #2]
	strh r0, [r7, #0xe]
	ldr r0, [r5]
	bl ov42_022280B8
	add r1, r0, #0
	str r1, [r6]
	ldr r0, [r5, #4]
	bl ov45_0223070C
	str r0, [r6, #4]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov49_02258EEC
	ldrb r0, [r4]
	cmp r0, #0x61
	bne _02259248
	str r6, [r5, #0x24]
_02259248:
	ldr r0, [sp, #4]
	add r2, sp, #0xc
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	str r0, [sp]
	ldrb r1, [r4]
	ldr r0, [r5, #0x14]
	add r2, #2
	add r3, sp, #0xc
	bl ov49_022589D8
	cmp r0, #1
	beq _022591FE
_02259266:
	ldr r0, [sp, #8]
	add r4, #8
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	blo _022591E4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02259278: .word ov49_02269678
	thumb_func_end ov49_022591D8

	thumb_func_start ov49_0225927C
ov49_0225927C: ; 0x0225927C
	push {r3, r4, lr}
	sub sp, #4
	add r4, sp, #0
	strh r1, [r4]
	strb r2, [r4, #2]
	add r1, sp, #0
	strb r3, [r4, #3]
	bl ov49_02258C1C
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225927C

	thumb_func_start ov49_02259294
ov49_02259294: ; 0x02259294
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl MTRandom
	add r1, r4, #0
	bl _u32_div_f
	ldrb r0, [r5, r1]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02259294

	thumb_func_start ov49_022592A8
ov49_022592A8: ; 0x022592A8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r1]
	add r6, r2, #0
	add r4, r3, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	add r1, r6, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #8
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r3, [r2, r1]
	ldr r0, [r5, #0x14]
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	mov r3, #0xa
	ldrsh r3, [r2, r3]
	lsl r1, r1, #0xc
	lsr r1, r1, #0x10
	asr r2, r3, #3
	lsr r2, r2, #0x1c
	add r2, r3, r2
	lsl r2, r2, #0xc
	lsr r2, r2, #0x10
	bl ov49_022589B8
	cmp r0, r4
	bne _02259318
	add sp, #0x10
	mov r0, #1
	pop {r4, r5, r6, pc}
_02259318:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_022592A8

	thumb_func_start ov49_02259320
ov49_02259320: ; 0x02259320
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	bx lr
	thumb_func_end ov49_02259320

	thumb_func_start ov49_0225932C
ov49_0225932C: ; 0x0225932C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r6, [r5, #8]
	beq _02259348
	lsl r0, r4, #0xc
	bl _ffltu
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02259356
_02259348:
	lsl r0, r4, #0xc
	bl _ffltu
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02259356:
	bl _ffix
	add r2, r0, #0
	asr r1, r6, #0x1f
	add r0, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r6, r2, #0xc
	orr r6, r0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0225938E
	lsl r0, r0, #0xc
	bl _ffltu
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225939C
_0225938E:
	lsl r0, r0, #0xc
	bl _ffltu
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225939C:
	bl _ffix
	add r1, r0, #0
	add r0, r6, #0
	bl FX_Div
	ldr r1, [r5, #4]
	add r0, r0, r1
	str r0, [r5]
	ldr r0, [r5, #0xc]
	cmp r4, r0
	blo _022593B8
	mov r0, #1
	pop {r4, r5, r6, pc}
_022593B8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225932C

	thumb_func_start ov49_022593BC
ov49_022593BC: ; 0x022593BC
	ldr r0, [r0]
	bx lr
	thumb_func_end ov49_022593BC

	thumb_func_start ov49_022593C0
ov49_022593C0: ; 0x022593C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _022593EE
	add r4, r6, #0
_022593CE:
	ldr r0, [r5, #8]
	add r0, r0, r4
	bl ov49_022593FC
	cmp r0, #0
	beq _022593E4
	mov r0, #0x28
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	pop {r4, r5, r6, pc}
_022593E4:
	ldrh r0, [r5, #0xc]
	add r6, r6, #1
	add r4, #0x28
	cmp r6, r0
	blt _022593CE
_022593EE:
	bl GF_AssertFail
	mov r0, #0x28
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_022593C0

	thumb_func_start ov49_022593FC
ov49_022593FC: ; 0x022593FC
	ldr r0, [r0]
	cmp r0, #0
	bne _02259406
	mov r0, #1
	bx lr
_02259406:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_022593FC

	thumb_func_start ov49_0225940C
ov49_0225940C: ; 0x0225940C
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225940C

	thumb_func_start ov49_02259410
ov49_02259410: ; 0x02259410
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	add r5, r1, #0
	mov r1, #6
	bl ov42_02228188
	add r4, r0, #0
	ldr r0, [r7]
	mov r1, #4
	bl ov42_02228188
	add r6, r0, #0
	ldr r0, [r7]
	mov r1, #5
	bl ov42_02228188
	cmp r0, #0
	bne _022594D2
	ldr r0, _022594D4 ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x44]
	add r2, r0, #0
	tst r2, r1
	beq _02259444
	mov r1, #3
_02259444:
	mov r2, #0x40
	tst r2, r0
	beq _02259468
	cmp r4, #0
	bne _0225945A
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_0225945A:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	add r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_02259468:
	mov r2, #0x80
	tst r2, r0
	beq _0225948C
	cmp r4, #1
	bne _0225947E
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_0225947E:
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	add r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_0225948C:
	mov r2, #0x20
	tst r2, r0
	beq _022594B0
	cmp r4, #2
	bne _022594A2
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_022594A2:
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	add r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_022594B0:
	mov r2, #0x10
	tst r0, r2
	beq _022594D2
	cmp r4, #3
	bne _022594C6
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_022594C6:
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	add r3, r6, #0
	bl ov49_0225927C
_022594D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022594D4: .word gSystem
	thumb_func_end ov49_02259410

	thumb_func_start ov49_022594D8
ov49_022594D8: ; 0x022594D8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	add r5, r1, #0
	cmp r0, #4
	bhi _022595C0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022594F0: ; jump table
	.short _022594FA - _022594F0 - 2 ; case 0
	.short _0225950C - _022594F0 - 2 ; case 1
	.short _02259522 - _022594F0 - 2 ; case 2
	.short _0225958E - _022594F0 - 2 ; case 3
	.short _022595B0 - _022594F0 - 2 ; case 4
_022594FA:
	ldr r0, _022595C4 ; =ov49_02269658
	mov r1, #4
	bl ov49_02259294
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225950C:
	mov r0, #0xc
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #0xc]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _022595C0
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02259522:
	ldr r0, [r4]
	mov r1, #4
	bl ov42_02228188
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #6
	bl ov42_02228188
	add r7, r0, #0
	ldr r0, _022595C8 ; =ov49_0226965C
	mov r1, #4
	bl ov49_02259294
	strh r0, [r4, #0xe]
	mov r2, #0xe
	ldrsh r2, [r4, r2]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r6, #4
	bl ov49_022592A8
	cmp r0, #1
	bne _0225957A
	mov r0, #0xe
	ldrsh r3, [r4, r0]
	cmp r7, r3
	bne _0225956A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov49_02258E7C
	mov r0, #4
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225956A:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov49_02258E7C
	mov r0, #3
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225957A:
	mov r3, #0xe
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov49_02258E7C
	mov r0, #4
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225958E:
	ldr r0, [r4]
	mov r1, #5
	bl ov42_02228188
	cmp r0, #0
	bne _022595C0
	mov r3, #0xe
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov49_02258E7C
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022595B0:
	ldr r0, [r4]
	mov r1, #5
	bl ov42_02228188
	cmp r0, #0
	bne _022595C0
	mov r0, #0
	strh r0, [r4, #8]
_022595C0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022595C4: .word ov49_02269658
_022595C8: .word ov49_0226965C
	thumb_func_end ov49_022594D8

	thumb_func_start ov49_022595CC
ov49_022595CC: ; 0x022595CC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrh r0, [r4, #8]
	cmp r0, #3
	bhi _02259672
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022595E4: ; jump table
	.short _022595EC - _022595E4 - 2 ; case 0
	.short _02259616 - _022595E4 - 2 ; case 1
	.short _02259632 - _022595E4 - 2 ; case 2
	.short _02259672 - _022595E4 - 2 ; case 3
_022595EC:
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov45_0223089C
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov45_0223093C
	add r0, r4, #0
	mov r2, #0x7d
	add r0, #0xc
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #0x18
	bl ov49_02259320
	mov r0, #0x20
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
_02259616:
	ldr r0, [r4, #0x1c]
	sub r0, r0, #1
	str r0, [r4, #0x1c]
	bne _02259672
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, _02259678 ; =0x0000064E
	bl PlaySE
	add sp, #0xc
	pop {r4, r5, pc}
_02259632:
	add r0, r4, #0
	ldr r1, [r4, #0x1c]
	add r0, #0xc
	bl ov49_0225932C
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, sp, #0
	add r0, r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	bl ov45_02230908
	add r0, r4, #0
	add r0, #0xc
	bl ov49_022593BC
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl ov45_022308E4
	cmp r5, #1
	bne _02259672
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, [r4, #4]
	bl ov45_02230968
	mov r0, #1
	strb r0, [r4, #0xa]
_02259672:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02259678: .word 0x0000064E
	thumb_func_end ov49_022595CC

	thumb_func_start ov49_0225967C
ov49_0225967C: ; 0x0225967C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrh r0, [r4, #8]
	cmp r0, #3
	bhi _0225972A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02259694: ; jump table
	.short _0225969C - _02259694 - 2 ; case 0
	.short _022596CC - _02259694 - 2 ; case 1
	.short _0225970A - _02259694 - 2 ; case 2
	.short _0225972A - _02259694 - 2 ; case 3
_0225969C:
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov45_0223089C
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov45_0223093C
	add r0, r4, #0
	mov r1, #0x7d
	add r0, #0xc
	lsl r1, r1, #0xe
	mov r2, #0
	mov r3, #0x18
	bl ov49_02259320
	mov r0, #0
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, _02259730 ; =0x0000064E
	bl PlaySE
_022596CC:
	add r0, r4, #0
	ldr r1, [r4, #0x1c]
	add r0, #0xc
	bl ov49_0225932C
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, sp, #0
	add r0, r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	bl ov45_02230908
	add r0, r4, #0
	add r0, #0xc
	bl ov49_022593BC
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl ov45_022308E4
	cmp r5, #1
	bne _0225972A
	mov r0, #0x20
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4, #8]
	pop {r4, r5, pc}
_0225970A:
	ldr r0, [r4, #0x1c]
	sub r0, r0, #1
	str r0, [r4, #0x1c]
	bne _0225972A
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, [r4, #4]
	bl ov45_02230968
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov45_0223089C
	mov r0, #1
	strb r0, [r4, #0xa]
_0225972A:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02259730: .word 0x0000064E
	thumb_func_end ov49_0225967C

	thumb_func_start ov49_02259734
ov49_02259734: ; 0x02259734
	ldr r3, _0225973C ; =ov49_02259764
	mov r2, #2
	bx r3
	nop
_0225973C: .word ov49_02259764
	thumb_func_end ov49_02259734

	thumb_func_start ov49_02259740
ov49_02259740: ; 0x02259740
	ldr r3, _02259748 ; =ov49_02259764
	mov r2, #3
	bx r3
	nop
_02259748: .word ov49_02259764
	thumb_func_end ov49_02259740

	thumb_func_start ov49_0225974C
ov49_0225974C: ; 0x0225974C
	ldr r3, _02259754 ; =ov49_02259764
	mov r2, #0
	bx r3
	nop
_02259754: .word ov49_02259764
	thumb_func_end ov49_0225974C

	thumb_func_start ov49_02259758
ov49_02259758: ; 0x02259758
	ldr r3, _02259760 ; =ov49_02259764
	mov r2, #1
	bx r3
	nop
_02259760: .word ov49_02259764
	thumb_func_end ov49_02259758

	thumb_func_start ov49_02259764
ov49_02259764: ; 0x02259764
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r4, r0, #0
	ldrh r0, [r4, #8]
	add r5, r2, #0
	cmp r0, #3
	bls _02259774
	b _02259916
_02259774:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02259780: ; jump table
	.short _02259788 - _02259780 - 2 ; case 0
	.short _022597E4 - _02259780 - 2 ; case 1
	.short _0225989E - _02259780 - 2 ; case 2
	.short _02259916 - _02259780 - 2 ; case 3
_02259788:
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov45_0223089C
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov45_0223093C
	ldr r0, [r4, #4]
	mov r1, #2
	bl ov45_02230974
	add r0, r4, #0
	mov r2, #1
	add r0, #0xc
	mov r1, #0
	lsl r2, r2, #0x10
	mov r3, #4
	bl ov49_02259320
	ldr r0, [r4, #4]
	add r1, sp, #0x1c
	bl ov45_02230908
	cmp r5, #3
	bhi _022597DA
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022597C8: ; jump table
	.short _022597D0 - _022597C8 - 2 ; case 0
	.short _022597D0 - _022597C8 - 2 ; case 1
	.short _022597D6 - _022597C8 - 2 ; case 2
	.short _022597D6 - _022597C8 - 2 ; case 3
_022597D0:
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x20]
	b _022597DA
_022597D6:
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x20]
_022597DA:
	mov r0, #0
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
_022597E4:
	add r0, r4, #0
	ldr r1, [r4, #0x1c]
	add r0, #0xc
	bl ov49_0225932C
	add r6, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, sp, #0x10
	add r0, r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	bl ov45_02230908
	cmp r5, #3
	bhi _02259854
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225980E: ; jump table
	.short _02259816 - _0225980E - 2 ; case 0
	.short _02259826 - _0225980E - 2 ; case 1
	.short _02259836 - _0225980E - 2 ; case 2
	.short _02259846 - _0225980E - 2 ; case 3
_02259816:
	add r0, r4, #0
	add r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	sub r0, r1, r0
	str r0, [sp, #0x18]
	b _02259854
_02259826:
	add r0, r4, #0
	add r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	add r0, r1, r0
	str r0, [sp, #0x18]
	b _02259854
_02259836:
	add r0, r4, #0
	add r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	sub r0, r1, r0
	str r0, [sp, #0x10]
	b _02259854
_02259846:
	add r0, r4, #0
	add r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	add r0, r1, r0
	str r0, [sp, #0x10]
_02259854:
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	bl ov45_022308E4
	cmp r6, #1
	bne _02259916
	add r0, r5, #0
	bl ov42_022282A4
	mov r1, #4
	str r1, [r4, #0x1c]
	cmp r0, #3
	bhi _02259894
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225987A: ; jump table
	.short _02259888 - _0225987A - 2 ; case 0
	.short _02259894 - _0225987A - 2 ; case 1
	.short _0225988E - _0225987A - 2 ; case 2
	.short _02259882 - _0225987A - 2 ; case 3
_02259882:
	ldr r0, [r4, #0x1c]
	add r0, r0, #2
	str r0, [r4, #0x1c]
_02259888:
	ldr r0, [r4, #0x1c]
	add r0, r0, #2
	str r0, [r4, #0x1c]
_0225988E:
	ldr r0, [r4, #0x1c]
	add r0, r0, #2
	str r0, [r4, #0x1c]
_02259894:
	ldrh r0, [r4, #8]
	add sp, #0x28
	add r0, r0, #1
	strh r0, [r4, #8]
	pop {r4, r5, r6, pc}
_0225989E:
	ldr r0, [r4, #0x1c]
	sub r0, r0, #1
	str r0, [r4, #0x1c]
	bne _02259916
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, [r4]
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	add r1, r5, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #8]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0xa]
	add r0, r5, #0
	bl ov42_022282A4
	add r1, sp, #0
	mov r5, sp
	add r2, r0, #0
	ldrh r3, [r1, #8]
	sub r5, r5, #4
	add r0, r4, #0
	strh r3, [r5]
	ldrh r1, [r1, #0xa]
	strh r1, [r5, #2]
	ldr r1, [r5]
	bl ov49_02258E04
	ldr r0, [r4, #4]
	bl ov45_02230968
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov45_0223089C
	mov r0, #1
	strb r0, [r4, #0xa]
_02259916:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_02259764

	thumb_func_start ov49_0225991C
ov49_0225991C: ; 0x0225991C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _02259930
	cmp r0, #1
	beq _02259950
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02259930:
	ldr r0, [r5, #4]
	mov r1, #0
	bl ov45_0223089C
	add r1, r5, #0
	ldr r0, [r5, #4]
	add r1, #0x10
	bl ov45_02230908
	mov r0, #0x1c
	str r0, [r5, #0xc]
	ldrh r0, [r5, #8]
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r5, #8]
	pop {r3, r4, r5, r6, pc}
_02259950:
	ldr r0, [r5, #0xc]
	sub r0, r0, #1
	str r0, [r5, #0xc]
	bpl _0225995C
	mov r0, #0x1c
	str r0, [r5, #0xc]
_0225995C:
	add r3, r5, #0
	add r3, #0x10
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0xc]
	sub r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	cmp r0, #0
	ble _022599DE
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x10
	asr r1, r0, #0x10
	mov r0, #0xb4
	mul r0, r1
	mov r1, #6
	bl _s32_div_f
	add r4, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	ldr r2, _022599F4 ; =0xFFFFE000
	asr r1, r0, #0x1f
	asr r3, r2, #0xd
	bl _ll_mul
	mov r3, #2
	mov r6, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [sp, #8]
	orr r1, r0
	add r0, r2, r1
	str r0, [sp, #8]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	mov r2, #0xa
	asr r1, r0, #0x1f
	lsl r2, r2, #0xc
	add r3, r6, #0
	bl _ll_mul
	mov r3, #2
	add r4, r6, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [sp, #4]
	orr r1, r0
	add r0, r2, r1
	str r0, [sp, #4]
_022599DE:
	ldr r0, [r5, #4]
	add r1, sp, #0
	bl ov45_022308E4
	ldr r0, [r5, #4]
	mov r1, #1
	bl ov45_02230920
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_022599F4: .word 0xFFFFE000
	thumb_func_end ov49_0225991C

	thumb_func_start ov49_022599F8
ov49_022599F8: ; 0x022599F8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov45_0223089C
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl ov45_02230908
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl ov45_022308E4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_022599F8

	thumb_func_start ov49_02259A20
ov49_02259A20: ; 0x02259A20
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	mov r3, #0
	strb r3, [r0, #3]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strb r3, [r0]
	add r0, r1, #0
	ldr r3, _02259A38 ; =ov45_02230700
	add r1, r2, #0
	bx r3
	nop
_02259A38: .word ov45_02230700
	thumb_func_end ov49_02259A20

	thumb_func_start ov49_02259A3C
ov49_02259A3C: ; 0x02259A3C
	mov r2, #1
	strb r2, [r0]
	ldrb r2, [r0, #1]
	strb r2, [r0, #2]
	ldrb r2, [r0, #1]
	sub r1, r1, r2
	strb r1, [r0, #3]
	mov r1, #0
	strh r1, [r0, #4]
	mov r1, #0x3c
	strh r1, [r0, #6]
	bx lr
	thumb_func_end ov49_02259A3C

	thumb_func_start ov49_02259A54
ov49_02259A54: ; 0x02259A54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	bne _02259A64
	mov r0, #1
	pop {r3, r4, r5, pc}
_02259A64:
	mov r0, #4
	ldrsh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, #4]
	ldrsh r1, [r5, r0]
	mov r0, #6
	ldrsh r0, [r5, r0]
	cmp r1, r0
	blt _02259A7A
	mov r0, #0
	strb r0, [r5]
_02259A7A:
	mov r0, #4
	ldrsh r1, [r5, r0]
	mov r0, #3
	ldrsb r0, [r5, r0]
	mul r0, r1
	mov r1, #6
	ldrsh r1, [r5, r1]
	bl _s32_div_f
	strb r0, [r5, #1]
	mov r0, #2
	ldrb r1, [r5, #1]
	ldrsb r0, [r5, r0]
	add r0, r1, r0
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r4, #0
	bl ov45_02230700
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02259A54

	thumb_func_start ov49_02259AA4
ov49_02259AA4: ; 0x02259AA4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #0x3a
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x77
	lsl r2, r2, #0xc
	bl CreateHeap
	mov r2, #0x3d
	mov r0, #3
	mov r1, #0x78
	lsl r2, r2, #0xc
	bl CreateHeap
	mov r1, #0xfe
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x77
	bl OverlayManager_CreateAndGetData
	mov r2, #0xfe
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	add r0, #0xc
	str r0, [r4, #0x38]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x34]
	bl ov45_0222A53C
	strb r0, [r4, #2]
	ldr r0, [r4, #0x34]
	bl ov45_0222A53C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02259B02
	bl GF_AssertFail
_02259B02:
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r5]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xfd
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	ldr r1, [r5]
	add r0, #0x3c
	mov r2, #0x77
	bl ov49_0225A5EC
	mov r0, #0x77
	bl ov49_02258958
	mov r1, #0xfa
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r1, #0xc
	ldr r0, [r4, r1]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	mov r0, #0x78
	mov r2, #0xfa
	str r0, [sp]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	mov r0, #0x18
	mov r3, #0x77
	bl ov49_02258AB4
	mov r2, #0x3e
	lsl r2, r2, #4
	str r0, [r4, r2]
	mov r0, #0x78
	str r0, [sp]
	add r2, #8
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r4, r2]
	mov r3, #0x77
	bl ov49_0225DF18
	mov r1, #0xf9
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x77
	bl ov49_0225CB78
	mov r1, #0xfb
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0xf4
	add r0, r4, r1
	add r1, r4, #0
	ldr r2, [r5]
	add r1, #0x3c
	mov r3, #0x77
	bl ov49_0225AAC8
	mov r0, #0xc6
	lsl r0, r0, #2
	add r1, r4, #0
	ldr r2, [r5]
	add r0, r4, r0
	add r1, #0x3c
	mov r3, #0x77
	bl ov49_0225ACA8
	mov r0, #0xce
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x3c
	mov r2, #0x77
	bl ov49_0225AD20
	mov r0, #0x39
	lsl r0, r0, #4
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x3c
	mov r2, #0x77
	bl ov49_0225B214
	mov r0, #0xf1
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x3c
	mov r2, #0x77
	bl ov49_0225B0D4
	mov r0, #0xb7
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x77
	bl ov49_0225B308
	mov r1, #0x3a
	lsl r1, r1, #4
	add r0, r4, r1
	sub r1, #0xc4
	add r1, r4, r1
	mov r2, #0x77
	bl ov49_0225B198
	mov r0, #0x77
	str r0, [sp]
	mov r3, #0xfd
	mov r0, #0x61
	lsl r3, r3, #2
	lsl r0, r0, #2
	add r2, r4, #0
	ldr r1, [r4, #0x38]
	ldr r3, [r4, r3]
	add r0, r4, r0
	add r2, #0x3c
	bl ov49_0225B450
	ldr r0, [r4, #0x34]
	bl ov45_0222A5C0
	add r5, r0, #0
	bl ov45_0222AADC
	cmp r0, #1
	bne _02259C2E
	mov r0, #0x61
	mov r2, #0xb7
	lsl r0, r0, #2
	add r1, r4, #0
	lsl r2, r2, #2
	add r0, r4, r0
	add r1, #0x3c
	add r2, r4, r2
	mov r3, #0x77
	str r5, [sp]
	bl ov49_0225B9AC
_02259C2E:
	add r0, r4, #0
	mov r1, #0x77
	bl ov49_0225EEAC
	mov r1, #0x3f
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov49_0225F1A8
	add r0, r4, #0
	bl ov49_0225F1F0
	mov r0, #0x77
	str r0, [sp]
	mov r0, #0x78
	mov r3, #0xfa
	str r0, [sp, #4]
	lsl r3, r3, #2
	add r2, r3, #4
	ldr r1, [r4, r3]
	sub r3, #8
	ldr r0, [r4, #0x34]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	bl ov49_022652E8
	mov r1, #0xf5
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x77
	add r1, r4, #0
	bl ov49_02268764
	mov r1, #0xf7
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _02259C8C ; =ov49_0225A5C8
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02259C8C: .word ov49_0225A5C8
	thumb_func_end ov49_02259AA4

	thumb_func_start ov49_02259C90
ov49_02259C90: ; 0x02259C90
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r5]
	cmp r0, #8
	bhi _02259D58
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02259CB6: ; jump table
	.short _02259CC8 - _02259CB6 - 2 ; case 0
	.short _02259CEA - _02259CB6 - 2 ; case 1
	.short _02259CFE - _02259CB6 - 2 ; case 2
	.short _02259D7A - _02259CB6 - 2 ; case 3
	.short _02259DF8 - _02259CB6 - 2 ; case 4
	.short _02259E08 - _02259CB6 - 2 ; case 5
	.short _02259E58 - _02259CB6 - 2 ; case 6
	.short _02259E76 - _02259CB6 - 2 ; case 7
	.short _02259ED0 - _02259CB6 - 2 ; case 8
_02259CC8:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x77
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	strb r0, [r4, #3]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259CEA:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02259D58
	mov r0, #0
	strb r0, [r4, #3]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259CFE:
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _02259D26
	bl ov45_0222D844
	cmp r0, #1
	beq _02259D1A
	ldr r0, [r4, #0x34]
	bl ov45_0222A1FC
	cmp r0, #0
	beq _02259D26
_02259D1A:
	ldrb r1, [r4, #4]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r4, #4]
_02259D26:
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _02259D42
	ldr r0, [r4, #0x34]
	bl ov45_0222A33C
	cmp r0, #1
	bne _02259D42
	mov r0, #1
	strb r0, [r4, #6]
	add r0, r4, #0
	mov r1, #8
	bl ov49_0225A038
_02259D42:
	ldrb r0, [r4]
	cmp r0, #1
	beq _02259D5A
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _02259D5A
	ldrb r0, [r4, #6]
	cmp r0, #1
	beq _02259D5A
_02259D58:
	b _02259EE2
_02259D5A:
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	beq _02259D68
	mov r0, #3
	str r0, [r5]
	b _02259EE2
_02259D68:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bne _02259D74
	mov r0, #5
	str r0, [r5]
	b _02259EE2
_02259D74:
	mov r0, #7
	str r0, [r5]
	b _02259EE2
_02259D7A:
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225AC74
	mov r0, #0xce
	lsl r0, r0, #2
	mov r1, #0
	add r0, r4, r0
	add r2, r1, #0
	bl ov49_0225B014
	mov r0, #0xf1
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225B124
	mov r0, #0x3a
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov49_0225B200
	bl sub_020393C8
	cmp r0, #0
	beq _02259DBE
	mov r1, #0x39
	lsl r1, r1, #4
	add r0, r4, r1
	sub r1, #0xb4
	add r1, r4, r1
	bl ov49_0225B284
	b _02259DF2
_02259DBE:
	bl sub_020397FC
	cmp r0, #0
	beq _02259DDC
	bl ov45_0222E7CC
	mov r1, #0x39
	lsl r1, r1, #4
	add r2, r0, #0
	add r0, r4, r1
	sub r1, #0xb4
	add r1, r4, r1
	bl ov49_0225B2C0
	b _02259DF2
_02259DDC:
	ldr r0, [r4, #0x34]
	bl ov45_0222A1FC
	mov r1, #0x39
	lsl r1, r1, #4
	add r2, r0, #0
	add r0, r4, r1
	sub r1, #0xb4
	add r1, r4, r1
	bl ov49_0225B2F0
_02259DF2:
	mov r0, #4
	str r0, [r5]
	b _02259EE2
_02259DF8:
	ldr r0, _02259EF4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02259EE2
	mov r0, #7
	str r0, [r5]
	b _02259EE2
_02259E08:
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225AC74
	mov r0, #0xce
	lsl r0, r0, #2
	mov r1, #0
	add r0, r4, r0
	add r2, r1, #0
	bl ov49_0225B014
	mov r0, #0xf1
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225B124
	mov r0, #0x3a
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov49_0225B200
	mov r0, #0xb7
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	mov r2, #0x46
	bl ov49_0225B388
	add r1, r0, #0
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225AB44
	mov r0, #6
	str r0, [r5]
	mov r0, #0x3c
	str r0, [r4, #8]
	b _02259EE2
_02259E58:
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225AC5C
	cmp r0, #0
	beq _02259EE2
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0
	bgt _02259EE2
	mov r0, #7
	str r0, [r5]
	b _02259EE2
_02259E76:
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225B898
	cmp r0, #5
	bne _02259EA8
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x77
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	strb r0, [r4, #3]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259EA8:
	cmp r0, #0
	bne _02259EE2
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x77
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	strb r0, [r4, #3]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259ED0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02259EE2
	mov r0, #0
	strb r0, [r4, #3]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02259EE2:
	add r0, r4, #0
	bl ov49_0225A98C
	add r0, r4, #0
	bl ov49_0225AA2C
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02259EF4: .word gSystem
	thumb_func_end ov49_02259C90

	thumb_func_start ov49_02259EF8
ov49_02259EF8: ; 0x02259EF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldrb r1, [r4, #1]
	str r1, [r0, #0x18]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02268850
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0226535C
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_0225EEF8
	mov r0, #0x61
	mov r1, #0xc6
	lsl r0, r0, #2
	lsl r1, r1, #2
	add r2, r4, #0
	add r0, r4, r0
	add r1, r4, r1
	add r2, #0x3c
	bl ov49_0225B4E4
	mov r0, #0xb7
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225B35C
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225AB14
	mov r0, #0xc6
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225ACBC
	mov r0, #0xce
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x3c
	bl ov49_0225AE4C
	mov r0, #0x39
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov49_0225B244
	mov r0, #0x3a
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov49_0225B200
	mov r0, #0xf1
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225B0D8
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225CBDC
	mov r0, #0xf9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E2B4
	mov r0, #0x3e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258B20
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02258994
	add r0, r4, #0
	add r0, #0x3c
	bl ov49_0225A7D0
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x77
	bl DestroyHeap
	mov r0, #0x78
	bl DestroyHeap
	mov r0, #0
	bl sub_0200616C
	mov r0, #0
	bl sub_02006300
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_02259EF8

	thumb_func_start ov49_02259FE8
ov49_02259FE8: ; 0x02259FE8
	ldr r0, [r0, #0x34]
	bx lr
	thumb_func_end ov49_02259FE8

	thumb_func_start ov49_02259FEC
ov49_02259FEC: ; 0x02259FEC
	ldr r0, [r0, #0x38]
	bx lr
	thumb_func_end ov49_02259FEC

	thumb_func_start ov49_02259FF0
ov49_02259FF0: ; 0x02259FF0
	mov r1, #0x3e
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_02259FF0

	thumb_func_start ov49_02259FF8
ov49_02259FF8: ; 0x02259FF8
	mov r1, #0xf9
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_02259FF8

	thumb_func_start ov49_0225A000
ov49_0225A000: ; 0x0225A000
	mov r1, #0xfa
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225A000

	thumb_func_start ov49_0225A008
ov49_0225A008: ; 0x0225A008
	mov r1, #0xfb
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225A008

	thumb_func_start ov49_0225A010
ov49_0225A010: ; 0x0225A010
	mov r1, #0x3f
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225A010

	thumb_func_start ov49_0225A018
ov49_0225A018: ; 0x0225A018
	ldrb r3, [r0, #4]
	mov r2, #0xf
	lsl r1, r1, #0x18
	bic r3, r2
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r1, r3
	strb r1, [r0, #4]
	bx lr
	thumb_func_end ov49_0225A018

	thumb_func_start ov49_0225A02C
ov49_0225A02C: ; 0x0225A02C
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end ov49_0225A02C

	thumb_func_start ov49_0225A030
ov49_0225A030: ; 0x0225A030
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end ov49_0225A030

	thumb_func_start ov49_0225A034
ov49_0225A034: ; 0x0225A034
	strb r1, [r0]
	bx lr
	thumb_func_end ov49_0225A034

	thumb_func_start ov49_0225A038
ov49_0225A038: ; 0x0225A038
	strb r1, [r0, #1]
	bx lr
	thumb_func_end ov49_0225A038

	thumb_func_start ov49_0225A03C
ov49_0225A03C: ; 0x0225A03C
	strb r1, [r0, #5]
	bx lr
	thumb_func_end ov49_0225A03C

	thumb_func_start ov49_0225A040
ov49_0225A040: ; 0x0225A040
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end ov49_0225A040

	thumb_func_start ov49_0225A044
ov49_0225A044: ; 0x0225A044
	mov r1, #1
	strb r1, [r0, #7]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225A044

	thumb_func_start ov49_0225A04C
ov49_0225A04C: ; 0x0225A04C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x14
	blo _0225A05C
	bl GF_AssertFail
_0225A05C:
	add r0, r5, r4
	strb r6, [r0, #0xc]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A04C

	thumb_func_start ov49_0225A064
ov49_0225A064: ; 0x0225A064
	add r0, r0, r1
	ldrb r0, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225A064

	thumb_func_start ov49_0225A06C
ov49_0225A06C: ; 0x0225A06C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x14
	blo _0225A07C
	bl GF_AssertFail
_0225A07C:
	add r0, r5, r4
	add r0, #0x20
	strb r6, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225A06C

	thumb_func_start ov49_0225A084
ov49_0225A084: ; 0x0225A084
	add r0, r0, r1
	add r0, #0x20
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov49_0225A084

	thumb_func_start ov49_0225A08C
ov49_0225A08C: ; 0x0225A08C
	mov r2, #0xbe
	lsl r2, r2, #2
	ldr r3, _0225A098 ; =ov49_0225AB44
	add r0, r0, r2
	bx r3
	nop
_0225A098: .word ov49_0225AB44
	thumb_func_end ov49_0225A08C

	thumb_func_start ov49_0225A09C
ov49_0225A09C: ; 0x0225A09C
	mov r2, #0xbe
	lsl r2, r2, #2
	ldr r3, _0225A0A8 ; =ov49_0225ABA4
	add r0, r0, r2
	bx r3
	nop
_0225A0A8: .word ov49_0225ABA4
	thumb_func_end ov49_0225A09C

	thumb_func_start ov49_0225A0AC
ov49_0225A0AC: ; 0x0225A0AC
	mov r1, #0xbe
	lsl r1, r1, #2
	ldr r3, _0225A0B8 ; =ov49_0225AC5C
	add r0, r0, r1
	bx r3
	nop
_0225A0B8: .word ov49_0225AC5C
	thumb_func_end ov49_0225A0AC

	thumb_func_start ov49_0225A0BC
ov49_0225A0BC: ; 0x0225A0BC
	mov r1, #0xbe
	lsl r1, r1, #2
	ldr r3, _0225A0C8 ; =ov49_0225AC08
	add r0, r0, r1
	bx r3
	nop
_0225A0C8: .word ov49_0225AC08
	thumb_func_end ov49_0225A0BC

	thumb_func_start ov49_0225A0CC
ov49_0225A0CC: ; 0x0225A0CC
	mov r1, #0xbe
	lsl r1, r1, #2
	ldr r3, _0225A0D8 ; =ov49_0225AC24
	add r0, r0, r1
	bx r3
	nop
_0225A0D8: .word ov49_0225AC24
	thumb_func_end ov49_0225A0CC

	thumb_func_start ov49_0225A0DC
ov49_0225A0DC: ; 0x0225A0DC
	mov r1, #0xbe
	lsl r1, r1, #2
	ldr r3, _0225A0E8 ; =ov49_0225AC4C
	add r0, r0, r1
	bx r3
	nop
_0225A0E8: .word ov49_0225AC4C
	thumb_func_end ov49_0225A0DC

	thumb_func_start ov49_0225A0EC
ov49_0225A0EC: ; 0x0225A0EC
	mov r1, #0xbe
	lsl r1, r1, #2
	ldr r3, _0225A0F8 ; =ov49_0225AC74
	add r0, r0, r1
	bx r3
	nop
_0225A0F8: .word ov49_0225AC74
	thumb_func_end ov49_0225A0EC

	thumb_func_start ov49_0225A0FC
ov49_0225A0FC: ; 0x0225A0FC
	mov r2, #0xc6
	lsl r2, r2, #2
	ldr r3, _0225A108 ; =ov49_0225ACC4
	add r0, r0, r2
	bx r3
	nop
_0225A108: .word ov49_0225ACC4
	thumb_func_end ov49_0225A0FC

	thumb_func_start ov49_0225A10C
ov49_0225A10C: ; 0x0225A10C
	push {r3, lr}
	mov r2, #0xce
	lsl r2, r2, #2
	add r0, r0, r2
	mov r2, #0x78
	mov r3, #0
	bl ov49_0225AEA8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A10C

	thumb_func_start ov49_0225A120
ov49_0225A120: ; 0x0225A120
	push {r3, lr}
	add r3, r2, #0
	mov r2, #0xce
	lsl r2, r2, #2
	add r0, r0, r2
	mov r2, #0x78
	bl ov49_0225AEA8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A120

	thumb_func_start ov49_0225A134
ov49_0225A134: ; 0x0225A134
	mov r1, #0xce
	lsl r1, r1, #2
	ldr r3, _0225A140 ; =ov49_0225AEE0
	add r0, r0, r1
	bx r3
	nop
_0225A140: .word ov49_0225AEE0
	thumb_func_end ov49_0225A134

	thumb_func_start ov49_0225A144
ov49_0225A144: ; 0x0225A144
	mov r3, #0xce
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0225A150 ; =ov49_0225AEF8
	bx r3
	nop
_0225A150: .word ov49_0225AEF8
	thumb_func_end ov49_0225A144

	thumb_func_start ov49_0225A154
ov49_0225A154: ; 0x0225A154
	mov r1, #0xce
	lsl r1, r1, #2
	ldr r3, _0225A160 ; =ov49_0225AF04
	add r0, r0, r1
	bx r3
	nop
_0225A160: .word ov49_0225AF04
	thumb_func_end ov49_0225A154

	thumb_func_start ov49_0225A164
ov49_0225A164: ; 0x0225A164
	mov r2, #0xce
	lsl r2, r2, #2
	ldr r3, _0225A170 ; =ov49_0225AF08
	add r0, r0, r2
	bx r3
	nop
_0225A170: .word ov49_0225AF08
	thumb_func_end ov49_0225A164

	thumb_func_start ov49_0225A174
ov49_0225A174: ; 0x0225A174
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r3, [sp]
	mov r0, #0x77
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	mov r0, #0xce
	lsl r0, r0, #2
	add r4, r2, #0
	add r0, r5, r0
	add r5, #0x3c
	add r2, r5, #0
	add r3, r4, #0
	bl ov49_0225AF30
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A174

	thumb_func_start ov49_0225A1A4
ov49_0225A1A4: ; 0x0225A1A4
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r3, [sp]
	mov r0, #0x77
	str r0, [sp, #4]
	add r4, r2, #0
	add r0, sp, #0x10
	ldrb r2, [r0, #0x10]
	add r3, r4, #0
	str r2, [sp, #8]
	ldrb r2, [r0, #0x14]
	str r2, [sp, #0xc]
	ldrb r0, [r0, #0x18]
	str r0, [sp, #0x10]
	mov r0, #0xce
	lsl r0, r0, #2
	add r0, r5, r0
	add r5, #0x3c
	add r2, r5, #0
	bl ov49_0225AF30
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov49_0225A1A4

	thumb_func_start ov49_0225A1D4
ov49_0225A1D4: ; 0x0225A1D4
	mov r1, #0xce
	lsl r1, r1, #2
	ldr r3, _0225A1E0 ; =ov49_0225AFD8
	add r0, r0, r1
	bx r3
	nop
_0225A1E0: .word ov49_0225AFD8
	thumb_func_end ov49_0225A1D4

	thumb_func_start ov49_0225A1E4
ov49_0225A1E4: ; 0x0225A1E4
	mov r3, #0xce
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0225A1F0 ; =ov49_0225B014
	bx r3
	nop
_0225A1F0: .word ov49_0225B014
	thumb_func_end ov49_0225A1E4

	thumb_func_start ov49_0225A1F4
ov49_0225A1F4: ; 0x0225A1F4
	mov r2, #0xce
	lsl r2, r2, #2
	ldr r3, _0225A200 ; =ov49_0225B06C
	add r0, r0, r2
	bx r3
	nop
_0225A200: .word ov49_0225B06C
	thumb_func_end ov49_0225A1F4

	thumb_func_start ov49_0225A204
ov49_0225A204: ; 0x0225A204
	push {r4, r5, lr}
	sub sp, #0xc
	str r2, [sp]
	add r5, r0, #0
	str r3, [sp, #4]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r4, r1, #0
	mov r2, #0x77
	str r0, [sp, #8]
	mov r0, #0xf1
	lsl r0, r0, #2
	add r0, r5, r0
	add r5, #0x3c
	add r1, r5, #0
	add r3, r4, #0
	bl ov49_0225B0E0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov49_0225A204

	thumb_func_start ov49_0225A22C
ov49_0225A22C: ; 0x0225A22C
	mov r1, #0xf1
	lsl r1, r1, #2
	ldr r3, _0225A238 ; =ov49_0225B124
	add r0, r0, r1
	bx r3
	nop
_0225A238: .word ov49_0225B124
	thumb_func_end ov49_0225A22C

	thumb_func_start ov49_0225A23C
ov49_0225A23C: ; 0x0225A23C
	push {r4, lr}
	mov r4, #0xf1
	lsl r4, r4, #2
	add r0, r0, r4
	bl ov49_0225B148
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A23C

	thumb_func_start ov49_0225A24C
ov49_0225A24C: ; 0x0225A24C
	push {r3, r4, lr}
	sub sp, #4
	add r4, sp, #0
	ldrh r4, [r4, #0x10]
	str r4, [sp]
	mov r4, #0xf1
	lsl r4, r4, #2
	add r0, r0, r4
	bl ov49_0225B178
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225A24C

	thumb_func_start ov49_0225A264
ov49_0225A264: ; 0x0225A264
	push {lr}
	sub sp, #0x14
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	mov r0, #0x77
	str r0, [sp, #4]
	mov r0, #0x19
	str r0, [sp, #8]
	mov r0, #0xd
	mov r1, #0xce
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r1, r1, #2
	str r0, [sp, #0x10]
	add r0, r2, r1
	add r1, #0x6c
	add r1, r2, r1
	add r2, #0x3c
	bl ov49_0225AF30
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end ov49_0225A264

	thumb_func_start ov49_0225A294
ov49_0225A294: ; 0x0225A294
	push {lr}
	sub sp, #0x14
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x77
	str r0, [sp, #4]
	mov r0, #0x19
	str r0, [sp, #8]
	mov r0, #0xd
	mov r1, #0xce
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r1, r1, #2
	str r0, [sp, #0x10]
	add r0, r2, r1
	add r1, #0x6c
	add r1, r2, r1
	add r2, #0x3c
	mov r3, #0
	bl ov49_0225AF30
	add sp, #0x14
	pop {pc}
	thumb_func_end ov49_0225A294

	thumb_func_start ov49_0225A2C4
ov49_0225A2C4: ; 0x0225A2C4
	push {r3, lr}
	mov r1, #0xce
	lsl r1, r1, #2
	add r0, r0, r1
	bl ov49_0225AFD8
	cmp r0, #0
	beq _0225A2EA
	cmp r0, #1
	beq _0225A2E6
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _0225A2EE
	ldr r0, _0225A2F4 ; =0x000005DC
	bl PlaySE
_0225A2E6:
	mov r0, #1
	pop {r3, pc}
_0225A2EA:
	mov r0, #0
	pop {r3, pc}
_0225A2EE:
	mov r0, #2
	pop {r3, pc}
	nop
_0225A2F4: .word 0x000005DC
	thumb_func_end ov49_0225A2C4

	thumb_func_start ov49_0225A2F8
ov49_0225A2F8: ; 0x0225A2F8
	mov r1, #0xce
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	ldr r3, _0225A308 ; =ov49_0225B014
	add r2, r1, #0
	bx r3
	nop
_0225A308: .word ov49_0225B014
	thumb_func_end ov49_0225A2F8

	thumb_func_start ov49_0225A30C
ov49_0225A30C: ; 0x0225A30C
	mov r3, #0xb7
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0225A318 ; =ov49_0225B388
	bx r3
	nop
_0225A318: .word ov49_0225B388
	thumb_func_end ov49_0225A30C

	thumb_func_start ov49_0225A31C
ov49_0225A31C: ; 0x0225A31C
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	mov r4, #0xb7
	lsl r4, r4, #2
	add r0, r0, r4
	bl ov49_0225B3A8
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A31C

	thumb_func_start ov49_0225A334
ov49_0225A334: ; 0x0225A334
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x77
	add r4, r1, #0
	add r7, r2, #0
	bl PlayerProfile_new
	add r6, r0, #0
	ldr r0, [r5, #0x34]
	bl ov45_0222A53C
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bne _0225A356
	bl ov45_0222A5C0
	b _0225A35C
_0225A356:
	add r1, r4, #0
	bl ov45_0222A578
_0225A35C:
	add r1, r6, #0
	mov r2, #0x77
	bl ov45_0222A844
	mov r0, #0xb7
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r6, #0
	add r2, r7, #0
	bl ov49_0225B3C8
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A334

	thumb_func_start ov49_0225A37C
ov49_0225A37C: ; 0x0225A37C
	mov r3, #0xb7
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0225A388 ; =ov49_0225B3D8
	bx r3
	nop
_0225A388: .word ov49_0225B3D8
	thumb_func_end ov49_0225A37C

	thumb_func_start ov49_0225A38C
ov49_0225A38C: ; 0x0225A38C
	mov r3, #0xb7
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0225A398 ; =ov49_0225B3E8
	bx r3
	nop
_0225A398: .word ov49_0225B3E8
	thumb_func_end ov49_0225A38C

	thumb_func_start ov49_0225A39C
ov49_0225A39C: ; 0x0225A39C
	mov r3, #0xb7
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0225A3A8 ; =ov49_0225B3F8
	bx r3
	nop
_0225A3A8: .word ov49_0225B3F8
	thumb_func_end ov49_0225A39C

	thumb_func_start ov49_0225A3AC
ov49_0225A3AC: ; 0x0225A3AC
	mov r3, #0xb7
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3B8 ; =BufferJPGreeting
	bx r3
	nop
_0225A3B8: .word BufferJPGreeting
	thumb_func_end ov49_0225A3AC

	thumb_func_start ov49_0225A3BC
ov49_0225A3BC: ; 0x0225A3BC
	mov r3, #0xb7
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3C8 ; =BufferENGreeting
	bx r3
	nop
_0225A3C8: .word BufferENGreeting
	thumb_func_end ov49_0225A3BC

	thumb_func_start ov49_0225A3CC
ov49_0225A3CC: ; 0x0225A3CC
	mov r3, #0xb7
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3D8 ; =BufferFRGreeting
	bx r3
	nop
_0225A3D8: .word BufferFRGreeting
	thumb_func_end ov49_0225A3CC

	thumb_func_start ov49_0225A3DC
ov49_0225A3DC: ; 0x0225A3DC
	mov r3, #0xb7
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3E8 ; =BufferITGreeting
	bx r3
	nop
_0225A3E8: .word BufferITGreeting
	thumb_func_end ov49_0225A3DC

	thumb_func_start ov49_0225A3EC
ov49_0225A3EC: ; 0x0225A3EC
	mov r3, #0xb7
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3F8 ; =BufferDEGreeting
	bx r3
	nop
_0225A3F8: .word BufferDEGreeting
	thumb_func_end ov49_0225A3EC

	thumb_func_start ov49_0225A3FC
ov49_0225A3FC: ; 0x0225A3FC
	mov r3, #0xb7
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A408 ; =BufferSPGreeting
	bx r3
	nop
_0225A408: .word BufferSPGreeting
	thumb_func_end ov49_0225A3FC

	thumb_func_start ov49_0225A40C
ov49_0225A40C: ; 0x0225A40C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl ov45_0222D7C0
	add r2, r0, #0
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl BufferTypeName
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225A40C

	thumb_func_start ov49_0225A428
ov49_0225A428: ; 0x0225A428
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	add r4, r1, #0
	add r6, r2, #0
	bl ov49_0225B8F8
	cmp r4, r0
	bne _0225A468
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov49_0225B8FC
	cmp r0, #1
	bne _0225A468
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov49_0225B934
	cmp r0, #0
	bne _0225A468
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov49_0225B928
	cmp r6, r0
	beq _0225A476
_0225A468:
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	add r2, r6, #0
	bl ov49_0225B89C
_0225A476:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225A428

	thumb_func_start ov49_0225A478
ov49_0225A478: ; 0x0225A478
	push {r3, lr}
	add r3, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r3, r0
	add r3, #0x3c
	add r2, r1, #0
	add r1, r3, #0
	mov r3, #0x77
	bl ov49_0225B8A8
	pop {r3, pc}
	thumb_func_end ov49_0225A478

	thumb_func_start ov49_0225A490
ov49_0225A490: ; 0x0225A490
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225B8FC
	cmp r0, #0
	beq _0225A4CC
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225B8F8
	add r1, r0, #0
	ldr r0, [r4, #0x34]
	bl ov45_0222A578
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [sp]
	add r0, r4, r1
	add r1, #8
	add r1, r4, r1
	add r4, #0x3c
	add r2, r4, #0
	mov r3, #0x77
	bl ov49_0225BEA0
_0225A4CC:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225A490

	thumb_func_start ov49_0225A4D0
ov49_0225A4D0: ; 0x0225A4D0
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r3, _0225A4DC ; =ov49_0225B8E0
	add r0, r0, r1
	bx r3
	nop
_0225A4DC: .word ov49_0225B8E0
	thumb_func_end ov49_0225A4D0

	thumb_func_start ov49_0225A4E0
ov49_0225A4E0: ; 0x0225A4E0
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r3, _0225A4EC ; =ov49_0225B8F8
	add r0, r0, r1
	bx r3
	nop
_0225A4EC: .word ov49_0225B8F8
	thumb_func_end ov49_0225A4E0

	thumb_func_start ov49_0225A4F0
ov49_0225A4F0: ; 0x0225A4F0
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r3, _0225A4FC ; =ov49_0225B8FC
	add r0, r0, r1
	bx r3
	nop
_0225A4FC: .word ov49_0225B8FC
	thumb_func_end ov49_0225A4F0

	thumb_func_start ov49_0225A500
ov49_0225A500: ; 0x0225A500
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r3, _0225A50C ; =ov49_0225B914
	add r0, r0, r1
	bx r3
	nop
_0225A50C: .word ov49_0225B914
	thumb_func_end ov49_0225A500

	thumb_func_start ov49_0225A510
ov49_0225A510: ; 0x0225A510
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r3, _0225A51C ; =ov49_0225B8EC
	add r0, r0, r1
	bx r3
	nop
_0225A51C: .word ov49_0225B8EC
	thumb_func_end ov49_0225A510

	thumb_func_start ov49_0225A520
ov49_0225A520: ; 0x0225A520
	mov r2, #0xf7
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	ldr r3, _0225A52C ; =ov49_02268968
	mov r2, #1
	bx r3
	.balign 4, 0
_0225A52C: .word ov49_02268968
	thumb_func_end ov49_0225A520

	thumb_func_start ov49_0225A530
ov49_0225A530: ; 0x0225A530
	ldr r1, _0225A538 ; =0x0000018A
	mov r2, #1
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_0225A538: .word 0x0000018A
	thumb_func_end ov49_0225A530

	thumb_func_start ov49_0225A53C
ov49_0225A53C: ; 0x0225A53C
	mov r2, #0x61
	lsl r2, r2, #2
	ldr r3, _0225A548 ; =ov49_0225BA34
	add r0, r0, r2
	bx r3
	nop
_0225A548: .word ov49_0225BA34
	thumb_func_end ov49_0225A53C

	thumb_func_start ov49_0225A54C
ov49_0225A54C: ; 0x0225A54C
	mov r1, #0xa6
	lsl r1, r1, #2
	ldr r3, _0225A558 ; =ov49_0225CB68
	add r0, r0, r1
	bx r3
	nop
_0225A558: .word ov49_0225CB68
	thumb_func_end ov49_0225A54C

	thumb_func_start ov49_0225A55C
ov49_0225A55C: ; 0x0225A55C
	mov r1, #0xf6
	lsl r1, r1, #2
	ldr r3, [r0, r1]
	mov r2, #0
	str r2, [r0, r1]
	add r0, r3, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225A55C

	thumb_func_start ov49_0225A56C
ov49_0225A56C: ; 0x0225A56C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0225A57A
	bl GF_AssertFail
_0225A57A:
	ldr r0, [r5, #0x34]
	add r1, r4, #0
	bl ov45_0222A578
	bl ov45_0222AAC8
	add r6, r0, #0
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r2, r6, #0
	bl ov49_022653C0
	ldr r0, [r5, #0x34]
	bl ov45_0222A53C
	cmp r4, r0
	bne _0225A5A8
	ldr r0, [r5, #0x34]
	add r1, r6, #0
	bl ov45_0222AD70
_0225A5A8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A56C

	thumb_func_start ov49_0225A5AC
ov49_0225A5AC: ; 0x0225A5AC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0225A5BA
	bl GF_AssertFail
_0225A5BA:
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ov49_022653F0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225A5AC

	thumb_func_start ov49_0225A5C8
ov49_0225A5C8: ; 0x0225A5C8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xf9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E3AC
	mov r0, #0x3e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258BE0
	add r4, #0x3c
	add r0, r4, #0
	bl ov49_0225A840
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A5C8

	thumb_func_start ov49_0225A5EC
ov49_0225A5EC: ; 0x0225A5EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x14]
	ldr r0, _0225A798 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0225A79C ; =0x04001050
	add r6, r2, #0
	strh r1, [r0]
	mov r0, #0x20
	add r1, r6, #0
	bl GF_CreateVramTransferManager
	ldr r0, _0225A7A0 ; =ov49_022697CC
	bl GX_SetBanks
	ldr r0, _0225A7A4 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	ldr r0, _0225A7A8 ; =ov49_02269724
	bl SetBothScreensModesAndDisable
	add r0, r6, #0
	bl BgConfig_Alloc
	str r0, [r5]
	mov r0, #0
	ldr r7, _0225A7AC ; =ov49_0226981C
	ldr r4, _0225A7B0 ; =ov49_02269734
	str r0, [sp, #0x18]
_0225A636:
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r7, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4]
	mov r1, #0x20
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, #0
	add r3, r6, #0
	bl BG_ClearCharDataRange
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [sp, #0x18]
	add r7, #0x1c
	add r0, r0, #1
	add r4, r4, #4
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _0225A636
	ldr r0, [sp, #0x14]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	mov r0, #0
	mov r1, #0xa0
	add r2, r6, #0
	bl LoadFontPal0
	mov r0, #0
	mov r1, #0x80
	add r2, r6, #0
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0x55
	mov r3, #3
	bl LoadUserFrameGfx1
	mov r1, #1
	str r4, [sp]
	str r6, [sp, #4]
	ldr r0, [r5]
	add r2, r1, #0
	add r3, r1, #0
	bl LoadUserFrameGfx2
	mov r0, #3
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0x1f
	mov r3, #2
	bl sub_0200EC0C
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xd1
	mov r1, #0x5a
	mov r2, #0
	mov r3, #0x40
	str r6, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x1f
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r6, [sp, #0x10]
	bl OamManager_Create
	ldr r0, _0225A7B4 ; =ov49_02269744
	ldr r2, _0225A7B8 ; =0x00100010
	mov r1, #0x10
	bl sub_020215C0
	mov r0, #0x18
	add r1, r6, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	bl sub_0203A880
	add r1, r5, #0
	mov r0, #0x18
	add r1, #8
	add r2, r6, #0
	bl G2dRenderer_Init
	str r0, [r5, #4]
	add r0, r5, #0
	mov r2, #1
	add r0, #8
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0
	add r4, r5, #0
_0225A742:
	mov r0, #0x18
	add r1, r7, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, #4
	blt _0225A742
	mov r0, #0x18
	add r1, r6, #0
	bl sub_02020654
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	str r0, [sp]
	ldr r0, _0225A7BC ; =ov49_0225A854
	mov r1, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #2
	add r3, r1, #0
	bl GF_3DVramMan_Create
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225A798: .word 0x04000050
_0225A79C: .word 0x04001050
_0225A7A0: .word ov49_022697CC
_0225A7A4: .word gSystem + 0x60
_0225A7A8: .word ov49_02269724
_0225A7AC: .word ov49_0226981C
_0225A7B0: .word ov49_02269734
_0225A7B4: .word ov49_02269744
_0225A7B8: .word 0x00100010
_0225A7BC: .word ov49_0225A854
	thumb_func_end ov49_0225A5EC

	thumb_func_start ov49_0225A7C0
ov49_0225A7C0: ; 0x0225A7C0
	push {r3, lr}
	ldr r0, [r0, #4]
	bl sub_0202457C
	bl sub_02020674
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A7C0

	thumb_func_start ov49_0225A7D0
ov49_0225A7D0: ; 0x0225A7D0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl GF_DestroyVramTransferManager
	ldr r5, _0225A83C ; =ov49_02269734
	mov r4, #0
_0225A7DC:
	ldr r1, [r5]
	ldr r0, [r6]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225A7DC
	ldr r0, [r6]
	bl FreeToHeap
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl sub_0202067C
	mov r0, #5
	lsl r0, r0, #6
	mov r4, #0
	add r7, r0, #0
	str r4, [r6, r0]
	add r5, r6, #0
	sub r7, #0x10
_0225A80E:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225A80E
	ldr r0, [r6, #4]
	bl sub_02024504
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl GF_3DVramMan_Delete
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225A83C: .word ov49_02269734
	thumb_func_end ov49_0225A7D0

	thumb_func_start ov49_0225A840
ov49_0225A840: ; 0x0225A840
	push {r3, lr}
	ldr r0, [r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	bl GF_RunVramTransferTasks
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A840

	thumb_func_start ov49_0225A854
ov49_0225A854: ; 0x0225A854
	push {r3, r4, lr}
	sub sp, #0xc
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0225A964 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225A968 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0225A96C ; =0x0000CFFB
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	ldr r0, _0225A970 ; =ov49_02269754
	bl G3X_SetEdgeColorTable
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r1, #0
	ldr r0, _0225A974 ; =0x00006B5A
	ldr r2, _0225A978 ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _0225A97C ; =0xBFFF0000
	ldr r0, _0225A980 ; =0x04000580
	ldr r2, _0225A984 ; =0xFFFFF224
	str r1, [r0]
	ldr r1, _0225A988 ; =0xFFFFF805
	mov r0, #0
	mov r3, #0x6e
	bl NNS_G3dGlbLightVector
	mov r1, #0
	add r0, sp, #4
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #1
	lsl r1, r1, #0xc
	strh r1, [r0, #4]
	add r0, sp, #4
	add r1, r0, #0
	bl VEC_Fx16Normalize
	add r4, sp, #4
	mov r1, #0
	mov r2, #2
	mov r3, #4
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	mov r0, #1
	bl NNS_G3dGlbLightVector
	mov r1, #0
	add r0, r4, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #1
	lsl r1, r1, #0xc
	strh r1, [r0, #4]
	add r0, sp, #4
	add r1, r0, #0
	bl VEC_Fx16Normalize
	mov r0, #2
	mov r1, #0
	mov r3, #4
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r0]
	ldrsh r3, [r4, r3]
	bl NNS_G3dGlbLightVector
	ldr r1, _0225A978 ; =0x00007FFF
	mov r0, #2
	bl NNS_G3dGlbLightColor
	mov r1, #0
	add r0, r4, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #1
	lsl r1, r1, #0xc
	strh r1, [r0, #4]
	add r0, sp, #4
	add r1, r0, #0
	bl VEC_Fx16Normalize
	mov r1, #0
	mov r2, #2
	mov r3, #4
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	mov r0, #3
	bl NNS_G3dGlbLightVector
	ldr r1, _0225A978 ; =0x00007FFF
	mov r0, #3
	bl NNS_G3dGlbLightColor
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0225A964: .word 0x04000008
_0225A968: .word 0xFFFFCFFD
_0225A96C: .word 0x0000CFFB
_0225A970: .word ov49_02269754
_0225A974: .word 0x00006B5A
_0225A978: .word 0x00007FFF
_0225A97C: .word 0xBFFF0000
_0225A980: .word 0x04000580
_0225A984: .word 0xFFFFF224
_0225A988: .word 0xFFFFF805
	thumb_func_end ov49_0225A854

	thumb_func_start ov49_0225A98C
ov49_0225A98C: ; 0x0225A98C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258B44
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _0225A9B2
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0225A9B2
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_0225EF24
_0225A9B2:
	mov r0, #0xf9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E318
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _0225A9E8
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0225A9E8
	mov r0, #0x3e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258B5C
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_0225EF30
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02268870
_0225A9E8:
	add r0, r4, #0
	bl ov49_0225AA70
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0225AA1E
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _0225AA0A
	ldrb r0, [r4, #6]
	cmp r0, #1
	beq _0225AA0A
	ldrb r0, [r4]
	cmp r0, #1
	bne _0225AA0E
_0225AA0A:
	mov r2, #1
	b _0225AA10
_0225AA0E:
	mov r2, #0
_0225AA10:
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r4, #0
	mov r3, #0x77
	bl ov49_0225B518
_0225AA1E:
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02265378
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225A98C

	thumb_func_start ov49_0225AA2C
ov49_0225AA2C: ; 0x0225AA2C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02026E48
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225CBF4
	mov r0, #0xf9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E3A0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258BD4
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02265398
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	add r4, #0x3c
	add r0, r4, #0
	bl ov49_0225A7C0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225AA2C

	thumb_func_start ov49_0225AA70
ov49_0225AA70: ; 0x0225AA70
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, [r7, #0x34]
	bl ov45_0222A394
	str r0, [sp, #8]
	mov r4, #0
_0225AA80:
	add r0, r4, #0
	bl ov45_0222F274
	add r6, r0, #0
	cmp r6, #1
	bne _0225AA9E
	add r0, r4, #0
	bl ov45_0222F294
	cmp r0, #0
	bne _0225AA9A
	mov r5, #1
	b _0225AAA0
_0225AA9A:
	mov r5, #0
	b _0225AAA0
_0225AA9E:
	mov r5, #0
_0225AAA0:
	add r0, r4, #0
	bl ov45_0222F314
	add r2, r0, #0
	ldr r0, [sp, #8]
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #0xf9
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r1, r4, #0
	add r3, r6, #0
	bl ov49_0225E8C4
	add r4, r4, #1
	cmp r4, #3
	blt _0225AA80
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225AA70

	thumb_func_start ov49_0225AAC8
ov49_0225AAC8: ; 0x0225AAC8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x5e
	str r0, [sp, #0x10]
	ldr r0, [r1]
	add r4, r2, #0
	add r6, r3, #0
	add r1, r5, #0
	mov r2, #1
	mov r3, #2
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #6
	lsl r0, r0, #6
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0x18]
	add r0, r4, #0
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	str r0, [r5, #0x14]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov49_0225AAC8

	thumb_func_start ov49_0225AB14
ov49_0225AB14: ; 0x0225AB14
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0225AB30
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_0225AB30:
	add r0, r4, #0
	bl ov49_0225AC38
	ldr r0, [r4, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end ov49_0225AB14

	thumb_func_start ov49_0225AB44
ov49_0225AB44: ; 0x0225AB44
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0225AB64
	ldr r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_0225AB64:
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl StringCopy
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x14]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, _0225ABA0 ; =0x0001020F
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r5, #0
	bl AddTextPrinterParameterized2
	mov r1, #1
	str r0, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl DrawFrameAndWindow2
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225ABA0: .word 0x0001020F
	thumb_func_end ov49_0225AB44

	thumb_func_start ov49_0225ABA4
ov49_0225ABA4: ; 0x0225ABA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0225ABC4
	ldr r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_0225ABC4:
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl StringCopy
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225AC04 ; =0x0001020F
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r5, #0
	bl AddTextPrinterParameterized2
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl DrawFrameAndWindow2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225AC04: .word 0x0001020F
	thumb_func_end ov49_0225ABA4

	thumb_func_start ov49_0225AC08
ov49_0225AC08: ; 0x0225AC08
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225AC16
	bl GF_AssertFail
_0225AC16:
	add r0, r4, #0
	mov r1, #1
	bl sub_0200F0AC
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225AC08

	thumb_func_start ov49_0225AC24
ov49_0225AC24: ; 0x0225AC24
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225AC36
	bl sub_0200F450
	mov r0, #0
	str r0, [r4, #0x1c]
_0225AC36:
	pop {r4, pc}
	thumb_func_end ov49_0225AC24

	thumb_func_start ov49_0225AC38
ov49_0225AC38: ; 0x0225AC38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225AC4A
	bl sub_0200F478
	mov r0, #0
	str r0, [r4, #0x1c]
_0225AC4A:
	pop {r4, pc}
	thumb_func_end ov49_0225AC38

	thumb_func_start ov49_0225AC4C
ov49_0225AC4C: ; 0x0225AC4C
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0225AC56
	mov r0, #1
	bx lr
_0225AC56:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225AC4C

	thumb_func_start ov49_0225AC5C
ov49_0225AC5C: ; 0x0225AC5C
	push {r3, lr}
	ldr r0, [r0, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0225AC70
	mov r0, #1
	pop {r3, pc}
_0225AC70:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov49_0225AC5C

	thumb_func_start ov49_0225AC74
ov49_0225AC74: ; 0x0225AC74
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0225AC90
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_0225AC90:
	add r0, r4, #0
	bl ov49_0225AC38
	add r0, r4, #0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225AC74

	thumb_func_start ov49_0225ACA8
ov49_0225ACA8: ; 0x0225ACA8
	push {r4, lr}
	add r4, r0, #0
	bl ov49_0225AAC8
	add r0, r4, #0
	mov r1, #2
	bl SetWindowPaletteNum
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225ACA8

	thumb_func_start ov49_0225ACBC
ov49_0225ACBC: ; 0x0225ACBC
	ldr r3, _0225ACC0 ; =ov49_0225AB14
	bx r3
	.balign 4, 0
_0225ACC0: .word ov49_0225AB14
	thumb_func_end ov49_0225ACBC

	thumb_func_start ov49_0225ACC4
ov49_0225ACC4: ; 0x0225ACC4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0225ACE4
	ldr r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_0225ACE4:
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl StringCopy
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x14]
	mov r1, #1
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x18]
	add r0, r5, #0
	bl AddTextPrinterParameterized
	str r0, [r5, #0x10]
	mov r0, #3
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #2
	bl DrawFrameAndWindow3
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225ACC4

	thumb_func_start ov49_0225AD20
ov49_0225AD20: ; 0x0225AD20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	add r5, r2, #0
	add r7, r0, #0
	add r4, r1, #0
	mov r0, #0x3c
	add r1, r5, #0
	bl NARC_ctor
	add r6, r0, #0
	ldr r0, _0225AE44 ; =0x00001388
	add r1, r6, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x13
	str r5, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r2, #4
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r7, #0x40]
	ldr r0, _0225AE44 ; =0x00001388
	add r1, r6, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x4d
	str r5, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xa
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r7, #0x44]
	ldr r1, _0225AE44 ; =0x00001388
	mov r0, #2
	str r1, [sp]
	str r0, [sp, #4]
	lsr r0, r1, #4
	str r5, [sp, #8]
	ldr r0, [r4, r0]
	add r1, r6, #0
	mov r2, #5
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r7, #0x48]
	ldr r0, _0225AE44 ; =0x00001388
	add r1, r6, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x4f
	str r5, [sp, #8]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #6
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r7, #0x4c]
	add r0, r6, #0
	bl NARC_dtor
	ldr r0, [r7, #0x40]
	bl sub_0200ADA4
	ldr r0, [r7, #0x44]
	bl sub_0200B00C
	ldr r1, _0225AE44 ; =0x00001388
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r0, #0x13
	str r2, [sp, #0x10]
	lsl r0, r0, #4
	ldr r3, [r4, r0]
	str r3, [sp, #0x14]
	add r3, r0, #4
	ldr r3, [r4, r3]
	str r3, [sp, #0x18]
	add r3, r0, #0
	add r3, #8
	ldr r3, [r4, r3]
	add r0, #0xc
	str r3, [sp, #0x1c]
	ldr r0, [r4, r0]
	add r3, r1, #0
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x4c
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4, #4]
	mov r6, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	mov r0, #1
	str r0, [sp, #0x44]
	mov r0, #3
	lsl r0, r0, #0x12
	str r5, [sp, #0x48]
	ldr r4, _0225AE48 ; =ov49_022696E8
	str r6, [sp, #0x40]
	str r0, [sp, #0x34]
	add r5, r7, #0
_0225AE0E:
	ldrb r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl sub_02024714
	str r0, [r5, #0x50]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x50]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x50]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r4, r4, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225AE0E
	mov r0, #0
	str r0, [r7, #0x3c]
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AE44: .word 0x00001388
_0225AE48: .word ov49_022696E8
	thumb_func_end ov49_0225AD20

	thumb_func_start ov49_0225AE4C
ov49_0225AE4C: ; 0x0225AE4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r1, [r5, #0x34]
	cmp r1, #0
	beq _0225AE5C
	bl ov49_0225AEE0
_0225AE5C:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _0225AE6C
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225B014
_0225AE6C:
	mov r7, #0
	add r4, r5, #0
_0225AE70:
	ldr r0, [r4, #0x50]
	bl sub_02024758
	mov r0, #0
	str r0, [r4, #0x50]
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, #2
	blt _0225AE70
	ldr r0, [r5, #0x40]
	bl sub_0200AEB0
	ldr r0, [r5, #0x44]
	bl sub_0200B0A8
	mov r7, #0x13
	mov r4, #0
	lsl r7, r7, #4
_0225AE94:
	ldr r0, [r6, r7]
	ldr r1, [r5, #0x40]
	bl DestroySingle2DGfxResObj
	add r4, r4, #1
	add r5, r5, #4
	add r6, r6, #4
	cmp r4, #4
	blt _0225AE94
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225AE4C

	thumb_func_start ov49_0225AEA8
ov49_0225AEA8: ; 0x0225AEA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _0225AEBC
	bl GF_AssertFail
_0225AEBC:
	add r0, r4, #0
	add r1, r7, #0
	bl ListMenuItems_ctor
	str r0, [r5, #0x34]
	mov r1, #0
	strh r4, [r5, #0x38]
	cmp r4, #0
	bls _0225AEDE
	add r2, r1, #0
_0225AED0:
	ldr r0, [r5, #0x34]
	add r1, r1, #1
	add r0, r0, r2
	str r6, [r0, #4]
	add r2, #8
	cmp r1, r4
	blo _0225AED0
_0225AEDE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225AEA8

	thumb_func_start ov49_0225AEE0
ov49_0225AEE0: ; 0x0225AEE0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0225AEF4
	bl ListMenuItems_dtor
	mov r0, #0
	str r0, [r4, #0x34]
	strh r0, [r4, #0x38]
_0225AEF4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225AEE0

	thumb_func_start ov49_0225AEF8
ov49_0225AEF8: ; 0x0225AEF8
	ldr r3, _0225AF00 ; =ListMenuItems_AddItem
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225AF00: .word ListMenuItems_AddItem
	thumb_func_end ov49_0225AEF8

	thumb_func_start ov49_0225AF04
ov49_0225AF04: ; 0x0225AF04
	ldr r0, [r0, #0x34]
	bx lr
	thumb_func_end ov49_0225AF04

	thumb_func_start ov49_0225AF08
ov49_0225AF08: ; 0x0225AF08
	push {r3, r4}
	ldrh r2, [r0, #0x38]
	mov r3, #0
	cmp r2, #0
	ble _0225AF2A
	ldr r4, [r0, #0x34]
_0225AF14:
	ldr r2, [r4, #4]
	cmp r1, r2
	bne _0225AF20
	mov r0, #1
	pop {r3, r4}
	bx lr
_0225AF20:
	ldrh r2, [r0, #0x38]
	add r3, r3, #1
	add r4, #8
	cmp r3, r2
	blt _0225AF14
_0225AF2A:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_0225AF08

	thumb_func_start ov49_0225AF30
ov49_0225AF30: ; 0x0225AF30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _0225AF46
	bl GF_AssertFail
_0225AF46:
	ldrh r0, [r4, #0x12]
	lsl r0, r0, #1
	cmp r0, #0x12
	blt _0225AF52
	bl GF_AssertFail
_0225AF52:
	add r3, r4, #0
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r1, r5, #0
	add r1, #0x20
	str r1, [r5, #0xc]
	ldrh r0, [r4, #0x10]
	add r3, sp, #0x18
	mov r2, #1
	strh r0, [r5, #0x3a]
	ldr r0, _0225AFD4 ; =ov49_0225B058
	str r0, [r5, #4]
	ldrb r0, [r3, #0x1c]
	str r0, [sp]
	add r0, sp, #0x38
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldrh r0, [r4, #0x12]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0xca
	str r0, [sp, #0x10]
	ldrb r3, [r3, #0x18]
	ldr r0, [r6]
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x20
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x20
	mov r1, #1
	mov r2, #0x55
	mov r3, #3
	bl DrawFrameAndWindow1
	add r2, sp, #0x18
	ldr r3, [sp, #0x2c]
	ldrh r2, [r2, #0x10]
	lsl r3, r3, #0x18
	add r0, r5, #0
	add r1, r7, #0
	lsr r3, r3, #0x18
	bl ListMenuInit
	str r0, [r5, #0x30]
	add r5, #0x20
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225AFD4: .word ov49_0225B058
	thumb_func_end ov49_0225AF30

	thumb_func_start ov49_0225AFD8
ov49_0225AFD8: ; 0x0225AFD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _0225AFE8
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0225AFE8:
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0225AFFC
	add r0, r0, #1
	cmp r4, r0
	bne _0225B004
_0225AFFC:
	add r0, r5, #0
	bl ov49_0225B070
	b _0225B00A
_0225B004:
	ldr r0, _0225B010 ; =0x000005DC
	bl PlaySE
_0225B00A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0225B010: .word 0x000005DC
	thumb_func_end ov49_0225AFD8

	thumb_func_start ov49_0225B014
ov49_0225B014: ; 0x0225B014
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _0225B056
	bl DestroyListMenu
	mov r0, #0
	str r0, [r5, #0x30]
	add r0, r5, #0
	add r0, #0x20
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x20
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0x20
	bl RemoveWindow
	mov r4, #0
	str r4, [r5, #0x3c]
	add r6, r4, #0
_0225B046:
	ldr r0, [r5, #0x50]
	add r1, r6, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0225B046
_0225B056:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225B014

	thumb_func_start ov49_0225B058
ov49_0225B058: ; 0x0225B058
	push {r3, lr}
	cmp r2, #0
	bne _0225B064
	ldr r0, _0225B068 ; =0x000005DC
	bl PlaySE
_0225B064:
	pop {r3, pc}
	nop
_0225B068: .word 0x000005DC
	thumb_func_end ov49_0225B058

	thumb_func_start ov49_0225B06C
ov49_0225B06C: ; 0x0225B06C
	str r1, [r0, #0x3c]
	bx lr
	thumb_func_end ov49_0225B06C

	thumb_func_start ov49_0225B070
ov49_0225B070: ; 0x0225B070
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0225B090
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x54]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #4
	pop {r3, r4, pc}
_0225B090:
	ldr r0, [r4, #0x30]
	add r1, sp, #0
	mov r2, #0
	bl ListMenuGetScrollAndRow
	add r0, sp, #0
	ldrh r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #0x50]
	bne _0225B0AC
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0225B0B2
_0225B0AC:
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0225B0B2:
	add r0, sp, #0
	ldrh r1, [r0]
	ldrh r0, [r4, #0x3a]
	sub r0, r0, #7
	cmp r1, r0
	ldr r0, [r4, #0x54]
	blt _0225B0CA
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #4
	pop {r3, r4, pc}
_0225B0CA:
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225B070

	thumb_func_start ov49_0225B0D4
ov49_0225B0D4: ; 0x0225B0D4
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225B0D4

	thumb_func_start ov49_0225B0D8
ov49_0225B0D8: ; 0x0225B0D8
	ldr r3, _0225B0DC ; =ov49_0225B124
	bx r3
	.balign 4, 0
_0225B0DC: .word ov49_0225B124
	thumb_func_end ov49_0225B0D8

	thumb_func_start ov49_0225B0E0
ov49_0225B0E0: ; 0x0225B0E0
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r2, [r0, #0x10]
	str r2, [sp]
	ldrb r2, [r0, #0x14]
	str r2, [sp, #4]
	ldrb r0, [r0, #0x18]
	mov r2, #1
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0xca
	str r0, [sp, #0x10]
	ldr r0, [r1]
	add r1, r4, #0
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x55
	mov r3, #3
	bl DrawFrameAndWindow1
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov49_0225B0E0

	thumb_func_start ov49_0225B124
ov49_0225B124: ; 0x0225B124
	push {r4, lr}
	add r4, r0, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _0225B144
	add r0, r4, #0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl RemoveWindow
_0225B144:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225B124

	thumb_func_start ov49_0225B148
ov49_0225B148: ; 0x0225B148
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	str r3, [sp]
	add r5, r2, #0
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r1, _0225B174 ; =0x0001020F
	add r4, r0, #0
	str r1, [sp, #8]
	mov r1, #0
	add r2, r6, #0
	add r3, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225B174: .word 0x0001020F
	thumb_func_end ov49_0225B148

	thumb_func_start ov49_0225B178
ov49_0225B178: ; 0x0225B178
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	str r3, [sp]
	add r1, sp, #8
	add r4, r2, #0
	ldrh r1, [r1, #0x10]
	add r2, r5, #0
	add r3, r4, #0
	str r1, [sp, #4]
	mov r1, #0xf
	bl FillWindowPixelRect
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225B178

	thumb_func_start ov49_0225B198
ov49_0225B198: ; 0x0225B198
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _0225B1AA
	bl GF_AssertFail
_0225B1AA:
	mov r0, #2
	add r1, r6, #0
	bl ListMenuItems_ctor
	str r0, [r5]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x43
	bl ov49_0225B388
	add r1, r0, #0
	ldr r0, [r5]
	mov r2, #0
	bl ListMenuItems_AddItem
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x42
	bl ov49_0225B388
	add r1, r0, #0
	ldr r0, [r5]
	mov r2, #1
	bl ListMenuItems_AddItem
	ldr r3, _0225B1FC ; =ov49_022697AC
	add r2, r5, #4
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #2
	strh r0, [r5, #0x14]
	ldr r0, [r5]
	str r0, [r5, #4]
	pop {r4, r5, r6, pc}
	nop
_0225B1FC: .word ov49_022697AC
	thumb_func_end ov49_0225B198

	thumb_func_start ov49_0225B200
ov49_0225B200: ; 0x0225B200
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0225B212
	bl ListMenuItems_dtor
	mov r0, #0
	str r0, [r4]
_0225B212:
	pop {r4, pc}
	thumb_func_end ov49_0225B200

	thumb_func_start ov49_0225B214
ov49_0225B214: ; 0x0225B214
	push {r3, r4, lr}
	sub sp, #0x14
	mov r3, #4
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0x5e
	str r0, [sp, #0x10]
	ldr r0, [r1]
	add r1, r4, #0
	mov r2, #1
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov49_0225B214

	thumb_func_start ov49_0225B244
ov49_0225B244: ; 0x0225B244
	ldr r3, _0225B248 ; =RemoveWindow
	bx r3
	.balign 4, 0
_0225B248: .word RemoveWindow
	thumb_func_end ov49_0225B244

	thumb_func_start ov49_0225B24C
ov49_0225B24C: ; 0x0225B24C
	push {r4, lr}
	sub sp, #0x10
	add r2, r1, #0
	mov r1, #0
	str r1, [sp]
	mov r3, #0xff
	str r3, [sp, #4]
	ldr r3, _0225B280 ; =0x0001020F
	add r4, r0, #0
	str r3, [sp, #8]
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x55
	mov r3, #3
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_0225B280: .word 0x0001020F
	thumb_func_end ov49_0225B24C

	thumb_func_start ov49_0225B284
ov49_0225B284: ; 0x0225B284
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl sub_020392D8
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov45_0222D7CC
	add r7, r0, #0
	mov r0, #2
	str r0, [sp]
	ldr r1, [r4]
	add r0, r5, #0
	mov r2, #5
	mov r3, #0
	bl ov49_0225B3A8
	add r0, r5, #0
	mov r1, #2
	add r2, r7, #0
	bl ov49_0225B388
	add r1, r0, #0
	add r0, r6, #0
	bl ov49_0225B24C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225B284

	thumb_func_start ov49_0225B2C0
ov49_0225B2C0: ; 0x0225B2C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl ov45_0222E7FC
	add r1, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r2, #5
	mov r3, #0
	bl ov49_0225B3A8
	add r0, r4, #0
	mov r1, #2
	mov r2, #0x20
	bl ov49_0225B388
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225B24C
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225B2C0

	thumb_func_start ov49_0225B2F0
ov49_0225B2F0: ; 0x0225B2F0
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #2
	mov r2, #0xe
	bl ov49_0225B388
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225B24C
	pop {r4, pc}
	thumb_func_end ov49_0225B2F0

	thumb_func_start ov49_0225B308
ov49_0225B308: ; 0x0225B308
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	str r0, [sp]
	mov r0, #8
	mov r1, #0x40
	add r2, r7, #0
	bl ScrStrBufs_new_custom
	ldr r1, [sp]
	ldr r4, _0225B358 ; =ov49_02269714
	str r0, [r1]
	mov r6, #0
	add r5, r1, #0
_0225B322:
	ldr r2, [r4]
	mov r0, #1
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	str r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #4
	blt _0225B322
	mov r0, #0x1e
	lsl r0, r0, #4
	add r1, r7, #0
	bl String_ctor
	ldr r1, [sp]
	str r0, [r1, #0x14]
	mov r0, #0x1e
	lsl r0, r0, #4
	add r1, r7, #0
	bl String_ctor
	ldr r1, [sp]
	str r0, [r1, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B358: .word ov49_02269714
	thumb_func_end ov49_0225B308

	thumb_func_start ov49_0225B35C
ov49_0225B35C: ; 0x0225B35C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl ScrStrBufs_delete
	mov r4, #0
	add r5, r6, #0
_0225B36A:
	ldr r0, [r5, #4]
	bl DestroyMsgData
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225B36A
	ldr r0, [r6, #0x14]
	bl String_dtor
	ldr r0, [r6, #0x18]
	bl String_dtor
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225B35C

	thumb_func_start ov49_0225B388
ov49_0225B388: ; 0x0225B388
	push {r4, lr}
	add r4, r0, #0
	lsl r0, r1, #2
	add r0, r4, r0
	add r1, r2, #0
	ldr r0, [r0, #4]
	ldr r2, [r4, #0x18]
	bl ReadMsgDataIntoString
	ldr r0, [r4]
	ldr r1, [r4, #0x14]
	ldr r2, [r4, #0x18]
	bl StringExpandPlaceholders
	ldr r0, [r4, #0x14]
	pop {r4, pc}
	thumb_func_end ov49_0225B388

	thumb_func_start ov49_0225B3A8
ov49_0225B3A8: ; 0x0225B3A8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, [sp, #0x18]
	add r4, r2, #0
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r1, r3, #0
	ldr r0, [r0]
	add r2, r5, #0
	add r3, r4, #0
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225B3A8

	thumb_func_start ov49_0225B3C8
ov49_0225B3C8: ; 0x0225B3C8
	add r3, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _0225B3D4 ; =BufferPlayersName
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0225B3D4: .word BufferPlayersName
	thumb_func_end ov49_0225B3C8

	thumb_func_start ov49_0225B3D8
ov49_0225B3D8: ; 0x0225B3D8
	add r3, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _0225B3E4 ; =BufferWiFiPlazaActivityName
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0225B3E4: .word BufferWiFiPlazaActivityName
	thumb_func_end ov49_0225B3D8

	thumb_func_start ov49_0225B3E8
ov49_0225B3E8: ; 0x0225B3E8
	add r3, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _0225B3F4 ; =BufferWiFiPlazaEventName
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0225B3F4: .word BufferWiFiPlazaEventName
	thumb_func_end ov49_0225B3E8

	thumb_func_start ov49_0225B3F8
ov49_0225B3F8: ; 0x0225B3F8
	add r3, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _0225B404 ; =BufferWiFiPlazaInstrumentName
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0225B404: .word BufferWiFiPlazaInstrumentName
	thumb_func_end ov49_0225B3F8

	thumb_func_start ov49_0225B408
ov49_0225B408: ; 0x0225B408
	add r3, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _0225B414 ; =BufferCountryName
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0225B414: .word BufferCountryName
	thumb_func_end ov49_0225B408

	thumb_func_start ov49_0225B418
ov49_0225B418: ; 0x0225B418
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r1, r3, #0
	ldr r0, [r0]
	add r2, r5, #0
	add r3, r4, #0
	bl BufferCityName
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225B418

	thumb_func_start ov49_0225B42C
ov49_0225B42C: ; 0x0225B42C
	ldr r3, _0225B434 ; =BufferECWord
	ldr r0, [r0]
	bx r3
	nop
_0225B434: .word BufferECWord
	thumb_func_end ov49_0225B42C

	thumb_func_start ov49_0225B438
ov49_0225B438: ; 0x0225B438
	ldr r3, _0225B440 ; =ScrStrBufs_ResetBuffers
	ldr r0, [r0]
	bx r3
	nop
_0225B440: .word ScrStrBufs_ResetBuffers
	thumb_func_end ov49_0225B438

	thumb_func_start ov49_0225B444
ov49_0225B444: ; 0x0225B444
	mov r1, #0xf6
	mov r2, #1
	lsl r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225B444

	thumb_func_start ov49_0225B450
ov49_0225B450: ; 0x0225B450
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, [sp, #0x20]
	add r5, r0, #0
	add r0, r3, #0
	add r7, r1, #0
	add r6, r2, #0
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #4]
	mov r0, #0xd1
	add r1, r4, #0
	bl NARC_ctor
	mov r2, #0x53
	lsl r2, r2, #2
	str r0, [r5, r2]
	str r4, [sp]
	ldr r2, [r5, r2]
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	bl ov49_0225BABC
	mov r2, #0x53
	lsl r2, r2, #2
	add r0, r5, #0
	ldr r2, [r5, r2]
	add r0, #8
	add r1, r6, #0
	add r3, r4, #0
	bl ov49_0225BB84
	mov r2, #0x45
	lsl r2, r2, #2
	add r0, r5, r2
	add r2, #0x38
	ldr r2, [r5, r2]
	add r1, r6, #0
	add r3, r4, #0
	bl ov49_0225C844
	mov r1, #0
	strb r1, [r5, #2]
	strb r1, [r5, #1]
	ldrh r0, [r7, #6]
	cmp r0, #0
	bne _0225B4DC
	mov r0, #4
	strb r1, [r5]
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0225B4DC:
	mov r0, #5
	strb r0, [r5]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225B450

	thumb_func_start ov49_0225B4E4
ov49_0225B4E4: ; 0x0225B4E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r6, r1, #0
	add r4, r2, #0
	bl ov49_0225C8A8
	add r0, r5, #0
	add r0, #8
	add r1, r6, #0
	add r2, r4, #0
	bl ov49_0225BBA8
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225BB10
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl NARC_dtor
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225B4E4

	thumb_func_start ov49_0225B518
ov49_0225B518: ; 0x0225B518
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	str r0, [sp, #0x38]
	add r0, #0x3c
	str r0, [sp, #0x38]
	mov r0, #0xb7
	lsl r0, r0, #2
	ldrb r1, [r4]
	add r7, r3, #0
	ldr r6, [r5, #0x34]
	str r0, [sp, #0x3c]
	cmp r1, #0xa
	bhi _0225B5FA
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225B544: ; jump table
	.short _0225B55A - _0225B544 - 2 ; case 0
	.short _0225B568 - _0225B544 - 2 ; case 1
	.short _0225B586 - _0225B544 - 2 ; case 2
	.short _0225B5D4 - _0225B544 - 2 ; case 3
	.short _0225B5F2 - _0225B544 - 2 ; case 4
	.short _0225B606 - _0225B544 - 2 ; case 5
	.short _0225B6E2 - _0225B544 - 2 ; case 6
	.short _0225B700 - _0225B544 - 2 ; case 7
	.short _0225B748 - _0225B544 - 2 ; case 8
	.short _0225B84E - _0225B544 - 2 ; case 9
	.short _0225B880 - _0225B544 - 2 ; case 10
_0225B55A:
	ldrh r0, [r4, #6]
	cmp r0, #1
	bne _0225B5FA
	add r0, r1, #1
	add sp, #0x50
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B568:
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0
	ldr r3, _0225B890 ; =0x00007FFF
	str r7, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B586:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225B5FA
	add r0, r6, #0
	bl ov45_0222A5C0
	mov r2, #0xb7
	lsl r2, r2, #2
	str r0, [sp]
	ldr r1, [sp, #0x38]
	add r0, r4, #0
	add r2, r5, r2
	add r3, r7, #0
	bl ov49_0225B9AC
	mov r0, #4
	strb r0, [r4, #1]
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
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B5D4:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r3, _0225B890 ; =0x00007FFF
	str r7, [sp, #8]
	mov r0, #4
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B5F2:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _0225B5FC
_0225B5FA:
	b _0225B88C
_0225B5FC:
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B606:
	cmp r2, #1
	beq _0225B708
	ldrb r0, [r4, #1]
	cmp r0, #4
	bhi _0225B6D2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225B61C: ; jump table
	.short _0225B6D2 - _0225B61C - 2 ; case 0
	.short _0225B626 - _0225B61C - 2 ; case 1
	.short _0225B6C2 - _0225B61C - 2 ; case 2
	.short _0225B642 - _0225B61C - 2 ; case 3
	.short _0225B6D2 - _0225B61C - 2 ; case 4
_0225B626:
	mov r2, #0x45
	lsl r2, r2, #2
	add r0, r4, r2
	add r2, #0x38
	ldr r1, [sp, #0x38]
	ldr r2, [r4, r2]
	bl ov49_0225C8D4
	cmp r0, #1
	bne _0225B6D2
	add r0, r5, #0
	bl ov49_0225B444
	b _0225B6D2
_0225B642:
	ldr r2, _0225B894 ; =0x00000153
	ldrb r0, [r4, r2]
	cmp r0, #0
	beq _0225B66E
	sub r1, r2, #3
	mov r0, #0xf7
	sub r2, r2, #1
	lsl r0, r0, #2
	ldrh r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldr r0, [r5, r0]
	bl ov49_02268968
	cmp r0, #0
	bne _0225B66E
	ldr r0, _0225B894 ; =0x00000153
	mov r1, #0
	strb r1, [r4, r0]
	sub r0, #0x3f
	add r0, r4, r0
	bl ov49_0225CB68
_0225B66E:
	mov r2, #0x45
	lsl r2, r2, #2
	add r0, r4, r2
	add r2, #0x38
	ldr r1, [sp, #0x38]
	ldr r2, [r4, r2]
	add r3, r7, #0
	bl ov49_0225C8D4
	cmp r0, #1
	bne _0225B6D2
	add r0, r6, #0
	bl ov45_0222A53C
	add r1, r0, #0
	add r0, r6, #0
	bl ov45_0222ADD8
	add r0, r6, #0
	bl ov45_0222AE54
	add r0, r6, #0
	bl ov45_0222A53C
	add r1, r0, #0
	add r0, r6, #0
	bl ov45_0222ADA8
	add r1, sp, #0x4c
	add r2, sp, #0x48
	bl ov45_0222AE08
	ldr r0, _0225B894 ; =0x00000153
	mov r1, #1
	strb r1, [r4, r0]
	sub r1, r0, #3
	ldr r2, [sp, #0x4c]
	sub r0, r0, #1
	strh r2, [r4, r1]
	ldr r1, [sp, #0x48]
	strb r1, [r4, r0]
	b _0225B6D2
_0225B6C2:
	ldr r1, [sp, #0x3c]
	add r0, r4, #0
	add r1, #0x3c
	str r1, [sp, #0x3c]
	add r0, #8
	add r1, r5, r1
	bl ov49_0225BBCC
_0225B6D2:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0225B708
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B6E2:
	mov r0, #3
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r2, #0
	str r7, [sp, #8]
	mov r0, #4
	add r3, r2, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B700:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _0225B70A
_0225B708:
	b _0225B88C
_0225B70A:
	ldrb r0, [r4, #1]
	cmp r0, #4
	bhi _0225B73E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225B71C: ; jump table
	.short _0225B73E - _0225B71C - 2 ; case 0
	.short _0225B726 - _0225B71C - 2 ; case 1
	.short _0225B730 - _0225B71C - 2 ; case 2
	.short _0225B726 - _0225B71C - 2 ; case 3
	.short _0225B726 - _0225B71C - 2 ; case 4
_0225B726:
	ldr r1, [sp, #0x38]
	add r0, r4, #0
	bl ov49_0225BA20
	b _0225B73E
_0225B730:
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r2, [sp, #0x38]
	add r0, r4, #0
	add r1, r5, r1
	bl ov49_0225B99C
_0225B73E:
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B748:
	ldrb r0, [r4, #2]
	cmp r0, #4
	bhi _0225B840
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225B75A: ; jump table
	.short _0225B840 - _0225B75A - 2 ; case 0
	.short _0225B764 - _0225B75A - 2 ; case 1
	.short _0225B77E - _0225B75A - 2 ; case 2
	.short _0225B810 - _0225B75A - 2 ; case 3
	.short _0225B764 - _0225B75A - 2 ; case 4
_0225B764:
	add r0, r6, #0
	bl ov45_0222A5C0
	mov r2, #0xb7
	lsl r2, r2, #2
	str r0, [sp]
	ldr r1, [sp, #0x38]
	add r0, r4, #0
	add r2, r5, r2
	add r3, r7, #0
	bl ov49_0225B9AC
	b _0225B840
_0225B77E:
	add r0, r6, #0
	bl ov45_0222A5C0
	str r0, [sp, #0x28]
	ldrb r0, [r4, #3]
	str r0, [sp, #0x24]
	add r0, r6, #0
	bl ov45_0222A53C
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _0225B7A4
	add r0, r6, #0
	bl ov45_0222A5C0
	str r0, [sp, #0x20]
	mov r0, #1
	str r0, [sp, #0x2c]
	b _0225B7B0
_0225B7A4:
	add r0, r6, #0
	bl ov45_0222A578
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x2c]
_0225B7B0:
	ldrb r1, [r4, #3]
	add r0, r6, #0
	bl ov45_0222AB28
	str r0, [sp, #0x34]
	ldrh r0, [r4, #4]
	cmp r0, #1
	bne _0225B7DC
	ldrb r1, [r4, #3]
	add r0, r6, #0
	bl ov45_0222AB48
	str r0, [sp, #0x30]
	ldrb r1, [r4, #3]
	add r0, r6, #0
	bl ov45_0222AB58
	cmp r0, #0
	bne _0225B7E0
	mov r1, #0
	str r1, [sp, #0x30]
	b _0225B7E0
_0225B7DC:
	mov r0, #0
	str r0, [sp, #0x30]
_0225B7E0:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x3c]
	str r1, [sp]
	ldr r1, [sp, #0x20]
	str r7, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x38]
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x34]
	add r3, r5, r3
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x30]
	str r1, [sp, #0x14]
	mov r1, #0xc6
	str r0, [sp, #0x18]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #0x1c]
	add r0, r4, #0
	add r1, r5, r1
	bl ov49_0225B944
	b _0225B840
_0225B810:
	add r0, r6, #0
	bl ov45_0222A53C
	add r1, r0, #0
	add r0, r6, #0
	bl ov45_0222ADA8
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0225B82C
	bl GF_AssertFail
	mov r0, #0
_0225B82C:
	add r1, sp, #0x44
	add r2, sp, #0x40
	bl ov45_0222AE08
	ldr r1, [sp, #0x38]
	ldr r3, [sp, #0x40]
	add r0, r4, #0
	add r2, r7, #0
	bl ov49_0225B9F0
_0225B840:
	mov r0, #0
	strb r0, [r4, #2]
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B84E:
	mov r0, #3
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	str r7, [sp, #8]
	mov r0, #4
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #1]
	cmp r0, #2
	bne _0225B876
	mov r1, #0xc6
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #8
	add r1, r5, r1
	bl ov49_0225BBCC
_0225B876:
	ldrb r0, [r4]
	add sp, #0x50
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B880:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225B88C
	mov r0, #5
	strb r0, [r4]
_0225B88C:
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B890: .word 0x00007FFF
_0225B894: .word 0x00000153
	thumb_func_end ov49_0225B518

	thumb_func_start ov49_0225B898
ov49_0225B898: ; 0x0225B898
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov49_0225B898

	thumb_func_start ov49_0225B89C
ov49_0225B89C: ; 0x0225B89C
	mov r3, #2
	strb r3, [r0, #2]
	strb r1, [r0, #3]
	strh r2, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225B89C

	thumb_func_start ov49_0225B8A8
ov49_0225B8A8: ; 0x0225B8A8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r7, r3, #0
	cmp r4, #0x1b
	blo _0225B8BA
	bl GF_AssertFail
_0225B8BA:
	ldrb r0, [r5, #1]
	cmp r0, #2
	beq _0225B8C4
	bl GF_AssertFail
_0225B8C4:
	ldrb r0, [r5, #1]
	cmp r0, #2
	bne _0225B8DE
	mov r2, #0x53
	str r4, [sp]
	lsl r2, r2, #2
	add r0, r5, #0
	ldr r2, [r5, r2]
	add r0, #8
	add r1, r6, #0
	add r3, r7, #0
	bl ov49_0225BFC4
_0225B8DE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225B8A8

	thumb_func_start ov49_0225B8E0
ov49_0225B8E0: ; 0x0225B8E0
	ldrb r1, [r0, #1]
	cmp r1, #1
	beq _0225B8EA
	mov r1, #1
	strb r1, [r0, #2]
_0225B8EA:
	bx lr
	thumb_func_end ov49_0225B8E0

	thumb_func_start ov49_0225B8EC
ov49_0225B8EC: ; 0x0225B8EC
	ldrb r1, [r0, #1]
	cmp r1, #3
	beq _0225B8F6
	mov r1, #3
	strb r1, [r0, #2]
_0225B8F6:
	bx lr
	thumb_func_end ov49_0225B8EC

	thumb_func_start ov49_0225B8F8
ov49_0225B8F8: ; 0x0225B8F8
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end ov49_0225B8F8

	thumb_func_start ov49_0225B8FC
ov49_0225B8FC: ; 0x0225B8FC
	ldrb r1, [r0, #2]
	cmp r1, #2
	bne _0225B906
	mov r0, #1
	bx lr
_0225B906:
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0225B910
	mov r0, #1
	bx lr
_0225B910:
	mov r0, #0
	bx lr
	thumb_func_end ov49_0225B8FC

	thumb_func_start ov49_0225B914
ov49_0225B914: ; 0x0225B914
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _0225B924
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0225B924
	mov r0, #1
	bx lr
_0225B924:
	mov r0, #0
	bx lr
	thumb_func_end ov49_0225B914

	thumb_func_start ov49_0225B928
ov49_0225B928: ; 0x0225B928
	ldr r3, _0225B930 ; =ov49_0225BFEC
	add r0, #8
	bx r3
	nop
_0225B930: .word ov49_0225BFEC
	thumb_func_end ov49_0225B928

	thumb_func_start ov49_0225B934
ov49_0225B934: ; 0x0225B934
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0225B93E
	mov r0, #1
	bx lr
_0225B93E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225B934

	thumb_func_start ov49_0225B944
ov49_0225B944: ; 0x0225B944
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r3, #0
	ldrb r3, [r5, #1]
	add r6, r1, #0
	add r7, r2, #0
	cmp r3, #2
	bne _0225B95A
	bl ov49_0225B99C
_0225B95A:
	ldr r0, [sp, #0x40]
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	add r1, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x48]
	add r2, #8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x4c]
	add r3, r7, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x24]
	add r0, r5, #0
	bl ov49_0225BBD0
	mov r0, #2
	strb r0, [r5, #1]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225B944

	thumb_func_start ov49_0225B99C
ov49_0225B99C: ; 0x0225B99C
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov49_0225BF80
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
	thumb_func_end ov49_0225B99C

	thumb_func_start ov49_0225B9AC
ov49_0225B9AC: ; 0x0225B9AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #1]
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	cmp r0, #1
	beq _0225B9C8
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0225B9D0
_0225B9C8:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225BA20
_0225B9D0:
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	sub r0, #0x38
	str r1, [sp]
	ldr r3, [sp, #0x20]
	add r0, r5, r0
	add r1, r4, #0
	add r2, r7, #0
	str r6, [sp, #4]
	bl ov49_0225C970
	mov r0, #1
	strb r0, [r5, #1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225B9AC

	thumb_func_start ov49_0225B9F0
ov49_0225B9F0: ; 0x0225B9F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	ldrb r2, [r5, #1]
	add r6, r1, #0
	add r7, r3, #0
	cmp r2, #3
	bne _0225BA04
	bl ov49_0225BA20
_0225BA04:
	mov r3, #0x45
	lsl r3, r3, #2
	add r0, r5, r3
	str r4, [sp]
	add r3, #0x38
	ldr r3, [r5, r3]
	add r1, r6, #0
	add r2, r7, #0
	bl ov49_0225CA30
	mov r0, #3
	strb r0, [r5, #1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225B9F0

	thumb_func_start ov49_0225BA20
ov49_0225BA20: ; 0x0225BA20
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov49_0225CAA8
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
	thumb_func_end ov49_0225BA20

	thumb_func_start ov49_0225BA34
ov49_0225BA34: ; 0x0225BA34
	ldr r2, _0225BA3C ; =0x0000011A
	strh r1, [r0, r2]
	bx lr
	nop
_0225BA3C: .word 0x0000011A
	thumb_func_end ov49_0225BA34

	thumb_func_start ov49_0225BA40
ov49_0225BA40: ; 0x0225BA40
	add r1, r0, #0
	mov r0, #0x55
	lsl r0, r0, #2
	strh r2, [r1, r0]
	add r0, r0, #2
	strh r3, [r1, r0]
	ldr r3, _0225BA54 ; =sub_0200E374
	ldr r0, _0225BA58 ; =ov49_0225BA5C
	mov r2, #0
	bx r3
	.balign 4, 0
_0225BA54: .word sub_0200E374
_0225BA58: .word ov49_0225BA5C
	thumb_func_end ov49_0225BA40

	thumb_func_start ov49_0225BA5C
ov49_0225BA5C: ; 0x0225BA5C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	mov r3, #0
	ldr r1, _0225BAB8 ; =0x00000156
	str r3, [sp]
	add r5, r0, #0
	ldrh r0, [r4, r1]
	mov r2, #4
	str r0, [sp, #4]
	add r0, r1, #0
	sub r1, r1, #2
	sub r0, #0xa
	ldrh r1, [r4, r1]
	ldr r0, [r4, r0]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0xa0
	add r2, r1, #0
	add r2, #0xb6
	ldrh r2, [r4, r2]
	mov r0, #4
	bl LoadFontPal0
	bl sub_020776B4
	add r6, r0, #0
	bl sub_02077690
	add r1, r0, #0
	mov r0, #0x60
	str r0, [sp]
	add r0, #0xf6
	ldrh r0, [r4, r0]
	mov r3, #0x16
	mov r2, #4
	str r0, [sp, #4]
	add r0, r6, #0
	lsl r3, r3, #4
	bl GfGfxLoader_GXLoadPal
	add r0, r5, #0
	bl DestroySysTask
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225BAB8: .word 0x00000156
	thumb_func_end ov49_0225BA5C

	thumb_func_start ov49_0225BABC
ov49_0225BABC: ; 0x0225BABC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r2, #0
	ldr r4, [sp, #0x20]
	cmp r3, #0
	bne _0225BADC
	mov r3, #0
	str r3, [sp]
	add r0, r5, #0
	mov r1, #0x56
	mov r2, #4
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	b _0225BAEC
_0225BADC:
	mov r3, #0
	str r3, [sp]
	add r0, r5, #0
	mov r1, #0x57
	mov r2, #4
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
_0225BAEC:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r6]
	add r0, r5, #0
	mov r1, #0x36
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #4
	mov r1, #0xa0
	add r2, r4, #0
	bl LoadFontPal0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225BABC

	thumb_func_start ov49_0225BB10
ov49_0225BB10: ; 0x0225BB10
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225BB10

	thumb_func_start ov49_0225BB14
ov49_0225BB14: ; 0x0225BB14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [sp, #0x2c]
	add r6, r3, #0
	str r0, [sp]
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0
	add r3, sp, #0xc
	ldr r4, [sp, #0x28]
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r2, [sp, #0xc]
	add r7, r0, #0
	ldr r0, [r2, #8]
	add r2, #0xc
	lsr r1, r0, #1
	mov r0, #0
	cmp r1, #0
	ble _0225BB4C
_0225BB3E:
	ldrh r3, [r2]
	add r0, r0, #1
	add r3, r3, r4
	strh r3, [r2]
	add r2, r2, #2
	cmp r0, r1
	blt _0225BB3E
_0225BB4C:
	ldr r2, [sp, #0xc]
	mov r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
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
	lsl r1, r6, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225BB14

	thumb_func_start ov49_0225BB84
ov49_0225BB84: ; 0x0225BB84
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _0225BBA4 ; =ov49_022697F4
	add r7, r1, #0
	mov r6, #0
	add r5, r0, #4
_0225BB8E:
	ldr r0, [r7]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #5
	blt _0225BB8E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225BBA4: .word ov49_022697F4
	thumb_func_end ov49_0225BB84

	thumb_func_start ov49_0225BBA8
ov49_0225BBA8: ; 0x0225BBA8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r3, [r4, #0x54]
	cmp r3, #0
	beq _0225BBB6
	bl ov49_0225BF80
_0225BBB6:
	mov r5, #0
	add r4, r4, #4
_0225BBBA:
	add r0, r4, #0
	bl RemoveWindow
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #5
	blt _0225BBBA
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225BBA8

	thumb_func_start ov49_0225BBCC
ov49_0225BBCC: ; 0x0225BBCC
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225BBCC

	thumb_func_start ov49_0225BBD0
ov49_0225BBD0: ; 0x0225BBD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	ldr r4, [sp, #0x28]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	add r5, r2, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	add r6, r3, #0
	str r0, [sp, #0x38]
	add r0, r4, #0
	bl ov49_0225B438
	ldr r0, [sp, #0x38]
	bl ov45_0222A9CC
	cmp r0, #0
	bne _0225BC1C
	ldr r0, [sp, #0x40]
	ldr r7, _0225BE98 ; =0x00070800
	cmp r0, #0
	bne _0225BC0E
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	add r1, r6, #0
	mov r2, #0x56
	bl ov49_0225BA40
	b _0225BC40
_0225BC0E:
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	add r1, r6, #0
	mov r2, #0x58
	bl ov49_0225BA40
	b _0225BC40
_0225BC1C:
	ldr r0, [sp, #0x40]
	mov r7, #0xc1
	lsl r7, r7, #0xa
	cmp r0, #0
	bne _0225BC34
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	add r1, r6, #0
	mov r2, #0x57
	bl ov49_0225BA40
	b _0225BC40
_0225BC34:
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	add r1, r6, #0
	mov r2, #0x58
	bl ov49_0225BA40
_0225BC40:
	ldr r0, [r6]
	mov r1, #4
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	ldr r0, [r6]
	mov r1, #5
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	ldr r0, [r6]
	mov r1, #6
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	add r0, r5, #0
	bl ov49_0225C3C0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x30]
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x5c
	mov r3, #4
	bl ov49_0225BB14
	ldr r0, [sp, #0x34]
	bl PlayerProfile_new
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	bl ov45_0222A844
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0x2c
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r0, [sp, #0x10]
	bl PlayerProfile_GetTrainerID_VisibleHalf
	add r1, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r2, #5
	mov r3, #0
	bl ov49_0225B3A8
	mov r0, #0x7a
	str r0, [sp]
	mov r2, #0
	ldr r0, _0225BE9C ; =0x00010200
	str r2, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0x31
	bl ov49_0225C414
	mov r2, #0
	str r2, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0x2d
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225C470
	mov r0, #0x7a
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0225BE9C ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #0
	mov r3, #0x32
	bl ov49_0225C414
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225C460
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	mov r3, #0x2e
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r0, [sp, #0x38]
	bl ov45_0222AA84
	cmp r0, #0
	bne _0225BD3E
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0225BE9C ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #1
	mov r3, #0x37
	bl ov49_0225C3DC
	b _0225BD60
_0225BD3E:
	ldr r2, [sp, #0x38]
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225C480
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0225BE9C ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #1
	mov r3, #0x33
	bl ov49_0225C3DC
_0225BD60:
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225C460
	ldr r0, [sp, #0x44]
	cmp r0, #0
	beq _0225BE06
	mov r0, #1
	str r0, [r5]
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225C470
	mov r0, #8
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #4
	mov r3, #0x38
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r2, [sp, #0x48]
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225C4B0
	mov r0, #6
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	ldr r0, _0225BE9C ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0x3b
	bl ov49_0225C3DC
	mov r0, #0x5a
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	ldr r0, _0225BE9C ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0x3c
	bl ov49_0225C3DC
	mov r0, #6
	str r0, [sp]
	mov r0, #0x2c
	str r0, [sp, #4]
	ldr r0, _0225BE9C ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0x3d
	bl ov49_0225C3DC
	mov r0, #0x5a
	str r0, [sp]
	mov r0, #0x2c
	str r0, [sp, #4]
	ldr r0, _0225BE9C ; =0x00010200
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0x3e
	bl ov49_0225C3DC
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225C460
	b _0225BE3A
_0225BE06:
	mov r1, #0
	str r1, [r5]
	mov r0, #8
	str r0, [sp]
	str r1, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #4
	mov r3, #0x30
	str r7, [sp, #8]
	bl ov49_0225C3DC
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225C460
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x30]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r3, [sp, #0x34]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	bl ov49_0225C4CC
_0225BE3A:
	ldr r0, [sp, #0x38]
	bl ov45_0222AAC8
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	ldr r2, [sp, #0x30]
	str r0, [sp, #4]
	ldr r3, [sp, #0x34]
	add r0, r5, #0
	add r1, r6, #0
	bl ov49_0225BFF0
	ldr r0, [sp, #0x2c]
	cmp r0, #1
	bne _0225BE6A
	ldr r0, [sp, #0x38]
	bl ov45_0222A9CC
	cmp r0, #1
	bne _0225BE66
	mov r0, #0x61
	b _0225BE70
_0225BE66:
	mov r0, #0
	b _0225BE70
_0225BE6A:
	ldr r0, [sp, #0x38]
	bl ov45_0222AA5C
_0225BE70:
	ldr r2, [sp, #0x30]
	str r0, [sp]
	ldr r3, [sp, #0x34]
	add r0, r5, #0
	add r1, r6, #0
	bl ov49_0225C180
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x34]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225BEA0
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225BE98: .word 0x00070800
_0225BE9C: .word 0x00010200
	thumb_func_end ov49_0225BBD0

	thumb_func_start ov49_0225BEA0
ov49_0225BEA0: ; 0x0225BEA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r0, [sp, #0x48]
	ldr r6, _0225BF78 ; =ov49_0226978C
	str r0, [sp, #0x48]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, _0225BF7C ; =ov49_022696F8
	add r5, r2, #0
	str r3, [sp, #0x1c]
	str r0, [sp, #0x20]
	mov r4, #2
_0225BEB8:
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x24]
	bl ov45_0222AAEC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	beq _0225BF60
	bl ov45_0222D7C0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	bl sub_020776B4
	str r0, [sp, #0x28]
	add r0, r7, #0
	bl sub_02077678
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	mov r2, #1
	bl GfGfxLoader_LoadFromNarc
	add r1, sp, #0x30
	str r0, [sp, #0x2c]
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, [sp, #0x20]
	mov r1, #6
	ldrh r0, [r0]
	add r3, r1, #0
	add r3, #0xfa
	str r0, [sp]
	ldr r2, [sp, #0x30]
	ldr r0, [r5]
	ldr r2, [r2, #0x14]
	bl BG_LoadCharTilesData
	ldr r0, [sp, #0x2c]
	bl FreeToHeap
	mov r0, #4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	lsl r3, r4, #0x18
	str r6, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #2
	str r0, [sp, #0x18]
	ldr r0, [r5]
	mov r1, #6
	mov r2, #0x1a
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	add r0, r7, #0
	bl sub_0207769C
	mov r1, #4
	add r0, #0xb
	str r1, [sp]
	mov r1, #2
	lsl r0, r0, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsl r3, r4, #0x18
	ldr r0, [r5]
	mov r1, #6
	mov r2, #0x1a
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	ldr r0, [r5]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
_0225BF60:
	ldr r0, [sp, #0x20]
	add r6, #0x10
	add r0, r0, #2
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	add r4, r4, #2
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #2
	blt _0225BEB8
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225BF78: .word ov49_0226978C
_0225BF7C: .word ov49_022696F8
	thumb_func_end ov49_0225BEA0

	thumb_func_start ov49_0225BF80
ov49_0225BF80: ; 0x0225BF80
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5]
	add r4, r2, #0
	cmp r1, #1
	bne _0225BF92
	mov r0, #0
	str r0, [r5]
	b _0225BF98
_0225BF92:
	add r1, r4, #0
	bl ov49_0225C78C
_0225BF98:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225C148
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225C328
	ldr r0, [r4]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225BF80

	thumb_func_start ov49_0225BFC4
ov49_0225BFC4: ; 0x0225BFC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov49_0225C148
	ldr r0, [sp, #0x20]
	add r1, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov49_0225BFF0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225BFC4

	thumb_func_start ov49_0225BFEC
ov49_0225BFEC: ; 0x0225BFEC
	ldr r0, [r0]
	bx lr
	thumb_func_end ov49_0225BFEC

	thumb_func_start ov49_0225BFF0
ov49_0225BFF0: ; 0x0225BFF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r5, r0, #0
	ldr r0, [sp, #0x90]
	add r4, r1, #0
	add r6, r3, #0
	str r2, [sp, #0x2c]
	cmp r0, #0x1b
	blo _0225C006
	bl GF_AssertFail
_0225C006:
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq _0225C010
	bl GF_AssertFail
_0225C010:
	ldr r0, [sp, #0x90]
	mov r1, #3
	bl _u32_div_f
	add r7, r0, #0
	ldr r0, [sp, #0x90]
	mov r1, #3
	bl _u32_div_f
	str r1, [sp, #0x30]
	lsl r0, r7, #1
	str r0, [sp, #0x34]
	mov r1, #0x64
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	str r6, [sp, #8]
	add r1, #0xcc
	ldr r0, [r4, r1]
	add r2, r7, r2
	ldr r1, [sp, #0x2c]
	add r2, #0x3d
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r5, #0x58]
	bl sub_0200ADA4
	cmp r0, #0
	bne _0225C052
	bl GF_AssertFail
_0225C052:
	ldr r0, [r5, #0x58]
	bl sub_0200A740
	mov r1, #0x64
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	add r1, #0xd0
	ldr r0, [r4, r1]
	ldr r1, [sp, #0x2c]
	mov r2, #0x59
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r5, #0x5c]
	bl sub_0200B00C
	cmp r0, #0
	bne _0225C082
	bl GF_AssertFail
_0225C082:
	ldr r0, [r5, #0x5c]
	bl sub_0200A740
	mov r1, #0x64
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	str r6, [sp, #8]
	add r1, #0xd4
	ldr r0, [r4, r1]
	add r2, r7, r2
	ldr r1, [sp, #0x2c]
	add r2, #0x3c
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0x60]
	mov r1, #0x64
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	str r6, [sp, #8]
	add r1, #0xd8
	ldr r0, [r4, r1]
	add r2, r7, r2
	ldr r1, [sp, #0x2c]
	add r2, #0x3b
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0x64]
	mov r0, #0
	add r2, sp, #0x38
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x64
	add r2, r1, #0
	str r1, [sp]
	sub r2, #0x65
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	add r2, r1, #0
	str r0, [sp, #0x10]
	add r2, #0xcc
	ldr r2, [r4, r2]
	add r3, r1, #0
	str r2, [sp, #0x14]
	add r2, r1, #0
	add r2, #0xd0
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	add r2, r1, #0
	add r2, #0xd4
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	add r2, r1, #0
	add r2, #0xd8
	ldr r2, [r4, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x58
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4, #4]
	str r0, [sp, #0x38]
	add r0, sp, #0x58
	str r0, [sp, #0x3c]
	mov r0, #0x10
	str r0, [sp, #0x4c]
	mov r0, #2
	str r0, [sp, #0x50]
	mov r0, #0xd
	lsl r0, r0, #0x10
	str r0, [sp, #0x40]
	mov r0, #0x66
	lsl r0, r0, #0xe
	str r0, [sp, #0x44]
	add r0, sp, #0x38
	str r6, [sp, #0x54]
	bl sub_02024714
	ldr r1, [sp, #0x30]
	str r0, [r5, #0x54]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x54]
	ldr r1, [sp, #0x94]
	bl Set2dSpriteVisibleFlag
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225BFF0

	thumb_func_start ov49_0225C148
ov49_0225C148: ; 0x0225C148
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x54]
	add r4, r1, #0
	bl sub_02024758
	mov r0, #0
	str r0, [r5, #0x54]
	ldr r0, [r5, #0x58]
	bl sub_0200AEB0
	ldr r0, [r5, #0x5c]
	bl sub_0200B0A8
	mov r7, #0x13
	mov r6, #0
	lsl r7, r7, #4
_0225C16A:
	ldr r0, [r4, r7]
	ldr r1, [r5, #0x58]
	bl DestroySingle2DGfxResObj
	add r6, r6, #1
	add r5, r5, #4
	add r4, r4, #4
	cmp r6, #4
	blt _0225C16A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C148

	thumb_func_start ov49_0225C180
ov49_0225C180: ; 0x0225C180
	push {r4, r5, r6, r7, lr}
	sub sp, #0x94
	add r6, r0, #0
	ldr r0, [r6, #0x68]
	add r5, r1, #0
	str r3, [sp, #0x2c]
	ldr r4, [sp, #0xa8]
	cmp r0, #0
	beq _0225C196
	bl GF_AssertFail
_0225C196:
	ldr r1, _0225C324 ; =ov49_0226988C
	mov r0, #0
_0225C19A:
	ldrh r2, [r1]
	cmp r4, r2
	bne _0225C1AA
	ldrh r2, [r1, #2]
	str r2, [sp, #0x34]
	ldrh r2, [r1, #4]
	str r2, [sp, #0x30]
	ldrh r7, [r1, #6]
_0225C1AA:
	add r0, r0, #1
	add r1, #8
	cmp r0, #0x12
	blo _0225C19A
	ldr r0, [sp, #0x34]
	mov r1, #2
	add r2, sp, #0x7c
	bl sub_02070D84
	mov r1, #0x65
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, #0xcb
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x80]
	mov r3, #0
	bl AddCharResObjFromNarc
	str r0, [r6, #0x6c]
	bl sub_0200ADA4
	cmp r0, #0
	bne _0225C1E4
	bl GF_AssertFail
_0225C1E4:
	mov r1, #0x65
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	add r1, #0xcf
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x84]
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r6, #0x70]
	bl sub_0200A828
	bl ov49_0225C368
	ldr r0, [r6, #0x70]
	bl sub_0200B00C
	cmp r0, #0
	bne _0225C21A
	bl GF_AssertFail
_0225C21A:
	ldr r0, [r6, #0x70]
	bl sub_0200A740
	mov r1, #0x65
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, #0xd3
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x88]
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	str r0, [r6, #0x74]
	mov r1, #0x65
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, #0xd7
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x8c]
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	str r0, [r6, #0x78]
	mov r0, #0
	add r2, sp, #0x38
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x65
	add r2, r1, #0
	str r1, [sp]
	sub r2, #0x66
	str r2, [sp, #4]
	str r2, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	mov r2, #3
	str r2, [sp, #0x10]
	add r2, r1, #0
	add r2, #0xcb
	ldr r2, [r5, r2]
	add r3, r1, #0
	str r2, [sp, #0x14]
	add r2, r1, #0
	add r2, #0xcf
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r1, #0
	add r2, #0xd3
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	add r2, r1, #0
	add r2, #0xd7
	ldr r2, [r5, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x58
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #4]
	str r0, [sp, #0x38]
	add r0, sp, #0x58
	str r0, [sp, #0x3c]
	mov r0, #0x20
	str r0, [sp, #0x4c]
	mov r0, #2
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _0225C2D4
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C2E2
_0225C2D4:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C2E2:
	bl _ffix
	str r0, [sp, #0x40]
	cmp r7, #0
	beq _0225C2FE
	lsl r0, r7, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C30C
_0225C2FE:
	lsl r0, r7, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C30C:
	bl _ffix
	mov r1, #1
	lsl r1, r1, #0x14
	add r0, r0, r1
	str r0, [sp, #0x44]
	add r0, sp, #0x38
	bl sub_02024714
	str r0, [r6, #0x68]
	add sp, #0x94
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225C324: .word ov49_0226988C
	thumb_func_end ov49_0225C180

	thumb_func_start ov49_0225C328
ov49_0225C328: ; 0x0225C328
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x68]
	add r4, r1, #0
	bl sub_02024B1C
	bl sub_02021A50
	ldr r0, [r5, #0x68]
	bl sub_02024758
	mov r0, #0
	str r0, [r5, #0x68]
	ldr r0, [r5, #0x6c]
	bl sub_0200AEB0
	ldr r0, [r5, #0x70]
	bl sub_0200B0A8
	mov r7, #0x13
	mov r6, #0
	lsl r7, r7, #4
_0225C354:
	ldr r0, [r4, r7]
	ldr r1, [r5, #0x6c]
	bl DestroySingle2DGfxResObj
	add r6, r6, #1
	add r5, r5, #4
	add r4, r4, #4
	cmp r6, #4
	blt _0225C354
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225C328

	thumb_func_start ov49_0225C368
ov49_0225C368: ; 0x0225C368
	push {r4, r5, r6, r7}
	ldr r1, [r0, #8]
	ldr r4, [r0, #0xc]
	lsr r3, r1, #1
	mov r2, #0
	cmp r3, #0
	ble _0225C3BC
	mov r5, #0xc8
_0225C378:
	ldrh r6, [r4]
	mov r0, #0x1f
	add r2, r2, #1
	add r1, r6, #0
	asr r7, r6, #5
	and r1, r0
	and r0, r7
	asr r7, r6, #0xa
	mov r6, #0x1f
	and r6, r7
	mov r7, #0x1d
	mul r7, r6
	mov r6, #0x4c
	mul r6, r1
	mov r1, #0x97
	mul r1, r0
	add r0, r6, r1
	add r0, r7, r0
	asr r6, r0, #8
	lsl r0, r6, #8
	add r7, r6, #0
	asr r1, r0, #8
	lsl r0, r6, #7
	mul r7, r5
	asr r0, r0, #8
	asr r6, r7, #8
	lsl r0, r0, #0xa
	lsl r6, r6, #5
	orr r0, r6
	orr r0, r1
	strh r0, [r4]
	add r4, r4, #2
	cmp r2, r3
	blt _0225C378
_0225C3BC:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov49_0225C368

	thumb_func_start ov49_0225C3C0
ov49_0225C3C0: ; 0x0225C3C0
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #4
	add r6, r4, #0
_0225C3C8:
	add r0, r5, #0
	add r1, r6, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #5
	blt _0225C3C8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C3C0

	thumb_func_start ov49_0225C3DC
ov49_0225C3DC: ; 0x0225C3DC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r2, #0
	add r0, r1, #0
	mov r1, #1
	add r2, r3, #0
	bl ov49_0225B388
	add r3, sp, #0x10
	add r2, r0, #0
	ldrb r0, [r3, #0x14]
	mov r1, #0
	add r5, r5, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r4, #4
	ldrb r3, [r3, #0x10]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C3DC

	thumb_func_start ov49_0225C414
ov49_0225C414: ; 0x0225C414
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r2, #0
	add r0, r1, #0
	mov r1, #1
	add r2, r3, #0
	bl ov49_0225B388
	add r6, r0, #0
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	sub r3, r1, r0
	bpl _0225C43C
	mov r3, #0
_0225C43C:
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	add r2, r5, #4
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	lsl r0, r4, #4
	add r0, r2, r0
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C414

	thumb_func_start ov49_0225C460
ov49_0225C460: ; 0x0225C460
	ldr r3, _0225C46C ; =ScheduleWindowCopyToVram
	add r2, r0, #4
	lsl r0, r1, #4
	add r0, r2, r0
	bx r3
	nop
_0225C46C: .word ScheduleWindowCopyToVram
	thumb_func_end ov49_0225C460

	thumb_func_start ov49_0225C470
ov49_0225C470: ; 0x0225C470
	ldr r3, _0225C47C ; =ov49_0225B3C8
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0
	bx r3
	nop
_0225C47C: .word ov49_0225B3C8
	thumb_func_end ov49_0225C470

	thumb_func_start ov49_0225C480
ov49_0225C480: ; 0x0225C480
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r0, r6, #0
	add r5, r1, #0
	bl ov45_0222AA84
	add r4, r0, #0
	add r0, r6, #0
	bl ov45_0222AAA8
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_0225B408
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl ov49_0225B418
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C480

	thumb_func_start ov49_0225C4B0
ov49_0225C4B0: ; 0x0225C4B0
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r2, #0
	mov r4, #0
_0225C4B8:
	ldrh r2, [r5]
	add r0, r6, #0
	add r1, r4, #0
	bl ov49_0225B42C
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _0225C4B8
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225C4B0

	thumb_func_start ov49_0225C4CC
ov49_0225C4CC: ; 0x0225C4CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	add r7, r0, #0
	ldr r0, [sp, #0xb0]
	add r5, r1, #0
	str r0, [sp, #0xb0]
	mov r0, #0xd7
	add r1, r3, #0
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	bl NARC_ctor
	str r0, [sp, #0x50]
	ldr r0, [sp, #0xb4]
	bl ov45_0222A99C
	str r0, [sp, #0x44]
	ldr r0, [sp, #0xb4]
	bl ov45_0222A9CC
	str r0, [sp, #0x4c]
	ldr r0, _0225C77C ; =ov49_02269774
	mov r6, #0
	str r0, [sp, #0x40]
	ldr r0, _0225C780 ; =ov49_02269704
	add r4, r7, #0
	str r0, [sp, #0x3c]
	ldr r0, _0225C784 ; =ov49_022696FC
	str r0, [sp, #0x38]
_0225C506:
	cmp r6, #2
	bne _0225C526
	ldr r0, [sp, #0x4c]
	cmp r0, #1
	bne _0225C546
	add r1, r4, #0
	add r1, #0xac
	mov r0, #0
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xec
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xfc
	str r0, [r1]
	b _0225C5EC
_0225C526:
	cmp r6, #3
	bne _0225C546
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	bne _0225C546
	add r1, r4, #0
	add r1, #0xac
	mov r0, #0
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xec
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xfc
	str r0, [r1]
	b _0225C5EC
_0225C546:
	ldr r0, [sp, #0x40]
	ldrh r0, [r0]
	cmp r0, #0xd7
	bne _0225C554
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x34]
	b _0225C558
_0225C554:
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x34]
_0225C558:
	add r0, r6, #0
	add r0, #0x96
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	ldr r2, [sp, #0x40]
	ldrh r0, [r0, #4]
	ldr r1, [sp, #0x34]
	mov r3, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	mov r0, #0x4d
	lsl r0, r0, #2
	ldrh r2, [r2, #2]
	ldr r0, [r5, r0]
	bl AddPlttResObjFromOpenNarc
	add r1, r4, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200B00C
	cmp r0, #0
	bne _0225C596
	bl GF_AssertFail
_0225C596:
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200A740
	add r0, r6, #0
	add r0, #0x96
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x3c]
	str r0, [sp, #8]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x34]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	add r1, r4, #0
	add r1, #0xec
	str r0, [r1]
	add r0, r6, #0
	add r0, #0x96
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x38]
	str r0, [sp, #8]
	mov r0, #0x4f
	lsl r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x34]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	add r1, r4, #0
	add r1, #0xfc
	str r0, [r1]
_0225C5EC:
	ldr r0, [sp, #0x40]
	add r6, r6, #1
	add r0, r0, #6
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	add r4, r4, #4
	add r0, r0, #2
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	add r0, r0, #2
	str r0, [sp, #0x38]
	cmp r6, #4
	bge _0225C608
	b _0225C506
_0225C608:
	ldr r0, _0225C788 ; =ov49_0226991C
	mov r6, #0
	str r0, [sp, #0x48]
_0225C60E:
	ldr r0, [sp, #0xb0]
	add r1, r6, #0
	bl ov45_0222A92C
	add r4, r0, #0
	ldr r0, [sp, #0xb0]
	add r1, r6, #0
	bl ov45_0222A964
	add r1, r0, #0
	cmp r4, #0x18
	bne _0225C632
	add r1, r7, #0
	add r1, #0xbc
	mov r0, #0
	str r0, [r1]
	str r0, [r7, #0x7c]
	b _0225C760
_0225C632:
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x4c]
	add r0, r4, #0
	bl ov49_0225C828
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _0225C648
	ldr r1, [sp, #0x2c]
	b _0225C64A
_0225C648:
	ldr r1, [sp, #0x50]
_0225C64A:
	add r0, r6, #0
	add r0, #0x96
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	mov r3, #0
	str r0, [sp, #8]
	mov r0, #0x13
	lsl r0, r0, #4
	ldrh r2, [r4, #2]
	ldr r0, [r5, r0]
	bl AddCharResObjFromOpenNarc
	add r1, r7, #0
	add r1, #0xbc
	str r0, [r1]
	add r0, r7, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl sub_0200ADA4
	cmp r0, #0
	bne _0225C67E
	bl GF_AssertFail
_0225C67E:
	add r0, r7, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl sub_0200A740
	ldrb r2, [r4]
	mov r0, #0
	mvn r0, r0
	add r2, #0x96
	str r2, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	str r0, [sp, #0x14]
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, #0x96
	str r0, [sp, #0x18]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r3, r2, #0
	str r0, [sp, #0x1c]
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x54
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #4]
	ldr r2, [sp, #0x48]
	str r0, [sp, #0x78]
	add r0, sp, #0x54
	str r0, [sp, #0x7c]
	mov r0, #0
	str r0, [sp, #0x8c]
	mov r0, #2
	str r0, [sp, #0x90]
	ldr r0, [sp, #0x30]
	add r3, sp, #0x80
	str r0, [sp, #0x94]
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0225C708
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C716
_0225C708:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C716:
	bl _ffix
	ldr r1, [sp, #0x80]
	add r0, r1, r0
	str r0, [sp, #0x80]
	mov r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0225C73A
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C748
_0225C73A:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C748:
	bl _ffix
	ldr r1, [sp, #0x84]
	add r0, r1, r0
	str r0, [sp, #0x84]
	add r0, sp, #0x78
	bl sub_02024714
	str r0, [r7, #0x7c]
	ldrb r1, [r4, #1]
	bl sub_02024AA8
_0225C760:
	ldr r0, [sp, #0x48]
	add r6, r6, #1
	add r0, #0xc
	add r7, r7, #4
	str r0, [sp, #0x48]
	cmp r6, #0xc
	bge _0225C770
	b _0225C60E
_0225C770:
	ldr r0, [sp, #0x50]
	bl NARC_dtor
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225C77C: .word ov49_02269774
_0225C780: .word ov49_02269704
_0225C784: .word ov49_022696FC
_0225C788: .word ov49_0226991C
	thumb_func_end ov49_0225C4CC

	thumb_func_start ov49_0225C78C
ov49_0225C78C: ; 0x0225C78C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r7, #0
	add r4, r5, #0
_0225C796:
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	beq _0225C7CC
	ldr r0, [r4, #0x7c]
	bl sub_02024758
	mov r0, #0
	str r0, [r4, #0x7c]
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl sub_0200AEB0
	mov r0, #0x13
	add r1, r4, #0
	lsl r0, r0, #4
	add r1, #0xbc
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl DestroySingle2DGfxResObj
	add r1, r4, #0
	add r1, #0xbc
	mov r0, #0
	str r0, [r1]
_0225C7CC:
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, #0xc
	blt _0225C796
	mov r4, #0
	add r7, r4, #0
_0225C7D8:
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _0225C81C
	bl sub_0200B0A8
	mov r0, #0x4d
	add r1, r5, #0
	lsl r0, r0, #2
	add r1, #0xac
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl DestroySingle2DGfxResObj
	mov r0, #0x4e
	add r1, r5, #0
	lsl r0, r0, #2
	add r1, #0xec
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl DestroySingle2DGfxResObj
	mov r0, #0x4f
	add r1, r5, #0
	lsl r0, r0, #2
	add r1, #0xfc
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl DestroySingle2DGfxResObj
	add r0, r5, #0
	add r0, #0xac
	str r7, [r0]
_0225C81C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225C7D8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C78C

	thumb_func_start ov49_0225C828
ov49_0225C828: ; 0x0225C828
	cmp r1, r2
	bne _0225C834
	ldr r1, _0225C83C ; =ov49_02269764
	lsl r0, r3, #3
	add r0, r1, r0
	bx lr
_0225C834:
	ldr r1, _0225C840 ; =ov49_022699AC
	lsl r0, r0, #3
	add r0, r1, r0
	bx lr
	.balign 4, 0
_0225C83C: .word ov49_02269764
_0225C840: .word ov49_022699AC
	thumb_func_end ov49_0225C828

	thumb_func_start ov49_0225C844
ov49_0225C844: ; 0x0225C844
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r0, [r1]
	ldr r1, [sp, #4]
	str r2, [sp, #8]
	ldr r2, _0225C89C ; =ov49_0226970C
	add r1, #0xc
	add r7, r3, #0
	bl AddWindow
	ldr r4, [sp, #4]
	ldr r5, [sp, #4]
	mov r6, #0
	add r4, #0x2c
_0225C862:
	add r1, r6, #0
	ldr r0, [sp, #8]
	add r1, #0x38
	mov r2, #0
	add r3, r4, #0
	str r7, [sp]
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5, #0x20]
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #3
	blt _0225C862
	ldr r0, _0225C8A0 ; =ov49_022696F4
	ldr r2, _0225C8A4 ; =ov49_0225CB50
	ldr r3, [sp, #4]
	mov r1, #1
	str r7, [sp]
	bl sub_02026C44
	ldr r1, [sp, #4]
	str r0, [r1, #0x1c]
	ldr r0, [sp, #4]
	mov r1, #1
	strh r1, [r0, #6]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225C89C: .word ov49_0226970C
_0225C8A0: .word ov49_022696F4
_0225C8A4: .word ov49_0225CB50
	thumb_func_end ov49_0225C844

	thumb_func_start ov49_0225C8A8
ov49_0225C8A8: ; 0x0225C8A8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x1c]
	bl sub_02026CAC
	add r0, r6, #0
	add r0, #0xc
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_0225C8BE:
	ldr r0, [r5, #0x20]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _0225C8BE
	mov r0, #0
	strb r0, [r6, #2]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C8A8

	thumb_func_start ov49_0225C8D4
ov49_0225C8D4: ; 0x0225C8D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldrh r0, [r5, #6]
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r0, #0
	bne _0225C8F2
	ldr r0, [r5, #0x1c]
	bl sub_02026CC4
	b _0225C8F6
_0225C8F2:
	mov r0, #1
	strb r0, [r5, #3]
_0225C8F6:
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _0225C912
	mov r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0225C912
	strb r2, [r5, #2]
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	str r4, [sp]
	bl ov49_0225CAD4
_0225C912:
	ldrb r1, [r5, #3]
	ldrh r0, [r5, #4]
	cmp r1, r0
	beq _0225C968
	strh r1, [r5, #4]
	ldrb r0, [r5, #3]
	cmp r0, #2
	bne _0225C932
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	add r3, r7, #0
	str r4, [sp]
	bl ov49_0225CAD4
	b _0225C954
_0225C932:
	ldrb r0, [r5, #2]
	cmp r0, #0
	str r4, [sp]
	bne _0225C948
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	add r3, r7, #0
	bl ov49_0225CAD4
	b _0225C954
_0225C948:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #2
	add r3, r7, #0
	bl ov49_0225CAD4
_0225C954:
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0225C968
	ldrb r0, [r5, #3]
	cmp r0, #2
	bne _0225C968
	mov r0, #1
	strb r0, [r5, #2]
	str r0, [sp, #4]
	strh r0, [r5]
_0225C968:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225C8D4

	thumb_func_start ov49_0225C970
ov49_0225C970: ; 0x0225C970
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r6, r1, #0
	ldr r4, [sp, #0x34]
	str r0, [sp, #8]
	ldr r7, [sp, #0x30]
	str r3, [sp, #0x14]
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r2, [r6]
	add r0, r7, #0
	mov r1, #0x37
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	strh r0, [r5, #8]
	ldr r0, [sp, #0x14]
	bl ov45_0222AAC8
	strh r0, [r5, #0xa]
	mov r0, #5
	lsl r0, r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldrh r1, [r5, #0xa]
	ldr r2, [r6]
	add r0, r7, #0
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #5
	lsl r0, r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	ldrh r2, [r5, #0xa]
	add r0, r6, #0
	add r1, r7, #0
	add r2, #0x1b
	mov r3, #6
	bl ov49_0225BB14
	ldr r0, [sp, #0x10]
	mov r1, #1
	mov r2, #0x3f
	bl ov49_0225B388
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #4
	str r0, [sp]
	mov r1, #0
	ldr r0, _0225CA2C ; =0x000F0E00
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	ldr r2, [sp, #0x18]
	str r1, [sp, #0xc]
	add r0, #0xc
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldrb r0, [r5, #2]
	cmp r0, #0
	str r4, [sp]
	bne _0225CA1A
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	add r3, r7, #0
	bl ov49_0225CAD4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0225CA1A:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #2
	add r3, r7, #0
	bl ov49_0225CAD4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225CA2C: .word 0x000F0E00
	thumb_func_end ov49_0225C970

	thumb_func_start ov49_0225CA30
ov49_0225CA30: ; 0x0225CA30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	str r3, [sp, #0x10]
	ldr r4, [sp, #0x28]
	cmp r7, #3
	blo _0225CA46
	bl GF_AssertFail
_0225CA46:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r6]
	mov r1, #0x37
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #1
	strh r0, [r5, #8]
	mov r0, #5
	strh r7, [r5, #0xa]
	lsl r0, r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldrh r1, [r5, #0xa]
	ldr r0, [sp, #0x10]
	ldr r2, [r6]
	add r1, #0x5d
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldrb r0, [r5, #2]
	cmp r0, #0
	str r4, [sp]
	bne _0225CA96
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov49_0225CAD4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0225CA96:
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #2
	bl ov49_0225CAD4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CA30

	thumb_func_start ov49_0225CAA8
ov49_0225CAA8: ; 0x0225CAA8
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #6
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CAA8

	thumb_func_start ov49_0225CAD4
ov49_0225CAD4: ; 0x0225CAD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0x20
	add r4, r1, #0
	add r6, r2, #0
	str r0, [sp]
	mov r1, #0x15
	str r1, [sp, #4]
	lsl r1, r6, #2
	add r1, r5, r1
	ldr r1, [r1, #0x2c]
	add r7, r3, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #3
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r4]
	mov r1, #5
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldrh r0, [r5, #8]
	cmp r0, #1
	bne _0225CB34
	mov r0, #5
	lsl r0, r0, #6
	str r0, [sp]
	ldr r0, [sp, #0x30]
	ldr r2, _0225CB48 ; =ov49_022696EC
	str r0, [sp, #4]
	ldrh r3, [r5, #0xa]
	ldrb r2, [r2, r6]
	add r0, r4, #0
	lsl r3, r3, #1
	add r2, r2, r3
	add r1, r7, #0
	add r2, #0x60
	mov r3, #6
	bl ov49_0225BB14
_0225CB34:
	ldr r3, _0225CB4C ; =ov49_022696F0
	ldr r0, [r4]
	ldrsb r3, [r3, r6]
	mov r1, #6
	mov r2, #3
	bl ScheduleSetBgPosText
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225CB48: .word ov49_022696EC
_0225CB4C: .word ov49_022696F0
	thumb_func_end ov49_0225CAD4

	thumb_func_start ov49_0225CB50
ov49_0225CB50: ; 0x0225CB50
	strb r1, [r2, #3]
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _0225CB5E
	mov r0, #2
	strb r0, [r2, #3]
	bx lr
_0225CB5E:
	cmp r0, #3
	bne _0225CB66
	mov r0, #1
	strb r0, [r2, #3]
_0225CB66:
	bx lr
	thumb_func_end ov49_0225CB50

	thumb_func_start ov49_0225CB68
ov49_0225CB68: ; 0x0225CB68
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225CB68

	thumb_func_start ov49_0225CB70
ov49_0225CB70: ; 0x0225CB70
	mov r1, #0xc3
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225CB70

	thumb_func_start ov49_0225CB78
ov49_0225CB78: ; 0x0225CB78
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x14
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_0225CB8C:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0225CB8C
	add r0, r5, #0
	bl GF_Camera_Create
	str r0, [r4]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r1, _0225CBD0 ; =0x0029AEC1
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r2, _0225CBD4 ; =ov49_02269A6C
	ldr r3, _0225CBD8 ; =0x000005C1
	add r0, #8
	bl GF_Camera_InitFromTargetDistanceAndAngle
	ldr r0, [r4]
	bl GF_Camera_RegisterToStaticPtr
	mov r0, #0x96
	mov r1, #0xe1
	ldr r2, [r4]
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0225CBD0: .word 0x0029AEC1
_0225CBD4: .word ov49_02269A6C
_0225CBD8: .word 0x000005C1
	thumb_func_end ov49_0225CB78

	thumb_func_start ov49_0225CBDC
ov49_0225CBDC: ; 0x0225CBDC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02023148
	ldr r0, [r4]
	bl sub_02023120
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CBDC

	thumb_func_start ov49_0225CBF4
ov49_0225CBF4: ; 0x0225CBF4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225CC18
	add r1, r4, #0
	add r1, #8
	bl ov49_02259154
	mov r0, #2
	ldr r1, [r4, #8]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [r4, #8]
	ldr r1, [r4, #0x10]
	lsl r0, r0, #2
	sub r0, r1, r0
	str r0, [r4, #0x10]
_0225CC18:
	bl sub_02023154
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CBF4

	thumb_func_start ov49_0225CC20
ov49_0225CC20: ; 0x0225CC20
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225CC20

	thumb_func_start ov49_0225CC28
ov49_0225CC28: ; 0x0225CC28
	push {r3, r4}
	mov r4, #2
	lsl r4, r4, #0xe
	add r1, r1, r4
	str r1, [r0, #8]
	lsl r1, r4, #2
	str r2, [r0, #0xc]
	sub r1, r3, r1
	str r1, [r0, #0x10]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225CC28

	thumb_func_start ov49_0225CC40
ov49_0225CC40: ; 0x0225CC40
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov49_0225CC40

	thumb_func_start ov49_0225CC44
ov49_0225CC44: ; 0x0225CC44
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225CC44

	thumb_func_start ov49_0225CC4C
ov49_0225CC4C: ; 0x0225CC4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	add r5, r0, #0
	ldr r1, _0225CCBC ; =0x000004A4
	add r0, r2, #0
	str r2, [sp]
	bl AllocFromHeap
	ldr r2, _0225CCBC ; =0x000004A4
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0xb4
	mul r0, r5
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl AllocFromHeap
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xe4
	add r7, r6, #0
	mul r7, r0
	ldr r0, [sp]
	add r1, r7, #0
	bl AllocFromHeap
	mov r1, #0x12
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r2, [sp, #4]
	mov r1, #0
	bl memset
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	add r2, r7, #0
	bl memset
	mov r0, #0x49
	lsl r0, r0, #2
	strb r5, [r4, r0]
	add r0, r0, #1
	strb r6, [r4, r0]
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CCBC: .word 0x000004A4
	thumb_func_end ov49_0225CC4C

	thumb_func_start ov49_0225CCC0
ov49_0225CCC0: ; 0x0225CCC0
	push {r4, lr}
	mov r1, #0x4a
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0225CCD2
	bl ov49_0225CE88
_0225CCD2:
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CCC0

	thumb_func_start ov49_0225CCF0
ov49_0225CCF0: ; 0x0225CCF0
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x4b
	add r5, r0, #0
	lsl r1, r1, #2
	add r1, r5, r1
	bl ov49_0225D7B8
	mov r0, #0x49
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	ble _0225CD2C
	mov r7, #0x71
	add r6, r4, #0
	lsl r7, r7, #2
_0225CD10:
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, r7
	add r0, r0, r6
	bl ov49_0225DA70
	mov r0, #0x49
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	add r4, r4, #1
	add r6, #0xb4
	cmp r4, r0
	blt _0225CD10
_0225CD2C:
	ldr r0, _0225CD54 ; =0x00000125
	mov r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225CD52
	ldr r7, _0225CD54 ; =0x00000125
	add r4, r6, #0
_0225CD3A:
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, r1, r4
	bl ov49_0225DD68
	ldrb r0, [r5, r7]
	add r6, r6, #1
	add r4, #0xe4
	cmp r6, r0
	blt _0225CD3A
_0225CD52:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225CD54: .word 0x00000125
	thumb_func_end ov49_0225CCF0

	thumb_func_start ov49_0225CD58
ov49_0225CD58: ; 0x0225CD58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bne _0225CD62
	bl GF_AssertFail
_0225CD62:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225CD70
	bl GF_AssertFail
_0225CD70:
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225CD7E
	bl GF_AssertFail
_0225CD7E:
	mov r1, #0x4b
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r5, r1
	bl ov49_0225D804
	ldr r0, _0225CDE4 ; =0x00000125
	mov r4, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225CDB4
	mov r7, #0xa7
	add r6, r4, #0
	lsl r7, r7, #2
_0225CD9A:
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, r7
	add r1, r1, r6
	bl ov49_0225DD0C
	ldr r0, _0225CDE4 ; =0x00000125
	add r4, r4, #1
	ldrb r0, [r5, r0]
	add r6, #0xe4
	cmp r4, r0
	blt _0225CD9A
_0225CDB4:
	mov r0, #0x49
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	ble _0225CDE2
	mov r7, #0x71
	add r6, r4, #0
	lsl r7, r7, #2
_0225CDC6:
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, r7
	add r0, r0, r6
	bl ov49_0225DAFC
	mov r0, #0x49
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	add r4, r4, #1
	add r6, #0xb4
	cmp r4, r0
	blt _0225CDC6
_0225CDE2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225CDE4: .word 0x00000125
	thumb_func_end ov49_0225CD58

	thumb_func_start ov49_0225CDE8
ov49_0225CDE8: ; 0x0225CDE8
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225CDE8

	thumb_func_start ov49_0225CDEC
ov49_0225CDEC: ; 0x0225CDEC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225CE80 ; =0x00000127
	add r7, r3, #0
	strb r2, [r5, r0]
	sub r0, r0, #1
	strb r1, [r5, r0]
	add r0, r1, #0
	add r1, r2, #0
	add r2, r7, #0
	ldr r4, [sp, #0x18]
	bl ov49_0225D4FC
	add r6, r0, #0
	mov r0, #0xcb
	add r1, r7, #0
	bl NARC_ctor
	add r7, r0, #0
	ldr r0, _0225CE84 ; =0x00000494
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	ldr r0, _0225CE84 ; =0x00000494
	add r1, r7, #0
	add r0, r5, r0
	str r0, [sp]
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r6, #0
	add r3, r4, #0
	bl ov49_0225D5FC
	mov r0, #0xa7
	ldr r2, _0225CE84 ; =0x00000494
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r7, #0
	add r2, r5, r2
	add r3, r6, #0
	str r4, [sp]
	bl ov49_0225DC2C
	mov r0, #0x71
	ldr r2, _0225CE84 ; =0x00000494
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r7, #0
	add r2, r5, r2
	add r3, r6, #0
	str r4, [sp]
	bl ov49_0225D854
	add r0, r7, #0
	bl NARC_dtor
	add r0, r6, #0
	bl ov49_0225D520
	mov r1, #0x4b
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r5, r1
	bl ov49_0225D6F0
	mov r0, #0x4a
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CE80: .word 0x00000127
_0225CE84: .word 0x00000494
	thumb_func_end ov49_0225CDEC

	thumb_func_start ov49_0225CE88
ov49_0225CE88: ; 0x0225CE88
	push {r4, lr}
	mov r1, #0x4b
	add r4, r0, #0
	lsl r1, r1, #2
	add r1, r4, r1
	bl ov49_0225D76C
	mov r0, #0x4b
	ldr r1, _0225CECC ; =0x00000494
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r4, r1
	bl ov49_0225D6AC
	mov r0, #0xa7
	ldr r1, _0225CECC ; =0x00000494
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r4, r1
	bl ov49_0225DCBC
	mov r0, #0x71
	ldr r1, _0225CECC ; =0x00000494
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r4, r1
	bl ov49_0225D9D0
	mov r0, #0x4a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_0225CECC: .word 0x00000494
	thumb_func_end ov49_0225CE88

	thumb_func_start ov49_0225CED0
ov49_0225CED0: ; 0x0225CED0
	push {r3, lr}
	mov r2, #7
	add r1, r0, #0
	lsl r2, r2, #6
	ldr r0, [r1, r2]
	cmp r0, #1
	bne _0225CEFA
	add r0, r2, #0
	sub r0, #0xbc
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0225CEFA
	add r0, r2, #0
	mov r3, #1
	sub r0, #0xbc
	str r3, [r1, r0]
	sub r2, #0x24
	add r0, r1, #4
	add r1, r1, r2
	bl sub_020181D4
_0225CEFA:
	pop {r3, pc}
	thumb_func_end ov49_0225CED0

	thumb_func_start ov49_0225CEFC
ov49_0225CEFC: ; 0x0225CEFC
	push {r4, lr}
	mov r1, #7
	add r4, r0, #0
	lsl r1, r1, #6
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0225CF26
	add r0, r1, #0
	sub r0, #0xbc
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225CF26
	sub r1, #0x24
	add r0, r4, #4
	add r1, r4, r1
	bl sub_020181E0
	mov r0, #0x41
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225CF26:
	pop {r4, pc}
	thumb_func_end ov49_0225CEFC

	thumb_func_start ov49_0225CF28
ov49_0225CF28: ; 0x0225CF28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r7, r0, #0
	add r6, r2, #0
	str r3, [sp]
	cmp r5, #2
	ble _0225CF3C
	bl GF_AssertFail
_0225CF3C:
	cmp r6, #3
	ble _0225CF44
	bl GF_AssertFail
_0225CF44:
	add r0, r7, #0
	bl ov49_0225D820
	mov r1, #0x71
	lsl r1, r1, #2
	add r4, r0, #0
	add r2, r7, r1
	lsl r1, r5, #4
	add r0, r4, #4
	add r1, r2, r1
	bl sub_020181B0
	add r0, r4, #4
	mov r1, #1
	bl sub_020182A0
	ldr r1, [sp]
	add r0, r4, #0
	bl ov49_0225CFA8
	add r1, sp, #4
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	bl ov49_0225CFEC
	strb r6, [r4, #1]
	add r0, r4, #0
	strb r5, [r4, #2]
	mov r1, #1
	strb r1, [r4]
	str r1, [r4, #0x7c]
	add r0, #0x84
	str r1, [r0]
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CF28

	thumb_func_start ov49_0225CF94
ov49_0225CF94: ; 0x0225CF94
	push {r4, lr}
	add r4, r0, #0
	add r0, r4, #4
	mov r1, #0
	bl sub_020182A0
	mov r0, #0
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CF94

	thumb_func_start ov49_0225CFA8
ov49_0225CFA8: ; 0x0225CFA8
	push {r4, lr}
	add r3, r0, #0
	add r4, r1, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	add r2, #0x9c
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	add r1, r3, #0
	str r0, [r2]
	add r1, #0x9c
	ldr r2, [r1]
	add r1, r3, #0
	add r1, #0xa8
	ldr r1, [r1]
	add r0, r3, #4
	add r1, r2, r1
	add r2, r3, #0
	add r2, #0xa0
	ldr r4, [r2]
	add r2, r3, #0
	add r2, #0xac
	ldr r2, [r2]
	add r2, r4, r2
	add r4, r3, #0
	add r4, #0xa4
	add r3, #0xb0
	ldr r4, [r4]
	ldr r3, [r3]
	add r3, r4, r3
	bl sub_020182A8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CFA8

	thumb_func_start ov49_0225CFEC
ov49_0225CFEC: ; 0x0225CFEC
	push {r4, lr}
	add r3, r0, #0
	add r4, r1, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	add r2, #0xa8
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	add r1, r3, #0
	str r0, [r2]
	add r1, #0x9c
	ldr r2, [r1]
	add r1, r3, #0
	add r1, #0xa8
	ldr r1, [r1]
	add r0, r3, #4
	add r1, r2, r1
	add r2, r3, #0
	add r2, #0xa0
	ldr r4, [r2]
	add r2, r3, #0
	add r2, #0xac
	ldr r2, [r2]
	add r2, r4, r2
	add r4, r3, #0
	add r4, #0xa4
	add r3, #0xb0
	ldr r4, [r4]
	ldr r3, [r3]
	add r3, r4, r3
	bl sub_020182A8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225CFEC

	thumb_func_start ov49_0225D030
ov49_0225D030: ; 0x0225D030
	push {r3, lr}
	add r3, r1, #0
	add r0, r0, #4
	add r2, r1, #4
	add r3, #8
	bl sub_020182B0
	pop {r3, pc}
	thumb_func_end ov49_0225D030

	thumb_func_start ov49_0225D040
ov49_0225D040: ; 0x0225D040
	ldr r3, _0225D048 ; =sub_020182A0
	add r0, r0, #4
	bx r3
	nop
_0225D048: .word sub_020182A0
	thumb_func_end ov49_0225D040

	thumb_func_start ov49_0225D04C
ov49_0225D04C: ; 0x0225D04C
	add r1, r0, #0
	add r1, #0x80
	ldr r1, [r1]
	cmp r1, #0
	bne _0225D060
	mov r1, #1
	add r0, #0x80
	str r1, [r0]
	add r0, r1, #0
	bx lr
_0225D060:
	mov r0, #0
	bx lr
	thumb_func_end ov49_0225D04C

	thumb_func_start ov49_0225D064
ov49_0225D064: ; 0x0225D064
	add r1, r0, #0
	add r1, #0x88
	ldr r1, [r1]
	cmp r1, #0
	bne _0225D078
	mov r1, #1
	add r0, #0x88
	str r1, [r0]
	add r0, r1, #0
	bx lr
_0225D078:
	mov r0, #0
	bx lr
	thumb_func_end ov49_0225D064

	thumb_func_start ov49_0225D07C
ov49_0225D07C: ; 0x0225D07C
	ldr r3, _0225D084 ; =sub_020182E0
	add r0, r0, #4
	mov r2, #0
	bx r3
	.balign 4, 0
_0225D084: .word sub_020182E0
	thumb_func_end ov49_0225D07C

	thumb_func_start ov49_0225D088
ov49_0225D088: ; 0x0225D088
	add r0, #0x80
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225D088

	thumb_func_start ov49_0225D090
ov49_0225D090: ; 0x0225D090
	add r0, #0x88
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225D090

	thumb_func_start ov49_0225D098
ov49_0225D098: ; 0x0225D098
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl ov49_0225DBF8
	mov r1, #0xa7
	lsl r1, r1, #2
	add r2, r7, r1
	ldr r1, [sp]
	str r0, [sp, #0xc]
	lsl r1, r1, #4
	add r0, r0, #4
	add r1, r2, r1
	bl sub_020181B0
	ldr r5, [sp, #0xc]
	ldr r0, [sp]
	mov r1, #0xc
	mul r1, r0
	mov r0, #0xa7
	lsl r0, r0, #2
	add r0, r7, r0
	str r0, [sp, #0x10]
	ldr r0, [sp]
	mov r6, #0
	lsl r0, r0, #4
	add r4, r7, r1
	add r5, #0x7c
	str r0, [sp, #0x14]
_0225D0D8:
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _0225D0F2
	ldr r3, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	add r1, r3, r1
	ldr r3, _0225D15C ; =0x00000494
	add r3, r7, r3
	bl sub_020180E8
_0225D0F2:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x14
	cmp r6, #3
	blt _0225D0D8
	ldr r0, [sp, #0xc]
	mov r1, #1
	add r0, r0, #4
	bl sub_020182A0
	ldr r0, [sp, #4]
	add r1, sp, #0x18
	lsl r0, r0, #4
	strh r0, [r1]
	ldr r0, [sp, #8]
	mov r3, sp
	lsl r0, r0, #4
	strh r0, [r1, #2]
	ldrh r2, [r1]
	sub r3, r3, #4
	ldr r0, [sp, #0xc]
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_0225D1C4
	ldr r0, [sp, #0xc]
	mov r2, #1
	ldr r1, [sp]
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0x14
	add r0, #0xcc
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	lsl r1, r2, #0xc
	add r0, #0xdc
	str r1, [r0]
	ldr r0, [sp, #0xc]
	mov r1, #0
	add r0, #0xe0
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	mov r1, #0x1f
	add r0, #0xe1
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, #0xe2
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D15C: .word 0x00000494
	thumb_func_end ov49_0225D098

	thumb_func_start ov49_0225D160
ov49_0225D160: ; 0x0225D160
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r1, [sp]
	add r0, r1, #4
	mov r1, #0
	bl sub_020182A0
	mov r0, #0xa7
	ldr r5, [sp]
	lsl r0, r0, #2
	mov r7, #0
	add r0, r6, r0
	add r4, r7, #0
	add r5, #0x7c
	str r0, [sp, #4]
_0225D180:
	ldr r0, [sp]
	ldrh r1, [r0, #2]
	mov r0, #0xc
	mul r0, r1
	add r0, r6, r0
	add r2, r4, r0
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r2, [r2, r0]
	cmp r2, #0
	beq _0225D1A6
	lsl r3, r1, #4
	ldr r1, [sp, #4]
	add r0, r5, #0
	add r1, r1, r3
	ldr r3, _0225D1BC ; =0x00000494
	add r3, r6, r3
	bl sub_020180E8
_0225D1A6:
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x14
	cmp r7, #3
	blt _0225D180
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D1BC: .word 0x00000494
	thumb_func_end ov49_0225D160

	thumb_func_start ov49_0225D1C0
ov49_0225D1C0: ; 0x0225D1C0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end ov49_0225D1C0

	thumb_func_start ov49_0225D1C4
ov49_0225D1C4: ; 0x0225D1C4
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, sp, #0x1c
	add r1, sp, #0
	bl ov49_02258800
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #4
	bl sub_020182A8
	add sp, #0xc
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov49_0225D1C4

	thumb_func_start ov49_0225D1EC
ov49_0225D1EC: ; 0x0225D1EC
	push {r3, lr}
	sub sp, #0x10
	add r0, r0, #4
	add r1, sp, #4
	add r2, sp, #8
	add r3, sp, #0xc
	bl sub_020182B0
	add r0, sp, #4
	add r1, sp, #0
	bl ov49_02258814
	add r0, sp, #0
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	lsl r1, r1, #0x10
	orr r0, r1
	add sp, #0x10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D1EC

	thumb_func_start ov49_0225D214
ov49_0225D214: ; 0x0225D214
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #0
	str r4, [sp]
	bl ov49_0225D224
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225D214

	thumb_func_start ov49_0225D224
ov49_0225D224: ; 0x0225D224
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r2, #0
	str r0, [sp]
	add r4, r1, #0
	add r7, r3, #0
	cmp r5, #3
	blt _0225D238
	bl GF_AssertFail
_0225D238:
	cmp r7, #7
	blt _0225D240
	bl GF_AssertFail
_0225D240:
	ldrh r0, [r4, #2]
	cmp r0, #0x12
	blo _0225D24A
	bl GF_AssertFail
_0225D24A:
	ldrh r0, [r4, #2]
	mov r1, #0xc
	lsl r6, r5, #2
	mul r1, r0
	ldr r0, [sp]
	add r0, r0, r1
	add r1, r0, r6
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225D324
	add r0, r4, #0
	str r0, [sp, #4]
	add r0, #0xb8
	str r0, [sp, #4]
	ldrb r0, [r0, r5]
	cmp r0, #0
	bne _0225D280
	add r2, r4, #0
	mov r1, #0x14
	add r2, #0x7c
	mul r1, r5
	add r0, r4, #4
	add r1, r2, r1
	bl sub_020181D4
_0225D280:
	ldr r0, [sp, #4]
	mov r1, #1
	strb r1, [r0, r5]
	add r0, r4, r5
	add r0, #0xbc
	strb r7, [r0]
	add r0, r4, r6
	ldr r1, [sp, #0x20]
	add r0, #0xd0
	str r1, [r0]
	add r0, r4, #0
	str r0, [sp, #8]
	add r0, #0xcd
	str r0, [sp, #8]
	mov r0, #0
	ldr r1, [sp, #8]
	cmp r7, #6
	strb r0, [r1, r5]
	bhi _0225D310
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225D2B2: ; jump table
	.short _0225D2C0 - _0225D2B2 - 2 ; case 0
	.short _0225D2C0 - _0225D2B2 - 2 ; case 1
	.short _0225D2C0 - _0225D2B2 - 2 ; case 2
	.short _0225D2C8 - _0225D2B2 - 2 ; case 3
	.short _0225D2C8 - _0225D2B2 - 2 ; case 4
	.short _0225D2DE - _0225D2B2 - 2 ; case 5
	.short _0225D2F8 - _0225D2B2 - 2 ; case 6
_0225D2C0:
	add r1, r4, r6
	add r1, #0xc0
	str r0, [r1]
	b _0225D310
_0225D2C8:
	add r1, r4, #0
	mov r0, #0x14
	add r1, #0x7c
	mul r0, r5
	add r0, r1, r0
	bl sub_020181A4
	add r1, r4, r6
	add r1, #0xc0
	str r0, [r1]
	b _0225D310
_0225D2DE:
	add r1, r4, r6
	add r1, #0xc0
	str r0, [r1]
	bl MTRandom
	add r1, r4, #0
	add r1, #0xcc
	ldrb r1, [r1]
	bl _u32_div_f
	ldr r0, [sp, #8]
	strb r1, [r0, r5]
	b _0225D310
_0225D2F8:
	add r1, r4, r6
	add r1, #0xc0
	str r0, [r1]
	bl MTRandom
	add r1, r4, #0
	add r1, #0xcc
	ldrb r1, [r1]
	bl _u32_div_f
	ldr r0, [sp, #8]
	strb r1, [r0, r5]
_0225D310:
	add r1, r4, #0
	mov r0, #0x14
	add r1, #0x7c
	mul r0, r5
	add r0, r1, r0
	add r1, r4, r6
	add r1, #0xc0
	ldr r1, [r1]
	bl sub_02018198
_0225D324:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D224

	thumb_func_start ov49_0225D328
ov49_0225D328: ; 0x0225D328
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	cmp r4, #3
	blt _0225D338
	bl GF_AssertFail
_0225D338:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D342
	bl GF_AssertFail
_0225D342:
	ldrh r1, [r5, #2]
	mov r0, #0xc
	mul r0, r1
	add r1, r6, r0
	lsl r0, r4, #2
	add r1, r1, r0
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225D390
	add r6, r5, #0
	add r6, #0xb8
	ldrb r0, [r6, r4]
	cmp r0, #1
	bne _0225D390
	add r2, r5, #0
	mov r1, #0x14
	add r2, #0x7c
	mul r1, r4
	add r0, r5, #4
	add r1, r2, r1
	bl sub_020181E0
	lsl r2, r4, #2
	mov r0, #0
	add r1, r5, r2
	strb r0, [r6, r4]
	add r1, #0xc0
	str r0, [r1]
	add r1, r5, r4
	add r1, #0xbc
	strb r0, [r1]
	add r1, r5, r4
	add r1, #0xcd
	strb r0, [r1]
	add r1, r5, r2
	add r1, #0xd0
	str r0, [r1]
_0225D390:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D328

	thumb_func_start ov49_0225D394
ov49_0225D394: ; 0x0225D394
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
_0225D39C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225D450
	cmp r0, #1
	bne _0225D3B2
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov49_0225D328
_0225D3B2:
	add r4, r4, #1
	cmp r4, #3
	blt _0225D39C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D394

	thumb_func_start ov49_0225D3BC
ov49_0225D3BC: ; 0x0225D3BC
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	cmp r4, #3
	blt _0225D3CC
	bl GF_AssertFail
_0225D3CC:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D3D6
	bl GF_AssertFail
_0225D3D6:
	ldrh r1, [r5, #2]
	mov r0, #0xc
	mul r0, r1
	add r1, r6, r0
	lsl r0, r4, #2
	add r1, r1, r0
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225D3F4
	add r0, r5, r4
	add r0, #0xb8
	ldrb r0, [r0]
	pop {r4, r5, r6, pc}
_0225D3F4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225D3BC

	thumb_func_start ov49_0225D3F8
ov49_0225D3F8: ; 0x0225D3F8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	add r7, r3, #0
	cmp r4, #3
	blt _0225D40A
	bl GF_AssertFail
_0225D40A:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D414
	bl GF_AssertFail
_0225D414:
	ldrh r1, [r5, #2]
	mov r0, #0xc
	mul r0, r1
	add r1, r6, r0
	lsl r0, r4, #2
	add r1, r1, r0
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0225D42E
	bl GF_AssertFail
_0225D42E:
	add r0, r5, r4
	add r0, #0xbc
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225D44E
	add r2, r5, #0
	mov r0, #0x14
	add r2, #0xc0
	lsl r1, r4, #2
	str r7, [r2, r1]
	add r5, #0x7c
	mul r0, r4
	ldr r1, [r2, r1]
	add r0, r5, r0
	bl sub_02018198
_0225D44E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D3F8

	thumb_func_start ov49_0225D450
ov49_0225D450: ; 0x0225D450
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0225D45E
	bl GF_AssertFail
_0225D45E:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D468
	bl GF_AssertFail
_0225D468:
	add r0, r5, r4
	add r0, #0xb8
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D450

	thumb_func_start ov49_0225D470
ov49_0225D470: ; 0x0225D470
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0225D47E
	bl GF_AssertFail
_0225D47E:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D488
	bl GF_AssertFail
_0225D488:
	lsl r0, r4, #2
	add r0, r5, r0
	add r0, #0xc0
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D470

	thumb_func_start ov49_0225D494
ov49_0225D494: ; 0x0225D494
	ldr r3, _0225D49C ; =sub_020182A0
	add r0, r0, #4
	bx r3
	nop
_0225D49C: .word sub_020182A0
	thumb_func_end ov49_0225D494

	thumb_func_start ov49_0225D4A0
ov49_0225D4A0: ; 0x0225D4A0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrh r0, [r4, #2]
	add r6, r2, #0
	cmp r0, #0x12
	blo _0225D4B2
	bl GF_AssertFail
_0225D4B2:
	ldrh r0, [r4, #2]
	lsl r0, r0, #4
	add r1, r5, r0
	mov r0, #0xa9
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl NNS_G3dMdlSetMdlLightEnableFlagAll
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D4A0

	thumb_func_start ov49_0225D4C8
ov49_0225D4C8: ; 0x0225D4C8
	add r0, #0xdc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225D4C8

	thumb_func_start ov49_0225D4D0
ov49_0225D4D0: ; 0x0225D4D0
	push {r3, r4}
	add r3, r0, #0
	mov r4, #1
	add r3, #0xe0
	strb r4, [r3]
	add r3, r0, #0
	add r3, #0xe1
	strb r1, [r3]
	add r0, #0xe2
	strb r2, [r0]
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_0225D4D0

	thumb_func_start ov49_0225D4E8
ov49_0225D4E8: ; 0x0225D4E8
	mov r1, #0
	add r0, #0xe0
	strb r1, [r0]
	bx lr
	thumb_func_end ov49_0225D4E8

	thumb_func_start ov49_0225D4F0
ov49_0225D4F0: ; 0x0225D4F0
	push {r3, lr}
	add r0, r0, #4
	bl sub_020182C4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D4F0

	thumb_func_start ov49_0225D4FC
ov49_0225D4FC: ; 0x0225D4FC
	push {r3, r4, r5, lr}
	add r5, r2, #0
	lsl r2, r1, #2
	add r1, r1, r2
	add r4, r0, r1
	cmp r4, #0x19
	blo _0225D50E
	bl GF_AssertFail
_0225D50E:
	mov r0, #1
	str r0, [sp]
	mov r0, #0xca
	add r1, r4, #1
	mov r2, #0
	add r3, r5, #0
	bl GfGfxLoader_LoadFromNarc
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D4FC

	thumb_func_start ov49_0225D520
ov49_0225D520: ; 0x0225D520
	ldr r3, _0225D524 ; =FreeToHeap
	bx r3
	.balign 4, 0
_0225D524: .word FreeToHeap
	thumb_func_end ov49_0225D520

	thumb_func_start ov49_0225D528
ov49_0225D528: ; 0x0225D528
	push {r4, lr}
	add r4, r0, #0
	bl ov49_02258830
	ldr r0, [r4]
	bl NNS_G3dGetMdlSet
	str r0, [r4, #4]
	cmp r0, #0
	beq _0225D55C
	add r2, r0, #0
	add r2, #8
	beq _0225D550
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0225D550
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0225D552
_0225D550:
	mov r1, #0
_0225D552:
	cmp r1, #0
	beq _0225D55C
	ldr r1, [r1]
	add r0, r0, r1
	b _0225D55E
_0225D55C:
	mov r0, #0
_0225D55E:
	str r0, [r4, #8]
	ldr r0, [r4]
	bl NNS_G3dGetTex
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl Bind3dModelSet
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D528

	thumb_func_start ov49_0225D574
ov49_0225D574: ; 0x0225D574
	ldr r3, _0225D578 ; =sub_02018068
	bx r3
	.balign 4, 0
_0225D578: .word sub_02018068
	thumb_func_end ov49_0225D574

	thumb_func_start ov49_0225D57C
ov49_0225D57C: ; 0x0225D57C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	bl sub_020181A4
	add r1, r0, #0
	ldr r0, [r5]
	add r0, r0, r4
	cmp r0, r1
	bge _0225D596
	str r0, [r5]
	pop {r3, r4, r5, pc}
_0225D596:
	bl _s32_div_f
	str r1, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D57C

	thumb_func_start ov49_0225D5A0
ov49_0225D5A0: ; 0x0225D5A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	bl sub_020181A4
	ldr r1, [r5]
	add r1, r1, r4
	cmp r1, r0
	bge _0225D5BA
	str r1, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225D5BA:
	mov r1, #2
	lsl r1, r1, #0xa
	sub r0, r0, r1
	str r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D5A0

	thumb_func_start ov49_0225D5C8
ov49_0225D5C8: ; 0x0225D5C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	bl sub_020181A4
	ldr r1, [r5]
	sub r1, r1, r4
	bmi _0225D5DE
	str r1, [r5]
	pop {r3, r4, r5, pc}
_0225D5DE:
	add r0, r0, r1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D5C8

	thumb_func_start ov49_0225D5E4
ov49_0225D5E4: ; 0x0225D5E4
	ldr r1, [r0]
	sub r1, r1, r2
	cmp r1, #0
	ble _0225D5F2
	str r1, [r0]
	mov r0, #0
	bx lr
_0225D5F2:
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225D5E4

	thumb_func_start ov49_0225D5FC
ov49_0225D5FC: ; 0x0225D5FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	mov r7, #6
	ldr r5, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r0, [sp, #0x30]
	mov r6, #0
	add r4, r2, #0
	lsl r7, r7, #6
_0225D616:
	ldr r1, [sp, #0xc]
	ldr r2, [r4, r7]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl ov49_0225D528
	ldr r0, [r5]
	bl ov45_0222D740
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x10
	cmp r6, #2
	blt _0225D616
	ldr r6, [sp, #8]
	ldr r4, [sp, #0x10]
	add r0, r6, #0
	add r5, r6, #0
	str r0, [sp, #0x18]
	add r0, #0x10
	mov r7, #0
	add r5, #0x20
	str r0, [sp, #0x18]
_0225D644:
	mov r0, #6
	ldr r1, [sp, #0x10]
	lsl r0, r0, #6
	ldr r1, [r1, r0]
	add r0, #0xc
	ldr r0, [r4, r0]
	cmp r1, r0
	bne _0225D65E
	add r1, r6, #0
	add r1, #0x84
	mov r0, #0
	str r0, [r1]
	b _0225D69C
_0225D65E:
	add r1, r6, #0
	add r1, #0x84
	mov r0, #1
	str r0, [r1]
	cmp r7, #3
	beq _0225D684
	ldr r0, [sp, #0x14]
	mov r3, #0x63
	str r0, [sp]
	ldr r0, [sp, #0x30]
	lsl r3, r3, #2
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [r4, r3]
	add r0, r5, #0
	bl sub_020180BC
	b _0225D69C
_0225D684:
	ldr r0, [sp, #0x14]
	mov r3, #0x63
	str r0, [sp]
	ldr r0, [sp, #0x30]
	lsl r3, r3, #2
	str r0, [sp, #4]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0xc]
	ldr r3, [r4, r3]
	add r0, r5, #0
	bl sub_020180BC
_0225D69C:
	add r7, r7, #1
	add r4, r4, #4
	add r6, r6, #4
	add r5, #0x14
	cmp r7, #5
	blt _0225D644
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D5FC

	thumb_func_start ov49_0225D6AC
ov49_0225D6AC: ; 0x0225D6AC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r6, #0
	str r1, [sp]
	mov r7, #0
	add r4, r6, #0
	add r5, #0x20
_0225D6BA:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D6D4
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_020180F8
	add r1, r4, #0
	add r1, #0x84
	mov r0, #0
	str r0, [r1]
_0225D6D4:
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x14
	cmp r7, #5
	blt _0225D6BA
	mov r4, #0
_0225D6E0:
	add r0, r6, #0
	bl ov49_0225D574
	add r4, r4, #1
	add r6, #0x10
	cmp r4, #2
	blt _0225D6E0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D6AC

	thumb_func_start ov49_0225D6F0
ov49_0225D6F0: ; 0x0225D6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	mov r0, #1
	add r7, r1, #0
	str r0, [r6]
	mov r0, #0
	str r0, [sp]
	add r4, r7, #0
	add r5, r6, #4
_0225D704:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020181B0
	add r0, r5, #0
	mov r1, #1
	bl sub_020182A0
	ldr r0, [sp]
	add r4, #0x10
	add r0, r0, #1
	add r5, #0x78
	str r0, [sp]
	cmp r0, #2
	blt _0225D704
	add r0, r6, #0
	str r0, [sp, #8]
	add r0, #0x7c
	add r4, r7, #0
	str r0, [sp, #8]
	add r0, r6, #4
	mov r5, #0
	add r4, #0x20
	str r0, [sp, #4]
_0225D734:
	add r0, r7, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r0, #1
	bne _0225D75C
	add r1, r6, #0
	add r1, #0xf4
	mov r0, #1
	str r0, [r1]
	cmp r5, #3
	beq _0225D754
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl sub_020181D4
	b _0225D75C
_0225D754:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl sub_020181D4
_0225D75C:
	add r5, r5, #1
	add r7, r7, #4
	add r6, r6, #4
	add r4, #0x14
	cmp r5, #4
	blt _0225D734
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D6F0

	thumb_func_start ov49_0225D76C
ov49_0225D76C: ; 0x0225D76C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	str r0, [sp]
	add r0, #0x7c
	mov r6, #0
	add r4, r7, #0
	add r5, #0x20
	str r0, [sp]
_0225D77E:
	add r0, r4, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r0, #1
	bne _0225D7A6
	add r1, r4, #0
	add r1, #0xf4
	mov r0, #0
	str r0, [r1]
	cmp r6, #3
	beq _0225D79E
	add r0, r7, #4
	add r1, r5, #0
	bl sub_020181E0
	b _0225D7A6
_0225D79E:
	ldr r0, [sp]
	add r1, r5, #0
	bl sub_020181E0
_0225D7A6:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x14
	cmp r6, #4
	blt _0225D77E
	mov r0, #0
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D76C

	thumb_func_start ov49_0225D7B8
ov49_0225D7B8: ; 0x0225D7B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r4, r1, #0
	mov r0, #0x42
	add r4, #0x20
	lsl r0, r0, #2
	add r6, r5, r0
	add r7, r4, #0
_0225D7CC:
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D7EE
	mov r2, #1
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #0xc
	bl ov49_0225D57C
	mov r1, #0x42
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r7, #0
	bl sub_02018198
_0225D7EE:
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	add r4, #0x14
	add r6, r6, #4
	add r7, #0x14
	str r0, [sp]
	cmp r0, #5
	blt _0225D7CC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D7B8

	thumb_func_start ov49_0225D804
ov49_0225D804: ; 0x0225D804
	push {r3, r4, r5, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _0225D81E
	mov r4, #0
	add r5, r0, #4
_0225D810:
	add r0, r5, #0
	bl sub_020181EC
	add r4, r4, #1
	add r5, #0x78
	cmp r4, #2
	blt _0225D810
_0225D81E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D804

	thumb_func_start ov49_0225D820
ov49_0225D820: ; 0x0225D820
	push {r4, lr}
	mov r1, #0x49
	lsl r1, r1, #2
	ldrb r4, [r0, r1]
	mov r2, #0
	cmp r4, #0
	ble _0225D84A
	sub r1, #8
	ldr r3, [r0, r1]
	add r1, r3, #0
_0225D834:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0225D842
	mov r0, #0xb4
	mul r0, r2
	add r0, r3, r0
	pop {r4, pc}
_0225D842:
	add r2, r2, #1
	add r1, #0xb4
	cmp r2, r4
	blt _0225D834
_0225D84A:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225D820

	thumb_func_start ov49_0225D854
ov49_0225D854: ; 0x0225D854
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #8]
	ldr r0, [sp, #0x58]
	mov r7, #0x4a
	str r0, [sp, #0x58]
	mov r0, #0
	str r0, [sp, #0x40]
	add r0, r3, #0
	str r0, [sp, #0x24]
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x20]
	add r0, #0x20
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r0, [sp, #0x20]
	lsl r7, r7, #2
_0225D878:
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x20]
	mov r6, #0
_0225D87E:
	ldr r1, [sp, #0xc]
	ldr r2, [r4, r7]
	ldr r3, [sp, #0x58]
	add r0, r5, #0
	bl ov49_02258830
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #3
	blt _0225D87E
	ldr r0, [sp, #0x24]
	add r0, #0xc
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r0, #0xc
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, #2
	blt _0225D878
	ldr r4, [sp, #8]
	ldr r6, [sp, #0x14]
	mov r7, #0
	add r5, r4, #0
_0225D8B2:
	mov r0, #0
	mov r1, #0x12
	str r0, [sp]
	lsl r1, r1, #4
	ldr r0, [sp, #0xc]
	ldr r1, [r6, r1]
	ldr r3, [sp, #0x58]
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r4]
	bl NNS_G3dGetMdlSet
	str r0, [r4, #4]
	cmp r0, #0
	beq _0225D8F2
	add r1, r0, #0
	add r1, #8
	beq _0225D8E6
	ldrb r2, [r0, #9]
	cmp r2, #0
	bls _0225D8E6
	ldrh r2, [r0, #0xe]
	add r1, r1, r2
	add r1, r1, #4
	b _0225D8E8
_0225D8E6:
	mov r1, #0
_0225D8E8:
	cmp r1, #0
	beq _0225D8F2
	ldr r1, [r1]
	add r0, r0, r1
	b _0225D8F4
_0225D8F2:
	mov r0, #0
_0225D8F4:
	str r0, [r4, #8]
	ldr r0, [r5, #0x20]
	bl NNS_G3dGetTex
	str r0, [r4, #0xc]
	add r7, r7, #1
	add r6, r6, #4
	add r4, #0x10
	add r5, #0xc
	cmp r7, #2
	blt _0225D8B2
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	ldr r7, [sp, #0x14]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #8]
	str r0, [sp, #0x38]
	add r0, #0x38
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x34]
	ldr r0, [sp, #8]
	str r0, [sp, #0x30]
_0225D924:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x3c]
	ldr r6, [sp, #0x34]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x38]
	ldr r5, [sp, #0x30]
	str r0, [sp, #0x28]
_0225D934:
	mov r0, #5
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #6
	ldr r3, [r1, r0]
	ldr r1, [sp, #0x14]
	sub r0, #0x20
	ldr r0, [r1, r0]
	cmp r0, r3
	beq _0225D988
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	bl sub_020180BC
	ldr r0, [sp, #0x18]
	cmp r0, #1
	blt _0225D988
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	mov r4, #0
	cmp r0, #0
	bls _0225D988
_0225D96A:
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r4, r0
	beq _0225D97C
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl NNS_G3dAnmObjDisableID
_0225D97C:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	add r4, r4, #1
	cmp r4, r0
	blo _0225D96A
_0225D988:
	ldr r0, [sp, #0x2c]
	add r6, r6, #4
	add r0, r0, #4
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	add r5, #0x14
	add r0, #0x14
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _0225D934
	ldr r0, [sp, #0x3c]
	add r7, r7, #4
	add r0, #0x10
	str r0, [sp, #0x3c]
	ldr r0, [sp, #8]
	add r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	add r0, #0x50
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x34]
	add r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x30]
	add r0, #0x50
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #2
	blt _0225D924
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D854

	thumb_func_start ov49_0225D9D0
ov49_0225D9D0: ; 0x0225D9D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	ldr r7, [sp]
	mov r0, #0
	add r6, r1, #0
	str r0, [sp, #8]
	add r7, #0x38
_0225D9E0:
	mov r4, #0
	add r5, r7, #0
_0225D9E4:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020180F8
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #4
	blt _0225D9E4
	ldr r0, [sp, #8]
	add r7, #0x50
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #2
	blt _0225D9E0
	ldr r4, [sp]
	mov r5, #0
_0225DA04:
	ldr r0, [r4]
	bl FreeToHeap
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #2
	blt _0225DA04
	mov r0, #0
	ldr r7, _0225DA68 ; =NNS_GfdDefaultFuncFreeTexVram
	str r0, [sp, #4]
_0225DA18:
	ldr r4, [sp]
	mov r5, #0
_0225DA1C:
	ldr r0, [r4, #0x20]
	bl NNS_G3dGetTex
	add r1, sp, #0x10
	add r2, sp, #0xc
	add r6, r0, #0
	bl NNS_G3dTexReleaseTexKey
	ldr r0, [sp, #0x10]
	ldr r1, [r7]
	blx r1
	ldr r0, [sp, #0xc]
	ldr r1, [r7]
	blx r1
	add r0, r6, #0
	bl NNS_G3dPlttReleasePlttKey
	ldr r1, _0225DA6C ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r1, [r1]
	blx r1
	ldr r0, [r4, #0x20]
	bl FreeToHeap
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _0225DA1C
	ldr r0, [sp]
	add r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #2
	blt _0225DA18
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225DA68: .word NNS_GfdDefaultFuncFreeTexVram
_0225DA6C: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end ov49_0225D9D0

	thumb_func_start ov49_0225DA70
ov49_0225DA70: ; 0x0225DA70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r7, #0
	str r0, [sp]
	add r4, r0, #0
	add r0, r1, #0
	str r1, [sp, #4]
	add r0, #0x38
	add r6, r7, #0
	add r5, #0x8c
	str r0, [sp, #4]
_0225DA88:
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _0225DAEC
	cmp r7, #3
	bhi _0225DAE8
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DA9E: ; jump table
	.short _0225DAA6 - _0225DA9E - 2 ; case 0
	.short _0225DAC0 - _0225DA9E - 2 ; case 1
	.short _0225DAA6 - _0225DA9E - 2 ; case 2
	.short _0225DAC0 - _0225DA9E - 2 ; case 3
_0225DAA6:
	ldr r1, [sp]
	mov r2, #0x50
	ldrb r1, [r1, #2]
	add r0, r5, #0
	mul r2, r1
	ldr r1, [sp, #4]
	add r1, r1, r2
	mov r2, #1
	add r1, r1, r6
	lsl r2, r2, #0xc
	bl ov49_0225D57C
	b _0225DAEC
_0225DAC0:
	ldr r1, [sp]
	mov r2, #0x50
	ldrb r1, [r1, #2]
	add r0, r5, #0
	mul r2, r1
	ldr r1, [sp, #4]
	add r1, r1, r2
	mov r2, #1
	add r1, r1, r6
	lsl r2, r2, #0xc
	bl ov49_0225D5A0
	cmp r0, #1
	bne _0225DAEC
	mov r0, #0
	add r1, r4, #0
	str r0, [r4, #0x7c]
	add r1, #0x8c
	str r0, [r1]
	b _0225DAEC
_0225DAE8:
	bl GF_AssertFail
_0225DAEC:
	add r7, r7, #1
	add r4, r4, #4
	add r6, #0x14
	add r5, r5, #4
	cmp r7, #4
	blt _0225DA88
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225DA70

	thumb_func_start ov49_0225DAFC
ov49_0225DAFC: ; 0x0225DAFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5]
	str r1, [sp]
	cmp r0, #0
	beq _0225DBF2
	ldrb r0, [r5, #2]
	lsl r1, r0, #4
	ldr r0, [sp]
	add r0, r0, r1
	add r1, r5, #4
	bl ov49_022588A0
	cmp r0, #0
	beq _0225DBF2
	ldrb r0, [r5, #1]
	cmp r0, #3
	blo _0225DB26
	bl GF_AssertFail
_0225DB26:
	ldrb r0, [r5, #2]
	cmp r0, #2
	blo _0225DB30
	bl GF_AssertFail
_0225DB30:
	ldrb r1, [r5, #2]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	add r1, r0, r2
	ldrb r0, [r5, #1]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	bl NNS_G3dGetTex
	ldrb r1, [r5, #2]
	lsl r2, r1, #4
	ldr r1, [sp]
	add r1, r1, r2
	str r0, [r1, #0xc]
	ldrb r0, [r5, #2]
	lsl r1, r0, #4
	ldr r0, [sp]
	add r1, r0, r1
	ldr r0, [r1, #4]
	ldr r1, [r1, #0xc]
	bl NNS_G3dBindMdlSet
	cmp r0, #0
	bne _0225DB6A
	bl GF_AssertFail
_0225DB6A:
	ldr r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r6, r5, #0
	add r4, r0, #0
	add r7, #0x38
_0225DB76:
	ldr r0, [r6, #0x7c]
	cmp r0, #0
	beq _0225DBA0
	ldrb r2, [r5, #2]
	mov r1, #0x50
	add r0, r5, #4
	mul r1, r2
	add r1, r7, r1
	add r1, r1, r4
	bl sub_020181D4
	ldrb r1, [r5, #2]
	mov r0, #0x50
	mul r0, r1
	add r1, r6, #0
	add r1, #0x8c
	add r0, r7, r0
	ldr r1, [r1]
	add r0, r0, r4
	bl sub_02018198
_0225DBA0:
	ldr r0, [sp, #4]
	add r6, r6, #4
	add r0, r0, #1
	add r4, #0x14
	str r0, [sp, #4]
	cmp r0, #4
	blt _0225DB76
	add r0, r5, #4
	bl sub_020181EC
	ldr r0, [sp]
	mov r7, #0
	str r0, [sp, #8]
	add r0, #0x38
	add r6, r5, #0
	add r4, r7, #0
	str r0, [sp, #8]
_0225DBC2:
	ldr r0, [r6, #0x7c]
	cmp r0, #0
	beq _0225DBDA
	ldrb r1, [r5, #2]
	mov r2, #0x50
	add r0, r5, #4
	mul r2, r1
	ldr r1, [sp, #8]
	add r1, r1, r2
	add r1, r1, r4
	bl sub_020181E0
_0225DBDA:
	add r7, r7, #1
	add r6, r6, #4
	add r4, #0x14
	cmp r7, #4
	blt _0225DBC2
	ldrb r0, [r5, #2]
	lsl r1, r0, #4
	ldr r0, [sp]
	add r0, r0, r1
	ldr r0, [r0, #4]
	bl NNS_G3dReleaseMdlSet
_0225DBF2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225DAFC

	thumb_func_start ov49_0225DBF8
ov49_0225DBF8: ; 0x0225DBF8
	push {r4, lr}
	ldr r3, _0225DC28 ; =0x00000125
	mov r1, #0
	ldrb r2, [r0, r3]
	cmp r2, #0
	ble _0225DC20
	sub r3, r3, #5
	ldr r4, [r0, r3]
	add r3, r4, #0
_0225DC0A:
	ldrh r0, [r3]
	cmp r0, #0
	bne _0225DC18
	mov r0, #0xe4
	mul r0, r1
	add r0, r4, r0
	pop {r4, pc}
_0225DC18:
	add r1, r1, #1
	add r3, #0xe4
	cmp r1, r2
	blt _0225DC0A
_0225DC20:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225DC28: .word 0x00000125
	thumb_func_end ov49_0225DBF8

	thumb_func_start ov49_0225DC2C
ov49_0225DC2C: ; 0x0225DC2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r7, r3, #0
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r7, [sp, #0x10]
	str r0, [sp, #0xc]
_0225DC44:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [r7]
	ldr r3, [sp, #0x30]
	bl ov49_0225D528
	ldr r0, [sp, #0x14]
	cmp r0, #0xb
	beq _0225DC62
	cmp r0, #0xc
	beq _0225DC62
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222D740
_0225DC62:
	ldr r4, [sp, #0x10]
	ldr r5, [sp, #0xc]
	mov r6, #0
_0225DC68:
	ldr r1, [r4, #0x48]
	ldr r0, [r7]
	cmp r0, r1
	beq _0225DC86
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0x30]
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc
	mov r1, #0x12
	lsl r1, r1, #4
	str r0, [r5, r1]
	b _0225DC8E
_0225DC86:
	mov r0, #0x12
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_0225DC8E:
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #3
	blt _0225DC68
	ldr r0, [sp, #4]
	add r7, r7, #4
	add r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0x12
	blt _0225DC44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225DC2C

	thumb_func_start ov49_0225DCBC
ov49_0225DCBC: ; 0x0225DCBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	mov r7, #0x12
	str r0, [sp, #4]
	mov r6, #0
	lsl r7, r7, #4
_0225DCD0:
	ldr r5, [sp]
	mov r4, #0
_0225DCD4:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0225DCE4
	bl FreeToHeap
	mov r0, #0x12
	lsl r0, r0, #4
	str r6, [r5, r0]
_0225DCE4:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _0225DCD4
	ldr r0, [sp, #4]
	bl ov49_0225D574
	ldr r0, [sp]
	add r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #0x12
	blt _0225DCD0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225DCBC

	thumb_func_start ov49_0225DD0C
ov49_0225DD0C: ; 0x0225DD0C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225DD64
	ldrh r0, [r4, #2]
	add r1, r4, #4
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov49_022588A0
	cmp r0, #0
	beq _0225DD64
	add r0, r4, #0
	add r0, #0xe0
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225DD44
	ldrh r0, [r4, #2]
	add r1, r4, #0
	add r1, #0xe1
	lsl r0, r0, #4
	add r0, r5, r0
	ldrb r1, [r1]
	ldr r0, [r0, #8]
	bl NNS_G3dMdlSetMdlAlphaAll
_0225DD44:
	add r0, r4, #4
	bl sub_020181EC
	add r0, r4, #0
	add r0, #0xe0
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225DD64
	ldrh r0, [r4, #2]
	add r4, #0xe2
	ldrb r1, [r4]
	lsl r0, r0, #4
	add r0, r5, r0
	ldr r0, [r0, #8]
	bl NNS_G3dMdlSetMdlAlphaAll
_0225DD64:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225DD0C

	thumb_func_start ov49_0225DD68
ov49_0225DD68: ; 0x0225DD68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #0xc]
	add r0, #0x7c
	add r7, r4, #0
	mov r5, #0
	str r0, [sp, #0xc]
	add r7, #0xc0
	add r6, r4, #0
	str r0, [sp, #8]
_0225DD82:
	add r0, r4, r5
	add r0, #0xb8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225DDEE
	add r0, r4, r5
	add r0, #0xbc
	ldrb r0, [r0]
	cmp r0, #6
	bhi _0225DDEE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DDA2: ; jump table
	.short _0225DDB0 - _0225DDA2 - 2 ; case 0
	.short _0225DDCC - _0225DDA2 - 2 ; case 1
	.short _0225DEFC - _0225DDA2 - 2 ; case 2
	.short _0225DE12 - _0225DDA2 - 2 ; case 3
	.short _0225DE2E - _0225DDA2 - 2 ; case 4
	.short _0225DE72 - _0225DDA2 - 2 ; case 5
	.short _0225DEC8 - _0225DDA2 - 2 ; case 6
_0225DDB0:
	add r2, r4, #0
	add r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r7, #0
	bl ov49_0225D57C
	add r1, r6, #0
	add r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl sub_02018198
	b _0225DEFC
_0225DDCC:
	add r2, r4, #0
	add r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r7, #0
	bl ov49_0225D5A0
	add r1, r6, #0
	add r1, #0xc0
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl sub_02018198
	ldr r0, [sp, #0x14]
	cmp r0, #1
	beq _0225DDF0
_0225DDEE:
	b _0225DEFC
_0225DDF0:
	add r0, r6, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [sp]
	add r2, r5, #0
	bl ov49_0225D328
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0225DEFC
	ldr r0, [sp]
	ldr r2, [sp, #0x10]
	add r1, r4, #0
	blx r2
	b _0225DEFC
_0225DE12:
	add r2, r4, #0
	add r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r7, #0
	bl ov49_0225D5C8
	add r1, r6, #0
	add r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl sub_02018198
	b _0225DEFC
_0225DE2E:
	add r2, r4, #0
	add r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r7, #0
	bl ov49_0225D5E4
	add r1, r6, #0
	add r1, #0xc0
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl sub_02018198
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225DEFC
	add r0, r6, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp]
	add r2, r5, #0
	bl ov49_0225D328
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0225DEFC
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r4, #0
	blx r2
	b _0225DEFC
_0225DE72:
	add r0, r4, r5
	add r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225DE8C
	add r0, r4, r5
	add r0, #0xcd
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, r5
	add r0, #0xcd
	strb r1, [r0]
	b _0225DEFC
_0225DE8C:
	add r2, r4, #0
	add r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r7, #0
	bl ov49_0225D5A0
	cmp r0, #1
	bne _0225DEBA
	bl MTRandom
	add r1, r4, #0
	add r1, #0xcc
	ldrb r1, [r1]
	bl _u32_div_f
	add r0, r4, r5
	add r0, #0xcd
	strb r1, [r0]
	add r1, r6, #0
	add r1, #0xc0
	mov r0, #0
	str r0, [r1]
_0225DEBA:
	add r1, r6, #0
	add r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl sub_02018198
	b _0225DEFC
_0225DEC8:
	add r0, r4, r5
	add r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225DEE2
	add r0, r4, r5
	add r0, #0xcd
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, r5
	add r0, #0xcd
	strb r1, [r0]
	b _0225DEFC
_0225DEE2:
	add r2, r4, #0
	add r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r7, #0
	bl ov49_0225D57C
	add r1, r6, #0
	add r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl sub_02018198
_0225DEFC:
	ldr r0, [sp, #0xc]
	add r5, r5, #1
	add r0, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r7, r7, #4
	add r0, #0x14
	add r6, r6, #4
	str r0, [sp, #8]
	cmp r5, #3
	bge _0225DF14
	b _0225DD82
_0225DF14:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225DD68

	thumb_func_start ov49_0225DF18
ov49_0225DF18: ; 0x0225DF18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r6, r1, #0
	add r5, r0, #0
	ldr r1, _0225E284 ; =0x00000614
	add r0, r3, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	ldr r2, _0225E284 ; =0x00000614
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x61
	str r7, [r4]
	lsl r0, r0, #4
	strb r5, [r4, r0]
	add r0, r0, #1
	strb r6, [r4, r0]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0x48]
	mov r0, #9
	mov r1, #0x80
	bl ov49_0225CC4C
	str r0, [r4, #4]
	ldr r0, [sp, #0x48]
	ldr r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r4, #4]
	add r1, r6, #0
	add r2, r5, #0
	bl ov49_0225CDEC
	mov r0, #0
	ldr r5, _0225E288 ; =ov49_02269AAC
	str r0, [sp, #0xc]
_0225DF66:
	mov r0, #0
	str r0, [sp]
	ldrh r1, [r5]
	str r0, [sp, #8]
	add r2, sp, #0x1c
	ldr r0, [r4]
	add r2, #2
	add r3, sp, #0x1c
	bl ov49_022589D8
	cmp r0, #1
	beq _0225DF80
	b _0225E234
_0225DF80:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	str r0, [sp, #0x10]
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	str r0, [sp, #0x14]
	ldr r0, _0225E28C ; =0x000004E8
	mov r7, sp
	add r0, r4, r0
	str r0, [sp, #0x18]
	sub r7, r7, #4
	add r6, sp, #0x1c
_0225DF9C:
	ldrh r1, [r5, #2]
	ldrh r2, [r6, #2]
	ldrh r3, [r6]
	ldr r0, [r4, #4]
	bl ov49_0225D098
	ldr r1, _0225E290 ; =0x00000612
	ldrb r1, [r4, r1]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #8]
	ldrh r0, [r5, #2]
	cmp r0, #0x10
	bls _0225DFBA
	b _0225E20E
_0225DFBA:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DFC6: ; jump table
	.short _0225E014 - _0225DFC6 - 2 ; case 0
	.short _0225E20E - _0225DFC6 - 2 ; case 1
	.short _0225E20E - _0225DFC6 - 2 ; case 2
	.short _0225E20E - _0225DFC6 - 2 ; case 3
	.short _0225E20E - _0225DFC6 - 2 ; case 4
	.short _0225E20E - _0225DFC6 - 2 ; case 5
	.short _0225DFE8 - _0225DFC6 - 2 ; case 6
	.short _0225DFE8 - _0225DFC6 - 2 ; case 7
	.short _0225DFE8 - _0225DFC6 - 2 ; case 8
	.short _0225E20E - _0225DFC6 - 2 ; case 9
	.short _0225E052 - _0225DFC6 - 2 ; case 10
	.short _0225E07E - _0225DFC6 - 2 ; case 11
	.short _0225E07E - _0225DFC6 - 2 ; case 12
	.short _0225E094 - _0225DFC6 - 2 ; case 13
	.short _0225E0F2 - _0225DFC6 - 2 ; case 14
	.short _0225E150 - _0225DFC6 - 2 ; case 15
	.short _0225E18C - _0225DFC6 - 2 ; case 16
_0225DFE8:
	ldr r1, _0225E290 ; =0x00000612
	mov r2, #0
	ldrb r1, [r4, r1]
	ldr r0, [r4, #4]
	add r3, r2, #0
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r0, _0225E290 ; =0x00000612
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r2, [r0, #8]
	ldrh r0, [r5, #2]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x85
	lsl r0, r0, #2
	str r2, [r1, r0]
	b _0225E20E
_0225E014:
	ldr r1, _0225E290 ; =0x00000612
	mov r2, #0
	ldrb r1, [r4, r1]
	ldr r0, [r4, #4]
	add r3, r2, #0
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r1, _0225E290 ; =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	mov r2, #1
	mov r3, #0
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r1, _0225E290 ; =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	mov r2, #2
	mov r3, #0
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	b _0225E20E
_0225E052:
	ldr r1, _0225E290 ; =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	mov r2, #0
	mov r3, #2
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r0, _0225E290 ; =0x00000612
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r2, [r0, #8]
	ldrh r0, [r5]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x45
	lsl r0, r0, #2
	str r2, [r1, r0]
	b _0225E20E
_0225E07E:
	ldr r1, _0225E290 ; =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	mov r2, #0
	mov r3, #2
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	b _0225E20E
_0225E094:
	ldr r0, _0225E294 ; =0x00000608
	mov r1, #0xc
	ldrb r0, [r4, r0]
	mul r1, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	ldr r1, _0225E290 ; =0x00000612
	ldrb r1, [r4, r1]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225EB00
	ldr r0, _0225E294 ; =0x00000608
	ldrb r0, [r4, r0]
	add r1, r0, #1
	ldr r0, _0225E294 ; =0x00000608
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E0C2
	bl GF_AssertFail
_0225E0C2:
	ldr r0, _0225E290 ; =0x00000612
	mov r1, #0
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	ldrh r1, [r5]
	ldr r0, _0225E298 ; =0x0000FFA4
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bls _0225E0E2
	b _0225E20E
_0225E0E2:
	ldr r0, _0225E290 ; =0x00000612
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225EE4C
	b _0225E20E
_0225E0F2:
	ldr r0, _0225E29C ; =0x00000609
	mov r1, #0xc
	ldrb r0, [r4, r0]
	mul r1, r0
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	ldr r1, _0225E290 ; =0x00000612
	ldrb r1, [r4, r1]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225EB00
	ldr r0, _0225E29C ; =0x00000609
	ldrb r0, [r4, r0]
	add r1, r0, #1
	ldr r0, _0225E29C ; =0x00000609
	strb r1, [r4, r0]
	sub r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E122
	bl GF_AssertFail
_0225E122:
	ldr r0, _0225E290 ; =0x00000612
	mov r1, #0
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	ldrh r1, [r5]
	ldr r0, _0225E298 ; =0x0000FFA4
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _0225E20E
	ldr r0, _0225E290 ; =0x00000612
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225EE4C
	b _0225E20E
_0225E150:
	ldr r0, _0225E290 ; =0x00000612
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r2, [r0, #8]
	ldr r0, _0225E2A0 ; =0x0000060A
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0225E2A4 ; =0x00000488
	str r2, [r1, r0]
	ldr r0, _0225E2A0 ; =0x0000060A
	ldrb r0, [r4, r0]
	add r1, r0, #1
	ldr r0, _0225E2A0 ; =0x0000060A
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E17A
	bl GF_AssertFail
_0225E17A:
	ldr r0, _0225E290 ; =0x00000612
	mov r1, #0
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	b _0225E20E
_0225E18C:
	ldr r0, _0225E2A8 ; =0x0000060B
	mov r1, #0xc
	ldrb r0, [r4, r0]
	mul r1, r0
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	ldr r1, _0225E290 ; =0x00000612
	ldrb r1, [r4, r1]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225EB00
	ldr r0, _0225E2A8 ; =0x0000060B
	ldrb r0, [r4, r0]
	add r1, r0, #1
	ldr r0, _0225E2A8 ; =0x0000060B
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E1BA
	bl GF_AssertFail
_0225E1BA:
	ldr r0, _0225E290 ; =0x00000612
	mov r1, #0
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	ldr r0, _0225E290 ; =0x00000612
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D1EC
	strh r0, [r6, #4]
	lsr r0, r0, #0x10
	strh r0, [r6, #6]
	ldrh r0, [r6, #4]
	strh r0, [r6, #8]
	ldrh r0, [r6, #6]
	strh r0, [r6, #0xa]
	mov r0, #8
	ldrsh r0, [r6, r0]
	add r0, #8
	strh r0, [r6, #8]
	mov r0, #0xa
	ldrsh r0, [r6, r0]
	add r0, #0x14
	strh r0, [r6, #0xa]
	ldr r0, _0225E290 ; =0x00000612
	ldrh r1, [r6, #8]
	ldrb r0, [r4, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	strh r1, [r7]
	ldrh r1, [r6, #0xa]
	strh r1, [r7, #2]
	ldr r1, [r7]
	bl ov49_0225D1C4
_0225E20E:
	ldr r0, _0225E290 ; =0x00000612
	add r2, sp, #0x1c
	ldrb r0, [r4, r0]
	add r2, #2
	add r3, sp, #0x1c
	add r1, r0, #1
	ldr r0, _0225E290 ; =0x00000612
	strb r1, [r4, r0]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp]
	str r0, [sp, #8]
	ldrh r1, [r5]
	ldr r0, [r4]
	bl ov49_022589D8
	cmp r0, #1
	bne _0225E234
	b _0225DF9C
_0225E234:
	ldr r0, [sp, #0xc]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x23
	bhs _0225E242
	b _0225DF66
_0225E242:
	mov r0, #0xa
	mov r7, #0
	lsl r0, r0, #0xe
	ldr r6, _0225E2AC ; =ov49_02269A88
	str r7, [sp, #0x28]
	str r0, [sp, #0x30]
	str r7, [sp, #0x2c]
	add r5, r4, #0
_0225E252:
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	ldr r0, [r4, #4]
	add r3, sp, #0x28
	bl ov49_0225CF28
	mov r1, #0x82
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov49_0225D040
	add r7, r7, #1
	add r6, r6, #4
	add r5, r5, #4
	cmp r7, #9
	blt _0225E252
	ldr r0, _0225E2B0 ; =0x00000613
	mov r1, #9
	strb r1, [r4, r0]
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E284: .word 0x00000614
_0225E288: .word ov49_02269AAC
_0225E28C: .word 0x000004E8
_0225E290: .word 0x00000612
_0225E294: .word 0x00000608
_0225E298: .word 0x0000FFA4
_0225E29C: .word 0x00000609
_0225E2A0: .word 0x0000060A
_0225E2A4: .word 0x00000488
_0225E2A8: .word 0x0000060B
_0225E2AC: .word ov49_02269A88
_0225E2B0: .word 0x00000613
	thumb_func_end ov49_0225DF18

	thumb_func_start ov49_0225E2B4
ov49_0225E2B4: ; 0x0225E2B4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225E310 ; =0x00000613
	mov r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E2DA
	ldr r7, _0225E310 ; =0x00000613
	add r4, r5, #0
_0225E2C6:
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225CF94
	ldrb r0, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0225E2C6
_0225E2DA:
	ldr r0, _0225E314 ; =0x00000612
	mov r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E2FA
	ldr r7, _0225E314 ; =0x00000612
	add r4, r5, #0
_0225E2E8:
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	bl ov49_0225D160
	ldrb r0, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0225E2E8
_0225E2FA:
	ldr r0, [r5, #4]
	bl ov49_0225CE88
	ldr r0, [r5, #4]
	bl ov49_0225CCC0
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E310: .word 0x00000613
_0225E314: .word 0x00000612
	thumb_func_end ov49_0225E2B4

	thumb_func_start ov49_0225E318
ov49_0225E318: ; 0x0225E318
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225E390 ; =0x00000608
	mov r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E340
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r7, _0225E390 ; =0x00000608
	add r4, r5, r0
_0225E32E:
	ldr r1, [r5, #4]
	add r0, r4, #0
	bl ov49_0225EB08
	ldrb r0, [r5, r7]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _0225E32E
_0225E340:
	ldr r0, _0225E394 ; =0x00000609
	mov r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E364
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r7, _0225E394 ; =0x00000609
	add r4, r5, r0
_0225E352:
	ldr r1, [r5, #4]
	add r0, r4, #0
	bl ov49_0225ECF0
	ldrb r0, [r5, r7]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _0225E352
_0225E364:
	ldr r0, _0225E398 ; =0x0000060B
	mov r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E386
	ldr r0, _0225E39C ; =0x000004E8
	ldr r7, _0225E398 ; =0x0000060B
	add r4, r5, r0
_0225E374:
	ldr r1, [r5, #4]
	add r0, r4, #0
	bl ov49_0225ED98
	ldrb r0, [r5, r7]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _0225E374
_0225E386:
	ldr r0, [r5, #4]
	bl ov49_0225CCF0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E390: .word 0x00000608
_0225E394: .word 0x00000609
_0225E398: .word 0x0000060B
_0225E39C: .word 0x000004E8
	thumb_func_end ov49_0225E318

	thumb_func_start ov49_0225E3A0
ov49_0225E3A0: ; 0x0225E3A0
	ldr r3, _0225E3A8 ; =ov49_0225CD58
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E3A8: .word ov49_0225CD58
	thumb_func_end ov49_0225E3A0

	thumb_func_start ov49_0225E3AC
ov49_0225E3AC: ; 0x0225E3AC
	ldr r3, _0225E3B4 ; =ov49_0225CDE8
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E3B4: .word ov49_0225CDE8
	thumb_func_end ov49_0225E3AC

	thumb_func_start ov49_0225E3B8
ov49_0225E3B8: ; 0x0225E3B8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0225E3F0 ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	add r6, r2, #0
	cmp r0, r4
	bhi _0225E3CE
	bl GF_AssertFail
_0225E3CE:
	mov r0, #0xa
	lsl r0, r0, #0xe
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #4]
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	str r6, [sp]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	bl ov49_0225CFA8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0225E3F0: .word 0x00000613
	thumb_func_end ov49_0225E3B8

	thumb_func_start ov49_0225E3F4
ov49_0225E3F4: ; 0x0225E3F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0225E41C ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	add r6, r2, #0
	cmp r0, r4
	bhi _0225E408
	bl GF_AssertFail
_0225E408:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl ov49_0225CFEC
	pop {r4, r5, r6, pc}
	nop
_0225E41C: .word 0x00000613
	thumb_func_end ov49_0225E3F4

	thumb_func_start ov49_0225E420
ov49_0225E420: ; 0x0225E420
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225E470 ; =0x00000613
	add r6, r1, #0
	ldrb r0, [r5, r0]
	add r7, r2, #0
	add r4, r3, #0
	cmp r0, r6
	bhi _0225E436
	bl GF_AssertFail
_0225E436:
	cmp r7, #3
	blo _0225E43E
	bl GF_AssertFail
_0225E43E:
	lsl r0, r6, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r4, #0
	bl ov49_0225D030
	ldr r1, _0225E474 ; =ov49_02269A7C
	lsl r0, r7, #2
	ldrsh r1, [r1, r0]
	ldr r2, [r4]
	lsl r1, r1, #0xc
	add r1, r2, r1
	str r1, [r4]
	ldr r1, _0225E478 ; =ov49_02269A7E
	ldr r2, [r4, #8]
	ldrsh r0, [r1, r0]
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [r4, #8]
	mov r0, #0xa
	lsl r0, r0, #0xe
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E470: .word 0x00000613
_0225E474: .word ov49_02269A7C
_0225E478: .word ov49_02269A7E
	thumb_func_end ov49_0225E420

	thumb_func_start ov49_0225E47C
ov49_0225E47C: ; 0x0225E47C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225E4A0 ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E48E
	bl GF_AssertFail
_0225E48E:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D04C
	pop {r3, r4, r5, pc}
	nop
_0225E4A0: .word 0x00000613
	thumb_func_end ov49_0225E47C

	thumb_func_start ov49_0225E4A4
ov49_0225E4A4: ; 0x0225E4A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225E4C8 ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E4B6
	bl GF_AssertFail
_0225E4B6:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D064
	pop {r3, r4, r5, pc}
	nop
_0225E4C8: .word 0x00000613
	thumb_func_end ov49_0225E4A4

	thumb_func_start ov49_0225E4CC
ov49_0225E4CC: ; 0x0225E4CC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0225E4F4 ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	add r6, r2, #0
	cmp r0, r4
	bhi _0225E4E0
	bl GF_AssertFail
_0225E4E0:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl ov49_0225D040
	pop {r4, r5, r6, pc}
	nop
_0225E4F4: .word 0x00000613
	thumb_func_end ov49_0225E4CC

	thumb_func_start ov49_0225E4F8
ov49_0225E4F8: ; 0x0225E4F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0225E520 ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	add r6, r2, #0
	cmp r0, r4
	bhi _0225E50C
	bl GF_AssertFail
_0225E50C:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl ov49_0225D07C
	pop {r4, r5, r6, pc}
	nop
_0225E520: .word 0x00000613
	thumb_func_end ov49_0225E4F8

	thumb_func_start ov49_0225E524
ov49_0225E524: ; 0x0225E524
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225E548 ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E536
	bl GF_AssertFail
_0225E536:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D088
	pop {r3, r4, r5, pc}
	nop
_0225E548: .word 0x00000613
	thumb_func_end ov49_0225E524

	thumb_func_start ov49_0225E54C
ov49_0225E54C: ; 0x0225E54C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225E570 ; =0x00000613
	add r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E55E
	bl GF_AssertFail
_0225E55E:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D090
	pop {r3, r4, r5, pc}
	nop
_0225E570: .word 0x00000613
	thumb_func_end ov49_0225E54C

	thumb_func_start ov49_0225E574
ov49_0225E574: ; 0x0225E574
	ldr r3, _0225E57C ; =ov49_0225CED0
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E57C: .word ov49_0225CED0
	thumb_func_end ov49_0225E574

	thumb_func_start ov49_0225E580
ov49_0225E580: ; 0x0225E580
	ldr r3, _0225E588 ; =ov49_0225CEFC
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E588: .word ov49_0225CEFC
	thumb_func_end ov49_0225E580

	thumb_func_start ov49_0225E58C
ov49_0225E58C: ; 0x0225E58C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0225E61C ; =0x00000612
	str r1, [sp]
	ldrb r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _0225E616
	ldr r1, [sp]
	sub r0, r2, #1
	sub r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	add r4, r5, #0
	str r1, [sp, #4]
	lsr r7, r0, #0x18
_0225E5B0:
	ldr r0, [r4, #8]
	ldr r1, [sp, #4]
	add r2, r7, #0
	bl ov49_0225E9D0
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	ldr r1, [sp]
	add r2, r7, #0
	bl ov49_0225E9D0
	ldr r1, [sp, #8]
	cmp r1, #1
	beq _0225E5D0
	cmp r0, #1
	bne _0225E60A
_0225E5D0:
	ldr r0, [r4, #8]
	bl ov49_0225D1C0
	cmp r0, #4
	bhi _0225E60A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E5E6: ; jump table
	.short _0225E60A - _0225E5E6 - 2 ; case 0
	.short _0225E5F0 - _0225E5E6 - 2 ; case 1
	.short _0225E5F0 - _0225E5E6 - 2 ; case 2
	.short _0225E5F0 - _0225E5E6 - 2 ; case 3
	.short _0225E5F0 - _0225E5E6 - 2 ; case 4
_0225E5F0:
	ldr r0, _0225E620 ; =0x00000611
	ldrb r0, [r5, r0]
	cmp r0, #4
	bne _0225E602
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl ov49_0225EAB4
	b _0225E60A
_0225E602:
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl ov49_0225EA70
_0225E60A:
	ldr r0, _0225E61C ; =0x00000612
	add r6, r6, #1
	ldrb r0, [r5, r0]
	add r4, r4, #4
	cmp r6, r0
	blt _0225E5B0
_0225E616:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225E61C: .word 0x00000612
_0225E620: .word 0x00000611
	thumb_func_end ov49_0225E58C

	thumb_func_start ov49_0225E624
ov49_0225E624: ; 0x0225E624
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225E6DC ; =0x00000612
	add r7, r1, #0
	ldrb r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _0225E6DA
	add r4, r5, #0
_0225E636:
	ldr r0, [r4, #8]
	bl ov49_0225D1C0
	cmp r0, #4
	bhi _0225E656
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225E64C: ; jump table
	.short _0225E6CE - _0225E64C - 2 ; case 0
	.short _0225E65C - _0225E64C - 2 ; case 1
	.short _0225E65C - _0225E64C - 2 ; case 2
	.short _0225E65C - _0225E64C - 2 ; case 3
	.short _0225E65C - _0225E64C - 2 ; case 4
_0225E656:
	cmp r0, #0xf
	beq _0225E66C
	b _0225E6CE
_0225E65C:
	cmp r7, #1
	bne _0225E6CE
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #1
	bl ov49_0225D4A0
	b _0225E6CE
_0225E66C:
	cmp r7, #1
	bne _0225E6A8
	mov r1, #2
	ldr r0, [r4, #8]
	lsl r1, r1, #0xa
	bl ov49_0225D4C8
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #0
	mov r3, #6
	bl ov49_0225D214
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #1
	mov r3, #6
	bl ov49_0225D214
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #2
	mov r3, #6
	bl ov49_0225D214
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov49_0225D494
	b _0225E6CE
_0225E6A8:
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #0
	bl ov49_0225D328
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #1
	bl ov49_0225D328
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #2
	bl ov49_0225D328
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov49_0225D494
_0225E6CE:
	ldr r0, _0225E6DC ; =0x00000612
	add r6, r6, #1
	ldrb r0, [r5, r0]
	add r4, r4, #4
	cmp r6, r0
	blt _0225E636
_0225E6DA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E6DC: .word 0x00000612
	thumb_func_end ov49_0225E624

	thumb_func_start ov49_0225E6E0
ov49_0225E6E0: ; 0x0225E6E0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0225E70C ; =0x0000060B
	add r7, r1, #0
	ldrb r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	ble _0225E708
	ldr r0, _0225E710 ; =0x000004E8
	add r5, r6, r0
_0225E6F4:
	add r0, r5, #0
	add r1, r7, #0
	bl ov49_0225ECD4
	ldr r0, _0225E70C ; =0x0000060B
	add r4, r4, #1
	ldrb r0, [r6, r0]
	add r5, #0xc
	cmp r4, r0
	blt _0225E6F4
_0225E708:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E70C: .word 0x0000060B
_0225E710: .word 0x000004E8
	thumb_func_end ov49_0225E6E0

	thumb_func_start ov49_0225E714
ov49_0225E714: ; 0x0225E714
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225E75C ; =0x00000612
	mov r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E75A
	ldr r7, _0225E75C ; =0x00000612
	add r4, r5, #0
_0225E726:
	ldr r0, [r4, #8]
	bl ov49_0225D1C0
	cmp r0, #4
	bhi _0225E750
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E73C: ; jump table
	.short _0225E750 - _0225E73C - 2 ; case 0
	.short _0225E746 - _0225E73C - 2 ; case 1
	.short _0225E746 - _0225E73C - 2 ; case 2
	.short _0225E746 - _0225E73C - 2 ; case 3
	.short _0225E746 - _0225E73C - 2 ; case 4
_0225E746:
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	mov r2, #1
	bl ov49_0225D4A0
_0225E750:
	ldrb r0, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0225E726
_0225E75A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E75C: .word 0x00000612
	thumb_func_end ov49_0225E714

	thumb_func_start ov49_0225E760
ov49_0225E760: ; 0x0225E760
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0225E818 ; =0x00000612
	add r7, r1, #0
	ldrb r0, [r4, r0]
	mov r6, #0
	cmp r0, #0
	ble _0225E816
	add r5, r4, #0
_0225E772:
	ldr r0, [r5, #8]
	bl ov49_0225D1C0
	cmp r0, #0xb
	beq _0225E780
	cmp r0, #0xc
	bne _0225E80A
_0225E780:
	cmp r7, #3
	bhi _0225E80A
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E790: ; jump table
	.short _0225E798 - _0225E790 - 2 ; case 0
	.short _0225E7AE - _0225E790 - 2 ; case 1
	.short _0225E7C8 - _0225E790 - 2 ; case 2
	.short _0225E7EC - _0225E790 - 2 ; case 3
_0225E798:
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	mov r2, #0
	mov r3, #2
	bl ov49_0225D214
	mov r0, #0x91
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225E80A
_0225E7AE:
	ldr r0, _0225E81C ; =ov49_0225EA10
	mov r2, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	mov r3, #1
	bl ov49_0225D224
	mov r0, #0x91
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225E80A
_0225E7C8:
	ldr r0, _0225E820 ; =ov49_0225EA40
	mov r2, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	mov r3, #4
	bl ov49_0225D224
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	mov r2, #1
	bl ov49_0225D328
	mov r0, #0x91
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225E80A
_0225E7EC:
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	mov r2, #1
	mov r3, #0
	bl ov49_0225D214
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	mov r2, #0
	bl ov49_0225D328
	mov r0, #0x91
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225E80A:
	ldr r0, _0225E818 ; =0x00000612
	add r6, r6, #1
	ldrb r0, [r4, r0]
	add r5, r5, #4
	cmp r6, r0
	blt _0225E772
_0225E816:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E818: .word 0x00000612
_0225E81C: .word ov49_0225EA10
_0225E820: .word ov49_0225EA40
	thumb_func_end ov49_0225E760

	thumb_func_start ov49_0225E824
ov49_0225E824: ; 0x0225E824
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225E824

	thumb_func_start ov49_0225E82C
ov49_0225E82C: ; 0x0225E82C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225E858 ; =0x00000608
	add r6, r1, #0
	ldrb r0, [r5, r0]
	add r7, r2, #0
	mov r4, #0
	cmp r0, #0
	ble _0225E854
_0225E83E:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov49_0225E85C
	ldr r0, _0225E858 ; =0x00000608
	add r4, r4, #1
	ldrb r0, [r5, r0]
	cmp r4, r0
	blt _0225E83E
_0225E854:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E858: .word 0x00000608
	thumb_func_end ov49_0225E82C

	thumb_func_start ov49_0225E85C
ov49_0225E85C: ; 0x0225E85C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0225E890 ; =0x00000608
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _0225E88C
	mov r0, #0x92
	lsl r0, r0, #2
	add r5, r4, r0
	mov r0, #0xc
	mul r0, r1
	cmp r2, #0
	beq _0225E882
	ldr r1, [r4, #4]
	add r0, r5, r0
	add r2, r3, #0
	bl ov49_0225EB54
	b _0225E888
_0225E882:
	add r0, r5, r0
	bl ov49_0225EB84
_0225E888:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E88C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E890: .word 0x00000608
	thumb_func_end ov49_0225E85C

	thumb_func_start ov49_0225E894
ov49_0225E894: ; 0x0225E894
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0225E8C0 ; =0x00000609
	add r7, r1, #0
	ldrb r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	ble _0225E8BE
	mov r0, #0xda
	lsl r0, r0, #2
	add r5, r6, r0
_0225E8AA:
	add r0, r5, #0
	add r1, r7, #0
	bl ov49_0225ECD4
	ldr r0, _0225E8C0 ; =0x00000609
	add r4, r4, #1
	ldrb r0, [r6, r0]
	add r5, #0xc
	cmp r4, r0
	blt _0225E8AA
_0225E8BE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E8C0: .word 0x00000609
	thumb_func_end ov49_0225E894

	thumb_func_start ov49_0225E8C4
ov49_0225E8C4: ; 0x0225E8C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	lsl r0, r1, #2
	add r1, r5, r0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r6, [r1, r0]
	add r0, #0xc
	ldr r7, [r1, r0]
	ldr r0, [sp, #0x18]
	add r4, r2, #0
	cmp r0, #1
	beq _0225E8E2
	cmp r3, #1
	bne _0225E992
_0225E8E2:
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225D450
	cmp r0, #0
	bne _0225E8FA
	ldr r0, [r5, #4]
	add r1, r6, #0
	mov r2, #1
	mov r3, #0
	bl ov49_0225D214
_0225E8FA:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225E938
	add r0, r4, #4
	lsl r1, r0, #2
	beq _0225E918
	lsl r0, r0, #0xe
	bl _ffltu
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225E926
_0225E918:
	lsl r0, r0, #0xe
	bl _ffltu
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225E926:
	bl _ffix
	add r3, r0, #0
	ldr r0, [r5, #4]
	add r1, r7, #0
	mov r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
_0225E938:
	ldr r0, _0225E9CC ; =0x0000060C
	mov r1, #0x1c
	ldr r0, [r5, r0]
	add r0, r0, #1
	bl _u32_div_f
	ldr r0, _0225E9CC ; =0x0000060C
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0xe
	bhs _0225E984
	lsl r0, r4, #2
	beq _0225E964
	lsl r0, r4, #0xe
	bl _ffltu
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225E972
_0225E964:
	lsl r0, r4, #0xe
	bl _ffltu
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225E972:
	bl _ffix
	add r3, r0, #0
	ldr r0, [r5, #4]
	add r1, r7, #0
	mov r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
_0225E984:
	mov r2, #0
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r3, r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
_0225E992:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	ldr r0, [r5, #4]
	beq _0225E9B4
	add r1, r6, #0
	bl ov49_0225D394
	ldr r0, [r5, #4]
	add r1, r7, #0
	bl ov49_0225D394
	ldr r0, [r5, #4]
	add r1, r6, #0
	mov r2, #1
	bl ov49_0225D4A0
	pop {r3, r4, r5, r6, r7, pc}
_0225E9B4:
	add r1, r6, #0
	mov r2, #1
	bl ov49_0225D328
	mov r2, #0
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r3, r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E9CC: .word 0x0000060C
	thumb_func_end ov49_0225E8C4

	thumb_func_start ov49_0225E9D0
ov49_0225E9D0: ; 0x0225E9D0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	lsl r1, r2, #0x14
	asr r4, r1, #0x10
	bl ov49_0225D1EC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	mov r0, #4
	ldrsh r2, [r1, r0]
	lsl r0, r5, #0x14
	asr r0, r0, #0x10
	cmp r2, r0
	bne _0225EA08
	mov r0, #6
	ldrsh r0, [r1, r0]
	cmp r0, r4
	bne _0225EA08
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225EA08:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225E9D0

	thumb_func_start ov49_0225EA10
ov49_0225EA10: ; 0x0225EA10
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl ov49_0225D1C0
	add r4, r0, #0
	cmp r4, #0xb
	beq _0225EA2A
	cmp r4, #0xc
	beq _0225EA2A
	bl GF_AssertFail
_0225EA2A:
	sub r4, #0xb
	cmp r4, #1
	bhi _0225EA3C
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	mov r3, #0
	bl ov49_0225D214
_0225EA3C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EA10

	thumb_func_start ov49_0225EA40
ov49_0225EA40: ; 0x0225EA40
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl ov49_0225D1C0
	add r4, r0, #0
	cmp r4, #0xb
	beq _0225EA5A
	cmp r4, #0xc
	beq _0225EA5A
	bl GF_AssertFail
_0225EA5A:
	sub r4, #0xb
	cmp r4, #1
	bhi _0225EA6C
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	mov r3, #2
	bl ov49_0225D214
_0225EA6C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EA40

	thumb_func_start ov49_0225EA70
ov49_0225EA70: ; 0x0225EA70
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	ldr r0, [r6, #4]
	add r2, r4, #0
	add r5, r1, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225EA88
	mov r4, #1
	b _0225EA9A
_0225EA88:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225D470
	mov r1, #2
	lsl r1, r1, #0xc
	cmp r0, r1
	ble _0225EA9A
	mov r4, #1
_0225EA9A:
	cmp r4, #1
	bne _0225EAAC
	add r0, r6, #0
	add r1, r5, #0
	bl ov49_0225EAE0
	ldr r0, _0225EAB0 ; =0x000005BC
	bl PlaySE
_0225EAAC:
	pop {r4, r5, r6, pc}
	nop
_0225EAB0: .word 0x000005BC
	thumb_func_end ov49_0225EA70

	thumb_func_start ov49_0225EAB4
ov49_0225EAB4: ; 0x0225EAB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	ldr r0, [r5, #4]
	add r2, r4, #0
	add r6, r1, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225EACA
	mov r4, #1
_0225EACA:
	cmp r4, #1
	bne _0225EADE
	add r0, r5, #0
	add r1, r6, #0
	bl ov49_0225EAE0
	mov r0, #0x17
	lsl r0, r0, #6
	bl PlaySE
_0225EADE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225EAB4

	thumb_func_start ov49_0225EAE0
ov49_0225EAE0: ; 0x0225EAE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	mov r7, #1
_0225EAEA:
	ldr r0, [r5, #4]
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov49_0225D214
	add r4, r4, #1
	cmp r4, #3
	blt _0225EAEA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EAE0

	thumb_func_start ov49_0225EB00
ov49_0225EB00: ; 0x0225EB00
	str r1, [r0]
	mov r1, #0
	strh r1, [r0, #4]
	bx lr
	thumb_func_end ov49_0225EB00

	thumb_func_start ov49_0225EB08
ov49_0225EB08: ; 0x0225EB08
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r2, [r4, #4]
	add r5, r1, #0
	cmp r2, #4
	bhi _0225EB52
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225EB20: ; jump table
	.short _0225EB52 - _0225EB20 - 2 ; case 0
	.short _0225EB2A - _0225EB20 - 2 ; case 1
	.short _0225EB52 - _0225EB20 - 2 ; case 2
	.short _0225EB34 - _0225EB20 - 2 ; case 3
	.short _0225EB3E - _0225EB20 - 2 ; case 4
_0225EB2A:
	bl ov49_0225EBA8
	mov r0, #2
	strh r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0225EB34:
	bl ov49_0225EC28
	mov r0, #4
	strh r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0225EB3E:
	bl ov49_0225EC30
	cmp r0, #1
	bne _0225EB52
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_0225EBE4
	mov r0, #0
	strh r0, [r4, #4]
_0225EB52:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225EB08

	thumb_func_start ov49_0225EB54
ov49_0225EB54: ; 0x0225EB54
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	ldrh r2, [r5, #4]
	ldr r3, _0225EB80 ; =0x0000FFFF
	add r6, r2, r3
	lsl r6, r6, #0x10
	lsr r6, r6, #0x10
	cmp r6, #1
	bls _0225EB7E
	sub r3, r3, #2
	add r2, r2, r3
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r2, #1
	bhi _0225EB78
	bl ov49_0225EBE4
_0225EB78:
	mov r0, #1
	strh r0, [r5, #4]
	str r4, [r5, #8]
_0225EB7E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225EB80: .word 0x0000FFFF
	thumb_func_end ov49_0225EB54

	thumb_func_start ov49_0225EB84
ov49_0225EB84: ; 0x0225EB84
	ldrh r2, [r0, #4]
	ldr r1, _0225EBA4 ; =0x0000FFFD
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bls _0225EBA0
	cmp r2, #1
	bhi _0225EB9C
	mov r1, #0
	strh r1, [r0, #4]
	bx lr
_0225EB9C:
	mov r1, #3
	strh r1, [r0, #4]
_0225EBA0:
	bx lr
	nop
_0225EBA4: .word 0x0000FFFD
	thumb_func_end ov49_0225EB84

	thumb_func_start ov49_0225EBA8
ov49_0225EBA8: ; 0x0225EBA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov49_0225D4C8
	mov r2, #0
	ldr r1, [r5]
	add r0, r4, #0
	add r3, r2, #0
	bl ov49_0225D214
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0
	bl ov49_0225D214
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #2
	mov r3, #0
	bl ov49_0225D214
	ldr r0, [r5]
	mov r1, #1
	bl ov49_0225D494
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225EBA8

	thumb_func_start ov49_0225EBE4
ov49_0225EBE4: ; 0x0225EBE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225D328
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #1
	bl ov49_0225D328
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #2
	bl ov49_0225D328
	ldr r0, [r5]
	mov r1, #0
	bl ov49_0225D494
	ldr r0, [r5]
	bl ov49_0225D4E8
	mov r1, #1
	lsl r1, r1, #0xc
	ldr r0, [r5]
	add r2, r1, #0
	add r3, r1, #0
	bl ov49_0225D4F0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EBE4

	thumb_func_start ov49_0225EC28
ov49_0225EC28: ; 0x0225EC28
	mov r1, #0
	strh r1, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225EC28

	thumb_func_start ov49_0225EC30
ov49_0225EC30: ; 0x0225EC30
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #6
	ldrsh r1, [r4, r0]
	cmp r1, #0xa
	bge _0225ECCC
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #8]
	lsl r0, r0, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #0xa
	lsl r1, r1, #0xc
	bl FX_Div
	add r2, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4]
	add r1, r2, r1
	bl ov49_0225D4C8
	mov r0, #6
	ldrsh r1, [r4, r0]
	mov r0, #0x1f
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	mov r2, #0x1f
	sub r1, r2, r0
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl ov49_0225D4D0
	mov r0, #6
	ldrsh r0, [r4, r0]
	ldr r2, _0225ECD0 ; =0x000002E1
	mov r3, #0
	lsl r0, r0, #0xc
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #0xa
	lsl r1, r1, #0xc
	bl FX_Div
	mov r3, #1
	add r5, r0, #0
	lsl r3, r3, #0xc
	add r1, r5, r3
	ldr r0, [r4]
	add r2, r1, #0
	add r3, r5, r3
	bl ov49_0225D4F0
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225ECCC:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225ECD0: .word 0x000002E1
	thumb_func_end ov49_0225EC30

	thumb_func_start ov49_0225ECD4
ov49_0225ECD4: ; 0x0225ECD4
	ldrh r3, [r0, #4]
	ldr r2, _0225ECEC ; =0x0000FFFF
	add r2, r3, r2
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r2, #1
	bls _0225ECE8
	mov r2, #1
	strh r2, [r0, #4]
	str r1, [r0, #8]
_0225ECE8:
	bx lr
	nop
_0225ECEC: .word 0x0000FFFF
	thumb_func_end ov49_0225ECD4

	thumb_func_start ov49_0225ECF0
ov49_0225ECF0: ; 0x0225ECF0
	push {r4, lr}
	add r4, r0, #0
	ldrh r2, [r4, #4]
	cmp r2, #4
	bhi _0225ED62
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225ED06: ; jump table
	.short _0225ED66 - _0225ED06 - 2 ; case 0
	.short _0225ED10 - _0225ED06 - 2 ; case 1
	.short _0225ED1A - _0225ED06 - 2 ; case 2
	.short _0225ED2E - _0225ED06 - 2 ; case 3
	.short _0225ED38 - _0225ED06 - 2 ; case 4
_0225ED10:
	bl ov49_0225ED68
	mov r0, #2
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED1A:
	add r0, r1, #0
	ldr r1, [r4]
	mov r2, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225ED66
	mov r0, #3
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED2E:
	bl ov49_0225EC28
	mov r0, #4
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED38:
	bl ov49_0225EC30
	cmp r0, #1
	bne _0225ED66
	ldr r0, [r4]
	mov r1, #0
	bl ov49_0225D494
	ldr r0, [r4]
	bl ov49_0225D4E8
	mov r1, #1
	lsl r1, r1, #0xc
	ldr r0, [r4]
	add r2, r1, #0
	add r3, r1, #0
	bl ov49_0225D4F0
	mov r0, #0
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED62:
	bl GF_AssertFail
_0225ED66:
	pop {r4, pc}
	thumb_func_end ov49_0225ECF0

	thumb_func_start ov49_0225ED68
ov49_0225ED68: ; 0x0225ED68
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov49_0225D4C8
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #0
	mov r3, #1
	bl ov49_0225D214
	mov r2, #1
	ldr r1, [r5]
	add r0, r4, #0
	add r3, r2, #0
	bl ov49_0225D214
	ldr r0, [r5]
	mov r1, #1
	bl ov49_0225D494
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225ED68

	thumb_func_start ov49_0225ED98
ov49_0225ED98: ; 0x0225ED98
	push {r4, lr}
	add r4, r0, #0
	ldrh r2, [r4, #4]
	cmp r2, #4
	bhi _0225EE0A
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225EDAE: ; jump table
	.short _0225EE0E - _0225EDAE - 2 ; case 0
	.short _0225EDB8 - _0225EDAE - 2 ; case 1
	.short _0225EDC2 - _0225EDAE - 2 ; case 2
	.short _0225EDD6 - _0225EDAE - 2 ; case 3
	.short _0225EDE0 - _0225EDAE - 2 ; case 4
_0225EDB8:
	bl ov49_0225EE10
	mov r0, #2
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EDC2:
	add r0, r1, #0
	ldr r1, [r4]
	mov r2, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225EE0E
	mov r0, #3
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EDD6:
	bl ov49_0225EC28
	mov r0, #4
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EDE0:
	bl ov49_0225EC30
	cmp r0, #1
	bne _0225EE0E
	ldr r0, [r4]
	mov r1, #0
	bl ov49_0225D494
	ldr r0, [r4]
	bl ov49_0225D4E8
	mov r1, #1
	lsl r1, r1, #0xc
	ldr r0, [r4]
	add r2, r1, #0
	add r3, r1, #0
	bl ov49_0225D4F0
	mov r0, #0
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EE0A:
	bl GF_AssertFail
_0225EE0E:
	pop {r4, pc}
	thumb_func_end ov49_0225ED98

	thumb_func_start ov49_0225EE10
ov49_0225EE10: ; 0x0225EE10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov49_0225D4C8
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #0
	mov r3, #1
	bl ov49_0225D214
	mov r2, #1
	ldr r1, [r5]
	add r0, r4, #0
	add r3, r2, #0
	bl ov49_0225D214
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #2
	mov r3, #1
	bl ov49_0225D214
	ldr r0, [r5]
	mov r1, #1
	bl ov49_0225D494
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225EE10

	thumb_func_start ov49_0225EE4C
ov49_0225EE4C: ; 0x0225EE4C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x5c
	beq _0225EE60
	cmp r4, #0x5d
	beq _0225EE60
	bl GF_AssertFail
_0225EE60:
	add r0, r5, #0
	bl ov49_0225D1EC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	sub r4, #0x5c
	lsl r2, r4, #2
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	mov r0, #4
	ldrsh r3, [r1, r0]
	ldr r0, _0225EEA8 ; =ov49_02269A74
	ldr r0, [r0, r2]
	add r0, r3, r0
	strh r0, [r1, #4]
	mov r0, #6
	ldrsh r0, [r1, r0]
	mov r3, sp
	sub r3, r3, #4
	sub r0, #0xa
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_0225D1C4
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0225EEA8: .word ov49_02269A74
	thumb_func_end ov49_0225EE4C

	thumb_func_start ov49_0225EEAC
ov49_0225EEAC: ; 0x0225EEAC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0xbf
	add r4, r0, #0
	add r0, r6, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0xbf
	mov r1, #0
	lsl r2, r2, #2
	add r7, r0, #0
	bl memset
	str r6, [r7]
	add r5, r7, #0
	str r4, [r7, #4]
	mov r4, #0
	add r5, #8
_0225EED2:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov49_0225F068
	add r4, r4, #1
	add r5, #0x24
	cmp r4, #0x14
	blt _0225EED2
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	add r2, r6, #0
	bl ov49_0225F068
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EEAC

	thumb_func_start ov49_0225EEF8
ov49_0225EEF8: ; 0x0225EEF8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #8
_0225EF02:
	add r0, r5, #0
	bl ov49_0225F074
	add r4, r4, #1
	add r5, #0x24
	cmp r4, #0x14
	blt _0225EF02
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r6, r0
	bl ov49_0225F074
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EEF8

	thumb_func_start ov49_0225EF24
ov49_0225EF24: ; 0x0225EF24
	ldr r3, _0225EF2C ; =ov49_0225F018
	mov r1, #0
	bx r3
	nop
_0225EF2C: .word ov49_0225F018
	thumb_func_end ov49_0225EF24

	thumb_func_start ov49_0225EF30
ov49_0225EF30: ; 0x0225EF30
	ldr r3, _0225EF38 ; =ov49_0225F018
	mov r1, #1
	bx r3
	nop
_0225EF38: .word ov49_0225F018
	thumb_func_end ov49_0225EF30

	thumb_func_start ov49_0225EF3C
ov49_0225EF3C: ; 0x0225EF3C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov49_0225EF3C

	thumb_func_start ov49_0225EF40
ov49_0225EF40: ; 0x0225EF40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	cmp r0, #0
	beq _0225EF50
	bl GF_AssertFail
_0225EF50:
	ldrh r0, [r5]
	add r1, r4, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r4, #0
	str r0, [r5, #8]
	bl memset
	ldr r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EF40

	thumb_func_start ov49_0225EF68
ov49_0225EF68: ; 0x0225EF68
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0225EF76
	bl GF_AssertFail
_0225EF76:
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225EF68

	thumb_func_start ov49_0225EF84
ov49_0225EF84: ; 0x0225EF84
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov49_0225EF84

	thumb_func_start ov49_0225EF88
ov49_0225EF88: ; 0x0225EF88
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225EF88

	thumb_func_start ov49_0225EF8C
ov49_0225EF8C: ; 0x0225EF8C
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225EF8C

	thumb_func_start ov49_0225EF90
ov49_0225EF90: ; 0x0225EF90
	ldr r1, [r0, #0x10]
	add r1, r1, #1
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225EF90

	thumb_func_start ov49_0225EF98
ov49_0225EF98: ; 0x0225EF98
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _0225EFAA
	bl GF_AssertFail
_0225EFAA:
	cmp r4, #0x14
	blo _0225EFB2
	bl GF_AssertFail
_0225EFB2:
	mov r0, #0x24
	add r5, #8
	mul r0, r4
	add r0, r5, r0
	add r1, r6, #0
	add r2, r7, #0
	bl ov49_0225F0D8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225EF98

	thumb_func_start ov49_0225EFC4
ov49_0225EFC4: ; 0x0225EFC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _0225EFD6
	bl GF_AssertFail
_0225EFD6:
	cmp r4, #0x14
	blo _0225EFDE
	bl GF_AssertFail
_0225EFDE:
	mov r0, #0x24
	add r5, #8
	mul r0, r4
	add r0, r5, r0
	add r1, r6, #0
	add r2, r7, #0
	bl ov49_0225F110
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225EFC4

	thumb_func_start ov49_0225EFF0
ov49_0225EFF0: ; 0x0225EFF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _0225F000
	bl GF_AssertFail
_0225F000:
	cmp r4, #0x14
	blo _0225F008
	bl GF_AssertFail
_0225F008:
	mov r0, #0x24
	add r5, #8
	mul r0, r4
	add r0, r5, r0
	add r1, r6, #0
	bl ov49_0225F10C
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225EFF0

	thumb_func_start ov49_0225F018
ov49_0225F018: ; 0x0225F018
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r7, r0
	str r1, [sp]
	bl ov49_0225F180
	cmp r0, #1
	bne _0225F03E
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r2, [sp]
	add r0, r7, r0
	add r1, r7, #0
	mov r3, #0
	bl ov49_0225F098
	pop {r3, r4, r5, r6, r7, pc}
_0225F03E:
	add r6, r7, #0
	add r6, #8
	mov r4, #0
	add r5, r6, #0
_0225F046:
	add r0, r6, #0
	bl ov49_0225F180
	cmp r0, #1
	bne _0225F05C
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	add r3, r4, #0
	bl ov49_0225F098
_0225F05C:
	add r4, r4, #1
	add r6, #0x24
	add r5, #0x24
	cmp r4, #0x14
	blt _0225F046
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F018

	thumb_func_start ov49_0225F068
ov49_0225F068: ; 0x0225F068
	strh r2, [r0]
	mov r2, #1
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225F068

	thumb_func_start ov49_0225F074
ov49_0225F074: ; 0x0225F074
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0225F082
	bl FreeToHeap
_0225F082:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0225F08C
	bl FreeToHeap
_0225F08C:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x24
	bl memset
	pop {r4, pc}
	thumb_func_end ov49_0225F074

	thumb_func_start ov49_0225F098
ov49_0225F098: ; 0x0225F098
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #2]
	add r6, r1, #0
	add r7, r3, #0
	cmp r0, #0
	beq _0225F0D6
	cmp r2, #0
	beq _0225F0B0
	cmp r2, #1
	beq _0225F0B6
	b _0225F0BC
_0225F0B0:
	ldr r0, [r5, #4]
	ldr r4, [r0]
	b _0225F0C0
_0225F0B6:
	ldr r0, [r5, #4]
	ldr r4, [r0, #4]
	b _0225F0C0
_0225F0BC:
	bl GF_AssertFail
_0225F0C0:
	cmp r4, #0
	beq _0225F0D6
	ldr r1, [r6, #4]
	add r0, r5, #0
	add r2, r7, #0
	blx r4
	cmp r0, #1
	bne _0225F0D6
	add r0, r5, #0
	bl ov49_0225F148
_0225F0D6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F098

	thumb_func_start ov49_0225F0D8
ov49_0225F0D8: ; 0x0225F0D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov49_0225F170
	cmp r0, #1
	beq _0225F0EE
	bl GF_AssertFail
_0225F0EE:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0225F0F8
	bl GF_AssertFail
_0225F0F8:
	mov r3, #0
	add r0, r5, #4
	add r1, r4, #0
	add r2, r6, #0
	str r3, [sp]
	bl ov49_0225F190
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225F0D8

	thumb_func_start ov49_0225F10C
ov49_0225F10C: ; 0x0225F10C
	strb r1, [r0, #2]
	bx lr
	thumb_func_end ov49_0225F10C

	thumb_func_start ov49_0225F110
ov49_0225F110: ; 0x0225F110
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov49_0225F170
	cmp r0, #1
	beq _0225F126
	bl GF_AssertFail
_0225F126:
	add r2, r5, #0
	add r3, r5, #4
	add r2, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r3, #0
	add r0, r5, #4
	add r1, r4, #0
	add r2, r6, #0
	str r3, [sp]
	bl ov49_0225F190
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_0225F110

	thumb_func_start ov49_0225F148
ov49_0225F148: ; 0x0225F148
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0225F156
	bl GF_AssertFail
_0225F156:
	add r3, r4, #0
	add r3, #0x14
	add r2, r4, #4
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r4, #0x14
	add r0, r4, #0
	bl ov49_0225F19C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225F148

	thumb_func_start ov49_0225F170
ov49_0225F170: ; 0x0225F170
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0225F17A
	mov r0, #1
	bx lr
_0225F17A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225F170

	thumb_func_start ov49_0225F180
ov49_0225F180: ; 0x0225F180
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0225F18A
	mov r0, #1
	bx lr
_0225F18A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225F180

	thumb_func_start ov49_0225F190
ov49_0225F190: ; 0x0225F190
	str r1, [r0]
	ldr r1, [sp]
	str r3, [r0, #0xc]
	str r1, [r0, #4]
	str r2, [r0, #8]
	bx lr
	thumb_func_end ov49_0225F190

	thumb_func_start ov49_0225F19C
ov49_0225F19C: ; 0x0225F19C
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #0xc]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov49_0225F19C

	thumb_func_start ov49_0225F1A8
ov49_0225F1A8: ; 0x0225F1A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov49_02259FEC
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_0225A010
	add r7, r0, #0
	add r0, r5, #0
	bl ov49_0225A02C
	add r6, r0, #0
	add r0, r5, #0
	bl ov49_02259FE8
	mov r1, #1
	bl ov45_0222A5E8
	ldrh r0, [r4, #6]
	cmp r0, #4
	blo _0225F1D8
	bl GF_AssertFail
_0225F1D8:
	ldrh r2, [r4, #6]
	ldr r3, _0225F1EC ; =ov49_02269BE0
	add r0, r7, #0
	lsl r2, r2, #3
	add r2, r3, r2
	add r1, r6, #0
	mov r3, #0
	bl ov49_0225EF98
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225F1EC: .word ov49_02269BE0
	thumb_func_end ov49_0225F1A8

	thumb_func_start ov49_0225F1F0
ov49_0225F1F0: ; 0x0225F1F0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ov49_0225A02C
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_0225A010
	ldr r7, _0225F220 ; =ov49_02269B78
	add r6, r0, #0
	mov r4, #0
_0225F206:
	cmp r5, r4
	beq _0225F216
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #0
	bl ov49_0225EF98
_0225F216:
	add r4, r4, #1
	cmp r4, #0x14
	blt _0225F206
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F220: .word ov49_02269B78
	thumb_func_end ov49_0225F1F0

	thumb_func_start ov49_0225F224
ov49_0225F224: ; 0x0225F224
	cmp r0, #3
	bhi _0225F24A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F234: ; jump table
	.short _0225F23C - _0225F234 - 2 ; case 0
	.short _0225F240 - _0225F234 - 2 ; case 1
	.short _0225F244 - _0225F234 - 2 ; case 2
	.short _0225F248 - _0225F234 - 2 ; case 3
_0225F23C:
	mov r1, #0x40
	b _0225F24A
_0225F240:
	mov r1, #0x80
	b _0225F24A
_0225F244:
	mov r1, #0x20
	b _0225F24A
_0225F248:
	mov r1, #0x10
_0225F24A:
	ldr r0, _0225F25C ; =gSystem
	ldr r0, [r0, #0x44]
	tst r0, r1
	beq _0225F256
	mov r0, #1
	bx lr
_0225F256:
	mov r0, #0
	bx lr
	nop
_0225F25C: .word gSystem
	thumb_func_end ov49_0225F224

	thumb_func_start ov49_0225F260
ov49_0225F260: ; 0x0225F260
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	add r7, r0, #0
	str r2, [sp, #4]
	add r4, r3, #0
	ldr r5, [sp, #0x28]
	bl ov49_0225EF84
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl ov49_0225A010
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	mov r2, #0
	cmp r0, #3
	beq _0225F2F4
	add r6, r4, #0
	add r1, r2, #0
_0225F288:
	add r3, r1, #0
_0225F28A:
	ldrb r0, [r6, r3]
	cmp r0, #0xff
	beq _0225F2EA
	cmp r5, r0
	bne _0225F2E4
	mov r0, #0x18
	add r5, r2, #0
	mul r5, r0
	add r6, r4, r5
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _0225F2AA
	cmp r0, #1
	beq _0225F2C2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225F2AA:
	add r0, r7, #0
	bl ov49_0225EF68
	add r2, r6, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, #0xc
	mov r3, #0
	bl ov49_0225EF98
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225F2C2:
	ldr r7, [r6, #0x14]
	cmp r7, #0
	beq _0225F2D2
	ldrb r3, [r3, r6]
	ldr r0, [sp, #0xc]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	blx r7
_0225F2D2:
	add r2, r4, r5
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, #0xc
	mov r3, #0
	bl ov49_0225EFC4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225F2E4:
	add r3, r3, #1
	cmp r3, #8
	blt _0225F28A
_0225F2EA:
	add r6, #0x18
	ldr r0, [r6, #8]
	add r2, r2, #1
	cmp r0, #3
	bne _0225F288
_0225F2F4:
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F260

	thumb_func_start ov49_0225F2FC
ov49_0225F2FC: ; 0x0225F2FC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl ov49_02259FF0
	add r1, r4, #0
	bl ov49_02258C28
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_0225A008
	add r5, r0, #0
	add r0, r4, #0
	add r1, sp, #0
	bl ov49_02259154
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r5, #0
	bl ov49_0225CC28
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_0225F2FC

	thumb_func_start ov49_0225F334
ov49_0225F334: ; 0x0225F334
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl ov49_02259FF0
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_0225A008
	str r0, [sp, #4]
	ldr r3, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov49_02258C5C
	add r5, r0, #0
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov49_02258E7C
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl ov49_0225CC40
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F334

	thumb_func_start ov49_0225F374
ov49_0225F374: ; 0x0225F374
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	strb r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #5]
	bl MTRandom
	mov r1, #3
	and r0, r1
	strb r0, [r4, #6]
	mov r0, #1
	strb r0, [r4, #7]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_0225F374

	thumb_func_start ov49_0225F394
ov49_0225F394: ; 0x0225F394
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0225F3A8
	cmp r0, #1
	beq _0225F3AE
	cmp r0, #2
	beq _0225F3C0
	b _0225F422
_0225F3A8:
	mov r0, #0
	str r0, [r4]
	b _0225F422
_0225F3AE:
	ldrb r0, [r4, #6]
	sub r0, r0, #1
	cmp r0, #0
	ble _0225F3BA
	strb r0, [r4, #6]
	b _0225F422
_0225F3BA:
	mov r0, #2
	strb r0, [r4, #5]
	b _0225F422
_0225F3C0:
	mov r0, #4
	ldrsb r1, [r4, r0]
	mov r3, #0
	add r1, r1, #1
	strb r1, [r4, #4]
	ldrsb r1, [r4, r0]
	ldr r0, _0225F428 ; =0x00007FFF
	add r2, r1, #0
	mul r2, r0
	asr r0, r2, #1
	lsr r0, r0, #0x1e
	add r0, r2, r0
	lsl r0, r0, #0xe
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0225F42C ; =FX_SinCosTable_
	mov r2, #6
	ldrsh r0, [r0, r1]
	lsl r2, r2, #0xc
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
	str r1, [r4]
	mov r0, #4
	ldrsb r0, [r4, r0]
	cmp r0, #4
	blt _0225F422
	ldrb r0, [r4, #7]
	cmp r0, #1
	bne _0225F420
	strb r3, [r4, #4]
	mov r0, #1
	strb r0, [r4, #5]
	bl MTRandom
	mov r1, #3
	and r0, r1
	strb r0, [r4, #6]
	b _0225F422
_0225F420:
	strb r3, [r4, #5]
_0225F422:
	ldr r0, [r4]
	pop {r4, pc}
	nop
_0225F428: .word 0x00007FFF
_0225F42C: .word FX_SinCosTable_
	thumb_func_end ov49_0225F394

	thumb_func_start ov49_0225F430
ov49_0225F430: ; 0x0225F430
	mov r1, #0
	strb r1, [r0, #7]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225F430

	thumb_func_start ov49_0225F438
ov49_0225F438: ; 0x0225F438
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0225F442
	mov r0, #1
	bx lr
_0225F442:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0225F438

	thumb_func_start ov49_0225F448
ov49_0225F448: ; 0x0225F448
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	add r0, r5, #0
	bl ov49_02259FF0
	add r1, r4, #0
	add r7, r0, #0
	bl ov49_02258D70
	str r0, [sp]
	add r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #4]
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _0225F47E
	cmp r0, #1
	beq _0225F4A2
	cmp r0, #2
	beq _0225F4B8
	b _0225F510
_0225F47E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225A56C
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225EF8C
	ldr r0, [sp, #4]
	bl ov45_0222A53C
	cmp r4, r0
	bne _0225F510
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A53C
	b _0225F510
_0225F4A2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_0225A5AC
	cmp r0, #1
	bne _0225F510
	add r0, r6, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _0225F510
_0225F4B8:
	ldr r0, [sp, #4]
	bl ov45_0222A53C
	cmp r4, r0
	bne _0225F4CE
	ldr r1, [sp]
	add r0, r7, #0
	mov r2, #1
	bl ov49_02258EEC
	b _0225F504
_0225F4CE:
	add r0, r5, #0
	bl ov49_0225A4F0
	cmp r0, #1
	bne _0225F4EE
	add r0, r5, #0
	bl ov49_0225A4E0
	cmp r4, r0
	beq _0225F4F8
	ldr r1, [sp]
	add r0, r7, #0
	mov r2, #2
	bl ov49_02258EEC
	b _0225F4F8
_0225F4EE:
	ldr r1, [sp]
	add r0, r7, #0
	mov r2, #2
	bl ov49_02258EEC
_0225F4F8:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov49_0225A04C
_0225F504:
	add r0, r5, #0
	bl ov49_0225A54C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F510:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0225F448

	thumb_func_start ov49_0225F518
ov49_0225F518: ; 0x0225F518
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	str r2, [sp]
	bl ov49_02259FE8
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov49_02259FF0
	str r0, [sp, #8]
	bl ov49_02258DAC
	add r7, r0, #0
	add r0, r6, #0
	bl ov49_0225EF84
	add r4, r0, #0
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x16
	bhi _0225F602
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F556: ; jump table
	.short _0225F584 - _0225F556 - 2 ; case 0
	.short _0225F5C4 - _0225F556 - 2 ; case 1
	.short _0225F5FA - _0225F556 - 2 ; case 2
	.short _0225F614 - _0225F556 - 2 ; case 3
	.short _0225F62E - _0225F556 - 2 ; case 4
	.short _0225F648 - _0225F556 - 2 ; case 5
	.short _0225F662 - _0225F556 - 2 ; case 6
	.short _0225F67C - _0225F556 - 2 ; case 7
	.short _0225F692 - _0225F556 - 2 ; case 8
	.short _0225F6B2 - _0225F556 - 2 ; case 9
	.short _0225F6E4 - _0225F556 - 2 ; case 10
	.short _0225F758 - _0225F556 - 2 ; case 11
	.short _0225F79E - _0225F556 - 2 ; case 12
	.short _0225F7D0 - _0225F556 - 2 ; case 13
	.short _0225F9FA - _0225F556 - 2 ; case 14
	.short _0225F844 - _0225F556 - 2 ; case 15
	.short _0225F88A - _0225F556 - 2 ; case 16
	.short _0225F8E2 - _0225F556 - 2 ; case 17
	.short _0225F902 - _0225F556 - 2 ; case 18
	.short _0225F950 - _0225F556 - 2 ; case 19
	.short _0225F97A - _0225F556 - 2 ; case 20
	.short _0225F9AE - _0225F556 - 2 ; case 21
	.short _0225F9C2 - _0225F556 - 2 ; case 22
_0225F584:
	add r0, r6, #0
	mov r1, #0x2c
	bl ov49_0225EF40
	add r1, r5, #0
	add r4, r0, #0
	bl ov49_022614CC
	ldr r0, [sp, #4]
	bl ov45_0222A4D0
	ldr r0, [sp, #4]
	bl ov45_0222B1B4
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldr r0, [sp, #4]
	bl ov45_0222A72C
	ldr r1, [sp]
	add r0, r5, #0
	bl ov49_0225F2FC
	add r1, r0, #0
	ldr r0, [sp, #8]
	mov r2, #4
	bl ov49_02258EEC
	add r0, r6, #0
	bl ov49_0225EF90
	b _0225F9FA
_0225F5C4:
	add r0, r5, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225F602
	add r0, r7, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _0225F602
	ldr r0, [sp, #8]
	add r1, r7, #0
	mov r2, #0
	bl ov49_02258EEC
	add r0, r5, #0
	bl ov49_0225A008
	add r1, r7, #0
	bl ov49_0225CC40
	mov r0, #0x10
	str r0, [r4, #4]
	add r0, r6, #0
	bl ov49_0225EF90
	b _0225F9FA
_0225F5FA:
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	beq _0225F604
_0225F602:
	b _0225F9FA
_0225F604:
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A018
	add r0, r6, #0
	bl ov49_0225EF90
	b _0225F9FA
_0225F614:
	ldr r0, [sp, #8]
	add r1, r7, #0
	mov r2, #2
	mov r3, #0
	bl ov49_02258E7C
	mov r0, #4
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F62E:
	ldr r0, [sp, #8]
	add r1, r7, #0
	mov r2, #2
	mov r3, #0
	bl ov49_02258E7C
	mov r0, #5
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F648:
	ldr r0, [sp, #8]
	add r1, r7, #0
	mov r2, #1
	mov r3, #3
	bl ov49_02258E7C
	mov r0, #6
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F662:
	ldr r0, [sp, #8]
	add r1, r7, #0
	mov r2, #2
	mov r3, #3
	bl ov49_02258E7C
	mov r0, #8
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F67C:
	add r0, r7, #0
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225F766
	ldrh r1, [r4]
	add r0, r6, #0
	bl ov49_0225EF8C
	b _0225F9FA
_0225F692:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x10
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F6B2:
	add r0, r5, #0
	mov r1, #1
	mov r2, #5
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r4, #8
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A1F4
	add r0, r6, #0
	mov r1, #0xa
	bl ov49_0225EF8C
	b _0225F9FA
_0225F6E4:
	add r0, r5, #0
	mov r7, #0
	bl ov49_0225A1D4
	add r2, r0, #0
	beq _0225F704
	sub r0, r7, #2
	cmp r2, r0
	beq _0225F6FE
	add r0, r0, #1
	cmp r2, r0
	beq _0225F718
	b _0225F70C
_0225F6FE:
	ldr r0, _0225FA00 ; =0x000005DC
	bl PlaySE
_0225F704:
	mov r0, #0
	strh r0, [r4, #0x28]
	mov r7, #1
	b _0225F718
_0225F70C:
	add r0, r5, #0
	mov r1, #0
	strh r2, [r4, #0x28]
	mov r7, #1
	bl ov49_0225A40C
_0225F718:
	cmp r7, #1
	bne _0225F766
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _0225F74E
	add r0, r5, #0
	mov r1, #1
	mov r2, #8
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A264
	add r0, r6, #0
	mov r1, #0xb
	bl ov49_0225EF8C
	b _0225F9FA
_0225F74E:
	add r0, r6, #0
	mov r1, #0x11
	bl ov49_0225EF8C
	b _0225F9FA
_0225F758:
	add r0, r5, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _0225F768
	cmp r0, #1
	beq _0225F78E
_0225F766:
	b _0225F9FA
_0225F768:
	add r0, r5, #0
	bl ov49_0225A2F8
	add r0, r6, #0
	mov r1, #0xc
	bl ov49_0225EF8C
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x2a]
	ldr r0, [sp, #4]
	bl ov45_0222A770
	add r0, r5, #0
	bl ov49_0225A490
	ldr r0, _0225FA04 ; =0x000005E5
	bl PlaySE
	b _0225F9FA
_0225F78E:
	add r0, r5, #0
	bl ov49_0225A2F8
	add r0, r6, #0
	mov r1, #9
	bl ov49_0225EF8C
	b _0225F9FA
_0225F79E:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xa
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r4, #8
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A1F4
	add r0, r6, #0
	mov r1, #0xd
	bl ov49_0225EF8C
	b _0225F9FA
_0225F7D0:
	add r0, r5, #0
	mov r7, #0
	bl ov49_0225A1D4
	add r2, r0, #0
	beq _0225F7F0
	sub r0, r7, #2
	cmp r2, r0
	beq _0225F7EA
	add r0, r0, #1
	cmp r2, r0
	beq _0225F804
	b _0225F7F8
_0225F7EA:
	ldr r0, _0225FA00 ; =0x000005DC
	bl PlaySE
_0225F7F0:
	mov r0, #0
	strh r0, [r4, #0x2a]
	mov r7, #1
	b _0225F804
_0225F7F8:
	add r0, r5, #0
	mov r1, #0
	strh r2, [r4, #0x2a]
	mov r7, #1
	bl ov49_0225A40C
_0225F804:
	cmp r7, #1
	bne _0225F852
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	ldrh r0, [r4, #0x2a]
	cmp r0, #0
	beq _0225F83A
	add r0, r5, #0
	mov r1, #1
	mov r2, #8
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A264
	add r0, r6, #0
	mov r1, #0xf
	bl ov49_0225EF8C
	b _0225F9FA
_0225F83A:
	add r0, r6, #0
	mov r1, #0x13
	bl ov49_0225EF8C
	b _0225F9FA
_0225F844:
	add r0, r5, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _0225F854
	cmp r0, #1
	beq _0225F87A
_0225F852:
	b _0225F9FA
_0225F854:
	add r0, r5, #0
	bl ov49_0225A2F8
	add r0, r6, #0
	mov r1, #0x14
	bl ov49_0225EF8C
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x2a]
	ldr r0, [sp, #4]
	bl ov45_0222A770
	add r0, r5, #0
	bl ov49_0225A490
	ldr r0, _0225FA04 ; =0x000005E5
	bl PlaySE
	b _0225F9FA
_0225F87A:
	add r0, r5, #0
	bl ov49_0225A2F8
	add r0, r6, #0
	mov r1, #0xc
	bl ov49_0225EF8C
	b _0225F9FA
_0225F88A:
	ldr r0, _0225FA08 ; =0x000005BF
	bl PlaySE
	add r0, r5, #0
	bl ov49_0225A530
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrh r1, [r4, #2]
	add r0, r5, #0
	mov r2, #1
	bl ov49_0225A39C
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl ov45_0222AB28
	cmp r0, #0
	bne _0225F8C2
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A30C
	b _0225F8CC
_0225F8C2:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x7c
	bl ov49_0225A30C
_0225F8CC:
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x12
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F8E2:
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x16
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F902:
	ldr r0, _0225FA08 ; =0x000005BF
	bl IsSEPlaying
	cmp r0, #0
	bne _0225F9FA
	ldr r0, _0225FA0C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0225F9FA
	ldr r0, _0225FA00 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	mov r2, #4
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #9
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x2a]
	ldr r0, [sp, #4]
	bl ov45_0222A770
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A428
	b _0225F9FA
_0225F950:
	ldrh r2, [r4, #0x28]
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A40C
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xc
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x11
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F97A:
	ldrh r2, [r4, #0x28]
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A40C
	ldrh r2, [r4, #0x2a]
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A40C
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xb
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x11
	strh r0, [r4]
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F9AE:
	add r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225F9FA
	ldrh r1, [r4]
	add r0, r6, #0
	bl ov49_0225EF8C
	b _0225F9FA
_0225F9C2:
	ldr r0, [sp, #8]
	add r1, r7, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r5, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02261540
	add r0, r6, #0
	bl ov49_0225EF68
	add r0, r5, #0
	bl ov49_0225A010
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_0225A02C
	add r1, r0, #0
	ldr r2, _0225FA10 ; =ov49_02269B38
	add r0, r4, #0
	mov r3, #0
	bl ov49_0225EF98
_0225F9FA:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FA00: .word 0x000005DC
_0225FA04: .word 0x000005E5
_0225FA08: .word 0x000005BF
_0225FA0C: .word gSystem
_0225FA10: .word ov49_02269B38
	thumb_func_end ov49_0225F518

	thumb_func_start ov49_0225FA14
ov49_0225FA14: ; 0x0225FA14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	str r2, [sp, #4]
	bl ov49_02259FE8
	str r0, [sp, #8]
	add r0, r4, #0
	bl ov49_02259FEC
	add r6, r0, #0
	add r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	add r7, r0, #0
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bls _0225FA48
	b _0225FB52
_0225FA48:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FA54: ; jump table
	.short _0225FA60 - _0225FA54 - 2 ; case 0
	.short _0225FA8C - _0225FA54 - 2 ; case 1
	.short _0225FAC2 - _0225FA54 - 2 ; case 2
	.short _0225FAF2 - _0225FA54 - 2 ; case 3
	.short _0225FB16 - _0225FA54 - 2 ; case 4
	.short _0225FB2E - _0225FA54 - 2 ; case 5
_0225FA60:
	mov r0, #1
	str r0, [sp]
	ldrh r2, [r6]
	ldrh r3, [r6, #2]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov49_0225F334
	bl ov45_0222D844
	cmp r0, #0
	bne _0225FA7C
	bl ov45_0222EB94
_0225FA7C:
	ldr r0, [sp, #8]
	mov r1, #0
	bl ov45_0222A520
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FA8C:
	bl ov45_0222D844
	cmp r0, #0
	bne _0225FA9C
	bl ov45_0222EBC4
	cmp r0, #0
	beq _0225FB52
_0225FA9C:
	add r0, r4, #0
	bl ov49_02259FEC
	add r6, r0, #0
	add r0, r4, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225FB52
	add r0, r5, #0
	bl ov49_0225EF90
	ldrh r3, [r6, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r2, #2
	bl ov49_02258EAC
	b _0225FB52
_0225FAC2:
	add r0, r7, #0
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225FB52
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A018
	ldr r0, [sp, #8]
	bl ov45_0222A4B8
	cmp r0, #1
	bne _0225FAE8
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FAE8:
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _0225FB52
_0225FAF2:
	ldrh r1, [r6, #8]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x15
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FB16:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225FB52
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FB2E:
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r4, #0
	bl ov49_0225A010
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_0225A02C
	add r1, r0, #0
	ldr r2, _0225FB58 ; =ov49_02269B38
	add r0, r5, #0
	mov r3, #0
	bl ov49_0225EF98
_0225FB52:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FB58: .word ov49_02269B38
	thumb_func_end ov49_0225FA14

	thumb_func_start ov49_0225FB5C
ov49_0225FB5C: ; 0x0225FB5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	str r2, [sp, #4]
	bl ov49_0225A010
	str r0, [sp, #8]
	add r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	add r7, r0, #0
	add r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp, #0x10]
	add r0, r4, #0
	bl ov49_02259FEC
	add r6, r0, #0
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bls _0225FB98
	b _0225FC9A
_0225FB98:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FBA4: ; jump table
	.short _0225FBB0 - _0225FBA4 - 2 ; case 0
	.short _0225FBE2 - _0225FBA4 - 2 ; case 1
	.short _0225FC08 - _0225FBA4 - 2 ; case 2
	.short _0225FC3A - _0225FBA4 - 2 ; case 3
	.short _0225FC5E - _0225FBA4 - 2 ; case 4
	.short _0225FC76 - _0225FBA4 - 2 ; case 5
_0225FBB0:
	mov r0, #1
	str r0, [sp]
	ldrh r2, [r6]
	ldrh r3, [r6, #2]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov49_0225F334
	add r0, r5, #0
	bl ov49_0225EF90
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, _0225FCA0 ; =ov49_02269B68
	mov r3, #0
	bl ov49_0225EFC4
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl ov45_0222A4C8
	ldr r0, [sp, #0x10]
	bl ov45_0222A4D0
	b _0225FC9A
_0225FBE2:
	add r0, r4, #0
	bl ov49_02259FEC
	add r6, r0, #0
	add r0, r4, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225FC9A
	add r0, r5, #0
	bl ov49_0225EF90
	ldrh r3, [r6, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r2, #2
	bl ov49_02258EAC
	b _0225FC9A
_0225FC08:
	add r0, r7, #0
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225FC9A
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A018
	ldr r0, [sp, #0x10]
	bl ov45_0222A424
	cmp r0, #1
	bne _0225FC30
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _0225FC9A
_0225FC30:
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _0225FC9A
_0225FC3A:
	ldrh r1, [r6, #8]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #0
	mov r2, #8
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FC9A
_0225FC5E:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225FC9A
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FC9A
_0225FC76:
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r4, #0
	bl ov49_0225A010
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_0225A02C
	add r1, r0, #0
	ldr r2, _0225FCA4 ; =ov49_02269B38
	add r0, r5, #0
	mov r3, #0
	bl ov49_0225EF98
_0225FC9A:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FCA0: .word ov49_02269B68
_0225FCA4: .word ov49_02269B38
	thumb_func_end ov49_0225FB5C

	thumb_func_start ov49_0225FCA8
ov49_0225FCA8: ; 0x0225FCA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	str r2, [sp, #4]
	bl ov49_02259FE8
	add r7, r0, #0
	add r0, r4, #0
	bl ov49_02259FEC
	str r0, [sp, #8]
	add r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	add r6, r0, #0
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bhi _0225FDC2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FCE6: ; jump table
	.short _0225FCF2 - _0225FCE6 - 2 ; case 0
	.short _0225FD16 - _0225FCE6 - 2 ; case 1
	.short _0225FD3C - _0225FCE6 - 2 ; case 2
	.short _0225FD6C - _0225FCE6 - 2 ; case 3
	.short _0225FD86 - _0225FCE6 - 2 ; case 4
	.short _0225FD9E - _0225FCE6 - 2 ; case 5
_0225FCF2:
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #8]
	ldrh r2, [r2]
	ldrh r3, [r3, #2]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov49_0225F334
	add r0, r7, #0
	mov r1, #0
	bl ov45_0222A520
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD16:
	add r0, r4, #0
	bl ov49_02259FEC
	add r7, r0, #0
	add r0, r4, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225FDC2
	add r0, r5, #0
	bl ov49_0225EF90
	ldrh r3, [r7, #4]
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	mov r2, #2
	bl ov49_02258EAC
	b _0225FDC2
_0225FD3C:
	add r0, r6, #0
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225FDC2
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A018
	add r0, r7, #0
	bl ov45_0222A4B8
	cmp r0, #1
	bne _0225FD62
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD62:
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _0225FDC2
_0225FD6C:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x5b
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD86:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225FDC2
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD9E:
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r4, #0
	bl ov49_0225A010
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_0225A02C
	add r1, r0, #0
	ldr r2, _0225FDC8 ; =ov49_02269B38
	add r0, r5, #0
	mov r3, #0
	bl ov49_0225EF98
_0225FDC2:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FDC8: .word ov49_02269B38
	thumb_func_end ov49_0225FCA8

	thumb_func_start ov49_0225FDCC
ov49_0225FDCC: ; 0x0225FDCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	str r0, [sp, #4]
	add r5, r1, #0
	add r7, r2, #0
	bl ov49_0225EF84
	str r0, [sp, #0x30]
	ldr r0, [sp, #4]
	bl ov49_0225EF88
	cmp r0, #0
	beq _0225FDEC
	cmp r0, #1
	beq _0225FDFC
	b _0226020A
_0225FDEC:
	ldr r0, [sp, #4]
	mov r1, #4
	bl ov49_0225EF40
	ldr r0, [sp, #4]
	bl ov49_0225EF90
	b _0226020A
_0225FDFC:
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A53C
	add r0, r5, #0
	bl ov49_0225A010
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl ov49_02259FF0
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_0225A000
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ov49_02259FF8
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl ov49_02258DB0
	add r6, r0, #0
	beq _0225FE7E
	ldr r0, [sp, #0x18]
	bl ov45_0222A330
	cmp r0, #0
	bne _0225FE6A
	ldr r0, [sp, #0x18]
	bl ov45_0222A3A0
	cmp r0, #1
	bne _0225FE6A
	ldr r0, [sp, #0x18]
	bl ov45_0222A2F8
	cmp r0, #0
	bne _0225FE6A
	add r0, r6, #0
	bl ov49_02258F3C
	cmp r0, #9
	beq _0225FE7E
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #9
	bl ov49_02258EEC
	b _0225FE7E
_0225FE6A:
	add r0, r6, #0
	bl ov49_02258F3C
	cmp r0, #0
	beq _0225FE7E
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0
	bl ov49_02258EEC
_0225FE7E:
	add r0, r4, #0
	bl ov49_02258DAC
	str r0, [sp, #0x28]
	mov r1, #5
	bl ov49_02258E60
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	mov r1, #6
	bl ov49_02258E60
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	bl ov49_02258E34
	add r1, sp, #0x40
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	ldr r1, [sp, #8]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r2, sp, #0x40
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #0xc
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r1, [r2, r1]
	ldr r0, [sp, #0x1c]
	asr r3, r1, #3
	lsr r3, r3, #0x1c
	add r3, r1, r3
	lsl r1, r3, #0xc
	mov r3, #0xe
	ldrsh r2, [r2, r3]
	lsr r1, r1, #0x10
	asr r3, r2, #3
	lsr r3, r3, #0x1c
	add r3, r2, r3
	lsl r2, r3, #0xc
	lsr r2, r2, #0x10
	bl ov49_022589C4
	str r0, [sp, #0x24]
	add r0, sp, #0x40
	mov r1, #0xa
	ldrsh r2, [r0, r1]
	asr r1, r2, #3
	lsr r1, r1, #0x1c
	add r1, r2, r1
	asr r1, r1, #4
	str r1, [sp, #0x10]
	mov r1, #8
	ldrsh r1, [r0, r1]
	ldr r2, [sp, #0x10]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r1, r1, #0x10
	ldr r0, [sp, #0x1c]
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov49_022589C4
	add r6, r0, #0
	add r0, r5, #0
	bl ov49_0225A4E0
	add r1, r0, #0
	cmp r1, r7
	beq _0225FF48
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov49_0225A084
	cmp r0, #0
	beq _0225FF48
	add r0, r5, #0
	bl ov49_0225A4D0
_0225FF48:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _0225FF94
	add r0, r5, #0
	bl ov49_0225A500
	cmp r0, #1
	bne _0225FF60
	ldr r0, [sp, #0x2c]
	sub r0, r0, #1
	cmp r0, #2
	bls _0225FF62
_0225FF60:
	b _0226020A
_0225FF62:
	add r0, r5, #0
	bl ov49_0225A4E0
	add r1, r0, #0
	cmp r1, r7
	beq _0225FF8C
	add r0, r4, #0
	bl ov49_02258D70
	add r6, r0, #0
	beq _0225FF8C
	bl ov49_02258F3C
	cmp r0, #0
	bne _0225FF8C
	ldr r2, [sp, #0x30]
	add r0, r4, #0
	ldr r2, [r2]
	add r1, r6, #0
	bl ov49_02258EEC
_0225FF8C:
	add r0, r5, #0
	bl ov49_0225A4D0
	b _0226020A
_0225FF94:
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A53C
	ldr r0, [sp, #0x24]
	bl ov49_02258A30
	cmp r0, #1
	bne _0225FFDA
	ldr r0, [sp, #0x24]
	ldr r3, _02260210 ; =ov49_02269D20
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r7, #0
	bl ov49_0225F260
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	mov r2, #0
	bl ov49_02258EEC
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov49_0225A03C
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225FFDA:
	add r0, r5, #0
	bl ov49_0225A55C
	cmp r0, #1
	bne _02260008
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	mov r2, #0
	bl ov49_02258EEC
	ldr r0, [sp, #0x14]
	ldr r2, _02260214 ; =ov49_02269B80
	add r1, r7, #0
	mov r3, #0
	bl ov49_0225EFC4
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260008:
	ldr r0, [sp, #0x18]
	bl ov45_0222B00C
	cmp r0, #0
	beq _02260036
	ldr r0, [sp, #0x14]
	ldr r2, _02260218 ; =ov49_02269B70
	add r1, r7, #0
	mov r3, #0
	bl ov49_0225EFC4
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	mov r2, #0
	bl ov49_02258EEC
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260036:
	ldr r0, _0226021C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02260120
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	bl ov49_02258F40
	str r0, [sp, #0x34]
	cmp r0, #0
	beq _022600A6
	mov r1, #5
	bl ov49_02258E60
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x34]
	mov r1, #4
	bl ov49_02258E60
	add r1, r0, #0
	cmp r1, #0xfe
	beq _022600A6
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov49_0225A064
	ldr r1, [sp, #0x38]
	cmp r1, #0
	bne _022600A6
	cmp r0, #0
	bne _022600A6
	ldr r0, [sp, #0x14]
	ldr r2, _02260220 ; =ov49_02269B60
	add r1, r7, #0
	mov r3, #0
	bl ov49_0225EFC4
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	mov r2, #0
	bl ov49_02258EEC
	ldr r1, [sp, #0x34]
	add r0, r4, #0
	mov r2, #0
	bl ov49_02258EEC
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022600A6:
	add r0, r6, #0
	bl ov49_02258A90
	cmp r0, #1
	bne _022600E6
	ldr r0, [sp, #0x28]
	mov r1, #6
	bl ov49_02258E60
	cmp r0, #0
	bne _022600E6
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [sp, #0x20]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov49_0225E58C
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov49_0225A03C
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022600E6:
	add r0, r6, #0
	bl ov49_02258A70
	cmp r0, #1
	bne _02260120
	ldr r0, [sp, #4]
	ldr r3, _02260224 ; =ov49_02269C90
	add r1, r5, #0
	add r2, r7, #0
	str r6, [sp]
	bl ov49_0225F260
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov49_0225A03C
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260120:
	ldr r0, [sp, #8]
	bl ov49_0225F224
	cmp r0, #1
	bne _022601C0
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0226016A
	add r0, r6, #0
	bl ov49_02258A50
	cmp r0, #1
	bne _0226016A
	ldr r0, [sp, #4]
	ldr r3, _02260228 ; =ov49_02269C60
	add r1, r5, #0
	add r2, r7, #0
	str r6, [sp]
	bl ov49_0225F260
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov49_0225A03C
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0226016A:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	bl ov49_02258F40
	str r0, [sp, #0x3c]
	cmp r0, #0
	beq _022601C0
	mov r1, #4
	bl ov49_02258E60
	add r6, r0, #0
	cmp r6, #0xfe
	beq _022601C0
	add r0, r5, #0
	bl ov49_0225A4F0
	cmp r0, #0
	bne _022601C0
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov49_0225A084
	cmp r0, #0
	bne _022601C0
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov49_0225A428
	ldr r0, [sp, #0x3c]
	bl ov49_02258F3C
	ldr r1, [sp, #0x30]
	mov r2, #0
	str r0, [r1]
	ldr r1, [sp, #0x3c]
	add r0, r4, #0
	bl ov49_02258EEC
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022601C0:
	ldr r0, _0226021C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r1
	beq _0226020A
	add r0, r5, #0
	bl ov49_0225A4F0
	cmp r0, #0
	bne _022601EE
	ldr r0, [sp, #0x18]
	bl ov45_0222A53C
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A428
	ldr r0, _0226022C ; =0x000005DC
	bl PlaySE
	b _02260204
_022601EE:
	add r0, r5, #0
	bl ov49_0225A4E0
	cmp r0, r7
	bne _02260204
	add r0, r5, #0
	bl ov49_0225A4D0
	ldr r0, _0226022C ; =0x000005DC
	bl PlaySE
_02260204:
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0226020A:
	mov r0, #0
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260210: .word ov49_02269D20
_02260214: .word ov49_02269B80
_02260218: .word ov49_02269B70
_0226021C: .word gSystem
_02260220: .word ov49_02269B60
_02260224: .word ov49_02269C90
_02260228: .word ov49_02269C60
_0226022C: .word 0x000005DC
	thumb_func_end ov49_0225FDCC

	thumb_func_start ov49_02260230
ov49_02260230: ; 0x02260230
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl ov49_02259FF0
	bl ov49_02258DAC
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	beq _02260250
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A53C
_02260250:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov49_02260230

	thumb_func_start ov49_02260254
ov49_02260254: ; 0x02260254
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	bl ov49_0225EF88
	cmp r0, #9
	bhi _022602FC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260270: ; jump table
	.short _02260284 - _02260270 - 2 ; case 0
	.short _022602C6 - _02260270 - 2 ; case 1
	.short _022602D8 - _02260270 - 2 ; case 2
	.short _022602F2 - _02260270 - 2 ; case 3
	.short _02260306 - _02260270 - 2 ; case 4
	.short _02260314 - _02260270 - 2 ; case 5
	.short _02260350 - _02260270 - 2 ; case 6
	.short _02260384 - _02260270 - 2 ; case 7
	.short _022603B6 - _02260270 - 2 ; case 8
	.short _022603D6 - _02260270 - 2 ; case 9
_02260284:
	add r0, r4, #0
	bl ov49_02259FF0
	add r6, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r6, #0
	mov r2, #0
	bl ov49_02258EEC
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #0xb
	bl ov45_0222A5E8
	ldr r0, _02260420 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x41
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022602C6:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _022602FC
	add r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022602D8:
	add r0, r4, #0
	mov r1, #2
	mov r2, #0x19
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022602F2:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	beq _022602FE
_022602FC:
	b _0226041A
_022602FE:
	add r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_02260306:
	add r0, r4, #0
	bl ov49_0225A294
	add r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_02260314:
	add r0, r4, #0
	mov r6, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _02260328
	cmp r0, #1
	beq _02260334
	cmp r0, #2
	b _0226033E
_02260328:
	add r0, r5, #0
	mov r1, #6
	bl ov49_0225EF8C
	mov r6, #1
	b _0226033E
_02260334:
	add r0, r5, #0
	mov r1, #8
	bl ov49_0225EF8C
	mov r6, #1
_0226033E:
	cmp r6, #1
	bne _0226041A
	add r0, r4, #0
	bl ov49_0225A2F8
	add r0, r4, #0
	bl ov49_0225A0EC
	b _0226041A
_02260350:
	add r0, r4, #0
	mov r1, #0
	bl ov49_0225A018
	add r0, r4, #0
	bl ov49_02259FF0
	add r6, r0, #0
	bl ov49_02258DAC
	add r7, r0, #0
	add r0, r4, #0
	bl ov49_0225A008
	bl ov49_0225CC44
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #3
	bl ov49_02258EEC
	add r0, r5, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _0226041A
_02260384:
	add r0, r4, #0
	bl ov49_02259FF0
	bl ov49_02258DAC
	bl ov49_02258F38
	cmp r0, #1
	bne _0226041A
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A034
	add r0, r4, #0
	mov r1, #0
	bl ov49_0225A038
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #0xb
	bl ov45_0222A5E8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022603B6:
	add r0, r4, #0
	bl ov49_02259FF0
	add r4, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #2
	mov r3, #0
	bl ov49_02258EAC
	add r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022603D6:
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #1
	bl ov45_0222A5E8
	add r0, r4, #0
	bl ov49_02259FF0
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_0225A010
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_02258DAC
	mov r1, #5
	add r6, r0, #0
	bl ov49_02258E60
	cmp r0, #0
	bne _0226041A
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov49_02258EEC
	ldr r2, _02260424 ; =ov49_02269B38
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0
	bl ov49_0225EF98
_0226041A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260420: .word 0x000005DD
_02260424: .word ov49_02269B38
	thumb_func_end ov49_02260254

	thumb_func_start ov49_02260428
ov49_02260428: ; 0x02260428
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r1, #0
	add r5, r0, #0
	str r2, [sp, #0x10]
	add r0, r4, #0
	bl ov49_02259FF0
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x28]
	bl ov49_02258D70
	add r7, r0, #0
	add r0, r4, #0
	bl ov49_0225A040
	str r0, [sp, #0x20]
	add r0, r5, #0
	bl ov49_0225EF84
	add r6, r0, #0
	add r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp, #0x24]
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #8
	bls _02260466
	b _022607B8
_02260466:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260472: ; jump table
	.short _02260484 - _02260472 - 2 ; case 0
	.short _02260544 - _02260472 - 2 ; case 1
	.short _022605E2 - _02260472 - 2 ; case 2
	.short _022606B0 - _02260472 - 2 ; case 3
	.short _02260702 - _02260472 - 2 ; case 4
	.short _0226071A - _02260472 - 2 ; case 5
	.short _02260740 - _02260472 - 2 ; case 6
	.short _0226075A - _02260472 - 2 ; case 7
	.short _02260788 - _02260472 - 2 ; case 8
_02260484:
	add r0, r5, #0
	mov r1, #0xc
	bl ov49_0225EF40
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	bl ov49_02260C58
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #3
	bhi _022604C8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022604A8: ; jump table
	.short _022604B0 - _022604A8 - 2 ; case 0
	.short _022604B6 - _022604A8 - 2 ; case 1
	.short _022604BC - _022604A8 - 2 ; case 2
	.short _022604C2 - _022604A8 - 2 ; case 3
_022604B0:
	mov r0, #3
	str r0, [r4, #8]
	b _022604D0
_022604B6:
	mov r0, #4
	str r0, [r4, #8]
	b _022604D0
_022604BC:
	mov r0, #5
	str r0, [r4, #8]
	b _022604D0
_022604C2:
	mov r0, #6
	str r0, [r4, #8]
	b _022604D0
_022604C8:
	bl GF_AssertFail
	mov r0, #5
	str r0, [r4, #8]
_022604D0:
	ldr r0, [sp, #0x24]
	bl ov45_0222A330
	cmp r0, #1
	bne _022604EC
	mov r0, #0x16
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _022607B8
_022604EC:
	ldr r0, [sp, #0x24]
	bl ov45_0222A208
	cmp r0, #1
	bne _02260508
	mov r0, #0x48
	strh r0, [r4, #4]
	mov r0, #1
	strh r0, [r4, #6]
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _022607B8
_02260508:
	ldr r0, [sp, #0x20]
	bl ov49_02260C58
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r6, #0
	bl ov45_0222EBF0
	cmp r0, #0
	bne _0226052E
	mov r0, #0x14
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _022607B8
_0226052E:
	add r0, r6, #0
	bl ov45_0222EB38
	cmp r0, #0
	bne _0226053C
	bl GF_AssertFail
_0226053C:
	add r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260544:
	bl ov45_0222EB74
	cmp r0, #1
	bne _022605CA
	add r0, r5, #0
	mov r1, #2
	bl ov49_0225EF8C
	add r1, sp, #0x40
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	add r0, r4, #0
	bl ov49_02259FE8
	add r7, r0, #0
	bl ov45_0222AB68
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	ldr r0, [r6, #8]
	sub r0, r0, #5
	cmp r0, #1
	bhi _022605A4
	mov r5, #0
	add r4, r5, #0
_0226057E:
	add r0, r7, #0
	add r1, r4, #0
	bl ov45_0222AB78
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0226059C
	cmp r5, #4
	bhs _02260596
	add r1, sp, #0x40
	strb r0, [r1, r5]
_02260596:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0226059C:
	add r4, r4, #1
	cmp r4, #4
	blt _0226057E
	b _022605AA
_022605A4:
	ldr r0, [sp, #0x10]
	add r1, sp, #0x38
	strb r0, [r1, #8]
_022605AA:
	add r3, sp, #0x38
	ldrb r0, [r3, #9]
	str r0, [sp]
	ldrb r0, [r3, #0xa]
	str r0, [sp, #4]
	ldrb r0, [r3, #0xb]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #8]
	ldr r1, [r6, #8]
	ldr r2, [sp, #0x1c]
	add r0, r7, #0
	bl ov45_0222AC14
	b _022607B8
_022605CA:
	cmp r0, #2
	beq _022605D0
	b _022607B8
_022605D0:
	mov r0, #0x14
	strh r0, [r6, #4]
	mov r0, #0
	strh r0, [r6, #6]
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _022607B8
_022605E2:
	ldr r0, [sp, #0x20]
	bl ov49_02260CC0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x20]
	bl ov49_02260D28
	str r0, [sp, #0x30]
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A034
	ldr r1, [sp, #0x2c]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov49_0225A038
	add r0, r4, #0
	bl ov49_02259FE8
	ldr r1, [sp, #0x30]
	bl ov45_0222A5E8
	ldr r0, [r6, #8]
	cmp r0, #6
	bhi _02260644
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260624: ; jump table
	.short _02260644 - _02260624 - 2 ; case 0
	.short _02260644 - _02260624 - 2 ; case 1
	.short _02260644 - _02260624 - 2 ; case 2
	.short _02260632 - _02260624 - 2 ; case 3
	.short _02260632 - _02260624 - 2 ; case 4
	.short _02260638 - _02260624 - 2 ; case 5
	.short _0226063E - _02260624 - 2 ; case 6
_02260632:
	mov r0, #5
	str r0, [sp, #0x18]
	b _02260648
_02260638:
	mov r0, #3
	str r0, [sp, #0x18]
	b _02260648
_0226063E:
	mov r0, #4
	str r0, [sp, #0x18]
	b _02260648
_02260644:
	bl GF_AssertFail
_02260648:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x18]
	bl ov45_0222B118
	add r0, r7, #0
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	str r0, [sp, #0x34]
	add r0, r4, #0
	bl ov49_02259FEC
	add r4, r0, #0
	add r0, r7, #0
	bl ov49_02258E34
	add r1, sp, #0x38
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	mov r0, #1
	strh r0, [r4, #6]
	mov r0, #4
	ldrsh r2, [r1, r0]
	asr r0, r2, #3
	lsr r0, r0, #0x1c
	add r0, r2, r0
	asr r0, r0, #4
	strh r0, [r4]
	mov r0, #6
	ldrsh r1, [r1, r0]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	strh r0, [r4, #2]
	ldr r0, [sp, #0x34]
	strh r0, [r4, #4]
	ldr r0, [r6, #8]
	strh r0, [r4, #8]
	add r0, r5, #0
	bl ov49_0225EF68
	add sp, #0x44
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022606B0:
	add r0, r7, #0
	mov r1, #6
	bl ov49_02258E60
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #3
	bhi _022606EC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022606CC: ; jump table
	.short _022606D4 - _022606CC - 2 ; case 0
	.short _022606DA - _022606CC - 2 ; case 1
	.short _022606E0 - _022606CC - 2 ; case 2
	.short _022606E6 - _022606CC - 2 ; case 3
_022606D4:
	mov r0, #6
	str r0, [sp, #0x14]
	b _022606F0
_022606DA:
	mov r0, #5
	str r0, [sp, #0x14]
	b _022606F0
_022606E0:
	mov r0, #8
	str r0, [sp, #0x14]
	b _022606F0
_022606E6:
	mov r0, #7
	str r0, [sp, #0x14]
	b _022606F0
_022606EC:
	bl GF_AssertFail
_022606F0:
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x14]
	add r1, r7, #0
	bl ov49_02258EEC
	add r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260702:
	add r0, r7, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _022607B8
	mov r0, #8
	str r0, [r6]
	add r0, r5, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _022607B8
_0226071A:
	add r0, r7, #0
	mov r1, #6
	bl ov49_02258E60
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov42_022282A4
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	ldr r0, [sp, #0x28]
	add r1, r7, #0
	mov r2, #2
	bl ov49_02258EAC
	add r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260740:
	add r0, r7, #0
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _022607B8
	mov r0, #8
	str r0, [r6]
	add r0, r5, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _022607B8
_0226075A:
	ldr r0, [r6]
	sub r0, r0, #1
	str r0, [r6]
	cmp r0, #0
	bgt _022607B8
	ldr r1, [r6, #8]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A37C
	ldrh r1, [r6, #6]
	ldrh r2, [r6, #4]
	add r0, r4, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260788:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _022607B8
	add r0, r5, #0
	bl ov49_0225EF68
	ldr r0, [sp, #0x28]
	add r1, r7, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	bl ov49_0225A010
	ldr r1, [sp, #0x10]
	ldr r2, _022607C0 ; =ov49_02269B38
	mov r3, #0
	bl ov49_0225EF98
_022607B8:
	mov r0, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_022607C0: .word ov49_02269B38
	thumb_func_end ov49_02260428

	thumb_func_start ov49_022607C4
ov49_022607C4: ; 0x022607C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r1, #0
	add r6, r0, #0
	str r2, [sp]
	bl ov49_0225EF84
	add r7, r0, #0
	add r0, r4, #0
	bl ov49_0225A010
	str r0, [sp, #0x14]
	add r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0x18]
	bl ov49_02258DAC
	str r0, [sp, #0x10]
	add r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #7
	bls _022607FE
	b _02260A5A
_022607FE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226080A: ; jump table
	.short _0226081A - _0226080A - 2 ; case 0
	.short _0226088E - _0226080A - 2 ; case 1
	.short _022608A8 - _0226080A - 2 ; case 2
	.short _0226095E - _0226080A - 2 ; case 3
	.short _0226097E - _0226080A - 2 ; case 4
	.short _02260992 - _0226080A - 2 ; case 5
	.short _02260A16 - _0226080A - 2 ; case 6
	.short _02260A2E - _0226080A - 2 ; case 7
_0226081A:
	add r0, r6, #0
	mov r1, #4
	bl ov49_0225EF40
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	mov r2, #0
	bl ov49_02258EEC
	add r0, r6, #0
	bl ov49_0225EF90
	mov r0, #0
	strb r0, [r5]
	add r0, r4, #0
	bl ov49_0225A040
	cmp r0, #0x1e
	beq _0226084C
	cmp r0, #0x1f
	beq _02260858
	cmp r0, #0x20
	beq _02260864
	b _02260870
_0226084C:
	mov r0, #0
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	mov r0, #2
	strb r0, [r5, #3]
	b _02260874
_02260858:
	mov r0, #1
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	mov r0, #3
	strb r0, [r5, #3]
	b _02260874
_02260864:
	mov r0, #2
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	mov r0, #4
	strb r0, [r5, #3]
	b _02260874
_02260870:
	bl GF_AssertFail
_02260874:
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #0xc
	bl ov45_0222A5E8
	ldr r0, [sp, #0x14]
	ldr r1, [sp]
	ldr r2, _02260A60 ; =ov49_02269B88
	add r3, r5, #0
	bl ov49_0225EFC4
	b _02260A5A
_0226088E:
	ldrb r0, [r7]
	cmp r0, #8
	bne _0226089E
	add r0, r6, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _02260A5A
_0226089E:
	add r0, r6, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _02260A5A
_022608A8:
	add r0, r4, #0
	bl ov49_0225A040
	cmp r0, #0x1e
	beq _022608BC
	cmp r0, #0x1f
	beq _022608C4
	cmp r0, #0x20
	beq _022608CC
	b _022608D2
_022608BC:
	mov r0, #0
	mov r5, #3
	str r0, [sp, #8]
	b _022608D2
_022608C4:
	mov r0, #1
	mov r5, #4
	str r0, [sp, #8]
	b _022608D2
_022608CC:
	mov r0, #2
	mov r5, #5
	str r0, [sp, #8]
_022608D2:
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A034
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov49_0225A038
	ldr r0, [sp, #0xc]
	bl ov45_0222B108
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl ov45_0222B118
	ldr r0, [sp, #0x10]
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl ov49_02259FEC
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	bl ov49_02258E34
	add r1, sp, #0x20
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	mov r0, #2
	strh r0, [r5, #6]
	mov r0, #4
	ldrsh r0, [r1, r0]
	asr r2, r0, #3
	lsr r2, r2, #0x1c
	add r2, r0, r2
	asr r0, r2, #4
	strh r0, [r5]
	mov r0, #6
	ldrsh r1, [r1, r0]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	strh r0, [r5, #2]
	ldr r0, [sp, #0x1c]
	strh r0, [r5, #4]
	ldrb r0, [r7, #2]
	strh r0, [r5, #8]
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #1
	bl ov45_0222A4C8
	add r0, r6, #0
	bl ov49_0225EF68
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0226095E:
	ldr r0, [sp, #0x10]
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	add r3, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	mov r2, #2
	bl ov49_02258EAC
	add r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_0226097E:
	ldr r0, [sp, #0x10]
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _02260A5A
	add r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_02260992:
	mov r0, #1
	str r0, [sp, #4]
	ldrb r0, [r7]
	cmp r0, #7
	bhi _022609E8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022609A8: ; jump table
	.short _022609B8 - _022609A8 - 2 ; case 0
	.short _022609C6 - _022609A8 - 2 ; case 1
	.short _022609CA - _022609A8 - 2 ; case 2
	.short _022609D8 - _022609A8 - 2 ; case 3
	.short _022609DC - _022609A8 - 2 ; case 4
	.short _022609E8 - _022609A8 - 2 ; case 5
	.short _022609E0 - _022609A8 - 2 ; case 6
	.short _022609E4 - _022609A8 - 2 ; case 7
_022609B8:
	ldrb r1, [r7, #2]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A37C
	mov r5, #4
	b _022609EC
_022609C6:
	mov r5, #5
	b _022609EC
_022609CA:
	ldrb r1, [r7, #2]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A37C
	mov r5, #6
	b _022609EC
_022609D8:
	mov r5, #0x13
	b _022609EC
_022609DC:
	mov r5, #0x11
	b _022609EC
_022609E0:
	mov r5, #0x1d
	b _022609EC
_022609E4:
	mov r5, #7
	b _022609EC
_022609E8:
	mov r0, #0
	str r0, [sp, #4]
_022609EC:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02260A0C
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_02260A0C:
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _02260A5A
_02260A16:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02260A5A
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_02260A2E:
	add r0, r6, #0
	bl ov49_0225EF68
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #1
	bl ov45_0222A5E8
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	mov r2, #1
	bl ov49_02258EEC
	add r0, r4, #0
	bl ov49_0225A010
	ldr r1, [sp]
	ldr r2, _02260A64 ; =ov49_02269B38
	mov r3, #0
	bl ov49_0225EF98
_02260A5A:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260A60: .word ov49_02269B88
_02260A64: .word ov49_02269B38
	thumb_func_end ov49_022607C4

	thumb_func_start ov49_02260A68
ov49_02260A68: ; 0x02260A68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r5, r0, #0
	str r2, [sp]
	bl ov49_0225EF84
	str r0, [sp, #8]
	add r0, r4, #0
	bl ov49_0225A010
	add r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	add r6, r0, #0
	add r0, r4, #0
	bl ov49_02259FE8
	add r7, r0, #0
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #6
	bls _02260AA0
	b _02260C4A
_02260AA0:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260AAC: ; jump table
	.short _02260ABA - _02260AAC - 2 ; case 0
	.short _02260B1E - _02260AAC - 2 ; case 1
	.short _02260BB4 - _02260AAC - 2 ; case 2
	.short _02260BD4 - _02260AAC - 2 ; case 3
	.short _02260BE8 - _02260AAC - 2 ; case 4
	.short _02260C04 - _02260AAC - 2 ; case 5
	.short _02260C1C - _02260AAC - 2 ; case 6
_02260ABA:
	add r0, r5, #0
	mov r1, #0xc
	bl ov49_0225EF40
	add r6, r0, #0
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #0xd
	bl ov45_0222A5E8
	add r0, r7, #0
	bl ov45_0222A330
	cmp r0, #1
	bne _02260AE8
	mov r0, #0x7a
	strh r0, [r6]
	add r0, r5, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _02260C4E
_02260AE8:
	add r0, r7, #0
	bl ov45_0222A3A0
	cmp r0, #1
	bne _02260AF8
	mov r0, #0xa
	strh r0, [r6, #2]
	b _02260B14
_02260AF8:
	add r0, r7, #0
	bl ov45_0222A2E0
	cmp r0, #1
	bne _02260B10
	mov r0, #0x62
	strh r0, [r6]
	add r0, r5, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _02260C4E
_02260B10:
	mov r0, #9
	strh r0, [r6, #2]
_02260B14:
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02260C4E
_02260B1E:
	ldr r0, [sp, #8]
	ldrh r0, [r0, #2]
	cmp r0, #9
	bne _02260B2C
	mov r0, #9
	str r0, [sp, #4]
	b _02260B36
_02260B2C:
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r7, #0
	bl ov45_0222A310
_02260B36:
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A034
	ldr r1, [sp, #4]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov49_0225A038
	mov r1, #0x17
	add r2, r1, #0
	add r0, r7, #0
	sub r2, #0x18
	bl ov45_0222A704
	add r0, r6, #0
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	add r7, r0, #0
	add r0, r4, #0
	bl ov49_02259FEC
	add r4, r0, #0
	add r0, r6, #0
	bl ov49_02258E34
	add r1, sp, #0x10
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	mov r0, #3
	strh r0, [r4, #6]
	mov r0, #4
	ldrsh r2, [r1, r0]
	asr r0, r2, #3
	lsr r0, r0, #0x1c
	add r0, r2, r0
	asr r0, r0, #4
	strh r0, [r4]
	mov r0, #6
	ldrsh r1, [r1, r0]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	strh r0, [r4, #2]
	strh r7, [r4, #4]
	mov r0, #0
	strh r0, [r4, #8]
	add r0, r5, #0
	bl ov49_0225EF68
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02260BB4:
	add r0, r6, #0
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	add r3, r0, #0
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	mov r2, #2
	bl ov49_02258EAC
	add r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260BD4:
	add r0, r6, #0
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _02260C4E
	add r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260BE8:
	ldr r2, [sp, #8]
	add r0, r4, #0
	ldrh r2, [r2]
	mov r1, #1
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260C04:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02260C4E
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260C1C:
	add r0, r5, #0
	bl ov49_0225EF68
	add r0, r4, #0
	bl ov49_02259FE8
	mov r1, #1
	bl ov45_0222A5E8
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r4, #0
	bl ov49_0225A010
	ldr r1, [sp]
	ldr r2, _02260C54 ; =ov49_02269B38
	mov r3, #0
	bl ov49_0225EF98
	b _02260C4E
_02260C4A:
	bl GF_AssertFail
_02260C4E:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260C54: .word ov49_02269B38
	thumb_func_end ov49_02260A68

	thumb_func_start ov49_02260C58
ov49_02260C58: ; 0x02260C58
	push {r3, lr}
	cmp r0, #0x1d
	bhi _02260CB6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260C6A: ; jump table
	.short _02260CB6 - _02260C6A - 2 ; case 0
	.short _02260CB6 - _02260C6A - 2 ; case 1
	.short _02260CB6 - _02260C6A - 2 ; case 2
	.short _02260CB6 - _02260C6A - 2 ; case 3
	.short _02260CB6 - _02260C6A - 2 ; case 4
	.short _02260CB6 - _02260C6A - 2 ; case 5
	.short _02260CAE - _02260C6A - 2 ; case 6
	.short _02260CAE - _02260C6A - 2 ; case 7
	.short _02260CAE - _02260C6A - 2 ; case 8
	.short _02260CAE - _02260C6A - 2 ; case 9
	.short _02260CAE - _02260C6A - 2 ; case 10
	.short _02260CAE - _02260C6A - 2 ; case 11
	.short _02260CAE - _02260C6A - 2 ; case 12
	.short _02260CAE - _02260C6A - 2 ; case 13
	.short _02260CB2 - _02260C6A - 2 ; case 14
	.short _02260CB2 - _02260C6A - 2 ; case 15
	.short _02260CB2 - _02260C6A - 2 ; case 16
	.short _02260CB2 - _02260C6A - 2 ; case 17
	.short _02260CB2 - _02260C6A - 2 ; case 18
	.short _02260CB2 - _02260C6A - 2 ; case 19
	.short _02260CB2 - _02260C6A - 2 ; case 20
	.short _02260CB2 - _02260C6A - 2 ; case 21
	.short _02260CA6 - _02260C6A - 2 ; case 22
	.short _02260CA6 - _02260C6A - 2 ; case 23
	.short _02260CA6 - _02260C6A - 2 ; case 24
	.short _02260CA6 - _02260C6A - 2 ; case 25
	.short _02260CAA - _02260C6A - 2 ; case 26
	.short _02260CAA - _02260C6A - 2 ; case 27
	.short _02260CAA - _02260C6A - 2 ; case 28
	.short _02260CAA - _02260C6A - 2 ; case 29
_02260CA6:
	mov r0, #2
	pop {r3, pc}
_02260CAA:
	mov r0, #3
	pop {r3, pc}
_02260CAE:
	mov r0, #0
	pop {r3, pc}
_02260CB2:
	mov r0, #1
	pop {r3, pc}
_02260CB6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02260C58

	thumb_func_start ov49_02260CC0
ov49_02260CC0: ; 0x02260CC0
	push {r3, lr}
	cmp r0, #0x1d
	bhi _02260D1E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260CD2: ; jump table
	.short _02260D1E - _02260CD2 - 2 ; case 0
	.short _02260D1E - _02260CD2 - 2 ; case 1
	.short _02260D1E - _02260CD2 - 2 ; case 2
	.short _02260D1E - _02260CD2 - 2 ; case 3
	.short _02260D1E - _02260CD2 - 2 ; case 4
	.short _02260D1E - _02260CD2 - 2 ; case 5
	.short _02260D16 - _02260CD2 - 2 ; case 6
	.short _02260D16 - _02260CD2 - 2 ; case 7
	.short _02260D16 - _02260CD2 - 2 ; case 8
	.short _02260D16 - _02260CD2 - 2 ; case 9
	.short _02260D16 - _02260CD2 - 2 ; case 10
	.short _02260D16 - _02260CD2 - 2 ; case 11
	.short _02260D16 - _02260CD2 - 2 ; case 12
	.short _02260D16 - _02260CD2 - 2 ; case 13
	.short _02260D1A - _02260CD2 - 2 ; case 14
	.short _02260D1A - _02260CD2 - 2 ; case 15
	.short _02260D1A - _02260CD2 - 2 ; case 16
	.short _02260D1A - _02260CD2 - 2 ; case 17
	.short _02260D1A - _02260CD2 - 2 ; case 18
	.short _02260D1A - _02260CD2 - 2 ; case 19
	.short _02260D1A - _02260CD2 - 2 ; case 20
	.short _02260D1A - _02260CD2 - 2 ; case 21
	.short _02260D0E - _02260CD2 - 2 ; case 22
	.short _02260D0E - _02260CD2 - 2 ; case 23
	.short _02260D0E - _02260CD2 - 2 ; case 24
	.short _02260D0E - _02260CD2 - 2 ; case 25
	.short _02260D12 - _02260CD2 - 2 ; case 26
	.short _02260D12 - _02260CD2 - 2 ; case 27
	.short _02260D12 - _02260CD2 - 2 ; case 28
	.short _02260D12 - _02260CD2 - 2 ; case 29
_02260D0E:
	mov r0, #1
	pop {r3, pc}
_02260D12:
	mov r0, #2
	pop {r3, pc}
_02260D16:
	mov r0, #6
	pop {r3, pc}
_02260D1A:
	mov r0, #7
	pop {r3, pc}
_02260D1E:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02260CC0

	thumb_func_start ov49_02260D28
ov49_02260D28: ; 0x02260D28
	push {r3, lr}
	cmp r0, #0x1d
	bhi _02260D86
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260D3A: ; jump table
	.short _02260D86 - _02260D3A - 2 ; case 0
	.short _02260D86 - _02260D3A - 2 ; case 1
	.short _02260D86 - _02260D3A - 2 ; case 2
	.short _02260D86 - _02260D3A - 2 ; case 3
	.short _02260D86 - _02260D3A - 2 ; case 4
	.short _02260D86 - _02260D3A - 2 ; case 5
	.short _02260D7E - _02260D3A - 2 ; case 6
	.short _02260D7E - _02260D3A - 2 ; case 7
	.short _02260D7E - _02260D3A - 2 ; case 8
	.short _02260D7E - _02260D3A - 2 ; case 9
	.short _02260D7E - _02260D3A - 2 ; case 10
	.short _02260D7E - _02260D3A - 2 ; case 11
	.short _02260D7E - _02260D3A - 2 ; case 12
	.short _02260D7E - _02260D3A - 2 ; case 13
	.short _02260D82 - _02260D3A - 2 ; case 14
	.short _02260D82 - _02260D3A - 2 ; case 15
	.short _02260D82 - _02260D3A - 2 ; case 16
	.short _02260D82 - _02260D3A - 2 ; case 17
	.short _02260D82 - _02260D3A - 2 ; case 18
	.short _02260D82 - _02260D3A - 2 ; case 19
	.short _02260D82 - _02260D3A - 2 ; case 20
	.short _02260D82 - _02260D3A - 2 ; case 21
	.short _02260D76 - _02260D3A - 2 ; case 22
	.short _02260D76 - _02260D3A - 2 ; case 23
	.short _02260D76 - _02260D3A - 2 ; case 24
	.short _02260D76 - _02260D3A - 2 ; case 25
	.short _02260D7A - _02260D3A - 2 ; case 26
	.short _02260D7A - _02260D3A - 2 ; case 27
	.short _02260D7A - _02260D3A - 2 ; case 28
	.short _02260D7A - _02260D3A - 2 ; case 29
_02260D76:
	mov r0, #7
	pop {r3, pc}
_02260D7A:
	mov r0, #8
	pop {r3, pc}
_02260D7E:
	mov r0, #5
	pop {r3, pc}
_02260D82:
	mov r0, #6
	pop {r3, pc}
_02260D86:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02260D28

	thumb_func_start ov49_02260D90
ov49_02260D90: ; 0x02260D90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02260DA4
	cmp r0, #1
	beq _02260DFA
	b _02260E24
_02260DA4:
	add r0, r4, #0
	bl ov49_02259FE8
	add r6, r0, #0
	bl ov45_0222A330
	cmp r0, #1
	bne _02260DC2
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	bl ov49_0225A30C
	add r1, r0, #0
	b _02260DE6
_02260DC2:
	add r0, r6, #0
	bl ov45_0222A374
	cmp r0, #1
	bne _02260DDA
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4e
	bl ov49_0225A30C
	add r1, r0, #0
	b _02260DE6
_02260DDA:
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ov49_0225A30C
	add r1, r0, #0
_02260DE6:
	add r0, r4, #0
	bl ov49_0225A08C
	ldr r0, _02260E28 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl ov49_0225EF90
	b _02260E24
_02260DFA:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _02260E24
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	bl ov49_02259FF0
	add r4, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov49_02258EEC
	mov r0, #1
	pop {r4, r5, r6, pc}
_02260E24:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02260E28: .word 0x000005DC
	thumb_func_end ov49_02260D90

	thumb_func_start ov49_02260E2C
ov49_02260E2C: ; 0x02260E2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	str r2, [sp]
	bl ov49_02259FF0
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov49_02259FF8
	add r7, r0, #0
	add r0, r5, #0
	bl ov49_0225A008
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #4]
	add r0, r6, #0
	bl ov49_0225EF84
	add r4, r0, #0
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0xf
	bls _02260E6A
	b _022611C0
_02260E6A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02260E76: ; jump table
	.short _02260E96 - _02260E76 - 2 ; case 0
	.short _02260EDE - _02260E76 - 2 ; case 1
	.short _02260F52 - _02260E76 - 2 ; case 2
	.short _02260FE2 - _02260E76 - 2 ; case 3
	.short _02261016 - _02260E76 - 2 ; case 4
	.short _02261046 - _02260E76 - 2 ; case 5
	.short _02261082 - _02260E76 - 2 ; case 6
	.short _02261098 - _02260E76 - 2 ; case 7
	.short _022610B0 - _02260E76 - 2 ; case 8
	.short _022610D0 - _02260E76 - 2 ; case 9
	.short _022610F0 - _02260E76 - 2 ; case 10
	.short _02261110 - _02260E76 - 2 ; case 11
	.short _02261124 - _02260E76 - 2 ; case 12
	.short _02261134 - _02260E76 - 2 ; case 13
	.short _02261180 - _02260E76 - 2 ; case 14
	.short _02261196 - _02260E76 - 2 ; case 15
_02260E96:
	add r0, r6, #0
	mov r1, #0x18
	bl ov49_0225EF40
	add r4, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp]
	bl ov49_02258D70
	str r0, [r4, #0xc]
	add r0, r5, #0
	bl ov49_0225A040
	cmp r0, #0x21
	beq _02260EBE
	cmp r0, #0x22
	beq _02260EC4
	cmp r0, #0x23
	beq _02260ECA
	b _02260ED0
_02260EBE:
	mov r0, #2
	strh r0, [r4, #6]
	b _02260ED4
_02260EC4:
	mov r0, #1
	strh r0, [r4, #6]
	b _02260ED4
_02260ECA:
	mov r0, #0
	strh r0, [r4, #6]
	b _02260ED4
_02260ED0:
	bl GF_AssertFail
_02260ED4:
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _022611C0
_02260EDE:
	ldr r0, [sp, #4]
	bl ov45_0222A374
	cmp r0, #0
	bne _02260EF6
	mov r0, #8
	strh r0, [r4, #4]
	add r0, r6, #0
	mov r1, #6
	bl ov49_0225EF8C
	b _022611C0
_02260EF6:
	ldr r0, [sp, #4]
	bl ov45_0222A330
	cmp r0, #1
	bne _02260F0E
	mov r0, #0xa
	strh r0, [r4, #4]
	add r0, r6, #0
	mov r1, #6
	bl ov49_0225EF8C
	b _022611C0
_02260F0E:
	ldrh r2, [r4, #6]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl ov45_0222ADB8
	mov r1, #0
	mvn r1, r1
	str r0, [r4]
	cmp r0, r1
	beq _02260F44
	add r0, r6, #0
	mov r1, #2
	bl ov49_0225EF8C
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x1f
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
	b _022611C0
_02260F44:
	mov r0, #9
	strh r0, [r4, #4]
	add r0, r6, #0
	mov r1, #6
	bl ov49_0225EF8C
	b _022611C0
_02260F52:
	ldr r0, _022611C8 ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	bne _02260F62
	mov r1, #0x80
	tst r0, r1
	beq _02260F82
_02260F62:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl ov45_0222ADC8
	add r0, r5, #0
	bl ov49_0225A0CC
	mov r0, #6
	strb r0, [r4, #0xa]
	mov r0, #0xf
	strh r0, [r4, #4]
	add r0, r6, #0
	mov r1, #0xc
	bl ov49_0225EF8C
	b _022611C0
_02260F82:
	add r0, r4, #0
	add r1, r7, #0
	bl ov49_022611F4
	cmp r0, #1
	beq _02260F90
	b _022611C0
_02260F90:
	add r0, r5, #0
	bl ov49_0225A0CC
	ldr r0, [sp, #4]
	bl ov45_0222AE44
	mov r0, #0
	strh r0, [r4, #8]
	add r0, r5, #0
	bl ov49_02259FE8
	mov r1, #0xa
	bl ov45_0222A5E8
	add r0, r5, #0
	bl ov49_0225A044
	ldr r0, [sp, #0xc]
	bl ov49_0225CC44
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov49_02259130
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ov49_0225916C
	ldr r0, _022611CC ; =0x000005C1
	bl PlaySE
	add r0, r5, #0
	bl ov49_0225A510
	mov r0, #3
	strb r0, [r4, #0xa]
	add r0, r6, #0
	mov r1, #0xc
	bl ov49_0225EF8C
	b _022611C0
_02260FE2:
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl ov49_02261234
	cmp r0, #1
	bne _022610A4
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov49_0225916C
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl ov49_02259160
	ldr r0, [r4, #0xc]
	mov r1, #8
	bl ov49_022591B4
	add r0, r6, #0
	mov r1, #4
	bl ov49_0225EF8C
	mov r0, #0
	strh r0, [r4, #8]
	b _022611C0
_02261016:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02261434
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl ov49_022611D4
	add r0, r4, #0
	add r1, r7, #0
	bl ov49_022613AC
	cmp r0, #1
	bne _022610A4
	add r0, r6, #0
	mov r1, #5
	bl ov49_0225EF8C
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A53C
	b _022611C0
_02261046:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02261434
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl ov49_022611D4
	ldr r0, [r4, #0xc]
	add r1, sp, #0x10
	bl ov49_02259154
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02261460
	mov r0, #6
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0x10
	cmp r1, r0
	bge _022610A4
	mov r0, #0
	strb r0, [r4, #0xb]
	add r0, r6, #0
	mov r1, #0xd
	bl ov49_0225EF8C
	b _022611C0
_02261082:
	ldr r0, [sp, #8]
	ldr r1, [r4, #0xc]
	mov r2, #2
	mov r3, #1
	bl ov49_02258EAC
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	b _022611C0
_02261098:
	ldr r0, [r4, #0xc]
	mov r1, #5
	bl ov49_02258E60
	cmp r0, #0
	beq _022610A6
_022610A4:
	b _022611C0
_022610A6:
	ldrh r1, [r4, #4]
	add r0, r6, #0
	bl ov49_0225EF8C
	b _022611C0
_022610B0:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x1e
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0xf
	strh r0, [r4, #4]
	add r0, r6, #0
	mov r1, #0xb
	bl ov49_0225EF8C
	b _022611C0
_022610D0:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x20
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0xf
	strh r0, [r4, #4]
	add r0, r6, #0
	mov r1, #0xb
	bl ov49_0225EF8C
	b _022611C0
_022610F0:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x21
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0xf
	strh r0, [r4, #4]
	add r0, r6, #0
	mov r1, #0xb
	bl ov49_0225EF8C
	b _022611C0
_02261110:
	add r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _022611C0
	ldrh r1, [r4, #4]
	add r0, r6, #0
	bl ov49_0225EF8C
	b _022611C0
_02261124:
	add r0, r5, #0
	bl ov49_0225A0EC
	ldrb r1, [r4, #0xa]
	add r0, r6, #0
	bl ov49_0225EF8C
	b _022611C0
_02261134:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02261434
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02261460
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0x78
	bls _022611C0
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225A034
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A038
	add r0, r5, #0
	bl ov49_0225A0EC
	add r0, r5, #0
	bl ov49_02259FE8
	mov r1, #0xb
	bl ov45_0222A5E8
	add r0, r6, #0
	mov r1, #0xe
	bl ov49_0225EF8C
	b _022611C0
_02261180:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02261434
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02261460
	b _022611C0
_02261196:
	add r0, r5, #0
	bl ov49_0225A010
	add r7, r0, #0
	add r0, r5, #0
	bl ov49_0225A0EC
	ldr r0, [sp, #8]
	ldr r1, [r4, #0xc]
	mov r2, #1
	bl ov49_02258EEC
	add r0, r6, #0
	bl ov49_0225EF68
	ldr r1, [sp]
	ldr r2, _022611D0 ; =ov49_02269B38
	add r0, r7, #0
	mov r3, #0
	bl ov49_0225EF98
_022611C0:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022611C8: .word gSystem
_022611CC: .word 0x000005C1
_022611D0: .word ov49_02269B38
	thumb_func_end ov49_02260E2C

	thumb_func_start ov49_022611D4
ov49_022611D4: ; 0x022611D4
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	add r1, sp, #0
	bl ov49_02259154
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl ov49_0225CC20
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_022611D4

	thumb_func_start ov49_022611F4
ov49_022611F4: ; 0x022611F4
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov45_0222AE08
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	add r3, sp, #8
	bl ov49_0225E420
	ldr r0, [r5, #0xc]
	add r1, sp, #0x14
	bl ov49_02259154
	mov r0, #1
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x10
	add r1, r1, r0
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _0226122E
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, pc}
_0226122E:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_022611F4

	thumb_func_start ov49_02261234
ov49_02261234: ; 0x02261234
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #8
	add r6, r1, #0
	ldrsh r1, [r5, r0]
	add r7, r2, #0
	add r1, r1, #1
	strh r1, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0x18
	bge _02261250
	mov r4, #0
	b _02261256
_02261250:
	mov r0, #0x18
	strh r0, [r5, #8]
	mov r4, #1
_02261256:
	ldr r0, [r5]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov45_0222AE08
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r3, sp, #0x1c
	bl ov49_0225E420
	ldr r0, [r5, #0xc]
	bl ov49_02258E34
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1]
	add r0, sp, #4
	strh r2, [r1, #4]
	ldrh r2, [r1, #2]
	strh r2, [r1, #6]
	add r1, sp, #0x28
	bl ov49_02258800
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	sub r6, r1, r0
	mov r0, #8
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _022612AE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022612BC
_022612AE:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022612BC:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #6
	lsl r1, r1, #0xe
	bl FX_Div
	str r0, [sp, #0x14]
	mov r0, #8
	ldrsh r2, [r5, r0]
	cmp r2, #4
	blt _02261342
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x30]
	sub r6, r1, r0
	sub r0, r2, #4
	cmp r0, #0
	ble _0226130A
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02261318
_0226130A:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02261318:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #5
	lsl r1, r1, #0xe
	bl FX_Div
	str r0, [sp, #0x18]
	b _02261346
_02261342:
	mov r0, #0
	str r0, [sp, #0x18]
_02261346:
	add r0, sp, #0x10
	add r1, sp, #0x28
	add r2, r0, #0
	bl VEC_Add
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r0, r7, #0
	bl ov49_0225CC20
	mov r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, _022613A4 ; =0x00007FFF
	mul r0, r1
	mov r1, #0x18
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #2
	ldr r0, _022613A8 ; =FX_SinCosTable_
	ldr r1, [sp, #0x14]
	ldrsh r3, [r0, r2]
	asr r0, r3, #0x1f
	lsr r2, r3, #0x10
	lsl r0, r0, #0x10
	orr r0, r2
	mov r2, #2
	lsl r6, r3, #0x10
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r6, r2
	adc r0, r3
	lsl r0, r0, #0x14
	lsr r2, r2, #0xc
	orr r2, r0
	add r0, r1, r2
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x10
	bl ov49_02259148
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022613A4: .word 0x00007FFF
_022613A8: .word FX_SinCosTable_
	thumb_func_end ov49_02261234

	thumb_func_start ov49_022613AC
ov49_022613AC: ; 0x022613AC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #8
	ldrsh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0x10
	bge _022613C4
	mov r6, #0
	b _022613CA
_022613C4:
	mov r0, #0x10
	strh r0, [r5, #8]
	mov r6, #1
_022613CA:
	mov r0, #8
	ldrsh r0, [r5, r0]
	mov r3, #0
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r1, r2, r1
	ldr r0, _0226142C ; =0x00007FFF
	add r2, r1, #0
	mul r2, r0
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	lsl r0, r0, #0xd
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02261430 ; =FX_SinCosTable_
	mov r2, #3
	ldrsh r0, [r0, r1]
	lsl r2, r2, #0xc
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r4, r2, #0xc
	orr r4, r0
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, [sp, #4]
	add r1, sp, #0
	add r0, r0, r4
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	bl ov49_02259148
	add r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0226142C: .word 0x00007FFF
_02261430: .word FX_SinCosTable_
	thumb_func_end ov49_022613AC

	thumb_func_start ov49_02261434
ov49_02261434: ; 0x02261434
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r1, sp, #0
	add r2, sp, #4
	bl ov45_0222AE08
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r3, sp, #8
	bl ov49_0225E420
	ldr r0, [r5, #0xc]
	add r1, sp, #8
	bl ov49_02259148
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_02261434

	thumb_func_start ov49_02261460
ov49_02261460: ; 0x02261460
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r2, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov45_0222AE08
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov49_0225A520
	cmp r0, #1
	bne _02261494
	add r0, r5, #0
	add r0, #0x10
	bl ov49_0225F438
	cmp r0, #0
	bne _022614A8
	add r0, r5, #0
	add r0, #0x10
	bl ov49_0225F374
	b _022614A8
_02261494:
	add r0, r5, #0
	add r0, #0x10
	bl ov49_0225F438
	cmp r0, #1
	bne _022614A8
	add r0, r5, #0
	add r0, #0x10
	bl ov49_0225F430
_022614A8:
	add r0, r5, #0
	add r0, #0x10
	bl ov49_0225F394
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	add r1, sp, #8
	bl ov49_02259154
	ldr r0, [sp, #0xc]
	add r1, sp, #8
	add r0, r0, r4
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	bl ov49_02259148
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov49_02261460

	thumb_func_start ov49_022614CC
ov49_022614CC: ; 0x022614CC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x12
	bl ov49_0225A10C
	mov r4, #1
	mov r6, #0
	add r7, r4, #0
_022614E0:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov49_0225A40C
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #6
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov49_0225A144
	add r4, r4, #1
	cmp r4, #0x12
	blt _022614E0
	add r0, r5, #0
	mov r1, #1
	mov r2, #7
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A144
	ldr r2, [sp]
	ldr r3, _0226153C ; =ov49_02269C00
	add r2, #8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1, #8]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226153C: .word ov49_02269C00
	thumb_func_end ov49_022614CC

	thumb_func_start ov49_02261540
ov49_02261540: ; 0x02261540
	ldr r3, _02261548 ; =ov49_0225A134
	add r0, r1, #0
	bx r3
	nop
_02261548: .word ov49_0225A134
	thumb_func_end ov49_02261540

	thumb_func_start ov49_0226154C
ov49_0226154C: ; 0x0226154C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	add r4, r2, #0
	bl ov49_02259FE8
	str r0, [sp, #8]
	add r0, r6, #0
	bl ov49_02259FF0
	add r1, r4, #0
	str r0, [sp, #0xc]
	bl ov49_02258D70
	add r7, r0, #0
	add r0, r5, #0
	bl ov49_0225EF84
	str r0, [sp, #0x10]
	add r0, r6, #0
	bl ov49_0225A010
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bhi _02261606
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261594: ; jump table
	.short _022615A0 - _02261594 - 2 ; case 0
	.short _022615B0 - _02261594 - 2 ; case 1
	.short _022615D4 - _02261594 - 2 ; case 2
	.short _02261618 - _02261594 - 2 ; case 3
	.short _022616CA - _02261594 - 2 ; case 4
	.short _022616DC - _02261594 - 2 ; case 5
_022615A0:
	add r0, r5, #0
	mov r1, #8
	bl ov49_0225EF40
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
_022615B0:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov45_0222A230
	add r6, r0, #0
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov45_0222A550
	cmp r6, #1
	beq _022615CA
	cmp r0, #1
	bne _02261606
_022615CA:
	add r0, r5, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _02261710
_022615D4:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov45_0222A578
	add r6, r0, #0
	bne _022615EA
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02261710
_022615EA:
	bl ov45_0222AADC
	cmp r0, #1
	bne _02261606
	add r0, r6, #0
	bl ov45_0222AA5C
	add r2, r0, #0
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	bl ov49_02258CB8
	cmp r0, #0
	bne _02261608
_02261606:
	b _02261710
_02261608:
	mov r1, #0
	bl ov49_022591C0
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _02261710
_02261618:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov45_0222A578
	cmp r0, #0
	bne _02261638
	cmp r7, #0
	beq _0226162E
	add r0, r7, #0
	bl ov49_02258D54
_0226162E:
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02261710
_02261638:
	bl ov45_0222A920
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #8]
	add r2, r6, #0
	add r3, r7, #0
	bl ov49_02261DBC
	cmp r0, #0
	beq _02261696
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A06C
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A04C
	add r0, r7, #0
	mov r1, #0
	bl ov49_02259130
	ldr r0, [sp, #0x14]
	ldr r2, _02261718 ; =ov49_02269B58
	ldr r3, [sp, #0x10]
	add r1, r4, #0
	bl ov49_0225EFC4
	b _02261710
_02261696:
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r2, #4
	bl ov49_02258EEC
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225EF8C
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A04C
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A06C
	add r0, r7, #0
	mov r1, #1
	bl ov49_022591C0
	b _02261710
_022616CA:
	add r0, r7, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _02261710
	add r0, r5, #0
	bl ov49_0225EF90
	b _02261710
_022616DC:
	add r0, r5, #0
	bl ov49_0225EF68
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r2, #2
	bl ov49_02258EEC
	ldr r0, [sp, #0x14]
	ldr r2, _0226171C ; =ov49_02269B40
	add r1, r4, #0
	mov r3, #0
	bl ov49_0225EF98
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov49_0225A04C
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov49_0225A06C
_02261710:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261718: .word ov49_02269B58
_0226171C: .word ov49_02269B40
	thumb_func_end ov49_0226154C

	thumb_func_start ov49_02261720
ov49_02261720: ; 0x02261720
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r4, r2, #0
	bl ov49_02259FE8
	add r6, r0, #0
	add r0, r5, #0
	bl ov49_02259FF0
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov49_0225A010
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	bl ov49_02258D70
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	bl ov49_02258DAC
	ldr r0, [sp, #8]
	bl ov49_0225EF84
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	bl ov49_0225EF88
	cmp r0, #0
	beq _0226176A
	cmp r0, #1
	beq _0226177C
	b _022618AA
_0226176A:
	ldr r0, [sp, #8]
	mov r1, #8
	bl ov49_0225EF40
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	mov r1, #1
	bl ov49_0225EF8C
_0226177C:
	add r0, r6, #0
	add r1, r4, #0
	bl ov45_0222A25C
	cmp r0, #0
	beq _022617BE
	ldr r0, [sp, #8]
	bl ov49_0225EF68
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A06C
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A04C
	ldr r0, [sp, #0xc]
	ldr r2, _022618B0 ; =ov49_02269B48
	add r1, r4, #0
	mov r3, #0
	bl ov49_0225EF98
	b _022618AA
_022617BE:
	add r0, r6, #0
	add r1, r4, #0
	bl ov45_0222A2A0
	add r0, r6, #0
	bl ov45_0222A374
	cmp r0, #1
	bne _0226181E
	add r0, r6, #0
	add r1, r4, #0
	bl ov45_0222ADA8
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0226181E
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A06C
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A04C
	add r0, r7, #0
	mov r1, #0
	bl ov49_02259130
	ldr r0, [sp, #8]
	bl ov49_0225EF68
	ldr r0, [sp, #0xc]
	ldr r2, _022618B4 ; =ov49_02269B50
	ldr r3, [sp, #0x14]
	add r1, r4, #0
	bl ov49_0225EF98
	b _022618AA
_0226181E:
	add r0, r6, #0
	add r1, r4, #0
	bl ov45_0222A578
	bl ov45_0222A920
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	add r2, r5, #0
	add r3, r7, #0
	bl ov49_02261DBC
	cmp r0, #0
	beq _0226187C
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A06C
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A04C
	add r0, r7, #0
	mov r1, #0
	bl ov49_02259130
	ldr r0, [sp, #0xc]
	ldr r2, _022618B8 ; =ov49_02269B58
	ldr r3, [sp, #0x14]
	add r1, r4, #0
	bl ov49_0225EFC4
	b _022618AA
_0226187C:
	add r0, r6, #0
	add r1, r4, #0
	bl ov45_0222AD58
	cmp r0, #1
	bne _022618AA
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A04C
	ldr r0, [sp, #0xc]
	ldr r2, _022618BC ; =ov49_02269B80
	add r1, r4, #0
	mov r3, #0
	bl ov49_0225EFC4
_022618AA:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022618B0: .word ov49_02269B48
_022618B4: .word ov49_02269B50
_022618B8: .word ov49_02269B58
_022618BC: .word ov49_02269B80
	thumb_func_end ov49_02261720

	thumb_func_start ov49_022618C0
ov49_022618C0: ; 0x022618C0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	str r2, [sp]
	add r0, r6, #0
	bl ov49_02259FF0
	ldr r1, [sp]
	add r7, r0, #0
	bl ov49_02258D70
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _022618EC
	cmp r0, #1
	beq _022618FE
	cmp r0, #2
	beq _02261910
	b _02261926
_022618EC:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #3
	bl ov49_02258EEC
	add r0, r5, #0
	bl ov49_0225EF90
	b _02261926
_022618FE:
	add r0, r4, #0
	bl ov49_02258F38
	cmp r0, #0
	beq _02261926
	add r0, r5, #0
	bl ov49_0225EF90
	b _02261926
_02261910:
	add r0, r4, #0
	bl ov49_02258D54
	add r0, r6, #0
	bl ov49_0225A010
	ldr r1, [sp]
	ldr r2, _0226192C ; =ov49_02269B78
	mov r3, #0
	bl ov49_0225EF98
_02261926:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226192C: .word ov49_02269B78
	thumb_func_end ov49_022618C0

	thumb_func_start ov49_02261930
ov49_02261930: ; 0x02261930
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	add r7, r2, #0
	bl ov49_02259FE8
	str r0, [sp]
	add r0, r6, #0
	bl ov49_02259FF0
	str r0, [sp, #8]
	add r0, r6, #0
	bl ov49_02259FF8
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov49_0225EF84
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #4
	bhi _022619CE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261970: ; jump table
	.short _0226197A - _02261970 - 2 ; case 0
	.short _022619C4 - _02261970 - 2 ; case 1
	.short _02261A2A - _02261970 - 2 ; case 2
	.short _02261AD8 - _02261970 - 2 ; case 3
	.short _02261B48 - _02261970 - 2 ; case 4
_0226197A:
	add r0, r5, #0
	mov r1, #0x20
	bl ov49_0225EF40
	add r4, r0, #0
	ldr r0, [sp, #8]
	add r1, r7, #0
	bl ov49_02258D70
	str r0, [r4]
	ldr r0, [sp]
	add r1, r7, #0
	bl ov45_0222ADA8
	mov r1, #0
	mvn r1, r1
	str r0, [r4, #4]
	cmp r0, r1
	bne _022619A4
	bl GF_AssertFail
_022619A4:
	add r2, r4, #0
	ldr r0, [r4, #4]
	add r1, r4, #4
	add r2, #8
	bl ov45_0222AE08
	ldr r0, [sp, #8]
	ldr r1, [r4]
	mov r2, #3
	bl ov49_02258EEC
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02261B64
_022619C4:
	ldr r0, [r4]
	bl ov49_02258F38
	cmp r0, #0
	bne _022619D0
_022619CE:
	b _02261B64
_022619D0:
	ldr r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r3, sp, #0x34
	bl ov49_0225E420
	mov r0, #1
	ldr r1, [sp, #0x34]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [r4, #0x10]
	ldr r0, [r4]
	add r1, sp, #0x34
	bl ov49_02259154
	ldr r0, [sp, #0x38]
	mov r3, sp
	str r0, [r4, #0xc]
	mov r1, #0
	str r1, [r4, #0x14]
	add r0, sp, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	add r1, sp, #0xc
	ldrh r2, [r1]
	ldr r0, [r4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258DB4
	ldr r0, _02261B6C ; =0x0000064E
	bl PlaySE
	ldr r0, [r4]
	mov r1, #1
	bl ov49_02259184
	add r0, r5, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _02261B64
_02261A2A:
	ldr r0, [r4, #0x14]
	mov r6, #0
	add r0, r0, #1
	str r0, [r4, #0x14]
	cmp r0, #0x18
	blt _02261A3C
	mov r0, #0x18
	str r0, [r4, #0x14]
	mov r6, #1
_02261A3C:
	ldr r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r3, sp, #0x28
	bl ov49_0225E420
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	str r0, [sp, #0x24]
	ldr r0, [r4, #0x10]
	str r0, [sp, #0x1c]
	ldr r0, [r4, #0xc]
	sub r7, r1, r0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	ble _02261A6E
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02261A7C
_02261A6E:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02261A7C:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #6
	lsl r1, r1, #0xe
	bl FX_Div
	str r0, [sp, #0x20]
	ldr r1, [r4, #0xc]
	add r0, r0, r1
	str r0, [sp, #0x20]
	ldr r0, [r4]
	add r1, sp, #0x1c
	bl ov49_02259148
	cmp r6, #1
	bne _02261B64
	ldr r0, [r4]
	mov r1, #0
	bl ov49_02259184
	ldr r0, [r4]
	mov r1, #8
	bl ov49_022591B4
	ldr r0, [r4]
	mov r1, #2
	bl ov49_02259160
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _02261B64
_02261AD8:
	ldr r1, [r4, #4]
	add r0, r6, #0
	bl ov49_0225A520
	cmp r0, #1
	bne _02261AFA
	add r0, r4, #0
	add r0, #0x18
	bl ov49_0225F438
	cmp r0, #0
	bne _02261B0E
	add r0, r4, #0
	add r0, #0x18
	bl ov49_0225F374
	b _02261B0E
_02261AFA:
	add r0, r4, #0
	add r0, #0x18
	bl ov49_0225F438
	cmp r0, #1
	bne _02261B0E
	add r0, r4, #0
	add r0, #0x18
	bl ov49_0225F430
_02261B0E:
	add r0, r4, #0
	add r0, #0x18
	bl ov49_0225F394
	add r6, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r3, sp, #0x10
	bl ov49_0225E420
	ldr r0, [sp, #0x14]
	add r1, sp, #0x10
	add r0, r0, r6
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov49_02259148
	ldr r0, [sp]
	ldr r1, [r4, #4]
	bl ov45_0222AD80
	cmp r0, #2
	bne _02261B64
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225EF8C
	b _02261B64
_02261B48:
	ldr r0, [r4]
	bl ov49_02258D54
	add r0, r5, #0
	bl ov49_0225EF68
	add r0, r6, #0
	bl ov49_0225A010
	ldr r2, _02261B70 ; =ov49_02269B78
	add r1, r7, #0
	mov r3, #0
	bl ov49_0225EF98
_02261B64:
	mov r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261B6C: .word 0x0000064E
_02261B70: .word ov49_02269B78
	thumb_func_end ov49_02261930

	thumb_func_start ov49_02261B74
ov49_02261B74: ; 0x02261B74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp]
	add r7, r0, #0
	add r4, r2, #0
	bl ov49_0225EF3C
	add r6, r0, #0
	ldr r0, [sp]
	bl ov49_02259FE8
	str r0, [sp, #8]
	ldr r0, [sp]
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	add r1, r4, #0
	bl ov49_02258D70
	add r5, r0, #0
	ldr r0, [sp, #0xc]
	bl ov49_02258DAC
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl ov49_0225EF88
	cmp r0, #0xa
	bhi _02261C58
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261BBA: ; jump table
	.short _02261BD0 - _02261BBA - 2 ; case 0
	.short _02261BE8 - _02261BBA - 2 ; case 1
	.short _02261BFA - _02261BBA - 2 ; case 2
	.short _02261C0C - _02261BBA - 2 ; case 3
	.short _02261C4E - _02261BBA - 2 ; case 4
	.short _02261C84 - _02261BBA - 2 ; case 5
	.short _02261D2E - _02261BBA - 2 ; case 6
	.short _02261BFA - _02261BBA - 2 ; case 7
	.short _02261D40 - _02261BBA - 2 ; case 8
	.short _02261BFA - _02261BBA - 2 ; case 9
	.short _02261D8E - _02261BBA - 2 ; case 10
_02261BD0:
	ldrb r0, [r6, #4]
	cmp r0, #0
	bne _02261BDE
	add r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261BDE:
	add r0, r7, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _02261DB6
_02261BE8:
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	mov r2, #3
	bl ov49_02258EEC
	add r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261BFA:
	add r0, r5, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _02261C58
	add r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261C0C:
	add r0, r5, #0
	bl ov49_02258E34
	add r2, sp, #0x14
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	add r1, sp, #0x1c
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	add r0, r5, #0
	bl ov49_0225913C
	add r0, r5, #0
	bl ov49_022591CC
	cmp r0, #0
	bne _02261C3C
	add r0, r5, #0
	mov r1, #1
	bl ov49_022591C0
_02261C3C:
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	mov r2, #4
	bl ov49_02258EEC
	add r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261C4E:
	add r0, r5, #0
	bl ov49_02258F38
	cmp r0, #1
	beq _02261C5A
_02261C58:
	b _02261DB6
_02261C5A:
	add r0, r7, #0
	bl ov49_0225EF90
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	mov r2, #0
	bl ov49_02258EEC
	lsl r1, r4, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov49_0225A04C
	lsl r1, r4, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov49_0225A06C
	b _02261DB6
_02261C84:
	mov r0, #0
	str r0, [sp, #4]
	ldrb r0, [r6, #3]
	cmp r0, #1
	bne _02261CC4
	ldr r0, [sp, #8]
	bl ov45_0222B0B0
	cmp r0, #0
	bne _02261CC4
	ldr r0, [sp, #8]
	bl ov45_0222A5C0
	bl ov45_0222A920
	cmp r0, #9
	bne _02261CC4
	ldr r0, [sp, #8]
	bl ov45_0222B0A4
	add r0, r5, #0
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	add r3, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	mov r2, #0
	bl ov49_02258EAC
_02261CC4:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov45_0222A578
	add r5, r0, #0
	bne _02261CD6
	mov r0, #1
	str r0, [sp, #4]
	b _02261D08
_02261CD6:
	ldrb r0, [r6, #3]
	cmp r0, #1
	bne _02261CEC
	ldr r0, [sp, #8]
	bl ov45_0222AFF8
	cmp r0, #0
	bne _02261CEC
	mov r0, #1
	str r0, [sp, #4]
	b _02261D08
_02261CEC:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov45_0222A2A0
	cmp r0, #0
	beq _02261D08
	add r0, r5, #0
	bl ov45_0222A920
	ldrb r1, [r6, #2]
	cmp r0, r1
	beq _02261D08
	mov r0, #1
	str r0, [sp, #4]
_02261D08:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02261DB6
	add r0, r7, #0
	bl ov49_0225EF90
	lsl r1, r4, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A04C
	lsl r1, r4, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov49_0225A06C
	b _02261DB6
_02261D2E:
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	mov r2, #3
	bl ov49_02258EEC
	add r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261D40:
	ldr r0, [sp, #0xc]
	bl ov49_02258DAC
	ldrb r1, [r6]
	ldrb r2, [r6, #1]
	bl ov49_02258FDC
	cmp r0, #0
	bne _02261DB6
	ldrb r0, [r6]
	mov r3, sp
	add r1, sp, #0x14
	lsl r0, r0, #4
	strh r0, [r1, #4]
	ldrb r0, [r6, #1]
	sub r3, r3, #4
	lsl r0, r0, #4
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258DB4
	add r0, r5, #0
	add r1, sp, #0x18
	bl ov49_0225913C
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	mov r2, #4
	bl ov49_02258EEC
	add r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261D8E:
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	mov r2, #2
	bl ov49_02258EEC
	lsl r1, r4, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov49_0225A04C
	lsl r1, r4, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov49_0225A06C
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02261DB6:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02261B74

	thumb_func_start ov49_02261DBC
ov49_02261DBC: ; 0x02261DBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r2, #0
	add r4, r0, #0
	add r0, r6, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	mov r7, #0
	bl ov49_02259FF0
	add r5, r0, #0
	bl ov49_02258DAC
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl ov49_0225A000
	add r6, r0, #0
	ldr r0, [sp, #8]
	mov r1, #4
	bl ov49_02258E60
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x20]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x10]
	cmp r0, #0xe
	bls _02261DF8
	b _02261F42
_02261DF8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261E04: ; jump table
	.short _02261F42 - _02261E04 - 2 ; case 0
	.short _02261F42 - _02261E04 - 2 ; case 1
	.short _02261E22 - _02261E04 - 2 ; case 2
	.short _02261E3E - _02261E04 - 2 ; case 3
	.short _02261E58 - _02261E04 - 2 ; case 4
	.short _02261E72 - _02261E04 - 2 ; case 5
	.short _02261E90 - _02261E04 - 2 ; case 6
	.short _02261EAE - _02261E04 - 2 ; case 7
	.short _02261ECC - _02261E04 - 2 ; case 8
	.short _02261EF0 - _02261E04 - 2 ; case 9
	.short _02261EEA - _02261E04 - 2 ; case 10
	.short _02261F42 - _02261E04 - 2 ; case 11
	.short _02261F42 - _02261E04 - 2 ; case 12
	.short _02261F42 - _02261E04 - 2 ; case 13
	.short _02261F42 - _02261E04 - 2 ; case 14
_02261E22:
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FA4 ; =ov49_02269B90
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	beq _02261E38
	b _02261F48
_02261E38:
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E3E:
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FA8 ; =ov49_02269BC0
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E58:
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FAC ; =ov49_02269BA0
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E72:
	add r0, r7, #0
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FB0 ; =ov49_02269C20
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #8
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E90:
	add r0, r7, #0
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FB4 ; =ov49_02269C40
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #8
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261EAE:
	mov r0, #3
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FB8 ; =ov49_02269BB0
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261ECC:
	add r0, r7, #0
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FBC ; =ov49_02269BD0
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261EEA:
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261EF0:
	ldr r0, [sp, #4]
	bl ov45_0222AFF8
	cmp r0, #0
	bne _02261F00
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261F00:
	ldr r0, [sp, #4]
	bl ov45_0222B00C
	cmp r0, #0
	bne _02261F10
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261F10:
	ldr r0, [sp, #4]
	bl ov45_0222B020
	ldr r1, [sp, #0x10]
	cmp r1, r0
	beq _02261F22
	add sp, #0x24
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261F22:
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	add r2, sp, #0x20
	add r3, sp, #0x1c
	bl ov49_0225904C
	cmp r0, #1
	beq _02261F36
	bl GF_AssertFail
_02261F36:
	ldr r0, [sp, #0x20]
	bl ov42_022282A4
	str r0, [sp, #0x20]
	mov r7, #1
	b _02261F48
_02261F42:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02261F48:
	ldr r0, [sp, #8]
	bl ov49_02258E34
	add r1, sp, #0x14
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	ldr r0, [sp, #8]
	strh r2, [r3]
	ldrh r1, [r1, #0xa]
	strh r1, [r3, #2]
	ldr r1, [r3]
	ldr r2, [sp, #0x20]
	bl ov49_02258E04
	add r1, sp, #0x14
	mov r0, #4
	ldrsh r2, [r1, r0]
	asr r0, r2, #3
	lsr r0, r0, #0x1c
	add r0, r2, r0
	asr r0, r0, #4
	strb r0, [r4]
	mov r0, #6
	ldrsh r1, [r1, r0]
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	strb r0, [r4, #1]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x10]
	strb r0, [r4, #2]
	ldr r0, [sp, #0x3c]
	strb r7, [r4, #3]
	strb r0, [r4, #4]
	mov r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02261FA4: .word ov49_02269B90
_02261FA8: .word ov49_02269BC0
_02261FAC: .word ov49_02269BA0
_02261FB0: .word ov49_02269C20
_02261FB4: .word ov49_02269C40
_02261FB8: .word ov49_02269BB0
_02261FBC: .word ov49_02269BD0
	thumb_func_end ov49_02261DBC

	thumb_func_start ov49_02261FC0
ov49_02261FC0: ; 0x02261FC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, [sp, #0x20]
	add r5, r2, #0
	str r1, [sp, #4]
	add r6, r3, #0
	str r0, [sp, #0x20]
	ldr r4, _02262024 ; =0x00000000
	beq _0226201C
_02261FD4:
	mov r0, #0
	str r0, [sp]
	add r2, sp, #8
	ldr r1, [r5]
	add r0, r7, #0
	add r2, #2
	add r3, sp, #8
	bl ov49_022589D8
	cmp r0, #1
	bne _02262014
	add r1, sp, #8
	add r2, sp, #8
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	ldr r0, [sp, #4]
	bl ov49_02258F7C
	cmp r0, #0
	bne _02262014
	add r1, sp, #8
	ldrh r0, [r1, #2]
	lsl r2, r0, #4
	ldr r0, [sp, #0x20]
	strh r2, [r0]
	ldrh r0, [r1]
	lsl r1, r0, #4
	ldr r0, [sp, #0x20]
	add sp, #0xc
	strh r1, [r0, #2]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02262014:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blo _02261FD4
_0226201C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02262024: .word 0x00000000
	thumb_func_end ov49_02261FC0

	thumb_func_start ov49_02262028
ov49_02262028: ; 0x02262028
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x10]
	add r5, r1, #0
	str r2, [sp, #0x14]
	bl ov49_0225EF3C
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	bl ov49_0225EF84
	add r4, r0, #0
	add r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x10]
	bl ov49_0225EF88
	cmp r0, #0x1b
	bhi _02262140
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226205E: ; jump table
	.short _02262140 - _0226205E - 2 ; case 0
	.short _02262140 - _0226205E - 2 ; case 1
	.short _02262140 - _0226205E - 2 ; case 2
	.short _02262140 - _0226205E - 2 ; case 3
	.short _02262140 - _0226205E - 2 ; case 4
	.short _02262140 - _0226205E - 2 ; case 5
	.short _02262140 - _0226205E - 2 ; case 6
	.short _02262114 - _0226205E - 2 ; case 7
	.short _022620DE - _0226205E - 2 ; case 8
	.short _02262096 - _0226205E - 2 ; case 9
	.short _02262096 - _0226205E - 2 ; case 10
	.short _02262096 - _0226205E - 2 ; case 11
	.short _02262096 - _0226205E - 2 ; case 12
	.short _02262096 - _0226205E - 2 ; case 13
	.short _02262096 - _0226205E - 2 ; case 14
	.short _02262140 - _0226205E - 2 ; case 15
	.short _02262140 - _0226205E - 2 ; case 16
	.short _02262114 - _0226205E - 2 ; case 17
	.short _02262114 - _0226205E - 2 ; case 18
	.short _02262114 - _0226205E - 2 ; case 19
	.short _02262114 - _0226205E - 2 ; case 20
	.short _02262114 - _0226205E - 2 ; case 21
	.short _02262114 - _0226205E - 2 ; case 22
	.short _02262140 - _0226205E - 2 ; case 23
	.short _02262140 - _0226205E - 2 ; case 24
	.short _02262140 - _0226205E - 2 ; case 25
	.short _02262096 - _0226205E - 2 ; case 26
	.short _02262096 - _0226205E - 2 ; case 27
_02262096:
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	ldrh r1, [r4, #8]
	cmp r1, r0
	bls _022620B0
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620B0:
	bl sub_02037454
	ldrh r1, [r4, #8]
	cmp r1, r0
	ble _022620C8
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620C8:
	bl sub_0203988C
	cmp r0, #0
	bne _022620DE
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620DE:
	bl ov45_0222F464
	cmp r0, #1
	bne _022620FE
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	cmp r0, #1
	bhi _022620FE
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620FE:
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
	bpl _02262114
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_02262114:
	bl sub_020390C4
	cmp r0, #5
	bhi _02262140
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02262128: ; jump table
	.short _02262140 - _02262128 - 2 ; case 0
	.short _02262140 - _02262128 - 2 ; case 1
	.short _02262134 - _02262128 - 2 ; case 2
	.short _02262134 - _02262128 - 2 ; case 3
	.short _02262134 - _02262128 - 2 ; case 4
	.short _02262134 - _02262128 - 2 ; case 5
_02262134:
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
_02262140:
	ldr r0, [sp, #0x10]
	bl ov49_0225EF88
	cmp r0, #0x1c
	bls _0226214E
	bl _02262AB8
_0226214E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226215A: ; jump table
	.short _02262194 - _0226215A - 2 ; case 0
	.short _022621A6 - _0226215A - 2 ; case 1
	.short _022621EA - _0226215A - 2 ; case 2
	.short _02262208 - _0226215A - 2 ; case 3
	.short _0226222E - _0226215A - 2 ; case 4
	.short _02262292 - _0226215A - 2 ; case 5
	.short _022622B2 - _0226215A - 2 ; case 6
	.short _0226239C - _0226215A - 2 ; case 7
	.short _02262556 - _0226215A - 2 ; case 8
	.short _022625DC - _0226215A - 2 ; case 9
	.short _02262630 - _0226215A - 2 ; case 10
	.short _0226265C - _0226215A - 2 ; case 11
	.short _022626D4 - _0226215A - 2 ; case 12
	.short _02262702 - _0226215A - 2 ; case 13
	.short _0226273C - _0226215A - 2 ; case 14
	.short _02262806 - _0226215A - 2 ; case 15
	.short _02262856 - _0226215A - 2 ; case 16
	.short _0226287C - _0226215A - 2 ; case 17
	.short _022628A4 - _0226215A - 2 ; case 18
	.short _022628B4 - _0226215A - 2 ; case 19
	.short _0226290C - _0226215A - 2 ; case 20
	.short _0226296C - _0226215A - 2 ; case 21
	.short _022629BE - _0226215A - 2 ; case 22
	.short _02262A08 - _0226215A - 2 ; case 23
	.short _02262A1A - _0226215A - 2 ; case 24
	.short _02262A2C - _0226215A - 2 ; case 25
	.short _02262A40 - _0226215A - 2 ; case 26
	.short _02262A64 - _0226215A - 2 ; case 27
	.short _02262A8E - _0226215A - 2 ; case 28
_02262194:
	ldr r0, [sp, #0x10]
	mov r1, #0x44
	bl ov49_0225EF40
	ldr r0, [sp, #0x10]
	bl ov49_0225EF90
	bl _02262AB8
_022621A6:
	ldr r0, [sp, #0x30]
	bl ov45_0222A414
	cmp r0, #0
	beq _022621C0
	mov r0, #7
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	bl ov49_0225EF8C
	bl _02262AB8
_022621C0:
	ldr r0, [sp, #0x30]
	bl ov45_0222A394
	cmp r0, #0
	beq _022621DA
	mov r0, #2
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	bl ov49_0225EF8C
	bl _02262AB8
_022621DA:
	ldr r0, _022624F4 ; =0x000005DD
	bl PlaySE
	ldr r0, [sp, #0x10]
	bl ov49_0225EF90
	bl _02262AB8
_022621EA:
	ldrb r1, [r6, #2]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A37C
	mov r0, #3
	str r0, [sp]
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	add r2, r5, #0
	mov r3, #0
	bl ov49_02262BF8
	bl _02262AB8
_02262208:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	mov r3, #1
	bl ov49_02262C38
	add r4, #0x18
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov49_0225A174
	ldr r0, [sp, #0x10]
	mov r1, #4
	bl ov49_0225EF8C
	bl _02262AB8
_0226222E:
	add r0, r5, #0
	mov r7, #0
	bl ov49_0225A1D4
	cmp r0, #2
	bhi _02262248
	cmp r0, #0
	beq _0226226A
	cmp r0, #1
	beq _0226225E
	cmp r0, #2
	beq _0226224E
	b _02262274
_02262248:
	sub r1, r7, #2
	cmp r0, r1
	bne _02262274
_0226224E:
	mov r0, #5
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	bl ov49_0225EF8C
	mov r7, #1
	b _02262274
_0226225E:
	ldr r0, [sp, #0x10]
	mov r1, #5
	bl ov49_0225EF8C
	mov r7, #1
	b _02262274
_0226226A:
	ldr r0, [sp, #0x10]
	mov r1, #6
	bl ov49_0225EF8C
	mov r7, #1
_02262274:
	cmp r7, #1
	beq _0226227C
	bl _02262AB8
_0226227C:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02262CA8
	bl _02262AB8
_02262292:
	ldrb r1, [r6, #2]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A37C
	mov r0, #2
	str r0, [sp]
	ldrb r3, [r6, #2]
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	add r2, r5, #0
	add r3, #0x22
	bl ov49_02262BF8
	bl _02262AB8
_022622B2:
	ldr r0, [sp, #0x30]
	bl ov45_0222A394
	cmp r0, #0
	beq _022622CA
	mov r0, #2
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_022622CA:
	ldrb r0, [r6, #1]
	bl ov45_0222F274
	cmp r0, #1
	bne _0226230E
	ldrb r0, [r6, #1]
	bl ov45_0222F2D4
	cmp r0, #0
	beq _022622E8
	ldrb r0, [r6, #1]
	bl ov45_0222F294
	cmp r0, #0
	bne _022622F6
_022622E8:
	mov r0, #1
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_022622F6:
	ldrb r0, [r6, #1]
	bl ov45_0222F3E8
	cmp r0, #0
	bne _0226230E
	mov r0, #7
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_0226230E:
	ldrb r0, [r6, #1]
	bl ov45_0222F3E8
	strh r0, [r4]
	mov r0, #0xe1
	lsl r0, r0, #2
	str r0, [r4, #0x10]
	mov r1, #0
	ldrsh r2, [r4, r1]
	ldr r0, _022624F8 ; =0x0000014A
	cmp r2, r0
	ble _02262330
	add r0, r5, #0
	mov r2, #0xa
	bl ov49_0225A30C
	b _0226233C
_02262330:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r5, #0
	mov r2, #0xb
	bl ov49_0225A30C
_0226233C:
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
	ldrb r0, [r6, #1]
	bl sub_0203981C
	bl ov45_0222F464
	cmp r0, #1
	bne _02262372
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r6, #2]
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x14]
	mov r2, #1
	bl ov45_0222AC14
	mov r0, #1
	strb r0, [r4, #7]
_02262372:
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r1, r5, #0
	mov r3, #1
	str r0, [sp]
	ldrb r2, [r6, #2]
	add r0, r4, #0
	add r0, #0x3c
	bl ov49_02262D70
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov49_02262E04
	ldr r0, [sp, #0x10]
	mov r1, #7
	bl ov49_0225EF8C
	b _02262AB8
_0226239C:
	bl sub_0203988C
	str r0, [sp, #0x2c]
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	add r7, r0, #0
	ldrb r0, [r6, #1]
	bl ov45_0222F3E8
	strh r0, [r4]
	mov r1, #0
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	add r0, #0x3c
	bl ov49_02262DD4
	mov r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, _022624F8 ; =0x0000014A
	cmp r1, r0
	bgt _022623F0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _022623F0
	add r0, r5, #0
	bl ov49_0225A0CC
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xb
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
_022623F0:
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _02262410
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262410:
	cmp r0, #2
	bne _02262462
	mov r0, #8
	strb r0, [r6]
	cmp r7, #4
	bne _02262420
	mov r6, #0x10
	b _02262422
_02262420:
	mov r6, #0x12
_02262422:
	add r0, r5, #0
	bl ov49_0225A0CC
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
	ldr r0, [sp, #0x10]
	mov r1, #9
	bl ov49_0225EF8C
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	strh r7, [r4, #8]
	bl ov49_02262DD4
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	b _02262AB8
_02262462:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _022624A8
	ldr r0, _022624FC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _022624A8
	ldr r0, _02262500 ; =0x000005DC
	bl PlaySE
	bl ov45_0222F464
	cmp r0, #0
	bne _02262494
	mov r0, #6
	strb r0, [r6]
	add r0, r5, #0
	bl ov49_0225A0CC
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262494:
	mov r0, #6
	strb r0, [r6]
	add r0, r5, #0
	bl ov49_0225A0CC
	ldr r0, [sp, #0x10]
	mov r1, #0x10
	bl ov49_0225EF8C
	b _02262AB8
_022624A8:
	bl ov45_0222F464
	cmp r0, #1
	bne _02262504
	ldrb r0, [r4, #7]
	cmp r0, r7
	beq _022624D2
	strb r7, [r4, #7]
	cmp r7, #4
	beq _022624D2
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r6, #2]
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x14]
	add r2, r7, #0
	bl ov45_0222AC14
_022624D2:
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _02262504
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	cmp r0, #1
	bhi _02262504
	mov r0, #3
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
	nop
_022624F4: .word 0x000005DD
_022624F8: .word 0x0000014A
_022624FC: .word gSystem
_02262500: .word 0x000005DC
_02262504:
	ldrb r0, [r6, #1]
	bl ov45_0222F274
	cmp r0, #1
	bne _02262526
	ldrb r0, [r6, #1]
	bl ov45_0222F294
	cmp r0, #0
	bne _02262526
	mov r0, #0
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262526:
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _022625CC
	ldr r0, [sp, #0x10]
	mov r1, #8
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x12
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
	b _02262AB8
_02262556:
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	bl sub_0203988C
	add r5, r0, #0
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	add r7, r0, #0
	bl sub_020390C4
	cmp r0, #3
	beq _02262586
	cmp r0, #4
	bne _02262592
_02262586:
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
_02262592:
	cmp r5, #0
	bne _022625A4
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_022625A4:
	cmp r5, #2
	bne _022625B8
	mov r0, #8
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #9
	bl ov49_0225EF8C
	strh r7, [r4, #8]
	b _02262AB8
_022625B8:
	ldrb r0, [r6, #1]
	bl ov45_0222F274
	cmp r0, #1
	bne _022625CC
	ldrb r0, [r6, #1]
	bl ov45_0222F294
	cmp r0, #0
	beq _022625CE
_022625CC:
	b _02262AB8
_022625CE:
	mov r0, #0
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_022625DC:
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	add r0, r5, #0
	bl ov49_02259FE8
	ldrb r1, [r6, #3]
	bl ov45_0222A5E8
	bl sub_02039B38
	add r0, r5, #0
	bl ov49_02259FE8
	bl ov45_0222A2C8
	mov r1, #0
	bl sub_02034354
	ldr r0, [sp, #0x30]
	bl ov45_0222AB1C
	bl sub_02034B00
	mov r0, #0
	bl sub_020378E4
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	mov r2, #0xa
	mov r3, #0x11
	bl ov49_02262C20
	b _02262AB8
_02262630:
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	bl sub_02034434
	bl sub_0203769C
	bl sub_0203476C
	ldr r0, [sp, #0x10]
	mov r1, #0xb
	bl ov49_0225EF8C
	b _02262AB8
_0226265C:
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	bl sub_02034780
	cmp r0, #0xff
	beq _02262686
_0226267A:
	bl sub_0203476C
	bl sub_02034780
	cmp r0, #0xff
	bne _0226267A
_02262686:
	bl sub_020347A0
	add r5, r0, #0
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	cmp r5, r0
	blo _022626BE
	bl ov45_0222F464
	cmp r0, #1
	bne _022626AC
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _022626AC
	bl ov45_0222F1BC
	mov r0, #1
	strh r0, [r4, #2]
_022626AC:
	bl ov45_0222F218
	cmp r0, #1
	bne _02262730
	ldr r0, [sp, #0x10]
	mov r1, #0xc
	bl ov49_0225EF8C
	b _02262AB8
_022626BE:
	bl ov45_0222F218
	cmp r0, #1
	bne _02262730
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_022626D4:
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	bl sub_02037BEC
	ldr r0, [sp, #0x30]
	bl ov45_0222A43C
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	mov r2, #0xd
	mov r3, #0xe
	bl ov49_02262C20
	b _02262AB8
_02262702:
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	ldr r0, [sp, #0x30]
	bl ov45_0222A548
	str r0, [r4, #0xc]
	bl sub_0203769C
	add r4, #0xc
	add r1, r4, #0
	bl sub_02037C0C
	cmp r0, #1
	beq _02262732
_02262730:
	b _02262AB8
_02262732:
	ldr r0, [sp, #0x10]
	mov r1, #0xe
	bl ov49_0225EF8C
	b _02262AB8
_0226273C:
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262DF8
	mov r0, #0
	str r0, [sp, #0x18]
	bl sub_020347A0
	str r0, [sp, #0x28]
	bl sub_0203769C
	mov r7, #0
	str r0, [sp, #0x24]
	str r7, [sp, #0x20]
	bl ov45_0222F430
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r4, r7, #0
	cmp r0, #0
	ble _022627DC
_02262774:
	ldr r0, [sp, #0x24]
	cmp r0, r4
	beq _022627BE
	add r0, r4, #0
	bl sub_02037C44
	add r5, r0, #0
	beq _022627D4
	ldr r0, [r5]
	bl ov45_0222EC68
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022627A4
	mov r0, #1
	str r0, [sp, #0x18]
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022627DC
_022627A4:
	ldr r0, [sp, #0x30]
	ldr r1, [r5]
	add r2, r4, #0
	bl ov45_0222A450
	ldr r1, [r5]
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bne _022627BA
	mov r0, #1
	str r0, [sp, #0x20]
_022627BA:
	add r7, r7, #1
	b _022627D4
_022627BE:
	ldr r0, [sp, #0x30]
	add r1, r4, #0
	bl ov45_0222A480
	bl ov45_0222F464
	cmp r0, #1
	bne _022627D2
	mov r0, #1
	str r0, [sp, #0x20]
_022627D2:
	add r7, r7, #1
_022627D4:
	ldr r0, [sp, #0x28]
	add r4, r4, #1
	cmp r4, r0
	blt _02262774
_022627DC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _022628C6
	ldr r0, [sp, #0x28]
	cmp r7, r0
	bne _022628C6
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _022627F8
	ldr r0, [sp, #0x10]
	mov r1, #0xf
	bl ov49_0225EF8C
	b _02262AB8
_022627F8:
	mov r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262806:
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	bl ov45_0222F464
	cmp r0, #1
	bne _02262842
	ldr r0, [sp, #0x30]
	add r1, sp, #0x34
	bl ov45_0222A498
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	add r3, sp, #0x34
	add r2, r0, #0
	ldrb r0, [r3, #1]
	str r0, [sp]
	ldrb r0, [r3, #2]
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldrb r1, [r6, #2]
	ldrb r3, [r3]
	ldr r0, [sp, #0x30]
	bl ov45_0222AC14
_02262842:
	add r0, r5, #0
	bl ov49_0225A0CC
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	mov r2, #0x1c
	mov r3, #0x12
	bl ov49_02262C20
	b _02262AB8
_02262856:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x1a
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	ldr r0, [sp, #0x10]
	mov r1, #0x11
	bl ov49_0225EF8C
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02262DB8
	b _02262AB8
_0226287C:
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_02262CB4
	cmp r0, #0
	bne _022628C6
	add r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _022628C6
	ldr r0, [sp, #0x10]
	mov r1, #0x12
	bl ov49_0225EF8C
	b _02262AB8
_022628A4:
	add r0, r5, #0
	bl ov49_0225A294
	ldr r0, [sp, #0x10]
	mov r1, #0x13
	bl ov49_0225EF8C
	b _02262AB8
_022628B4:
	add r0, r5, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _022628C8
	cmp r0, #1
	beq _022628DE
	cmp r0, #2
	beq _022628EE
_022628C6:
	b _02262AB8
_022628C8:
	add r0, r5, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #0x10]
	mov r1, #0x17
	bl ov49_0225EF8C
	ldr r0, [sp, #0x30]
	bl ov45_0222A404
	b _02262AB8
_022628DE:
	add r0, r5, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #0x10]
	mov r1, #0x14
	bl ov49_0225EF8C
	b _02262AB8
_022628EE:
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_02262CB4
	cmp r0, #1
	beq _02262904
	b _02262AB8
_02262904:
	add r0, r5, #0
	bl ov49_0225A2F8
	b _02262AB8
_0226290C:
	ldrb r0, [r6, #1]
	bl ov45_0222F3E8
	strh r0, [r4]
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r1, r5, #0
	mov r3, #1
	str r0, [sp]
	add r0, r4, #0
	ldrb r2, [r6, #2]
	add r0, #0x3c
	bl ov49_02262D70
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	mov r2, #1
	bl ov49_02262E04
	mov r1, #0
	ldrsh r2, [r4, r1]
	ldr r0, _02262AC0 ; =0x0000014A
	cmp r2, r0
	ble _02262948
	add r0, r5, #0
	mov r2, #0xa
	bl ov49_0225A30C
	b _02262954
_02262948:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r5, #0
	mov r2, #0xb
	bl ov49_0225A30C
_02262954:
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
	ldr r0, [sp, #0x10]
	mov r1, #7
	bl ov49_0225EF8C
	b _02262AB8
_0226296C:
	ldrb r0, [r6, #1]
	bl ov45_0222F314
	mov r1, #8
	strb r1, [r6]
	cmp r0, #4
	bne _0226297E
	mov r2, #0x10
	b _02262980
_0226297E:
	mov r2, #0x12
_02262980:
	add r0, r5, #0
	mov r1, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
	ldr r0, [sp, #0x10]
	mov r1, #9
	bl ov49_0225EF8C
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	ldrb r2, [r6, #2]
	add r0, #0x3c
	add r1, r5, #0
	mov r3, #1
	bl ov49_02262D70
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov49_02262E04
	b _02262AB8
_022629BE:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x12
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A09C
	add r0, r5, #0
	bl ov49_0225A0BC
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	ldrb r2, [r6, #2]
	add r0, #0x3c
	add r1, r5, #0
	mov r3, #1
	bl ov49_02262D70
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl ov49_02262DD4
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov49_02262DF8
	ldr r0, [sp, #0x10]
	mov r1, #8
	bl ov49_0225EF8C
	b _02262AB8
_02262A08:
	bl sub_020343E4
	bl sub_0203986C
	ldr r0, [sp, #0x10]
	mov r1, #0x18
	bl ov49_0225EF8C
	b _02262AB8
_02262A1A:
	bl sub_0203988C
	cmp r0, #0
	bne _02262AB8
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_02262A2C:
	add r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02262AB8
	ldrb r1, [r4, #4]
	ldr r0, [sp, #0x10]
	bl ov49_0225EF8C
	b _02262AB8
_02262A40:
	mov r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02262A4C
	sub r0, r0, #1
	strb r0, [r4, #5]
_02262A4C:
	mov r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _02262AB8
	ldrb r0, [r4, #6]
	bl sub_02037AC0
	ldr r0, [sp, #0x10]
	mov r1, #0x1b
	bl ov49_0225EF8C
	b _02262AB8
_02262A64:
	ldrh r0, [r4, #0xa]
	add r0, r0, #1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	cmp r0, #0x96
	blo _02262A7A
	ldrb r0, [r4, #6]
	bl sub_02037AC0
	mov r0, #0
	strh r0, [r4, #0xa]
_02262A7A:
	ldrb r0, [r4, #6]
	bl sub_02037B38
	cmp r0, #0
	beq _02262AB8
	ldrb r1, [r4, #4]
	ldr r0, [sp, #0x10]
	bl ov49_0225EF8C
	b _02262AB8
_02262A8E:
	add r0, r5, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02262CA8
	add r4, #0x3c
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02262DB8
	add r0, r5, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #0x10]
	bl ov49_0225EF68
	add sp, #0x38
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262AB8:
	mov r0, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262AC0: .word 0x0000014A
	thumb_func_end ov49_02262028

	thumb_func_start ov49_02262AC4
ov49_02262AC4: ; 0x02262AC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02262AD8
	cmp r0, #1
	beq _02262B02
	b _02262B0E
_02262AD8:
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	bl sub_020392A0
	cmp r0, #0
	bne _02262AF0
	bl sub_020343E4
	bl sub_0203986C
_02262AF0:
	add r0, r4, #0
	mov r1, #1
	bl ov49_0225A018
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02262B0E
_02262B02:
	bl sub_020392A0
	cmp r0, #1
	bne _02262B0E
	mov r0, #1
	pop {r3, r4, r5, pc}
_02262B0E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_02262AC4

	thumb_func_start ov49_02262B14
ov49_02262B14: ; 0x02262B14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	bl ov49_0225EF84
	add r4, r0, #0
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02262B32
	cmp r0, #1
	beq _02262BA8
	b _02262BEC
_02262B32:
	add r0, r6, #0
	mov r1, #8
	bl ov49_0225EF40
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov49_0225A040
	cmp r0, #0x27
	beq _02262B50
	cmp r0, #0x28
	beq _02262B56
	cmp r0, #0x29
	beq _02262B5C
	b _02262B62
_02262B50:
	mov r7, #0x2a
	mov r4, #0
	b _02262B6C
_02262B56:
	mov r7, #0x29
	mov r4, #1
	b _02262B6C
_02262B5C:
	mov r7, #0x2b
	mov r4, #2
	b _02262B6C
_02262B62:
	bl GF_AssertFail
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262B6C:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_0225A37C
	add r0, r5, #0
	mov r1, #1
	add r2, r7, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A0FC
	mov r3, #0
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r4, #0
	str r3, [sp]
	bl ov49_02262D70
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #1
	bl ov49_02262E04
	add r0, r6, #0
	bl ov49_0225EF90
	b _02262BEC
_02262BA8:
	ldr r0, _02262BF4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xf3
	tst r0, r1
	beq _02262BE2
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02262DB8
	add r0, r5, #0
	bl ov49_0225A0EC
	add r0, r5, #0
	bl ov49_02259FF0
	add r4, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r6, #0
	bl ov49_0225EF68
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262BE2:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov49_02262E04
_02262BEC:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262BF4: .word gSystem
	thumb_func_end ov49_02262B14

	thumb_func_start ov49_02262BF8
ov49_02262BF8: ; 0x02262BF8
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #0
	add r2, r3, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r6, #0
	bl ov49_0225A08C
	ldr r0, [sp, #0x10]
	mov r1, #0x19
	strb r0, [r5, #4]
	add r0, r4, #0
	bl ov49_0225EF8C
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_02262BF8

	thumb_func_start ov49_02262C20
ov49_02262C20: ; 0x02262C20
	strb r2, [r0, #4]
	strb r3, [r0, #6]
	mov r2, #0
	strb r2, [r0, #5]
	strh r2, [r0, #0xa]
	add r0, r1, #0
	ldr r3, _02262C34 ; =ov49_0225EF8C
	mov r1, #0x1a
	bx r3
	nop
_02262C34: .word ov49_0225EF8C
	thumb_func_end ov49_02262C20

	thumb_func_start ov49_02262C38
ov49_02262C38: ; 0x02262C38
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r7, r3, #0
	bl ov49_0225A10C
	ldr r0, [sp]
	mov r4, #0
	str r6, [r0, #0x38]
	cmp r6, #0
	bls _02262C6E
_02262C54:
	add r0, r5, #0
	mov r1, #0
	add r2, r7, r4
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov49_0225A144
	add r4, r4, #1
	cmp r4, r6
	blo _02262C54
_02262C6E:
	ldr r2, [sp]
	ldr r3, _02262CA4 ; =ov49_02269DFC
	add r2, #0x18
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp]
	ldr r1, [r0, #0x38]
	strh r1, [r0, #0x28]
	ldr r1, [r0, #0x38]
	ldrh r0, [r0, #0x2a]
	cmp r0, r1
	bls _02262C96
	ldr r0, [sp]
	strh r1, [r0, #0x2a]
_02262C96:
	add r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262CA4: .word ov49_02269DFC
	thumb_func_end ov49_02262C38

	thumb_func_start ov49_02262CA8
ov49_02262CA8: ; 0x02262CA8
	ldr r3, _02262CB0 ; =ov49_0225A134
	add r0, r1, #0
	bx r3
	nop
_02262CB0: .word ov49_0225A134
	thumb_func_end ov49_02262CA8

	thumb_func_start ov49_02262CB4
ov49_02262CB4: ; 0x02262CB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r2, #0
	add r0, r1, #0
	add r6, r3, #0
	bl ov49_02259FE8
	str r0, [sp, #0x10]
	bl sub_0203988C
	add r7, r0, #0
	ldrb r0, [r4, #1]
	bl ov45_0222F314
	add r2, r0, #0
	cmp r7, #0
	bne _02262CEA
	mov r0, #4
	strb r0, [r4]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02262CEA:
	cmp r7, #2
	bne _02262CFE
	add r0, r6, #0
	mov r1, #0x15
	strh r2, [r5, #8]
	bl ov49_0225EF8C
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02262CFE:
	ldrb r0, [r5, #7]
	cmp r0, r2
	beq _02262D1E
	strb r2, [r5, #7]
	cmp r2, #4
	beq _02262D1E
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r4, #2]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x28]
	bl ov45_0222AC14
_02262D1E:
	ldrb r0, [r4, #1]
	bl ov45_0222F3E8
	strh r0, [r5]
	mov r0, #0
	ldrsh r2, [r5, r0]
	cmp r2, #0
	bne _02262D58
	ldrb r0, [r4, #1]
	bl ov45_0222F314
	cmp r0, #1
	bhi _02262D4A
	mov r0, #3
	strb r0, [r4]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02262D4A:
	add r0, r6, #0
	mov r1, #0x16
	bl ov49_0225EF8C
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02262D58:
	ldr r1, _02262D6C ; =0x0000014A
	cmp r2, r1
	bgt _02262D68
	add r0, r6, #0
	mov r1, #0x14
	bl ov49_0225EF8C
	mov r0, #1
_02262D68:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02262D6C: .word 0x0000014A
	thumb_func_end ov49_02262CB4

	thumb_func_start ov49_02262D70
ov49_02262D70: ; 0x02262D70
	push {r3, r4, r5, r6, r7, lr}
	add r4, r3, #0
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	cmp r4, #2
	blo _02262D82
	bl GF_AssertFail
_02262D82:
	mov r0, #0
	strb r0, [r5]
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	strb r0, [r5, #3]
	strb r0, [r5, #4]
	strb r0, [r5, #5]
	strb r0, [r5, #6]
	strb r0, [r5, #7]
	strb r4, [r5, #6]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	strb r6, [r5, #3]
	bl ov49_02262DD4
	ldr r0, _02262DB4 ; =ov49_02269DF8
	mov r1, #0x12
	ldrb r0, [r0, r4]
	mov r2, #3
	mov r3, #0xd
	str r0, [sp]
	add r0, r7, #0
	bl ov49_0225A204
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02262DB4: .word ov49_02269DF8
	thumb_func_end ov49_02262D70

	thumb_func_start ov49_02262DB8
ov49_02262DB8: ; 0x02262DB8
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	ldr r3, _02262DD0 ; =ov49_0225A22C
	add r0, r1, #0
	bx r3
	.balign 4, 0
_02262DD0: .word ov49_0225A22C
	thumb_func_end ov49_02262DB8

	thumb_func_start ov49_02262DD4
ov49_02262DD4: ; 0x02262DD4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r1, r0
	beq _02262DF6
	strh r1, [r4, #4]
	ldrb r1, [r4, #7]
	mov r0, #8
	orr r0, r1
	strb r0, [r4, #7]
_02262DF6:
	pop {r4, pc}
	thumb_func_end ov49_02262DD4

	thumb_func_start ov49_02262DF8
ov49_02262DF8: ; 0x02262DF8
	push {r3, lr}
	mov r3, #0
	bl ov49_02262E10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02262DF8

	thumb_func_start ov49_02262E04
ov49_02262E04: ; 0x02262E04
	push {r3, lr}
	mov r3, #1
	bl ov49_02262E10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02262E04

	thumb_func_start ov49_02262E10
ov49_02262E10: ; 0x02262E10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	str r3, [sp, #4]
	cmp r2, #0
	beq _02262E22
	mov r0, #0xff
	strb r0, [r5, #7]
_02262E22:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _02262E32
	cmp r0, #1
	beq _02262E36
	cmp r0, #2
	beq _02262E3A
	b _02262E3E
_02262E32:
	mov r6, #0
	b _02262E44
_02262E36:
	mov r6, #1
	b _02262E44
_02262E3A:
	mov r6, #2
	b _02262E44
_02262E3E:
	bl GF_AssertFail
	mov r6, #2
_02262E44:
	add r0, r6, #0
	bl ov45_0222F274
	add r7, r0, #0
	ldrb r0, [r5]
	cmp r0, r7
	beq _02262E5A
	ldrb r1, [r5, #7]
	mov r0, #4
	orr r0, r1
	strb r0, [r5, #7]
_02262E5A:
	strb r7, [r5]
	add r0, r6, #0
	bl ov45_0222F294
	ldrb r1, [r5, #2]
	cmp r1, r0
	beq _02262E70
	ldrb r2, [r5, #7]
	mov r1, #4
	orr r1, r2
	strb r1, [r5, #7]
_02262E70:
	strb r0, [r5, #2]
	cmp r7, #1
	bne _02262E7E
	add r0, r6, #0
	bl ov45_0222F2D4
	b _02262E80
_02262E7E:
	mov r0, #4
_02262E80:
	ldrb r1, [r5, #1]
	cmp r1, r0
	beq _02262E8E
	ldrb r2, [r5, #7]
	mov r1, #2
	orr r1, r2
	strb r1, [r5, #7]
_02262E8E:
	strb r0, [r5, #1]
	ldrb r1, [r5, #7]
	mov r0, #1
	tst r0, r1
	beq _02262EC8
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0x68
	bl ov49_0225A24C
	ldrb r1, [r5, #3]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x36
	bl ov49_0225A30C
	mov r2, #0
	add r1, r0, #0
	add r0, r4, #0
	add r3, r2, #0
	bl ov49_0225A23C
_02262EC8:
	ldrb r1, [r5, #7]
	mov r0, #4
	tst r0, r1
	beq _02262F18
	mov r2, #0x10
	add r0, r4, #0
	mov r1, #0
	mov r3, #0x68
	str r2, [sp]
	bl ov49_0225A24C
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02262F18
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _02262F18
	ldrb r0, [r5]
	cmp r0, #1
	bne _02262F18
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x45
	bl ov49_0225A30C
	add r6, r0, #0
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x68
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0x10
	bl ov49_0225A23C
_02262F18:
	ldrb r1, [r5, #7]
	mov r0, #2
	tst r0, r1
	beq _02262F68
	mov r2, #0x20
	add r0, r4, #0
	mov r1, #0
	mov r3, #0x68
	str r2, [sp]
	bl ov49_0225A24C
	mov r0, #2
	str r0, [sp]
	mov r2, #1
	ldrb r1, [r5, #1]
	add r0, r4, #0
	add r3, r2, #0
	bl ov49_0225A31C
	mov r0, #2
	str r0, [sp]
	ldrb r2, [r5, #1]
	mov r1, #4
	add r0, r4, #0
	sub r1, r1, r2
	mov r2, #1
	mov r3, #0
	bl ov49_0225A31C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x44
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	mov r3, #0x20
	bl ov49_0225A23C
_02262F68:
	ldrb r0, [r5, #6]
	cmp r0, #1
	bne _02262FAC
	ldrb r1, [r5, #7]
	mov r0, #8
	tst r0, r1
	beq _02262FAC
	mov r0, #0x10
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x40
	mov r3, #0x68
	bl ov49_0225A24C
	mov r2, #2
	str r2, [sp]
	mov r1, #4
	ldrsh r1, [r5, r1]
	add r0, r4, #0
	mov r3, #0
	bl ov49_0225A31C
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xf
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	mov r3, #0x40
	bl ov49_0225A23C
_02262FAC:
	mov r0, #0
	strb r0, [r5, #7]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02262E10

	thumb_func_start ov49_02262FB4
ov49_02262FB4: ; 0x02262FB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	str r2, [sp, #0xc]
	bl ov49_02259FE8
	add r7, r0, #0
	add r0, r5, #0
	bl ov49_0225A010
	str r0, [sp, #0x24]
	add r0, r6, #0
	bl ov49_0225EF84
	add r4, r0, #0
	add r0, r7, #0
	bl ov45_0222B034
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl ov45_0222B040
	str r0, [sp, #0x1c]
	add r0, r7, #0
	bl ov45_0222B06C
	cmp r0, #0
	beq _0226300C
	cmp r4, #0
	beq _0226300C
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _0226300C
	add r0, r6, #0
	mov r1, #0x20
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	mov r0, #0
	strh r0, [r4, #0xa]
_0226300C:
	cmp r4, #0
	beq _0226302E
	add r0, r7, #0
	bl ov45_0222A5C0
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0226302A
	ldrb r1, [r4, #3]
	add r0, r7, #0
	bl ov45_0222A578
	str r0, [sp, #0x14]
	b _0226302E
_0226302A:
	mov r0, #0
	str r0, [sp, #0x14]
_0226302E:
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02263056
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _02263056
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _02263056
	add r0, r6, #0
	mov r1, #0x20
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	mov r0, #0
	strh r0, [r4, #0xa]
_02263056:
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x26
	bls _02263064
	bl _02263B5E
_02263064:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02263070: ; jump table
	.short _022630BE - _02263070 - 2 ; case 0
	.short _02263184 - _02263070 - 2 ; case 1
	.short _022631A8 - _02263070 - 2 ; case 2
	.short _022631F0 - _02263070 - 2 ; case 3
	.short _02263226 - _02263070 - 2 ; case 4
	.short _02263256 - _02263070 - 2 ; case 5
	.short _022632C8 - _02263070 - 2 ; case 6
	.short _022632F6 - _02263070 - 2 ; case 7
	.short _02263326 - _02263070 - 2 ; case 8
	.short _0226335E - _02263070 - 2 ; case 9
	.short _0226338C - _02263070 - 2 ; case 10
	.short _022633BA - _02263070 - 2 ; case 11
	.short _022633EA - _02263070 - 2 ; case 12
	.short _02263466 - _02263070 - 2 ; case 13
	.short _02263524 - _02263070 - 2 ; case 14
	.short _02263554 - _02263070 - 2 ; case 15
	.short _022635CC - _02263070 - 2 ; case 16
	.short _02263618 - _02263070 - 2 ; case 17
	.short _02263628 - _02263070 - 2 ; case 18
	.short _02263696 - _02263070 - 2 ; case 19
	.short _022636A8 - _02263070 - 2 ; case 20
	.short _022636E8 - _02263070 - 2 ; case 21
	.short _0226372A - _02263070 - 2 ; case 22
	.short _0226375C - _02263070 - 2 ; case 23
	.short _0226378A - _02263070 - 2 ; case 24
	.short _022637E2 - _02263070 - 2 ; case 25
	.short _02263828 - _02263070 - 2 ; case 26
	.short _02263870 - _02263070 - 2 ; case 27
	.short _022638B6 - _02263070 - 2 ; case 28
	.short _02263914 - _02263070 - 2 ; case 29
	.short _0226397C - _02263070 - 2 ; case 30
	.short _022639AA - _02263070 - 2 ; case 31
	.short _022639D8 - _02263070 - 2 ; case 32
	.short _02263A42 - _02263070 - 2 ; case 33
	.short _02263A74 - _02263070 - 2 ; case 34
	.short _02263A9C - _02263070 - 2 ; case 35
	.short _02263AD0 - _02263070 - 2 ; case 36
	.short _02263ADA - _02263070 - 2 ; case 37
	.short _02263AE6 - _02263070 - 2 ; case 38
_022630BE:
	add r0, r6, #0
	mov r1, #0x50
	bl ov49_0225EF40
	add r4, r0, #0
	mov r1, #0
	add r0, #0x44
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x46
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x38
	str r1, [r4, #0x48]
	bl ov49_0226526C
	add r0, r5, #0
	bl ov49_02259FF0
	str r0, [sp, #0x28]
	bl ov49_02258DAC
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	bl ov49_02258F40
	str r0, [sp, #0x30]
	cmp r0, #0
	bne _0226310A
	mov r0, #0
	strh r0, [r4, #0xa]
	add r0, r6, #0
	mov r1, #0x26
	bl ov49_0225EF8C
	bl _02263B5E
_0226310A:
	mov r1, #4
	bl ov49_02258E60
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x2c]
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	str r0, [sp, #0x38]
	add r0, r7, #0
	bl ov45_0222AE64
	ldr r2, [sp, #0x34]
	add r0, r4, #0
	add r1, r7, #0
	bl ov49_02264CA8
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x30]
	mov r1, #0
	str r0, [r4, #0x10]
	bl ov49_02259130
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x38]
	bl ov49_02259160
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x34]
	mov r2, #0
	bl ov49_0225EFF0
	ldr r0, _022634A0 ; =0x000005E4
	bl PlaySE
	add r0, r7, #0
	mov r1, #9
	bl ov45_0222A5E8
	ldr r0, [sp, #0x3c]
	cmp r0, #1
	bne _02263178
	ldr r1, [sp, #0x34]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A428
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225EF8C
	bl _02263B5E
_02263178:
	add r0, r6, #0
	mov r1, #0x22
	bl ov49_0225EF8C
	bl _02263B5E
_02263184:
	ldrb r1, [r4, #3]
	add r0, r7, #0
	bl ov45_0222AE74
	cmp r0, #1
	bne _0226319C
	add r0, r6, #0
	mov r1, #2
	bl ov49_0225EF8C
	bl _02263B5E
_0226319C:
	add r0, r6, #0
	mov r1, #0x22
	bl ov49_0225EF8C
	bl _02263B5E
_022631A8:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _022631E4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022631BA: ; jump table
	.short _022631D8 - _022631BA - 2 ; case 0
	.short _02263B5E - _022631BA - 2 ; case 1
	.short _022631C4 - _022631BA - 2 ; case 2
	.short _022631E4 - _022631BA - 2 ; case 3
	.short _022631E4 - _022631BA - 2 ; case 4
_022631C4:
	ldrb r1, [r4, #3]
	add r0, r7, #0
	bl ov45_0222B0E8
	add r0, r6, #0
	mov r1, #3
	bl ov49_0225EF8C
	bl _02263B5E
_022631D8:
	add r0, r6, #0
	mov r1, #0x22
	bl ov49_0225EF8C
	bl _02263B5E
_022631E4:
	add r0, r6, #0
	mov r1, #0x20
	bl ov49_0225EF8C
	bl _02263B5E
_022631F0:
	add r0, r7, #0
	bl ov45_0222B0F8
	add r0, r7, #0
	mov r1, #7
	bl ov45_0222B118
	ldr r0, [sp, #0x18]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #4]
	add r0, r4, #0
	bl ov49_02264D4C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #4
	add r3, r6, #0
	bl ov49_02264CFC
	bl _02263B5E
_02263226:
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #5]
	add r0, r4, #0
	bl ov49_02264D4C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #5
	add r3, r6, #0
	bl ov49_02264CFC
	add r0, r7, #0
	mov r1, #0
	bl ov45_0222AED8
	bl _02263B5E
_02263256:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _022632B6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02263268: ; jump table
	.short _022632B6 - _02263268 - 2 ; case 0
	.short _022632B6 - _02263268 - 2 ; case 1
	.short _02263272 - _02263268 - 2 ; case 2
	.short _0226329A - _02263268 - 2 ; case 3
	.short _022632B6 - _02263268 - 2 ; case 4
_02263272:
	add r0, r5, #0
	bl ov49_0225A0CC
	add r0, r7, #0
	bl ov45_0222B028
	cmp r0, #0
	beq _0226328E
	add r0, r6, #0
	mov r1, #6
	bl ov49_0225EF8C
	bl _02263B5E
_0226328E:
	add r0, r6, #0
	mov r1, #8
	bl ov49_0225EF8C
	bl _02263B5E
_0226329A:
	add r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _022632AA
	add r0, r5, #0
	bl ov49_0225A0BC
_022632AA:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264EC8
	bl _02263B5E
_022632B6:
	add r0, r6, #0
	mov r1, #0x20
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	bl _02263B5E
_022632C8:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02264E20
	cmp r0, #1
	bne _022632EA
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #7
	add r3, r6, #0
	bl ov49_02264CFC
	bl _02263B5E
_022632EA:
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	bl _02263B5E
_022632F6:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x28
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #9
	add r3, r6, #0
	bl ov49_02264CFC
	bl _02263B5E
_02263326:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrh r1, [r4, #8]
	add r0, r5, #0
	mov r2, #1
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldrh r2, [r4, #8]
	add r0, r5, #0
	bl ov49_02264C50
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #9
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226335E:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x2e
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xb
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226338C:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x36
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xb
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_022633BA:
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	ldr r3, _022634A4 ; =0x00000203
	add r0, #0x14
	add r1, r5, #0
	mov r2, #3
	bl ov49_02264F9C
	add r1, r4, #0
	mov r2, #0
	add r0, r5, #0
	add r1, #0x14
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r4, #0
	bl ov49_02264F10
	add r0, r6, #0
	mov r1, #0xc
	bl ov49_0225EF8C
	b _02263B5E
_022633EA:
	add r0, r5, #0
	bl ov49_0225A1D4
	cmp r0, #0
	beq _022633FE
	cmp r0, #1
	beq _0226340A
	cmp r0, #2
	beq _02263428
	b _0226343A
_022633FE:
	add r0, r6, #0
	mov r1, #0xd
	bl ov49_0225EF8C
	mov r0, #1
	b _02263444
_0226340A:
	add r0, r6, #0
	mov r1, #0x13
	bl ov49_0225EF8C
	ldr r0, [r4, #0x10]
	mov r1, #4
	bl ov49_02258E60
	add r2, r0, #0
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	bl ov45_0222AB94
	mov r0, #1
	b _02263444
_02263428:
	add r0, r7, #0
	bl ov45_0222AF80
	add r0, r6, #0
	mov r1, #0x21
	bl ov49_0225EF8C
	mov r0, #1
	b _02263444
_0226343A:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264F24
	mov r0, #0
_02263444:
	cmp r0, #1
	beq _0226344A
	b _02263B5E
_0226344A:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl ov49_02265260
	add r0, r4, #0
	bl ov49_02264F1C
	b _02263B5E
_02263466:
	ldr r0, [sp, #0x18]
	bl ov45_0222AAC8
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x14]
	bl ov45_0222AAC8
	ldr r1, [sp, #0x40]
	cmp r1, r0
	bne _022634D4
	mov r0, #1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	mov r3, #1
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _022634A8 ; =0x000001FB
	b _022634AC
	nop
_022634A0: .word 0x000005E4
_022634A4: .word 0x00000203
_022634A8: .word 0x000001FB
_022634AC:
	add r0, r5, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x12
	add r3, r6, #0
	bl ov49_02264CFC
	add r0, r7, #0
	mov r1, #4
	bl ov45_0222AED8
	b _02263B5E
_022634D4:
	mov r2, #0
	strb r2, [r4, #0xc]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	bl ov49_0225A334
	mov r3, #1
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	str r3, [sp]
	bl ov49_02264E90
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	mov r3, #2
	bl ov49_02264E90
	mov r2, #0x7f
	ldrb r1, [r4, #3]
	add r0, r5, #0
	lsl r2, r2, #2
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xe
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263524:
	mov r0, #1
	str r0, [sp]
	add r0, r4, #0
	ldr r3, _02263858 ; =0x00000206
	add r0, #0x14
	add r1, r5, #0
	mov r2, #2
	bl ov49_02264F9C
	add r1, r4, #0
	mov r2, #0
	add r0, r5, #0
	add r1, #0x14
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r4, #0
	bl ov49_02264F10
	add r0, r6, #0
	mov r1, #0xf
	bl ov49_0225EF8C
	b _02263B5E
_02263554:
	add r0, r5, #0
	bl ov49_0225A1D4
	cmp r0, #0
	beq _02263564
	cmp r0, #1
	beq _02263594
	b _022635A0
_02263564:
	add r0, r7, #0
	mov r1, #3
	bl ov45_0222AED8
	add r0, r6, #0
	mov r1, #0x10
	bl ov49_0225EF8C
	ldr r0, [r4, #0x10]
	mov r1, #4
	bl ov49_02258E60
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	bl ov45_0222AAC8
	add r3, r0, #0
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	add r2, r6, #0
	bl ov45_0222ABD0
	mov r0, #1
	b _022635AA
_02263594:
	add r0, r6, #0
	mov r1, #0xa
	bl ov49_0225EF8C
	mov r0, #1
	b _022635AA
_022635A0:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264F24
	mov r0, #0
_022635AA:
	cmp r0, #1
	beq _022635B0
	b _02263B5E
_022635B0:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl ov49_02265260
	add r0, r4, #0
	bl ov49_02264F1C
	b _02263B5E
_022635CC:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	mov r3, #1
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _0226385C ; =0x000001FE
	add r0, r5, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x11
	add r3, r6, #0
	bl ov49_02264CFC
	ldr r0, [sp, #0x14]
	bl ov45_0222AAC8
	add r1, r0, #0
	add r0, r7, #0
	bl ov45_0222A72C
	b _02263B5E
_02263618:
	ldr r0, _02263860 ; =0x000005BF
	bl PlaySE
	add r0, r6, #0
	mov r1, #0x12
	bl ov49_0225EF8C
	b _02263B5E
_02263628:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _02263686
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226363A: ; jump table
	.short _02263686 - _0226363A - 2 ; case 0
	.short _02263686 - _0226363A - 2 ; case 1
	.short _02263644 - _0226363A - 2 ; case 2
	.short _0226366C - _0226363A - 2 ; case 3
	.short _02263686 - _0226363A - 2 ; case 4
_02263644:
	ldr r1, [sp, #0x14]
	add r0, r4, #0
	bl ov49_02264F78
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _0226365C
	add r0, r6, #0
	mov r1, #0x21
	bl ov49_0225EF8C
	b _02263664
_0226365C:
	add r0, r6, #0
	mov r1, #0xa
	bl ov49_0225EF8C
_02263664:
	add r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_0226366C:
	add r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _0226367C
	add r0, r5, #0
	bl ov49_0225A0BC
_0226367C:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264EC8
	b _02263B5E
_02263686:
	add r0, r6, #0
	mov r1, #0x20
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_02263696:
	add r0, r7, #0
	mov r1, #5
	bl ov45_0222AED8
	add r0, r6, #0
	mov r1, #0x14
	bl ov49_0225EF8C
	b _02263B5E
_022636A8:
	ldr r0, _02263864 ; =0x00000207
	add r1, r5, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x14
	mov r2, #0x1e
	mov r3, #4
	bl ov49_02265044
	mov r0, #8
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x17
	add r1, r4, #0
	mov r2, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, #0x14
	add r3, r2, #0
	bl ov49_0225A1A4
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	add r0, r4, #0
	bl ov49_02264F10
	b _02263B5E
_022636E8:
	add r0, r5, #0
	bl ov49_0225A1D4
	mov r1, #1
	mvn r1, r1
	str r0, [sp, #0x44]
	cmp r0, r1
	beq _022636FE
	add r1, r1, #1
	cmp r0, r1
	bne _02263708
_022636FE:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264F24
	b _02263B5E
_02263708:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl ov49_02265260
	ldr r0, [sp, #0x44]
	mov r1, #0x16
	strb r0, [r4]
	add r0, r6, #0
	bl ov49_0225EF8C
	b _02263B5E
_0226372A:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r3, [r4]
	ldr r2, _02263868 ; =0x000001DD
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, r3, r2
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x17
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226375C:
	mov r0, #0
	str r0, [sp]
	ldrb r3, [r4]
	add r0, r4, #0
	add r0, #0x14
	lsl r3, r3, #2
	add r1, r5, #0
	mov r2, #4
	add r3, #0x73
	bl ov49_02264F9C
	add r1, r4, #0
	mov r2, #0
	add r0, r5, #0
	add r1, #0x14
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r6, #0
	mov r1, #0x18
	bl ov49_0225EF8C
	b _02263B5E
_0226378A:
	add r0, r5, #0
	bl ov49_0225A1D4
	str r0, [sp, #0x48]
	cmp r0, #3
	bhi _022637D8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022637A2: ; jump table
	.short _022637AA - _022637A2 - 2 ; case 0
	.short _022637AA - _022637A2 - 2 ; case 1
	.short _022637AA - _022637A2 - 2 ; case 2
	.short _022637AA - _022637A2 - 2 ; case 3
_022637AA:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl ov49_02265260
	add r0, r4, #0
	bl ov49_02264F1C
	ldrb r0, [r4]
	lsl r1, r0, #2
	ldr r0, [sp, #0x48]
	add r0, r0, r1
	strb r0, [r4, #1]
	add r0, r6, #0
	mov r1, #0x19
	bl ov49_0225EF8C
	b _02263B5E
_022637D8:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264F24
	b _02263B5E
_022637E2:
	ldrb r2, [r4, #1]
	add r0, r4, #0
	add r0, #0x38
	add r2, r2, #6
	lsl r2, r2, #0x10
	add r1, r7, #0
	lsr r2, r2, #0x10
	mov r3, #2
	bl ov49_02265274
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r3, [r4, #1]
	ldr r2, _0226386C ; =0x00000165
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, r3, r2
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x1a
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263828:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r2, [r4]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, #0x55
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x1b
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
	.balign 4, 0
_02263858: .word 0x00000206
_0226385C: .word 0x000001FE
_02263860: .word 0x000005BF
_02263864: .word 0x00000207
_02263868: .word 0x000001DD
_0226386C: .word 0x00000165
_02263870:
	add r0, r4, #0
	add r0, #0x38
	bl ov49_022652D0
	cmp r0, #1
	bne _022638A2
	add r0, r4, #0
	add r0, #0x38
	bl ov49_022652E0
	cmp r0, #2
	bne _02263892
	add r0, r6, #0
	mov r1, #0x1c
	bl ov49_0225EF8C
	b _02263B5E
_02263892:
	add r0, r6, #0
	mov r1, #0x20
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_022638A2:
	add r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	beq _022638AE
	b _02263B5E
_022638AE:
	add r0, r5, #0
	bl ov49_0225A0BC
	b _02263B5E
_022638B6:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _02263904
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022638C8: ; jump table
	.short _02263904 - _022638C8 - 2 ; case 0
	.short _02263904 - _022638C8 - 2 ; case 1
	.short _022638D2 - _022638C8 - 2 ; case 2
	.short _022638EA - _022638C8 - 2 ; case 3
	.short _02263904 - _022638C8 - 2 ; case 4
_022638D2:
	ldr r1, [sp, #0x14]
	add r0, r4, #0
	bl ov49_02264F78
	add r0, r6, #0
	mov r1, #0x1d
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_022638EA:
	add r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _022638FA
	add r0, r5, #0
	bl ov49_0225A0BC
_022638FA:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264EC8
	b _02263B5E
_02263904:
	add r0, r6, #0
	mov r1, #0x20
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_02263914:
	ldr r0, [sp, #0x1c]
	sub r0, r0, #6
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	cmp r0, #0x7e
	bhs _02263928
	cmp r0, #6
	bhs _02263932
_02263928:
	add r0, r6, #0
	mov r1, #0x23
	bl ov49_0225EF8C
	b _02263B5E
_02263932:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldr r2, [sp, #0x10]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, #0xec
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	ldrb r1, [r4, #1]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bne _0226396A
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x1e
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226396A:
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x1f
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226397C:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x33
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xa
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_022639AA:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x32
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x25
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xa
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_022639D8:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl ov49_02265260
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x2d
	bl ov49_02264C04
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x4c]
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x4c]
	bl StringGetLength
	str r0, [sp, #0x50]
	add r0, r5, #0
	bl ov49_0225CB70
	ldr r1, [sp, #0x50]
	mul r0, r1
	lsr r1, r0, #1
	add r1, #0x3c
	cmp r1, #0x80
	bhs _02263A22
	mov r1, #0x80
	b _02263A28
_02263A22:
	cmp r1, #0xff
	bls _02263A28
	mov r1, #0xff
_02263A28:
	mov r0, #0x24
	lsl r1, r1, #0x18
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0x26
	add r3, r6, #0
	bl ov49_02264CFC
	add r0, r7, #0
	bl ov45_0222AFC4
	b _02263B5E
_02263A42:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x2b
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x24
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x26
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263A74:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x2a
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x24
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x26
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263A9C:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	mov r2, #0x59
	ldrb r1, [r4, #3]
	add r0, r5, #0
	lsl r2, r2, #2
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x24
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x26
	add r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263AD0:
	add r0, r4, #0
	add r1, r6, #0
	bl ov49_02264D14
	b _02263B5E
_02263ADA:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov49_02264D30
	b _02263B5E
_02263AE6:
	add r0, r4, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	bne _02263AFE
	add r1, r4, #0
	add r1, #0x46
	ldrh r1, [r1]
	ldr r2, [r4, #0x48]
	add r0, r7, #0
	bl ov45_0222A704
_02263AFE:
	add r0, r7, #0
	bl ov45_0222AE64
	add r0, r5, #0
	bl ov49_0225A0EC
	add r0, r7, #0
	mov r1, #1
	bl ov45_0222A5E8
	add r0, r5, #0
	bl ov49_02259FF0
	add r7, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r7, #0
	mov r2, #1
	bl ov49_02258EEC
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02263B4C
	mov r1, #1
	bl ov49_02259130
	ldr r0, [r4, #0x10]
	mov r1, #4
	bl ov49_02258E60
	add r1, r0, #0
	ldr r0, [sp, #0x24]
	mov r2, #1
	bl ov49_0225EFF0
	add r0, r5, #0
	bl ov49_0225A4D0
_02263B4C:
	add r0, r4, #0
	bl ov49_02264CF8
	add r0, r6, #0
	bl ov49_0225EF68
	add sp, #0x54
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02263B5E:
	add r0, r4, #0
	bl ov49_02264F60
	add r4, #0x38
	add r0, r4, #0
	add r1, r7, #0
	bl ov49_0226529C
	mov r0, #0
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_02262FB4

	thumb_func_start ov49_02263B74
ov49_02263B74: ; 0x02263B74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	bl ov49_02259FE8
	add r7, r0, #0
	add r0, r6, #0
	bl ov49_0225EF84
	add r4, r0, #0
	add r0, r7, #0
	bl ov45_0222B034
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl ov45_0222B040
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl ov45_0222B06C
	cmp r0, #0
	beq _02263BC2
	cmp r4, #0
	beq _02263BC2
	ldrh r0, [r4, #0xa]
	cmp r0, #1
	bne _02263BC2
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	mov r0, #0
	strh r0, [r4, #0xa]
_02263BC2:
	cmp r4, #0
	beq _02263BD8
	add r0, r7, #0
	bl ov45_0222A5C0
	str r0, [sp, #0xc]
	ldrb r1, [r4, #3]
	add r0, r7, #0
	bl ov45_0222A578
	str r0, [sp, #8]
_02263BD8:
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02263C00
	ldrh r0, [r4, #0xa]
	cmp r0, #1
	bne _02263C00
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02263C00
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	mov r0, #0
	strh r0, [r4, #0xa]
_02263C00:
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x1f
	bhi _02263CCA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02263C16: ; jump table
	.short _02263C56 - _02263C16 - 2 ; case 0
	.short _02263CC0 - _02263C16 - 2 ; case 1
	.short _02263CF4 - _02263C16 - 2 ; case 2
	.short _02263D28 - _02263C16 - 2 ; case 3
	.short _02263D9A - _02263C16 - 2 ; case 4
	.short _02263DC4 - _02263C16 - 2 ; case 5
	.short _02263DF2 - _02263C16 - 2 ; case 6
	.short _02263E2A - _02263C16 - 2 ; case 7
	.short _02263E58 - _02263C16 - 2 ; case 8
	.short _02263E86 - _02263C16 - 2 ; case 9
	.short _02263F4C - _02263C16 - 2 ; case 10
	.short _02263F88 - _02263C16 - 2 ; case 11
	.short _02263FD0 - _02263C16 - 2 ; case 12
	.short _0226400C - _02263C16 - 2 ; case 13
	.short _0226405A - _02263C16 - 2 ; case 14
	.short _0226409E - _02263C16 - 2 ; case 15
	.short _022640CC - _02263C16 - 2 ; case 16
	.short _0226412C - _02263C16 - 2 ; case 17
	.short _0226417A - _02263C16 - 2 ; case 18
	.short _022641AA - _02263C16 - 2 ; case 19
	.short _022641DA - _02263C16 - 2 ; case 20
	.short _0226420C - _02263C16 - 2 ; case 21
	.short _02264240 - _02263C16 - 2 ; case 22
	.short _022642CE - _02263C16 - 2 ; case 23
	.short _0226431A - _02263C16 - 2 ; case 24
	.short _02264364 - _02263C16 - 2 ; case 25
	.short _02264392 - _02263C16 - 2 ; case 26
	.short _022643FC - _02263C16 - 2 ; case 27
	.short _0226442E - _02263C16 - 2 ; case 28
	.short _0226445C - _02263C16 - 2 ; case 29
	.short _02264466 - _02263C16 - 2 ; case 30
	.short _02264472 - _02263C16 - 2 ; case 31
_02263C56:
	add r0, r6, #0
	mov r1, #0x50
	bl ov49_0225EF40
	add r4, r0, #0
	mov r1, #0
	add r0, #0x44
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x46
	strh r1, [r0]
	add r0, r7, #0
	str r1, [r4, #0x48]
	bl ov45_0222B020
	str r0, [sp, #0x18]
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	add r1, r7, #0
	bl ov49_02264CA8
	str r0, [sp, #0x1c]
	ldr r0, _02263FC8 ; =0x000005E4
	bl PlaySE
	add r0, r7, #0
	mov r1, #9
	bl ov45_0222A5E8
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _02263CB4
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A428
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	bl ov45_0222B0E8
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225EF8C
	bl _022644DA
_02263CB4:
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	bl _022644DA
_02263CC0:
	add r0, r7, #0
	bl ov45_0222B0B0
	cmp r0, #0
	bne _02263CCE
_02263CCA:
	bl _022644DA
_02263CCE:
	ldr r0, [sp, #8]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #5]
	add r0, r4, #0
	bl ov49_02264D4C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #2
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263CF4:
	add r0, r7, #0
	bl ov45_0222B0F8
	add r0, r7, #0
	mov r1, #7
	bl ov45_0222B118
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #8]
	add r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #4]
	add r0, r4, #0
	bl ov49_02264D4C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #3
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263D28:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bhi _02263D8A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02263D3A: ; jump table
	.short _02263D8A - _02263D3A - 2 ; case 0
	.short _02263D8A - _02263D3A - 2 ; case 1
	.short _02263D70 - _02263D3A - 2 ; case 2
	.short _02263D44 - _02263D3A - 2 ; case 3
	.short _02263D8A - _02263D3A - 2 ; case 4
_02263D44:
	add r0, r5, #0
	bl ov49_0225A0CC
	add r0, r7, #0
	mov r1, #0
	bl ov45_0222AED8
	add r0, r7, #0
	bl ov45_0222B028
	cmp r0, #0
	beq _02263D66
	add r0, r6, #0
	mov r1, #4
	bl ov49_0225EF8C
	b _022644DA
_02263D66:
	add r0, r6, #0
	mov r1, #6
	bl ov49_0225EF8C
	b _022644DA
_02263D70:
	add r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _02263D80
	add r0, r5, #0
	bl ov49_0225A0BC
_02263D80:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264EC8
	b _022644DA
_02263D8A:
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263D9A:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02264E20
	cmp r0, #1
	bne _02263DBA
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #5
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263DBA:
	add r0, r6, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _022644DA
_02263DC4:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x28
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #7
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263DF2:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrh r1, [r4, #8]
	add r0, r5, #0
	mov r2, #1
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldrh r2, [r4, #8]
	add r0, r5, #0
	bl ov49_02264C50
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #7
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263E2A:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x2f
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #9
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263E58:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x35
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #9
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263E86:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bhi _02263F3C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02263E98: ; jump table
	.short _02263F2C - _02263E98 - 2 ; case 0
	.short _02263F3C - _02263E98 - 2 ; case 1
	.short _02263F12 - _02263E98 - 2 ; case 2
	.short _02263EA2 - _02263E98 - 2 ; case 3
	.short _02263F3C - _02263E98 - 2 ; case 4
_02263EA2:
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _02263EB2
	cmp r0, #4
	beq _02263ECE
	cmp r0, #5
	beq _02263EEA
	b _02263EFC
_02263EB2:
	add r0, r6, #0
	mov r1, #0xa
	bl ov49_0225EF8C
	add r0, r7, #0
	bl ov45_0222B0BC
	mov r0, #1
	str r0, [r4, #0x4c]
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl ov49_02264F78
	b _02263F0A
_02263ECE:
	add r0, r6, #0
	mov r1, #0xe
	bl ov49_0225EF8C
	add r0, r7, #0
	bl ov45_0222B0BC
	mov r0, #1
	str r0, [r4, #0x4c]
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl ov49_02264F78
	b _02263F0A
_02263EEA:
	add r0, r7, #0
	mov r1, #1
	bl ov45_0222AED8
	add r0, r6, #0
	mov r1, #0xf
	bl ov49_0225EF8C
	b _02263F0A
_02263EFC:
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
_02263F0A:
	add r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263F12:
	add r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _02263F22
	add r0, r5, #0
	bl ov49_0225A0BC
_02263F22:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264EC8
	b _022644DA
_02263F2C:
	add r0, r6, #0
	mov r1, #0x1b
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263F3C:
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263F4C:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	mov r3, #1
	str r3, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _02263FCC ; =0x000001FF
	add r0, r5, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xb
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263F88:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	mov r3, #1
	str r3, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02264E90
	mov r2, #2
	ldrb r1, [r4, #3]
	add r0, r5, #0
	lsl r2, r2, #8
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xc
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
	nop
_02263FC8: .word 0x000005E4
_02263FCC: .word 0x000001FF
_02263FD0:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	mov r3, #1
	str r3, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _02264348 ; =0x00000201
	add r0, r5, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0xd
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226400C:
	ldr r0, _0226434C ; =0x000005BF
	bl PlaySE
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldr r2, _02264350 ; =0x00000202
	add r0, r5, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #8
	add r3, r6, #0
	bl ov49_02264CFC
	add r0, r7, #0
	mov r1, #2
	bl ov45_0222AED8
	add r0, r7, #0
	bl ov45_0222A5C0
	bl ov45_0222AAC8
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A478
	b _022644DA
_0226405A:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	mov r3, #1
	str r3, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _02264354 ; =0x000001FB
	add r0, r5, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x1b
	add r3, r6, #0
	bl ov49_02264CFC
	add r0, r7, #0
	mov r1, #2
	bl ov45_0222AED8
	b _022644DA
_0226409E:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldr r2, _02264358 ; =0x000002AF
	add r0, r5, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x10
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_022640CC:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bhi _0226411C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022640DE: ; jump table
	.short _0226411C - _022640DE - 2 ; case 0
	.short _0226411C - _022640DE - 2 ; case 1
	.short _02264102 - _022640DE - 2 ; case 2
	.short _022640E8 - _022640DE - 2 ; case 3
	.short _0226411C - _022640DE - 2 ; case 4
_022640E8:
	add r0, r6, #0
	mov r1, #0x11
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	add r0, r7, #0
	bl ov45_0222B0BC
	mov r0, #1
	str r0, [r4, #0x4c]
	b _022644DA
_02264102:
	add r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _02264112
	add r0, r5, #0
	bl ov49_0225A0BC
_02264112:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264EC8
	b _022644DA
_0226411C:
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	add r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_0226412C:
	ldr r0, [sp, #0x10]
	cmp r0, #6
	blo _02264136
	cmp r0, #0x7e
	blo _02264140
_02264136:
	add r0, r6, #0
	mov r1, #0x1a
	bl ov49_0225EF8C
	b _022644DA
_02264140:
	sub r0, r0, #6
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	mov r2, #0
	lsr r0, r0, #2
	strb r0, [r4]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	bl ov49_0225A334
	ldrb r2, [r4]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, #0x37
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x12
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226417A:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r2, [r4]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, #0x55
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x13
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_022641AA:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r2, [r4, #2]
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, #0xec
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x14
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_022641DA:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r3, [r4]
	ldr r2, _0226435C ; =0x000001DD
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, r3, r2
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x15
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226420C:
	mov r0, #2
	str r0, [sp]
	ldrb r3, [r4]
	add r0, r4, #0
	add r0, #0x14
	lsl r3, r3, #2
	add r1, r5, #0
	mov r2, #5
	add r3, #0x73
	bl ov49_02264F9C
	add r1, r4, #0
	mov r2, #0
	add r0, r5, #0
	add r1, #0x14
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r4, #0
	bl ov49_02264F10
	add r0, r6, #0
	mov r1, #0x16
	bl ov49_0225EF8C
	b _022644DA
_02264240:
	add r0, r5, #0
	bl ov49_0225A1D4
	cmp r0, #4
	bhi _0226429A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02264256: ; jump table
	.short _02264260 - _02264256 - 2 ; case 0
	.short _02264260 - _02264256 - 2 ; case 1
	.short _02264260 - _02264256 - 2 ; case 2
	.short _02264260 - _02264256 - 2 ; case 3
	.short _02264282 - _02264256 - 2 ; case 4
_02264260:
	ldrb r1, [r4]
	lsl r1, r1, #2
	add r0, r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4, #1]
	add r0, r7, #0
	add r1, r1, #6
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov45_0222AED8
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	mov r0, #1
	b _022642A4
_02264282:
	mov r0, #0x7e
	strb r0, [r4, #1]
	ldrb r1, [r4, #1]
	add r0, r7, #0
	bl ov45_0222AED8
	add r0, r6, #0
	mov r1, #0x1c
	bl ov49_0225EF8C
	mov r0, #1
	b _022642A4
_0226429A:
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02264F24
	mov r0, #0
_022642A4:
	cmp r0, #0
	bne _022642AA
	b _022644DA
_022642AA:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl ov49_02265260
	add r0, r4, #0
	bl ov49_02264F1C
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl ov49_02264F78
	b _022644DA
_022642CE:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r3, [r4, #1]
	ldr r2, _02264360 ; =0x00000165
	ldrb r1, [r4, #3]
	add r0, r5, #0
	add r2, r3, r2
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	ldrb r1, [r4, #2]
	ldrb r0, [r4, #1]
	cmp r1, r0
	bne _02264308
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x18
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02264308:
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x19
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226431A:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x33
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x19
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
	.balign 4, 0
_02264348: .word 0x00000201
_0226434C: .word 0x000005BF
_02264350: .word 0x00000202
_02264354: .word 0x000001FB
_02264358: .word 0x000002AF
_0226435C: .word 0x000001DD
_02264360: .word 0x00000165
_02264364:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x34
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #8
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02264392:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl ov49_02265260
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x2d
	bl ov49_02264C04
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x20]
	bl StringGetLength
	str r0, [sp, #0x24]
	add r0, r5, #0
	bl ov49_0225CB70
	ldr r1, [sp, #0x24]
	mul r0, r1
	lsr r1, r0, #1
	add r1, #0x3c
	cmp r1, #0x80
	bhs _022643DC
	mov r1, #0x80
	b _022643E2
_022643DC:
	cmp r1, #0xff
	bls _022643E2
	mov r1, #0xff
_022643E2:
	mov r0, #0x1d
	lsl r1, r1, #0x18
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0x1f
	add r3, r6, #0
	bl ov49_02264CFC
	add r0, r7, #0
	bl ov45_0222AFC4
	b _022644DA
_022643FC:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x2b
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x1d
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x1f
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226442E:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	add r0, r5, #0
	mov r2, #0x31
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x1b
	add r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226445C:
	add r0, r4, #0
	add r1, r6, #0
	bl ov49_02264D14
	b _022644DA
_02264466:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov49_02264D30
	b _022644DA
_02264472:
	add r0, r4, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	bne _0226448A
	add r1, r4, #0
	add r1, #0x46
	ldrh r1, [r1]
	ldr r2, [r4, #0x48]
	add r0, r7, #0
	bl ov45_0222A704
_0226448A:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _02264498
	ldrb r1, [r4, #3]
	add r0, r7, #0
	bl ov45_0222B0D8
_02264498:
	add r0, r7, #0
	bl ov45_0222AE64
	add r0, r5, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	bl ov49_02264CF8
	add r0, r6, #0
	bl ov49_0225EF68
	add r0, r7, #0
	mov r1, #1
	bl ov45_0222A5E8
	add r0, r5, #0
	bl ov49_02259FF0
	add r4, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov49_02258EEC
	add r0, r5, #0
	bl ov49_0225A4D0
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022644DA:
	add r0, r4, #0
	bl ov49_02264F60
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02263B74

	thumb_func_start ov49_022644E8
ov49_022644E8: ; 0x022644E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r6, r0, #0
	bl ov49_0225EF84
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_02259FE8
	add r7, r0, #0
	add r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x18
	bls _0226450A
	b _022649EA
_0226450A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02264516: ; jump table
	.short _02264548 - _02264516 - 2 ; case 0
	.short _02264588 - _02264516 - 2 ; case 1
	.short _022645A8 - _02264516 - 2 ; case 2
	.short _022645C8 - _02264516 - 2 ; case 3
	.short _022645E8 - _02264516 - 2 ; case 4
	.short _02264608 - _02264516 - 2 ; case 5
	.short _02264632 - _02264516 - 2 ; case 6
	.short _022646E0 - _02264516 - 2 ; case 7
	.short _02264700 - _02264516 - 2 ; case 8
	.short _0226471E - _02264516 - 2 ; case 9
	.short _02264796 - _02264516 - 2 ; case 10
	.short _022647C0 - _02264516 - 2 ; case 11
	.short _022647EA - _02264516 - 2 ; case 12
	.short _02264814 - _02264516 - 2 ; case 13
	.short _02264834 - _02264516 - 2 ; case 14
	.short _02264854 - _02264516 - 2 ; case 15
	.short _02264874 - _02264516 - 2 ; case 16
	.short _02264898 - _02264516 - 2 ; case 17
	.short _0226490E - _02264516 - 2 ; case 18
	.short _0226492E - _02264516 - 2 ; case 19
	.short _0226494E - _02264516 - 2 ; case 20
	.short _0226496E - _02264516 - 2 ; case 21
	.short _0226498E - _02264516 - 2 ; case 22
	.short _022649AE - _02264516 - 2 ; case 23
	.short _022649C2 - _02264516 - 2 ; case 24
_02264548:
	add r0, r6, #0
	mov r1, #0x28
	bl ov49_0225EF40
	ldr r0, _02264894 ; =0x000005DC
	bl PlaySE
	add r0, r7, #0
	bl ov45_0222A330
	cmp r0, #1
	bne _0226456A
	add r0, r6, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _022649EA
_0226456A:
	add r0, r7, #0
	bl ov45_0222A374
	cmp r0, #1
	bne _0226457E
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _022649EA
_0226457E:
	add r0, r6, #0
	mov r1, #3
	bl ov49_0225EF8C
	b _022649EA
_02264588:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4e
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #0x18
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022645A8:
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #0x18
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022645C8:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022645E8:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x10
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #5
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264608:
	add r0, r5, #4
	add r1, r4, #0
	bl ov49_02265110
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xf
	mov r2, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov49_0225A1A4
	add r0, r6, #0
	mov r1, #6
	bl ov49_0225EF8C
	b _022649EA
_02264632:
	add r0, r4, #0
	mov r7, #0
	bl ov49_0225A1D4
	cmp r0, #7
	bhi _0226465A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0226464A: ; jump table
	.short _02264664 - _0226464A - 2 ; case 0
	.short _02264670 - _0226464A - 2 ; case 1
	.short _0226467C - _0226464A - 2 ; case 2
	.short _02264688 - _0226464A - 2 ; case 3
	.short _02264694 - _0226464A - 2 ; case 4
	.short _022646A0 - _0226464A - 2 ; case 5
	.short _022646AC - _0226464A - 2 ; case 6
	.short _022646BE - _0226464A - 2 ; case 7
_0226465A:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _022646B8
	b _022646C8
_02264664:
	add r0, r6, #0
	mov r1, #7
	bl ov49_0225EF8C
	mov r7, #1
	b _022646C8
_02264670:
	add r0, r6, #0
	mov r1, #8
	bl ov49_0225EF8C
	mov r7, #1
	b _022646C8
_0226467C:
	add r0, r6, #0
	mov r1, #0xd
	bl ov49_0225EF8C
	mov r7, #1
	b _022646C8
_02264688:
	add r0, r6, #0
	mov r1, #0xe
	bl ov49_0225EF8C
	mov r7, #1
	b _022646C8
_02264694:
	add r0, r6, #0
	mov r1, #0xf
	bl ov49_0225EF8C
	mov r7, #1
	b _022646C8
_022646A0:
	add r0, r6, #0
	mov r1, #0x15
	bl ov49_0225EF8C
	mov r7, #1
	b _022646C8
_022646AC:
	add r0, r6, #0
	mov r1, #0x10
	bl ov49_0225EF8C
	mov r7, #1
	b _022646C8
_022646B8:
	ldr r0, _02264894 ; =0x000005DC
	bl PlaySE
_022646BE:
	add r0, r6, #0
	mov r1, #0x16
	bl ov49_0225EF8C
	mov r7, #1
_022646C8:
	cmp r7, #1
	bne _02264780
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r5, #4
	add r1, r4, #0
	bl ov49_02265260
	b _022649EA
_022646E0:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x17
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264700:
	add r0, r5, #4
	add r1, r4, #0
	bl ov49_022651E8
	mov r2, #0
	add r0, r4, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r6, #0
	mov r1, #9
	bl ov49_0225EF8C
	b _022649EA
_0226471E:
	add r0, r4, #0
	mov r7, #0
	bl ov49_0225A1D4
	cmp r0, #3
	bhi _0226473E
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02264736: ; jump table
	.short _02264748 - _02264736 - 2 ; case 0
	.short _02264754 - _02264736 - 2 ; case 1
	.short _02264760 - _02264736 - 2 ; case 2
	.short _02264772 - _02264736 - 2 ; case 3
_0226473E:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _0226476C
	b _0226477C
_02264748:
	add r0, r6, #0
	mov r1, #0xa
	bl ov49_0225EF8C
	mov r7, #1
	b _0226477C
_02264754:
	add r0, r6, #0
	mov r1, #0xb
	bl ov49_0225EF8C
	mov r7, #1
	b _0226477C
_02264760:
	add r0, r6, #0
	mov r1, #0xc
	bl ov49_0225EF8C
	mov r7, #1
	b _0226477C
_0226476C:
	ldr r0, _02264894 ; =0x000005DC
	bl PlaySE
_02264772:
	add r0, r6, #0
	mov r1, #4
	bl ov49_0225EF8C
	mov r7, #1
_0226477C:
	cmp r7, #1
	beq _02264782
_02264780:
	b _022649EA
_02264782:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r5, #4
	add r1, r4, #0
	bl ov49_02265260
	b _022649EA
_02264796:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x18
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022647C0:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x19
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022647EA:
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1a
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264814:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x12
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264834:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x13
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264854:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x14
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264874:
	add r0, r5, #4
	add r1, r4, #0
	bl ov49_02265170
	mov r2, #0
	add r0, r4, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov49_0225A174
	add r0, r6, #0
	mov r1, #0x11
	bl ov49_0225EF8C
	b _022649EA
	nop
_02264894: .word 0x000005DC
_02264898:
	add r0, r4, #0
	mov r7, #0
	bl ov49_0225A1D4
	cmp r0, #3
	bhi _022648B8
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022648B0: ; jump table
	.short _022648C2 - _022648B0 - 2 ; case 0
	.short _022648CE - _022648B0 - 2 ; case 1
	.short _022648DA - _022648B0 - 2 ; case 2
	.short _022648EC - _022648B0 - 2 ; case 3
_022648B8:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _022648E6
	b _022648F6
_022648C2:
	add r0, r6, #0
	mov r1, #0x12
	bl ov49_0225EF8C
	mov r7, #1
	b _022648F6
_022648CE:
	add r0, r6, #0
	mov r1, #0x13
	bl ov49_0225EF8C
	mov r7, #1
	b _022648F6
_022648DA:
	add r0, r6, #0
	mov r1, #0x14
	bl ov49_0225EF8C
	mov r7, #1
	b _022648F6
_022648E6:
	ldr r0, _022649F0 ; =0x000005DC
	bl PlaySE
_022648EC:
	add r0, r6, #0
	mov r1, #4
	bl ov49_0225EF8C
	mov r7, #1
_022648F6:
	cmp r7, #1
	bne _022649EA
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov49_0225A1E4
	add r0, r5, #4
	add r1, r4, #0
	bl ov49_02265260
	b _022649EA
_0226490E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1b
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226492E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1c
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226494E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1d
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226496E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1e
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #4
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226498E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x16
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	mov r0, #0x18
	str r0, [r5]
	add r0, r6, #0
	mov r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022649AE:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _022649EA
	ldr r1, [r5]
	add r0, r6, #0
	bl ov49_0225EF8C
	b _022649EA
_022649C2:
	add r0, r6, #0
	bl ov49_0225EF68
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	bl ov49_02259FF0
	add r4, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov49_02258EEC
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022649EA:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022649F0: .word 0x000005DC
	thumb_func_end ov49_022644E8

	thumb_func_start ov49_022649F4
ov49_022649F4: ; 0x022649F4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl ov49_0225EF84
	add r0, r4, #0
	bl ov49_02259FE8
	add r6, r0, #0
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02264A1E
	cmp r0, #1
	bne _02264A16
	b _02264B56
_02264A16:
	cmp r0, #2
	bne _02264A1C
	b _02264B6A
_02264A1C:
	b _02264B8A
_02264A1E:
	ldr r0, _02264B90 ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	bl ov45_0222A330
	cmp r0, #0
	bne _02264A54
	add r0, r6, #0
	bl ov45_0222A374
	cmp r0, #1
	bne _02264A70
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4e
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02264B8A
_02264A54:
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02264B8A
_02264A70:
	add r0, r6, #0
	bl ov45_0222B134
	cmp r0, #8
	bhi _02264B3A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02264A86: ; jump table
	.short _02264A98 - _02264A86 - 2 ; case 0
	.short _02264AB0 - _02264A86 - 2 ; case 1
	.short _02264AC8 - _02264A86 - 2 ; case 2
	.short _02264AE0 - _02264A86 - 2 ; case 3
	.short _02264AF8 - _02264A86 - 2 ; case 4
	.short _02264B10 - _02264A86 - 2 ; case 5
	.short _02264B1E - _02264A86 - 2 ; case 6
	.short _02264B2C - _02264A86 - 2 ; case 7
	.short _02264B3A - _02264A86 - 2 ; case 8
_02264A98:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x49
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264AB0:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x49
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264AC8:
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x49
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264AE0:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4d
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264AF8:
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl ov49_0225A37C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4d
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264B10:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4a
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264B1E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4f
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264B2C:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4b
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264B46
_02264B3A:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4c
	bl ov49_0225A30C
	add r1, r0, #0
_02264B46:
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #1
	bl ov49_0225EF8C
	b _02264B8A
_02264B56:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _02264B8A
	add r0, r5, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _02264B8A
_02264B6A:
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	bl ov49_02259FF0
	add r4, r0, #0
	bl ov49_02258DAC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov49_02258EEC
	mov r0, #1
	pop {r4, r5, r6, pc}
_02264B8A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02264B90: .word 0x000005DC
	thumb_func_end ov49_022649F4

	thumb_func_start ov49_02264B94
ov49_02264B94: ; 0x02264B94
	push {r3, lr}
	sub sp, #8
	bl ov45_0222A9C8
	str r0, [sp]
	str r0, [sp, #4]
	add r0, sp, #0
	ldrb r0, [r0, #4]
	cmp r0, #0x18
	bhi _02264BF8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02264BB4: ; jump table
	.short _02264BF2 - _02264BB4 - 2 ; case 0
	.short _02264BF2 - _02264BB4 - 2 ; case 1
	.short _02264BF2 - _02264BB4 - 2 ; case 2
	.short _02264BF2 - _02264BB4 - 2 ; case 3
	.short _02264BE6 - _02264BB4 - 2 ; case 4
	.short _02264BE6 - _02264BB4 - 2 ; case 5
	.short _02264BE6 - _02264BB4 - 2 ; case 6
	.short _02264BE6 - _02264BB4 - 2 ; case 7
	.short _02264BE6 - _02264BB4 - 2 ; case 8
	.short _02264BE6 - _02264BB4 - 2 ; case 9
	.short _02264BE6 - _02264BB4 - 2 ; case 10
	.short _02264BEC - _02264BB4 - 2 ; case 11
	.short _02264BEC - _02264BB4 - 2 ; case 12
	.short _02264BEC - _02264BB4 - 2 ; case 13
	.short _02264BEC - _02264BB4 - 2 ; case 14
	.short _02264BEC - _02264BB4 - 2 ; case 15
	.short _02264BEC - _02264BB4 - 2 ; case 16
	.short _02264BEC - _02264BB4 - 2 ; case 17
	.short _02264BEC - _02264BB4 - 2 ; case 18
	.short _02264BF2 - _02264BB4 - 2 ; case 19
	.short _02264BF2 - _02264BB4 - 2 ; case 20
	.short _02264BF2 - _02264BB4 - 2 ; case 21
	.short _02264BF2 - _02264BB4 - 2 ; case 22
	.short _02264BF2 - _02264BB4 - 2 ; case 23
	.short _02264BF2 - _02264BB4 - 2 ; case 24
_02264BE6:
	add sp, #8
	mov r0, #0
	pop {r3, pc}
_02264BEC:
	add sp, #8
	mov r0, #1
	pop {r3, pc}
_02264BF2:
	add sp, #8
	mov r0, #2
	pop {r3, pc}
_02264BF8:
	bl GF_AssertFail
	mov r0, #1
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02264B94

	thumb_func_start ov49_02264C04
ov49_02264C04: ; 0x02264C04
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r4, r2, #0
	bl ov49_02259FE8
	add r1, r6, #0
	bl ov45_0222AB28
	cmp r0, #1
	bne _02264C36
	ldr r3, _02264C44 ; =ov49_02269EC4
	ldr r0, _02264C48 ; =0x00000163
	mov r2, #0
_02264C20:
	ldrh r1, [r3]
	cmp r4, r1
	bne _02264C2E
	ldr r0, _02264C4C ; =ov49_02269EC6
	lsl r1, r2, #2
	ldrh r4, [r0, r1]
	b _02264C36
_02264C2E:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, r0
	blo _02264C20
_02264C36:
	add r0, r5, #0
	mov r1, #3
	add r2, r4, #0
	bl ov49_0225A30C
	pop {r4, r5, r6, pc}
	nop
_02264C44: .word ov49_02269EC4
_02264C48: .word 0x00000163
_02264C4C: .word ov49_02269EC6
	thumb_func_end ov49_02264C04

	thumb_func_start ov49_02264C50
ov49_02264C50: ; 0x02264C50
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	bl ov49_02259FE8
	add r7, r0, #0
	add r1, r5, #0
	bl ov45_0222AB28
	add r5, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl ov45_0222AB28
	mov r2, #0x29
	cmp r5, #1
	bne _02264C7C
	cmp r0, #1
	bne _02264C7C
	ldr r2, _02264C9C ; =0x000002AA
	b _02264C92
_02264C7C:
	cmp r5, #1
	bne _02264C88
	cmp r0, #0
	bne _02264C88
	ldr r2, _02264CA0 ; =0x00000226
	b _02264C92
_02264C88:
	cmp r5, #0
	bne _02264C92
	cmp r0, #1
	bne _02264C92
	ldr r2, _02264CA4 ; =0x000002A9
_02264C92:
	add r0, r4, #0
	mov r1, #3
	bl ov49_0225A30C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02264C9C: .word 0x000002AA
_02264CA0: .word 0x00000226
_02264CA4: .word 0x000002A9
	thumb_func_end ov49_02264C50

	thumb_func_start ov49_02264CA8
ov49_02264CA8: ; 0x02264CA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0
	add r6, r2, #0
	mvn r0, r0
	add r4, r1, #0
	cmp r6, r0
	bne _02264CBC
	bl GF_AssertFail
_02264CBC:
	strb r6, [r5, #3]
	add r0, r4, #0
	bl ov45_0222A53C
	strh r0, [r5, #8]
	mov r0, #1
	strh r0, [r5, #0xa]
	add r0, r4, #0
	bl ov45_0222A5C0
	add r6, r0, #0
	ldrb r1, [r5, #3]
	add r0, r4, #0
	bl ov45_0222A578
	add r4, r0, #0
	bne _02264CE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_02264CE2:
	add r0, r6, #0
	bl ov49_02264B94
	strb r0, [r5, #4]
	add r0, r4, #0
	bl ov49_02264B94
	strb r0, [r5, #5]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_02264CA8

	thumb_func_start ov49_02264CF8
ov49_02264CF8: ; 0x02264CF8
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02264CF8

	thumb_func_start ov49_02264CFC
ov49_02264CFC: ; 0x02264CFC
	strb r1, [r0, #6]
	ldr r1, _02264D0C ; =0xFFFFFFF0
	strb r2, [r0, #7]
	add r0, r3, #0
	add r1, sp
	ldr r3, _02264D10 ; =ov49_0225EF8C
	ldrb r1, [r1, #0x10]
	bx r3
	.balign 4, 0
_02264D0C: .word 0xFFFFFFF0
_02264D10: .word ov49_0225EF8C
	thumb_func_end ov49_02264CFC

	thumb_func_start ov49_02264D14
ov49_02264D14: ; 0x02264D14
	push {r3, lr}
	add r2, r0, #0
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _02264D24
	sub r0, r0, #1
	strb r0, [r2, #6]
	pop {r3, pc}
_02264D24:
	add r0, r1, #0
	ldrb r1, [r2, #7]
	bl ov49_0225EF8C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_02264D14

	thumb_func_start ov49_02264D30
ov49_02264D30: ; 0x02264D30
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _02264D48
	ldrb r1, [r5, #7]
	add r0, r4, #0
	bl ov49_0225EF8C
_02264D48:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov49_02264D30

	thumb_func_start ov49_02264D4C
ov49_02264D4C: ; 0x02264D4C
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	bl ov49_02264D9C
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl ov49_02264D9C
	ldr r0, [sp, #0x10]
	bl ov45_0222AA10
	add r4, r0, #0
	ldr r0, [sp, #0x14]
	bl ov45_0222AA10
	add r3, r0, #0
	ldr r2, _02264D98 ; =ov49_02269E44
	lsl r4, r4, #4
	lsl r3, r3, #1
	add r2, r2, r4
	ldrh r2, [r3, r2]
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	bl ov49_0225A08C
	pop {r3, r4, r5, pc}
	nop
_02264D98: .word ov49_02269E44
	thumb_func_end ov49_02264D4C

	thumb_func_start ov49_02264D9C
ov49_02264D9C: ; 0x02264D9C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, r3, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov45_0222AA10
	cmp r0, #7
	bhi _02264E12
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02264DBA: ; jump table
	.short _02264E12 - _02264DBA - 2 ; case 0
	.short _02264DCA - _02264DBA - 2 ; case 1
	.short _02264DD6 - _02264DBA - 2 ; case 2
	.short _02264DE2 - _02264DBA - 2 ; case 3
	.short _02264DEE - _02264DBA - 2 ; case 4
	.short _02264DFA - _02264DBA - 2 ; case 5
	.short _02264E12 - _02264DBA - 2 ; case 6
	.short _02264E06 - _02264DBA - 2 ; case 7
_02264DCA:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225A3AC
	pop {r4, r5, r6, pc}
_02264DD6:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225A3BC
	pop {r4, r5, r6, pc}
_02264DE2:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225A3CC
	pop {r4, r5, r6, pc}
_02264DEE:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225A3DC
	pop {r4, r5, r6, pc}
_02264DFA:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225A3EC
	pop {r4, r5, r6, pc}
_02264E06:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225A3FC
	pop {r4, r5, r6, pc}
_02264E12:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_0225A3BC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_02264D9C

	thumb_func_start ov49_02264E20
ov49_02264E20: ; 0x02264E20
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	add r7, r2, #0
	bl ov45_0222A5C0
	str r0, [sp]
	ldrb r1, [r5, #3]
	add r0, r6, #0
	bl ov45_0222A578
	add r6, r0, #0
	ldr r0, [sp]
	bl ov45_0222AA28
	cmp r0, #0
	bne _02264E48
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02264E48:
	add r0, r6, #0
	bl ov45_0222AA28
	cmp r0, #0
	bne _02264E56
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02264E56:
	ldrb r1, [r5, #5]
	ldrb r0, [r5, #4]
	cmp r0, r1
	beq _02264E8C
	cmp r1, #0
	beq _02264E6C
	cmp r1, #1
	beq _02264E70
	cmp r1, #2
	beq _02264E74
	b _02264E76
_02264E6C:
	mov r4, #0x27
	b _02264E76
_02264E70:
	mov r4, #0x25
	b _02264E76
_02264E74:
	mov r4, #0x26
_02264E76:
	add r0, r7, #0
	mov r1, #3
	add r2, r4, #0
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r7, #0
	bl ov49_0225A08C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02264E8C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02264E20

	thumb_func_start ov49_02264E90
ov49_02264E90: ; 0x02264E90
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov45_0222A5C0
	str r0, [sp]
	ldrb r1, [r5, #3]
	add r0, r4, #0
	bl ov45_0222A578
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _02264EB6
	bl ov45_0222AAC8
	b _02264EBC
_02264EB6:
	ldr r0, [sp]
	bl ov45_0222AAC8
_02264EBC:
	add r1, r0, #0
	add r0, r6, #0
	add r2, r7, #0
	bl ov49_0225A39C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02264E90

	thumb_func_start ov49_02264EC8
ov49_02264EC8: ; 0x02264EC8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_02259FE8
	bl ov45_0222B094
	ldr r1, _02264F0C ; =0x000001C2
	cmp r0, r1
	bne _02264F08
	add r0, r4, #0
	bl ov49_0225A0CC
	ldrb r1, [r5, #3]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A334
	mov r2, #0xab
	ldrb r1, [r5, #3]
	add r0, r4, #0
	lsl r2, r2, #2
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r4, #0
	bl ov49_0225A0BC
_02264F08:
	pop {r3, r4, r5, pc}
	nop
_02264F0C: .word 0x000001C2
	thumb_func_end ov49_02264EC8

	thumb_func_start ov49_02264F10
ov49_02264F10: ; 0x02264F10
	mov r1, #0
	strh r1, [r0, #0xe]
	mov r1, #1
	strb r1, [r0, #0xd]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02264F10

	thumb_func_start ov49_02264F1C
ov49_02264F1C: ; 0x02264F1C
	mov r1, #0
	strh r1, [r0, #0xe]
	strb r1, [r0, #0xd]
	bx lr
	thumb_func_end ov49_02264F1C

	thumb_func_start ov49_02264F24
ov49_02264F24: ; 0x02264F24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xd]
	add r4, r1, #0
	cmp r0, #1
	bne _02264F56
	mov r0, #0xe
	ldrsh r1, [r5, r0]
	ldr r0, _02264F58 ; =0x000001C2
	cmp r1, r0
	bne _02264F56
	ldrb r1, [r5, #3]
	add r0, r4, #0
	mov r2, #0
	bl ov49_0225A334
	ldrb r1, [r5, #3]
	ldr r2, _02264F5C ; =0x000002AB
	add r0, r4, #0
	bl ov49_02264C04
	add r1, r0, #0
	add r0, r4, #0
	bl ov49_0225A08C
_02264F56:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02264F58: .word 0x000001C2
_02264F5C: .word 0x000002AB
	thumb_func_end ov49_02264F24

	thumb_func_start ov49_02264F60
ov49_02264F60: ; 0x02264F60
	ldrb r1, [r0, #0xd]
	cmp r1, #1
	bne _02264F76
	mov r1, #0xe
	ldrsh r2, [r0, r1]
	mov r1, #0xe1
	lsl r1, r1, #2
	cmp r2, r1
	bgt _02264F76
	add r1, r2, #1
	strh r1, [r0, #0xe]
_02264F76:
	bx lr
	thumb_func_end ov49_02264F60

	thumb_func_start ov49_02264F78
ov49_02264F78: ; 0x02264F78
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov45_0222A9A4
	add r1, r5, #0
	mov r2, #1
	add r1, #0x44
	strh r2, [r1]
	add r1, r5, #0
	add r1, #0x46
	strh r0, [r1]
	add r0, r4, #0
	bl ov45_0222A99C
	str r0, [r5, #0x48]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02264F78

	thumb_func_start ov49_02264F9C
ov49_02264F9C: ; 0x02264F9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r7, r2, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r7, #0
	str r3, [sp, #4]
	ldr r6, [sp, #0x20]
	bl ov49_0225A10C
	ldr r0, [sp]
	mov r4, #0
	str r7, [r0, #0x20]
	cmp r7, #0
	bls _02265006
	sub r0, r7, #1
	str r0, [sp, #8]
_02264FC0:
	cmp r6, #0
	beq _02264FEA
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02264FEA
	cmp r6, #1
	bne _02264FDC
	ldr r2, _0226503C ; =0x00000205
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264FF8
_02264FDC:
	add r0, r5, #0
	mov r1, #3
	mov r2, #0xeb
	bl ov49_0225A30C
	add r1, r0, #0
	b _02264FF8
_02264FEA:
	ldr r2, [sp, #4]
	add r0, r5, #0
	mov r1, #3
	add r2, r2, r4
	bl ov49_0225A30C
	add r1, r0, #0
_02264FF8:
	add r0, r5, #0
	add r2, r4, #0
	bl ov49_0225A144
	add r4, r4, #1
	cmp r4, r7
	blo _02264FC0
_02265006:
	ldr r3, _02265040 ; =ov49_02269E24
	ldr r2, [sp]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp]
	ldr r1, [r0, #0x20]
	strh r1, [r0, #0x10]
	ldr r1, [r0, #0x20]
	ldrh r0, [r0, #0x12]
	cmp r0, r1
	bls _0226502C
	ldr r0, [sp]
	strh r1, [r0, #0x12]
_0226502C:
	add r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226503C: .word 0x00000205
_02265040: .word ov49_02269E24
	thumb_func_end ov49_02264F9C

	thumb_func_start ov49_02265044
ov49_02265044: ; 0x02265044
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	str r3, [sp, #4]
	str r0, [sp, #0x24]
	add r0, r5, #0
	add r1, r3, #0
	add r4, r2, #0
	bl ov49_0225A120
	ldr r1, [sp, #4]
	ldr r0, [sp]
	mov r7, #0
	str r1, [r0, #0x20]
	add r0, r1, #0
	beq _022650D4
	sub r0, r0, #1
	str r0, [sp, #8]
_02265070:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _022650A0
	ldr r0, [sp, #8]
	cmp r7, r0
	bne _022650A0
	ldr r0, [sp, #0x24]
	add r6, r4, #0
	cmp r0, #1
	bne _02265092
	ldr r2, _02265108 ; =0x00000205
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225A30C
	add r1, r0, #0
	b _022650C4
_02265092:
	add r0, r5, #0
	mov r1, #3
	mov r2, #0xeb
	bl ov49_0225A30C
	add r1, r0, #0
	b _022650C4
_022650A0:
	bl MTRandom
	add r1, r4, #0
	bl _u32_div_f
	add r0, r5, #0
	add r6, r1, #0
	bl ov49_0225A164
	cmp r0, #1
	beq _022650A0
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r1, #3
	add r2, r2, r6
	bl ov49_0225A30C
	add r1, r0, #0
_022650C4:
	add r0, r5, #0
	add r2, r6, #0
	bl ov49_0225A144
	ldr r0, [sp, #4]
	add r7, r7, #1
	cmp r7, r0
	blo _02265070
_022650D4:
	ldr r3, _0226510C ; =ov49_02269E24
	ldr r2, [sp]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp]
	ldr r1, [r0, #0x20]
	strh r1, [r0, #0x10]
	ldr r1, [r0, #0x20]
	ldrh r0, [r0, #0x12]
	cmp r0, r1
	bls _022650FA
	ldr r0, [sp]
	strh r1, [r0, #0x12]
_022650FA:
	add r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02265108: .word 0x00000205
_0226510C: .word ov49_02269E24
	thumb_func_end ov49_02265044

	thumb_func_start ov49_02265110
ov49_02265110: ; 0x02265110
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #8
	bl ov49_0225A10C
	mov r0, #8
	ldr r5, _02265168 ; =ov49_02269E1C
	str r0, [r7, #0x20]
	mov r4, #0
_02265126:
	ldrb r2, [r5]
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r6, #0
	add r2, r4, #0
	bl ov49_0225A144
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #8
	blt _02265126
	ldr r3, _0226516C ; =ov49_02269E24
	add r2, r7, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r7, #0x20]
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	strh r0, [r7, #0x12]
	add r0, r6, #0
	bl ov49_0225A154
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02265168: .word ov49_02269E1C
_0226516C: .word ov49_02269E24
	thumb_func_end ov49_02265110

	thumb_func_start ov49_02265170
ov49_02265170: ; 0x02265170
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225A10C
	mov r0, #4
	mov r4, #0
	str r0, [r6, #0x20]
	add r7, r4, #0
_02265186:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov49_0225A38C
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x27
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov49_0225A144
	add r4, r4, #1
	cmp r4, #3
	blt _02265186
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x25
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #3
	bl ov49_0225A144
	ldr r3, _022651E4 ; =ov49_02269E24
	add r2, r6, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x10]
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x12]
	add r0, r5, #0
	bl ov49_0225A154
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022651E4: .word ov49_02269E24
	thumb_func_end ov49_02265170

	thumb_func_start ov49_022651E8
ov49_022651E8: ; 0x022651E8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225A10C
	mov r0, #4
	mov r4, #0
	str r0, [r6, #0x20]
	add r7, r4, #0
_022651FE:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov49_0225A37C
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x26
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov49_0225A144
	add r4, r4, #1
	cmp r4, #3
	blt _022651FE
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x25
	bl ov49_0225A30C
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #3
	bl ov49_0225A144
	ldr r3, _0226525C ; =ov49_02269E24
	add r2, r6, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x10]
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x12]
	add r0, r5, #0
	bl ov49_0225A154
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226525C: .word ov49_02269E24
	thumb_func_end ov49_022651E8

	thumb_func_start ov49_02265260
ov49_02265260: ; 0x02265260
	ldr r3, _02265268 ; =ov49_0225A134
	add r0, r1, #0
	bx r3
	nop
_02265268: .word ov49_0225A134
	thumb_func_end ov49_02265260

	thumb_func_start ov49_0226526C
ov49_0226526C: ; 0x0226526C
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_0226526C

	thumb_func_start ov49_02265274
ov49_02265274: ; 0x02265274
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _02265288
	bl GF_AssertFail
_02265288:
	mov r0, #1
	strh r0, [r5]
	strh r4, [r5, #2]
	add r0, r7, #0
	strh r6, [r5, #4]
	bl ov45_0222B034
	strh r0, [r5, #6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02265274

	thumb_func_start ov49_0226529C
ov49_0226529C: ; 0x0226529C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	beq _022652CE
	add r0, r4, #0
	bl ov45_0222B034
	str r0, [r5, #8]
	ldrh r1, [r5, #4]
	cmp r0, r1
	bne _022652C4
	ldrh r1, [r5, #2]
	add r0, r4, #0
	bl ov45_0222AED8
	mov r0, #0
	strh r0, [r5]
	pop {r3, r4, r5, pc}
_022652C4:
	ldrh r1, [r5, #6]
	cmp r0, r1
	beq _022652CE
	mov r0, #0
	strh r0, [r5]
_022652CE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0226529C

	thumb_func_start ov49_022652D0
ov49_022652D0: ; 0x022652D0
	ldrh r0, [r0]
	cmp r0, #1
	beq _022652DA
	mov r0, #1
	bx lr
_022652DA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_022652D0

	thumb_func_start ov49_022652E0
ov49_022652E0: ; 0x022652E0
	ldr r0, [r0, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov49_022652E0

	thumb_func_start ov49_022652E8
ov49_022652E8: ; 0x022652E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r7, r1, #0
	ldr r0, [sp, #0x20]
	ldr r1, _02265354 ; =0x0001082C
	str r2, [sp]
	str r3, [sp, #4]
	ldr r5, [sp, #0x24]
	bl AllocFromHeap
	ldr r2, _02265354 ; =0x0001082C
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, [sp, #4]
	str r6, [r4]
	str r0, [r4, #4]
	ldr r0, [sp]
	ldr r1, [sp, #0x20]
	str r0, [r4, #8]
	mov r0, #0xd1
	str r7, [r4, #0xc]
	bl NARC_ctor
	add r6, r0, #0
	ldr r0, _02265358 ; =0x0001081C
	add r1, r5, #0
	add r0, r4, r0
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov49_02265698
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov49_02265738
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov49_022657B4
	add r0, r6, #0
	bl NARC_dtor
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02265354: .word 0x0001082C
_02265358: .word 0x0001081C
	thumb_func_end ov49_022652E8

	thumb_func_start ov49_0226535C
ov49_0226535C: ; 0x0226535C
	push {r4, lr}
	add r4, r0, #0
	bl ov49_0226571C
	add r0, r4, #0
	bl ov49_02265760
	add r0, r4, #0
	bl ov49_02265858
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov49_0226535C

	thumb_func_start ov49_02265378
ov49_02265378: ; 0x02265378
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r7, #0xd1
	mov r4, #0
	add r5, #0x10
	lsl r7, r7, #4
_02265386:
	add r0, r6, #0
	add r1, r5, #0
	bl ov49_022658E4
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #0x14
	blt _02265386
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02265378

	thumb_func_start ov49_02265398
ov49_02265398: ; 0x02265398
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	bl ov49_02258DAC
	add r5, r6, #0
	mov r7, #0xd1
	mov r4, #0
	add r5, #0x10
	lsl r7, r7, #4
_022653AC:
	add r0, r6, #0
	add r1, r5, #0
	bl ov49_02265920
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #0x14
	blt _022653AC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02265398

	thumb_func_start ov49_022653C0
ov49_022653C0: ; 0x022653C0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x14
	blo _022653D0
	bl GF_AssertFail
_022653D0:
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ov49_02258D70
	add r2, r0, #0
	beq _022653EE
	mov r1, #0xd1
	lsl r1, r1, #4
	add r0, r5, #0
	add r5, #0x10
	mul r1, r4
	add r1, r5, r1
	add r3, r6, #0
	bl ov49_02265890
_022653EE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_022653C0

	thumb_func_start ov49_022653F0
ov49_022653F0: ; 0x022653F0
	push {r3, lr}
	mov r2, #0xd1
	lsl r2, r2, #4
	add r0, #0x10
	mul r2, r1
	add r0, r0, r2
	bl ov49_02265958
	cmp r0, #1
	beq _02265408
	mov r0, #1
	pop {r3, pc}
_02265408:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov49_022653F0

	thumb_func_start ov49_0226540C
ov49_0226540C: ; 0x0226540C
	push {r3, r4}
	ldr r4, [sp, #0x14]
	sub r2, r2, r1
	str r4, [r0]
	str r1, [r0, #4]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	ldr r1, [sp, #8]
	str r3, [r0, #8]
	sub r1, r1, r3
	str r1, [r0, #0x18]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r3, [r0, #0x1c]
	str r2, [r0, #0xc]
	sub r1, r1, r2
	str r1, [r0, #0x20]
	str r2, [r0, #0x24]
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_0226540C

	thumb_func_start ov49_02265434
ov49_02265434: ; 0x02265434
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	mov r7, #0
	cmp r4, r0
	ble _02265448
	add r4, r0, #0
	mov r7, #1
_02265448:
	ldr r6, [r5, #0x10]
	cmp r6, #0
	beq _022654CC
	cmp r0, #0
	ble _02265466
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #8]
	b _02265476
_02265466:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #8]
_02265476:
	cmp r4, #0
	ble _0226548C
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0226549A
_0226548C:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0226549A:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r6, r2, #0xc
	orr r6, r0
	ldr r0, [sp, #8]
	bl _ffix
	add r1, r0, #0
	add r0, r6, #0
	bl FX_Div
	ldr r1, [r5, #0x14]
	add r0, r1, r0
	str r0, [r5, #4]
_022654CC:
	ldr r6, [r5, #0x18]
	cmp r6, #0
	beq _02265552
	ldr r0, [r5]
	cmp r0, #0
	ble _022654EC
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #4]
	b _022654FC
_022654EC:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #4]
_022654FC:
	cmp r4, #0
	ble _02265512
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02265520
_02265512:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02265520:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r6, r2, #0xc
	orr r6, r0
	ldr r0, [sp, #4]
	bl _ffix
	add r1, r0, #0
	add r0, r6, #0
	bl FX_Div
	ldr r1, [r5, #0x1c]
	add r0, r1, r0
	str r0, [r5, #8]
_02265552:
	ldr r6, [r5, #0x20]
	cmp r6, #0
	beq _022655D8
	ldr r0, [r5]
	cmp r0, #0
	ble _02265572
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp]
	b _02265582
_02265572:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp]
_02265582:
	cmp r4, #0
	ble _02265598
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022655A6
_02265598:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022655A6:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r4, r2, #0xc
	orr r4, r0
	ldr r0, [sp]
	bl _ffix
	add r1, r0, #0
	add r0, r4, #0
	bl FX_Div
	ldr r1, [r5, #0x24]
	add r0, r1, r0
	str r0, [r5, #0xc]
_022655D8:
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02265434

	thumb_func_start ov49_022655E0
ov49_022655E0: ; 0x022655E0
	push {r3, r4}
	ldr r4, [r0, #4]
	str r4, [r1]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov49_022655E0

	thumb_func_start ov49_022655F4
ov49_022655F4: ; 0x022655F4
	push {r4, lr}
	add r4, r0, #0
	strh r1, [r4]
	asr r0, r1, #4
	lsl r1, r0, #2
	ldr r0, _02265624 ; =FX_SinCosTable_
	strh r2, [r4, #2]
	ldrsh r0, [r0, r1]
	add r2, r3, #0
	str r3, [r4, #4]
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
	str r1, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
_02265624: .word FX_SinCosTable_
	thumb_func_end ov49_022655F4

	thumb_func_start ov49_02265628
ov49_02265628: ; 0x02265628
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4]
	ldrh r0, [r4, #2]
	add r0, r1, r0
	strh r0, [r4]
	ldrh r0, [r4]
	ldr r2, [r4, #4]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0226565C ; =FX_SinCosTable_
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
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
	str r1, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
_0226565C: .word FX_SinCosTable_
	thumb_func_end ov49_02265628

	thumb_func_start ov49_02265660
ov49_02265660: ; 0x02265660
	ldr r0, [r0, #8]
	str r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02265660

	thumb_func_start ov49_02265668
ov49_02265668: ; 0x02265668
	push {r3, r4, r5, lr}
	ldr r0, [r0, #4]
	ldr r4, [r1, #8]
	add r5, r2, #0
	bl ov49_02258DAC
	cmp r4, r0
	bne _02265684
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	mov r1, #5
	bl sub_0200606C
	pop {r3, r4, r5, pc}
_02265684:
	add r0, r4, #0
	bl ov49_02258F70
	cmp r0, #0
	bne _02265696
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_02265696:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02265668

	thumb_func_start ov49_02265698
ov49_02265698: ; 0x02265698
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #0
_022656A2:
	mov r0, #0
	add r1, r4, #0
	str r0, [sp]
	add r0, r6, #0
	add r1, #0x81
	mov r2, #0
	add r3, r7, #0
	bl GfGfxLoader_LoadFromOpenNarc
	ldr r1, _0226570C ; =0x00010550
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	bl NNS_G3dGetMdlSet
	ldr r1, _02265710 ; =0x00010554
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _022656EC
	add r0, r1, #0
	add r0, #8
	beq _022656E0
	ldrb r2, [r1, #9]
	cmp r2, #0
	bls _022656E0
	ldrh r2, [r1, #0xe]
	add r0, r0, r2
	add r0, r0, #4
	b _022656E2
_022656E0:
	mov r0, #0
_022656E2:
	cmp r0, #0
	beq _022656EC
	ldr r0, [r0]
	add r1, r1, r0
	b _022656EE
_022656EC:
	mov r1, #0
_022656EE:
	ldr r0, _02265714 ; =0x00010558
	str r1, [r5, r0]
	mov r1, #0
	add r0, r0, #4
	str r1, [r5, r0]
	ldr r0, _02265714 ; =0x00010558
	ldr r1, _02265718 ; =0x00007FFF
	ldr r0, [r5, r0]
	bl NNS_G3dMdlSetMdlEmiAll
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xf
	blt _022656A2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226570C: .word 0x00010550
_02265710: .word 0x00010554
_02265714: .word 0x00010558
_02265718: .word 0x00007FFF
	thumb_func_end ov49_02265698

	thumb_func_start ov49_0226571C
ov49_0226571C: ; 0x0226571C
	push {r4, r5, r6, lr}
	ldr r6, _02265734 ; =0x00010550
	add r5, r0, #0
	mov r4, #0
_02265724:
	ldr r0, [r5, r6]
	bl FreeToHeap
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xf
	blt _02265724
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02265734: .word 0x00010550
	thumb_func_end ov49_0226571C

	thumb_func_start ov49_02265738
ov49_02265738: ; 0x02265738
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldr r1, _0226575C ; =0x00010640
	add r7, r2, #0
	mov r4, #0
	add r5, r0, r1
_02265744:
	add r2, r4, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, #0x90
	add r3, r7, #0
	bl ov49_02258830
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x27
	blt _02265744
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226575C: .word 0x00010640
	thumb_func_end ov49_02265738

	thumb_func_start ov49_02265760
ov49_02265760: ; 0x02265760
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r7, _022657A8 ; =NNS_GfdDefaultFuncFreeTexVram
	add r5, r0, #0
	mov r4, #0
_0226576A:
	ldr r0, _022657AC ; =0x00010640
	ldr r0, [r5, r0]
	bl NNS_G3dGetTex
	add r1, sp, #4
	add r2, sp, #0
	add r6, r0, #0
	bl NNS_G3dTexReleaseTexKey
	ldr r0, [sp, #4]
	ldr r1, [r7]
	blx r1
	ldr r0, [sp]
	ldr r1, [r7]
	blx r1
	add r0, r6, #0
	bl NNS_G3dPlttReleasePlttKey
	ldr r1, _022657B0 ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r1, [r1]
	blx r1
	ldr r0, _022657AC ; =0x00010640
	ldr r0, [r5, r0]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x27
	blt _0226576A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022657A8: .word NNS_GfdDefaultFuncFreeTexVram
_022657AC: .word 0x00010640
_022657B0: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end ov49_02265760

	thumb_func_start ov49_022657B4
ov49_022657B4: ; 0x022657B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0
	ldr r4, _02265840 ; =ov49_0226A70C
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
_022657C4:
	ldr r0, _02265844 ; =0x0001081C
	mov r6, #0
	add r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, _02265848 ; =0x000106DC
	add r0, r5, r0
	str r0, [sp, #0x18]
	ldr r0, _0226584C ; =0x00010550
	add r0, r5, r0
	str r0, [sp, #0x1c]
_022657D8:
	add r7, r4, r6
	ldrb r1, [r7, #2]
	cmp r1, #0x11
	beq _0226582A
	mov r0, #0x14
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02265848 ; =0x000106DC
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0226582A
	ldrb r0, [r4, #1]
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02265850 ; =0x00010640
	ldr r0, [r1, r0]
	bl NNS_G3dGetTex
	ldrb r1, [r4]
	lsl r1, r1, #4
	add r2, r5, r1
	ldr r1, _02265854 ; =0x0001055C
	str r0, [r2, r1]
	ldrb r3, [r7, #2]
	ldr r0, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, r3, #0
	str r0, [sp, #4]
	mov r0, #0x14
	mul r1, r0
	ldr r0, [sp, #0x18]
	add r3, #0xb7
	add r0, r0, r1
	ldrb r1, [r4]
	lsl r2, r1, #4
	ldr r1, [sp, #0x1c]
	add r1, r1, r2
	ldr r2, [sp, #8]
	bl sub_020180BC
_0226582A:
	add r6, r6, #1
	cmp r6, #2
	blt _022657D8
	ldr r0, [sp, #0x10]
	add r4, r4, #4
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0x27
	blt _022657C4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02265840: .word ov49_0226A70C
_02265844: .word 0x0001081C
_02265848: .word 0x000106DC
_0226584C: .word 0x00010550
_02265850: .word 0x00010640
_02265854: .word 0x0001055C
	thumb_func_end ov49_022657B4

	thumb_func_start ov49_02265858
ov49_02265858: ; 0x02265858
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02265888 ; =0x000106DC
	mov r6, #0
	add r4, r5, r0
	ldr r0, _0226588C ; =0x0001081C
	add r7, r5, r0
_02265866:
	ldr r0, _02265888 ; =0x000106DC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0226587C
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020180F8
	ldr r0, _02265888 ; =0x000106DC
	mov r1, #0
	str r1, [r5, r0]
_0226587C:
	add r6, r6, #1
	add r5, #0x14
	add r4, #0x14
	cmp r6, #0x10
	blt _02265866
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02265888: .word 0x000106DC
_0226588C: .word 0x0001081C
	thumb_func_end ov49_02265858

	thumb_func_start ov49_02265890
ov49_02265890: ; 0x02265890
	push {r3, r4, r5, r6, r7, lr}
	add r7, r3, #0
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r7, #0x1b
	blo _022658A2
	bl GF_AssertFail
_022658A2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02265948
	str r6, [r4, #8]
	add r0, r6, #0
	mov r1, #5
	strb r7, [r4]
	bl ov49_02258E60
	add r0, #0x28
	str r0, [r4, #4]
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r3, r2, #2
	ldr r2, _022658DC ; =ov49_0226A5A4
	ldr r2, [r2, r3]
	blx r2
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r3, r2, #2
	ldr r2, _022658E0 ; =ov49_0226A610
	ldr r2, [r2, r3]
	bl ov49_02265668
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022658DC: .word ov49_0226A5A4
_022658E0: .word ov49_0226A610
	thumb_func_end ov49_02265890

	thumb_func_start ov49_022658E4
ov49_022658E4: ; 0x022658E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_02265958
	cmp r0, #0
	beq _02265918
	ldrb r0, [r4]
	cmp r0, #0x1b
	blo _022658FE
	bl GF_AssertFail
_022658FE:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r3, r2, #2
	ldr r2, _0226591C ; =ov49_0226A538
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #1
	bne _02265918
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02265948
_02265918:
	pop {r3, r4, r5, pc}
	nop
_0226591C: .word ov49_0226A538
	thumb_func_end ov49_022658E4

	thumb_func_start ov49_02265920
ov49_02265920: ; 0x02265920
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov49_02265958
	cmp r0, #0
	bne _02265934
	mov r0, #0
	pop {r3, r4, r5, pc}
_02265934:
	ldrb r0, [r4]
	cmp r0, #0x1b
	blo _0226593E
	bl GF_AssertFail
_0226593E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02266AF0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02265920

	thumb_func_start ov49_02265948
ov49_02265948: ; 0x02265948
	ldr r3, _02265954 ; =memset
	mov r2, #0xd1
	add r0, r1, #0
	mov r1, #0
	lsl r2, r2, #4
	bx r3
	.balign 4, 0
_02265954: .word memset
	thumb_func_end ov49_02265948

	thumb_func_start ov49_02265958
ov49_02265958: ; 0x02265958
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02265962
	mov r0, #1
	bx lr
_02265962:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02265958

	thumb_func_start ov49_02265968
ov49_02265968: ; 0x02265968
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _0226597C ; =0x0000087C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02265978
	mov r0, #1
	bx lr
_02265978:
	mov r0, #0
	bx lr
	.balign 4, 0
_0226597C: .word 0x0000087C
	thumb_func_end ov49_02265968

	thumb_func_start ov49_02265980
ov49_02265980: ; 0x02265980
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	str r0, [sp]
	add r5, r1, #0
	add r6, r3, #0
	cmp r4, #0x12
	blo _02265994
	bl GF_AssertFail
_02265994:
	ldr r0, _022659C8 ; =0x0000087C
	add r7, r5, r0
	lsl r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _022659A6
	bl GF_AssertFail
_022659A6:
	ldr r0, [sp, #4]
	ldr r2, _022659CC ; =0x00010550
	ldr r1, [sp]
	str r6, [r7, r0]
	add r2, r1, r2
	ldrb r1, [r6]
	mov r0, #0x78
	add r5, #0xc
	mul r0, r4
	lsl r1, r1, #4
	add r0, r5, r0
	add r1, r2, r1
	bl sub_020181B0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022659C8: .word 0x0000087C
_022659CC: .word 0x00010550
	thumb_func_end ov49_02265980

	thumb_func_start ov49_022659D0
ov49_022659D0: ; 0x022659D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r2, #0
	str r0, [sp]
	lsl r7, r5, #2
	add r0, r1, #0
	str r1, [sp, #4]
	add r1, r0, r7
	ldr r0, _02265B04 ; =0x0000087C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _022659EC
	bl GF_AssertFail
_022659EC:
	mov r0, #0x78
	add r6, r5, #0
	mul r6, r0
	ldr r0, [sp, #4]
	add r0, #0xc
	add r0, r0, r6
	bl sub_020182A4
	cmp r0, #0
	beq _02265AFE
	ldr r0, [sp, #4]
	add r1, r0, r7
	ldr r0, _02265B04 ; =0x0000087C
	ldr r2, [r1, r0]
	ldr r0, _02265B08 ; =0x00010550
	ldrb r3, [r2]
	ldr r1, [sp]
	add r1, r1, r0
	lsl r3, r3, #4
	add r1, r1, r3
	str r1, [sp, #0xc]
	ldrb r1, [r2, #1]
	add r0, #0xf0
	lsl r2, r1, #2
	ldr r1, [sp]
	add r1, r1, r2
	ldr r0, [r1, r0]
	bl NNS_G3dGetTex
	ldr r1, [sp, #0xc]
	mov r2, #0
	str r0, [r1, #0xc]
	add r0, r1, #0
	ldr r0, [r0, #8]
	ldr r1, [r1, #0xc]
	add r3, r2, #0
	bl NNS_G3dForceBindMdlTex
	cmp r0, #0
	bne _02265A40
	bl GF_AssertFail
_02265A40:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	mov r2, #0
	ldr r0, [r0, #8]
	ldr r1, [r1, #0xc]
	add r3, r2, #0
	bl NNS_G3dForceBindMdlPltt
	cmp r0, #0
	bne _02265A58
	bl GF_AssertFail
_02265A58:
	ldr r0, [sp, #4]
	lsl r1, r5, #3
	add r5, r0, r1
	add r0, r0, r7
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, _02265B0C ; =0x000106DC
	str r0, [sp, #0x10]
	add r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp]
	mov r4, #0
	add r7, r0, r1
_02265A72:
	ldr r1, [sp, #8]
	ldr r0, _02265B04 ; =0x0000087C
	ldr r0, [r1, r0]
	add r0, r0, r4
	ldrb r1, [r0, #2]
	cmp r1, #0x11
	beq _02265AA6
	mov r0, #0x14
	mul r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r0, r0, r6
	add r1, r7, r1
	bl sub_020181D4
	ldr r1, _02265B10 ; =0x000008C4
	ldr r0, [sp, #0x14]
	ldr r1, [r5, r1]
	add r0, r7, r0
	bl sub_02018198
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02265A72
_02265AA6:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldr r0, [r0, #8]
	ldr r1, [r1, #4]
	bl NNS_G3dMdlSetMdlPolygonIDAll
	ldr r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	add r0, r0, r6
	bl sub_020181EC
	ldr r1, _02265B0C ; =0x000106DC
	ldr r0, [sp]
	ldr r7, _02265B04 ; =0x0000087C
	mov r4, #0
	add r5, r0, r1
_02265AC8:
	ldr r0, [sp, #8]
	ldr r0, [r0, r7]
	add r0, r0, r4
	ldrb r1, [r0, #2]
	cmp r1, #0x11
	beq _02265AE8
	ldr r0, [sp, #4]
	mov r2, #0x14
	mul r2, r1
	add r0, r0, r6
	add r1, r5, r2
	bl sub_020181E0
	add r4, r4, #1
	cmp r4, #2
	blt _02265AC8
_02265AE8:
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #8]
	bl NNS_G3dReleaseMdlTex
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #8]
	bl NNS_G3dReleaseMdlPltt
	ldr r0, [sp, #0xc]
	mov r1, #0
	str r1, [r0, #0xc]
_02265AFE:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02265B04: .word 0x0000087C
_02265B08: .word 0x00010550
_02265B0C: .word 0x000106DC
_02265B10: .word 0x000008C4
	thumb_func_end ov49_022659D0

	thumb_func_start ov49_02265B14
ov49_02265B14: ; 0x02265B14
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #2
	lsl r4, r4, #0xc
	str r4, [sp]
	bl ov49_02265B3C
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02265B14

	thumb_func_start ov49_02265B28
ov49_02265B28: ; 0x02265B28
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #2
	lsl r4, r4, #0xc
	str r4, [sp]
	bl ov49_02265B94
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02265B28

	thumb_func_start ov49_02265B3C
ov49_02265B3C: ; 0x02265B3C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, _02265B88 ; =0x000106DC
	add r6, r2, #0
	add r0, r0, r1
	lsl r1, r6, #2
	add r2, r4, r1
	ldr r1, _02265B8C ; =0x0000087C
	add r5, r3, #0
	ldr r1, [r2, r1]
	add r1, r1, r5
	ldrb r2, [r1, #2]
	mov r1, #0x14
	mul r1, r2
	add r0, r0, r1
	bl sub_020181A4
	add r1, r0, #0
	ldr r0, _02265B90 ; =0x000008C4
	lsl r2, r6, #3
	add r0, r4, r0
	add r4, r0, r2
	lsl r5, r5, #2
	ldr r2, [r4, r5]
	ldr r0, [sp, #0x10]
	add r0, r0, r2
	cmp r0, r1
	bge _02265B78
	str r0, [r4, r5]
	pop {r4, r5, r6, pc}
_02265B78:
	mov r0, #2
	lsl r0, r0, #0xc
	add r0, r2, r0
	bl _s32_div_f
	str r1, [r4, r5]
	pop {r4, r5, r6, pc}
	nop
_02265B88: .word 0x000106DC
_02265B8C: .word 0x0000087C
_02265B90: .word 0x000008C4
	thumb_func_end ov49_02265B3C

	thumb_func_start ov49_02265B94
ov49_02265B94: ; 0x02265B94
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, _02265BDC ; =0x000106DC
	add r4, r2, #0
	add r0, r0, r1
	lsl r1, r4, #2
	add r2, r5, r1
	ldr r1, _02265BE0 ; =0x0000087C
	add r6, r3, #0
	ldr r1, [r2, r1]
	add r1, r1, r6
	ldrb r2, [r1, #2]
	mov r1, #0x14
	mul r1, r2
	add r0, r0, r1
	bl sub_020181A4
	ldr r3, _02265BE4 ; =0x000008C4
	lsl r1, r4, #3
	add r2, r5, r3
	add r2, r2, r1
	lsl r1, r6, #2
	ldr r5, [sp, #0x10]
	ldr r4, [r2, r1]
	add r4, r5, r4
	cmp r4, r0
	bge _02265BD0
	str r4, [r2, r1]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02265BD0:
	sub r3, #0xc4
	sub r0, r0, r3
	str r0, [r2, r1]
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02265BDC: .word 0x000106DC
_02265BE0: .word 0x0000087C
_02265BE4: .word 0x000008C4
	thumb_func_end ov49_02265B94

	thumb_func_start ov49_02265BE8
ov49_02265BE8: ; 0x02265BE8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, _02265C34 ; =0x000106DC
	add r4, r2, #0
	add r0, r0, r1
	lsl r1, r4, #2
	add r2, r5, r1
	ldr r1, _02265C38 ; =0x0000087C
	add r6, r3, #0
	ldr r1, [r2, r1]
	add r1, r1, r6
	ldrb r2, [r1, #2]
	mov r1, #0x14
	mul r1, r2
	add r0, r0, r1
	bl sub_020181A4
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _02265C24
	mov r1, #2
	lsl r2, r4, #3
	lsl r1, r1, #0xa
	add r3, r5, r2
	lsl r2, r6, #2
	sub r0, r0, r1
	add r2, r3, r2
	add r1, #0xc4
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
_02265C24:
	lsl r0, r4, #3
	add r2, r5, r0
	lsl r0, r6, #2
	add r2, r2, r0
	ldr r0, _02265C3C ; =0x000008C4
	str r1, [r2, r0]
	pop {r4, r5, r6, pc}
	nop
_02265C34: .word 0x000106DC
_02265C38: .word 0x0000087C
_02265C3C: .word 0x000008C4
	thumb_func_end ov49_02265BE8

	thumb_func_start ov49_02265C40
ov49_02265C40: ; 0x02265C40
	push {r4, lr}
	lsl r2, r2, #2
	add r2, r1, r2
	ldr r1, _02265C60 ; =0x0000087C
	ldr r4, _02265C64 ; =0x000106DC
	ldr r1, [r2, r1]
	add r0, r0, r4
	add r1, r1, r3
	ldrb r2, [r1, #2]
	mov r1, #0x14
	mul r1, r2
	add r0, r0, r1
	bl sub_020181A0
	pop {r4, pc}
	nop
_02265C60: .word 0x0000087C
_02265C64: .word 0x000106DC
	thumb_func_end ov49_02265C40

	thumb_func_start ov49_02265C68
ov49_02265C68: ; 0x02265C68
	ldr r3, _02265C70 ; =ov49_02267A84
	mov r2, #1
	bx r3
	nop
_02265C70: .word ov49_02267A84
	thumb_func_end ov49_02265C68

	thumb_func_start ov49_02265C74
ov49_02265C74: ; 0x02265C74
	ldr r3, _02265C7C ; =ov49_02267A84
	mov r2, #2
	bx r3
	nop
_02265C7C: .word ov49_02267A84
	thumb_func_end ov49_02265C74

	thumb_func_start ov49_02265C80
ov49_02265C80: ; 0x02265C80
	ldr r3, _02265C88 ; =ov49_02267A84
	mov r2, #3
	bx r3
	nop
_02265C88: .word ov49_02267A84
	thumb_func_end ov49_02265C80

	thumb_func_start ov49_02265C8C
ov49_02265C8C: ; 0x02265C8C
	ldr r3, _02265C94 ; =ov49_02267C20
	mov r2, #1
	bx r3
	nop
_02265C94: .word ov49_02267C20
	thumb_func_end ov49_02265C8C

	thumb_func_start ov49_02265C98
ov49_02265C98: ; 0x02265C98
	ldr r3, _02265CA0 ; =ov49_02267C20
	mov r2, #2
	bx r3
	nop
_02265CA0: .word ov49_02267C20
	thumb_func_end ov49_02265C98

	thumb_func_start ov49_02265CA4
ov49_02265CA4: ; 0x02265CA4
	ldr r3, _02265CAC ; =ov49_02267C20
	mov r2, #3
	bx r3
	nop
_02265CAC: .word ov49_02267C20
	thumb_func_end ov49_02265CA4

	thumb_func_start ov49_02265CB0
ov49_02265CB0: ; 0x02265CB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	add r5, r7, #0
	str r0, [sp]
	mov r4, #0
	add r5, #0xc
_02265CBE:
	add r3, r4, #3
	lsl r6, r3, #2
	ldr r3, _02265D08 ; =ov49_0226A70C
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	ldr r0, [r7, #8]
	add r1, sp, #4
	bl ov49_02259154
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	add r2, r1, r0
	ldr r1, [sp, #4]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	str r2, [sp, #8]
	bl sub_020182A8
	add r0, r5, #0
	mov r1, #0
	bl sub_020182A0
	add r4, r4, #1
	add r5, #0x78
	cmp r4, #3
	blt _02265CBE
	ldr r0, _02265D0C ; =0x00000954
	mov r1, #0xff
	str r1, [r7, r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02265D08: .word ov49_0226A70C
_02265D0C: .word 0x00000954
	thumb_func_end ov49_02265CB0

	thumb_func_start ov49_02265D10
ov49_02265D10: ; 0x02265D10
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02265E40 ; =ov49_0226A730
	mov r2, #1
	add r5, r0, #0
	add r4, r1, #0
	bl ov49_02265980
	ldr r3, _02265E44 ; =ov49_0226A73C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_02265980
	add r0, r4, #0
	add r0, #0x84
	mov r1, #0
	bl sub_020182A0
	ldr r0, [r4, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	mov r2, #1
	ldr r0, [sp, #0x10]
	lsl r2, r2, #0x10
	add r0, r0, r2
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	lsr r0, r2, #1
	add r0, r1, r0
	add r5, sp, #0xc
	str r0, [sp, #0xc]
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #8
	str r0, [r3]
	ldr r0, [sp, #4]
	add r0, r0, r2
	str r0, [sp, #4]
	ldr r0, _02265E48 ; =0x00000958
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	mov r1, #6
	bl ov49_02258E60
	cmp r0, #3
	bhi _02265E20
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02265D80: ; jump table
	.short _02265D88 - _02265D80 - 2 ; case 0
	.short _02265DA8 - _02265D80 - 2 ; case 1
	.short _02265DCA - _02265D80 - 2 ; case 2
	.short _02265DF6 - _02265D80 - 2 ; case 3
_02265D88:
	mov r0, #7
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xe
	sub r1, r1, r0
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	lsr r0, r0, #1
	sub r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02265E4C ; =0x0000BFFF
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	b _02265E20
_02265DA8:
	mov r0, #6
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x14]
	mov r0, #0xb
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02265E50 ; =0x00003FFF
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	b _02265E20
_02265DCA:
	mov r0, #0x17
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #7
	ldr r1, [sp]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp]
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	mov r1, #0
	mov r2, #1
	bl sub_020182E0
	b _02265E20
_02265DF6:
	mov r0, #0x17
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #7
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
	mov r1, #2
	ldr r0, [sp, #8]
	lsl r1, r1, #0xe
	add r0, r0, r1
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	sub r1, r1, #1
	mov r2, #1
	bl sub_020182E0
_02265E20:
	add r0, r4, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0x84
	bl sub_020182A8
	add r4, #0xc
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl sub_020182A8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02265E40: .word ov49_0226A730
_02265E44: .word ov49_0226A73C
_02265E48: .word 0x00000958
_02265E4C: .word 0x0000BFFF
_02265E50: .word 0x00003FFF
	thumb_func_end ov49_02265D10

	thumb_func_start ov49_02265E54
ov49_02265E54: ; 0x02265E54
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02266058 ; =ov49_0226A730
	mov r2, #1
	add r5, r0, #0
	add r4, r1, #0
	bl ov49_02265980
	ldr r3, _0226605C ; =ov49_0226A73C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_02265980
	ldr r3, _02266060 ; =ov49_0226A734
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov49_02265980
	add r0, r4, #0
	add r0, #0x84
	mov r1, #0
	bl sub_020182A0
	ldr r0, [r4, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	mov r2, #1
	ldr r0, [sp, #0x10]
	lsl r2, r2, #0x10
	add r0, r0, r2
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	lsr r0, r2, #1
	add r0, r1, r0
	add r5, sp, #0xc
	str r0, [sp, #0xc]
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #8
	str r0, [r3]
	ldr r0, [sp, #4]
	add r0, r0, r2
	str r0, [sp, #4]
	ldr r0, _02266064 ; =0x00000958
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	mov r1, #6
	bl ov49_02258E60
	cmp r0, #3
	bls _02265ECA
	b _02266046
_02265ECA:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02265ED6: ; jump table
	.short _02265EDE - _02265ED6 - 2 ; case 0
	.short _02265F32 - _02265ED6 - 2 ; case 1
	.short _02265F88 - _02265ED6 - 2 ; case 2
	.short _02265FE8 - _02265ED6 - 2 ; case 3
_02265EDE:
	mov r0, #7
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xe
	sub r1, r1, r0
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	lsr r0, r0, #1
	sub r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266068 ; =0x0000A38D
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _0226606C ; =0x0000DC70
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0x84
	bl sub_020182A8
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	sub r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0xfc
	bl sub_020182A8
	b _02266046
_02265F32:
	mov r0, #6
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x14]
	mov r0, #0xb
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266070 ; =0x0000238E
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _02266074 ; =0x00005C71
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	sub r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0x84
	bl sub_020182A8
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0xfc
	bl sub_020182A8
	b _02266046
_02265F88:
	mov r0, #0x17
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #7
	ldr r1, [sp]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp]
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266078 ; =0x0000E38F
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _0226607C ; =0x00001C71
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0x84
	sub r3, r5, r3
	bl sub_020182A8
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xfc
	add r3, r5, r3
	bl sub_020182A8
	b _02266046
_02265FE8:
	mov r0, #0x17
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #7
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266080 ; =0x0000638D
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _02266084 ; =0x00009C71
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0x84
	add r3, r5, r3
	bl sub_020182A8
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xfc
	sub r3, r5, r3
	bl sub_020182A8
_02266046:
	add r4, #0xc
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl sub_020182A8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02266058: .word ov49_0226A730
_0226605C: .word ov49_0226A73C
_02266060: .word ov49_0226A734
_02266064: .word 0x00000958
_02266068: .word 0x0000A38D
_0226606C: .word 0x0000DC70
_02266070: .word 0x0000238E
_02266074: .word 0x00005C71
_02266078: .word 0x0000E38F
_0226607C: .word 0x00001C71
_02266080: .word 0x0000638D
_02266084: .word 0x00009C71
	thumb_func_end ov49_02265E54

	thumb_func_start ov49_02266088
ov49_02266088: ; 0x02266088
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02266314 ; =ov49_0226A730
	mov r2, #1
	add r5, r0, #0
	add r4, r1, #0
	bl ov49_02265980
	ldr r3, _02266318 ; =ov49_0226A73C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_02265980
	ldr r3, _0226631C ; =ov49_0226A734
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov49_02265980
	ldr r3, _02266320 ; =ov49_0226A738
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #3
	bl ov49_02265980
	add r0, r4, #0
	add r0, #0x84
	mov r1, #0
	bl sub_020182A0
	ldr r1, _02266324 ; =0x00000958
	mov r2, #8
	str r2, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	add r1, #8
	str r2, [r4, r1]
	ldr r0, [r4, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	mov r2, #1
	ldr r0, [sp, #0x10]
	lsl r2, r2, #0x10
	add r0, r0, r2
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	lsr r0, r2, #1
	add r0, r1, r0
	add r5, sp, #0xc
	str r0, [sp, #0xc]
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	ldr r0, [sp, #4]
	add r0, r0, r2
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	bl ov49_02258E60
	cmp r0, #3
	bls _0226610E
	b _02266302
_0226610E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226611A: ; jump table
	.short _02266122 - _0226611A - 2 ; case 0
	.short _02266194 - _0226611A - 2 ; case 1
	.short _02266208 - _0226611A - 2 ; case 2
	.short _02266286 - _0226611A - 2 ; case 3
_02266122:
	mov r0, #7
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xe
	sub r1, r1, r0
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	lsr r0, r0, #1
	sub r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266328 ; =0x0000A38D
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _0226632C ; =0x0000DC70
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, _02266330 ; =0x0000BFFF
	add r0, r4, r0
	mov r2, #1
	bl sub_020182E0
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0x84
	bl sub_020182A8
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	sub r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0xfc
	bl sub_020182A8
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r4, r0
	bl sub_020182A8
	b _02266302
_02266194:
	mov r0, #6
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x14]
	mov r0, #0xb
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266334 ; =0x0000238E
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _02266338 ; =0x00005C71
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, _0226633C ; =0x00003FFF
	add r0, r4, r0
	mov r2, #1
	bl sub_020182E0
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	sub r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0x84
	bl sub_020182A8
	mov r1, #2
	add r0, r4, #0
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0xe
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, #0xfc
	bl sub_020182A8
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r4, r0
	bl sub_020182A8
	b _02266302
_02266208:
	mov r0, #0x17
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #7
	ldr r1, [sp]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp]
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266340 ; =0x0000E38F
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _02266344 ; =0x00001C71
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #1
	bl sub_020182E0
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0x84
	sub r3, r5, r3
	bl sub_020182A8
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xfc
	add r3, r5, r3
	bl sub_020182A8
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r4, r0
	bl sub_020182A8
	b _02266302
_02266286:
	mov r0, #0x17
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #7
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, _02266348 ; =0x0000638D
	add r0, #0x84
	mov r2, #1
	bl sub_020182E0
	add r0, r4, #0
	ldr r1, _0226634C ; =0x00009C71
	add r0, #0xfc
	mov r2, #1
	bl sub_020182E0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, _02266350 ; =0x00007FFF
	add r0, r4, r0
	mov r2, #1
	bl sub_020182E0
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0x84
	add r3, r5, r3
	bl sub_020182A8
	mov r3, #2
	add r0, r4, #0
	ldr r5, [sp, #0x14]
	lsl r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xfc
	sub r3, r5, r3
	bl sub_020182A8
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r4, r0
	bl sub_020182A8
_02266302:
	add r4, #0xc
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl sub_020182A8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02266314: .word ov49_0226A730
_02266318: .word ov49_0226A73C
_0226631C: .word ov49_0226A734
_02266320: .word ov49_0226A738
_02266324: .word 0x00000958
_02266328: .word 0x0000A38D
_0226632C: .word 0x0000DC70
_02266330: .word 0x0000BFFF
_02266334: .word 0x0000238E
_02266338: .word 0x00005C71
_0226633C: .word 0x00003FFF
_02266340: .word 0x0000E38F
_02266344: .word 0x00001C71
_02266348: .word 0x0000638D
_0226634C: .word 0x00009C71
_02266350: .word 0x00007FFF
	thumb_func_end ov49_02266088

	thumb_func_start ov49_02266354
ov49_02266354: ; 0x02266354
	ldr r3, _0226635C ; =ov49_02266B28
	mov r2, #1
	bx r3
	nop
_0226635C: .word ov49_02266B28
	thumb_func_end ov49_02266354

	thumb_func_start ov49_02266360
ov49_02266360: ; 0x02266360
	ldr r3, _02266368 ; =ov49_02266B28
	mov r2, #2
	bx r3
	nop
_02266368: .word ov49_02266B28
	thumb_func_end ov49_02266360

	thumb_func_start ov49_0226636C
ov49_0226636C: ; 0x0226636C
	ldr r3, _02266374 ; =ov49_02266B28
	mov r2, #3
	bx r3
	nop
_02266374: .word ov49_02266B28
	thumb_func_end ov49_0226636C

	thumb_func_start ov49_02266378
ov49_02266378: ; 0x02266378
	ldr r3, _02266380 ; =ov49_02267908
	mov r2, #1
	bx r3
	nop
_02266380: .word ov49_02267908
	thumb_func_end ov49_02266378

	thumb_func_start ov49_02266384
ov49_02266384: ; 0x02266384
	ldr r3, _0226638C ; =ov49_02267908
	mov r2, #2
	bx r3
	nop
_0226638C: .word ov49_02267908
	thumb_func_end ov49_02266384

	thumb_func_start ov49_02266390
ov49_02266390: ; 0x02266390
	ldr r3, _02266398 ; =ov49_02267908
	mov r2, #4
	bx r3
	nop
_02266398: .word ov49_02267908
	thumb_func_end ov49_02266390

	thumb_func_start ov49_0226639C
ov49_0226639C: ; 0x0226639C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _022663DC ; =ov49_0226A7A8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_022663A8:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _022663E0 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _022663A8
	mov r0, #0
	str r0, [sp]
	ldr r0, _022663E4 ; =0x00000954
	ldr r1, _022663E8 ; =ov49_0226A454
	add r0, r7, r0
	mov r2, #2
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022663DC: .word ov49_0226A7A8
_022663E0: .word ov49_0226A70C
_022663E4: .word 0x00000954
_022663E8: .word ov49_0226A454
	thumb_func_end ov49_0226639C

	thumb_func_start ov49_022663EC
ov49_022663EC: ; 0x022663EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226642C ; =ov49_0226A7B8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_022663F8:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _02266430 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _022663F8
	mov r0, #0
	str r0, [sp]
	ldr r0, _02266434 ; =0x00000954
	ldr r1, _02266438 ; =ov49_0226A46C
	add r0, r7, r0
	mov r2, #2
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226642C: .word ov49_0226A7B8
_02266430: .word ov49_0226A70C
_02266434: .word 0x00000954
_02266438: .word ov49_0226A46C
	thumb_func_end ov49_022663EC

	thumb_func_start ov49_0226643C
ov49_0226643C: ; 0x0226643C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226647C ; =ov49_0226A7C8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_02266448:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _02266480 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _02266448
	mov r0, #0
	str r0, [sp]
	ldr r0, _02266484 ; =0x00000954
	ldr r1, _02266488 ; =ov49_0226A4B4
	add r0, r7, r0
	mov r2, #3
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226647C: .word ov49_0226A7C8
_02266480: .word ov49_0226A70C
_02266484: .word 0x00000954
_02266488: .word ov49_0226A4B4
	thumb_func_end ov49_0226643C

	thumb_func_start ov49_0226648C
ov49_0226648C: ; 0x0226648C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _022664CC ; =ov49_0226A7A8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_02266498:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _022664D0 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _02266498
	mov r0, #1
	str r0, [sp]
	ldr r0, _022664D4 ; =0x00000954
	ldr r1, _022664D8 ; =ov49_0226A464
	add r0, r7, r0
	mov r2, #2
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022664CC: .word ov49_0226A7A8
_022664D0: .word ov49_0226A70C
_022664D4: .word 0x00000954
_022664D8: .word ov49_0226A464
	thumb_func_end ov49_0226648C

	thumb_func_start ov49_022664DC
ov49_022664DC: ; 0x022664DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226651C ; =ov49_0226A7B8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_022664E8:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _02266520 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _022664E8
	mov r0, #1
	str r0, [sp]
	ldr r0, _02266524 ; =0x00000954
	ldr r1, _02266528 ; =ov49_0226A49C
	add r0, r7, r0
	mov r2, #3
	mov r3, #0x29
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226651C: .word ov49_0226A7B8
_02266520: .word ov49_0226A70C
_02266524: .word 0x00000954
_02266528: .word ov49_0226A49C
	thumb_func_end ov49_022664DC

	thumb_func_start ov49_0226652C
ov49_0226652C: ; 0x0226652C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226656C ; =ov49_0226A7C8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_02266538:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _02266570 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _02266538
	mov r0, #1
	str r0, [sp]
	ldr r0, _02266574 ; =0x00000954
	ldr r1, _02266578 ; =ov49_0226A4C0
	add r0, r7, r0
	mov r2, #3
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226656C: .word ov49_0226A7C8
_02266570: .word ov49_0226A70C
_02266574: .word 0x00000954
_02266578: .word ov49_0226A4C0
	thumb_func_end ov49_0226652C

	thumb_func_start ov49_0226657C
ov49_0226657C: ; 0x0226657C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _022665C0 ; =ov49_0226A7A8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_02266588:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _022665C4 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _02266588
	ldr r0, _022665C8 ; =0x00000954
	mov r2, #2
	str r2, [sp]
	ldr r1, _022665CC ; =ov49_0226A47C
	add r0, r7, r0
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	ldr r0, [sp, #8]
	add r1, r7, #0
	bl ov49_02267C8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022665C0: .word ov49_0226A7A8
_022665C4: .word ov49_0226A70C
_022665C8: .word 0x00000954
_022665CC: .word ov49_0226A47C
	thumb_func_end ov49_0226657C

	thumb_func_start ov49_022665D0
ov49_022665D0: ; 0x022665D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _02266614 ; =ov49_0226A7B8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_022665DC:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _02266618 ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _022665DC
	ldr r0, _0226661C ; =0x00000954
	mov r2, #2
	str r2, [sp]
	ldr r1, _02266620 ; =ov49_0226A45C
	add r0, r7, r0
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	ldr r0, [sp, #8]
	add r1, r7, #0
	bl ov49_02267C8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02266614: .word ov49_0226A7B8
_02266618: .word ov49_0226A70C
_0226661C: .word 0x00000954
_02266620: .word ov49_0226A45C
	thumb_func_end ov49_022665D0

	thumb_func_start ov49_02266624
ov49_02266624: ; 0x02266624
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _02266668 ; =ov49_0226A7C8
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
_02266630:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _0226666C ; =ov49_0226A70C
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _02266630
	ldr r0, _02266670 ; =0x00000954
	mov r2, #2
	str r2, [sp]
	ldr r1, _02266674 ; =ov49_0226A474
	add r0, r7, r0
	mov r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	ldr r0, [sp, #8]
	add r1, r7, #0
	bl ov49_02267C8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02266668: .word ov49_0226A7C8
_0226666C: .word ov49_0226A70C
_02266670: .word 0x00000954
_02266674: .word ov49_0226A474
	thumb_func_end ov49_02266624

	thumb_func_start ov49_02266678
ov49_02266678: ; 0x02266678
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	add r5, r1, #0
	mov r0, #2
	ldrsh r0, [r5, r0]
	add r0, r0, #1
	cmp r0, #0x36
	bgt _0226668C
	strh r0, [r5, #2]
_0226668C:
	mov r0, #2
	ldrsh r1, [r5, r0]
	mov r0, #6
	mul r0, r1
	mov r1, #0x36
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, _02266740 ; =0x00000955
	ldrsb r4, [r5, r0]
	cmp r4, r6
	bhs _022666CA
	add r7, r5, #0
	add r7, #0xc
_022666A8:
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	ldr r0, _02266744 ; =0x00000954
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bhs _022666C4
	mov r0, #0x78
	mul r0, r1
	add r0, r7, r0
	mov r1, #1
	bl sub_020182A0
_022666C4:
	add r4, r4, #1
	cmp r4, r6
	blo _022666A8
_022666CA:
	ldr r1, _02266740 ; =0x00000955
	mov r0, #1
	str r0, [sp, #8]
	strb r6, [r5, r1]
	sub r0, r1, #1
	ldrsb r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	ble _02266724
	add r7, r5, #0
	add r7, #0xc
	add r6, r7, #0
_022666E2:
	add r0, r7, #0
	bl sub_020182A4
	cmp r0, #1
	bne _02266716
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov49_02265B28
	str r0, [sp, #8]
	cmp r0, #0
	beq _02266716
	add r0, r6, #0
	mov r1, #0
	bl sub_020182A0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov49_02265BE8
_02266716:
	ldr r0, _02266744 ; =0x00000954
	add r4, r4, #1
	ldrsb r0, [r5, r0]
	add r7, #0x78
	add r6, #0x78
	cmp r4, r0
	blt _022666E2
_02266724:
	ldr r0, _02266740 ; =0x00000955
	ldrsb r0, [r5, r0]
	cmp r0, #6
	blt _02266738
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02266738
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02266738:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02266740: .word 0x00000955
_02266744: .word 0x00000954
	thumb_func_end ov49_02266678

	thumb_func_start ov49_02266748
ov49_02266748: ; 0x02266748
	ldr r3, _02266750 ; =ov49_02267AF0
	mov r2, #0
	bx r3
	nop
_02266750: .word ov49_02267AF0
	thumb_func_end ov49_02266748

	thumb_func_start ov49_02266754
ov49_02266754: ; 0x02266754
	ldr r3, _0226675C ; =ov49_02267AF0
	mov r2, #1
	bx r3
	nop
_0226675C: .word ov49_02267AF0
	thumb_func_end ov49_02266754

	thumb_func_start ov49_02266760
ov49_02266760: ; 0x02266760
	ldr r3, _02266768 ; =ov49_02267AF0
	mov r2, #2
	bx r3
	nop
_02266768: .word ov49_02267AF0
	thumb_func_end ov49_02266760

	thumb_func_start ov49_0226676C
ov49_0226676C: ; 0x0226676C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #2
	ldrsh r1, [r5, r0]
	lsl r0, r1, #1
	add r1, r1, r0
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r4, r0, #5
	ldr r0, _02266818 ; =0x00000954
	ldrsh r1, [r5, r0]
	cmp r4, r1
	beq _022667BA
	strh r4, [r5, r0]
	add r0, r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, r4
	bls _022667BA
	cmp r4, #0
	beq _022667AA
	add r2, r5, #0
	sub r1, r4, #1
	mov r0, #0x78
	mul r0, r1
	add r2, #0xc
	add r0, r2, r0
	mov r1, #0
	bl sub_020182A0
_022667AA:
	add r1, r5, #0
	mov r0, #0x78
	add r1, #0xc
	mul r0, r4
	add r0, r1, r0
	mov r1, #1
	bl sub_020182A0
_022667BA:
	mov r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, #0x20
	bge _022667C6
	add r0, r0, #1
	strh r0, [r5, #2]
_022667C6:
	ldr r0, _0226681C ; =0x00000956
	mov r4, #0
	ldrsh r0, [r5, r0]
	str r4, [sp]
	cmp r0, #0
	ble _02266812
	add r6, r5, #0
	add r6, #0xc
_022667D6:
	add r0, r6, #0
	bl sub_020182A4
	cmp r0, #0
	beq _02266806
	ldr r0, _0226681C ; =0x00000956
	ldrsh r0, [r5, r0]
	sub r0, r0, #1
	cmp r4, r0
	bne _022667FA
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov49_02265B28
	str r0, [sp]
	b _02266806
_022667FA:
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov49_02265B14
_02266806:
	ldr r0, _0226681C ; =0x00000956
	add r4, r4, #1
	ldrsh r0, [r5, r0]
	add r6, #0x78
	cmp r4, r0
	blt _022667D6
_02266812:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266818: .word 0x00000954
_0226681C: .word 0x00000956
	thumb_func_end ov49_0226676C

	thumb_func_start ov49_02266820
ov49_02266820: ; 0x02266820
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r0, _02266968 ; =0x0000087C
	add r5, r1, #0
	ldr r0, [r5, r0]
	ldrb r0, [r0, #2]
	cmp r0, #0x11
	bne _02266836
	bl GF_AssertFail
_02266836:
	ldr r0, _0226696C ; =0x00000954
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0226684E
	sub r1, r1, #1
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	bl sub_020182A0
	b _022668AA
_0226684E:
	mov r0, #2
	ldrsh r1, [r5, r0]
	cmp r1, #3
	bge _022668AA
	add r0, r5, #0
	add r1, r1, #1
	bl ov49_02265968
	cmp r0, #1
	bne _022668AA
	add r0, r5, #0
	add r0, #0xc
	mov r1, #1
	bl sub_020182A0
	mov r2, #0
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r3, r2, #0
	bl ov49_02265B28
	cmp r0, #1
	bne _022668AA
	mov r1, #2
	ldrsh r0, [r5, r1]
	mov r2, #3
	add r0, r0, #1
	strh r0, [r5, #2]
	ldr r0, _0226696C ; =0x00000954
	str r2, [r5, r0]
	ldrsh r0, [r5, r1]
	cmp r0, #3
	bge _022668A0
	mov r2, #0
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r3, r2, #0
	str r2, [sp]
	bl ov49_02265BE8
	b _022668AA
_022668A0:
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	bl sub_020182A0
_022668AA:
	add r7, r5, #0
	mov r4, #1
	add r7, #0xc
	str r4, [sp, #8]
	add r7, #0x78
	add r6, r5, #4
_022668B6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02265968
	cmp r0, #1
	bne _02266956
	mov r0, #2
	ldrsh r1, [r5, r0]
	sub r0, r4, #1
	cmp r1, r0
	ble _02266952
	add r0, r7, #0
	mov r1, #1
	bl sub_020182A0
	mov r0, #0xa
	lsl r0, r0, #0xa
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov49_02265B94
	cmp r0, #0
	bne _022668F0
	mov r0, #0
	str r0, [sp, #8]
	b _02266956
_022668F0:
	sub r0, r4, #1
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02266970 ; =0x00000958
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0226691E
	add r0, r7, #0
	mov r1, #0
	bl sub_020182A0
	ldr r0, _02266968 ; =0x0000087C
	ldr r0, [r6, r0]
	ldrb r0, [r0]
	lsl r1, r0, #4
	ldr r0, [sp, #4]
	add r1, r0, r1
	ldr r0, _02266974 ; =0x00010558
	ldr r0, [r1, r0]
	mov r1, #0x1f
	bl NNS_G3dMdlSetMdlAlphaAll
	b _02266956
_0226691E:
	ldr r0, _02266970 ; =0x00000958
	ldr r0, [r1, r0]
	sub r2, r0, #1
	ldr r0, _02266970 ; =0x00000958
	str r2, [r1, r0]
	sub r0, #0xdc
	ldr r0, [r6, r0]
	ldrb r0, [r0]
	lsl r2, r0, #4
	ldr r0, [sp, #4]
	add r2, r0, r2
	ldr r0, _02266974 ; =0x00010558
	ldr r0, [r2, r0]
	ldr r2, _02266970 ; =0x00000958
	ldr r1, [r1, r2]
	mov r2, #0x14
	mul r2, r1
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	asr r1, r1, #3
	bl NNS_G3dMdlSetMdlAlphaAll
	mov r0, #0
	str r0, [sp, #8]
	b _02266956
_02266952:
	mov r0, #0
	str r0, [sp, #8]
_02266956:
	add r4, r4, #1
	add r7, #0x78
	add r6, r6, #4
	cmp r4, #3
	ble _022668B6
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02266968: .word 0x0000087C
_0226696C: .word 0x00000954
_02266970: .word 0x00000958
_02266974: .word 0x00010558
	thumb_func_end ov49_02266820

	thumb_func_start ov49_02266978
ov49_02266978: ; 0x02266978
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r2, [r4, #1]
	add r5, r0, #0
	cmp r2, #0
	beq _0226698A
	cmp r2, #1
	beq _022669A0
	b _022669AC
_0226698A:
	bl ov49_02266D60
	cmp r0, #0
	beq _022669AC
	mov r0, #1
	strb r0, [r4, #1]
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02266EF8
	b _022669AC
_022669A0:
	bl ov49_022670B8
	cmp r0, #0
	beq _022669AC
	mov r0, #1
	pop {r3, r4, r5, pc}
_022669AC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02266978

	thumb_func_start ov49_022669B0
ov49_022669B0: ; 0x022669B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, _02266A7C ; =0x00000955
	str r0, [sp]
	add r0, r1, #1
	ldrsb r2, [r5, r1]
	ldrb r0, [r5, r0]
	cmp r2, r0
	bge _02266A1C
	sub r0, r1, #1
	ldrsb r0, [r5, r0]
	add r2, r0, #1
	sub r0, r1, #1
	strb r2, [r5, r0]
	ldrsb r0, [r5, r0]
	cmp r0, #8
	blt _022669E0
	mov r2, #0
	sub r0, r1, #1
	strb r2, [r5, r0]
	ldrsb r0, [r5, r1]
	add r0, r0, #1
	strb r0, [r5, r1]
_022669E0:
	ldr r0, _02266A80 ; =0x00000954
	ldrsb r1, [r5, r0]
	lsl r2, r1, #2
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	asr r2, r1, #3
	add r1, r0, #1
	ldrsb r1, [r5, r1]
	add r0, r0, #3
	ldrb r6, [r5, r0]
	lsl r1, r1, #2
	add r7, r2, r1
	cmp r6, r7
	bhs _02266A18
	add r1, r5, #0
	mov r0, #0x78
	add r1, #0xc
	mul r0, r6
	add r4, r1, r0
_02266A08:
	add r0, r4, #0
	mov r1, #1
	bl sub_020182A0
	add r6, r6, #1
	add r4, #0x78
	cmp r6, r7
	blo _02266A08
_02266A18:
	ldr r0, _02266A84 ; =0x00000957
	strb r7, [r5, r0]
_02266A1C:
	ldr r0, _02266A84 ; =0x00000957
	mov r4, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _02266A5C
	add r7, r5, #0
	add r7, #0xc
	add r6, r7, #0
_02266A2C:
	add r0, r7, #0
	bl sub_020182A4
	cmp r0, #1
	bne _02266A4E
	ldr r0, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl ov49_02267A1C
	str r0, [sp, #4]
	cmp r0, #1
	bne _02266A4E
	add r0, r6, #0
	mov r1, #0
	bl sub_020182A0
_02266A4E:
	ldr r0, _02266A84 ; =0x00000957
	add r4, r4, #1
	ldrb r0, [r5, r0]
	add r7, #0x78
	add r6, #0x78
	cmp r4, r0
	blt _02266A2C
_02266A5C:
	ldr r0, _02266A7C ; =0x00000955
	ldrsb r1, [r5, r0]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r1, r0
	bne _02266A74
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02266A74
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02266A74:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266A7C: .word 0x00000955
_02266A80: .word 0x00000954
_02266A84: .word 0x00000957
	thumb_func_end ov49_022669B0

	thumb_func_start ov49_02266A88
ov49_02266A88: ; 0x02266A88
	push {r4, lr}
	add r4, r1, #0
	mov r1, #2
	ldr r0, _02266AAC ; =0x00000954
	ldrsh r1, [r4, r1]
	add r0, r4, r0
	bl ov49_02267E18
	mov r1, #2
	ldrsh r1, [r4, r1]
	add r1, r1, #1
	strh r1, [r4, #2]
	cmp r0, #2
	bne _02266AA8
	mov r0, #1
	pop {r4, pc}
_02266AA8:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02266AAC: .word 0x00000954
	thumb_func_end ov49_02266A88

	thumb_func_start ov49_02266AB0
ov49_02266AB0: ; 0x02266AB0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #2
	add r6, r0, #0
	ldr r0, _02266AEC ; =0x00000954
	ldrsh r1, [r5, r1]
	add r0, r5, r0
	bl ov49_02267E18
	add r4, r0, #0
	mov r0, #2
	ldrsh r0, [r5, r0]
	add r0, r0, #1
	strh r0, [r5, #2]
	cmp r4, #1
	bne _02266AD8
	add r0, r6, #0
	add r1, r5, #0
	bl ov49_02267D00
_02266AD8:
	add r0, r6, #0
	add r1, r5, #0
	bl ov49_02267D34
	cmp r4, #2
	bne _02266AE8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02266AE8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02266AEC: .word 0x00000954
	thumb_func_end ov49_02266AB0

	thumb_func_start ov49_02266AF0
ov49_02266AF0: ; 0x02266AF0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #8]
	bl ov49_02258F70
	cmp r0, #1
	bne _02266B04
	mov r0, #0
	pop {r4, r5, r6, pc}
_02266B04:
	mov r4, #0
_02266B06:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02265968
	cmp r0, #1
	bne _02266B1C
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov49_022659D0
_02266B1C:
	add r4, r4, #1
	cmp r4, #0x12
	blt _02266B06
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov49_02266AF0

	thumb_func_start ov49_02266B28
ov49_02266B28: ; 0x02266B28
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	bl ov49_02258DAC
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _02266B44
	ldr r0, [r5, #8]
	bl ov49_0225CC44
_02266B44:
	ldr r0, [r4, #8]
	bl ov49_02258E34
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	ldrsh r1, [r2, r1]
	ldr r0, [r5, #0xc]
	asr r3, r1, #3
	lsr r3, r3, #0x1c
	add r3, r1, r3
	lsl r1, r3, #0xc
	mov r3, #6
	ldrsh r2, [r2, r3]
	lsr r1, r1, #0x10
	asr r3, r2, #3
	lsr r3, r3, #0x1c
	add r3, r2, r3
	lsl r2, r3, #0xc
	lsr r2, r2, #0x10
	bl ov49_022589C4
	cmp r0, #0x2a
	bne _02266B84
	mov r1, #1
	b _02266B86
_02266B84:
	mov r1, #0
_02266B86:
	ldr r0, _02266C58 ; =0x00000965
	cmp r6, #1
	strb r1, [r4, r0]
	beq _02266B96
	cmp r6, #2
	beq _02266BB0
	cmp r6, #3
	b _02266BE2
_02266B96:
	ldr r3, _02266C5C ; =ov49_0226A74C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_02265980
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov49_0226786C
	b _02266C2A
_02266BB0:
	ldr r3, _02266C5C ; =ov49_0226A74C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_02265980
	ldr r3, _02266C60 ; =ov49_0226A750
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov49_02265980
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	mov r3, #2
	bl ov49_0226786C
	mov r2, #1
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov49_0226786C
	b _02266C2A
_02266BE2:
	ldr r3, _02266C5C ; =ov49_0226A74C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov49_02265980
	ldr r3, _02266C60 ; =ov49_0226A750
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov49_02265980
	ldr r3, _02266C64 ; =ov49_0226A754
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov49_02265980
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov49_0226786C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	mov r3, #2
	bl ov49_0226786C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	mov r3, #1
	bl ov49_0226786C
_02266C2A:
	ldr r0, _02266C68 ; =0x00000955
	mov r1, #0
	strb r6, [r4, r0]
	ldr r0, [r4, #8]
	bl ov49_02259130
	ldr r0, _02266C58 ; =0x00000965
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _02266C4A
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02266C6C
	add sp, #8
	pop {r4, r5, r6, pc}
_02266C4A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02266D04
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02266C58: .word 0x00000965
_02266C5C: .word ov49_0226A74C
_02266C60: .word ov49_0226A750
_02266C64: .word ov49_0226A754
_02266C68: .word 0x00000955
	thumb_func_end ov49_02266B28

	thumb_func_start ov49_02266C6C
ov49_02266C6C: ; 0x02266C6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r1, #0
	ldr r0, [r5, #8]
	add r1, sp, #0x10
	bl ov49_02259154
	ldr r0, _02266CEC ; =0x00000955
	ldrsb r0, [r5, r0]
	sub r1, r0, #1
	ldr r0, _02266CF0 ; =ov49_0226A450
	ldrb r0, [r0, r1]
	cmp r0, #0
	beq _02266C9A
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02266CA8
_02266C9A:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02266CA8:
	ldr r6, [sp, #0x14]
	ldr r4, [sp, #0x18]
	ldr r7, [sp, #0x10]
	bl _ffix
	add r0, r6, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r0, #0x6c
	str r0, [sp, #0xc]
	ldr r0, _02266CF4 ; =0x00000A04
	add r1, r7, #0
	add r0, r5, r0
	add r2, r7, #0
	add r3, r6, #0
	bl ov49_0226540C
	ldr r0, _02266CF8 ; =0x00000A2C
	mov r3, #2
	ldr r2, _02266CFC ; =0x0000071C
	add r0, r5, r0
	mov r1, #0
	lsl r3, r3, #0xe
	bl ov49_022655F4
	add r0, r5, #0
	bl ov49_0226747C
	ldr r0, _02266D00 ; =0x00000956
	mov r1, #0
	strh r1, [r5, r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02266CEC: .word 0x00000955
_02266CF0: .word ov49_0226A450
_02266CF4: .word 0x00000A04
_02266CF8: .word 0x00000A2C
_02266CFC: .word 0x0000071C
_02266D00: .word 0x00000956
	thumb_func_end ov49_02266C6C

	thumb_func_start ov49_02266D04
ov49_02266D04: ; 0x02266D04
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r1, #0
	ldr r0, [r4, #8]
	add r1, sp, #0x10
	bl ov49_02259154
	mov r0, #2
	ldr r3, [sp, #0x14]
	lsl r0, r0, #0xc
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x10]
	add r0, r3, r0
	str r0, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _02266D50 ; =0x00000A04
	add r2, r1, #0
	add r0, r4, r0
	bl ov49_0226540C
	ldr r0, _02266D54 ; =0x00000A2C
	mov r1, #0
	ldr r2, _02266D58 ; =0x0000071C
	add r0, r4, r0
	add r3, r1, #0
	bl ov49_022655F4
	add r0, r4, #0
	bl ov49_02267674
	ldr r0, _02266D5C ; =0x00000956
	mov r1, #0
	strh r1, [r4, r0]
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_02266D50: .word 0x00000A04
_02266D54: .word 0x00000A2C
_02266D58: .word 0x0000071C
_02266D5C: .word 0x00000956
	thumb_func_end ov49_02266D04

	thumb_func_start ov49_02266D60
ov49_02266D60: ; 0x02266D60
	push {r3, lr}
	ldr r2, _02266D78 ; =0x00000965
	ldrb r2, [r1, r2]
	cmp r2, #0
	bne _02266D70
	bl ov49_02266D7C
	pop {r3, pc}
_02266D70:
	bl ov49_02266E78
	pop {r3, pc}
	nop
_02266D78: .word 0x00000965
	thumb_func_end ov49_02266D60

	thumb_func_start ov49_02266D7C
ov49_02266D7C: ; 0x02266D7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	ldr r1, _02266E64 ; =0x00000A04
	add r6, r0, #0
	add r0, r5, r1
	sub r1, #0xae
	ldrsh r1, [r5, r1]
	bl ov49_02265434
	str r0, [sp]
	ldr r0, _02266E68 ; =0x00000A2C
	add r0, r5, r0
	bl ov49_02265628
	ldr r0, _02266E6C ; =0x00000956
	ldrsh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, r0]
	ldr r0, [r5, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	ldr r0, _02266E64 ; =0x00000A04
	add r1, sp, #0xc
	add r0, r5, r0
	add r2, sp, #0x10
	add r3, sp, #0x14
	bl ov49_022655E0
	ldr r0, _02266E68 ; =0x00000A2C
	add r1, sp, #8
	add r0, r5, r0
	bl ov49_02265660
	ldr r0, [sp]
	cmp r0, #0
	bne _02266DD0
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #0xc]
_02266DD0:
	ldr r0, [r5, #8]
	add r1, sp, #0xc
	bl ov49_02259148
	add r0, r5, #0
	bl ov49_0226747C
	ldr r0, _02266E70 ; =0x00000955
	mov r4, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _02266DFC
	ldr r7, _02266E70 ; =0x00000955
_02266DEA:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov49_0226789C
	ldrsb r0, [r5, r7]
	add r4, r4, #1
	cmp r4, r0
	blt _02266DEA
_02266DFC:
	ldr r0, [r6, #4]
	ldr r7, [r5, #8]
	bl ov49_02258DAC
	cmp r7, r0
	bne _02266E5E
	ldr r0, _02266E74 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	mov r4, #4
	tst r1, r0
	beq _02266E16
	mov r4, #0
_02266E16:
	mov r1, #0x80
	tst r1, r0
	beq _02266E1E
	mov r4, #1
_02266E1E:
	mov r1, #0x10
	tst r1, r0
	beq _02266E26
	mov r4, #3
_02266E26:
	mov r1, #0x20
	tst r0, r1
	beq _02266E2E
	mov r4, #2
_02266E2E:
	cmp r4, #4
	beq _02266E5E
	add r0, r7, #0
	add r1, r4, #0
	bl ov49_02259160
	ldr r0, [r5, #8]
	bl ov49_02258E34
	add r1, sp, #4
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r5, #8]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	add r2, r4, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258E04
_02266E5E:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02266E64: .word 0x00000A04
_02266E68: .word 0x00000A2C
_02266E6C: .word 0x00000956
_02266E70: .word 0x00000955
_02266E74: .word gSystem
	thumb_func_end ov49_02266D7C

	thumb_func_start ov49_02266E78
ov49_02266E78: ; 0x02266E78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, _02266EE8 ; =0x00000A04
	add r6, r0, #0
	add r0, r5, r1
	sub r1, #0xae
	ldrsh r1, [r5, r1]
	bl ov49_02265434
	str r0, [sp]
	ldr r0, _02266EEC ; =0x00000A2C
	add r0, r5, r0
	bl ov49_02265628
	ldr r0, _02266EF0 ; =0x00000956
	ldrsh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, r0]
	ldr r0, [r5, #8]
	add r1, sp, #4
	bl ov49_02259154
	ldr r0, _02266EE8 ; =0x00000A04
	add r1, sp, #4
	add r0, r5, r0
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov49_022655E0
	ldr r0, [r5, #8]
	add r1, sp, #4
	bl ov49_02259148
	add r0, r5, #0
	bl ov49_02267674
	ldr r0, _02266EF4 ; =0x00000955
	mov r4, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _02266EE0
	ldr r7, _02266EF4 ; =0x00000955
_02266ECE:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov49_0226789C
	ldrsb r0, [r5, r7]
	add r4, r4, #1
	cmp r4, r0
	blt _02266ECE
_02266EE0:
	ldr r0, [sp]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266EE8: .word 0x00000A04
_02266EEC: .word 0x00000A2C
_02266EF0: .word 0x00000956
_02266EF4: .word 0x00000955
	thumb_func_end ov49_02266E78

	thumb_func_start ov49_02266EF8
ov49_02266EF8: ; 0x02266EF8
	push {r3, lr}
	ldr r2, _02266F10 ; =0x00000965
	ldrb r2, [r1, r2]
	cmp r2, #0
	bne _02266F08
	bl ov49_02266F14
	pop {r3, pc}
_02266F08:
	bl ov49_02267074
	pop {r3, pc}
	nop
_02266F10: .word 0x00000965
	thumb_func_end ov49_02266EF8

	thumb_func_start ov49_02266F14
ov49_02266F14: ; 0x02266F14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r1, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	add r1, sp, #0x24
	bl ov49_02259154
	ldr r0, _0226705C ; =0x00000955
	ldrsb r0, [r5, r0]
	sub r1, r0, #1
	ldr r0, _02267060 ; =ov49_0226A450
	ldrb r0, [r0, r1]
	cmp r0, #0
	beq _02266F44
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02266F52
_02266F44:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02266F52:
	ldr r6, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r7, [sp, #0x24]
	bl _ffix
	sub r0, r6, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	ldr r0, _02267064 ; =0x00000A04
	add r1, r7, #0
	add r0, r5, r0
	add r2, r7, #0
	add r3, r6, #0
	bl ov49_0226540C
	ldr r1, _02267068 ; =0x00000956
	mov r4, #0
	strh r4, [r5, r1]
	sub r0, r1, #2
	strb r4, [r5, r0]
	sub r0, r1, #1
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _02267052
	add r0, r5, #0
	str r0, [sp, #0x14]
	add r0, #0xc
	str r0, [sp, #0x14]
	add r0, r1, #0
	add r0, #0x36
	add r1, #0x12
	add r7, r5, r0
	add r6, r5, r1
_02266F9A:
	ldr r0, [sp, #0x14]
	add r1, sp, #0x24
	add r2, sp, #0x28
	add r3, sp, #0x2c
	bl sub_020182B0
	mov r0, #0x96
	add r1, r5, r4
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02266FBC
	cmp r0, #1
	beq _02266FD6
	cmp r0, #2
	beq _02266FF0
	b _02267008
_02266FBC:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [sp, #0x20]
	mov r0, #1
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x1c]
	mov r0, #1
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #0x12
	sub r0, r1, r0
	str r0, [sp, #0x18]
	b _02267008
_02266FD6:
	mov r0, #1
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x20]
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	b _02267008
_02266FF0:
	mov r0, #1
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0x12
	sub r0, r1, r0
	str r0, [sp, #0x20]
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
_02267008:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0x1a
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	add r0, r7, #0
	bl ov49_0226540C
	mov r3, #6
	ldr r2, _0226706C ; =0x00000AAA
	add r0, r6, #0
	mov r1, #0
	lsl r3, r3, #0xc
	bl ov49_022655F4
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #3
	bl ov49_0226786C
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	add r0, #0x78
	str r0, [sp, #0x14]
	ldr r0, _0226705C ; =0x00000955
	add r7, #0x28
	ldrsb r0, [r5, r0]
	add r6, #0xc
	cmp r4, r0
	blt _02266F9A
_02267052:
	ldr r0, _02267070 ; =0x00000964
	mov r1, #0
	strb r1, [r5, r0]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226705C: .word 0x00000955
_02267060: .word ov49_0226A450
_02267064: .word 0x00000A04
_02267068: .word 0x00000956
_0226706C: .word 0x00000AAA
_02267070: .word 0x00000964
	thumb_func_end ov49_02266F14

	thumb_func_start ov49_02267074
ov49_02267074: ; 0x02267074
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r1, #0
	ldr r0, [r4, #8]
	add r1, sp, #0x10
	bl ov49_02259154
	mov r0, #2
	ldr r3, [sp, #0x14]
	lsl r0, r0, #0xc
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x10]
	sub r0, r3, r0
	str r0, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _022670B0 ; =0x00000A04
	add r2, r1, #0
	add r0, r4, r0
	bl ov49_0226540C
	ldr r0, _022670B4 ; =0x00000956
	mov r1, #0
	strh r1, [r4, r0]
	sub r0, r0, #2
	strb r1, [r4, r0]
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_022670B0: .word 0x00000A04
_022670B4: .word 0x00000956
	thumb_func_end ov49_02267074

	thumb_func_start ov49_022670B8
ov49_022670B8: ; 0x022670B8
	push {r3, lr}
	ldr r2, _022670D0 ; =0x00000965
	ldrb r2, [r1, r2]
	cmp r2, #0
	bne _022670C8
	bl ov49_022670D4
	pop {r3, pc}
_022670C8:
	bl ov49_02267328
	pop {r3, pc}
	nop
_022670D0: .word 0x00000965
	thumb_func_end ov49_022670B8

	thumb_func_start ov49_022670D4
ov49_022670D4: ; 0x022670D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r1, #0
	ldr r1, _02267300 ; =0x00000954
	add r6, r0, #0
	ldrsb r0, [r4, r1]
	cmp r0, #4
	bhi _0226710A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022670F0: ; jump table
	.short _022670FA - _022670F0 - 2 ; case 0
	.short _02267112 - _022670F0 - 2 ; case 1
	.short _02267128 - _022670F0 - 2 ; case 2
	.short _0226715E - _022670F0 - 2 ; case 3
	.short _022671B6 - _022670F0 - 2 ; case 4
_022670FA:
	add r0, r1, #2
	ldrsh r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #8
	bge _0226710C
_0226710A:
	b _02267230
_0226710C:
	mov r0, #1
	strb r0, [r4, r1]
	b _02267230
_02267112:
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov49_0225919C
	ldr r0, _02267304 ; =0x00000956
	mov r1, #0x10
	strh r1, [r4, r0]
	mov r1, #2
	sub r0, r0, #2
	strb r1, [r4, r0]
	b _02267230
_02267128:
	add r0, r1, #2
	ldrsh r0, [r4, r0]
	sub r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02267230
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov49_0225919C
	ldr r0, _02267300 ; =0x00000954
	mov r1, #3
	strb r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	mov r1, #6
	bl ov49_02258E60
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov49_02259160
	b _02267230
_0226715E:
	add r0, r1, #0
	add r1, r1, #2
	add r0, #0xb0
	ldrsh r1, [r4, r1]
	add r0, r4, r0
	bl ov49_02265434
	add r5, r0, #0
	ldr r0, _02267304 ; =0x00000956
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	add r1, sp, #0x30
	bl ov49_02259154
	ldr r0, _02267308 ; =0x00000A04
	add r1, sp, #0x30
	add r0, r4, r0
	add r2, sp, #0x34
	add r3, sp, #0x38
	bl ov49_022655E0
	ldr r0, [r4, #8]
	add r1, sp, #0x30
	bl ov49_02259148
	cmp r5, #1
	bne _02267230
	ldr r0, _02267300 ; =0x00000954
	mov r1, #4
	strb r1, [r4, r0]
	add r1, r0, #2
	mov r2, #0
	strh r2, [r4, r1]
	ldr r1, [sp, #0x34]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r2, _0226730C ; =0x000005C2
	add r0, r6, #0
	add r1, r4, #0
	bl ov49_02265668
	b _02267230
_022671B6:
	add r0, r1, #2
	ldrsh r1, [r4, r0]
	ldr r0, _02267310 ; =0x00007FFF
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02267314 ; =FX_SinCosTable_
	ldrsh r2, [r0, r1]
	asr r0, r2, #0x1f
	lsr r1, r2, #0x11
	lsl r0, r0, #0xf
	orr r0, r1
	mov r1, #2
	lsl r3, r2, #0xf
	mov r2, #0
	lsl r1, r1, #0xa
	add r1, r3, r1
	adc r0, r2
	lsr r5, r1, #0xc
	lsl r0, r0, #0x14
	orr r5, r0
	ldr r0, [r4, #8]
	add r1, sp, #0x24
	bl ov49_02259154
	ldr r0, _02267318 ; =0x00000958
	add r1, sp, #0x24
	ldr r0, [r4, r0]
	add r0, r0, r5
	str r0, [sp, #0x28]
	ldr r0, [r4, #8]
	bl ov49_02259148
	ldr r0, _02267304 ; =0x00000956
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	cmp r1, #0xa
	ble _0226722E
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov49_02259130
	ldr r0, [r6, #4]
	ldr r4, [r4, #8]
	bl ov49_02258DAC
	cmp r4, r0
	bne _02267228
	ldr r0, [r6, #8]
	add r1, r4, #0
	bl ov49_0225CC40
_02267228:
	add sp, #0x3c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0226722E:
	strh r1, [r4, r0]
_02267230:
	ldr r1, _0226731C ; =0x00000964
	mov r5, #0
	ldrb r0, [r4, r1]
	add r0, r0, #1
	strb r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0xf
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _022672F8
	add r0, r1, #0
	add r0, #0x28
	add r7, r4, r0
	add r0, r1, #4
	add r0, r4, r0
	str r0, [sp, #0x10]
	add r0, r4, #0
	str r0, [sp, #0xc]
	add r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	str r7, [sp, #8]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp]
_02267262:
	ldr r1, _0226731C ; =0x00000964
	add r0, r7, #0
	ldrb r1, [r4, r1]
	bl ov49_02265434
	cmp r0, #0
	bne _022672AA
	ldr r0, [sp, #0x10]
	bl ov49_02265628
	ldr r0, [sp, #0xc]
	add r1, sp, #0x18
	add r2, sp, #0x1c
	add r3, sp, #0x20
	bl sub_020182B0
	ldr r0, [sp, #8]
	add r1, sp, #0x18
	add r2, sp, #0x1c
	add r3, sp, #0x20
	bl ov49_022655E0
	ldr r0, [sp, #4]
	add r1, sp, #0x14
	bl ov49_02265660
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x1c]
	add r1, r1, r0
	ldr r0, [sp]
	ldr r3, [sp, #0x20]
	str r1, [sp, #0x18]
	bl sub_020182A8
	b _022672C4
_022672AA:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	mov r3, #4
	bl ov49_0226786C
	cmp r0, #1
	bne _022672C4
	ldr r2, _02267320 ; =0x000005A8
	add r0, r6, #0
	add r1, r4, #0
	bl ov49_02265668
_022672C4:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov49_0226789C
	ldr r0, [sp, #0x10]
	add r5, r5, #1
	add r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r7, #0x28
	add r0, #0x78
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, #0x28
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, #0x78
	str r0, [sp]
	ldr r0, _02267324 ; =0x00000955
	ldrsb r0, [r4, r0]
	cmp r5, r0
	blt _02267262
_022672F8:
	mov r0, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_02267300: .word 0x00000954
_02267304: .word 0x00000956
_02267308: .word 0x00000A04
_0226730C: .word 0x000005C2
_02267310: .word 0x00007FFF
_02267314: .word FX_SinCosTable_
_02267318: .word 0x00000958
_0226731C: .word 0x00000964
_02267320: .word 0x000005A8
_02267324: .word 0x00000955
	thumb_func_end ov49_022670D4

	thumb_func_start ov49_02267328
ov49_02267328: ; 0x02267328
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, _02267464 ; =0x00000955
	add r4, r1, #0
	ldrsb r0, [r4, r0]
	mov r5, #0
	cmp r0, #0
	ble _0226734E
	ldr r7, _02267464 ; =0x00000955
_0226733C:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov49_0226789C
	ldrsb r0, [r4, r7]
	add r5, r5, #1
	cmp r5, r0
	blt _0226733C
_0226734E:
	ldr r1, _02267468 ; =0x00000954
	ldrsb r0, [r4, r1]
	cmp r0, #3
	bls _02267358
	b _0226745C
_02267358:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02267364: ; jump table
	.short _0226736C - _02267364 - 2 ; case 0
	.short _0226739E - _02267364 - 2 ; case 1
	.short _022673B4 - _02267364 - 2 ; case 2
	.short _022673EA - _02267364 - 2 ; case 3
_0226736C:
	ldr r2, _0226746C ; =0x000005A8
	add r0, r6, #0
	add r1, r4, #0
	bl ov49_02265668
	ldr r0, _02267464 ; =0x00000955
	mov r5, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02267396
	ldr r7, _02267464 ; =0x00000955
_02267382:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	mov r3, #4
	bl ov49_0226786C
	ldrsb r0, [r4, r7]
	add r5, r5, #1
	cmp r5, r0
	blt _02267382
_02267396:
	ldr r0, _02267468 ; =0x00000954
	mov r1, #1
	strb r1, [r4, r0]
	b _0226745C
_0226739E:
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov49_0225919C
	ldr r0, _02267470 ; =0x00000956
	mov r1, #8
	strh r1, [r4, r0]
	mov r1, #2
	sub r0, r0, #2
	strb r1, [r4, r0]
	b _0226745C
_022673B4:
	add r0, r1, #2
	ldrsh r0, [r4, r0]
	sub r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _0226745C
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov49_0225919C
	ldr r0, _02267468 ; =0x00000954
	mov r1, #3
	strb r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	mov r1, #6
	bl ov49_02258E60
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov49_02259160
	b _0226745C
_022673EA:
	add r0, r1, #0
	add r1, r1, #2
	add r0, #0xb0
	ldrsh r1, [r4, r1]
	add r0, r4, r0
	bl ov49_02265434
	add r5, r0, #0
	ldr r0, _02267470 ; =0x00000956
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, _02267474 ; =0x00000A04
	add r1, sp, #0
	add r0, r4, r0
	add r2, sp, #4
	add r3, sp, #8
	bl ov49_022655E0
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl ov49_02259148
	cmp r5, #1
	bne _0226745C
	ldr r0, _02267470 ; =0x00000956
	mov r1, #0
	strh r1, [r4, r0]
	ldr r1, [sp, #4]
	add r0, r0, #2
	str r1, [r4, r0]
	ldr r2, _02267478 ; =0x000005C2
	add r0, r6, #0
	add r1, r4, #0
	bl ov49_02265668
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov49_02259130
	ldr r0, [r6, #4]
	ldr r4, [r4, #8]
	bl ov49_02258DAC
	cmp r4, r0
	bne _02267456
	ldr r0, [r6, #8]
	add r1, r4, #0
	bl ov49_0225CC40
_02267456:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0226745C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02267464: .word 0x00000955
_02267468: .word 0x00000954
_0226746C: .word 0x000005A8
_02267470: .word 0x00000956
_02267474: .word 0x00000A04
_02267478: .word 0x000005C2
	thumb_func_end ov49_02267328

	thumb_func_start ov49_0226747C
ov49_0226747C: ; 0x0226747C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, _02267670 ; =0x00000955
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _0226749A
	cmp r0, #2
	beq _022674EA
	cmp r0, #3
	b _02267586
_0226749A:
	mov r0, #0xf
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r3, r0, #0
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #1
	add r5, #0xc
	ldr r4, [sp, #8]
	lsl r3, r3, #0xc
	add r0, r5, #0
	add r3, r4, r3
	bl sub_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_022674EA:
	mov r0, #0xe
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #1
	add r0, r5, #0
	ldr r4, [sp, #8]
	lsl r3, r3, #0xc
	add r0, #0xc
	add r3, r4, r3
	bl sub_020182A8
	mov r0, #0xe
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #0xe
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r3, r0, #0
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #1
	add r5, #0x84
	ldr r4, [sp, #8]
	lsl r3, r3, #0xc
	add r0, r5, #0
	add r3, r4, r3
	bl sub_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02267586:
	mov r0, #0xf
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #1
	add r0, r5, #0
	ldr r4, [sp, #8]
	lsl r3, r3, #0xc
	add r0, #0xc
	add r3, r4, r3
	bl sub_020182A8
	mov r0, #0xe
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #1
	add r0, r5, #0
	ldr r4, [sp, #8]
	lsl r3, r3, #0xc
	add r0, #0x84
	add r3, r4, r3
	bl sub_020182A8
	mov r0, #0xe
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #0xe
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r3, r0, #0
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #1
	add r5, #0xfc
	ldr r4, [sp, #8]
	lsl r3, r3, #0xc
	add r0, r5, #0
	add r3, r4, r3
	bl sub_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02267670: .word 0x00000955
	thumb_func_end ov49_0226747C

	thumb_func_start ov49_02267674
ov49_02267674: ; 0x02267674
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, _02267868 ; =0x00000955
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _02267692
	cmp r0, #2
	beq _022676E2
	cmp r0, #3
	b _0226777E
_02267692:
	mov r0, #3
	lsl r0, r0, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r3, r0, #0
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #2
	add r5, #0xc
	ldr r4, [sp, #8]
	lsl r3, r3, #0xe
	add r0, r5, #0
	sub r3, r4, r3
	bl sub_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_022676E2:
	mov r0, #0xb
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #2
	add r0, r5, #0
	ldr r4, [sp, #8]
	lsl r3, r3, #0xe
	add r0, #0xc
	sub r3, r4, r3
	bl sub_020182A8
	mov r0, #0xb
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #0xe
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r3, r0, #0
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #2
	add r5, #0x84
	ldr r4, [sp, #8]
	lsl r3, r3, #0xe
	add r0, r5, #0
	sub r3, r4, r3
	bl sub_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0226777E:
	mov r0, #3
	lsl r0, r0, #0x10
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #2
	add r0, r5, #0
	ldr r4, [sp, #8]
	lsl r3, r3, #0xe
	add r0, #0xc
	sub r3, r4, r3
	bl sub_020182A8
	mov r0, #0xb
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #2
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #2
	add r0, r5, #0
	ldr r4, [sp, #8]
	lsl r3, r3, #0xe
	add r0, #0x84
	sub r3, r4, r3
	bl sub_020182A8
	mov r0, #0xb
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	add r6, r0, #0
	mov r0, #0xe
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	add r4, r0, #0
	add r0, r6, #0
	bl _ffix
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r3, r0, #0
	add r1, r1, r4
	add r2, r2, r3
	mov r3, #2
	add r5, #0xfc
	ldr r4, [sp, #8]
	lsl r3, r3, #0xe
	add r0, r5, #0
	sub r3, r4, r3
	bl sub_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02267868: .word 0x00000955
	thumb_func_end ov49_02267674

	thumb_func_start ov49_0226786C
ov49_0226786C: ; 0x0226786C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r6, #0x96
	lsl r6, r6, #4
	add r5, r1, r6
	add r4, r3, #0
	ldrb r3, [r5, r2]
	cmp r4, r3
	beq _02267896
	strb r4, [r5, r2]
	mov r3, #0
	add r5, r1, r2
	sub r6, r6, #4
	strb r3, [r5, r6]
	lsl r4, r4, #0xd
	str r4, [sp]
	bl ov49_02265BE8
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02267896:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov49_0226786C

	thumb_func_start ov49_0226789C
ov49_0226789C: ; 0x0226789C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r3, #0x96
	add r7, r1, #0
	add r5, r2, #0
	add r4, r7, r5
	lsl r3, r3, #4
	ldrb r6, [r4, r3]
	sub r3, r3, #4
	add r4, r7, r3
	ldrb r3, [r4, r5]
	str r0, [sp, #4]
	cmp r3, #0
	bne _022678FC
	mov r3, #0
	bl ov49_02265C40
	lsl r1, r6, #0xd
	str r0, [sp, #8]
	cmp r0, r1
	bne _022678D0
	mov r0, #1
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
	b _022678E8
_022678D0:
	cmp r6, #4
	beq _022678D8
	str r1, [sp, #8]
	b _022678E8
_022678D8:
	add r1, r7, #0
	mov r0, #0x78
	add r1, #0xc
	mul r0, r5
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
_022678E8:
	ldr r0, [sp, #8]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r2, r5, #0
	mov r3, #0
	bl ov49_02265BE8
	mov r0, #8
	strb r0, [r4, r5]
_022678FC:
	ldrb r0, [r4, r5]
	sub r0, r0, #1
	strb r0, [r4, r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_0226789C

	thumb_func_start ov49_02267908
ov49_02267908: ; 0x02267908
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r0, [sp, #0x10]
	add r0, r1, #0
	str r1, [sp, #0x14]
	ldr r0, [r0, #8]
	add r1, sp, #0x50
	str r2, [sp, #0x18]
	bl ov49_02259154
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bls _022679E6
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x1c]
_0226792A:
	ldr r1, [sp, #0x20]
	add r1, #0xd
	cmp r1, #0xf
	bls _02267934
	mov r1, #0xf
_02267934:
	ldr r0, _02267A04 ; =ov49_0226A4D8
	ldr r7, _02267A08 ; =ov49_0226A508
	str r0, [sp, #0x34]
	lsl r0, r1, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	ldr r1, _02267A0C ; =0x00000968
	str r0, [sp, #0x28]
	add r0, #0xc
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	mov r4, #0
	add r0, r0, r1
	str r0, [sp, #0x30]
_02267950:
	ldr r0, [sp, #0x1c]
	ldr r6, _02267A10 ; =ov49_0226A70C
	add r5, r4, r0
	ldr r3, [sp, #0x24]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, r5, #0
	add r3, r6, r3
	bl ov49_02265980
	ldr r1, [sp, #0x34]
	add r0, sp, #0x50
	add r2, sp, #0x44
	bl VEC_Add
	add r0, sp, #0x44
	add r1, r7, #0
	add r2, sp, #0x38
	bl VEC_Add
	mov r0, #0x78
	mul r0, r5
	ldr r1, [sp, #0x28]
	str r0, [sp, #0x2c]
	add r0, r1, r0
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	bl sub_020182A8
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	ldr r0, [sp, #0x14]
	mov r1, #0
	add r2, r0, r5
	ldr r0, _02267A14 ; =0x00000958
	strb r1, [r2, r0]
	ldr r0, [sp, #0x3c]
	add r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x28
	mul r1, r0
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x38]
	add r0, r0, r1
	ldr r1, [sp, #0x44]
	ldr r3, [sp, #0x48]
	bl ov49_0226540C
	ldr r0, [sp, #0x34]
	add r4, r4, #1
	add r0, #0xc
	add r7, #0xc
	str r0, [sp, #0x34]
	cmp r4, #4
	blt _02267950
	ldr r0, [sp, #0x1c]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x20]
	cmp r1, r0
	blo _0226792A
_022679E6:
	ldr r2, _02267A18 ; =0x00000956
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	sub r3, r2, #1
	strb r1, [r0, r2]
	ldr r1, [sp, #0x14]
	mov r0, #0
	strb r0, [r1, r3]
	sub r3, r2, #2
	strb r0, [r1, r3]
	add r2, r2, #1
	strb r0, [r1, r2]
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02267A04: .word ov49_0226A4D8
_02267A08: .word ov49_0226A508
_02267A0C: .word 0x00000968
_02267A10: .word ov49_0226A70C
_02267A14: .word 0x00000958
_02267A18: .word 0x00000956
	thumb_func_end ov49_02267908

	thumb_func_start ov49_02267A1C
ov49_02267A1C: ; 0x02267A1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r2, #0
	ldr r2, _02267A7C ; =0x00000958
	add r5, r1, #0
	add r1, r5, r2
	add r7, r0, #0
	ldrsb r0, [r1, r4]
	add r6, r4, #0
	add r2, #0x10
	add r0, r0, #1
	strb r0, [r1, r4]
	mov r0, #0x28
	mul r6, r0
	add r0, r5, r2
	ldrsb r1, [r1, r4]
	add r0, r0, r6
	bl ov49_02265434
	str r0, [sp]
	ldr r0, _02267A80 ; =0x00000968
	add r1, sp, #4
	add r0, r5, r0
	add r0, r0, r6
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov49_022655E0
	add r1, r5, #0
	mov r0, #0x78
	add r1, #0xc
	mul r0, r4
	add r0, r1, r0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl sub_020182A8
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov49_02265B14
	ldr r0, [sp]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02267A7C: .word 0x00000958
_02267A80: .word 0x00000968
	thumb_func_end ov49_02267A1C

	thumb_func_start ov49_02267A84
ov49_02267A84: ; 0x02267A84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r7, r1, #0
	mov r6, #0
	str r2, [sp, #4]
	add r0, r2, #0
	beq _02267ADE
	add r5, r7, #0
	ldr r4, _02267AE8 ; =ov49_0226A70C
	add r5, #0xc
_02267A9A:
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov49_02265980
	ldr r0, [r7, #8]
	add r1, sp, #8
	bl ov49_02259154
	mov r0, #2
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	add r2, r1, r0
	mov r0, #6
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0xc
	add r3, r1, r0
	ldr r1, [sp, #8]
	add r0, r5, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl sub_020182A8
	add r0, r5, #0
	mov r1, #0
	bl sub_020182A0
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x78
	cmp r6, r0
	blo _02267A9A
_02267ADE:
	ldr r1, _02267AEC ; =0x00000954
	ldr r0, [sp, #4]
	strb r0, [r7, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02267AE8: .word ov49_0226A70C
_02267AEC: .word 0x00000954
	thumb_func_end ov49_02267A84

	thumb_func_start ov49_02267AF0
ov49_02267AF0: ; 0x02267AF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #4]
	add r5, r1, #0
	mov r0, #2
	ldrsh r1, [r5, r0]
	mov r0, #0xc
	add r6, r2, #0
	mul r0, r1
	mov r1, #0x30
	bl _s32_div_f
	add r4, r0, #0
	ldr r0, _02267C14 ; =0x00000954
	ldr r1, [r5, r0]
	cmp r4, r1
	beq _02267BF4
	str r4, [r5, r0]
	cmp r4, #0
	beq _02267B42
	mov r0, #0x30
	add r2, r6, #0
	mul r2, r0
	ldr r0, _02267C18 ; =ov49_0226A678
	lsl r1, r4, #2
	add r0, r0, r2
	add r2, r1, r0
	ldrh r0, [r1, r0]
	add r1, sp, #8
	strh r0, [r1, #4]
	ldrh r0, [r2, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	add r0, r5, #0
	mov r1, #0x78
	add r0, #0xc
	mul r1, r2
	add r0, r0, r1
	mov r1, #0
	bl sub_020182A0
_02267B42:
	mov r0, #0x30
	add r2, r6, #0
	mul r2, r0
	ldr r0, _02267C1C ; =ov49_0226A67C
	lsl r1, r4, #2
	add r0, r0, r2
	add r2, r1, r0
	ldrh r1, [r1, r0]
	add r0, sp, #8
	strh r1, [r0]
	ldrh r4, [r2, #2]
	strh r4, [r0, #2]
	cmp r4, #0
	beq _02267BE2
	beq _02267B74
	lsl r7, r4, #0xc
	add r0, r7, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02267B84
_02267B74:
	lsl r7, r4, #0xc
	add r0, r7, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02267B84:
	add r1, sp, #8
	ldrh r6, [r1]
	bl _ffix
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov49_02265BE8
	cmp r4, #0
	beq _02267BB0
	add r0, r7, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02267BBE
_02267BB0:
	add r0, r7, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02267BBE:
	bl _ffix
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl ov49_02265BE8
	add r1, r5, #0
	mov r0, #0x78
	add r1, #0xc
	mul r0, r6
	add r0, r1, r0
	mov r1, #1
	bl sub_020182A0
	b _02267BF4
_02267BE2:
	ldrh r1, [r0]
	add r2, r5, #0
	mov r0, #0x78
	mul r0, r1
	add r2, #0xc
	add r0, r2, r0
	mov r1, #0
	bl sub_020182A0
_02267BF4:
	mov r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, #0x30
	bge _02267C00
	add r0, r0, #1
	strh r0, [r5, #2]
_02267C00:
	mov r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, #0x30
	blt _02267C0E
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02267C0E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02267C14: .word 0x00000954
_02267C18: .word ov49_0226A678
_02267C1C: .word ov49_0226A67C
	thumb_func_end ov49_02267AF0

	thumb_func_start ov49_02267C20
ov49_02267C20: ; 0x02267C20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r7, r1, #0
	mov r4, #0
	str r2, [sp, #4]
	add r0, r2, #0
	beq _02267C74
	add r5, r7, #0
	add r5, #0xc
_02267C34:
	add r3, r4, #6
	lsl r6, r3, #2
	ldr r3, _02267C84 ; =ov49_0226A70C
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r3, r6
	bl ov49_02265980
	ldr r0, [r7, #8]
	add r1, sp, #8
	bl ov49_02259154
	mov r0, #2
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	add r2, r1, r0
	ldr r1, [sp, #8]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	str r2, [sp, #0xc]
	bl sub_020182A8
	add r0, r5, #0
	mov r1, #0
	bl sub_020182A0
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r5, #0x78
	cmp r4, r0
	blo _02267C34
_02267C74:
	ldr r0, _02267C88 ; =0x00000954
	mov r1, #0xff
	strh r1, [r7, r0]
	add r1, r0, #2
	ldr r0, [sp, #4]
	strh r0, [r7, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02267C84: .word ov49_0226A70C
_02267C88: .word 0x00000954
	thumb_func_end ov49_02267C20

	thumb_func_start ov49_02267C8C
ov49_02267C8C: ; 0x02267C8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	ldr r0, [r1, #8]
	str r1, [sp, #4]
	add r1, sp, #8
	bl ov49_02259154
	mov r0, #0xa
	ldr r7, [sp, #4]
	mov r4, #0
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x10]
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0xe
	sub r1, r1, r0
	str r1, [sp, #8]
	ldr r1, [sp, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [sp, #0xc]
	add r5, r4, #0
	add r7, #0xc
_02267CC0:
	add r3, r4, #0
	add r3, #0x25
	lsl r6, r3, #2
	ldr r3, _02267CFC ; =ov49_0226A70C
	add r2, r4, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, #0x10
	add r3, r3, r6
	bl ov49_02265980
	add r1, r4, #0
	add r1, #0x10
	mov r0, #0x78
	mul r0, r1
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, r0
	add r1, r1, r5
	bl sub_020182A8
	mov r0, #6
	lsl r0, r0, #0xe
	add r4, r4, #1
	add r5, r5, r0
	cmp r4, #2
	blt _02267CC0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02267CFC: .word ov49_0226A70C
	thumb_func_end ov49_02267C8C

	thumb_func_start ov49_02267D00
ov49_02267D00: ; 0x02267D00
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02267D30 ; =0x00000D0C
	mov r2, #1
	strh r2, [r1, r0]
	add r4, r1, #0
	mov r5, #0
	add r0, r0, #2
	strh r5, [r1, r0]
	add r4, #0xc
	add r7, r2, #0
	mov r6, #0x78
_02267D16:
	add r0, r5, #0
	add r0, #0x10
	add r1, r0, #0
	mul r1, r6
	add r0, r4, r1
	add r1, r7, #0
	bl sub_020182A0
	add r5, r5, #1
	cmp r5, #2
	blt _02267D16
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02267D30: .word 0x00000D0C
	thumb_func_end ov49_02267D00

	thumb_func_start ov49_02267D34
ov49_02267D34: ; 0x02267D34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _02267D90 ; =0x00000D0C
	add r7, r0, #0
	ldrh r0, [r5, r1]
	cmp r0, #0
	beq _02267D8E
	add r0, r1, #2
	ldrh r0, [r5, r0]
	cmp r0, #0xd
	bhs _02267D56
	add r0, r1, #2
	ldrh r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r5, r0]
	b _02267D5A
_02267D56:
	mov r0, #0
	strh r0, [r5, r1]
_02267D5A:
	add r6, r5, #0
	mov r4, #0
	add r6, #0xc
_02267D60:
	ldr r0, _02267D94 ; =0x00000D0E
	ldrh r0, [r5, r0]
	cmp r0, #0xd
	bhs _02267D78
	add r2, r4, #0
	add r0, r7, #0
	add r1, r5, #0
	add r2, #0x10
	mov r3, #0
	bl ov49_02265B14
	b _02267D88
_02267D78:
	add r1, r4, #0
	add r1, #0x10
	mov r0, #0x78
	mul r0, r1
	add r0, r6, r0
	mov r1, #0
	bl sub_020182A0
_02267D88:
	add r4, r4, #1
	cmp r4, #2
	blt _02267D60
_02267D8E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02267D90: .word 0x00000D0C
_02267D94: .word 0x00000D0E
	thumb_func_end ov49_02267D34

	thumb_func_start ov49_02267D98
ov49_02267D98: ; 0x02267D98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [sp, #0x30]
	mov r7, #2
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	mov r6, #1
	str r0, [sp, #0x34]
	mov r0, #0x3b
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r1, r0, #4
	ldr r4, [sp, #0x34]
	strh r2, [r5, r1]
	add r0, r0, #6
	strh r3, [r5, r0]
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #3
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r4, #0xc
	str r0, [sp, #0xc]
_02267DC8:
	ldr r1, [sp, #0x10]
	mov r0, #0x78
	mul r0, r1
	add r0, r4, r0
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0xc]
	ldr r0, [r0, #8]
	mov r1, #0x78
	mul r1, r2
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	mov r2, #0x78
	mov r3, #0x78
	mul r2, r6
	mul r3, r7
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, r1
	add r2, r4, r2
	add r3, r4, r3
	bl ov49_02267EBC
	ldr r0, [sp, #0x10]
	add r7, r7, #4
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r6, r6, #4
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	add r5, #0xec
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02267DC8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02267D98

	thumb_func_start ov49_02267E18
ov49_02267E18: ; 0x02267E18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0xed
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	str r1, [sp]
	cmp r0, #0
	ble _02267E86
	ldr r4, [sp, #8]
	add r6, sp, #0x10
_02267E34:
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r0, r4
	ldrh r0, [r0, r4]
	strh r0, [r6]
	ldrh r0, [r1, #2]
	strh r0, [r6, #2]
	ldrh r1, [r6]
	ldr r0, [sp]
	cmp r1, r0
	bne _02267E72
	ldrb r7, [r6, #2]
	cmp r7, #4
	blo _02267E56
	bl GF_AssertFail
_02267E56:
	ldrb r0, [r6, #3]
	str r0, [sp, #4]
	cmp r0, #4
	bls _02267E62
	bl GF_AssertFail
_02267E62:
	mov r0, #0xec
	mul r0, r7
	ldr r1, [sp, #4]
	add r0, r5, r0
	bl ov49_02267EF8
	mov r0, #1
	str r0, [sp, #8]
_02267E72:
	ldr r0, [sp, #0xc]
	add r4, r4, #4
	add r0, r0, #1
	str r0, [sp, #0xc]
	mov r0, #0xed
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _02267E34
_02267E86:
	mov r7, #1
	mov r6, #0
	add r4, r5, #0
_02267E8C:
	add r0, r4, #0
	bl ov49_02267F40
	cmp r0, #0
	bne _02267E98
	mov r7, #0
_02267E98:
	add r6, r6, #1
	add r4, #0xec
	cmp r6, #4
	blt _02267E8C
	ldr r0, _02267EB8 ; =0x000003B6
	ldrh r1, [r5, r0]
	ldr r0, [sp]
	cmp r1, r0
	bhi _02267EB2
	cmp r7, #1
	bne _02267EB2
	mov r0, #2
	str r0, [sp, #8]
_02267EB2:
	ldr r0, [sp, #8]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02267EB8: .word 0x000003B6
	thumb_func_end ov49_02267E18

	thumb_func_start ov49_02267EBC
ov49_02267EBC: ; 0x02267EBC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x20]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #3
	blo _02267ED0
	bl GF_AssertFail
_02267ED0:
	add r0, r5, #0
	add r0, #0xd8
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xdc
	str r6, [r0]
	add r0, r5, #0
	add r0, #0xe0
	str r7, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x18]
	add r0, #0xe4
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x1c]
	add r0, #0xe8
	str r1, [r0]
	ldr r0, [sp, #0x20]
	strh r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02267EBC

	thumb_func_start ov49_02267EF8
ov49_02267EF8: ; 0x02267EF8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	ldr r4, _02267F38 ; =0x00000000
	beq _02267F18
	add r5, r7, #0
_02267F04:
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #1
	bl sub_020182A0
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blo _02267F04
_02267F18:
	mov r0, #0
	strh r0, [r7]
	mov r0, #1
	strb r0, [r7, #6]
	strh r6, [r7, #4]
	ldrh r2, [r7, #2]
	add r1, r7, #0
	add r1, #0xe8
	lsl r3, r2, #2
	ldr r2, _02267F3C ; =ov49_0226A4CC
	ldr r1, [r1]
	ldr r2, [r2, r3]
	add r0, r7, #0
	blx r2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02267F38: .word 0x00000000
_02267F3C: .word ov49_0226A4CC
	thumb_func_end ov49_02267EF8

	thumb_func_start ov49_02267F40
ov49_02267F40: ; 0x02267F40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r1, [r5, #6]
	cmp r1, #0
	bne _02267F4E
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02267F4E:
	ldrh r1, [r5, #2]
	lsl r2, r1, #2
	ldr r1, _02267F90 ; =ov49_0226A484
	ldr r1, [r1, r2]
	blx r1
	mov r6, #0
	str r0, [sp]
	ldrsh r0, [r5, r6]
	add r0, r0, #1
	strh r0, [r5]
	ldr r0, [sp]
	cmp r0, #1
	bne _02267F8C
	ldrh r0, [r5, #4]
	cmp r0, #0
	ble _02267F88
	add r4, r5, #0
	add r7, r6, #0
_02267F72:
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r1, r7, #0
	bl sub_020182A0
	ldrh r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _02267F72
_02267F88:
	mov r0, #0
	strb r0, [r5, #6]
_02267F8C:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02267F90: .word ov49_0226A484
	thumb_func_end ov49_02267F40

	thumb_func_start ov49_02267F94
ov49_02267F94: ; 0x02267F94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #0x10]
	add r0, r1, #0
	add r1, sp, #0x24
	bl ov49_02259154
	mov r1, #2
	ldr r0, [sp, #0x24]
	lsl r1, r1, #0xe
	add r0, r0, r1
	str r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	lsl r0, r1, #1
	add r0, r2, r0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	mov r4, #0
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ble _022680A8
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x1c]
	add r0, #8
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x18]
	add r0, #0xa8
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x14]
_02267FD8:
	cmp r4, #3
	bhi _02268056
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02267FE8: ; jump table
	.short _02267FF0 - _02267FE8 - 2 ; case 0
	.short _02268008 - _02267FE8 - 2 ; case 1
	.short _02268020 - _02267FE8 - 2 ; case 2
	.short _0226803C - _02267FE8 - 2 ; case 3
_02267FF0:
	mov r0, #3
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	sub r7, r1, r0
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	add r6, r1, r0
	ldr r5, [sp, #0x2c]
	mov r0, #0
	str r0, [sp, #0x20]
	b _02268056
_02268008:
	mov r0, #3
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	add r7, r1, r0
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	add r6, r1, r0
	ldr r5, [sp, #0x2c]
	ldr r0, _022680AC ; =0x00007FFF
	str r0, [sp, #0x20]
	b _02268056
_02268020:
	mov r0, #2
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	sub r7, r1, r0
	ldr r1, [sp, #0x28]
	lsl r0, r0, #1
	add r6, r1, r0
	mov r0, #6
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #0xc
	sub r5, r1, r0
	ldr r0, _022680AC ; =0x00007FFF
	str r0, [sp, #0x20]
	b _02268056
_0226803C:
	mov r0, #2
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	add r7, r1, r0
	ldr r1, [sp, #0x28]
	lsl r0, r0, #1
	add r6, r1, r0
	mov r0, #6
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #0xc
	sub r5, r1, r0
	mov r0, #0
	str r0, [sp, #0x20]
_02268056:
	str r6, [sp]
	ldr r0, [sp, #0x2c]
	add r2, r7, #0
	str r0, [sp, #4]
	str r5, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl ov49_0226540C
	mov r3, #6
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r2, _022680B0 ; =0x00000CCC
	lsl r3, r3, #0xc
	bl ov49_022655F4
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	add r0, #0xd8
	ldr r0, [r0]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	bl sub_020182A8
	ldr r0, [sp, #0x1c]
	add r4, r4, #1
	add r0, #0x28
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r0, #0xc
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r4, r0
	blt _02267FD8
_022680A8:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022680AC: .word 0x00007FFF
_022680B0: .word 0x00000CCC
	thumb_func_end ov49_02267F94

	thumb_func_start ov49_022680B4
ov49_022680B4: ; 0x022680B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ble _02268134
	ldr r0, [sp]
	ldr r6, [sp]
	str r0, [sp, #4]
	add r0, #0xa8
	add r6, #8
	ldr r5, [sp]
	str r0, [sp, #4]
	add r4, r0, #0
	add r7, r6, #0
_022680D8:
	ldr r0, [sp, #4]
	bl ov49_02265628
	ldr r2, [sp]
	mov r1, #0
	ldrsh r1, [r2, r1]
	add r0, r6, #0
	bl ov49_02265434
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0x10
	bl ov49_02265660
	add r0, r7, #0
	add r1, sp, #0x14
	add r2, sp, #0x18
	add r3, sp, #0x1c
	bl ov49_022655E0
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x18]
	add r1, r1, r0
	add r0, r5, #0
	str r1, [sp, #0x14]
	add r0, #0xd8
	ldr r0, [r0]
	ldr r3, [sp, #0x1c]
	bl sub_020182A8
	ldr r0, [sp, #4]
	add r6, #0x28
	add r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r4, #0xc
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	add r7, #0x28
	ldrh r1, [r0, #4]
	ldr r0, [sp, #0xc]
	add r5, r5, #4
	cmp r0, r1
	blt _022680D8
_02268134:
	ldr r0, [sp, #8]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_022680B4

	thumb_func_start ov49_0226813C
ov49_0226813C: ; 0x0226813C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x10]
	add r0, r1, #0
	add r1, sp, #0x1c
	bl ov49_02259154
	mov r0, #2
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	mov r4, #0
	add r1, r1, r0
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x24]
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ble _0226821E
	ldr r1, [sp, #0x10]
	str r1, [sp, #0x18]
	add r1, #8
	str r1, [sp, #0x18]
	ldr r1, [sp, #0x10]
	str r1, [sp, #0x14]
	add r1, #0xa8
	str r1, [sp, #0x14]
_0226817A:
	cmp r4, #3
	bhi _022681E2
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0226818A: ; jump table
	.short _02268192 - _0226818A - 2 ; case 0
	.short _022681A2 - _0226818A - 2 ; case 1
	.short _022681B2 - _0226818A - 2 ; case 2
	.short _022681D4 - _0226818A - 2 ; case 3
_02268192:
	mov r0, #1
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	sub r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	add r5, r1, r0
	b _022681E2
_022681A2:
	mov r0, #1
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	add r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	add r5, r1, r0
	b _022681E2
_022681B2:
	cmp r0, #3
	bne _022681C4
	mov r0, #2
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0x10
	ldr r7, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	sub r5, r1, r0
	b _022681E2
_022681C4:
	mov r0, #1
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	sub r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	sub r5, r1, r0
	b _022681E2
_022681D4:
	mov r0, #1
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	add r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	sub r5, r1, r0
_022681E2:
	str r6, [sp]
	ldr r0, [sp, #0x24]
	add r2, r7, #0
	str r0, [sp, #4]
	str r5, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	bl ov49_0226540C
	mov r3, #2
	ldr r0, [sp, #0x14]
	ldr r1, _02268228 ; =0x00001555
	ldr r2, _0226822C ; =0x0000071C
	lsl r3, r3, #0x10
	bl ov49_022655F4
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	add r0, #0x28
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, #0xc
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r4, r0
	blt _0226817A
_0226821E:
	ldr r0, [sp, #0x10]
	bl ov49_02268230
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02268228: .word 0x00001555
_0226822C: .word 0x0000071C
	thumb_func_end ov49_0226813C

	thumb_func_start ov49_02268230
ov49_02268230: ; 0x02268230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	ldrh r0, [r5, #4]
	cmp r0, #0
	ble _022682C2
	add r4, r5, #0
	add r0, r5, #0
	add r4, #0xa8
	str r0, [sp, #4]
	add r0, #8
	str r0, [sp, #4]
	str r4, [sp]
	add r6, r0, #0
	add r7, r5, #0
_02268252:
	mov r0, #0
	ldrsh r0, [r5, r0]
	cmp r0, #0xe
	bne _0226826A
	mov r3, #3
	ldr r2, _022682D0 ; =0x00000E38
	add r0, r4, #0
	mov r1, #0
	lsl r3, r3, #0xe
	bl ov49_022655F4
	b _02268270
_0226826A:
	add r0, r4, #0
	bl ov49_02265628
_02268270:
	mov r1, #0
	ldrsh r1, [r5, r1]
	ldr r0, [sp, #4]
	bl ov49_02265434
	ldr r0, [sp]
	add r1, sp, #0xc
	bl ov49_02265660
	add r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #0x14
	add r3, sp, #0x18
	bl ov49_022655E0
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x18]
	add r2, r1, r0
	add r0, r7, #0
	str r2, [sp, #0x14]
	add r0, #0xd8
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	bl sub_020182A8
	ldr r0, [sp, #4]
	ldrh r1, [r5, #4]
	add r0, #0x28
	str r0, [sp, #4]
	ldr r0, [sp]
	add r4, #0xc
	add r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #8]
	add r6, #0x28
	add r0, r0, #1
	add r7, r7, #4
	str r0, [sp, #8]
	cmp r0, r1
	blt _02268252
_022682C2:
	mov r0, #0
	ldrsh r1, [r5, r0]
	cmp r1, #0x16
	blt _022682CC
	mov r0, #1
_022682CC:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022682D0: .word 0x00000E38
	thumb_func_end ov49_02268230

	thumb_func_start ov49_022682D4
ov49_022682D4: ; 0x022682D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, r1, #0
	add r1, sp, #0x10
	bl ov49_02259154
	mov r1, #2
	ldr r0, [sp, #0x10]
	lsl r1, r1, #0xe
	add r0, r0, r1
	str r0, [sp, #0x10]
	mov r0, #5
	ldr r2, [sp, #0x14]
	lsl r0, r0, #0xe
	add r0, r2, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r4, #0
	sub r0, r0, r1
	str r0, [sp, #0x18]
	ldrh r0, [r5, #4]
	cmp r0, #0
	ble _02268330
	mov r6, #5
	mov r7, #7
	lsl r6, r6, #0xc
	lsl r7, r7, #0xc
_0226830C:
	str r6, [sp]
	mov r0, #0xe
	mov r3, #0xd
	str r7, [sp, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x10
	lsl r3, r3, #0xc
	bl ov49_022683FC
	ldrh r0, [r5, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _0226830C
_02268330:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_022682D4

	thumb_func_start ov49_02268334
ov49_02268334: ; 0x02268334
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldrh r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _022683D6
	add r4, r5, #0
	str r4, [sp, #0x10]
	add r4, #8
	str r4, [sp, #0x10]
	add r7, r5, #0
_0226834C:
	mov r1, #0
	ldrsh r1, [r5, r1]
	ldr r0, [sp, #0x10]
	bl ov49_02265434
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r1, sp, #0x18
	add r2, sp, #0x1c
	add r3, sp, #0x20
	bl ov49_022655E0
	add r0, r7, #0
	add r0, #0xd8
	ldr r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	bl sub_020182A8
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _022683C4
	ldrb r0, [r5, #7]
	add r2, sp, #0x18
	cmp r0, #0
	bne _022683A2
	mov r0, #1
	lsl r0, r0, #0xe
	str r0, [sp]
	ldr r0, _022683F8 ; =0xFFFFD000
	ldr r3, _022683F8 ; =0xFFFFD000
	str r0, [sp, #4]
	mov r0, #3
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl ov49_022683FC
	b _022683C4
_022683A2:
	mov r0, #5
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0xa
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	mov r0, #4
	mov r3, #0xa
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	lsl r3, r3, #0xc
	bl ov49_022683FC
_022683C4:
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r0, #0x28
	str r0, [sp, #0x10]
	ldrh r0, [r5, #4]
	add r4, #0x28
	add r7, r7, #4
	cmp r6, r0
	blt _0226834C
_022683D6:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _022683F2
	ldrb r0, [r5, #7]
	add r0, r0, #1
	cmp r0, #3
	bge _022683EC
	strb r0, [r5, #7]
	mov r0, #0
	strh r0, [r5]
	b _022683F2
_022683EC:
	add sp, #0x24
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022683F2:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022683F8: .word 0xFFFFD000
	thumb_func_end ov49_02268334

	thumb_func_start ov49_022683FC
ov49_022683FC: ; 0x022683FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r7, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r5, #3
	bhi _0226845A
	add r3, r5, r5
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02268418: ; jump table
	.short _02268420 - _02268418 - 2 ; case 0
	.short _0226842E - _02268418 - 2 ; case 1
	.short _0226843C - _02268418 - 2 ; case 2
	.short _0226844C - _02268418 - 2 ; case 3
_02268420:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	sub r2, r0, r6
	ldr r0, [sp, #0x28]
	add r0, r1, r0
	ldr r1, [r4, #8]
	b _0226845A
_0226842E:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r0, r6
	ldr r0, [sp, #0x28]
	add r0, r1, r0
	ldr r1, [r4, #8]
	b _0226845A
_0226843C:
	ldr r1, [r4]
	ldr r0, [sp, #0x2c]
	sub r2, r1, r0
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x30]
	add r0, r1, r0
	ldr r1, [r4, #8]
	b _0226845A
_0226844C:
	ldr r1, [r4]
	ldr r0, [sp, #0x2c]
	add r2, r1, r0
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x30]
	add r0, r1, r0
	ldr r1, [r4, #8]
_0226845A:
	str r0, [sp]
	ldr r0, [r4, #8]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x34]
	add r1, r7, #0
	str r0, [sp, #0xc]
	mov r0, #0x28
	add r1, #8
	mul r0, r5
	add r0, r1, r0
	ldr r1, [r4]
	ldr r3, [r4, #4]
	bl ov49_0226540C
	lsl r0, r5, #2
	add r0, r7, r0
	add r0, #0xd8
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r3, [r4, #8]
	bl sub_020182A8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_022683FC

	thumb_func_start ov49_02268490
ov49_02268490: ; 0x02268490
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x60
	add r6, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x60
	add r4, r0, #0
	bl memset
	mov r1, #0xa
	ldr r2, _022684EC ; =ov49_0226A7E0
	mul r1, r5
	add r0, r4, #0
	add r1, r2, r1
	bl ov49_022686C0
	ldr r2, _022684F0 ; =ov49_0226A7D8
	lsl r1, r6, #1
	add r0, r4, #0
	add r1, r2, r1
	bl ov49_022686E4
	mov r1, #0
	add r2, r4, #0
	mov r0, #0x3c
_022684C6:
	add r1, r1, #1
	str r0, [r2, #0x48]
	add r2, r2, #4
	cmp r1, #2
	blt _022684C6
	mov r2, #0
	add r1, r4, #0
	mov r0, #0x3c
_022684D6:
	add r2, r2, #1
	str r0, [r1, #0x50]
	add r1, r1, #4
	cmp r2, #4
	blt _022684D6
	add r0, r4, #0
	bl ov49_022686F0
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_022684EC: .word ov49_0226A7E0
_022684F0: .word ov49_0226A7D8
	thumb_func_end ov49_02268490

	thumb_func_start ov49_022684F4
ov49_022684F4: ; 0x022684F4
	ldr r3, _022684F8 ; =FreeToHeap
	bx r3
	.balign 4, 0
_022684F8: .word FreeToHeap
	thumb_func_end ov49_022684F4

	thumb_func_start ov49_022684FC
ov49_022684FC: ; 0x022684FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r4, [sp, #4]
	mov r0, #0
	add r6, r4, #0
	add r5, r4, #0
	add r7, r0, #0
	add r6, #0x30
	add r5, #0x18
_02268510:
	ldr r1, [r4, #0x48]
	add r1, r1, #1
	cmp r1, #0x3c
	bgt _0226852C
	str r1, [r4, #0x48]
	mov r0, #0x3c
	str r0, [sp]
	ldr r3, [r4, #0x48]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov49_02268664
	mov r0, #1
_0226852C:
	add r7, r7, #1
	add r4, r4, #4
	add r6, r6, #4
	add r5, r5, #4
	cmp r7, #2
	blt _02268510
	ldr r4, [sp, #4]
	mov r1, #0
	add r7, r4, #0
	add r6, r4, #0
	add r5, r4, #0
	str r1, [sp, #8]
	add r7, #8
	add r6, #0x38
	add r5, #0x20
_0226854A:
	ldr r1, [r4, #0x50]
	add r1, r1, #1
	cmp r1, #0x3c
	bgt _02268566
	str r1, [r4, #0x50]
	mov r0, #0x3c
	str r0, [sp]
	ldr r3, [r4, #0x50]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov49_02268664
	mov r0, #1
_02268566:
	ldr r1, [sp, #8]
	add r4, r4, #4
	add r1, r1, #1
	add r7, r7, #4
	add r6, r6, #4
	add r5, r5, #4
	str r1, [sp, #8]
	cmp r1, #4
	blt _0226854A
	cmp r0, #0
	beq _02268582
	ldr r0, [sp, #4]
	bl ov49_022686F0
_02268582:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_022684FC

	thumb_func_start ov49_02268588
ov49_02268588: ; 0x02268588
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5]
	ldr r2, _022685F4 ; =ov49_0226A7E0
	strb r0, [r5, #0x18]
	ldrb r0, [r5, #1]
	strb r0, [r5, #0x19]
	ldrb r0, [r5, #2]
	strb r0, [r5, #0x1a]
	ldrb r0, [r5, #3]
	strb r0, [r5, #0x1b]
	mov r0, #0
	str r0, [r5, #0x48]
	mov r0, #0xa
	mul r0, r1
	add r4, r2, r0
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	bl ov49_02268640
	add r6, r4, #2
	add r4, r5, #0
	mov r7, #0
	add r4, #0x38
_022685BA:
	ldrb r1, [r5, #8]
	add r0, r5, #0
	add r0, #0x20
	strb r1, [r0]
	add r0, r5, #0
	ldrb r1, [r5, #9]
	add r0, #0x21
	strb r1, [r0]
	add r0, r5, #0
	ldrb r1, [r5, #0xa]
	add r0, #0x22
	strb r1, [r0]
	add r0, r5, #0
	ldrb r1, [r5, #0xb]
	add r0, #0x23
	strb r1, [r0]
	mov r0, #0
	str r0, [r5, #0x50]
	add r0, r4, #0
	add r1, r6, #0
	bl ov49_02268640
	add r7, r7, #1
	add r5, r5, #4
	add r6, r6, #2
	add r4, r4, #4
	cmp r7, #4
	blt _022685BA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022685F4: .word ov49_0226A7E0
	thumb_func_end ov49_02268588

	thumb_func_start ov49_022685F8
ov49_022685F8: ; 0x022685F8
	ldrb r2, [r0, #4]
	ldr r3, _02268618 ; =ov49_02268640
	lsl r1, r1, #1
	strb r2, [r0, #0x1c]
	ldrb r2, [r0, #5]
	strb r2, [r0, #0x1d]
	ldrb r2, [r0, #6]
	strb r2, [r0, #0x1e]
	ldrb r2, [r0, #7]
	strb r2, [r0, #0x1f]
	mov r2, #0
	str r2, [r0, #0x4c]
	ldr r2, _0226861C ; =ov49_0226A7D8
	add r0, #0x34
	add r1, r2, r1
	bx r3
	.balign 4, 0
_02268618: .word ov49_02268640
_0226861C: .word ov49_0226A7D8
	thumb_func_end ov49_022685F8

	thumb_func_start ov49_02268620
ov49_02268620: ; 0x02268620
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02268620

	thumb_func_start ov49_02268624
ov49_02268624: ; 0x02268624
	push {r3, r4}
	mov r3, #0
	mov r2, #2
	ldrsb r4, [r0, r3]
	ldrsb r2, [r0, r2]
	mov r3, #1
	ldrsb r0, [r0, r3]
	lsl r2, r2, #0xa
	lsl r0, r0, #5
	orr r0, r4
	orr r0, r2
	strh r0, [r1]
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_02268624

	thumb_func_start ov49_02268640
ov49_02268640: ; 0x02268640
	push {r3, r4}
	ldrh r3, [r1]
	mov r2, #0x1f
	and r3, r2
	strb r3, [r0]
	ldrh r4, [r1]
	lsl r3, r2, #5
	and r3, r4
	asr r3, r3, #5
	strb r3, [r0, #1]
	ldrh r3, [r1]
	lsl r1, r2, #0xa
	and r1, r3
	asr r1, r1, #0xa
	strb r1, [r0, #2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02268640

	thumb_func_start ov49_02268664
ov49_02268664: ; 0x02268664
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #1
	add r4, r2, #0
	ldrsb r2, [r1, r0]
	ldrsb r0, [r5, r0]
	add r6, r3, #0
	sub r0, r2, r0
	str r0, [sp, #4]
	mov r0, #2
	ldrsb r2, [r1, r0]
	ldrsb r0, [r5, r0]
	sub r0, r2, r0
	str r0, [sp]
	mov r0, #0
	ldrsb r7, [r5, r0]
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x20]
	sub r0, r0, r7
	mul r0, r6
	bl _s32_div_f
	add r0, r7, r0
	strb r0, [r4]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	mul r0, r6
	bl _s32_div_f
	mov r1, #1
	ldrsb r1, [r5, r1]
	add r0, r1, r0
	strb r0, [r4, #1]
	ldr r0, [sp]
	ldr r1, [sp, #0x20]
	mul r0, r6
	bl _s32_div_f
	mov r1, #2
	ldrsb r1, [r5, r1]
	add r0, r1, r0
	strb r0, [r4, #2]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02268664

	thumb_func_start ov49_022686C0
ov49_022686C0: ; 0x022686C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov49_02268640
	mov r6, #0
	add r4, r4, #2
	add r5, #8
_022686D0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02268640
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r6, #4
	blt _022686D0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_022686C0

	thumb_func_start ov49_022686E4
ov49_022686E4: ; 0x022686E4
	ldr r3, _022686EC ; =ov49_02268640
	add r0, r0, #4
	bx r3
	nop
_022686EC: .word ov49_02268640
	thumb_func_end ov49_022686E4

	thumb_func_start ov49_022686F0
ov49_022686F0: ; 0x022686F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [sp]
	mov r4, #0
	add r5, r0, #0
	add r7, #2
	add r6, sp, #4
_02268700:
	add r0, r5, #0
	add r1, r7, #0
	bl ov49_02268624
	ldrh r1, [r6, #2]
	add r0, r4, #0
	bl NNS_G3dGlbLightColor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02268700
	ldr r0, [sp]
	add r1, sp, #4
	add r0, #8
	add r1, #2
	bl ov49_02268624
	ldr r0, [sp]
	add r1, sp, #4
	add r0, #0xc
	bl ov49_02268624
	add r1, sp, #4
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	mov r2, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, [sp]
	add r1, sp, #4
	add r0, #0x10
	add r1, #2
	bl ov49_02268624
	ldr r0, [sp]
	add r1, sp, #4
	add r0, #0x14
	str r0, [sp]
	bl ov49_02268624
	add r1, sp, #4
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	mov r2, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_022686F0

	thumb_func_start ov49_02268764
ov49_02268764: ; 0x02268764
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0x1c
	add r6, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x1c
	mov r0, #0
_0226877A:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0226877A
	str r5, [r4]
	add r0, r5, #0
	bl ov49_02259FE8
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov49_02259FF8
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov49_02259FF0
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	bl ov45_0222A3BC
	bl ov49_02268974
	add r7, r0, #0
	ldr r0, [r4, #4]
	bl ov45_0222A3D4
	bl ov49_022689A0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	bl ov45_0222A3EC
	bl ov49_022689D4
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	bl ov49_02268490
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	bl ov49_02268FAC
	str r0, [r4, #0x14]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	add r2, r6, #0
	bl ov49_02268A0C
	str r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	add r1, r7, #0
	bl ov49_02258BEC
	ldr r0, [r4, #4]
	bl ov45_0222A35C
	add r5, r0, #0
	ldr r0, [r4, #4]
	bl ov45_0222A324
	ldr r0, [r4, #4]
	bl ov45_0222A374
	str r0, [sp]
	ldr r0, [r4, #4]
	bl ov45_0222A3A0
	add r7, r0, #0
	ldr r0, [r4, #4]
	bl ov45_0222A330
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov45_0222A394
	cmp r5, #2
	bne _02268820
	ldr r0, [r4, #8]
	bl ov49_0225E714
_02268820:
	cmp r5, #1
	beq _02268834
	cmp r5, #0
	bne _02268834
	cmp r7, #1
	bne _02268834
	ldr r0, [r4, #8]
	mov r1, #3
	bl ov49_0225E760
_02268834:
	ldr r0, [sp]
	cmp r0, #1
	bne _02268840
	ldr r0, [r4, #8]
	bl ov49_0225E574
_02268840:
	cmp r6, #1
	bne _0226884A
	add r0, r4, #0
	bl ov49_02268A00
_0226884A:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02268764

	thumb_func_start ov49_02268850
ov49_02268850: ; 0x02268850
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl ov49_02268A6C
	ldr r0, [r4, #0x14]
	bl ov49_02269090
	ldr r0, [r4, #0x10]
	bl ov49_022684F4
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02268850

	thumb_func_start ov49_02268870
ov49_02268870: ; 0x02268870
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, #1
	bl ov45_0222A288
	cmp r0, #0
	beq _0226889C
	ldr r0, [r5, #4]
	bl ov45_0222A3BC
	bl ov49_02268974
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl ov49_02268588
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl ov49_02258C08
_0226889C:
	ldr r0, [r5, #4]
	mov r1, #2
	bl ov45_0222A288
	cmp r0, #0
	beq _022688BA
	ldr r0, [r5, #4]
	bl ov45_0222A3D4
	bl ov49_022689A0
	add r1, r0, #0
	ldr r0, [r5, #0x10]
	bl ov49_022685F8
_022688BA:
	ldr r0, [r5, #4]
	mov r1, #3
	bl ov45_0222A288
	cmp r0, #0
	beq _022688D8
	ldr r0, [r5, #4]
	bl ov45_0222A3EC
	bl ov49_022689D4
	add r1, r0, #0
	ldr r0, [r5, #0x10]
	bl ov49_02268620
_022688D8:
	ldr r0, [r5, #4]
	bl ov45_0222A3A0
	cmp r0, #1
	bne _022688FE
	ldr r0, [r5, #4]
	bl ov45_0222A35C
	cmp r0, #0
	bne _022688FE
	ldr r0, [r5, #8]
	bl ov49_0225E824
	cmp r0, #0
	bne _022688FE
	ldr r0, [r5, #8]
	mov r1, #1
	bl ov49_0225E760
_022688FE:
	ldr r0, [r5, #4]
	mov r1, #5
	bl ov45_0222A288
	cmp r0, #0
	beq _02268922
	ldr r0, [r5, #4]
	bl ov45_0222A35C
	cmp r0, #1
	bne _02268922
	ldr r0, [r5, #8]
	bl ov49_0225E714
	ldr r0, [r5, #8]
	mov r1, #2
	bl ov49_0225E760
_02268922:
	ldr r0, [r5, #4]
	mov r1, #6
	bl ov45_0222A288
	cmp r0, #0
	beq _0226893E
	ldr r0, [r5, #4]
	bl ov45_0222A374
	cmp r0, #1
	bne _0226893E
	ldr r0, [r5, #8]
	bl ov49_0225E574
_0226893E:
	ldr r0, [r5, #4]
	bl ov45_0222A330
	cmp r0, #1
	bne _02268954
	ldr r0, [r5, #8]
	bl ov49_0225E580
	add r0, r5, #0
	bl ov49_02268A00
_02268954:
	ldr r0, [r5, #0x10]
	bl ov49_022684FC
	ldr r0, [r5, #0x14]
	bl ov49_02269098
	ldr r0, [r5, #0x18]
	bl ov49_02268A7C
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02268870

	thumb_func_start ov49_02268968
ov49_02268968: ; 0x02268968
	ldr r3, _02268970 ; =ov49_02269154
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02268970: .word ov49_02269154
	thumb_func_end ov49_02268968

	thumb_func_start ov49_02268974
ov49_02268974: ; 0x02268974
	push {r3, lr}
	cmp r0, #6
	bhi _02268998
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02268986: ; jump table
	.short _02268998 - _02268986 - 2 ; case 0
	.short _02268994 - _02268986 - 2 ; case 1
	.short _02268994 - _02268986 - 2 ; case 2
	.short _02268994 - _02268986 - 2 ; case 3
	.short _02268994 - _02268986 - 2 ; case 4
	.short _02268994 - _02268986 - 2 ; case 5
	.short _02268994 - _02268986 - 2 ; case 6
_02268994:
	sub r0, r0, #1
	pop {r3, pc}
_02268998:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov49_02268974

	thumb_func_start ov49_022689A0
ov49_022689A0: ; 0x022689A0
	push {r3, lr}
	cmp r0, #0xa
	bhi _022689CC
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022689B2: ; jump table
	.short _022689CC - _022689B2 - 2 ; case 0
	.short _022689CC - _022689B2 - 2 ; case 1
	.short _022689CC - _022689B2 - 2 ; case 2
	.short _022689CC - _022689B2 - 2 ; case 3
	.short _022689CC - _022689B2 - 2 ; case 4
	.short _022689CC - _022689B2 - 2 ; case 5
	.short _022689CC - _022689B2 - 2 ; case 6
	.short _022689C8 - _022689B2 - 2 ; case 7
	.short _022689C8 - _022689B2 - 2 ; case 8
	.short _022689C8 - _022689B2 - 2 ; case 9
	.short _022689C8 - _022689B2 - 2 ; case 10
_022689C8:
	sub r0, r0, #7
	pop {r3, pc}
_022689CC:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov49_022689A0

	thumb_func_start ov49_022689D4
ov49_022689D4: ; 0x022689D4
	push {r3, lr}
	add r1, r0, #0
	sub r1, #0xb
	cmp r1, #3
	bhi _022689F6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022689EA: ; jump table
	.short _022689F2 - _022689EA - 2 ; case 0
	.short _022689F2 - _022689EA - 2 ; case 1
	.short _022689F2 - _022689EA - 2 ; case 2
	.short _022689F2 - _022689EA - 2 ; case 3
_022689F2:
	sub r0, #0xb
	pop {r3, pc}
_022689F6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_022689D4

	thumb_func_start ov49_02268A00
ov49_02268A00: ; 0x02268A00
	ldr r3, _02268A08 ; =NNS_G3dGlbLightColor
	mov r0, #2
	mov r1, #0
	bx r3
	.balign 4, 0
_02268A08: .word NNS_G3dGlbLightColor
	thumb_func_end ov49_02268A00

	thumb_func_start ov49_02268A0C
ov49_02268A0C: ; 0x02268A0C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02268A22:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02268A22
	str r5, [r4]
	add r0, r5, #0
	str r6, [r4, #4]
	bl ov45_0222B1DC
	add r7, r0, #0
	add r0, r5, #0
	bl ov45_0222A35C
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _02268A66
	cmp r7, #0
	beq _02268A66
	add r0, r6, #0
	mov r1, #1
	bl ov49_0225E624
	add r0, r4, #0
	bl ov49_02268D94
	add r0, r5, #0
	bl ov45_0222B1EC
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov49_02268C74
_02268A66:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02268A0C

	thumb_func_start ov49_02268A6C
ov49_02268A6C: ; 0x02268A6C
	push {r4, lr}
	add r4, r0, #0
	bl ov49_02268DB0
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov49_02268A6C

	thumb_func_start ov49_02268A7C
ov49_02268A7C: ; 0x02268A7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl ov45_0222B1DC
	add r4, r0, #0
	ldr r0, [r5]
	bl ov45_0222B1EC
	add r7, r0, #0
	ldr r0, [r5]
	bl ov45_0222A35C
	add r6, r0, #0
	ldrh r0, [r5, #0xa]
	cmp r0, r6
	beq _02268ABC
	strh r6, [r5, #0xa]
	cmp r6, #1
	bne _02268ABC
	ldr r0, [r5, #4]
	mov r1, #1
	bl ov49_0225E624
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov49_02268C74
	add r0, r5, #0
	bl ov49_02268D94
_02268ABC:
	cmp r6, #0
	beq _02268ADA
	ldrb r0, [r5, #8]
	cmp r0, r4
	beq _02268AD0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov49_02268C74
_02268AD0:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov49_02268ADC
_02268ADA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02268A7C

	thumb_func_start ov49_02268ADC
ov49_02268ADC: ; 0x02268ADC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #6
	blo _02268AEC
	bl GF_AssertFail
_02268AEC:
	cmp r4, #6
	bhs _02268AFC
	ldr r2, _02268B00 ; =ov49_0226A84C
	lsl r3, r4, #2
	ldr r2, [r2, r3]
	add r0, r5, #0
	add r1, r6, #0
	blx r2
_02268AFC:
	pop {r4, r5, r6, pc}
	nop
_02268B00: .word ov49_0226A84C
	thumb_func_end ov49_02268ADC

	thumb_func_start ov49_02268B04
ov49_02268B04: ; 0x02268B04
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02268B04

	thumb_func_start ov49_02268B08
ov49_02268B08: ; 0x02268B08
	bx lr
	.balign 4, 0
	thumb_func_end ov49_02268B08

	thumb_func_start ov49_02268B0C
ov49_02268B0C: ; 0x02268B0C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, r1, #0
	mov r1, #0xe
	bl _u32_div_f
	cmp r1, #0
	bne _02268B86
	ldr r5, _02268B88 ; =ov49_0226A8B4
	mov r4, #0
_02268B20:
	ldr r0, [r7, #0xc]
	add r1, r4, #0
	lsl r2, r0, #3
	ldr r0, _02268B8C ; =ov49_0226A894
	mov r6, #0
	add r3, r0, r2
	mov r0, #3
	and r1, r0
	ldr r0, _02268B8C ; =ov49_0226A894
	ldr r0, [r0, r2]
	cmp r1, r0
	bne _02268B40
	mov r0, #1
	str r0, [sp]
	add r6, r0, #0
	b _02268B4C
_02268B40:
	ldr r0, [r3, #4]
	cmp r1, r0
	bne _02268B4C
	add r0, r6, #0
	str r0, [sp]
	mov r6, #1
_02268B4C:
	cmp r6, #1
	bne _02268B72
	cmp r4, #0x11
	bhs _02268B6E
	ldrb r1, [r5]
	mov r3, #1
	ldr r0, [r7, #4]
	ldr r2, [sp]
	lsl r3, r3, #0xc
	bl ov49_0225E85C
	add r6, r0, #0
	cmp r6, #1
	beq _02268B74
	bl GF_AssertFail
	b _02268B74
_02268B6E:
	mov r6, #0
	b _02268B74
_02268B72:
	mov r6, #1
_02268B74:
	add r5, r5, #1
	add r4, r4, #1
	cmp r6, #1
	beq _02268B20
	ldr r0, [r7, #0xc]
	add r1, r0, #1
	mov r0, #3
	and r0, r1
	str r0, [r7, #0xc]
_02268B86:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02268B88: .word ov49_0226A8B4
_02268B8C: .word ov49_0226A894
	thumb_func_end ov49_02268B0C

	thumb_func_start ov49_02268B90
ov49_02268B90: ; 0x02268B90
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #6
	bl _u32_div_f
	cmp r1, #0
	bne _02268C20
	ldr r0, [r5, #0xc]
	lsl r1, r0, #1
	ldr r0, _02268C24 ; =ov49_0226A83C
	ldrb r0, [r0, r1]
	str r0, [sp]
	ldr r0, _02268C28 ; =ov49_0226A83D
	ldrb r0, [r0, r1]
	add r1, sp, #4
	bl ov49_02268D0C
	ldr r0, [sp, #8]
	mov r4, #0
	cmp r0, #0
	bls _02268BE2
	mov r7, #1
	add r6, r4, #0
	lsl r7, r7, #0xc
_02268BC4:
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	ldrb r1, [r1, r4]
	add r2, r6, #0
	add r3, r7, #0
	bl ov49_0225E85C
	cmp r0, #1
	beq _02268BDA
	bl GF_AssertFail
_02268BDA:
	ldr r0, [sp, #8]
	add r4, r4, #1
	cmp r4, r0
	blo _02268BC4
_02268BE2:
	ldr r0, [sp]
	add r1, sp, #4
	bl ov49_02268D0C
	ldr r0, [sp, #8]
	mov r4, #0
	cmp r0, #0
	bls _02268C14
	mov r6, #1
	lsl r7, r6, #0xc
_02268BF6:
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	ldrb r1, [r1, r4]
	add r2, r6, #0
	add r3, r7, #0
	bl ov49_0225E85C
	cmp r0, #1
	beq _02268C0C
	bl GF_AssertFail
_02268C0C:
	ldr r0, [sp, #8]
	add r4, r4, #1
	cmp r4, r0
	blo _02268BF6
_02268C14:
	ldr r0, [r5, #0xc]
	mov r1, #7
	add r0, r0, #1
	bl _u32_div_f
	str r1, [r5, #0xc]
_02268C20:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02268C24: .word ov49_0226A83C
_02268C28: .word ov49_0226A83D
	thumb_func_end ov49_02268B90

	thumb_func_start ov49_02268C2C
ov49_02268C2C: ; 0x02268C2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhs _02268C64
	lsl r2, r0, #3
	ldr r0, _02268C68 ; =ov49_0226A864
	ldr r0, [r0, r2]
	cmp r0, r1
	bhs _02268C64
	ldr r1, _02268C6C ; =ov49_0226A868
	ldr r0, [r4, #4]
	ldr r1, [r1, r2]
	bl ov49_0225E894
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #4]
	lsl r2, r1, #3
	ldr r1, _02268C6C ; =ov49_0226A868
	ldr r1, [r1, r2]
	bl ov49_0225E6E0
	ldr r0, _02268C70 ; =0x000005B4
	bl PlaySE
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
_02268C64:
	pop {r4, pc}
	nop
_02268C68: .word ov49_0226A864
_02268C6C: .word ov49_0226A868
_02268C70: .word 0x000005B4
	thumb_func_end ov49_02268C2C

	thumb_func_start ov49_02268C74
ov49_02268C74: ; 0x02268C74
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #6
	blo _02268C84
	bl GF_AssertFail
_02268C84:
	cmp r4, #6
	bhs _02268CA4
	add r1, r5, #0
	mov r0, #0
	add r1, #0xc
	strb r0, [r5, #0xc]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldr r2, _02268CA8 ; =ov49_0226A87C
	lsl r3, r4, #2
	ldr r2, [r2, r3]
	add r0, r5, #0
	add r1, r6, #0
	blx r2
	strb r4, [r5, #8]
_02268CA4:
	pop {r4, r5, r6, pc}
	nop
_02268CA8: .word ov49_0226A87C
	thumb_func_end ov49_02268C74

	thumb_func_start ov49_02268CAC
ov49_02268CAC: ; 0x02268CAC
	ldr r3, _02268CB8 ; =ov49_0225E82C
	mov r2, #1
	ldr r0, [r0, #4]
	mov r1, #0
	lsl r2, r2, #0xc
	bx r3
	.balign 4, 0
_02268CB8: .word ov49_0225E82C
	thumb_func_end ov49_02268CAC

	thumb_func_start ov49_02268CBC
ov49_02268CBC: ; 0x02268CBC
	ldr r3, _02268CC8 ; =ov49_0225E82C
	mov r1, #1
	ldr r0, [r0, #4]
	lsl r2, r1, #0xc
	bx r3
	nop
_02268CC8: .word ov49_0225E82C
	thumb_func_end ov49_02268CBC

	thumb_func_start ov49_02268CCC
ov49_02268CCC: ; 0x02268CCC
	ldr r3, _02268CD8 ; =ov49_0225E82C
	mov r2, #1
	ldr r0, [r0, #4]
	mov r1, #0
	lsl r2, r2, #0xc
	bx r3
	.balign 4, 0
_02268CD8: .word ov49_0225E82C
	thumb_func_end ov49_02268CCC

	thumb_func_start ov49_02268CDC
ov49_02268CDC: ; 0x02268CDC
	ldr r3, _02268CE8 ; =ov49_0225E82C
	mov r2, #1
	ldr r0, [r0, #4]
	mov r1, #0
	lsl r2, r2, #0xc
	bx r3
	.balign 4, 0
_02268CE8: .word ov49_0225E82C
	thumb_func_end ov49_02268CDC

	thumb_func_start ov49_02268CEC
ov49_02268CEC: ; 0x02268CEC
	push {r4, lr}
	add r4, r0, #0
	bl ov49_02268DB0
	mov r2, #1
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r2, r2, #0xc
	bl ov49_0225E82C
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov49_0225E624
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02268CEC

	thumb_func_start ov49_02268D0C
ov49_02268D0C: ; 0x02268D0C
	push {r3, lr}
	cmp r0, #6
	bhi _02268D72
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02268D1E: ; jump table
	.short _02268D2C - _02268D1E - 2 ; case 0
	.short _02268D36 - _02268D1E - 2 ; case 1
	.short _02268D40 - _02268D1E - 2 ; case 2
	.short _02268D4A - _02268D1E - 2 ; case 3
	.short _02268D54 - _02268D1E - 2 ; case 4
	.short _02268D5E - _02268D1E - 2 ; case 5
	.short _02268D68 - _02268D1E - 2 ; case 6
_02268D2C:
	mov r0, #6
	str r0, [r1, #4]
	ldr r0, _02268D78 ; =ov49_0226A834
	str r0, [r1]
	pop {r3, pc}
_02268D36:
	mov r0, #2
	str r0, [r1, #4]
	ldr r0, _02268D7C ; =ov49_0226A82C
	str r0, [r1]
	pop {r3, pc}
_02268D40:
	mov r0, #2
	str r0, [r1, #4]
	ldr r0, _02268D80 ; =ov49_0226A824
	str r0, [r1]
	pop {r3, pc}
_02268D4A:
	mov r0, #1
	str r0, [r1, #4]
	ldr r0, _02268D84 ; =ov49_0226A81C
	str r0, [r1]
	pop {r3, pc}
_02268D54:
	mov r0, #1
	str r0, [r1, #4]
	ldr r0, _02268D88 ; =ov49_0226A820
	str r0, [r1]
	pop {r3, pc}
_02268D5E:
	mov r0, #2
	str r0, [r1, #4]
	ldr r0, _02268D8C ; =ov49_0226A828
	str r0, [r1]
	pop {r3, pc}
_02268D68:
	mov r0, #3
	str r0, [r1, #4]
	ldr r0, _02268D90 ; =ov49_0226A830
	str r0, [r1]
	pop {r3, pc}
_02268D72:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
_02268D78: .word ov49_0226A834
_02268D7C: .word ov49_0226A82C
_02268D80: .word ov49_0226A824
_02268D84: .word ov49_0226A81C
_02268D88: .word ov49_0226A820
_02268D8C: .word ov49_0226A828
_02268D90: .word ov49_0226A830
	thumb_func_end ov49_02268D0C

	thumb_func_start ov49_02268D94
ov49_02268D94: ; 0x02268D94
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02268DA8
	ldr r0, _02268DAC ; =0x000005B5
	bl PlaySE
	mov r0, #1
	strb r0, [r4, #9]
_02268DA8:
	pop {r4, pc}
	nop
_02268DAC: .word 0x000005B5
	thumb_func_end ov49_02268D94

	thumb_func_start ov49_02268DB0
ov49_02268DB0: ; 0x02268DB0
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _02268DC6
	ldr r0, _02268DC8 ; =0x000005B5
	mov r1, #0
	bl StopSE
	mov r0, #0
	strb r0, [r4, #9]
_02268DC6:
	pop {r4, pc}
	.balign 4, 0
_02268DC8: .word 0x000005B5
	thumb_func_end ov49_02268DB0

	thumb_func_start ov49_02268DCC
ov49_02268DCC: ; 0x02268DCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	bl ov49_0225EF84
	add r6, r0, #0
	add r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp]
	add r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #4]
	bl ov49_02258DB0
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl ov49_02258DAC
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bls _02268E04
	b _02268F9E
_02268E04:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02268E10: ; jump table
	.short _02268E1C - _02268E10 - 2 ; case 0
	.short _02268EF2 - _02268E10 - 2 ; case 1
	.short _02268F02 - _02268E10 - 2 ; case 2
	.short _02268F34 - _02268E10 - 2 ; case 3
	.short _02268F54 - _02268E10 - 2 ; case 4
	.short _02268F8A - _02268E10 - 2 ; case 5
_02268E1C:
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225EF40
	add r6, r0, #0
	ldr r0, _02268FA8 ; =0x000005DC
	bl PlaySE
	ldr r0, [sp, #8]
	mov r1, #6
	bl ov49_02258E60
	bl ov42_022282A4
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r1, r7, #0
	mov r2, #0
	bl ov49_02258EEC
	add r0, r7, #0
	mov r1, #0
	bl ov49_02259130
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	bl ov49_02259160
	ldr r0, [sp]
	bl ov45_0222A330
	cmp r0, #0
	beq _02268E7E
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	bl ov49_0225A30C
	add r1, r0, #0
	mov r0, #4
	str r0, [r6]
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268E7E:
	ldr r0, [sp]
	bl ov45_0222A3A0
	cmp r0, #1
	bne _02268EA8
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x58
	bl ov49_0225A30C
	add r1, r0, #0
	mov r0, #4
	str r0, [r6]
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268EA8:
	ldr r0, [sp]
	bl ov45_0222A2E0
	cmp r0, #1
	bne _02268ED2
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x57
	bl ov49_0225A30C
	add r1, r0, #0
	mov r0, #4
	str r0, [r6]
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268ED2:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x51
	bl ov49_0225A30C
	add r1, r0, #0
	mov r0, #1
	str r0, [r6]
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268EF2:
	add r0, r4, #0
	bl ov49_0225A264
	add r0, r5, #0
	mov r1, #2
	bl ov49_0225EF8C
	b _02268FA2
_02268F02:
	add r0, r4, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _02268F14
	cmp r0, #1
	beq _02268F24
	cmp r0, #2
	b _02268FA2
_02268F14:
	add r0, r5, #0
	mov r1, #3
	bl ov49_0225EF8C
	add r0, r4, #0
	bl ov49_0225A2F8
	b _02268FA2
_02268F24:
	add r0, r5, #0
	mov r1, #4
	bl ov49_0225EF8C
	add r0, r4, #0
	bl ov49_0225A2F8
	b _02268FA2
_02268F34:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x55
	bl ov49_0225A30C
	add r1, r0, #0
	mov r0, #4
	str r0, [r6]
	add r0, r4, #0
	bl ov49_0225A08C
	add r0, r5, #0
	mov r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268F54:
	add r0, r4, #0
	bl ov49_0225A0EC
	add r0, r4, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r2, #1
	bl ov49_02258EEC
	add r0, r5, #0
	bl ov49_0225EF68
	add r0, r7, #0
	mov r1, #1
	bl ov49_02259130
	ldr r0, [sp, #4]
	add r1, r7, #0
	mov r2, #0
	mov r3, #1
	bl ov49_02258EAC
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02268F8A:
	add r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02268FA2
	ldr r1, [r6]
	add r0, r5, #0
	bl ov49_0225EF8C
	b _02268FA2
_02268F9E:
	bl GF_AssertFail
_02268FA2:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02268FA8: .word 0x000005DC
	thumb_func_end ov49_02268DCC

	thumb_func_start ov49_02268FAC
ov49_02268FAC: ; 0x02268FAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0xc4
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc4
	bl memset
	str r5, [r4]
	add r0, r5, #0
	bl ov49_02259FE8
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov49_02259FF8
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov49_0225A000
	str r0, [r4, #0xc]
	bl ov49_022589A8
	add r1, r0, #6
	add r0, r4, #0
	add r0, #0xbc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xbc
	ldr r1, [r0]
	mov r0, #7
	mvn r0, r0
	sub r1, r0, r1
	add r0, r4, #0
	add r0, #0xc0
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	ldr r6, _0226908C ; =ov49_0226A8C8
	lsl r1, r0, #0x10
	add r0, r4, #0
	add r0, #0xbc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r7, #0
	lsl r1, r0, #0x10
	add r0, r4, #0
	add r0, #0xc0
	str r1, [r0]
	add r5, r4, #0
_0226901E:
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r6]
	add r2, sp, #4
	ldr r0, [r4, #0xc]
	add r2, #2
	add r3, sp, #4
	bl ov49_022589D8
	add r0, sp, #4
	ldrh r0, [r0, #2]
	add r7, r7, #1
	add r6, r6, #1
	lsl r1, r0, #4
	add r0, r5, #0
	add r0, #0xaa
	strh r1, [r0]
	add r0, sp, #4
	ldrh r0, [r0]
	lsl r1, r0, #4
	add r0, r5, #0
	add r0, #0xac
	add r5, r5, #4
	strh r1, [r0]
	cmp r7, #3
	blt _0226901E
	mov r5, #0
_02269054:
	add r2, r4, #0
	add r2, #0xbc
	ldr r0, [r4, #8]
	ldr r2, [r2]
	add r1, r5, #0
	bl ov49_0225E3B8
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov45_0222AD80
	cmp r0, #1
	bne _0226907E
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_02269178
	add r0, r4, #0
	add r1, r5, #0
	bl ov49_022695C4
_0226907E:
	add r5, r5, #1
	cmp r5, #9
	blt _02269054
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226908C: .word ov49_0226A8C8
	thumb_func_end ov49_02268FAC

	thumb_func_start ov49_02269090
ov49_02269090: ; 0x02269090
	ldr r3, _02269094 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02269094: .word FreeToHeap
	thumb_func_end ov49_02269090

	thumb_func_start ov49_02269098
ov49_02269098: ; 0x02269098
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl ov45_0222A53C
	add r1, r0, #0
	ldr r0, [r5, #4]
	bl ov45_0222ADA8
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #8]
	cmp r0, r1
	bne _022690BA
	mov r6, #0
	b _022690C4
_022690BA:
	add r1, sp, #8
	add r2, sp, #4
	bl ov45_0222AE08
	mov r6, #1
_022690C4:
	mov r4, #0
_022690C6:
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ov45_0222AD80
	cmp r0, #1
	ldr r0, [r5, #8]
	bne _0226910E
	add r1, r4, #0
	mov r2, #1
	bl ov49_0225E4CC
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_02269178
	add r0, r5, #0
	add r1, r4, #0
	bl ov49_022695C4
	cmp r6, #0
	beq _022690FC
	ldr r0, [sp, #8]
	cmp r0, r4
	bne _022690FA
	mov r7, #1
	b _022690FC
_022690FA:
	mov r7, #0
_022690FC:
	ldr r0, [sp, #4]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov49_02269240
	b _02269116
_0226910E:
	add r1, r4, #0
	mov r2, #0
	bl ov49_0225E4CC
_02269116:
	add r4, r4, #1
	cmp r4, #9
	blt _022690C6
	add r7, r5, #0
	mov r6, #0
	add r4, r5, #0
	add r7, #0x2c
_02269124:
	ldr r0, [r5, #8]
	add r1, r6, #0
	bl ov49_0225E524
	strb r0, [r4, #0x10]
	ldr r1, [r5, #8]
	add r0, r7, #0
	add r2, r6, #0
	bl ov49_02269430
	strb r0, [r4, #0x11]
	ldr r0, [r5, #8]
	add r1, r6, #0
	bl ov49_0225E54C
	strb r0, [r4, #0x12]
	add r6, r6, #1
	add r4, r4, #3
	add r7, #0xe
	cmp r6, #9
	blt _02269124
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov49_02269098

	thumb_func_start ov49_02269154
ov49_02269154: ; 0x02269154
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	cmp r5, #9
	blo _02269164
	bl GF_AssertFail
_02269164:
	cmp r4, #3
	blt _0226916C
	bl GF_AssertFail
_0226916C:
	lsl r0, r5, #1
	add r0, r5, r0
	add r0, r6, r0
	add r0, r0, r4
	ldrb r0, [r0, #0x10]
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_02269154

	thumb_func_start ov49_02269178
ov49_02269178: ; 0x02269178
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	str r1, [sp]
	bl ov45_0222AD90
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl ov45_0222ADA0
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0xc
	bl FX_Div
	add r7, r0, #0
	cmp r6, #0
	ble _022691B4
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022691C2
_022691B4:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022691C2:
	add r6, r0, #0
	cmp r4, #0
	ble _022691DA
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022691E8
_022691DA:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022691E8:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r4, r2, #0xc
	orr r4, r0
	add r0, r6, #0
	bl _ffix
	add r1, r0, #0
	add r0, r4, #0
	bl FX_Div
	asr r2, r0, #0x1f
	lsl r3, r2, #0xd
	lsr r1, r0, #0x13
	lsl r2, r0, #0xd
	mov r0, #2
	orr r3, r1
	mov r1, #0
	lsl r0, r0, #0xa
	add r2, r2, r0
	adc r3, r1
	lsl r0, r3, #0x14
	lsr r3, r2, #0xc
	orr r3, r0
	add r0, r5, #0
	add r0, #0xbc
	ldr r2, [r0]
	ldr r0, [r5, #8]
	ldr r1, [sp]
	add r2, r3, r2
	bl ov49_0225E3B8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02269178

	thumb_func_start ov49_02269240
ov49_02269240: ; 0x02269240
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	ldr r0, [sp, #0x30]
	str r1, [sp]
	str r0, [sp, #0x30]
	ldr r0, [r7, #4]
	str r2, [sp, #4]
	add r5, r3, #0
	bl ov45_0222AD3C
	add r6, r0, #0
	ldr r0, [r7, #4]
	bl ov45_0222AD2C
	ldr r0, [sp]
	mov r4, #0
	lsl r1, r0, #1
	add r0, r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp]
	mov r1, #3
	bl _u32_div_f
	str r1, [sp, #8]
	mov r0, #0xc
	ldr r1, _02269398 ; =ov49_0226A8DC
	mul r0, r6
	add r0, r1, r0
	str r0, [sp, #0xc]
	add r0, r7, #0
	str r0, [sp, #0x14]
	add r0, #0x2c
	str r0, [sp, #0x14]
	ldr r0, [sp]
	mov r1, #0xe
	mul r1, r0
	str r1, [sp, #0x18]
_0226928C:
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r4, r1
	bl ov45_0222ADE8
	mov r6, #0
	cmp r5, #1
	bne _022692A4
	ldr r1, [sp, #0x30]
	cmp r4, r1
	bne _022692A4
	mov r6, #1
_022692A4:
	cmp r0, #1
	bne _0226938A
	cmp r4, #0
	beq _022692B6
	cmp r4, #1
	beq _0226931A
	cmp r4, #2
	beq _02269350
	b _0226938A
_022692B6:
	ldr r0, [r7, #8]
	ldr r1, [sp]
	bl ov49_0225E47C
	cmp r0, #1
	bne _0226938A
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _022692EC
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3, #2]
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_022693D4
	ldr r0, [sp, #0xc]
	ldrh r3, [r0, #8]
	ldr r0, _0226939C ; =0x0000FFFE
	cmp r3, r0
	beq _0226930E
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_022693A4
	b _0226930E
_022692EC:
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3]
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_022693D4
	ldr r0, [sp, #0xc]
	ldrh r3, [r0, #4]
	ldr r0, _0226939C ; =0x0000FFFE
	cmp r3, r0
	beq _0226930E
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_022693A4
_0226930E:
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r4, r1
	bl ov45_0222ADF8
	b _0226938A
_0226931A:
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _02269324
	mov r1, #1
	b _02269326
_02269324:
	mov r1, #0
_02269326:
	ldr r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	ldr r3, [sp]
	add r0, r2, r0
	ldr r2, [r7, #8]
	bl ov49_022693F8
	cmp r0, #1
	bne _0226938A
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r4, r1
	bl ov45_0222ADF8
	ldr r0, [sp, #4]
	ldr r3, _022693A0 ; =0x000005C6
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_022693A4
	b _0226938A
_02269350:
	ldr r0, [r7, #8]
	ldr r1, [sp]
	bl ov49_0225E4A4
	cmp r0, #1
	bne _0226938A
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	add r1, r4, r1
	bl ov45_0222ADF8
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _0226937C
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3, #0xa]
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_022693A4
	b _0226938A
_0226937C:
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3, #6]
	add r1, r5, #0
	add r2, r6, #0
	bl ov49_022693A4
_0226938A:
	add r4, r4, #1
	cmp r4, #3
	bge _02269392
	b _0226928C
_02269392:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02269398: .word ov49_0226A8DC
_0226939C: .word 0x0000FFFE
_022693A0: .word 0x000005C6
	thumb_func_end ov49_02269240

	thumb_func_start ov49_022693A4
ov49_022693A4: ; 0x022693A4
	push {r3, lr}
	cmp r0, #0
	beq _022693C8
	cmp r1, #0
	beq _022693D0
	cmp r2, #0
	beq _022693BE
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	mov r1, #5
	bl sub_0200606C
	pop {r3, pc}
_022693BE:
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
	pop {r3, pc}
_022693C8:
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_022693D0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_022693A4

	thumb_func_start ov49_022693D4
ov49_022693D4: ; 0x022693D4
	push {r3, lr}
	cmp r0, #0
	beq _022693EA
	cmp r1, #0
	beq _022693F4
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	mov r1, #0
	bl PlayCry
	pop {r3, pc}
_022693EA:
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	mov r1, #0
	bl PlayCry
_022693F4:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov49_022693D4

	thumb_func_start ov49_022693F8
ov49_022693F8: ; 0x022693F8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #2
	blo _0226940A
	bl GF_AssertFail
_0226940A:
	ldrh r0, [r5]
	cmp r0, #1
	bne _02269414
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02269414:
	ldr r3, _0226942C ; =ov49_0226A8D4
	strh r4, [r5, #2]
	lsl r4, r4, #2
	mov r0, #1
	strh r0, [r5]
	ldr r3, [r3, r4]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	blx r3
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226942C: .word ov49_0226A8D4
	thumb_func_end ov49_022693F8

	thumb_func_start ov49_02269430
ov49_02269430: ; 0x02269430
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r3, [r4]
	cmp r3, #0
	beq _0226946A
	ldrh r3, [r4, #2]
	lsl r5, r3, #2
	ldr r3, _02269470 ; =ov49_0226A8CC
	ldr r3, [r3, r5]
	blx r3
	cmp r0, #1
	bne _02269466
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
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
_02269466:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0226946A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02269470: .word ov49_0226A8CC
	thumb_func_end ov49_02269430

	thumb_func_start ov49_02269474
ov49_02269474: ; 0x02269474
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4, #4]
	mov r0, #8
	strh r0, [r4, #6]
	mov r0, #5
	bl GF_DegreeToSinCosIdx
	strh r0, [r4, #8]
	mov r0, #2
	strh r0, [r4, #0xa]
	mov r0, #4
	strh r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02269474

	thumb_func_start ov49_02269494
ov49_02269494: ; 0x02269494
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4, #4]
	mov r0, #0x10
	strh r0, [r4, #6]
	mov r0, #0xa
	bl GF_DegreeToSinCosIdx
	strh r0, [r4, #8]
	mov r0, #4
	strh r0, [r4, #0xa]
	mov r0, #2
	strh r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov49_02269494

	thumb_func_start ov49_022694B4
ov49_022694B4: ; 0x022694B4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, sp, #0x10
	mov r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	mov r0, #4
	ldrsh r0, [r5, r0]
	str r1, [sp]
	str r2, [sp, #4]
	add r1, r0, #1
	mov r0, #6
	ldrsh r0, [r5, r0]
	cmp r1, r0
	bge _022694DA
	strh r1, [r5, #4]
	b _022694EC
_022694DA:
	strh r4, [r5, #4]
	mov r0, #0xc
	ldrsh r0, [r5, r0]
	sub r0, r0, #1
	cmp r0, #0
	ble _022694EA
	strh r0, [r5, #0xc]
	b _022694EC
_022694EA:
	mov r4, #1
_022694EC:
	mov r0, #4
	ldrsh r1, [r5, r0]
	ldr r0, _022695BC ; =0x0000FFFF
	mul r0, r1
	mov r1, #6
	ldrsh r1, [r5, r1]
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _02269518
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02269526
_02269518:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02269526:
	bl _ffix
	add r2, r0, #0
	asr r0, r6, #4
	lsl r1, r0, #2
	ldr r0, _022695C0 ; =FX_SinCosTable_
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	str r0, [sp, #8]
	asr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	lsl r0, r1, #4
	lsr r6, r0, #0x10
	mov r0, #0xa
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02269572
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02269580
_02269572:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02269580:
	bl _ffix
	add r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
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
	str r1, [sp, #0x14]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r6, #0
	bl ov49_0225E4F8
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, sp, #0x10
	bl ov49_0225E3F4
	add r0, r4, #0
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022695BC: .word 0x0000FFFF
_022695C0: .word FX_SinCosTable_
	thumb_func_end ov49_022694B4

	thumb_func_start ov49_022695C4
ov49_022695C4: ; 0x022695C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	str r1, [sp]
	add r0, r1, #0
	lsl r1, r0, #1
	ldr r0, [sp]
	mov r6, #0
	add r0, r0, r1
	str r0, [sp, #4]
_022695D8:
	ldr r1, [sp, #4]
	ldr r0, [r7, #4]
	add r1, r6, r1
	bl ov45_0222AE34
	add r4, r0, #0
	ldr r0, [r7, #8]
	ldr r1, [sp]
	add r2, r6, #0
	add r3, sp, #8
	bl ov49_0225E420
	cmp r4, #3
	bge _0226961A
	lsl r0, r4, #2
	add r5, r7, r0
_022695F8:
	mov r0, #0xaa
	ldrsh r0, [r5, r0]
	add r0, #0x10
	lsl r1, r0, #0xc
	ldr r0, [sp, #8]
	cmp r1, r0
	ble _02269612
	ldr r1, [sp, #4]
	ldr r0, [r7, #4]
	add r1, r6, r1
	add r2, r4, #0
	bl ov45_0222AE24
_02269612:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _022695F8
_0226961A:
	add r6, r6, #1
	cmp r6, #3
	blt _022695D8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_022695C4

	.rodata

_02269624:
	.byte 0x27, 0x28, 0x29, 0x00

ov49_02269628: ; 0x02269628
	.byte 0x02, 0x03, 0x04, 0x05

ov49_0226962C: ; 0x0226962C
	.byte 0x24, 0x25, 0x26, 0x27
	.byte 0x28, 0x29, 0x2B, 0x00

ov49_02269634: ; 0x02269634
	.byte 0x01, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10
	.byte 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20
	.byte 0x21, 0x22, 0x23, 0x2C

ov49_02269654: ; 0x02269654
	.byte 0x03, 0x02, 0x01, 0x00

ov49_02269658: ; 0x02269658
	.byte 0x20, 0x40, 0x80, 0x90

ov49_0226965C: ; 0x0226965C
	.byte 0x00, 0x01, 0x02, 0x03

ov49_02269660: ; 0x02269660
	.byte 0x10, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_02269678: ; 0x02269678
	.byte 0x40, 0x02, 0x1E, 0x01, 0xFF, 0x00, 0x00, 0x00
	.byte 0x41, 0x01, 0x1E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x42, 0x01, 0x1D, 0x01, 0xFF, 0x00, 0x00, 0x00
	.byte 0x61, 0x01, 0x1D, 0x01, 0xFE, 0x00, 0x00, 0x00

ov49_02269698: ; 0x02269698
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov49_022599F8

ov49_022696C0: ; 0x022696C0
	.word ov49_0225940C
	.word ov49_02259410
	.word ov49_022594D8
	.word ov49_022595CC
	.word ov49_0225967C
	.word ov49_0225974C
	.word ov49_02259758
	.word ov49_02259734
	.word ov49_02259740
	.word ov49_0225991C

ov49_022696E8: ; 0x022696E8
	.byte 0x14, 0x88, 0x00, 0x00

ov49_022696EC: ; 0x022696EC
	.byte 0x00, 0x01, 0x00, 0x00

ov49_022696F0: ; 0x022696F0
	.byte 0x00, 0x09, 0x06, 0x00

ov49_022696F4: ; 0x022696F4
	.byte 0x20, 0xA0, 0x28, 0xD8

ov49_022696F8: ; 0x022696F8
	.byte 0xE4, 0x02, 0xEC, 0x02

ov49_022696FC: ; 0x022696FC
	.byte 0x03, 0x00, 0x69, 0x00
	.byte 0x34, 0x00, 0x38, 0x00

ov49_02269704: ; 0x02269704
	.byte 0x02, 0x00, 0x68, 0x00, 0x33, 0x00, 0x37, 0x00

ov49_0226970C: ; 0x0226970C
	.byte 0x05, 0x01, 0x00, 0x18
	.byte 0x03, 0x05, 0xD0, 0x01

ov49_02269714: ; 0x02269714
	.byte 0x08, 0x03, 0x00, 0x00, 0x09, 0x03, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00
	.byte 0xFE, 0x02, 0x00, 0x00

ov49_02269724: ; 0x02269724
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov49_02269734: ; 0x02269734
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00

ov49_02269744: ; 0x02269744
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00

ov49_02269754: ; 0x02269754
	.byte 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10

ov49_02269764: ; 0x02269764
	.byte 0x02, 0x00, 0x32, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x03, 0x00, 0x36, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF

ov49_02269774: ; 0x02269774
	.byte 0xD7, 0x00, 0x00, 0x00, 0x08, 0x00, 0xD1, 0x00, 0x66, 0x00, 0x02, 0x00
	.byte 0xD7, 0x00, 0x31, 0x00, 0x01, 0x00, 0xD7, 0x00, 0x35, 0x00, 0x01, 0x00

ov49_0226978C: ; 0x0226978C
	.byte 0xE4, 0x02, 0xE5, 0x02
	.byte 0xE6, 0x02, 0xE7, 0x02, 0xE8, 0x02, 0xE9, 0x02, 0xEA, 0x02, 0xEB, 0x02, 0xEC, 0x02, 0xED, 0x02
	.byte 0xEE, 0x02, 0xEF, 0x02, 0xF0, 0x02, 0xF1, 0x02, 0xF2, 0x02, 0xF3, 0x02

ov49_022697AC: ; 0x022697AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_022697CC: ; 0x022697CC
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov49_022697F4: ; 0x022697F4
	.byte 0x06, 0x08, 0x02, 0x10, 0x04, 0x05, 0x40, 0x01, 0x06, 0x01, 0x07, 0x1E
	.byte 0x06, 0x05, 0x80, 0x01, 0x06, 0x01, 0x0E, 0x13, 0x04, 0x05, 0x34, 0x02, 0x06, 0x01, 0x13, 0x13
	.byte 0x04, 0x05, 0x80, 0x02, 0x06, 0x00, 0x0E, 0x16, 0x08, 0x05, 0x34, 0x02

ov49_0226981C: ; 0x0226981C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_0226988C: ; 0x0226988C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x21, 0x00, 0x23, 0x00, 0x61, 0x00, 0x01, 0x00, 0x26, 0x00, 0x24, 0x00, 0x03, 0x00, 0x3C, 0x00
	.byte 0x26, 0x00, 0x19, 0x00, 0x05, 0x00, 0x06, 0x00, 0x2C, 0x00, 0x20, 0x00, 0x0B, 0x00, 0x18, 0x00
	.byte 0x26, 0x00, 0x2C, 0x00, 0x1F, 0x00, 0x39, 0x00, 0x28, 0x00, 0x28, 0x00, 0x32, 0x00, 0x30, 0x00
	.byte 0x2C, 0x00, 0x1A, 0x00, 0x33, 0x00, 0x0E, 0x00, 0x2C, 0x00, 0x25, 0x00, 0x3E, 0x00, 0x20, 0x00
	.byte 0x1D, 0x00, 0x28, 0x00, 0x46, 0x00, 0x31, 0x00, 0x2A, 0x00, 0x2C, 0x00, 0x06, 0x00, 0x03, 0x00
	.byte 0x27, 0x00, 0x22, 0x00, 0x07, 0x00, 0x0A, 0x00, 0x28, 0x00, 0x24, 0x00, 0x0D, 0x00, 0x24, 0x00
	.byte 0x26, 0x00, 0x29, 0x00, 0x0E, 0x00, 0x19, 0x00, 0x24, 0x00, 0x2A, 0x00, 0x23, 0x00, 0x55, 0x00
	.byte 0x26, 0x00, 0x26, 0x00, 0x25, 0x00, 0x23, 0x00, 0x26, 0x00, 0x27, 0x00, 0x2A, 0x00, 0x12, 0x00
	.byte 0x26, 0x00, 0x23, 0x00, 0x3F, 0x00, 0x21, 0x00, 0x28, 0x00, 0x2C, 0x00

ov49_0226991C: ; 0x0226991C
	.byte 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x19, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x06, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x09, 0x00, 0x00, 0x00, 0x19, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x06, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x09, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_022699AC: ; 0x022699AC
	.byte 0x00, 0x00, 0x01, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x06, 0x04, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x01, 0x07, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x02, 0x0A, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x06, 0x0D, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x05, 0x10, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x03, 0x13, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x04, 0x16, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x00, 0x19, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x07, 0x1C, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x04, 0x1F, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x01, 0x22, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x05, 0x25, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x05, 0x28, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x02, 0x2B, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x03, 0x2E, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x01, 0x00, 0x67, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x6A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x6D, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x76, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x73, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x79, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_02269A6C: ; 0x02269A6C
	.byte 0x02, 0xD6, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov49_02269A74: ; 0x02269A74
	.byte 0xF5, 0xFF, 0xFF, 0xFF, 0x0C, 0x00, 0x00, 0x00

ov49_02269A7C: ; 0x02269A7C
	.byte 0xFE, 0xFF

ov49_02269A7E: ; 0x02269A7E
	.byte 0x0A, 0x00
	.byte 0x0E, 0x00, 0x0A, 0x00, 0x1E, 0x00, 0x0A, 0x00

ov49_02269A88: ; 0x02269A88
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00

ov49_02269AAC: ; 0x02269AAC
	.byte 0x18, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x1A, 0x00, 0x02, 0x00, 0x1B, 0x00, 0x03, 0x00, 0x1B, 0x00, 0x03, 0x00
	.byte 0x1C, 0x00, 0x04, 0x00, 0x21, 0x00, 0x05, 0x00, 0x46, 0x00, 0x06, 0x00, 0x47, 0x00, 0x07, 0x00
	.byte 0x48, 0x00, 0x08, 0x00, 0x4C, 0x00, 0x09, 0x00, 0x49, 0x00, 0x0A, 0x00, 0x4A, 0x00, 0x0A, 0x00
	.byte 0x4B, 0x00, 0x0A, 0x00, 0x4D, 0x00, 0x0B, 0x00, 0x4E, 0x00, 0x0C, 0x00, 0x4D, 0x00, 0x0D, 0x00
	.byte 0x4E, 0x00, 0x0D, 0x00, 0x4D, 0x00, 0x0E, 0x00, 0x4E, 0x00, 0x0E, 0x00, 0x19, 0x00, 0x0F, 0x00
	.byte 0x1A, 0x00, 0x0F, 0x00, 0x1B, 0x00, 0x0F, 0x00, 0x1B, 0x00, 0x0F, 0x00, 0x1C, 0x00, 0x0F, 0x00
	.byte 0x19, 0x00, 0x10, 0x00, 0x1A, 0x00, 0x10, 0x00, 0x1B, 0x00, 0x10, 0x00, 0x1B, 0x00, 0x10, 0x00
	.byte 0x1C, 0x00, 0x10, 0x00, 0x5C, 0x00, 0x0D, 0x00, 0x5D, 0x00, 0x0D, 0x00, 0x5C, 0x00, 0x0E, 0x00
	.byte 0x5D, 0x00, 0x0E, 0x00, 0x62, 0x00, 0x11, 0x00

ov49_02269B38: ; 0x02269B38
	.word ov49_0225FDCC
	.word ov49_02260230

ov49_02269B40: ; 0x02269B40
	.word ov49_02261720, 0

ov49_02269B48: ; 0x02269B48
	.word ov49_022618C0, 0

ov49_02269B50: ; 0x02269B50
	.word ov49_02261930, 0

ov49_02269B58: ; 0x02269B58
	.word ov49_02261B74, 0

ov49_02269B60: ; 0x02269B60
	.word ov49_02262FB4, 0

ov49_02269B68: ; 0x02269B68
	.word ov49_02262AC4, 0

ov49_02269B70: ; 0x02269B70
	.word ov49_02263B74, 0

ov49_02269B78: ; 0x02269B78
	.word ov49_0226154C, 0

ov49_02269B80: ; 0x02269B80
	.word ov49_0225F448, 0

ov49_02269B88: ; 0x02269B88
	.word ov49_02262028, 0

ov49_02269B90: ; 0x02269B90
	.byte 0x4F, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00

ov49_02269BA0: ; 0x02269BA0
	.byte 0x57, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00

ov49_02269BB0: ; 0x02269BB0
	.byte 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00

ov49_02269BC0: ; 0x02269BC0
	.byte 0x53, 0x00, 0x00, 0x00, 0x54, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00

ov49_02269BD0: ; 0x02269BD0
	.byte 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00

ov49_02269BE0: ; 0x02269BE0
	.word ov49_0225F518, 0
	.word ov49_0225FA14, 0
	.word ov49_0225FB5C, 0
	.word ov49_0225FCA8, 0

ov49_02269C00: ; 0x02269C00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x07, 0x00, 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_02269C20: ; 0x02269C20
	.byte 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00

ov49_02269C40: ; 0x02269C40
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00

ov49_02269C60: ; 0x02269C60
	.byte 0x27, 0x28, 0x29, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.word ov49_02262B14
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.word 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_02269C90: ; 0x02269C90
	.byte 0x24, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.word ov49_02260D90
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x25, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.word ov49_022644E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x26, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.word ov49_022649F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x27, 0x28, 0x29, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.word ov49_02262B14
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2B, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.word ov49_02268DCC
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.word 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_02269D20: ; 0x02269D20
	.byte 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov49_02260254
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x17, 0x18, 0x19, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov49_02260428
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x1B, 0x1C, 0x1D, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov49_02260428
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x00, 0x00, 0x00, 0x00
	.word ov49_02260428
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x00, 0x00, 0x00, 0x00
	.word ov49_02260428
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x21, 0x22, 0x23, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov49_02260E2C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1E, 0x1F, 0x20, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov49_022607C4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov49_02260A68
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.word 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_02269DF8: ; 0x02269DF8
	.byte 0x08, 0x0A, 0x00, 0x00

ov49_02269DFC: ; 0x02269DFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov49_02269E1C: ; 0x02269E1C
	.byte 0x1F, 0x20, 0x21, 0x22
	.byte 0x23, 0x28, 0x24, 0x25

ov49_02269E24: ; 0x02269E24
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov49_02269E44: ; 0x02269E44
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x05, 0x00, 0x07, 0x00
	.byte 0x01, 0x00, 0x09, 0x00, 0x20, 0x00, 0x02, 0x00, 0x20, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0F, 0x00
	.byte 0x20, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x0C, 0x00, 0x21, 0x00, 0x13, 0x00, 0x15, 0x00
	.byte 0x0C, 0x00, 0x17, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x14, 0x00, 0x22, 0x00, 0x19, 0x00
	.byte 0x0E, 0x00, 0x1B, 0x00, 0x10, 0x00, 0x08, 0x00, 0x10, 0x00, 0x16, 0x00, 0x1A, 0x00, 0x23, 0x00
	.byte 0x10, 0x00, 0x1D, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x12, 0x00, 0x0A, 0x00, 0x12, 0x00, 0x18, 0x00, 0x1C, 0x00, 0x1E, 0x00
	.byte 0x12, 0x00, 0x24, 0x00

ov49_02269EC4: ; 0x02269EC4
	.byte 0x28, 0x00

ov49_02269EC6: ; 0x02269EC6
	.byte 0x25, 0x02, 0x29, 0x00, 0x26, 0x02, 0x2B, 0x00, 0x27, 0x02
	.byte 0x2C, 0x00, 0x28, 0x02, 0x2E, 0x00, 0x2A, 0x02, 0x2F, 0x00, 0x2B, 0x02, 0x30, 0x00, 0x2C, 0x02
	.byte 0x31, 0x00, 0x2D, 0x02, 0x32, 0x00, 0x2E, 0x02, 0x33, 0x00, 0x2F, 0x02, 0x34, 0x00, 0x30, 0x02
	.byte 0x35, 0x00, 0x31, 0x02, 0x36, 0x00, 0x32, 0x02, 0x37, 0x00, 0x33, 0x02, 0x38, 0x00, 0x34, 0x02
	.byte 0x39, 0x00, 0x35, 0x02, 0x3A, 0x00, 0x36, 0x02, 0x3B, 0x00, 0x37, 0x02, 0x3C, 0x00, 0x38, 0x02
	.byte 0x3D, 0x00, 0x39, 0x02, 0x3E, 0x00, 0x3A, 0x02, 0x3F, 0x00, 0x3B, 0x02, 0x40, 0x00, 0x3C, 0x02
	.byte 0x55, 0x00, 0x3D, 0x02, 0x56, 0x00, 0x3E, 0x02, 0x57, 0x00, 0x3F, 0x02, 0x58, 0x00, 0x40, 0x02
	.byte 0x59, 0x00, 0x41, 0x02, 0x5A, 0x00, 0x42, 0x02, 0x5B, 0x00, 0x43, 0x02, 0x5C, 0x00, 0x44, 0x02
	.byte 0x5D, 0x00, 0x45, 0x02, 0x5E, 0x00, 0x46, 0x02, 0xEC, 0x00, 0x47, 0x02, 0xED, 0x00, 0x48, 0x02
	.byte 0xEE, 0x00, 0x49, 0x02, 0xEF, 0x00, 0x4A, 0x02, 0xF0, 0x00, 0x4B, 0x02, 0xF1, 0x00, 0x4C, 0x02
	.byte 0xF2, 0x00, 0x4D, 0x02, 0xF3, 0x00, 0x4E, 0x02, 0xF4, 0x00, 0x4F, 0x02, 0xF5, 0x00, 0x50, 0x02
	.byte 0xF6, 0x00, 0x51, 0x02, 0xF7, 0x00, 0x52, 0x02, 0xF8, 0x00, 0x53, 0x02, 0xF9, 0x00, 0x54, 0x02
	.byte 0xFA, 0x00, 0x55, 0x02, 0xFB, 0x00, 0x56, 0x02, 0xFC, 0x00, 0x57, 0x02, 0xFD, 0x00, 0x58, 0x02
	.byte 0xFE, 0x00, 0x59, 0x02, 0xFF, 0x00, 0x5A, 0x02, 0x00, 0x01, 0x5B, 0x02, 0x01, 0x01, 0x5C, 0x02
	.byte 0x02, 0x01, 0x5D, 0x02, 0x03, 0x01, 0x5E, 0x02, 0x04, 0x01, 0x5F, 0x02, 0x05, 0x01, 0x60, 0x02
	.byte 0x06, 0x01, 0x61, 0x02, 0x07, 0x01, 0x62, 0x02, 0x08, 0x01, 0x63, 0x02, 0x09, 0x01, 0x64, 0x02
	.byte 0x0A, 0x01, 0x65, 0x02, 0x0B, 0x01, 0x66, 0x02, 0x0C, 0x01, 0x67, 0x02, 0x0D, 0x01, 0x68, 0x02
	.byte 0x0E, 0x01, 0x69, 0x02, 0x0F, 0x01, 0x6A, 0x02, 0x10, 0x01, 0x6B, 0x02, 0x11, 0x01, 0x6C, 0x02
	.byte 0x12, 0x01, 0x6D, 0x02, 0x13, 0x01, 0x6E, 0x02, 0x64, 0x01, 0x6F, 0x02, 0x65, 0x01, 0x70, 0x02
	.byte 0x66, 0x01, 0x71, 0x02, 0x67, 0x01, 0x72, 0x02, 0x68, 0x01, 0x73, 0x02, 0x69, 0x01, 0x74, 0x02
	.byte 0x6A, 0x01, 0x75, 0x02, 0x6B, 0x01, 0x76, 0x02, 0x6C, 0x01, 0x77, 0x02, 0x6D, 0x01, 0x78, 0x02
	.byte 0x6E, 0x01, 0x79, 0x02, 0x6F, 0x01, 0x7A, 0x02, 0x70, 0x01, 0x7B, 0x02, 0x71, 0x01, 0x7C, 0x02
	.byte 0x72, 0x01, 0x7D, 0x02, 0x73, 0x01, 0x7E, 0x02, 0x74, 0x01, 0x7F, 0x02, 0x75, 0x01, 0x80, 0x02
	.byte 0x76, 0x01, 0x81, 0x02, 0x77, 0x01, 0x82, 0x02, 0x78, 0x01, 0x83, 0x02, 0x79, 0x01, 0x84, 0x02
	.byte 0x7A, 0x01, 0x85, 0x02, 0x7B, 0x01, 0x86, 0x02, 0x7C, 0x01, 0x87, 0x02, 0x7D, 0x01, 0x88, 0x02
	.byte 0x7E, 0x01, 0x89, 0x02, 0x7F, 0x01, 0x8A, 0x02, 0x80, 0x01, 0x8B, 0x02, 0x81, 0x01, 0x8C, 0x02
	.byte 0x82, 0x01, 0x8D, 0x02, 0x83, 0x01, 0x8E, 0x02, 0x84, 0x01, 0x8F, 0x02, 0x85, 0x01, 0x90, 0x02
	.byte 0x86, 0x01, 0x91, 0x02, 0x87, 0x01, 0x92, 0x02, 0x88, 0x01, 0x93, 0x02, 0x89, 0x01, 0x94, 0x02
	.byte 0x8A, 0x01, 0x95, 0x02, 0x8B, 0x01, 0x96, 0x02, 0x8C, 0x01, 0x97, 0x02, 0xDD, 0x01, 0x98, 0x02
	.byte 0xDE, 0x01, 0x99, 0x02, 0xDF, 0x01, 0x9A, 0x02, 0xE0, 0x01, 0x9B, 0x02, 0xE1, 0x01, 0x9C, 0x02
	.byte 0xE2, 0x01, 0x9D, 0x02, 0xE3, 0x01, 0x9E, 0x02, 0xE4, 0x01, 0x9F, 0x02, 0xE5, 0x01, 0xA0, 0x02
	.byte 0xE6, 0x01, 0xA1, 0x02, 0xFB, 0x01, 0xA2, 0x02, 0xFC, 0x01, 0xA3, 0x02, 0xFD, 0x01, 0xA4, 0x02
	.byte 0xFE, 0x01, 0xA5, 0x02, 0xFF, 0x01, 0xA6, 0x02, 0x00, 0x02, 0xA7, 0x02, 0x01, 0x02, 0x8D, 0x03
	.byte 0x02, 0x02, 0xA8, 0x02, 0xAB, 0x02, 0xAD, 0x02, 0xAC, 0x02, 0xAE, 0x02, 0xAF, 0x02, 0xB0, 0x02
	.byte 0x41, 0x00, 0xB1, 0x02, 0x42, 0x00, 0xB2, 0x02, 0x43, 0x00, 0xB3, 0x02, 0x44, 0x00, 0xB4, 0x02
	.byte 0x45, 0x00, 0xB5, 0x02, 0x46, 0x00, 0xB6, 0x02, 0x47, 0x00, 0xB7, 0x02, 0x48, 0x00, 0xB8, 0x02
	.byte 0x49, 0x00, 0xB9, 0x02, 0x4A, 0x00, 0xBA, 0x02, 0x4B, 0x00, 0xBB, 0x02, 0x4C, 0x00, 0xBC, 0x02
	.byte 0x4D, 0x00, 0xBD, 0x02, 0x4E, 0x00, 0xBE, 0x02, 0x4F, 0x00, 0xBF, 0x02, 0x50, 0x00, 0xC0, 0x02
	.byte 0x51, 0x00, 0xC1, 0x02, 0x52, 0x00, 0xC2, 0x02, 0x53, 0x00, 0xC3, 0x02, 0x54, 0x00, 0xC4, 0x02
	.byte 0x5F, 0x00, 0xC5, 0x02, 0x60, 0x00, 0xC6, 0x02, 0x61, 0x00, 0xC7, 0x02, 0x62, 0x00, 0xC8, 0x02
	.byte 0x63, 0x00, 0xC9, 0x02, 0x64, 0x00, 0xCA, 0x02, 0x65, 0x00, 0xCB, 0x02, 0x66, 0x00, 0xCC, 0x02
	.byte 0x67, 0x00, 0xCD, 0x02, 0x68, 0x00, 0xCE, 0x02, 0x69, 0x00, 0xCF, 0x02, 0x6A, 0x00, 0xD0, 0x02
	.byte 0x6B, 0x00, 0xD1, 0x02, 0x6C, 0x00, 0xD2, 0x02, 0x6D, 0x00, 0xD3, 0x02, 0x6E, 0x00, 0xD4, 0x02
	.byte 0x6F, 0x00, 0xD5, 0x02, 0x70, 0x00, 0xD6, 0x02, 0x71, 0x00, 0xD7, 0x02, 0x72, 0x00, 0xD8, 0x02
	.byte 0x14, 0x01, 0xD9, 0x02, 0x15, 0x01, 0xDA, 0x02, 0x16, 0x01, 0xDB, 0x02, 0x17, 0x01, 0xDC, 0x02
	.byte 0x18, 0x01, 0xDD, 0x02, 0x19, 0x01, 0xDE, 0x02, 0x1A, 0x01, 0xDF, 0x02, 0x1B, 0x01, 0xE0, 0x02
	.byte 0x1C, 0x01, 0xE1, 0x02, 0x1D, 0x01, 0xE2, 0x02, 0x1E, 0x01, 0xE3, 0x02, 0x1F, 0x01, 0xE4, 0x02
	.byte 0x20, 0x01, 0xE5, 0x02, 0x21, 0x01, 0xE6, 0x02, 0x22, 0x01, 0xE7, 0x02, 0x23, 0x01, 0xE8, 0x02
	.byte 0x24, 0x01, 0xE9, 0x02, 0x25, 0x01, 0xEA, 0x02, 0x26, 0x01, 0xEB, 0x02, 0x27, 0x01, 0xEC, 0x02
	.byte 0x28, 0x01, 0xED, 0x02, 0x29, 0x01, 0xEE, 0x02, 0x2A, 0x01, 0xEF, 0x02, 0x2B, 0x01, 0xF0, 0x02
	.byte 0x2C, 0x01, 0xF1, 0x02, 0x2D, 0x01, 0xF2, 0x02, 0x2E, 0x01, 0xF3, 0x02, 0x2F, 0x01, 0xF4, 0x02
	.byte 0x30, 0x01, 0xF5, 0x02, 0x31, 0x01, 0xF6, 0x02, 0x32, 0x01, 0xF7, 0x02, 0x33, 0x01, 0xF8, 0x02
	.byte 0x34, 0x01, 0xF9, 0x02, 0x35, 0x01, 0xFA, 0x02, 0x36, 0x01, 0xFB, 0x02, 0x37, 0x01, 0xFC, 0x02
	.byte 0x38, 0x01, 0xFD, 0x02, 0x39, 0x01, 0xFE, 0x02, 0x3A, 0x01, 0xFF, 0x02, 0x3B, 0x01, 0x00, 0x03
	.byte 0x3C, 0x01, 0x01, 0x03, 0x3D, 0x01, 0x02, 0x03, 0x3E, 0x01, 0x03, 0x03, 0x3F, 0x01, 0x04, 0x03
	.byte 0x40, 0x01, 0x05, 0x03, 0x41, 0x01, 0x06, 0x03, 0x42, 0x01, 0x07, 0x03, 0x43, 0x01, 0x08, 0x03
	.byte 0x44, 0x01, 0x09, 0x03, 0x45, 0x01, 0x0A, 0x03, 0x46, 0x01, 0x0B, 0x03, 0x47, 0x01, 0x0C, 0x03
	.byte 0x48, 0x01, 0x0D, 0x03, 0x49, 0x01, 0x0E, 0x03, 0x4A, 0x01, 0x0F, 0x03, 0x4B, 0x01, 0x10, 0x03
	.byte 0x4C, 0x01, 0x11, 0x03, 0x4D, 0x01, 0x12, 0x03, 0x4E, 0x01, 0x13, 0x03, 0x4F, 0x01, 0x14, 0x03
	.byte 0x50, 0x01, 0x15, 0x03, 0x51, 0x01, 0x16, 0x03, 0x52, 0x01, 0x17, 0x03, 0x53, 0x01, 0x18, 0x03
	.byte 0x54, 0x01, 0x19, 0x03, 0x55, 0x01, 0x1A, 0x03, 0x56, 0x01, 0x1B, 0x03, 0x57, 0x01, 0x1C, 0x03
	.byte 0x58, 0x01, 0x1D, 0x03, 0x59, 0x01, 0x1E, 0x03, 0x5A, 0x01, 0x1F, 0x03, 0x5B, 0x01, 0x20, 0x03
	.byte 0x5C, 0x01, 0x21, 0x03, 0x5D, 0x01, 0x22, 0x03, 0x5E, 0x01, 0x23, 0x03, 0x5F, 0x01, 0x24, 0x03
	.byte 0x60, 0x01, 0x25, 0x03, 0x61, 0x01, 0x26, 0x03, 0x62, 0x01, 0x27, 0x03, 0x63, 0x01, 0x28, 0x03
	.byte 0x8D, 0x01, 0x29, 0x03, 0x8E, 0x01, 0x2A, 0x03, 0x8F, 0x01, 0x2B, 0x03, 0x90, 0x01, 0x2C, 0x03
	.byte 0x91, 0x01, 0x2D, 0x03, 0x92, 0x01, 0x2E, 0x03, 0x93, 0x01, 0x2F, 0x03, 0x94, 0x01, 0x30, 0x03
	.byte 0x95, 0x01, 0x31, 0x03, 0x96, 0x01, 0x32, 0x03, 0x97, 0x01, 0x33, 0x03, 0x98, 0x01, 0x34, 0x03
	.byte 0x99, 0x01, 0x35, 0x03, 0x9A, 0x01, 0x36, 0x03, 0x9B, 0x01, 0x37, 0x03, 0x9C, 0x01, 0x38, 0x03
	.byte 0x9D, 0x01, 0x39, 0x03, 0x9E, 0x01, 0x3A, 0x03, 0x9F, 0x01, 0x3B, 0x03, 0xA0, 0x01, 0x3C, 0x03
	.byte 0xA1, 0x01, 0x3D, 0x03, 0xA2, 0x01, 0x3E, 0x03, 0xA3, 0x01, 0x3F, 0x03, 0xA4, 0x01, 0x40, 0x03
	.byte 0xA5, 0x01, 0x41, 0x03, 0xA6, 0x01, 0x42, 0x03, 0xA7, 0x01, 0x43, 0x03, 0xA8, 0x01, 0x44, 0x03
	.byte 0xA9, 0x01, 0x45, 0x03, 0xAA, 0x01, 0x46, 0x03, 0xAB, 0x01, 0x47, 0x03, 0xAC, 0x01, 0x48, 0x03
	.byte 0xAD, 0x01, 0x49, 0x03, 0xAE, 0x01, 0x4A, 0x03, 0xAF, 0x01, 0x4B, 0x03, 0xB0, 0x01, 0x4C, 0x03
	.byte 0xB1, 0x01, 0x4D, 0x03, 0xB2, 0x01, 0x4E, 0x03, 0xB3, 0x01, 0x4F, 0x03, 0xB4, 0x01, 0x50, 0x03
	.byte 0xB5, 0x01, 0x51, 0x03, 0xB6, 0x01, 0x52, 0x03, 0xB7, 0x01, 0x53, 0x03, 0xB8, 0x01, 0x54, 0x03
	.byte 0xB9, 0x01, 0x55, 0x03, 0xBA, 0x01, 0x56, 0x03, 0xBB, 0x01, 0x57, 0x03, 0xBC, 0x01, 0x58, 0x03
	.byte 0xBD, 0x01, 0x59, 0x03, 0xBE, 0x01, 0x5A, 0x03, 0xBF, 0x01, 0x5B, 0x03, 0xC0, 0x01, 0x5C, 0x03
	.byte 0xC1, 0x01, 0x5D, 0x03, 0xC2, 0x01, 0x5E, 0x03, 0xC3, 0x01, 0x5F, 0x03, 0xC4, 0x01, 0x60, 0x03
	.byte 0xC5, 0x01, 0x61, 0x03, 0xC6, 0x01, 0x62, 0x03, 0xC7, 0x01, 0x63, 0x03, 0xC8, 0x01, 0x64, 0x03
	.byte 0xC9, 0x01, 0x65, 0x03, 0xCA, 0x01, 0x66, 0x03, 0xCB, 0x01, 0x67, 0x03, 0xCC, 0x01, 0x68, 0x03
	.byte 0xCD, 0x01, 0x69, 0x03, 0xCE, 0x01, 0x6A, 0x03, 0xCF, 0x01, 0x6B, 0x03, 0xD0, 0x01, 0x6C, 0x03
	.byte 0xD1, 0x01, 0x6D, 0x03, 0xD2, 0x01, 0x6E, 0x03, 0xD3, 0x01, 0x6F, 0x03, 0xD4, 0x01, 0x70, 0x03
	.byte 0xD5, 0x01, 0x71, 0x03, 0xD6, 0x01, 0x72, 0x03, 0xD7, 0x01, 0x73, 0x03, 0xD8, 0x01, 0x74, 0x03
	.byte 0xD9, 0x01, 0x75, 0x03, 0xDA, 0x01, 0x76, 0x03, 0xDB, 0x01, 0x77, 0x03, 0xDC, 0x01, 0x78, 0x03
	.byte 0xE7, 0x01, 0x79, 0x03, 0xE8, 0x01, 0x7A, 0x03, 0xE9, 0x01, 0x7B, 0x03, 0xEA, 0x01, 0x7C, 0x03
	.byte 0xEB, 0x01, 0x7D, 0x03, 0xEC, 0x01, 0x7E, 0x03, 0xED, 0x01, 0x7F, 0x03, 0xEE, 0x01, 0x80, 0x03
	.byte 0xEF, 0x01, 0x81, 0x03, 0xF0, 0x01, 0x82, 0x03, 0xF1, 0x01, 0x83, 0x03, 0xF2, 0x01, 0x84, 0x03
	.byte 0xF3, 0x01, 0x85, 0x03, 0xF4, 0x01, 0x86, 0x03, 0xF5, 0x01, 0x87, 0x03, 0xF6, 0x01, 0x88, 0x03
	.byte 0xF7, 0x01, 0x89, 0x03, 0xF8, 0x01, 0x8A, 0x03, 0xF9, 0x01, 0x8B, 0x03, 0xFA, 0x01, 0x8C, 0x03

ov49_0226A450: ; 0x0226A450
	.byte 0x30, 0x54, 0x80, 0x00

ov49_0226A454: ; 0x0226A454
	.byte 0x00, 0x00, 0x00, 0x02, 0x18, 0x00, 0x02, 0x02

ov49_0226A45C: ; 0x0226A45C
	.byte 0x00, 0x00, 0x00, 0x02
	.byte 0x18, 0x00, 0x02, 0x02

ov49_0226A464: ; 0x0226A464
	.byte 0x00, 0x00, 0x00, 0x02, 0x18, 0x00, 0x02, 0x02

ov49_0226A46C: ; 0x0226A46C
	.byte 0x00, 0x00, 0x00, 0x03
	.byte 0x18, 0x00, 0x02, 0x03

ov49_0226A474: ; 0x0226A474
	.byte 0x00, 0x00, 0x00, 0x04, 0x14, 0x00, 0x02, 0x04

ov49_0226A47C: ; 0x0226A47C
	.byte 0x00, 0x00, 0x00, 0x02
	.byte 0x18, 0x00, 0x01, 0x02

ov49_0226A484: ; 0x0226A484
	.word ov49_022680B4
	.word ov49_02268230
	.word ov49_02268334
	.byte 0x02, 0x00, 0x38, 0x00, 0x0E, 0x00, 0x38, 0x00, 0x08, 0x00, 0x3C, 0x00

ov49_0226A49C: ; 0x0226A49C
	.byte 0x00, 0x00, 0x00, 0x03
	.byte 0x10, 0x00, 0x02, 0x03, 0x28, 0x00, 0x00, 0x03, 0x02, 0x00, 0x2C, 0x00, 0x0E, 0x00, 0x2C, 0x00
	.byte 0x08, 0x00, 0x30, 0x00

ov49_0226A4B4: ; 0x0226A4B4
	.byte 0x00, 0x00, 0x00, 0x04, 0x10, 0x00, 0x02, 0x04, 0x20, 0x00, 0x00, 0x04

ov49_0226A4C0: ; 0x0226A4C0
	.byte 0x00, 0x00, 0x00, 0x04, 0x10, 0x00, 0x02, 0x04, 0x23, 0x00, 0x00, 0x04

ov49_0226A4CC: ; 0x0226A4CC
	.word ov49_02267F94
	.word ov49_0226813C
	.word ov49_022682D4

ov49_0226A4D8: ; 0x0226A4D8
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0xFF, 0xFF
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xE0, 0xFE, 0xFF, 0x00, 0xE0, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0xFF, 0xFF

ov49_0226A508: ; 0x0226A508
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF, 0xFF
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x80, 0xFF, 0xFF
	.byte 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00

ov49_0226A538: ; 0x0226A538
	.word ov49_02266A88
	.word ov49_02266A88
	.word ov49_02266A88
	.word ov49_02266A88
	.word ov49_02266A88
	.word ov49_02266A88
	.word ov49_02266AB0
	.word ov49_02266AB0
	.word ov49_02266AB0
	.word ov49_02266678
	.word ov49_02266678
	.word ov49_02266678
	.word ov49_02266748
	.word ov49_02266754
	.word ov49_02266760
	.word ov49_0226676C
	.word ov49_0226676C
	.word ov49_0226676C
	.word ov49_02266820
	.word ov49_02266820
	.word ov49_02266820
	.word ov49_022669B0
	.word ov49_022669B0
	.word ov49_022669B0
	.word ov49_02266978
	.word ov49_02266978
	.word ov49_02266978

ov49_0226A5A4: ; 0x0226A5A4
	.word ov49_0226639C
	.word ov49_022663EC
	.word ov49_0226643C
	.word ov49_0226648C
	.word ov49_022664DC
	.word ov49_0226652C
	.word ov49_0226657C
	.word ov49_022665D0
	.word ov49_02266624
	.word ov49_02265C68
	.word ov49_02265C74
	.word ov49_02265C80
	.word ov49_02265CB0
	.word ov49_02265CB0
	.word ov49_02265CB0
	.word ov49_02265C8C
	.word ov49_02265C98
	.word ov49_02265CA4
	.word ov49_02265D10
	.word ov49_02265E54
	.word ov49_02266088
	.word ov49_02266378
	.word ov49_02266384
	.word ov49_02266390
	.word ov49_02266354
	.word ov49_02266360
	.word ov49_0226636C

ov49_0226A610: ; 0x0226A610
	.byte 0x9C, 0x05, 0x00, 0x00, 0x9D, 0x05, 0x00, 0x00, 0x9E, 0x05, 0x00, 0x00, 0xA2, 0x05, 0x00, 0x00
	.byte 0xA3, 0x05, 0x00, 0x00, 0xA4, 0x05, 0x00, 0x00, 0x9F, 0x05, 0x00, 0x00, 0xA0, 0x05, 0x00, 0x00
	.byte 0xA1, 0x05, 0x00, 0x00, 0xAA, 0x05, 0x00, 0x00, 0xAB, 0x05, 0x00, 0x00, 0xAC, 0x05, 0x00, 0x00
	.byte 0xB0, 0x05, 0x00, 0x00, 0xB1, 0x05, 0x00, 0x00, 0xB2, 0x05, 0x00, 0x00, 0xA5, 0x05, 0x00, 0x00
	.byte 0xA6, 0x05, 0x00, 0x00, 0xA7, 0x05, 0x00, 0x00, 0xB6, 0x05, 0x00, 0x00, 0xB7, 0x05, 0x00, 0x00
	.byte 0xB8, 0x05, 0x00, 0x00, 0xB9, 0x05, 0x00, 0x00, 0xBA, 0x05, 0x00, 0x00, 0xBB, 0x05, 0x00, 0x00
	.byte 0xA9, 0x05, 0x00, 0x00, 0xA9, 0x05, 0x00, 0x00

ov49_0226A678: ; 0x0226A678
	.byte 0xA9, 0x05, 0x00, 0x00

ov49_0226A67C: ; 0x0226A67C
	.byte 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00

ov49_0226A70C: ; 0x0226A70C
	.byte 0x00, 0x00, 0x00, 0x11
	.byte 0x00, 0x01, 0x00, 0x11, 0x00, 0x02, 0x00, 0x11, 0x01, 0x03, 0x01, 0x02, 0x01, 0x04, 0x01, 0x02
	.byte 0x01, 0x05, 0x01, 0x02, 0x01, 0x06, 0x03, 0x11, 0x01, 0x07, 0x03, 0x11, 0x01, 0x08, 0x03, 0x11

ov49_0226A730: ; 0x0226A730
	.byte 0x05, 0x0B, 0x06, 0x11

ov49_0226A734: ; 0x0226A734
	.byte 0x03, 0x09, 0x04, 0x11

ov49_0226A738: ; 0x0226A738
	.byte 0x04, 0x0A, 0x05, 0x11

ov49_0226A73C: ; 0x0226A73C
	.byte 0x06, 0x0C, 0x07, 0x11
	.byte 0x07, 0x0D, 0x08, 0x11, 0x08, 0x0E, 0x09, 0x11, 0x09, 0x0F, 0x0A, 0x11

ov49_0226A74C: ; 0x0226A74C
	.byte 0x0A, 0x10, 0x0B, 0x11

ov49_0226A750: ; 0x0226A750
	.byte 0x0B, 0x11, 0x0C, 0x11

ov49_0226A754: ; 0x0226A754
	.byte 0x0C, 0x12, 0x0D, 0x11, 0x02, 0x13, 0x11, 0x11, 0x02, 0x14, 0x11, 0x11
	.byte 0x02, 0x15, 0x11, 0x11, 0x02, 0x16, 0x11, 0x11, 0x02, 0x17, 0x11, 0x11, 0x02, 0x18, 0x11, 0x11
	.byte 0x02, 0x19, 0x11, 0x11, 0x02, 0x1A, 0x11, 0x11, 0x02, 0x1B, 0x11, 0x11, 0x02, 0x1C, 0x11, 0x11
	.byte 0x02, 0x1D, 0x11, 0x11, 0x02, 0x1E, 0x11, 0x11, 0x02, 0x1F, 0x11, 0x11, 0x02, 0x20, 0x11, 0x11
	.byte 0x02, 0x21, 0x11, 0x11, 0x02, 0x22, 0x11, 0x11, 0x02, 0x23, 0x11, 0x11, 0x02, 0x24, 0x11, 0x11
	.byte 0x0D, 0x25, 0x0E, 0x11, 0x0E, 0x26, 0x0F, 0x11

ov49_0226A7A8: ; 0x0226A7A8
	.byte 0x13, 0x14, 0x13, 0x14, 0x13, 0x14, 0x13, 0x14
	.byte 0x13, 0x14, 0x13, 0x14, 0x13, 0x14, 0x13, 0x14

ov49_0226A7B8: ; 0x0226A7B8
	.byte 0x13, 0x14, 0x15, 0x13, 0x1C, 0x1D, 0x1B, 0x19
	.byte 0x19, 0x1D, 0x14, 0x13, 0x1D, 0x1B, 0x17, 0x13

ov49_0226A7C8: ; 0x0226A7C8
	.byte 0x13, 0x14, 0x1F, 0x23, 0x20, 0x22, 0x1B, 0x1E
	.byte 0x24, 0x1D, 0x18, 0x21, 0x1E, 0x15, 0x22, 0x1F

ov49_0226A7D8: ; 0x0226A7D8
	.byte 0xCE, 0x39, 0x94, 0x52, 0xFF, 0x7F, 0x08, 0x21

ov49_0226A7E0: ; 0x0226A7E0
	.byte 0xF7, 0x66, 0x10, 0x42, 0xCE, 0x39, 0x94, 0x52, 0x10, 0x42, 0x4A, 0x41, 0x10, 0x42, 0xCE, 0x39
	.byte 0x94, 0x52, 0x10, 0x42, 0x08, 0x31, 0x10, 0x42, 0xCE, 0x39, 0x94, 0x52, 0x10, 0x42, 0xA5, 0x20
	.byte 0x10, 0x42, 0xAD, 0x39, 0x94, 0x52, 0x10, 0x42, 0x63, 0x1C, 0x10, 0x42, 0x4A, 0x31, 0x94, 0x52
	.byte 0xCE, 0x41, 0x00, 0x18, 0x10, 0x42, 0x08, 0x29, 0x94, 0x52, 0x8C, 0x41

ov49_0226A81C: ; 0x0226A81C
	.byte 0x04, 0x00, 0x00, 0x00

ov49_0226A820: ; 0x0226A820
	.byte 0x03, 0x00, 0x00, 0x00

ov49_0226A824: ; 0x0226A824
	.byte 0x0F, 0x10, 0x00, 0x00

ov49_0226A828: ; 0x0226A828
	.byte 0x09, 0x0A, 0x00, 0x00

ov49_0226A82C: ; 0x0226A82C
	.byte 0x0B, 0x0C, 0x00, 0x00

ov49_0226A830: ; 0x0226A830
	.byte 0x01, 0x02, 0x00, 0x00

ov49_0226A834: ; 0x0226A834
	.byte 0x05, 0x0D, 0x06, 0x07, 0x0E, 0x08, 0x00, 0x00

ov49_0226A83C: ; 0x0226A83C
	.byte 0x00

ov49_0226A83D: ; 0x0226A83D
	.byte 0x05, 0x01, 0x06
	.byte 0x02, 0x00, 0x03, 0x01, 0x04, 0x02, 0x05, 0x03, 0x06, 0x04, 0x00, 0x00

ov49_0226A84C: ; 0x0226A84C
	.word ov49_02268B04
	.word ov49_02268B04
	.word ov49_02268B08
	.word ov49_02268B0C
	.word ov49_02268B90
	.word ov49_02268C2C

ov49_0226A864: ; 0x0226A864
	.byte 0x0A, 0x00, 0x00, 0x00

ov49_0226A868: ; 0x0226A868
	.byte 0x00, 0x10, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00

ov49_0226A87C: ; 0x0226A87C
	.word ov49_02268CAC
	.word ov49_02268CAC
	.word ov49_02268CBC
	.word ov49_02268CCC
	.word ov49_02268CDC
	.word ov49_02268CEC

ov49_0226A894: ; 0x0226A894
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov49_0226A8B4: ; 0x0226A8B4
	.byte 0x06, 0x0D, 0x05, 0x0B, 0x07, 0x0E, 0x08, 0x0C, 0x01, 0x00, 0x02, 0x0A
	.byte 0x10, 0x09, 0x04, 0x03, 0x0F, 0x00, 0x00, 0x00

ov49_0226A8C8: ; 0x0226A8C8
	.byte 0x3F, 0x3E, 0x3D, 0x00

ov49_0226A8CC: ; 0x0226A8CC
	.word ov49_022694B4
	.word ov49_022694B4

ov49_0226A8D4: ; 0x0226A8D4
	.word ov49_02269474
	.word ov49_02269494

ov49_0226A8DC: ; 0x0226A8DC
	.byte 0xFF, 0x00, 0x06, 0x00
	.byte 0xFE, 0xFF, 0xCB, 0x05, 0xCE, 0x05, 0xC5, 0x05, 0x89, 0x01, 0x82, 0x00, 0xCB, 0x05, 0xCD, 0x05
	.byte 0xCF, 0x05, 0xCB, 0x05, 0x19, 0x00, 0xCE, 0x01, 0xFE, 0xFF, 0xCB, 0x05, 0xFE, 0xFF, 0xD0, 0x05
	.byte 0x01, 0x00, 0xC7, 0x01, 0xD1, 0x05, 0xCC, 0x05, 0xC5, 0x05, 0xCB, 0x05, 0x97, 0x00, 0x97, 0x00
	.byte 0xFE, 0xFF, 0xCB, 0x05, 0xD2, 0x05, 0xCB, 0x05
	; 0x0226A918
