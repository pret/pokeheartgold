	.include "asm/macros.inc"
	.include "overlay_80_0222FD08.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_0222FD08
ov80_0222FD08: ; 0x0222FD08
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r4, r0, #0
	ldr r1, _0222FED4 ; =0x00000708
	mov r0, #0xb
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	ldr r1, _0222FED8 ; =_0223DD40
	ldr r2, _0222FED4 ; =0x00000708
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r5, [r0]
	add r0, r4, #0
	bl sub_0203094C
	ldr r1, _0222FEDC ; =0x000004F4
	str r0, [r5, r1]
	add r0, r1, #4
	str r4, [r5, r0]
	mov r0, #0xb
	ldr r1, _0222FED8 ; =_0223DD40
	str r0, [r5]
	ldr r5, [r1]
	bl SaveArray_Party_Alloc
	ldr r1, _0222FEE0 ; =0x000004D4
	str r0, [r5, r1]
	mov r0, #0xb
	bl SaveArray_Party_Alloc
	ldr r1, _0222FEE4 ; =0x000004D8
	str r0, [r5, r1]
	add r1, #0x1c
	add r0, r4, #0
	ldr r5, [r5, r1]
	bl sub_02030AE8
	add r4, r0, #0
	cmp r6, #0
	bne _0222FE1A
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r1, [r0]
	strb r7, [r1, #4]
	ldr r0, [sp]
	strb r0, [r1, #5]
	mov r0, #0
	strb r0, [r1, #6]
	add r0, r5, #0
	bl sub_02030940
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r2, [r0]
	ldrb r3, [r2, #4]
	cmp r3, #3
	bne _0222FD8E
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r2, r0]
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_GetVar4052
	b _0222FDA2
_0222FD8E:
	ldrb r2, [r2, #5]
	add r0, r4, #0
	mov r1, #0xa
	lsl r2, r2, #2
	add r2, r3, r2
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030AD4
_0222FDA2:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _0222FE0A
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r5, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	strh r0, [r5, #0xc]
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r4, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r4, r0]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl sub_0205C048
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	b _0222FE12
_0222FE0A:
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r4, [r0]
	mov r0, #0
	strh r0, [r4, #0xc]
_0222FE12:
	strh r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x10]
	b _0222FEA8
_0222FE1A:
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl sub_02030A24
	ldr r1, _0222FED8 ; =_0223DD40
	ldr r4, [r1]
	mov r1, #0
	strb r0, [r4, #4]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030A24
	mov r2, #0
	strb r0, [r4, #5]
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl sub_02030A24
	strb r0, [r4, #6]
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r5, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	add r7, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl sub_0205BFF0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	strh r0, [r5, #0xc]
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r4, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r4, r0]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl sub_0205C048
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	strh r0, [r4, #8]
_0222FEA8:
	ldr r0, _0222FED8 ; =_0223DD40
	mov r1, #7
	ldr r4, [r0]
	ldrh r0, [r4, #0xc]
	bl _s32_div_f
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	bl ov80_02237254
	cmp r0, #1
	bne _0222FECC
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r1, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r1, r0]
	bl ov80_0222A840
_0222FECC:
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r0, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FED4: .word 0x00000708
_0222FED8: .word _0223DD40
_0222FEDC: .word 0x000004F4
_0222FEE0: .word 0x000004D4
_0222FEE4: .word 0x000004D8
_0222FEE8: .word 0x000004F8
	thumb_func_end ov80_0222FD08

	thumb_func_start ov80_0222FEEC
ov80_0222FEEC: ; 0x0222FEEC
	push {r3, lr}
	cmp r1, #0
	bne _0222FEF8
	bl ov80_0222FF00
	pop {r3, pc}
_0222FEF8:
	bl ov80_02230270
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222FEEC

	thumb_func_start ov80_0222FF00
ov80_0222FF00: ; 0x0222FF00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0xd8
	add r4, r0, #0
	bl ov80_022372B4
	add r1, r0, #0
	add r2, r4, #0
	ldrb r0, [r4, #4]
	add r2, #0x18
	mov r3, #0xe
	bl ov80_02236BE4
	add r0, r4, #0
	bl ov80_022372B4
	mov r3, #0x26
	lsl r3, r3, #4
	add r1, r4, r3
	str r1, [sp]
	add r1, r3, #0
	add r2, r3, #0
	add r1, #8
	add r1, r4, r1
	str r1, [sp, #4]
	ldrh r1, [r4, #8]
	sub r2, #0xc
	add r3, #0x20
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #5]
	add r2, r4, r2
	add r3, r4, r3
	bl ov80_02236E24
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov80_022300D4
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl ov80_022300D4
	mov r0, #6
	str r0, [sp, #0x18]
	mov r0, #0
	mov ip, r0
	add r3, r4, #0
	add r5, sp, #0x34
_0222FF6A:
	mov r0, #0xa
	lsl r0, r0, #6
	add r2, r3, r0
	add r7, r5, #0
	mov r6, #7
_0222FF74:
	ldmia r2!, {r0, r1}
	stmia r7!, {r0, r1}
	sub r6, r6, #1
	bne _0222FF74
	mov r0, ip
	add r0, r0, #1
	add r3, #0x38
	add r5, #0x38
	mov ip, r0
	cmp r0, #6
	blt _0222FF6A
	ldrb r0, [r4, #4]
	bl ov80_02237254
	cmp r0, #1
	bne _02230038
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r7, _022300C4 ; =0x00000282
	mov r5, #0
	add r0, r4, r0
	add r1, sp, #0x28
	add r2, r4, #0
	add r3, sp, #0x1c
_0222FFA4:
	ldrh r6, [r0]
	add r5, r5, #1
	add r0, #0x38
	lsl r6, r6, #0x15
	lsr r6, r6, #0x15
	strh r6, [r1]
	ldrh r6, [r2, r7]
	add r1, r1, #2
	add r2, #0x38
	strh r6, [r3]
	add r3, r3, #2
	cmp r5, #6
	blt _0222FFA4
	add r0, r4, #0
	bl ov80_022372B4
	mov r3, #0x59
	lsl r3, r3, #4
	add r1, r4, r3
	str r1, [sp]
	add r1, r3, #0
	add r1, #8
	add r1, r4, r1
	str r1, [sp, #4]
	add r1, r3, #0
	add r2, r3, #0
	sub r1, #0x10
	ldrh r1, [r4, r1]
	sub r2, #0xc
	add r3, #0x20
	str r1, [sp, #8]
	add r1, sp, #0x28
	str r1, [sp, #0xc]
	add r1, sp, #0x1c
	str r1, [sp, #0x10]
	ldrb r1, [r4, #5]
	add r2, r4, r2
	add r3, r4, r3
	bl ov80_02236E24
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	bl ov80_022300D4
	add r0, r4, #0
	mov r1, #5
	mov r2, #1
	bl ov80_022300D4
	mov r0, #0xc
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x14]
	add r5, r4, #0
	add r6, sp, #0x34
_02230014:
	mov r0, #0x5b
	lsl r0, r0, #4
	add r3, r5, r0
	mov r0, #0x15
	lsl r0, r0, #4
	add r2, r6, r0
	mov r7, #7
_02230022:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _02230022
	ldr r0, [sp, #0x14]
	add r5, #0x38
	add r0, r0, #1
	add r6, #0x38
	str r0, [sp, #0x14]
	cmp r0, #6
	blt _02230014
_02230038:
	ldrb r0, [r4, #4]
	mov r1, #1
	bl ov80_02236DF8
	ldr r2, _022300C8 ; =0x000003D2
	add r3, sp, #0x34
	add r1, r4, r2
	str r1, [sp]
	add r1, r2, #0
	add r1, #0x1e
	add r1, r4, r1
	str r1, [sp, #4]
	add r1, r2, #0
	add r1, #8
	add r1, r4, r1
	add r2, #0xe
	str r1, [sp, #8]
	add r1, r4, r2
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #5]
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	bl ov80_02236E90
	mov r0, #0xa
	lsl r0, r0, #6
	mov r7, #0
	add r6, r4, r0
_02230078:
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov80_0222A140
	ldr r0, _022300CC ; =0x000004F8
	ldr r1, _022300D0 ; =0x000004D4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl ov80_0222A3BC
	add r0, r5, #0
	bl FreeToHeap
	add r7, r7, #1
	add r6, #0x38
	cmp r7, #6
	blt _02230078
	ldr r6, _022300D0 ; =0x000004D4
	mov r5, #0
_022300B0:
	ldr r0, [r4, r6]
	add r1, r5, #0
	bl Party_GetMonByIndex
	add r5, r5, #1
	cmp r5, #6
	blt _022300B0
	add sp, #0x1fc
	add sp, #0xd8
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022300C4: .word 0x00000282
_022300C8: .word 0x000003D2
_022300CC: .word 0x000004F8
_022300D0: .word 0x000004D4
	thumb_func_end ov80_0222FF00

	thumb_func_start ov80_022300D4
ov80_022300D4: ; 0x022300D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xdc
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl LCRandom
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	cmp r6, #0
	bne _022301B0
	mov r0, #0x95
	lsl r0, r0, #2
	add r1, r4, r0
	lsl r3, r5, #1
	str r1, [sp, #0x5c]
	ldrh r1, [r1, r3]
	str r3, [sp, #0x20]
	add r6, sp, #0xa4
	str r1, [sp, #0x1c]
	add r1, r0, #0
	add r1, #0xc
	add r1, r4, r1
	str r1, [sp, #0x24]
	ldrb r1, [r1, r5]
	mov r7, #7
	str r1, [sp, #0x18]
	add r1, r0, #0
	add r1, #0x14
	add r1, r4, r1
	str r1, [sp, #0x28]
	lsl r1, r5, #2
	ldr r3, [sp, #0x28]
	str r1, [sp, #0x2c]
	ldr r1, [r3, r1]
	add r0, #0x2c
	str r1, [sp, #0x14]
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r5
	add r0, r1, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0x30]
_02230130:
	ldr r3, [sp, #0x30]
	sub r7, r7, #1
	ldmia r3!, {r0, r1}
	str r3, [sp, #0x30]
	stmia r6!, {r0, r1}
	bne _02230130
	mov r0, #0x95
	lsl r0, r0, #2
	add r1, r4, r0
	str r1, [sp, #0x34]
	ldr r3, [sp, #0x34]
	lsl r1, r2, #1
	ldrh r6, [r3, r1]
	str r1, [sp, #0x38]
	ldr r3, [sp, #0x20]
	ldr r1, [sp, #0x5c]
	strh r6, [r1, r3]
	add r1, r0, #0
	add r1, #0xc
	add r1, r4, r1
	ldrb r3, [r1, r2]
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x24]
	strb r3, [r1, r5]
	add r1, r0, #0
	add r1, #0x14
	add r7, r4, r1
	lsl r1, r2, #2
	str r1, [sp, #0x60]
	ldr r5, [r7, r1]
	ldr r3, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	add r0, #0x2c
	str r5, [r3, r1]
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r2
	add r6, r1, r0
	add r5, r6, #0
	mov r4, #7
_02230180:
	ldr r3, [sp, #0x10]
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	str r3, [sp, #0x10]
	sub r4, r4, #1
	bne _02230180
	ldr r3, [sp, #0x1c]
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x38]
	strh r3, [r1, r0]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x3c]
	add r3, sp, #0xa4
	strb r1, [r0, r2]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x60]
	mov r2, #7
	str r1, [r7, r0]
_022301A4:
	ldmia r3!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r2, r2, #1
	bne _022301A4
	add sp, #0xdc
	pop {r4, r5, r6, r7, pc}
_022301B0:
	ldr r0, _0223026C ; =0x00000584
	lsl r3, r5, #1
	add r1, r4, r0
	str r1, [sp, #0x64]
	ldrh r1, [r1, r3]
	str r3, [sp, #0x40]
	add r6, sp, #0x6c
	str r1, [sp, #8]
	add r1, r0, #0
	add r1, #0xc
	add r1, r4, r1
	str r1, [sp, #0x44]
	ldrb r1, [r1, r5]
	mov r7, #7
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0x14
	add r1, r4, r1
	str r1, [sp, #0x48]
	lsl r1, r5, #2
	ldr r3, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [r3, r1]
	add r0, #0x2c
	str r1, [sp]
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r5
	add r0, r1, r0
	str r0, [sp, #0xc]
	str r0, [sp, #0x50]
_022301EE:
	ldr r3, [sp, #0x50]
	sub r7, r7, #1
	ldmia r3!, {r0, r1}
	str r3, [sp, #0x50]
	stmia r6!, {r0, r1}
	bne _022301EE
	ldr r3, _0223026C ; =0x00000584
	add r0, r4, r3
	str r0, [sp, #0x54]
	ldr r1, [sp, #0x54]
	lsl r0, r2, #1
	ldrh r6, [r1, r0]
	str r0, [sp, #0x58]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x64]
	strh r6, [r0, r1]
	add r0, r3, #0
	add r0, #0xc
	add r0, r4, r0
	ldrb r1, [r0, r2]
	mov ip, r0
	ldr r0, [sp, #0x44]
	strb r1, [r0, r5]
	add r0, r3, #0
	add r0, #0x14
	add r7, r4, r0
	lsl r0, r2, #2
	str r0, [sp, #0x68]
	ldr r5, [r7, r0]
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x4c]
	add r3, #0x2c
	str r5, [r1, r0]
	mov r0, #0x38
	add r1, r4, r3
	mul r0, r2
	add r5, r1, r0
	add r6, r5, #0
	mov r4, #7
_0223023C:
	ldr r3, [sp, #0xc]
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	str r3, [sp, #0xc]
	sub r4, r4, #1
	bne _0223023C
	ldr r3, [sp, #8]
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0x58]
	strh r3, [r1, r0]
	ldr r1, [sp, #4]
	mov r0, ip
	strb r1, [r0, r2]
	ldr r1, [sp]
	ldr r0, [sp, #0x68]
	add r3, sp, #0x6c
	str r1, [r7, r0]
	mov r2, #7
_02230260:
	ldmia r3!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r2, r2, #1
	bne _02230260
	add sp, #0xdc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223026C: .word 0x00000584
	thumb_func_end ov80_022300D4

	thumb_func_start ov80_02230270
ov80_02230270: ; 0x02230270
	push {r4, r5, r6, r7, lr}
	sub sp, #0x19c
	add r5, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	ldr r7, _0223040C ; =0x000004F4
	mov r4, #0
	add r6, r5, #0
_02230282:
	lsl r2, r4, #0x18
	ldr r0, [r5, r7]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strh r0, [r6, #0x18]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #0xe
	blt _02230282
	add r0, sp, #0x28
	mov r4, #0
	add r6, sp, #0x40
	str r0, [sp, #0x14]
	add r7, sp, #0x20
	str r5, [sp, #0x10]
_022302A6:
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strh r0, [r6]
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #6
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	ldr r1, [sp, #0x14]
	lsl r2, r4, #0x18
	str r0, [r1]
	ldr r0, _0223040C ; =0x000004F4
	mov r1, #5
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strb r0, [r7]
	ldrh r2, [r6]
	ldr r1, [sp, #0x10]
	ldr r0, _02230410 ; =0x000004E8
	add r4, r4, #1
	strh r2, [r1, r0]
	ldr r0, [sp, #0x14]
	add r6, r6, #2
	add r0, r0, #4
	str r0, [sp, #0x14]
	add r0, r1, #0
	add r0, r0, #2
	add r7, r7, #1
	str r0, [sp, #0x10]
	cmp r4, #4
	blt _022302A6
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x4c
	add r1, sp, #0x40
	add r2, sp, #0x20
	add r3, sp, #0x28
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r7, #0
	add r4, sp, #0x4c
_02230324:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _02230414 ; =0x000004F8
	ldr r1, _02230418 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #4
	blt _02230324
	add r0, r6, #0
	bl FreeToHeap
	add r0, sp, #0x28
	mov r4, #0
	add r6, sp, #0x40
	str r0, [sp, #0x1c]
	add r7, sp, #0x20
	str r5, [sp, #0x18]
_0223035C:
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #7
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strh r0, [r6]
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #9
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	ldr r1, [sp, #0x1c]
	lsl r2, r4, #0x18
	str r0, [r1]
	ldr r0, _0223040C ; =0x000004F4
	mov r1, #8
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strb r0, [r7]
	ldrh r2, [r6]
	ldr r1, [sp, #0x18]
	ldr r0, _0223041C ; =0x000003D2
	add r4, r4, #1
	strh r2, [r1, r0]
	ldr r0, [sp, #0x1c]
	add r6, r6, #2
	add r0, r0, #4
	str r0, [sp, #0x1c]
	add r0, r1, #0
	add r0, r0, #2
	add r7, r7, #1
	str r0, [sp, #0x18]
	cmp r4, #4
	blt _0223035C
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x4c
	add r1, sp, #0x40
	add r2, sp, #0x20
	add r3, sp, #0x28
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r7, #0
	add r4, sp, #0x4c
_022303DA:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _02230414 ; =0x000004F8
	ldr r1, _02230420 ; =0x000004D8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #4
	blt _022303DA
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x19c
	pop {r4, r5, r6, r7, pc}
	nop
_0223040C: .word 0x000004F4
_02230410: .word 0x000004E8
_02230414: .word 0x000004F8
_02230418: .word 0x000004D4
_0223041C: .word 0x000003D2
_02230420: .word 0x000004D8
	thumb_func_end ov80_02230270

	thumb_func_start ov80_02230424
ov80_02230424: ; 0x02230424
	push {r4, lr}
	add r4, r0, #0
	beq _02230452
	ldr r0, _02230454 ; =0x000004D4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02230436
	bl FreeToHeap
_02230436:
	ldr r0, _02230458 ; =0x000004D8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02230442
	bl FreeToHeap
_02230442:
	ldr r2, _0223045C ; =0x00000708
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_02230452:
	pop {r4, pc}
	.balign 4, 0
_02230454: .word 0x000004D4
_02230458: .word 0x000004D8
_0223045C: .word 0x00000708
	thumb_func_end ov80_02230424

	thumb_func_start ov80_02230460
ov80_02230460: ; 0x02230460
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02230480 ; =0x000004DC
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0223046A:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov80_02230484
	strh r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #6
	blt _0223046A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230480: .word 0x000004DC
	thumb_func_end ov80_02230460

	thumb_func_start ov80_02230484
ov80_02230484: ; 0x02230484
	push {r3, lr}
	cmp r1, #6
	blo _02230492
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02230492:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x10]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02230484

	thumb_func_start ov80_0223049C
ov80_0223049C: ; 0x0223049C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _02230768 ; =0x000004F8
	add r6, r1, #0
	ldr r0, [r5, r0]
	bl sub_02030AE8
	str r0, [sp]
	ldr r0, _02230768 ; =0x000004F8
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	ldrb r0, [r5, #4]
	mov r1, #1
	bl ov80_02236DF8
	ldrb r1, [r5, #5]
	add r0, sp, #4
	add r3, sp, #0xc
	strb r1, [r0, #8]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02030978
	ldrb r1, [r5, #4]
	add r0, sp, #4
	mov r2, #0
	strb r1, [r0, #8]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #1
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl sub_02030978
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02030964
	ldrb r1, [r5, #6]
	add r0, sp, #4
	mov r2, #0
	strb r1, [r0, #8]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #2
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl sub_02030978
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02031108
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02031108
	cmp r6, #2
	beq _02230648
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0203126C
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020310BC
	ldrh r1, [r5, #0xc]
	cmp r1, r6
	bne _022305E2
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0203126C
	b _02230608
_022305E2:
	cmp r6, r0
	bhs _02230608
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02031108
_02230608:
	ldrb r1, [r5, #0xa]
	add r0, sp, #4
	strb r1, [r0, #8]
	ldrb r2, [r5, #5]
	ldrb r3, [r5, #4]
	ldr r0, [sp]
	lsl r2, r2, #2
	add r2, r3, r2
	lsl r2, r2, #0x18
	mov r1, #0xa
	lsr r2, r2, #0x18
	add r3, sp, #0xc
	bl sub_02030AA4
	ldrb r0, [r5, #4]
	cmp r0, #3
	bne _02230648
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _02230634
	mov r6, #0x66
	b _02230636
_02230634:
	mov r6, #0x68
_02230636:
	add r0, r6, #0
	bl sub_0205C268
	add r2, r0, #0
	ldrb r3, [r5, #0xa]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02031108
_02230648:
	ldr r7, _0223076C ; =0x000004F4
	mov r4, #0
	add r6, sp, #4
_0223064E:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x18]
	lsl r2, r4, #0x18
	mov r1, #3
	strh r0, [r6]
	ldr r0, [r5, r7]
	lsr r2, r2, #0x18
	add r3, sp, #4
	bl sub_02030978
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0xe
	blo _0223064E
	ldr r0, _02230770 ; =0x000004D4
	ldr r0, [r5, r0]
	bl Party_GetCount
	add r7, r0, #0
	ldr r4, _02230774 ; =0x00000000
	beq _022306E8
_0223067C:
	ldr r0, _02230770 ; =0x000004D4
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl Party_GetMonByIndex
	add r6, r0, #0
	lsl r0, r4, #1
	add r1, r5, r0
	ldr r0, _02230778 ; =0x000004E8
	lsl r2, r4, #0x18
	ldrh r1, [r1, r0]
	add r0, sp, #4
	lsr r2, r2, #0x18
	strh r1, [r0]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #4
	ldr r0, [r5, r0]
	add r3, sp, #4
	bl sub_02030978
	add r0, r6, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	add r1, sp, #4
	strb r0, [r1, #8]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #5
	lsr r2, r2, #0x18
	add r3, sp, #0xc
	bl sub_02030978
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x10]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #6
	lsr r2, r2, #0x18
	add r3, sp, #0x10
	bl sub_02030978
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r7
	blo _0223067C
_022306E8:
	ldr r0, _0223077C ; =0x000004D8
	ldr r0, [r5, r0]
	bl Party_GetCount
	add r7, r0, #0
	ldr r4, _02230774 ; =0x00000000
	beq _02230762
_022306F6:
	ldr r0, _0223077C ; =0x000004D8
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl Party_GetMonByIndex
	add r6, r0, #0
	lsl r0, r4, #1
	add r1, r5, r0
	ldr r0, _02230780 ; =0x000003D2
	lsl r2, r4, #0x18
	ldrh r1, [r1, r0]
	add r0, sp, #4
	lsr r2, r2, #0x18
	strh r1, [r0]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #7
	ldr r0, [r5, r0]
	add r3, sp, #4
	bl sub_02030978
	add r0, r6, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	add r1, sp, #4
	strb r0, [r1, #8]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #8
	lsr r2, r2, #0x18
	add r3, sp, #0xc
	bl sub_02030978
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x10]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #9
	lsr r2, r2, #0x18
	add r3, sp, #0x10
	bl sub_02030978
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r7
	blo _022306F6
_02230762:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230768: .word 0x000004F8
_0223076C: .word 0x000004F4
_02230770: .word 0x000004D4
_02230774: .word 0x00000000
_02230778: .word 0x000004E8
_0223077C: .word 0x000004D8
_02230780: .word 0x000003D2
	thumb_func_end ov80_0223049C

	thumb_func_start ov80_02230784
ov80_02230784: ; 0x02230784
	ldrb r1, [r0, #6]
	add r1, r1, #1
	strb r1, [r0, #6]
	ldrb r0, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02230784

	thumb_func_start ov80_02230790
ov80_02230790: ; 0x02230790
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end ov80_02230790

	thumb_func_start ov80_02230794
ov80_02230794: ; 0x02230794
	push {r4, lr}
	sub sp, #0x30
	add r2, r0, #0
	ldrb r4, [r2, #6]
	mov r3, #7
	mul r3, r1
	add r1, r4, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x17
	add r1, r2, r1
	ldrh r1, [r1, #0x18]
	add r0, sp, #0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov80_02230794

	thumb_func_start ov80_022307C8
ov80_022307C8: ; 0x022307C8
	ldr r3, _022307D0 ; =ov80_0223049C
	mov r1, #1
	bx r3
	nop
_022307D0: .word ov80_0223049C
	thumb_func_end ov80_022307C8

	thumb_func_start ov80_022307D4
ov80_022307D4: ; 0x022307D4
	mov r1, #1
	strb r1, [r0, #0xa]
	ldrh r1, [r0, #0xe]
	cmp r1, #8
	bhs _022307E2
	add r1, r1, #1
	strh r1, [r0, #0xe]
_022307E2:
	ldr r3, _022307EC ; =ov80_0223049C
	mov r1, #0
	strb r1, [r0, #6]
	bx r3
	nop
_022307EC: .word ov80_0223049C
	thumb_func_end ov80_022307D4

	thumb_func_start ov80_022307F0
ov80_022307F0: ; 0x022307F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	mov r1, #1
	bl ov80_02236DF8
	str r0, [sp]
	ldr r0, _022308B0 ; =0x000004D4
	ldr r0, [r5, r0]
	bl SaveArray_Party_Init
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp, #4]
	mov r7, #0
	cmp r0, #0
	ble _0223086E
	mov r0, #0xa
	lsl r0, r0, #6
	add r0, r5, r0
	add r4, r5, #0
	str r0, [sp, #8]
_0223082A:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	ldr r0, _022308B4 ; =0x000004DC
	mov r1, #0x38
	ldrh r0, [r4, r0]
	mul r1, r0
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022308B8 ; =0x000004F8
	ldr r1, _022308B0 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	ldr r0, _022308B4 ; =0x000004DC
	add r7, r7, #1
	ldrh r0, [r4, r0]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	ldr r0, _022308BC ; =0x000004E8
	strh r1, [r4, r0]
	ldr r0, [sp, #4]
	add r4, r4, #2
	cmp r7, r0
	blt _0223082A
_0223086E:
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	ble _022308A4
	mov r0, #0x3f
	lsl r0, r0, #4
	add r4, r5, r0
_0223087C:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022308B8 ; =0x000004F8
	ldr r1, _022308C0 ; =0x000004D8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	ldr r0, [sp]
	add r7, r7, #1
	add r4, #0x38
	cmp r7, r0
	blt _0223087C
_022308A4:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022308B0: .word 0x000004D4
_022308B4: .word 0x000004DC
_022308B8: .word 0x000004F8
_022308BC: .word 0x000004E8
_022308C0: .word 0x000004D8
	thumb_func_end ov80_022307F0

	thumb_func_start ov80_022308C4
ov80_022308C4: ; 0x022308C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	mov r1, #0
	add r5, r0, #0
	add r2, sp, #0x3c
	add r3, sp, #0x2c
	add r0, r1, #0
_022308D2:
	add r1, r1, #1
	strh r0, [r2]
	strh r0, [r3]
	add r2, r2, #2
	add r3, r3, #2
	cmp r1, #8
	blt _022308D2
	ldrb r0, [r5, #4]
	mov r1, #1
	bl ov80_02236DF8
	str r0, [sp, #0x1c]
	ldr r0, _022309EC ; =0x000004D4
	ldr r0, [r5, r0]
	bl Party_GetCount
	mov r7, #0
	str r0, [sp, #0x20]
	cmp r0, #0
	ble _0223092C
	add r6, sp, #0x3c
	add r4, sp, #0x2c
_022308FE:
	ldr r0, _022309EC ; =0x000004D4
	add r1, r7, #0
	ldr r0, [r5, r0]
	bl Party_GetMonByIndex
	str r0, [sp, #0x24]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	ldr r0, [sp, #0x24]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	ldr r0, [sp, #0x20]
	add r7, r7, #1
	add r6, r6, #2
	add r4, r4, #2
	cmp r7, r0
	blt _022308FE
_0223092C:
	ldr r0, _022309F0 ; =0x000004D8
	ldr r0, [r5, r0]
	bl Party_GetCount
	mov r7, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _0223098A
	ldr r0, [sp, #0x20]
	str r5, [sp, #0x18]
	lsl r1, r0, #1
	add r0, sp, #0x3c
	add r6, r0, r1
	add r0, sp, #0x2c
	add r4, r0, r1
_0223094A:
	ldr r0, _022309F0 ; =0x000004D8
	add r1, r7, #0
	ldr r0, [r5, r0]
	bl Party_GetMonByIndex
	str r0, [sp, #0x28]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	ldr r0, [sp, #0x28]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	ldr r1, [sp, #0x18]
	ldr r0, _022309F4 ; =0x000003D2
	add r7, r7, #1
	ldrh r2, [r1, r0]
	mov r0, #0x95
	lsl r0, r0, #2
	strh r2, [r1, r0]
	add r0, r1, #0
	add r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r6, r6, #2
	add r4, r4, #2
	cmp r7, r0
	blt _0223094A
_0223098A:
	ldrb r0, [r5, #6]
	ldrb r1, [r5, #5]
	lsl r0, r0, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x18]
	bl ov80_02236C2C
	ldr r1, _022309F4 ; =0x000003D2
	ldr r3, [sp, #0x20]
	add r2, r5, r1
	str r2, [sp]
	mov r2, #0xb
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	ldr r2, [sp, #0x14]
	add r1, #8
	str r0, [sp, #0xc]
	add r0, r5, r1
	str r0, [sp, #0x10]
	add r2, r3, r2
	ldr r3, [sp, #0x1c]
	add r0, sp, #0x3c
	add r1, sp, #0x2c
	bl ov80_02236C9C
	mov r2, #0x3e
	lsl r2, r2, #4
	add r0, r5, r2
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	add r1, r2, #0
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, r2, #0
	add r0, #0x10
	sub r1, #0xe
	sub r2, r2, #6
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, r2
	mov r3, #0
	bl ov80_0222A52C
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022309EC: .word 0x000004D4
_022309F0: .word 0x000004D8
_022309F4: .word 0x000003D2
	thumb_func_end ov80_022308C4

	thumb_func_start ov80_022309F8
ov80_022309F8: ; 0x022309F8
	push {r4, lr}
	ldr r1, _02230A50 ; =0x000004DC
	add r4, r0, #0
	ldrh r0, [r4, r1]
	cmp r0, #0xff
	beq _02230A4C
	sub r0, r1, #4
	add r1, r1, #2
	ldrh r1, [r4, r1]
	ldr r0, [r4, r0]
	bl Party_GetMonByIndex
	ldr r1, _02230A54 ; =0x000004D4
	add r2, r0, #0
	ldr r0, [r4, r1]
	add r1, #8
	ldrh r1, [r4, r1]
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	ldr r1, _02230A58 ; =0x000004DE
	ldrh r0, [r4, r1]
	lsl r0, r0, #1
	add r2, r4, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldrh r2, [r2, r0]
	sub r0, r1, #2
	ldrh r0, [r4, r0]
	add r1, #0xa
	lsl r0, r0, #1
	add r0, r4, r0
	strh r2, [r0, r1]
	add r0, r4, #0
	bl ov80_02230AE4
	ldr r0, _02230A5C ; =0x000004F8
	ldr r0, [r4, r0]
	bl Save_GameStats_Get
	mov r1, #0x41
	bl GameStats_Inc
_02230A4C:
	pop {r4, pc}
	nop
_02230A50: .word 0x000004DC
_02230A54: .word 0x000004D4
_02230A58: .word 0x000004DE
_02230A5C: .word 0x000004F8
	thumb_func_end ov80_022309F8

	thumb_func_start ov80_02230A60
ov80_02230A60: ; 0x02230A60
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	ldrb r0, [r4, #4]
	mov r1, #1
	bl ov80_02236DF8
	add r6, r0, #0
	ldr r0, _02230ADC ; =0x000004D8
	ldr r0, [r4, r0]
	bl SaveArray_Party_Init
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	cmp r6, #0
	ble _02230ABC
	mov r0, #0x3f
	lsl r0, r0, #4
	add r5, r4, r0
_02230A92:
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov80_0222A140
	ldr r0, _02230AE0 ; =0x000004F8
	ldr r1, _02230ADC ; =0x000004D8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r7, #0
	bl ov80_0222A3BC
	ldr r0, [sp]
	add r5, #0x38
	add r0, r0, #1
	str r0, [sp]
	cmp r0, r6
	blt _02230A92
_02230ABC:
	add r0, r7, #0
	bl FreeToHeap
	mov r5, #0
	cmp r6, #0
	ble _02230AD8
	ldr r7, _02230ADC ; =0x000004D8
_02230ACA:
	ldr r0, [r4, r7]
	add r1, r5, #0
	bl Party_GetMonByIndex
	add r5, r5, #1
	cmp r5, r6
	blt _02230ACA
_02230AD8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230ADC: .word 0x000004D8
_02230AE0: .word 0x000004F8
	thumb_func_end ov80_02230A60

	thumb_func_start ov80_02230AE4
ov80_02230AE4: ; 0x02230AE4
	ldrh r2, [r0, #8]
	ldr r1, _02230AF4 ; =0x0000270F
	cmp r2, r1
	bhs _02230AF0
	add r1, r2, #1
	strh r1, [r0, #8]
_02230AF0:
	bx lr
	nop
_02230AF4: .word 0x0000270F
	thumb_func_end ov80_02230AE4

	thumb_func_start ov80_02230AF8
ov80_02230AF8: ; 0x02230AF8
	push {r3, lr}
	cmp r1, #6
	bhi _02230B48
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02230B0A: ; jump table
	.short _02230B18 - _02230B0A - 2 ; case 0
	.short _02230B1E - _02230B0A - 2 ; case 1
	.short _02230B24 - _02230B0A - 2 ; case 2
	.short _02230B2A - _02230B0A - 2 ; case 3
	.short _02230B30 - _02230B0A - 2 ; case 4
	.short _02230B3A - _02230B0A - 2 ; case 5
	.short _02230B44 - _02230B0A - 2 ; case 6
_02230B18:
	bl ov80_0222B108
	pop {r3, pc}
_02230B1E:
	bl ov80_0222B174
	pop {r3, pc}
_02230B24:
	bl ov80_0222B1DC
	pop {r3, pc}
_02230B2A:
	bl ov80_0222B2C4
	pop {r3, pc}
_02230B30:
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl ov80_0222B3B0
	pop {r3, pc}
_02230B3A:
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl ov80_0222B3FC
	pop {r3, pc}
_02230B44:
	bl ov80_0222B448
_02230B48:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02230AF8

	thumb_func_start ov80_02230B4C
ov80_02230B4C: ; 0x02230B4C
	ldrb r3, [r0, #4]
	ldrh r2, [r0, #0xe]
	cmp r3, #1
	bhi _02230B62
	cmp r2, #8
	blo _02230B5C
	mov r1, #9
	b _02230B6E
_02230B5C:
	ldr r1, _02230B84 ; =ov80_0223BDD4
	ldrb r1, [r1, r2]
	b _02230B6E
_02230B62:
	cmp r2, #8
	blo _02230B6A
	mov r1, #0x15
	b _02230B6E
_02230B6A:
	ldr r1, _02230B88 ; =ov80_0223BDE0
	ldrb r1, [r1, r2]
_02230B6E:
	cmp r3, #0
	bne _02230B7E
	ldrh r0, [r0, #0xc]
	cmp r0, #0x15
	beq _02230B7C
	cmp r0, #0x31
	bne _02230B7E
_02230B7C:
	mov r1, #0x14
_02230B7E:
	add r0, r1, #0
	bx lr
	nop
_02230B84: .word ov80_0223BDD4
_02230B88: .word ov80_0223BDE0
	thumb_func_end ov80_02230B4C

	.bss

_0223DD40:
	.space 0x4
