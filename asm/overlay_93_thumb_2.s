	.include "asm/macros.inc"
	.include "overlay_93_thumb_2.inc"
	.include "global.inc"

	.text

	thumb_func_start ov93_0225FBF0
ov93_0225FBF0: ; 0x0225FBF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	str r1, [sp, #0x10]
	mov r0, #0xc9
	mov r1, #0x75
	add r5, r2, #0
	add r4, r3, #0
	bl NARC_New
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0x75
	str r1, [sp, #0xc]
	ldr r1, _0225FC7C ; =ov93_02262CEC
	lsl r6, r5, #3
	ldrh r1, [r1, r6]
	add r2, r7, #0
	mov r3, #7
	str r0, [sp, #0x14]
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	ldr r1, _0225FC80 ; =ov93_02262CEE
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldrh r1, [r1, r6]
	ldr r0, [sp, #0x14]
	add r2, r7, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [sp, #0x14]
	bl NARC_Delete
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x30
	bl MI_CpuFill8
	ldr r0, [sp, #0x10]
	mov r1, #0xc
	add r2, r0, #0
	mul r2, r1
	ldr r0, _0225FC84 ; =ov93_02262FD4
	lsl r1, r5, #2
	add r0, r0, r2
	ldr r0, [r1, r0]
	mov r1, #1
	str r0, [r4, #0xc]
	str r5, [r4, #4]
	add r0, r4, #0
	str r1, [r4]
	add r0, #0x2c
	strb r1, [r0]
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	add r1, r4, #0
	bl ov93_0225FCA4
	ldr r0, _0225FC88 ; =0x000005EB
	bl PlaySE
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FC7C: .word ov93_02262CEC
_0225FC80: .word ov93_02262CEE
_0225FC84: .word ov93_02262FD4
_0225FC88: .word 0x000005EB
	thumb_func_end ov93_0225FBF0

	thumb_func_start ov93_0225FC8C
ov93_0225FC8C: ; 0x0225FC8C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	add r4, #0x2d
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225FC8C

	thumb_func_start ov93_0225FCA4
ov93_0225FCA4: ; 0x0225FCA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	cmp r0, #0
	beq _0225FD86
	add r0, sp, #0xc
	str r0, [sp]
	add r0, r2, #0
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r3, sp, #0x10
	bl ov93_0225FD8C
	mov r0, #1
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _0225FCD0
	mov r7, #0
	b _0225FCF0
_0225FCD0:
	bge _0225FCE2
	lsl r1, r1, #7
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r1, r0, #0xc
	mov r0, #0x80
	sub r7, r0, r1
	b _0225FCF0
_0225FCE2:
	sub r0, r1, r0
	lsl r1, r0, #7
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	neg r7, r0
_0225FCF0:
	mov r0, #1
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _0225FCFE
	mov r6, #0
	b _0225FD1E
_0225FCFE:
	bge _0225FD10
	lsl r1, r1, #7
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r1, r0, #0xc
	mov r0, #0x80
	sub r6, r0, r1
	b _0225FD1E
_0225FD10:
	sub r0, r1, r0
	lsl r1, r0, #7
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	neg r6, r0
_0225FD1E:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0225FD28
	mov r4, #0
	b _0225FD44
_0225FD28:
	bl LCRandom
	mov r1, #7
	and r0, r1
	add r4, r0, #1
	ldr r1, [r5, #0x28]
	mov r0, #1
	tst r0, r1
	beq _0225FD3C
	neg r4, r4
_0225FD3C:
	ldr r1, [r5, #0x28]
	mov r0, #1
	eor r0, r1
	str r0, [r5, #0x28]
_0225FD44:
	ldr r0, [sp, #0x10]
	bl FX_Inv
	add r5, r0, #0
	ldr r0, [sp, #0xc]
	bl FX_Inv
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, #7
	mov r2, #3
	add r3, r5, #0
	bl ScheduleSetBgAffineScale
	ldr r0, [sp, #4]
	ldr r3, [sp, #8]
	mov r1, #7
	mov r2, #6
	bl ScheduleSetBgAffineScale
	ldr r0, [sp, #4]
	mov r1, #7
	mov r2, #0
	sub r3, r4, r7
	bl ScheduleSetBgPosText
	mov r3, #0x27
	ldr r0, [sp, #4]
	mov r1, #7
	mov r2, #3
	sub r3, r3, r6
	bl ScheduleSetBgPosText
_0225FD86:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov93_0225FCA4

	thumb_func_start ov93_0225FD8C
ov93_0225FD8C: ; 0x0225FD8C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r3, #0
	ldr r0, _0225FDE8 ; =ov93_02262CF0
	lsl r3, r1, #3
	ldr r0, [r0, r3]
	add r6, r5, #0
	mul r0, r2
	mov r2, #0xc
	mul r6, r2
	ldr r3, _0225FDEC ; =ov93_02262FD4
	lsl r2, r1, #2
	add r1, r3, r6
	ldr r1, [r2, r1]
	bl _s32_div_f
	mov r1, #3
	lsl r1, r1, #8
	add r2, r0, r1
	ldr r1, [sp, #0x10]
	str r2, [r4]
	str r2, [r1]
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r2, r1
	ble _0225FDE6
	mov r1, #0xd
	lsl r1, r1, #8
	sub r0, r0, r1
	ldr r2, _0225FDF0 ; =0x0000119A
	asr r1, r0, #0x1f
	mov r3, #0
	bl _ll_mul
	mov r3, #2
	mov r5, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r5
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [r4]
	orr r1, r0
	add r0, r2, r1
	str r0, [r4]
_0225FDE6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225FDE8: .word ov93_02262CF0
_0225FDEC: .word ov93_02262FD4
_0225FDF0: .word 0x0000119A
	thumb_func_end ov93_0225FD8C

	thumb_func_start ov93_0225FDF4
ov93_0225FDF4: ; 0x0225FDF4
	cmp r0, #0xa
	blt _0225FDFC
	mov r0, #2
	bx lr
_0225FDFC:
	cmp r0, #5
	blt _0225FE04
	mov r0, #1
	bx lr
_0225FE04:
	mov r0, #0
	bx lr
	thumb_func_end ov93_0225FDF4

	thumb_func_start ov93_0225FE08
ov93_0225FE08: ; 0x0225FE08
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	add r6, r2, #0
	add r0, r0, r6
	add r7, r3, #0
	str r0, [r4, #0x10]
	mov r1, #6
	bl _s32_div_f
	str r0, [r4, #0x14]
	add r0, r5, #0
	add r1, r7, #0
	bl ov93_0225E3C4
	add r1, r4, #0
	add r1, #0x18
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	add r2, r2, r6
	str r2, [r1, r0]
	bl sub_0203769C
	cmp r7, r0
	bne _0225FE4E
	ldr r1, _0225FE54 ; =0x00003848
	ldr r0, [r5, r1]
	add r0, r0, r6
	str r0, [r5, r1]
	ldr r0, _0225FE58 ; =0x000015A8
	ldr r1, [r5, r1]
	add r0, r5, r0
	bl ov93_02262098
_0225FE4E:
	ldr r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225FE54: .word 0x00003848
_0225FE58: .word 0x000015A8
	thumb_func_end ov93_0225FE08

	thumb_func_start ov93_0225FE5C
ov93_0225FE5C: ; 0x0225FE5C
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _0225FE66
	mov r0, #0
	bx lr
_0225FE66:
	ldr r2, [r0, #0x14]
	cmp r1, r2
	bge _0225FE6E
	add r2, r1, #0
_0225FE6E:
	ldr r1, [r0, #0x10]
	sub r1, r1, r2
	str r1, [r0, #0x10]
	ldr r1, [r0, #8]
	add r1, r1, r2
	str r1, [r0, #8]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov93_0225FE5C

	thumb_func_start ov93_0225FE80
ov93_0225FE80: ; 0x0225FE80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0225FEA8 ; =0x00002FCC
	add r6, r1, #0
	ldr r0, [r5, r0]
	add r4, r2, #0
	cmp r0, #0
	beq _0225FEA4
	add r0, r4, #0
	bl ov93_0225FE5C
	ldr r2, [r5]
	add r0, r6, #0
	add r2, #0x30
	ldrb r2, [r2]
	add r1, r4, #0
	bl ov93_0225FCA4
_0225FEA4:
	pop {r4, r5, r6, pc}
	nop
_0225FEA8: .word 0x00002FCC
	thumb_func_end ov93_0225FE80

	thumb_func_start ov93_0225FEAC
ov93_0225FEAC: ; 0x0225FEAC
	ldr r1, _0225FEBC ; =0x00001428
	ldr r3, _0225FEC0 ; =_s32_div_f
	add r2, r0, r1
	ldr r1, [r2, #8]
	mov r0, #0x64
	mul r0, r1
	ldr r1, [r2, #0xc]
	bx r3
	.balign 4, 0
_0225FEBC: .word 0x00001428
_0225FEC0: .word _s32_div_f
	thumb_func_end ov93_0225FEAC

	thumb_func_start ov93_0225FEC4
ov93_0225FEC4: ; 0x0225FEC4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0225FF14 ; =0x00002FDC
	add r4, r1, #0
	mov r3, #0
	add r2, r5, #0
_0225FED2:
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0225FF00
	ldr r2, _0225FF14 ; =0x00002FDC
	mov r6, #0x18
	add r2, r5, r2
	mul r6, r3
	add r0, r5, #0
	add r1, r4, #0
	add r2, r2, r6
	bl ov93_0225FF1C
	str r0, [sp]
	ldr r1, _0225FF18 ; =0x00001560
	ldrb r2, [r4, #1]
	ldrb r3, [r4]
	add r0, r5, #0
	add r1, r5, r1
	bl ov93_02261C58
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0225FF00:
	add r3, r3, #1
	add r2, #0x18
	cmp r3, #0x28
	blt _0225FED2
	bl GF_AssertFail
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225FF14: .word 0x00002FDC
_0225FF18: .word 0x00001560
	thumb_func_end ov93_0225FEC4

	thumb_func_start ov93_0225FF1C
ov93_0225FF1C: ; 0x0225FF1C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r7, r0, #0
	ldr r0, [r4]
	add r5, r1, #0
	cmp r0, #0
	beq _0225FF2E
	bl GF_AssertFail
_0225FF2E:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldrb r1, [r5]
	add r0, r7, #0
	bl ov93_0225E3C4
	ldr r1, [r7]
	ldr r3, _0225FFF4 ; =ov93_02263010
	add r1, #0x30
	ldrb r2, [r1]
	mov r1, #0x28
	mul r1, r2
	mov r2, #0xa
	mul r2, r0
	ldrb r0, [r5]
	add r1, r3, r1
	add r6, r1, r2
	strh r0, [r4, #4]
	ldrh r0, [r5, #2]
	add r1, r6, #0
	strh r0, [r4, #6]
	ldr r0, [r5, #8]
	str r0, [r4, #8]
	str r6, [r4, #0x14]
	ldrb r0, [r5, #1]
	strb r0, [r4, #0xe]
	add r0, r7, #0
	bl ov93_0226027C
	str r0, [r4, #0x10]
	bl sub_0203769C
	ldrb r1, [r5]
	cmp r1, r0
	bne _0225FF8E
	ldr r1, [r5, #4]
	add r0, r7, #0
	bl ov93_0225DF38
	mov r0, #0x19
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_0200DCE8
_0225FF8E:
	mov r0, #1
	str r0, [r4]
	add r1, sp, #0
	mov r3, #0x16
	ldr r0, [r4, #0x10]
	add r1, #2
	add r2, sp, #0
	lsl r3, r3, #0x10
	mov r5, #0
	bl sub_0200DE94
	ldrb r0, [r6, #7]
	cmp r0, #3
	bhi _0225FFE8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FFB6: ; jump table
	.short _0225FFBE - _0225FFB6 - 2 ; case 0
	.short _0225FFCA - _0225FFB6 - 2 ; case 1
	.short _0225FFD4 - _0225FFB6 - 2 ; case 2
	.short _0225FFDE - _0225FFB6 - 2 ; case 3
_0225FFBE:
	add r1, sp, #0
	add r0, r5, #0
	ldrsh r1, [r1, r0]
	mov r0, #0x1c
	sub r5, r0, r1
	b _0225FFE8
_0225FFCA:
	add r1, sp, #0
	mov r0, #2
	ldrsh r5, [r1, r0]
	sub r5, #0xcc
	b _0225FFE8
_0225FFD4:
	add r1, sp, #0
	add r0, r5, #0
	ldrsh r5, [r1, r0]
	sub r5, #0xa4
	b _0225FFE8
_0225FFDE:
	add r1, sp, #0
	mov r0, #2
	ldrsh r1, [r1, r0]
	mov r0, #0x34
	sub r5, r0, r1
_0225FFE8:
	mov r1, #5
	lsl r0, r5, #0xc
	lsl r1, r1, #0xc
	bl _s32_div_f
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FFF4: .word ov93_02263010
	thumb_func_end ov93_0225FF1C

	thumb_func_start ov93_0225FFF8
ov93_0225FFF8: ; 0x0225FFF8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02260070 ; =0x00002FDC
	mov r6, #0
	add r4, r5, r0
	add r7, r6, #0
_02260004:
	ldr r0, [r4]
	cmp r0, #1
	bne _02260064
	mov r0, #0xc
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226002C
	mov r0, #0xc
	ldrsh r0, [r4, r0]
	sub r0, r0, #1
	strh r0, [r4, #0xc]
	mov r0, #0xc
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _02260064
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DCE8
	b _02260064
_0226002C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov93_02260080
	cmp r0, #1
	bne _02260064
	ldr r0, _02260074 ; =0x00002FCC
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0226005C
	ldr r0, _02260078 ; =0x00002FBC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0226005C
	ldrb r0, [r4, #0xe]
	ldr r1, _0226007C ; =0x00001428
	mov r3, #4
	str r0, [sp]
	ldrsh r3, [r4, r3]
	ldr r2, [r4, #8]
	add r0, r5, #0
	add r1, r5, r1
	bl ov93_0225FE08
_0226005C:
	ldr r0, [r4, #0x10]
	bl sub_0200D9DC
	str r7, [r4]
_02260064:
	add r6, r6, #1
	add r4, #0x18
	cmp r6, #0x28
	blt _02260004
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260070: .word 0x00002FDC
_02260074: .word 0x00002FCC
_02260078: .word 0x00002FBC
_0226007C: .word 0x00001428
	thumb_func_end ov93_0225FFF8

	thumb_func_start ov93_02260080
ov93_02260080: ; 0x02260080
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	str r0, [sp]
	add r1, sp, #4
	mov r3, #0x16
	ldr r0, [r4, #0x10]
	add r1, #2
	add r2, sp, #4
	lsl r3, r3, #0x10
	mov r7, #0
	bl sub_0200DE94
	ldr r0, [r4, #0x14]
	ldrb r0, [r0, #7]
	cmp r0, #3
	bhi _02260188
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022600AE: ; jump table
	.short _022600B6 - _022600AE - 2 ; case 0
	.short _022600EC - _022600AE - 2 ; case 1
	.short _02260120 - _022600AE - 2 ; case 2
	.short _02260152 - _022600AE - 2 ; case 3
_022600B6:
	add r0, sp, #4
	add r1, r7, #0
	ldrsh r2, [r0, r1]
	mov r0, #0x1c
	sub r6, r0, r2
	mov r2, #5
	ldr r0, [r4, #0x10]
	lsl r2, r2, #0xc
	bl sub_0200DEDC
	add r1, sp, #8
	mov r3, #0x16
	ldr r0, [r4, #0x10]
	add r1, #2
	add r2, sp, #8
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #4
	mov r0, #4
	ldrsh r1, [r1, r0]
	mov r0, #0x1c
	sub r5, r0, r1
	cmp r1, #0x4a
	ble _02260188
	mov r7, #1
	b _02260188
_022600EC:
	add r1, sp, #4
	mov r0, #2
	ldrsh r6, [r1, r0]
	ldr r0, [r4, #0x10]
	ldr r1, _02260270 ; =0xFFFFB000
	add r2, r7, #0
	sub r6, #0xcc
	bl sub_0200DEDC
	add r1, sp, #8
	mov r3, #0x16
	ldr r0, [r4, #0x10]
	add r1, #2
	add r2, sp, #8
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #4
	mov r0, #6
	ldrsh r0, [r1, r0]
	add r5, r0, #0
	sub r5, #0xcc
	cmp r0, #0x98
	bge _02260188
	mov r7, #1
	b _02260188
_02260120:
	add r0, sp, #4
	add r1, r7, #0
	ldrsh r6, [r0, r1]
	ldr r0, [r4, #0x10]
	ldr r2, _02260270 ; =0xFFFFB000
	sub r6, #0xa4
	bl sub_0200DEDC
	add r1, sp, #8
	mov r3, #0x16
	ldr r0, [r4, #0x10]
	add r1, #2
	add r2, sp, #8
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #4
	mov r0, #4
	ldrsh r0, [r1, r0]
	add r5, r0, #0
	sub r5, #0xa4
	cmp r0, #0x72
	bge _02260188
	mov r7, #1
	b _02260188
_02260152:
	add r1, sp, #4
	mov r0, #2
	ldrsh r1, [r1, r0]
	mov r0, #0x34
	add r2, r7, #0
	sub r6, r0, r1
	mov r1, #5
	ldr r0, [r4, #0x10]
	lsl r1, r1, #0xc
	bl sub_0200DEDC
	add r1, sp, #8
	mov r3, #0x16
	ldr r0, [r4, #0x10]
	add r1, #2
	add r2, sp, #8
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #4
	mov r0, #6
	ldrsh r1, [r1, r0]
	mov r0, #0x34
	sub r5, r0, r1
	cmp r1, #0x68
	ble _02260188
	mov r7, #1
_02260188:
	cmp r5, #0
	blt _022601B8
	cmp r5, #0xe
	bge _022601F0
	lsl r0, r5, #0xc
	mov r1, #0xe
	bl _s32_div_f
	mov r1, #1
	lsl r1, r1, #0xa
	cmp r0, r1
	bge _022601A2
	add r0, r1, #0
_022601A2:
	bl _fflt
	ldr r1, _02260274 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl sub_0200E024
	b _022601F0
_022601B8:
	mov r0, #0xd
	mvn r0, r0
	cmp r5, r0
	ble _022601F0
	ldrb r0, [r4, #0xe]
	neg r1, r5
	lsl r2, r0, #2
	ldr r0, _02260278 ; =ov93_02262CA4
	ldr r0, [r0, r2]
	mul r0, r1
	mov r1, #0xe
	bl _s32_div_f
	mov r1, #1
	lsl r1, r1, #0xa
	cmp r0, r1
	bge _022601DC
	add r0, r1, #0
_022601DC:
	bl _fflt
	ldr r1, _02260274 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl sub_0200E024
_022601F0:
	bl sub_0203769C
	mov r1, #4
	ldrsh r1, [r4, r1]
	cmp r1, r0
	bne _02260260
	cmp r6, #0
	blt _02260260
	cmp r5, #0
	bgt _02260260
	ldr r0, [sp]
	add r1, sp, #0xc
	bl ov93_022614F4
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xe]
	cmp r0, #1
	beq _0226021E
	cmp r0, #2
	beq _02260226
	cmp r0, #3
	beq _02260232
	b _0226023A
_0226021E:
	ldr r0, [r4, #8]
	lsl r0, r0, #1
	str r0, [r4, #8]
	b _0226023A
_02260226:
	ldr r1, [r4, #8]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #8]
	b _0226023A
_02260232:
	ldr r1, [r4, #8]
	lsl r0, r1, #1
	add r0, r1, r0
	str r0, [r4, #8]
_0226023A:
	ldrb r1, [r4, #0xe]
	ldr r0, [sp]
	bl ov93_02260FB8
	ldrb r0, [r4, #0xe]
	cmp r0, #0
	beq _02260250
	ldr r0, [sp, #0xc]
	mov r1, #3
	bl ov93_02261528
_02260250:
	ldr r0, [sp]
	bl ov93_02260F84
	add r1, r0, #0
	beq _02260260
	ldr r0, [sp]
	bl ov93_022627E8
_02260260:
	cmp r7, #1
	bne _0226026A
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0226026A:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260270: .word 0xFFFFB000
_02260274: .word 0x45800000
_02260278: .word ov93_02262CA4
	thumb_func_end ov93_02260080

	thumb_func_start ov93_0226027C
ov93_0226027C: ; 0x0226027C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	ldr r6, _022602E0 ; =ov93_02262DCC
	add r2, r0, #0
	add r5, r1, #0
	add r4, sp, #0
	mov r3, #6
_0226028A:
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r3, r3, #1
	bne _0226028A
	ldr r0, [r6]
	add r1, sp, #0
	str r0, [r4]
	mov r0, #0
	ldrsh r0, [r5, r0]
	strh r0, [r1]
	mov r0, #2
	ldrsh r0, [r5, r0]
	strh r0, [r1, #2]
	ldrb r0, [r5, #6]
	str r0, [sp, #0xc]
	ldr r0, [r2, #0x24]
	ldr r1, [r2, #0x28]
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0
	mov r2, #2
	mov r3, #0x16
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	lsl r3, r3, #0x10
	add r4, r0, #0
	bl sub_0200DDF4
	ldrh r1, [r5, #4]
	add r0, r4, #0
	bl sub_0200DC4C
	add r0, r4, #0
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4]
	bl sub_0200DC0C
	add r0, r4, #0
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022602E0: .word ov93_02262DCC
	thumb_func_end ov93_0226027C

	thumb_func_start ov93_022602E4
ov93_022602E4: ; 0x022602E4
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _0226030C ; =0x00002FDC
	add r5, r0, #0
	add r6, r4, #0
_022602EE:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _02260300
	ldr r0, _02260310 ; =0x00002FEC
	ldr r0, [r5, r0]
	bl sub_0200D9DC
	ldr r0, _0226030C ; =0x00002FDC
	str r6, [r5, r0]
_02260300:
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #0x28
	blt _022602EE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226030C: .word 0x00002FDC
_02260310: .word 0x00002FEC
	thumb_func_end ov93_022602E4

	thumb_func_start ov93_02260314
ov93_02260314: ; 0x02260314
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	ldr r5, _022605F8 ; =ov93_02262E00
	str r2, [sp, #4]
	add r7, r0, #0
	str r1, [sp]
	mov r4, #0
	add r3, sp, #0x34
	mov r2, #6
_02260326:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02260326
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0xc]
	b _0226044C
_02260344:
	ldr r2, [r7]
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	add r1, r2, r1
	add r1, #0x2c
	ldrb r1, [r1]
	bl ov93_0225E3C4
	add r5, r0, #0
	ldr r0, [sp, #4]
	lsl r1, r5, #2
	add r0, r0, r1
	ldr r1, [r0, #0x18]
	mov r0, #0x24
	mul r0, r1
	ldr r2, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add r1, r2, r1
	bl _s32_div_f
	ldr r1, [sp, #0xc]
	lsl r5, r5, #1
	lsl r2, r1, #2
	add r1, sp, #0x24
	str r0, [r1, r2]
	ldr r0, [r7]
	add r0, #0x30
	ldrb r0, [r0]
	lsl r3, r0, #3
	ldr r0, _022605FC ; =ov93_02262D7C
	add r0, r0, r3
	ldrh r0, [r5, r0]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [r1, r2]
	str r0, [sp, #0x20]
	b _0226043E
_02260396:
	mov r0, #0x18
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #0x1c]
	add r2, sp, #0x34
	add r5, r0, r1
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	bl sub_0200D734
	add r6, r0, #0
	beq _02260446
	mov r3, #0x16
	mov r1, #0x80
	mov r2, #0x60
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	bl sub_0200DC4C
	ldr r0, [r6]
	bl sub_0200DC0C
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x13
	sub r2, r2, r1
	mov r0, #0x13
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r5, #4]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x12
	sub r2, r2, r1
	mov r0, #0x12
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r5, #8]
	bl LCRandom
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0xc
	str r0, [r5, #0xc]
	bl LCRandom
	mov r1, #5
	lsl r1, r1, #0xe
	bl _s32_div_f
	mov r0, #0xa
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r5, #0x10]
	bl LCRandom
	mov r1, #0xf
	bl _s32_div_f
	add r1, #0x14
	strh r1, [r5, #0x14]
	add r1, r4, #0
	mov r0, #0x18
	mul r1, r0
	ldr r0, [sp]
	add r4, r4, #1
	add r0, r0, r1
	str r6, [r0, #4]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0226043E:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blt _02260396
_02260446:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_0226044C:
	ldr r0, [r7]
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bge _0226045A
	b _02260344
_0226045A:
	mov r0, #0xe
	str r0, [sp, #0x3c]
	mov r0, #0
	mov r1, #0xd9
	str r0, [sp, #0xc]
	str r0, [sp, #0x40]
	ldr r0, [sp]
	lsl r1, r1, #2
	add r6, r0, r1
	b _02260522
_0226046E:
	ldr r1, [sp, #0xc]
	mov r0, #0x18
	mul r0, r1
	add r4, r6, r0
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	add r2, sp, #0x34
	bl sub_0200D734
	add r5, r0, #0
	beq _02260528
	mov r3, #0x16
	mov r1, #0x80
	mov r2, #0x60
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r0, r5, #0
	add r1, #0x1c
	bl sub_0200DC4C
	ldr r0, [r5]
	bl sub_0200DC0C
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x13
	sub r2, r2, r1
	mov r0, #0x13
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r4, #4]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x12
	sub r2, r2, r1
	mov r0, #0x12
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r4, #8]
	bl LCRandom
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0xc
	str r0, [r4, #0xc]
	bl LCRandom
	mov r1, #5
	lsl r1, r1, #0xe
	bl _s32_div_f
	mov r0, #1
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [r4, #0x10]
	bl LCRandom
	mov r1, #0xf
	bl _s32_div_f
	add r1, #0x14
	strh r1, [r4, #0x14]
	ldr r1, [sp, #0xc]
	mov r0, #0x18
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	add r1, r0, r2
	mov r0, #0xd9
	lsl r0, r0, #2
	str r5, [r1, r0]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_02260522:
	ldr r0, [sp, #0xc]
	cmp r0, #8
	blt _0226046E
_02260528:
	mov r0, #0xd
	str r0, [sp, #0x3c]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	lsl r1, r0, #1
	ldr r0, _02260600 ; =_02262C6C
	ldrh r0, [r0, r1]
	ldr r1, _02260604 ; =0x00000424
	str r0, [sp, #0x40]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	add r6, r0, r1
	b _022605EC
_02260544:
	ldr r1, [sp, #0xc]
	mov r0, #0x18
	mul r0, r1
	add r4, r6, r0
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	add r2, sp, #0x34
	bl sub_0200D734
	add r5, r0, #0
	beq _022605F2
	mov r3, #0x16
	mov r1, #0x80
	mov r2, #0x60
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	add r0, r5, #0
	mov r1, #0xb
	bl sub_0200DC4C
	ldr r0, [r5]
	bl sub_0200DC0C
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x13
	sub r2, r2, r1
	mov r0, #0x13
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r4, #4]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x12
	sub r2, r2, r1
	mov r0, #0x12
	ror r2, r0
	mov r0, #2
	add r1, r1, r2
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r4, #8]
	bl LCRandom
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0xc
	str r0, [r4, #0xc]
	bl LCRandom
	mov r1, #5
	lsl r1, r1, #0xe
	bl _s32_div_f
	mov r0, #1
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [r4, #0x10]
	bl LCRandom
	mov r1, #0xf
	bl _s32_div_f
	add r1, #0x14
	strh r1, [r4, #0x14]
	ldr r1, [sp, #0xc]
	mov r0, #0x18
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	add r1, r0, r2
	ldr r0, _02260604 ; =0x00000424
	str r5, [r1, r0]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_022605EC:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	blt _02260544
_022605F2:
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022605F8: .word ov93_02262E00
_022605FC: .word ov93_02262D7C
_02260600: .word _02262C6C
_02260604: .word 0x00000424
	thumb_func_end ov93_02260314

	thumb_func_start ov93_02260608
ov93_02260608: ; 0x02260608
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0226065C ; =0x000033A0
	mov r4, #0
	add r5, r6, r0
_02260612:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226061C
	bl sub_0200D9DC
_0226061C:
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #0x24
	blt _02260612
	mov r0, #0x37
	lsl r0, r0, #8
	mov r5, #0
	add r4, r6, r0
_0226062C:
	ldr r0, [r4]
	cmp r0, #0
	beq _02260636
	bl sub_0200D9DC
_02260636:
	add r5, r5, #1
	add r4, #0x18
	cmp r5, #8
	blt _0226062C
	mov r0, #0xdf
	lsl r0, r0, #6
	mov r4, #0
	add r5, r6, r0
_02260646:
	ldr r0, [r5]
	cmp r0, #0
	beq _02260650
	bl sub_0200D9DC
_02260650:
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #3
	blt _02260646
	pop {r4, r5, r6, pc}
	nop
_0226065C: .word 0x000033A0
	thumb_func_end ov93_02260608

	thumb_func_start ov93_02260660
ov93_02260660: ; 0x02260660
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r1, _022608FC ; =0x0000339C
	mov r4, #0
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [r0]
	cmp r0, #0
	bne _02260678
	add sp, #0x34
	add r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_02260678:
	ldr r0, [sp, #0x18]
	str r4, [sp, #0x14]
	add r5, r0, #4
_0226067E:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226073A
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _02260696
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r5]
	b _0226073A
_02260696:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x10]
	add r0, r1, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	add r1, r1, r0
	mov r0, #0xa
	lsl r0, r0, #0x10
	str r1, [r5, #4]
	cmp r1, r0
	blt _022606B0
	str r0, [r5, #4]
_022606B0:
	ldr r0, [r5, #0xc]
	ldr r6, [r5, #4]
	bl GF_SinDegFX32
	add r7, r0, #0
	ldr r0, [r5, #4]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	bl GF_CosDegFX32
	str r0, [sp, #0x1c]
	asr r1, r7, #0x1f
	add r0, r7, #0
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	str r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	add r6, r1, #0
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r1, #0
	mov r3, #2
	add r7, r0, #0
	ldr r1, [sp, #0x28]
	lsl r3, r3, #0xa
	add r3, r1, r3
	ldr r1, _02260900 ; =0
	ldr r0, [r5]
	adc r6, r1
	lsl r1, r6, #0x14
	lsr r3, r3, #0xc
	orr r3, r1
	asr r1, r3, #0xb
	lsr r1, r1, #0x14
	add r1, r3, r1
	asr r1, r1, #0xc
	add r1, #0x80
	mov r3, #2
	lsl r1, r1, #0x10
	ldr r6, _02260900 ; =0
	lsl r3, r3, #0xa
	asr r1, r1, #0x10
	add r3, r7, r3
	adc r2, r6
	lsl r2, r2, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	neg r3, r3
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	asr r2, r2, #0xc
	add r2, #0x60
	lsl r2, r2, #0x10
	mov r3, #0x16
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r0, #0x14
	ldrsh r0, [r5, r0]
	add r4, r4, #1
	sub r0, r0, #1
	strh r0, [r5, #0x14]
_0226073A:
	ldr r0, [sp, #0x14]
	add r5, #0x18
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0x24
	blt _0226067E
	mov r0, #0
	str r0, [sp]
	mov r1, #0xd9
	ldr r0, [sp, #0x18]
	lsl r1, r1, #2
	add r5, r0, r1
_02260752:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226080E
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0226076A
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r5]
	b _0226080E
_0226076A:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x10]
	add r0, r1, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	add r1, r1, r0
	mov r0, #0xa
	lsl r0, r0, #0x10
	str r1, [r5, #4]
	cmp r1, r0
	blt _02260784
	str r0, [r5, #4]
_02260784:
	ldr r0, [r5, #0xc]
	ldr r6, [r5, #4]
	bl GF_SinDegFX32
	add r7, r0, #0
	ldr r0, [r5, #4]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	bl GF_CosDegFX32
	str r0, [sp, #0x20]
	asr r1, r7, #0x1f
	add r0, r7, #0
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	str r0, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r6, r1, #0
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r1, #0
	mov r3, #2
	add r7, r0, #0
	ldr r1, [sp, #0x2c]
	lsl r3, r3, #0xa
	add r3, r1, r3
	ldr r1, _02260900 ; =0
	ldr r0, [r5]
	adc r6, r1
	lsl r1, r6, #0x14
	lsr r3, r3, #0xc
	orr r3, r1
	asr r1, r3, #0xb
	lsr r1, r1, #0x14
	add r1, r3, r1
	asr r1, r1, #0xc
	add r1, #0x80
	mov r3, #2
	lsl r1, r1, #0x10
	ldr r6, _02260900 ; =0
	lsl r3, r3, #0xa
	asr r1, r1, #0x10
	add r3, r7, r3
	adc r2, r6
	lsl r2, r2, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	neg r3, r3
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	asr r2, r2, #0xc
	add r2, #0x60
	lsl r2, r2, #0x10
	mov r3, #0x16
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r0, #0x14
	ldrsh r0, [r5, r0]
	add r4, r4, #1
	sub r0, r0, #1
	strh r0, [r5, #0x14]
_0226080E:
	ldr r0, [sp]
	add r5, #0x18
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #8
	blt _02260752
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, _02260904 ; =0x00000424
	ldr r0, [sp, #0x18]
	add r5, r0, r1
_02260824:
	ldr r0, [r5]
	cmp r0, #0
	beq _022608E0
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0226083C
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r5]
	b _022608E0
_0226083C:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x10]
	add r0, r1, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	add r1, r1, r0
	mov r0, #0xa
	lsl r0, r0, #0x10
	str r1, [r5, #4]
	cmp r1, r0
	blt _02260856
	str r0, [r5, #4]
_02260856:
	ldr r0, [r5, #0xc]
	ldr r6, [r5, #4]
	bl GF_SinDegFX32
	add r7, r0, #0
	ldr r0, [r5, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	bl GF_CosDegFX32
	str r0, [sp, #0x24]
	asr r1, r7, #0x1f
	add r0, r7, #0
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	str r0, [sp, #0x30]
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x24]
	add r6, r1, #0
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r1, #0
	mov r3, #2
	add r7, r0, #0
	ldr r1, [sp, #0x30]
	lsl r3, r3, #0xa
	add r3, r1, r3
	ldr r1, _02260900 ; =0
	ldr r0, [r5]
	adc r6, r1
	lsl r1, r6, #0x14
	lsr r3, r3, #0xc
	orr r3, r1
	asr r1, r3, #0xb
	lsr r1, r1, #0x14
	add r1, r3, r1
	asr r1, r1, #0xc
	add r1, #0x80
	mov r3, #2
	lsl r1, r1, #0x10
	ldr r6, _02260900 ; =0
	lsl r3, r3, #0xa
	asr r1, r1, #0x10
	add r3, r7, r3
	adc r2, r6
	lsl r2, r2, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	neg r3, r3
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	asr r2, r2, #0xc
	add r2, #0x60
	lsl r2, r2, #0x10
	mov r3, #0x16
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r0, #0x14
	ldrsh r0, [r5, r0]
	add r4, r4, #1
	sub r0, r0, #1
	strh r0, [r5, #0x14]
_022608E0:
	ldr r0, [sp, #4]
	add r5, #0x18
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #3
	blt _02260824
	cmp r4, #0
	bne _022608F6
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r1, [r0]
_022608F6:
	mov r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022608FC: .word 0x0000339C
_02260900: .word 0
_02260904: .word 0x00000424
	thumb_func_end ov93_02260660

	thumb_func_start ov93_02260908
ov93_02260908: ; 0x02260908
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02260970 ; =0x0000339C
	add r4, r5, r0
	ldr r0, [r4]
	cmp r0, #1
	bne _0226091A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0226091A:
	mov r2, #0x47
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	ldr r1, _02260970 ; =0x0000339C
	ldr r2, _02260974 ; =0x00001428
	add r0, r5, #0
	add r1, r5, r1
	add r2, r5, r2
	bl ov93_02260314
	ldr r1, _02260974 ; =0x00001428
	ldr r0, [r5, #0x2c]
	add r1, r5, r1
	bl ov93_0225FC8C
	add r0, r5, #0
	bl ov93_02260B84
	mov r2, #0
	ldr r0, _02260978 ; =0x00002FCC
	add r1, r2, #0
	str r2, [r5, r0]
	ldr r0, _0226097C ; =0x00001430
	str r2, [r5, r0]
	add r0, #8
	str r2, [r5, r0]
	mov r0, #0x51
	lsl r0, r0, #6
_02260958:
	add r2, r2, #1
	str r1, [r5, r0]
	add r5, r5, #4
	cmp r2, #4
	blt _02260958
	ldr r0, _02260980 ; =0x00000594
	bl PlaySE
	mov r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02260970: .word 0x0000339C
_02260974: .word 0x00001428
_02260978: .word 0x00002FCC
_0226097C: .word 0x00001430
_02260980: .word 0x00000594
	thumb_func_end ov93_02260908

	thumb_func_start ov93_02260984
ov93_02260984: ; 0x02260984
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r6, _022609DC ; =ov93_02262E34
	add r4, r2, #0
	add r3, r0, #0
	add r7, r1, #0
	add r5, sp, #0
	mov r2, #6
_02260994:
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r2, r2, #1
	bne _02260994
	ldr r0, [r6]
	add r2, sp, #0
	str r0, [r5]
	ldr r0, [r3, #0x24]
	ldr r1, [r3, #0x28]
	bl sub_0200D734
	mov r3, #0x16
	lsl r2, r4, #4
	mov r1, #0x48
	sub r1, r1, r2
	lsl r1, r1, #0x10
	add r5, r0, #0
	asr r1, r1, #0x10
	mov r2, #0x20
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0200DC4C
	ldr r0, [r5]
	bl sub_0200DC0C
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DC78
	add r0, r5, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022609DC: .word ov93_02262E34
	thumb_func_end ov93_02260984

	thumb_func_start ov93_022609E0
ov93_022609E0: ; 0x022609E0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _02260A10 ; =0x0000380C
	mov r4, #0
	add r5, r7, r0
	add r6, r4, #0
_022609EC:
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r4, #0
	bl ov93_02260A58
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_0200DC34
	mov r0, #1
	lsl r0, r0, #0xe
	add r4, r4, #1
	add r5, #0xc
	add r6, r6, r0
	cmp r4, #5
	blt _022609EC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260A10: .word 0x0000380C
	thumb_func_end ov93_022609E0

	thumb_func_start ov93_02260A14
ov93_02260A14: ; 0x02260A14
	push {r4, r5, r6, lr}
	ldr r6, _02260A2C ; =0x0000380C
	add r5, r0, #0
	mov r4, #0
_02260A1C:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #5
	blt _02260A1C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02260A2C: .word 0x0000380C
	thumb_func_end ov93_02260A14

	thumb_func_start ov93_02260A30
ov93_02260A30: ; 0x02260A30
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _02260A54 ; =0x0000380C
	mov r4, #0
	add r5, r6, r0
_02260A3A:
	add r0, r5, #0
	bl ov93_02260A8C
	add r0, r6, #0
	add r1, r5, #0
	bl ov93_02260AD8
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #5
	blt _02260A3A
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02260A54: .word 0x0000380C
	thumb_func_end ov93_02260A30

	thumb_func_start ov93_02260A58
ov93_02260A58: ; 0x02260A58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r6, #0
	bl ov93_02260B70
	strb r0, [r5, #4]
	mov r0, #1
	strb r0, [r5, #5]
	ldrb r1, [r5, #4]
	add r0, r7, #0
	add r2, r4, #0
	bl ov93_02260984
	str r0, [r5]
	strb r4, [r5, #6]
	strh r6, [r5, #8]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_02260A58

	thumb_func_start ov93_02260A8C
ov93_02260A8C: ; 0x02260A8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #6]
	mov r3, #0x16
	add r2, sp, #0
	lsl r1, r0, #4
	mov r0, #0x48
	sub r0, r0, r1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r1, sp, #0
	ldr r0, [r5]
	add r1, #2
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #0
	mov r0, #2
	ldrsh r2, [r1, r0]
	cmp r4, r2
	ble _02260AD6
	add r2, r2, #2
	strh r2, [r1, #2]
	ldrsh r0, [r1, r0]
	cmp r0, r4
	ble _02260AC2
	strh r4, [r1, #2]
_02260AC2:
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	mov r3, #0x16
	ldr r0, [r5]
	lsl r3, r3, #0x10
	bl sub_0200DDF4
_02260AD6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_02260A8C

	thumb_func_start ov93_02260AD8
ov93_02260AD8: ; 0x02260AD8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #6]
	add r5, r0, #0
	cmp r1, #0
	bne _02260B66
	ldrb r1, [r4, #5]
	cmp r1, #1
	beq _02260B44
	cmp r1, #3
	bne _02260B66
	ldr r0, [r4]
	bl sub_0200DCA0
	cmp r0, #0
	bne _02260B66
	mov r0, #8
	ldrsh r1, [r4, r0]
	add r1, r1, #5
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	bl ov93_02260B70
	strb r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #5]
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	bl sub_0200DC4C
	mov r1, #7
	mov r3, #0x16
	ldr r0, [r4]
	mvn r1, r1
	mov r2, #0x20
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r0, _02260B68 ; =0x0000380C
	mov r2, #0
	add r3, r5, r0
	mov r1, #4
_02260B2C:
	ldrb r0, [r3, #6]
	cmp r0, #0
	bne _02260B36
	strb r1, [r3, #6]
	b _02260B3A
_02260B36:
	sub r0, r0, #1
	strb r0, [r3, #6]
_02260B3A:
	add r2, r2, #1
	add r3, #0xc
	cmp r2, #5
	blt _02260B2C
	pop {r3, r4, r5, pc}
_02260B44:
	bl ov93_0225FEAC
	ldrb r1, [r4, #5]
	cmp r1, #1
	bne _02260B66
	cmp r0, #0x4b
	ble _02260B66
	mov r0, #2
	strb r0, [r4, #5]
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	add r1, r1, #3
	bl sub_0200DC4C
	ldr r0, _02260B6C ; =0x00000596
	bl PlaySE
_02260B66:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02260B68: .word 0x0000380C
_02260B6C: .word 0x00000596
	thumb_func_end ov93_02260AD8

	thumb_func_start ov93_02260B70
ov93_02260B70: ; 0x02260B70
	cmp r0, #0xa
	blt _02260B78
	mov r0, #2
	bx lr
_02260B78:
	cmp r0, #5
	blt _02260B80
	mov r0, #1
	bx lr
_02260B80:
	mov r0, #0
	bx lr
	thumb_func_end ov93_02260B70

	thumb_func_start ov93_02260B84
ov93_02260B84: ; 0x02260B84
	push {r3, lr}
	ldr r1, _02260BAC ; =0x0000380C
	mov r2, #0
	add r1, r0, r1
_02260B8C:
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _02260BA0
	mov r0, #3
	strb r0, [r1, #5]
	ldr r0, [r1]
	mov r1, #6
	bl sub_0200DC4C
	pop {r3, pc}
_02260BA0:
	add r2, r2, #1
	add r1, #0xc
	cmp r2, #5
	blt _02260B8C
	pop {r3, pc}
	nop
_02260BAC: .word 0x0000380C
	thumb_func_end ov93_02260B84

	thumb_func_start ov93_02260BB0
ov93_02260BB0: ; 0x02260BB0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #3
	bne _02260BEC
	mov r0, #0xc
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldr r0, [r4, #0x2c]
	mov r2, #0
	mov r3, #0xd
	bl BgTilemapRectChangePalette
	mov r0, #0xc
	str r0, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #0x2c]
	mov r2, #0x14
	mov r3, #0xd
	bl BgTilemapRectChangePalette
_02260BEC:
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov93_02260BB0

	thumb_func_start ov93_02260BF0
ov93_02260BF0: ; 0x02260BF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r6]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _02260C50
	ldr r0, _02260CF0 ; =ov93_02262C72
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp]
_02260C0C:
	ldr r0, [sp, #4]
	ldr r5, [sp]
	ldrh r7, [r0]
	mov r4, #0
_02260C14:
	add r0, r6, #0
	add r0, #0x8c
	add r3, r7, r4
	mov r1, #1
	lsl r3, r3, #0x10
	ldr r0, [r0]
	add r2, r1, #0
	lsr r3, r3, #0x10
	bl sub_02003DBC
	strh r0, [r5]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #3
	blt _02260C14
	ldr r0, [sp, #4]
	add r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #6
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r6]
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _02260C0C
_02260C50:
	bl sub_0203769C
	ldr r3, [r6]
	mov r2, #0
	add r1, r3, #0
	add r1, #0x30
	ldrb r4, [r1]
	cmp r4, #0
	ble _02260C74
_02260C62:
	add r1, r3, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r0, r1
	beq _02260C74
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, r4
	blt _02260C62
_02260C74:
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl PaletteData_GetUnfadedBuf
	str r0, [sp, #8]
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl PaletteData_GetFadedBuf
	ldr r1, [r6]
	add r7, r0, #0
	add r0, r1, #0
	add r0, #0x30
	ldrb r5, [r0]
	mov r4, #0
	cmp r5, #0
	ble _02260CEA
_02260C9E:
	add r1, r1, r4
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r6, #0
	bl ov93_0225E3C4
	lsl r1, r0, #1
	ldr r0, _02260CF4 ; =ov93_02262DA4
	lsl r2, r5, #3
	add r0, r0, r2
	ldrh r2, [r1, r0]
	mov r1, #6
	add r3, r4, #0
	mul r3, r1
	add r1, sp, #0x10
	add r1, r1, r3
	lsl r3, r2, #1
	ldr r2, [sp, #8]
	mov r0, #0
	add r2, r2, r3
	add r3, r7, r3
_02260CC8:
	ldrh r5, [r1]
	add r0, r0, #1
	strh r5, [r2]
	ldrh r5, [r1]
	add r1, r1, #2
	add r2, r2, #2
	strh r5, [r3]
	add r3, r3, #2
	cmp r0, #3
	blt _02260CC8
	ldr r1, [r6]
	add r4, r4, #1
	add r0, r1, #0
	add r0, #0x30
	ldrb r5, [r0]
	cmp r4, r5
	blt _02260C9E
_02260CEA:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260CF0: .word ov93_02262C72
_02260CF4: .word ov93_02262DA4
	thumb_func_end ov93_02260BF0

	thumb_func_start ov93_02260CF8
ov93_02260CF8: ; 0x02260CF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	add r7, r0, #0
	ldr r0, [r7, #0x28]
	ldr r1, _02260E10 ; =0x00002716
	mov r2, #2
	bl sub_0200D944
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [r7]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _02260D6E
	ldr r0, _02260E14 ; =ov93_02262C8A
	str r0, [sp, #8]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	lsl r0, r0, #4
	str r0, [sp]
_02260D26:
	ldr r0, [sp, #8]
	ldr r5, [sp, #4]
	ldrh r1, [r0]
	ldr r0, [sp]
	mov r6, #0
	add r4, r1, r0
_02260D32:
	add r0, r7, #0
	add r0, #0x8c
	lsl r3, r4, #0x10
	ldr r0, [r0]
	mov r1, #3
	mov r2, #1
	lsr r3, r3, #0x10
	bl sub_02003DBC
	strh r0, [r5]
	add r6, r6, #1
	add r4, r4, #1
	add r5, r5, #2
	cmp r6, #0x10
	blt _02260D32
	ldr r0, [sp, #8]
	add r0, r0, #2
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	ldr r0, [r7]
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0x18]
	cmp r0, r1
	blt _02260D26
_02260D6E:
	bl sub_0203769C
	ldr r3, [r7]
	mov r2, #0
	add r1, r3, #0
	add r1, #0x30
	ldrb r4, [r1]
	cmp r4, #0
	ble _02260D92
_02260D80:
	add r1, r3, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r0, r1
	beq _02260D92
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, r4
	blt _02260D80
_02260D92:
	add r0, r7, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #3
	bl PaletteData_GetUnfadedBuf
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #3
	bl PaletteData_GetFadedBuf
	ldr r1, [r7]
	str r0, [sp, #0x10]
	add r0, r1, #0
	add r0, #0x30
	ldrb r5, [r0]
	mov r4, #0
	cmp r5, #0
	ble _02260E0C
	ldr r0, [sp, #0xc]
	lsl r6, r0, #4
_02260DC0:
	add r1, r1, r4
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r7, #0
	bl ov93_0225E3C4
	lsl r1, r0, #1
	ldr r0, _02260E18 ; =ov93_02262D04
	lsl r2, r5, #3
	add r0, r0, r2
	ldrh r0, [r1, r0]
	lsl r3, r4, #5
	add r1, sp, #0x1c
	add r2, r6, r0
	add r1, r1, r3
	lsl r5, r2, #1
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x10]
	mov r0, #0
	add r2, r2, r5
	add r3, r3, r5
_02260DEA:
	ldrh r5, [r1]
	add r0, r0, #1
	strh r5, [r2]
	ldrh r5, [r1]
	add r1, r1, #2
	add r2, r2, #2
	strh r5, [r3]
	add r3, r3, #2
	cmp r0, #0x10
	blt _02260DEA
	ldr r1, [r7]
	add r4, r4, #1
	add r0, r1, #0
	add r0, #0x30
	ldrb r5, [r0]
	cmp r4, r5
	blt _02260DC0
_02260E0C:
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02260E10: .word 0x00002716
_02260E14: .word ov93_02262C8A
_02260E18: .word ov93_02262D04
	thumb_func_end ov93_02260CF8

	thumb_func_start ov93_02260E1C
ov93_02260E1C: ; 0x02260E1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, _02260F08 ; =0x00002716
	mov r2, #2
	bl sub_0200D944
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _02260E76
	ldr r0, [sp, #4]
	ldr r7, _02260F0C ; =ov93_02262C82
	lsl r0, r0, #4
	add r4, sp, #0x14
	str r0, [sp]
_02260E46:
	ldrh r6, [r7]
	ldr r3, [sp]
	add r0, r5, #0
	add r0, #0x8c
	add r3, r6, r3
	lsl r3, r3, #0x10
	ldr r0, [r0]
	mov r1, #3
	mov r2, #1
	lsr r3, r3, #0x10
	bl sub_02003DBC
	strh r0, [r4]
	ldr r0, [sp, #0x10]
	add r7, r7, #2
	add r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r4, r4, #2
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	blt _02260E46
_02260E76:
	bl sub_0203769C
	ldr r3, [r5]
	mov r2, #0
	add r1, r3, #0
	add r1, #0x30
	ldrb r4, [r1]
	cmp r4, #0
	ble _02260E9A
_02260E88:
	add r1, r3, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r0, r1
	beq _02260E9A
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, r4
	blt _02260E88
_02260E9A:
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #3
	bl PaletteData_GetUnfadedBuf
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #3
	bl PaletteData_GetFadedBuf
	ldr r1, [r5]
	str r0, [sp, #8]
	add r0, r1, #0
	add r0, #0x30
	ldrb r6, [r0]
	mov r4, #0
	cmp r6, #0
	ble _02260F02
	ldr r0, [sp, #4]
	lsl r7, r0, #4
_02260EC8:
	add r1, r1, r4
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r5, #0
	bl ov93_0225E3C4
	lsl r1, r0, #1
	ldr r0, _02260F10 ; =ov93_02262D54
	lsl r2, r6, #3
	add r0, r0, r2
	ldrh r0, [r1, r0]
	lsl r1, r4, #1
	add r2, sp, #0x14
	ldrh r3, [r2, r1]
	add r0, r7, r0
	ldr r2, [sp, #0xc]
	lsl r0, r0, #1
	strh r3, [r2, r0]
	add r2, sp, #0x14
	ldrh r2, [r2, r1]
	ldr r1, [sp, #8]
	add r4, r4, #1
	strh r2, [r1, r0]
	ldr r1, [r5]
	add r0, r1, #0
	add r0, #0x30
	ldrb r6, [r0]
	cmp r4, r6
	blt _02260EC8
_02260F02:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02260F08: .word 0x00002716
_02260F0C: .word ov93_02262C82
_02260F10: .word ov93_02262D54
	thumb_func_end ov93_02260E1C

	thumb_func_start ov93_02260F14
ov93_02260F14: ; 0x02260F14
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r1, #0
	add r6, r2, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	bl sub_0203769C
	strb r0, [r4]
	strh r5, [r4, #2]
	str r6, [r4, #4]
	str r6, [r4, #8]
	mov r0, #0
	strb r0, [r4, #1]
	strb r0, [r4, #0xc]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov93_02260F14

	thumb_func_start ov93_02260F3C
ov93_02260F3C: ; 0x02260F3C
	push {r4, r5}
	ldr r2, _02260F80 ; =0x00002FB0
	add r4, r0, #0
	sub r0, r2, #4
	add r3, r1, #0
	ldr r1, [r4, r2]
	ldr r0, [r4, r0]
	sub r0, r1, r0
	cmp r0, #8
	blt _02260F56
	mov r0, #0
	pop {r4, r5}
	bx lr
_02260F56:
	lsr r5, r1, #0x1f
	lsl r1, r1, #0x1d
	sub r1, r1, r5
	mov r0, #0x1d
	ror r1, r0
	add r0, r5, r1
	lsl r0, r0, #4
	add r1, r4, r0
	add r0, r2, #0
	sub r0, #0x84
	add r5, r1, r0
	ldmia r3!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r4, r2]
	add r0, r0, #1
	str r0, [r4, r2]
	mov r0, #1
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02260F80: .word 0x00002FB0
	thumb_func_end ov93_02260F3C

	thumb_func_start ov93_02260F84
ov93_02260F84: ; 0x02260F84
	push {r3, r4}
	ldr r1, _02260FB4 ; =0x00002FAC
	add r2, r1, #4
	ldr r4, [r0, r1]
	ldr r2, [r0, r2]
	cmp r4, r2
	blt _02260F98
	mov r0, #0
	pop {r3, r4}
	bx lr
_02260F98:
	add r2, r4, #1
	str r2, [r0, r1]
	sub r1, #0x80
	add r3, r0, r1
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #4
	add r0, r3, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02260FB4: .word 0x00002FAC
	thumb_func_end ov93_02260F84

	thumb_func_start ov93_02260FB8
ov93_02260FB8: ; 0x02260FB8
	push {r3, r4, r5, r6, r7, lr}
	add r2, r0, #0
	ldr r0, _022610A4 ; =0x00002FB0
	add r7, r1, #0
	ldr r5, [r2, r0]
	sub r0, r0, #4
	ldr r0, [r2, r0]
	mov r4, #0
	cmp r0, r5
	beq _02260FD0
	cmp r7, #0
	bne _02260FD4
_02260FD0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260FD4:
	lsr r3, r0, #0x1f
	lsl r1, r0, #0x1d
	sub r1, r1, r3
	mov r0, #0x1d
	ror r1, r0
	add r1, r3, r1
	lsr r3, r5, #0x1f
	lsl r5, r5, #0x1d
	sub r5, r5, r3
	ror r5, r0
	add r0, r3, r5
	cmp r1, r0
	bge _02261012
	cmp r1, r0
	bge _0226105A
	lsl r3, r1, #4
	add r6, r2, r3
	ldr r3, _022610A8 ; =0x00002F38
_02260FF8:
	ldrb r5, [r6, r3]
	cmp r5, #0
	bne _02261008
	ldr r0, _022610AC ; =0x00002F2C
	add r2, r2, r0
	lsl r0, r1, #4
	add r4, r2, r0
	b _0226105A
_02261008:
	add r1, r1, #1
	add r6, #0x10
	cmp r1, r0
	blt _02260FF8
	b _0226105A
_02261012:
	cmp r1, #8
	bge _02261034
	lsl r3, r1, #4
	add r6, r2, r3
	ldr r3, _022610A8 ; =0x00002F38
_0226101C:
	ldrb r5, [r6, r3]
	cmp r5, #0
	bne _0226102C
	ldr r3, _022610AC ; =0x00002F2C
	lsl r1, r1, #4
	add r3, r2, r3
	add r4, r3, r1
	b _02261034
_0226102C:
	add r1, r1, #1
	add r6, #0x10
	cmp r1, #8
	blt _0226101C
_02261034:
	cmp r4, #0
	bne _0226105A
	mov r6, #0
	cmp r0, #0
	ble _0226105A
	ldr r1, _022610A8 ; =0x00002F38
	add r5, r2, #0
_02261042:
	ldrb r3, [r5, r1]
	cmp r3, #0
	bne _02261052
	ldr r0, _022610AC ; =0x00002F2C
	add r1, r2, r0
	lsl r0, r6, #4
	add r4, r1, r0
	b _0226105A
_02261052:
	add r6, r6, #1
	add r5, #0x10
	cmp r6, r0
	blt _02261042
_0226105A:
	cmp r4, #0
	bne _02261066
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02261066:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _02261070
	bl GF_AssertFail
_02261070:
	mov r0, #1
	strb r7, [r4, #1]
	strb r0, [r4, #0xc]
	cmp r7, #1
	beq _02261084
	cmp r7, #2
	beq _0226108C
	cmp r7, #3
	beq _02261098
	b _022610A0
_02261084:
	ldr r0, [r4, #4]
	lsl r0, r0, #1
	str r0, [r4, #8]
	b _022610A0
_0226108C:
	ldr r1, [r4, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #8]
	b _022610A0
_02261098:
	ldr r1, [r4, #4]
	lsl r0, r1, #1
	add r0, r1, r0
	str r0, [r4, #8]
_022610A0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022610A4: .word 0x00002FB0
_022610A8: .word 0x00002F38
_022610AC: .word 0x00002F2C
	thumb_func_end ov93_02260FB8

	thumb_func_start ov93_022610B0
ov93_022610B0: ; 0x022610B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r4, _02261144 ; =ov93_02262E68
	add r7, r0, #0
	str r1, [sp]
	add r3, sp, #4
	mov r2, #6
_022610BE:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022610BE
	ldr r0, [r4]
	ldr r4, [sp]
	ldr r5, _02261148 ; =ov93_02262CB4
	str r0, [r3]
	mov r6, #0
_022610D0:
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	add r2, sp, #4
	bl sub_0200D734
	mov r3, #0x16
	str r0, [r4]
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	lsr r1, r6, #0x1f
	add r1, r6, r1
	asr r1, r1, #1
	ldr r0, [r4]
	add r1, #0x1f
	bl sub_0200DC4C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #4
	blt _022610D0
	ldr r0, [r7]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #2
	beq _0226111E
	cmp r0, #3
	beq _02261136
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_0226111E:
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #8]
	bl sub_0200DCE8
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_0200DCE8
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_02261136:
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #4]
	bl sub_0200DCE8
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02261144: .word ov93_02262E68
_02261148: .word ov93_02262CB4
	thumb_func_end ov93_022610B0

	thumb_func_start ov93_0226114C
ov93_0226114C: ; 0x0226114C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r4, #0
_02261152:
	ldr r0, [r5]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02261152
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_0226114C

	thumb_func_start ov93_02261164
ov93_02261164: ; 0x02261164
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r4, _022612CC ; =ov93_02262E9C
	add r5, r0, #0
	str r1, [sp]
	add r3, sp, #0xc
	mov r2, #6
_02261172:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02261172
	ldr r0, [r4]
	ldr r4, [sp]
	str r0, [r3]
	mov r0, #0
	ldr r7, _022612D0 ; =ov93_02262C7A
	str r0, [sp, #8]
_02261186:
	ldr r0, [sp]
	add r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	add r0, r1, r0
	bl GF_SinDegFX32
	asr r1, r0, #0x1f
	mov r2, #0x4c
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r2, r0, r2
	ldr r0, _022612D4 ; =0
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r6, r2, #0xc
	orr r6, r0
	ldr r0, [sp]
	add r6, #0x80
	add r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	add r0, r1, r0
	bl GF_CosDegFX32
	asr r1, r0, #0x1f
	mov r2, #0x44
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r0, r0, r2
	ldr r2, _022612D4 ; =0
	adc r1, r2
	lsr r2, r0, #0xc
	lsl r1, r1, #0x14
	orr r2, r1
	mov r0, #0x62
	sub r0, r0, r2
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	add r2, sp, #0xc
	bl sub_0200D734
	ldr r2, [sp, #4]
	lsl r1, r6, #0x10
	sub r2, #0x18
	lsl r2, r2, #0x10
	mov r3, #0x16
	str r0, [r4]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldrh r1, [r7, #2]
	ldr r0, [r4]
	bl sub_0200DC4C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r4]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _022612D8 ; =ov93_02262ED0
	bl sub_0200D734
	mov r1, #0
	mov r3, #0x16
	add r2, r1, #0
	lsl r3, r3, #0x10
	str r0, [r4, #4]
	bl sub_0200DDF4
	ldr r0, [r4, #4]
	mov r1, #0x21
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _022612DC ; =ov93_02262F04
	bl sub_0200D734
	ldr r2, [sp, #4]
	lsl r1, r6, #0x10
	lsl r2, r2, #0x10
	mov r3, #0x16
	str r0, [r4, #8]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_0200DF98
	mov r1, #0xfe
	lsl r1, r1, #0x16
	ldr r0, [r4, #8]
	add r2, r1, #0
	bl sub_0200E024
	ldr r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0x22
	bl sub_0200DC4C
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0200DCE8
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x30
	bl ov93_02262444
	ldr r0, [sp, #8]
	add r4, #0x4c
	add r0, r0, #1
	add r7, r7, #2
	str r0, [sp, #8]
	cmp r0, #3
	bge _022612B4
	b _02261186
_022612B4:
	ldr r0, [sp]
	mov r1, #1
	ldr r0, [r0]
	bl sub_0200DCE8
	ldr r0, [sp]
	mov r1, #1
	ldr r0, [r0, #8]
	bl sub_0200DCE8
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022612CC: .word ov93_02262E9C
_022612D0: .word ov93_02262C7A
_022612D4: .word 0
_022612D8: .word ov93_02262ED0
_022612DC: .word ov93_02262F04
	thumb_func_end ov93_02261164

	thumb_func_start ov93_022612E0
ov93_022612E0: ; 0x022612E0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
_022612E8:
	ldr r0, [r5]
	bl sub_0200D9DC
	ldr r0, [r5, #4]
	bl sub_0200D9DC
	ldr r0, [r5, #8]
	bl sub_0200D9DC
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x30
	bl ov93_02262484
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #3
	blt _022612E8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov93_022612E0

	thumb_func_start ov93_02261310
ov93_02261310: ; 0x02261310
	push {r4, lr}
	add r4, r1, #0
	add r1, #0xf4
	ldrb r1, [r1]
	mov r0, #0x1e
	lsl r0, r0, #0xc
	lsl r2, r1, #2
	ldr r1, _02261350 ; =ov93_02262CC4
	ldrb r1, [r1, r2]
	bl _s32_div_f
	add r1, r4, #0
	add r1, #0xe8
	str r0, [r1]
	mov r1, #0
	add r2, r1, #0
	add r3, r4, #0
_02261332:
	lsl r0, r2, #0xc
	str r0, [r3, #0xc]
	add r1, r1, #1
	strb r1, [r3, #0x14]
	add r2, #0x5a
	add r3, #0x4c
	cmp r1, #3
	blt _02261332
	mov r0, #2
	strb r0, [r4, #0x10]
	mov r0, #1
	add r4, #0xf1
	strb r0, [r4]
	pop {r4, pc}
	nop
_02261350: .word ov93_02262CC4
	thumb_func_end ov93_02261310

	thumb_func_start ov93_02261354
ov93_02261354: ; 0x02261354
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xf1
	ldrb r0, [r0]
	mov r5, #0
	cmp r0, #1
	bne _02261368
	b _022614E8
_02261368:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xec
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xf2
	ldrb r0, [r0]
	cmp r0, #0
	bne _022613F4
	add r0, r4, #0
	add r0, #0xe4
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0xe4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xf3
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf3
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0xf4
	ldrb r1, [r1]
	add r0, r4, #0
	add r0, #0xf3
	lsl r2, r1, #2
	ldr r1, _022614EC ; =ov93_02262CC4
	ldrb r0, [r0]
	ldrb r1, [r1, r2]
	cmp r0, r1
	blo _02261456
	add r0, r4, #0
	add r0, #0xf3
	strb r5, [r0]
	add r0, r4, #0
	add r0, #0xf0
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xf0
	ldrb r1, [r0]
	mov r0, #0x1e
	lsl r0, r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r0, r4, #0
	add r0, #0xe4
	str r2, [r0]
	add r0, r4, #0
	add r0, #0xf4
	ldrb r0, [r0]
	lsl r1, r0, #2
	ldr r0, _022614F0 ; =ov93_02262CC5
	ldrb r1, [r0, r1]
	add r0, r4, #0
	add r0, #0xf2
	strb r1, [r0]
	b _02261456
_022613F4:
	add r0, r4, #0
	add r0, #0xf2
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0xf2
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xf2
	ldrb r0, [r0]
	cmp r0, #0
	bne _02261456
	add r0, r4, #0
	add r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0xc
	blo _02261456
	add r0, r4, #0
	add r0, #0xf0
	strb r5, [r0]
	add r0, r4, #0
	add r0, #0xf4
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf4
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xf4
	ldrb r0, [r0]
	cmp r0, #5
	blo _0226143C
	add r0, r4, #0
	mov r1, #4
	add r0, #0xf4
	strb r1, [r0]
_0226143C:
	add r1, r4, #0
	add r1, #0xf4
	ldrb r1, [r1]
	mov r0, #0x1e
	lsl r0, r0, #0xc
	lsl r2, r1, #2
	ldr r1, _022614EC ; =ov93_02262CC4
	ldrb r1, [r1, r2]
	bl _s32_div_f
	add r1, r4, #0
	add r1, #0xe8
	str r0, [r1]
_02261456:
	add r0, r4, #0
	add r0, #0xf4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02261492
	ldr r1, _022614EC ; =ov93_02262CC4
	mov r0, #0
	mov r7, #0xc
_02261466:
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	add r0, r0, #1
	add r1, r1, #4
	add r2, r3, r2
	add r3, r2, #0
	mul r3, r7
	add r5, r5, r3
	cmp r0, #2
	blt _02261466
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	sub r5, #0xf
	cmp r5, r0
	bne _022614C6
	add r0, r4, #0
	add r0, #0x4c
	mov r1, #1
	bl ov93_02261528
	b _022614C6
_02261492:
	cmp r0, #2
	bne _022614C6
	ldr r0, _022614EC ; =ov93_02262CC4
	mov r1, #0
	mov r7, #0xc
_0226149C:
	ldrb r3, [r0]
	ldrb r2, [r0, #1]
	add r1, r1, #1
	add r0, r0, #4
	add r2, r3, r2
	add r3, r2, #0
	mul r3, r7
	add r5, r5, r3
	cmp r1, #3
	blt _0226149C
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	sub r5, #0xf
	cmp r5, r0
	bne _022614C6
	add r0, r4, #0
	add r0, #0x98
	mov r1, #1
	bl ov93_02261528
_022614C6:
	mov r7, #0
	add r5, r4, #0
_022614CA:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov93_02261538
	add r2, r5, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, #0x30
	bl ov93_02262540
	add r7, r7, #1
	add r5, #0x4c
	cmp r7, #3
	blt _022614CA
_022614E8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022614EC: .word ov93_02262CC4
_022614F0: .word ov93_02262CC5
	thumb_func_end ov93_02261354

	thumb_func_start ov93_022614F4
ov93_022614F4: ; 0x022614F4
	push {r3, r4}
	ldr r2, _02261524 ; =0x00001468
	mov r3, #0
	add r2, r0, r2
	add r4, r2, #0
_022614FE:
	ldrb r0, [r4, #0x15]
	cmp r0, #1
	bne _02261512
	mov r0, #0x4c
	mul r0, r3
	add r0, r2, r0
	str r0, [r1]
	ldrb r0, [r0, #0x14]
	pop {r3, r4}
	bx lr
_02261512:
	add r3, r3, #1
	add r4, #0x4c
	cmp r3, #3
	blt _022614FE
	mov r0, #0
	str r0, [r1]
	pop {r3, r4}
	bx lr
	nop
_02261524: .word 0x00001468
	thumb_func_end ov93_022614F4

	thumb_func_start ov93_02261528
ov93_02261528: ; 0x02261528
	strb r1, [r0, #0x10]
	mov r1, #0
	strb r1, [r0, #0x11]
	strb r1, [r0, #0x12]
	str r1, [r0, #0x18]
	strb r1, [r0, #0x15]
	bx lr
	.balign 4, 0
	thumb_func_end ov93_02261528

	thumb_func_start ov93_02261538
ov93_02261538: ; 0x02261538
	push {r4, lr}
	ldrb r3, [r2, #0x10]
	lsl r4, r3, #2
	ldr r3, _02261548 ; =ov93_02262C94
	ldr r3, [r3, r4]
	blx r3
	pop {r4, pc}
	nop
_02261548: .word ov93_02262C94
	thumb_func_end ov93_02261538

	thumb_func_start ov93_0226154C
ov93_0226154C: ; 0x0226154C
	mov r0, #0
	strb r0, [r2, #0x15]
	mov r0, #1
	bx lr
	thumb_func_end ov93_0226154C

	thumb_func_start ov93_02261554
ov93_02261554: ; 0x02261554
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r2, #0
	mov r0, #0x1c
	ldrsh r0, [r5, r0]
	add r1, sp, #0
	strh r0, [r1, #2]
	mov r0, #0x1e
	ldrsh r0, [r5, r0]
	strh r0, [r1]
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	beq _02261574
	cmp r0, #1
	beq _022615A8
	b _02261732
_02261574:
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_0200DCE8
	add r1, sp, #0
	mov r3, #0x16
	ldr r0, [r5]
	add r1, #2
	add r2, sp, #0
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	strh r0, [r5, #0x1c]
	mov r0, #0
	ldrsh r0, [r1, r0]
	strh r0, [r5, #0x1e]
	ldrb r0, [r5, #0x11]
	add r0, r0, #1
	strb r0, [r5, #0x11]
_022615A8:
	mov r1, #0x5a
	ldr r2, [r5, #0xc]
	lsl r1, r1, #0xc
	cmp r2, r1
	bgt _022615BA
	bge _022615EC
	cmp r2, #0
	beq _022615CC
	b _02261654
_022615BA:
	lsl r0, r1, #1
	cmp r2, r0
	bgt _022615C4
	beq _02261614
	b _02261654
_022615C4:
	ldr r0, _0226173C ; =0x0010E000
	cmp r2, r0
	beq _02261634
	b _02261654
_022615CC:
	mov r0, #0x1e
	ldrsh r0, [r5, r0]
	ldrb r1, [r5, #0x12]
	add r0, #0x20
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mul r0, r1
	mov r1, #0xf
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	sub r1, #0x20
	add r0, sp, #0
	strh r1, [r0]
	b _02261658
_022615EC:
	mov r0, #0x1c
	ldrsh r2, [r5, r0]
	mov r0, #0x12
	lsl r0, r0, #4
	sub r0, r2, r0
	lsl r0, r0, #0x10
	ldrb r1, [r5, #0x12]
	asr r0, r0, #0x10
	mul r0, r1
	mov r1, #0xf
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	mov r0, #0x12
	lsl r0, r0, #4
	add r1, r1, r0
	add r0, sp, #0
	strh r1, [r0, #2]
	b _02261658
_02261614:
	mov r0, #0x1e
	ldrsh r0, [r5, r0]
	ldrb r1, [r5, #0x12]
	sub r0, #0xe4
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mul r0, r1
	mov r1, #0xf
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	add r1, #0xe4
	add r0, sp, #0
	strh r1, [r0]
	b _02261658
_02261634:
	mov r0, #0x1c
	ldrsh r0, [r5, r0]
	ldrb r1, [r5, #0x12]
	add r0, #0x20
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mul r0, r1
	mov r1, #0xf
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	sub r1, #0x20
	add r0, sp, #0
	strh r1, [r0, #2]
	b _02261658
_02261654:
	bl GF_AssertFail
_02261658:
	ldrb r1, [r5, #0x12]
	cmp r1, #0xf
	blo _022616A0
	mov r1, #0x1c
	mov r2, #0x1e
	mov r3, #0x16
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r5]
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r2, #0x1e
	ldrsh r2, [r5, r2]
	mov r1, #0x1c
	mov r3, #0x16
	add r2, #0x18
	lsl r2, r2, #0x10
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #8]
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	add r0, r5, #0
	mov r1, #2
	bl ov93_02261528
	add r1, r5, #0
	add r5, #0x30
	add r0, r4, #0
	add r2, r5, #0
	bl ov93_0226249C
	mov r0, #1
	pop {r3, r4, r5, pc}
_022616A0:
	mov r0, #0xb4
	mul r0, r1
	lsl r0, r0, #0xc
	mov r1, #0xf
	bl _s32_div_f
	bl GF_SinDegFX32
	mov r2, #6
	asr r1, r0, #0x1f
	lsl r2, r2, #0xe
	mov r3, #0
	bl _ll_mul
	mov r3, #2
	mov r2, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r2
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	neg r1, r1
	asr r0, r1, #0xb
	add r3, sp, #0
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r4, r0, #0xc
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, r2, r4
	lsl r2, r2, #0x10
	mov r3, #0x16
	ldr r0, [r5]
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, #0x18
	lsl r2, r2, #0x10
	mov r3, #0x16
	ldr r0, [r5, #8]
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	neg r0, r4
	mov r1, #3
	bl _s32_div_f
	lsl r0, r0, #0xc
	mov r1, #0x18
	bl _s32_div_f
	mov r1, #1
	lsl r1, r1, #0xc
	sub r0, r1, r0
	bl _fflt
	ldr r1, _02261740 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, [r5, #8]
	add r2, r1, #0
	bl sub_0200E024
_02261732:
	ldrb r0, [r5, #0x12]
	add r0, r0, #1
	strb r0, [r5, #0x12]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0226173C: .word 0x0010E000
_02261740: .word 0x45800000
	thumb_func_end ov93_02261554

	thumb_func_start ov93_02261744
ov93_02261744: ; 0x02261744
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xf3
	ldrb r0, [r0]
	add r4, r2, #0
	cmp r0, #0
	beq _02261774
	add r1, #0xf4
	ldrb r1, [r1]
	mov r0, #0xb
	lsl r0, r0, #0xe
	lsl r2, r1, #2
	ldr r1, _022618BC ; =ov93_02262CC4
	ldrb r1, [r1, r2]
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_0200DC34
	b _0226177C
_02261774:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0200DCC0
_0226177C:
	add r0, r5, #0
	add r0, #0xf3
	ldrb r1, [r0]
	mov r0, #0xb4
	mul r0, r1
	add r1, r5, #0
	add r1, #0xf4
	ldrb r1, [r1]
	lsl r0, r0, #0xc
	lsl r2, r1, #2
	ldr r1, _022618BC ; =ov93_02262CC4
	ldrb r1, [r1, r2]
	bl _s32_div_f
	bl GF_SinDegFX32
	mov r2, #3
	asr r1, r0, #0x1f
	lsl r2, r2, #0xe
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	neg r1, r1
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r7, r0, #0xc
	add r0, r5, #0
	add r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	add r0, r1, r0
	bl GF_SinDegFX32
	asr r1, r0, #0x1f
	mov r2, #0x4c
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r6, r2, #0xc
	orr r6, r0
	add r0, r5, #0
	add r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	add r6, #0x80
	add r0, r1, r0
	bl GF_CosDegFX32
	asr r1, r0, #0x1f
	mov r2, #0x44
	mov r3, #0
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsr r2, r0, #0xc
	lsl r1, r1, #0x14
	orr r2, r1
	mov r0, #0x62
	sub r0, r0, r2
	str r0, [sp, #4]
	ldr r2, [sp, #4]
	lsl r1, r6, #0x10
	sub r2, #0x18
	add r2, r2, r7
	lsl r2, r2, #0x10
	mov r3, #0x16
	ldr r0, [r4]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r2, [sp, #4]
	lsl r1, r6, #0x10
	lsl r2, r2, #0x10
	mov r3, #0x16
	ldr r0, [r4, #8]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	neg r0, r7
	mov r1, #3
	bl _s32_div_f
	lsl r0, r0, #0xc
	mov r1, #0xc
	bl _s32_div_f
	mov r1, #1
	lsl r1, r1, #0xc
	sub r0, r1, r0
	bl _fflt
	ldr r1, _022618C0 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	bl sub_0200E024
	add r1, r5, #0
	add r1, #0xf4
	ldrb r1, [r1]
	add r0, r5, #0
	add r0, #0xf3
	lsl r2, r1, #2
	ldr r1, _022618BC ; =ov93_02262CC4
	ldrb r0, [r0]
	ldrb r1, [r1, r2]
	sub r1, r1, #1
	cmp r0, r1
	bne _02261896
	add r2, r4, #0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, #0x30
	bl ov93_0226249C
_02261896:
	add r5, #0xe4
	ldr r1, [r5]
	ldr r0, [r4, #0xc]
	add r0, r1, r0
	mov r1, #0x5a
	asr r0, r0, #0xc
	lsl r1, r1, #2
	bl _s32_div_f
	cmp r1, #0xb4
	bne _022618B0
	mov r0, #1
	b _022618B2
_022618B0:
	mov r0, #0
_022618B2:
	strb r0, [r4, #0x15]
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022618BC: .word ov93_02262CC4
_022618C0: .word 0x45800000
	thumb_func_end ov93_02261744

	thumb_func_start ov93_022618C4
ov93_022618C4: ; 0x022618C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldrb r0, [r4, #0x11]
	add r5, r1, #0
	cmp r0, #3
	bls _022618D4
	b _02261BA2
_022618D4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022618E0: ; jump table
	.short _022618E8 - _022618E0 - 2 ; case 0
	.short _0226195A - _022618E0 - 2 ; case 1
	.short _022619AE - _022618E0 - 2 ; case 2
	.short _02261ACA - _022618E0 - 2 ; case 3
_022618E8:
	ldr r0, _02261BA8 ; =0x00000593
	bl PlaySE
	add r1, sp, #8
	mov r3, #0x16
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #8
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r3, sp, #4
	mov r2, #4
	ldrsh r2, [r3, r2]
	mov r1, #6
	ldrsh r1, [r3, r1]
	sub r2, #0x20
	lsl r2, r2, #0x10
	mov r3, #0x16
	ldr r0, [r4, #4]
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r0, [r4, #4]
	mov r1, #0x21
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_0200DCE8
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsl r2, r1, #1
	ldr r1, _02261BAC ; =ov93_02262C7A
	ldrh r1, [r1, r2]
	add r1, r1, #2
	bl sub_0200DC4C
	add r0, r5, #0
	add r0, #0xf4
	ldrb r0, [r0]
	ldr r1, _02261BB0 ; =ov93_02262CC6
	add r5, #0xf4
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	strb r0, [r4, #0x12]
	ldrb r0, [r5]
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	lsr r0, r0, #1
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0x11]
	add r0, r0, #1
	strb r0, [r4, #0x11]
	b _02261BA2
_0226195A:
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	cmp r1, r0
	bne _02261984
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsl r2, r1, #1
	ldr r1, _02261BAC ; =ov93_02262C7A
	ldrh r1, [r1, r2]
	add r1, r1, #1
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_0200DCE8
	mov r1, #1
	ldr r0, [r4, #4]
	lsl r1, r1, #0xe
	bl sub_0200DC34
_02261984:
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _022619A8
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_0200DCE8
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsl r2, r1, #1
	ldr r1, _02261BAC ; =ov93_02262C7A
	ldrh r1, [r1, r2]
	bl sub_0200DC4C
	ldrb r0, [r4, #0x11]
	add r0, r0, #1
	strb r0, [r4, #0x11]
	b _02261BA2
_022619A8:
	sub r0, r0, #1
	strb r0, [r4, #0x12]
	b _02261BA2
_022619AE:
	add r0, r5, #0
	add r0, #0xf2
	ldrb r0, [r0]
	mov r2, #0
	cmp r0, #0
	bne _022619E0
	add r0, r5, #0
	add r0, #0xf4
	ldrb r0, [r0]
	add r3, r5, #0
	add r3, #0xf3
	lsl r1, r0, #2
	ldr r0, _02261BB4 ; =ov93_02262CC4
	ldrb r3, [r3]
	ldrb r0, [r0, r1]
	add r5, #0xf0
	sub r3, r0, r3
	add r3, r2, r3
	ldr r2, _02261BB8 ; =ov93_02262CC5
	ldrb r1, [r2, r1]
	add r1, r3, r1
	add r6, r1, r0
	ldrb r0, [r5]
	add r5, r0, #2
	b _02261A0C
_022619E0:
	add r1, r2, r0
	add r0, r5, #0
	add r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0xc
	blo _022619FE
	add r5, #0xf4
	ldrb r0, [r5]
	mov r5, #1
	add r0, r0, #1
	lsl r2, r0, #2
	ldr r0, _02261BB4 ; =ov93_02262CC4
	ldrb r0, [r0, r2]
	add r6, r1, r0
	b _02261A0C
_022619FE:
	add r5, #0xf4
	ldrb r2, [r5]
	add r5, r0, #1
	lsl r3, r2, #2
	ldr r2, _02261BB4 ; =ov93_02262CC4
	ldrb r2, [r2, r3]
	add r6, r1, r2
_02261A0C:
	mov r1, #0x1e
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0xc
	bl _s32_div_f
	add r0, r5, r0
	mov r1, #0xc
	bl _s32_div_f
	add r5, r1, #0
	mov r0, #0x1e
	lsl r0, r0, #0xc
	add r7, r5, #0
	mul r7, r0
	add r0, r7, #0
	bl GF_SinDegFX32
	add r5, r0, #0
	add r0, r7, #0
	bl GF_CosDegFX32
	str r0, [sp]
	add r1, sp, #4
	mov r3, #0x16
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #4
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #4
	mov r3, #0
	ldrsh r0, [r1, r3]
	mov r2, #0x4c
	add r0, #0x18
	strh r0, [r1]
	mov r0, #2
	ldrsh r7, [r1, r0]
	asr r1, r5, #0x1f
	add r0, r5, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r1, #0x80
	lsl r0, r1, #0x10
	asr r0, r0, #0x10
	sub r0, r0, r7
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl _s32_div_f
	str r0, [r4, #0x20]
	add r0, sp, #4
	mov r3, #0
	ldrsh r5, [r0, r3]
	ldr r0, [sp]
	mov r2, #0x44
	asr r1, r0, #0x1f
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsr r2, r0, #0xc
	lsl r1, r1, #0x14
	orr r2, r1
	mov r0, #0x62
	sub r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	sub r0, r0, r5
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl _s32_div_f
	str r0, [r4, #0x24]
	lsl r0, r7, #0xc
	str r0, [r4, #0x28]
	lsl r0, r5, #0xc
	str r0, [r4, #0x2c]
	strb r6, [r4, #0x12]
	str r6, [r4, #0x18]
	ldrb r0, [r4, #0x11]
	add r0, r0, #1
	strb r0, [r4, #0x11]
_02261ACA:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x20]
	add r0, r1, r0
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x24]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldrb r1, [r4, #0x12]
	mov r0, #0xb4
	mul r0, r1
	ldr r1, [r4, #0x18]
	lsl r0, r0, #0xc
	bl _s32_div_f
	bl GF_SinDegFX32
	mov r2, #3
	asr r1, r0, #0x1f
	lsl r2, r2, #0xe
	mov r3, #0
	bl _ll_mul
	add r5, r0, #0
	ldr r2, [r4, #0x28]
	add r6, r1, #0
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	ldr r2, [r4, #0x2c]
	lsl r1, r1, #4
	asr r3, r2, #0xb
	lsr r3, r3, #0x14
	add r3, r2, r3
	mov r2, #2
	asr r3, r3, #0xc
	mov r7, #0
	lsl r2, r2, #0xa
	asr r1, r1, #0x10
	sub r3, #0x18
	add r2, r5, r2
	adc r6, r7
	lsl r5, r6, #0x14
	lsr r2, r2, #0xc
	orr r2, r5
	neg r5, r2
	asr r2, r5, #0xb
	lsr r2, r2, #0x14
	add r2, r5, r2
	asr r2, r2, #0xc
	add r2, r3, r2
	lsl r2, r2, #0x10
	mov r3, #0x16
	ldr r0, [r4]
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r0, #0xb
	ldr r1, [r4, #0x18]
	lsl r0, r0, #0xe
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_0200DC34
	ldr r2, [r4, #0x28]
	ldr r3, [r4, #0x2c]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	lsl r1, r1, #4
	lsl r2, r2, #4
	mov r3, #0x16
	ldr r0, [r4, #8]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldrb r0, [r4, #0x12]
	sub r0, r0, #1
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _02261BA2
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsl r2, r1, #1
	ldr r1, _02261BAC ; =ov93_02262C7A
	ldrh r1, [r1, r2]
	bl sub_0200DC4C
	ldr r0, [r4]
	add r1, r7, #0
	bl sub_0200DCC0
	add r0, r4, #0
	mov r1, #2
	bl ov93_02261528
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02261BA2:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02261BA8: .word 0x00000593
_02261BAC: .word ov93_02262C7A
_02261BB0: .word ov93_02262CC6
_02261BB4: .word ov93_02262CC4
_02261BB8: .word ov93_02262CC5
	thumb_func_end ov93_022618C4

	thumb_func_start ov93_02261BBC
ov93_02261BBC: ; 0x02261BBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r6, _02261C34 ; =ov93_02262E9C
	add r5, r0, #0
	add r4, r1, #0
	add r3, sp, #0
	mov r2, #6
_02261BCA:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02261BCA
	ldr r0, [r6]
	mov r7, #0x16
	str r0, [r3]
	mov r6, #0
	lsl r7, r7, #0x10
_02261BDC:
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0
	str r0, [r4]
	add r2, r1, #0
	add r3, r7, #0
	bl sub_0200DDF4
	ldr r0, [r4]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _02261C38 ; =ov93_02262ED0
	bl sub_0200D734
	mov r1, #0
	str r0, [r4, #4]
	add r2, r1, #0
	add r3, r7, #0
	bl sub_0200DDF4
	ldr r0, [r4, #4]
	mov r1, #0x21
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_0200DCE8
	add r6, r6, #1
	add r4, #0x18
	cmp r6, #3
	blt _02261BDC
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02261C34: .word ov93_02262E9C
_02261C38: .word ov93_02262ED0
	thumb_func_end ov93_02261BBC

	thumb_func_start ov93_02261C3C
ov93_02261C3C: ; 0x02261C3C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r4, #0
_02261C42:
	ldr r0, [r5]
	bl sub_0200D9DC
	ldr r0, [r5, #4]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #3
	blt _02261C42
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_02261C3C

	thumb_func_start ov93_02261C58
ov93_02261C58: ; 0x02261C58
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	str r3, [sp]
	ldr r4, _02261D04 ; =0
	beq _02261D02
	bl sub_0203769C
	ldr r1, [sp]
	cmp r1, r0
	beq _02261D02
	add r0, r4, #0
	add r2, r7, #0
_02261C74:
	ldrb r1, [r2, #0x15]
	cmp r1, #0
	bne _02261C82
	mov r1, #0x18
	mul r1, r0
	add r4, r7, r1
	b _02261C8A
_02261C82:
	add r0, r0, #1
	add r2, #0x18
	cmp r0, #3
	blt _02261C74
_02261C8A:
	cmp r4, #0
	beq _02261D02
	ldr r1, [sp]
	add r0, r6, #0
	bl ov93_0225E3C4
	ldr r1, [r6]
	ldr r2, _02261D08 ; =ov93_02262D2C
	add r1, #0x30
	ldrb r1, [r1]
	add r7, r0, #0
	ldr r0, [r4]
	lsl r3, r1, #3
	lsl r1, r7, #1
	add r2, r2, r3
	ldrh r1, [r1, r2]
	bl sub_0200DD10
	ldr r1, _02261D0C ; =ov93_02262C7A
	lsl r2, r5, #1
	ldrh r1, [r1, r2]
	ldr r0, [r4]
	bl sub_0200DC4C
	ldr r0, [r6]
	mov r3, #0x16
	add r0, #0x30
	ldrb r0, [r0]
	lsl r3, r3, #0x10
	lsl r1, r0, #2
	ldr r0, _02261D10 ; =ov93_02262CD8
	add r0, r0, r1
	ldrb r0, [r7, r0]
	ldr r1, _02261D14 ; =ov93_02262CB4
	lsl r2, r0, #2
	ldr r0, _02261D18 ; =ov93_02262CB6
	ldrsh r1, [r1, r2]
	ldrsh r0, [r0, r2]
	mov r2, #0x10
	sub r0, #0x18
	strh r0, [r4, #0x10]
	ldrsh r2, [r4, r2]
	ldr r0, [r4]
	sub r2, #0x60
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDF4
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [sp, #0x18]
	strb r5, [r4, #0x12]
	sub r0, #0xc
	strh r0, [r4, #0x16]
	mov r0, #0
	strb r0, [r4, #0x13]
	mov r0, #1
	strb r0, [r4, #0x15]
_02261D02:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02261D04: .word 0
_02261D08: .word ov93_02262D2C
_02261D0C: .word ov93_02262C7A
_02261D10: .word ov93_02262CD8
_02261D14: .word ov93_02262CB4
_02261D18: .word ov93_02262CB6
	thumb_func_end ov93_02261C58

	thumb_func_start ov93_02261D1C
ov93_02261D1C: ; 0x02261D1C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r4, #0
	add r5, r6, #0
_02261D24:
	ldrb r0, [r5, #0x15]
	cmp r0, #1
	bne _02261D32
	add r0, r6, #0
	add r1, r5, #0
	bl ov93_02261D3C
_02261D32:
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #3
	blt _02261D24
	pop {r4, r5, r6, pc}
	thumb_func_end ov93_02261D1C

	thumb_func_start ov93_02261D3C
ov93_02261D3C: ; 0x02261D3C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldrb r0, [r4, #0x13]
	cmp r0, #4
	bls _02261D4A
	b _02261E88
_02261D4A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261D56: ; jump table
	.short _02261D60 - _02261D56 - 2 ; case 0
	.short _02261D88 - _02261D56 - 2 ; case 1
	.short _02261DC4 - _02261D56 - 2 ; case 2
	.short _02261E20 - _02261D56 - 2 ; case 3
	.short _02261E5A - _02261D56 - 2 ; case 4
_02261D60:
	add r1, sp, #0
	mov r3, #0x16
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #0
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	lsl r0, r0, #0xc
	str r0, [r4, #8]
	mov r0, #0
	ldrsh r0, [r1, r0]
	lsl r0, r0, #0xc
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x13]
	add r0, r0, #1
	strb r0, [r4, #0x13]
_02261D88:
	mov r0, #0x16
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02261D96
	sub r0, r0, #1
	strh r0, [r4, #0x16]
	b _02261E88
_02261D96:
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #2
	ldr r1, [r4, #0xc]
	lsl r0, r0, #0xe
	add r2, r1, r0
	str r2, [r4, #0xc]
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	asr r0, r2, #0xb
	lsr r0, r0, #0x14
	add r0, r2, r0
	asr r0, r0, #0xc
	cmp r0, r1
	blt _02261E88
	lsl r0, r1, #0xc
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x13]
	add r0, r0, #1
	strb r0, [r4, #0x13]
	b _02261E88
_02261DC4:
	add r1, sp, #0
	mov r3, #0x16
	ldr r0, [r4]
	add r1, #2
	add r2, sp, #0
	lsl r3, r3, #0x10
	bl sub_0200DE94
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	sub r2, #0x20
	lsl r2, r2, #0x10
	mov r3, #0x16
	ldr r0, [r4, #4]
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r0, [r4, #4]
	mov r1, #0x21
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, _02261EB0 ; =0x00000593
	bl PlaySE
	ldrb r1, [r4, #0x12]
	ldr r0, [r4]
	lsl r2, r1, #1
	ldr r1, _02261EB4 ; =ov93_02262C7A
	ldrh r1, [r1, r2]
	add r1, r1, #2
	bl sub_0200DC4C
	mov r0, #8
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x13]
	add r0, r0, #1
	strb r0, [r4, #0x13]
	b _02261E88
_02261E20:
	ldrb r0, [r4, #0x14]
	sub r0, r0, #1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x14]
	cmp r0, #3
	bne _02261E36
	mov r1, #1
	ldr r0, [r4, #4]
	lsl r1, r1, #0xe
	bl sub_0200DC34
_02261E36:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _02261E88
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_0200DCE8
	ldrb r1, [r4, #0x12]
	ldr r0, [r4]
	lsl r2, r1, #1
	ldr r1, _02261EB4 ; =ov93_02262C7A
	ldrh r1, [r1, r2]
	bl sub_0200DC4C
	ldrb r0, [r4, #0x13]
	add r0, r0, #1
	strb r0, [r4, #0x13]
	b _02261E88
_02261E5A:
	mov r0, #2
	ldr r1, [r4, #0xc]
	lsl r0, r0, #0xe
	sub r1, r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	str r1, [r4, #0xc]
	asr r1, r0, #0xc
	mov r0, #0x10
	ldrsh r0, [r4, r0]
	sub r0, #0x60
	cmp r1, r0
	bgt _02261E88
	ldr r0, [r4]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0
	strb r0, [r4, #0x13]
	add sp, #4
	strb r0, [r4, #0x15]
	pop {r3, r4, pc}
_02261E88:
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	lsl r1, r1, #4
	lsl r2, r2, #4
	mov r3, #0x16
	ldr r0, [r4]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02261EB0: .word 0x00000593
_02261EB4: .word ov93_02262C7A
	thumb_func_end ov93_02261D3C

	thumb_func_start ov93_02261EB8
ov93_02261EB8: ; 0x02261EB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x8c]
	ldr r1, [sp, #0x88]
	mov r2, #0
	add r5, r3, #0
	ldr r4, [sp, #0x9c]
	bl FontID_String_GetWidthMultiline
	add r7, r0, #0
	asr r1, r7, #2
	lsr r1, r1, #0x1d
	add r1, r7, r1
	asr r6, r1, #3
	mov r1, #8
	bl FX_ModS32
	cmp r0, #0
	beq _02261EE6
	add r6, r6, #1
_02261EE6:
	add r0, sp, #0x30
	bl InitWindow
	mov r0, #0
	ldr r3, [sp, #0xb0]
	str r0, [sp]
	str r0, [sp, #4]
	lsl r2, r6, #0x18
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x18]
	add r1, sp, #0x30
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddTextWindowTopLeftCorner
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x8c]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x88]
	add r0, sp, #0x30
	str r3, [sp, #0x14]
	bl AddTextPrinterParameterized3
	add r0, sp, #0x30
	mov r1, #1
	mov r2, #0x75
	bl sub_02013688
	mov r1, #1
	add r2, r1, #0
	add r3, sp, #0x24
	bl sub_02021AC8
	ldr r0, [sp, #0xa4]
	cmp r0, #1
	bne _02261F42
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r0, r0, #1
	sub r4, r4, r0
_02261F42:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x40]
	add r0, sp, #0x30
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x1c]
	bl sub_0200E2B0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x98]
	bl sub_0200D934
	str r0, [sp, #0x4c]
	mov r0, #0
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x28]
	str r4, [sp, #0x58]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0xa0]
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0xa8]
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xac]
	str r0, [sp, #0x64]
	mov r0, #1
	str r0, [sp, #0x68]
	mov r0, #0x75
	str r0, [sp, #0x6c]
	add r0, sp, #0x40
	bl sub_020135D8
	ldr r1, [sp, #0x94]
	add r6, r0, #0
	cmp r1, #0
	beq _02261F8C
	bl sub_020138B0
_02261F8C:
	ldr r2, [sp, #0xa0]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020136B4
	add r0, sp, #0x30
	bl RemoveWindow
	str r6, [r5]
	add r3, sp, #0x24
	ldmia r3!, {r0, r1}
	add r2, r5, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	strh r7, [r5, #0x10]
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_02261EB8

	thumb_func_start ov93_02261FB0
ov93_02261FB0: ; 0x02261FB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02013660
	add r0, r4, #4
	bl sub_02021B5C
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_02261FB0

	thumb_func_start ov93_02261FC8
ov93_02261FC8: ; 0x02261FC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r7, #0
	add r5, r0, #0
_02261FD2:
	ldr r0, [sp]
	add r1, r0, r7
	mov r0, #6
	lsl r0, r0, #6
	ldrb r1, [r1, r0]
	cmp r1, #0x40
	bge _02261FEA
	mov r0, #0x40
	sub r6, r0, r1
	add r4, r6, #0
	sub r4, #0x50
	b _02262004
_02261FEA:
	cmp r1, #0x80
	bge _02261FFA
	mov r0, #0xa0
	sub r4, r0, r1
	sub r4, #0x10
	add r6, r4, #0
	sub r6, #0x50
	b _02262004
_02261FFA:
	sub r1, #0xa0
	mov r0, #0x40
	sub r6, r0, r1
	add r4, r6, #0
	sub r4, #0x50
_02262004:
	ldr r0, [r5, #4]
	add r1, sp, #8
	add r2, sp, #4
	bl sub_02013794
	mov r2, #0xa8
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	sub r2, r2, r6
	bl sub_020136B4
	mov r2, #0xa8
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #8]
	sub r2, r2, r4
	bl sub_020136B4
	add r7, r7, #1
	add r5, #0x28
	cmp r7, #6
	blt _02261FD2
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov93_02261FC8

	thumb_func_start ov93_02262034
ov93_02262034: ; 0x02262034
	push {r3, r4, r5, lr}
	ldr r0, _02262094 ; =0x0000019E
	add r4, r1, #0
	ldrsb r1, [r4, r0]
	cmp r1, #0
	ble _02262046
	sub r1, r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
_02262046:
	add r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02262054
	cmp r0, #1
	beq _02262070
	pop {r3, r4, r5, pc}
_02262054:
	add r0, r4, #0
	bl ov93_02262108
	cmp r0, #1
	bne _02262066
	add r0, r4, #0
	bl ov93_022620D4
	pop {r3, r4, r5, pc}
_02262066:
	mov r0, #0x1a
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
_02262070:
	add r0, r4, #0
	bl ov93_02262130
	add r5, r0, #0
	add r0, r4, #0
	bl ov93_02261FC8
	cmp r5, #1
	bne _02262092
	ldr r0, _02262094 ; =0x0000019E
	mov r1, #0xf
	strb r1, [r4, r0]
	add r1, r0, #2
	ldrb r1, [r4, r1]
	add r0, r0, #2
	sub r1, r1, #1
	strb r1, [r4, r0]
_02262092:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02262094: .word 0x0000019E
	thumb_func_end ov93_02262034

	thumb_func_start ov93_02262098
ov93_02262098: ; 0x02262098
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _022620D0 ; =0x000186A0
	add r7, r0, #0
	add r6, r1, #0
	mov r4, #0
_022620A2:
	add r0, r6, #0
	add r1, r5, #0
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #0x63
	lsl r2, r3, #4
	add r1, r7, r4
	lsl r0, r0, #2
	strb r2, [r1, r0]
	add r0, r3, #0
	mul r0, r5
	sub r6, r6, r0
	add r0, r5, #0
	mov r1, #0xa
	bl _s32_div_f
	add r4, r4, #1
	add r5, r0, #0
	cmp r4, #6
	blt _022620A2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022620D0: .word 0x000186A0
	thumb_func_end ov93_02262098

	thumb_func_start ov93_022620D4
ov93_022620D4: ; 0x022620D4
	push {r4, r5, r6, r7}
	mov r1, #0x66
	mov r5, #0
	lsl r1, r1, #2
	add r3, r5, #0
	sub r2, r1, #6
_022620E0:
	mov r6, #0x63
	add r4, r0, r5
	lsl r6, r6, #2
	ldrb r7, [r4, r6]
	sub r6, r6, #6
	strb r7, [r4, r6]
	mov r6, #5
	sub r6, r6, r5
	lsl r6, r6, #1
	strb r6, [r4, r1]
	add r5, r5, #1
	strb r3, [r4, r2]
	cmp r5, #6
	blt _022620E0
	ldr r1, _02262104 ; =0x0000019F
	strb r3, [r0, r1]
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02262104: .word 0x0000019F
	thumb_func_end ov93_022620D4

	thumb_func_start ov93_02262108
ov93_02262108: ; 0x02262108
	push {r4, r5}
	mov r1, #6
	lsl r1, r1, #6
	mov r5, #0
	add r2, r1, #6
_02262112:
	add r3, r0, r5
	ldrb r4, [r3, r1]
	ldrb r3, [r3, r2]
	cmp r4, r3
	beq _02262122
	mov r0, #0
	pop {r4, r5}
	bx lr
_02262122:
	add r5, r5, #1
	cmp r5, #6
	blt _02262112
	mov r0, #1
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov93_02262108

	thumb_func_start ov93_02262130
ov93_02262130: ; 0x02262130
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02262224 ; =0x0000019F
	mov r7, #5
	ldrb r0, [r6, r0]
	cmp r0, #6
	bls _02262142
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262142:
	mov r4, #0
	str r4, [sp]
_02262146:
	ldr r0, [sp]
	add r5, r6, r7
	mov ip, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _0226216A
	mov r0, #0x66
	lsl r0, r0, #2
	ldrsb r0, [r5, r0]
	sub r1, r0, #1
	mov r0, #0x66
	lsl r0, r0, #2
	strb r1, [r5, r0]
	mov r0, #0
	str r0, [sp]
	b _02262216
_0226216A:
	ldr r0, _02262228 ; =0x00000192
	ldrb r0, [r5, r0]
	cmp r0, #1
	bls _02262186
	mov r0, #6
	ldr r1, _0226222C ; =0x00000186
	lsl r0, r0, #6
	ldrb r0, [r5, r0]
	ldrb r1, [r5, r1]
	cmp r0, r1
	bne _02262186
	mov r0, #1
	str r0, [sp]
	b _02262216
_02262186:
	mov r0, #0
	mov r1, #6
	str r0, [sp]
	mov r0, #6
	lsl r1, r1, #6
	lsl r0, r0, #6
	ldrb r2, [r5, r1]
	ldrb r0, [r5, r0]
	add r2, #0x17
	strb r2, [r5, r1]
	add r1, r1, #6
	ldrb r3, [r5, r1]
	add r1, r3, #0
	add r1, #0xa0
	cmp r0, r3
	bgt _022621B0
	mov r2, #6
	lsl r2, r2, #6
	ldrb r2, [r5, r2]
	cmp r2, r3
	bhs _022621BE
_022621B0:
	cmp r0, r1
	bgt _02262204
	mov r0, #6
	lsl r0, r0, #6
	ldrb r0, [r5, r0]
	cmp r0, r1
	blt _02262204
_022621BE:
	ldr r0, _02262228 ; =0x00000192
	ldrb r0, [r5, r0]
	cmp r0, #1
	bhs _022621D2
	ldr r0, _02262228 ; =0x00000192
	ldrb r0, [r5, r0]
	add r1, r0, #1
	ldr r0, _02262228 ; =0x00000192
	strb r1, [r5, r0]
	b _02262204
_022621D2:
	cmp r7, #5
	beq _022621DC
	mov r0, ip
	cmp r0, #1
	bne _02262204
_022621DC:
	ldr r0, _02262228 ; =0x00000192
	ldrb r0, [r5, r0]
	add r1, r0, #1
	ldr r0, _02262228 ; =0x00000192
	strb r1, [r5, r0]
	sub r0, #0xc
	ldrb r1, [r5, r0]
	mov r0, #6
	lsl r0, r0, #6
	strb r1, [r5, r0]
	add r0, #0x1f
	ldrb r0, [r6, r0]
	add r1, r0, #1
	ldr r0, _02262224 ; =0x0000019F
	strb r1, [r6, r0]
	ldrb r0, [r6, r0]
	cmp r0, #6
	blo _02262204
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262204:
	mov r0, #6
	lsl r0, r0, #6
	ldrb r0, [r5, r0]
	mov r1, #0xa0
	bl _s32_div_f
	mov r0, #6
	lsl r0, r0, #6
	strb r1, [r5, r0]
_02262216:
	add r4, r4, #1
	sub r7, r7, #1
	cmp r4, #6
	blt _02262146
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262224: .word 0x0000019F
_02262228: .word 0x00000192
_0226222C: .word 0x00000186
	thumb_func_end ov93_02262130

	thumb_func_start ov93_02262230
ov93_02262230: ; 0x02262230
	push {r4, lr}
	add r1, r0, #0
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	ldr r2, _0226224C ; =ov93_02262F6C
	bl sub_0200D734
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0200DC0C
	add r0, r4, #0
	pop {r4, pc}
	nop
_0226224C: .word ov93_02262F6C
	thumb_func_end ov93_02262230

	thumb_func_start ov93_02262250
ov93_02262250: ; 0x02262250
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r7, r0, #0
	ldr r0, _022622FC ; =0x00003848
	add r6, r7, #0
	ldr r0, [r7, r0]
	add r4, r7, #0
	str r0, [sp, #0x2c]
	mov r0, #5
	str r0, [sp, #0x30]
	ldr r0, _02262300 ; =0x000016B0
	add r6, #0x64
	add r5, r7, r0
	add r4, #0xc8
	add r5, #0x64
_0226226E:
	ldr r0, _02262300 ; =0x000016B0
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0226227A
	bl GF_AssertFail
_0226227A:
	ldr r0, [sp, #0x2c]
	mov r1, #0xa
	bl _u32_div_f
	add r0, r7, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r1, #4
	bl NewString_ReadMsgData
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x2c]
	mov r1, #0xa
	bl _u32_div_f
	str r0, [sp, #0x2c]
	ldr r0, _02262304 ; =0x000015AC
	add r1, sp, #0x3c
	ldr r0, [r4, r0]
	add r2, sp, #0x38
	bl sub_02013794
	ldr r0, [sp, #0x34]
	add r2, r7, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02262308 ; =0x000E0F00
	add r2, #0x90
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0226230C ; =0x00002713
	add r3, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x14]
	mov r0, #0xa8
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #1
	str r0, [sp, #0x20]
	mov r0, #0xc
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp, #0x28]
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x28]
	ldr r2, [r2]
	bl ov93_02261EB8
	ldr r0, [sp, #0x34]
	bl String_Delete
	ldr r0, [sp, #0x30]
	sub r6, #0x14
	sub r4, #0x28
	sub r5, #0x14
	sub r0, r0, #1
	str r0, [sp, #0x30]
	bpl _0226226E
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022622FC: .word 0x00003848
_02262300: .word 0x000016B0
_02262304: .word 0x000015AC
_02262308: .word 0x000E0F00
_0226230C: .word 0x00002713
	thumb_func_end ov93_02262250

	thumb_func_start ov93_02262310
ov93_02262310: ; 0x02262310
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02262334 ; =0x000016B0
	mov r6, #0
	add r4, r5, r0
	add r7, r0, #0
_0226231C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02262328
	add r0, r4, #0
	bl ov93_02261FB0
_02262328:
	add r6, r6, #1
	add r5, #0x14
	add r4, #0x14
	cmp r6, #6
	blt _0226231C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02262334: .word 0x000016B0
	thumb_func_end ov93_02262310

	thumb_func_start ov93_02262338
ov93_02262338: ; 0x02262338
	ldr r3, _02262340 ; =sub_0200D9DC
	add r0, r1, #0
	bx r3
	nop
_02262340: .word sub_0200D9DC
	thumb_func_end ov93_02262338

	thumb_func_start ov93_02262344
ov93_02262344: ; 0x02262344
	push {r4, lr}
	add r1, r0, #0
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	ldr r2, _02262364 ; =ov93_02262FA0
	bl sub_0200D734
	add r4, r0, #0
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4]
	bl sub_0200DC0C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02262364: .word ov93_02262FA0
	thumb_func_end ov93_02262344

	thumb_func_start ov93_02262368
ov93_02262368: ; 0x02262368
	ldr r3, _02262370 ; =sub_0200D9DC
	add r0, r1, #0
	bx r3
	nop
_02262370: .word sub_0200D9DC
	thumb_func_end ov93_02262368

	thumb_func_start ov93_02262374
ov93_02262374: ; 0x02262374
	push {r4, lr}
	add r4, r1, #0
	mov r0, #4
	ldrsh r1, [r4, r0]
	cmp r1, #0xa
	bhi _0226243E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0226238C: ; jump table
	.short _022623A2 - _0226238C - 2 ; case 0
	.short _022623C2 - _0226238C - 2 ; case 1
	.short _022623EA - _0226238C - 2 ; case 2
	.short _0226240C - _0226238C - 2 ; case 3
	.short _0226241E - _0226238C - 2 ; case 4
	.short _022623A2 - _0226238C - 2 ; case 5
	.short _022623C2 - _0226238C - 2 ; case 6
	.short _022623EA - _0226238C - 2 ; case 7
	.short _0226240C - _0226238C - 2 ; case 8
	.short _0226241E - _0226238C - 2 ; case 9
	.short _0226243A - _0226238C - 2 ; case 10
_022623A2:
	mov r3, #0x16
	ldr r0, [r4]
	mov r1, #0x80
	mov r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_022623C2:
	mov r1, #6
	ldrsh r2, [r4, r1]
	add r2, r2, #1
	strh r2, [r4, #6]
	ldrsh r1, [r4, r1]
	cmp r1, #0xf
	ble _0226243E
	mov r1, #0
	strh r1, [r4, #6]
	mov r1, #1
	str r1, [r4, #0x14]
	str r1, [r4, #0x18]
	mov r1, #0x80
	str r1, [r4, #0xc]
	mov r1, #0x20
	str r1, [r4, #0x10]
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_022623EA:
	mov r1, #0
	str r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	mov r2, #6
	add r0, r0, #6
	str r0, [r4, #0x10]
	ldr r0, [r4]
	bl sub_0200DED0
	ldr r0, [r4, #0x10]
	cmp r0, #0x60
	ble _0226243E
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_0226240C:
	mov r1, #0
	str r1, [r4, #0x14]
	ldr r0, [r4]
	bl sub_0200DCE8
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #4]
_0226241E:
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	ble _0226243E
	mov r0, #0
	strh r0, [r4, #6]
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_0226243A:
	mov r0, #1
	pop {r4, pc}
_0226243E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_02262374

	thumb_func_start ov93_02262444
ov93_02262444: ; 0x02262444
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r6, #0
_0226244C:
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r2, _02262480 ; =ov93_02262F38
	bl sub_0200D734
	add r4, r0, #0
	mov r1, #0x1b
	bl sub_0200DC4C
	add r0, r4, #0
	mov r1, #1
	bl sub_0200E0FC
	add r0, r4, #0
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4]
	bl sub_0200DC0C
	add r6, r6, #1
	stmia r5!, {r4}
	cmp r6, #2
	blt _0226244C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262480: .word ov93_02262F38
	thumb_func_end ov93_02262444

	thumb_func_start ov93_02262484
ov93_02262484: ; 0x02262484
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r4, #0
_0226248A:
	ldr r0, [r5]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0226248A
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_02262484

	thumb_func_start ov93_0226249C
ov93_0226249C: ; 0x0226249C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, [r1]
	add r1, sp, #4
	mov r3, #0x16
	str r2, [sp]
	add r1, #2
	add r2, sp, #4
	lsl r3, r3, #0x10
	bl sub_0200DE94
	ldr r5, [sp]
	mov r4, #0
	add r6, sp, #4
	mov r7, #1
_022624BA:
	mov r2, #0
	ldrsh r2, [r6, r2]
	mov r1, #2
	mov r3, #0x16
	add r2, #0x1c
	lsl r2, r2, #0x10
	ldrsh r1, [r6, r1]
	ldr r0, [r5]
	asr r2, r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r0, [r5]
	mov r1, #0x1b
	bl sub_0200DC4C
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x14
	sub r2, r2, r1
	mov r0, #0x14
	ror r2, r0
	mov r0, #1
	add r1, r1, r2
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r5, #8]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x16
	sub r2, r2, r1
	mov r0, #0x16
	ror r2, r0
	mov r0, #1
	add r1, r1, r2
	lsl r0, r0, #0xa
	add r0, r1, r0
	str r0, [r5, #0x10]
	add r0, r4, #0
	tst r0, r7
	beq _0226252A
	mov r0, #0
	ldr r1, [r5, #8]
	mvn r0, r0
	mul r0, r1
	str r0, [r5, #8]
_0226252A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _022624BA
	ldr r0, [sp]
	mov r1, #0
	strb r1, [r0, #0x19]
	mov r1, #1
	strb r1, [r0, #0x18]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_0226249C

	thumb_func_start ov93_02262540
ov93_02262540: ; 0x02262540
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	ldrb r0, [r6, #0x18]
	cmp r0, #0
	beq _02262594
	cmp r0, #1
	bne _02262594
	mov r4, #0
	add r5, r6, #0
_02262552:
	ldr r2, [r5, #0x10]
	ldr r0, [r5]
	ldr r1, [r5, #8]
	neg r2, r2
	bl sub_0200DEDC
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0200DC0C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02262552
	ldrb r0, [r6, #0x19]
	add r0, r0, #1
	strb r0, [r6, #0x19]
	ldrb r0, [r6, #0x19]
	cmp r0, #8
	bls _02262594
	mov r5, #0
	add r4, r6, #0
	add r7, r5, #0
_02262580:
	ldr r0, [r4]
	add r1, r7, #0
	bl sub_0200DCE8
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #2
	blt _02262580
	mov r0, #0
	strb r0, [r6, #0x18]
_02262594:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov93_02262540

	thumb_func_start ov93_02262598
ov93_02262598: ; 0x02262598
	push {r3, r4, r5, lr}
	mov r1, #0xc
	mov r2, #0x75
	add r5, r0, #0
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetArgs
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_02262598

	thumb_func_start ov93_022625BC
ov93_022625BC: ; 0x022625BC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4]
	add r1, r0, #0
	add r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _02262642
	add r1, r0, #0
	add r1, #0x3e
	ldrb r1, [r1]
	cmp r1, #0
	beq _022625E4
	cmp r1, #1
	beq _02262606
	cmp r1, #2
	b _0226261E
_022625E4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022625F0
	bl sub_0200FB70
_022625F0:
	mov r0, #0
	bl sub_0200FC20
	ldr r1, [r4]
	add r0, r1, #0
	add r0, #0x3e
	ldrb r0, [r0]
	add r1, #0x3e
	add r0, r0, #1
	strb r0, [r1]
	b _0226263E
_02262606:
	bl ov90_02258B98
	cmp r0, #1
	bne _0226263E
	ldr r1, [r4]
	add r0, r1, #0
	add r0, #0x3e
	ldrb r0, [r0]
	add r1, #0x3e
	add r0, r0, #1
	strb r0, [r1]
	b _0226263E
_0226261E:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0226262C
	bl ov90_02258938
	mov r0, #0
	str r0, [r4, #4]
_0226262C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0226263A
	bl ov90_02258A04
	mov r0, #0
	str r0, [r4, #8]
_0226263A:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0226263E:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02262642:
	ldr r1, [r5]
	cmp r1, #5
	bhi _022626E0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02262654: ; jump table
	.short _02262660 - _02262654 - 2 ; case 0
	.short _02262674 - _02262654 - 2 ; case 1
	.short _02262684 - _02262654 - 2 ; case 2
	.short _022626A8 - _02262654 - 2 ; case 3
	.short _022626BC - _02262654 - 2 ; case 4
	.short _022626E0 - _02262654 - 2 ; case 5
_02262660:
	add r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _0226266E
	mov r0, #1
	str r0, [r5]
	b _022626E4
_0226266E:
	mov r0, #3
	str r0, [r5]
	b _022626E4
_02262674:
	mov r1, #0x75
	bl ov90_0225892C
	str r0, [r4, #4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022626E4
_02262684:
	ldr r0, [r4, #4]
	bl ov90_022589BC
	cmp r0, #1
	bne _022626E4
	ldr r0, [r4, #4]
	bl ov90_022589CC
	ldr r1, [r4]
	str r0, [r1, #0x34]
	ldr r0, [r4, #4]
	bl ov90_02258938
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #5
	str r0, [r5]
	b _022626E4
_022626A8:
	add r1, r0, #0
	add r1, #0x10
	mov r2, #0x75
	bl ov90_022589F8
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022626E4
_022626BC:
	ldr r0, [r4, #8]
	bl ov90_02258AA0
	cmp r0, #1
	bne _022626E4
	ldr r0, [r4, #8]
	bl ov90_02258AA4
	ldr r1, [r4]
	str r0, [r1, #0x38]
	ldr r0, [r4, #8]
	bl ov90_02258A04
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #5
	str r0, [r5]
	b _022626E4
_022626E0:
	mov r0, #1
	pop {r3, r4, r5, pc}
_022626E4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_022625BC

	thumb_func_start ov93_022626E8
ov93_022626E8: ; 0x022626E8
	push {r4, lr}
	add r4, r0, #0
	bl OverlayManager_GetData
	add r0, r4, #0
	bl OverlayManager_FreeData
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_022626E8

	thumb_func_start ov93_022626FC
ov93_022626FC: ; 0x022626FC
	ldr r3, _02262708 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _0226270C ; =ov93_022630E4
	mov r1, #4
	bx r3
	nop
_02262708: .word sub_0203410C
_0226270C: .word ov93_022630E4
	thumb_func_end ov93_022626FC

	thumb_func_start ov93_02262710
ov93_02262710: ; 0x02262710
	mov r0, #0x14
	bx lr
	thumb_func_end ov93_02262710

	thumb_func_start ov93_02262714
ov93_02262714: ; 0x02262714
	mov r0, #4
	bx lr
	thumb_func_end ov93_02262714

	thumb_func_start ov93_02262718
ov93_02262718: ; 0x02262718
	add r1, r0, #0
	add r0, r3, #0
	ldr r3, _02262720 ; =ov93_0225E144
	bx r3
	.balign 4, 0
_02262720: .word ov93_0225E144
	thumb_func_end ov93_02262718

	thumb_func_start ov93_02262724
ov93_02262724: ; 0x02262724
	push {r3, lr}
	mov r0, #0x18
	mov r2, #0x14
	bl sub_02037030
	cmp r0, #1
	bne _02262736
	mov r0, #1
	pop {r3, pc}
_02262736:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov93_02262724

	thumb_func_start ov93_0226273C
ov93_0226273C: ; 0x0226273C
	mov r0, #0xbf
	mov r1, #1
	lsl r0, r0, #6
	str r1, [r3, r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov93_0226273C

	thumb_func_start ov93_02262748
ov93_02262748: ; 0x02262748
	push {r3, lr}
	mov r1, #0
	mov r0, #0x19
	add r2, r1, #0
	bl sub_02037030
	cmp r0, #1
	bne _0226275C
	mov r0, #1
	pop {r3, pc}
_0226275C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov93_02262748

	thumb_func_start ov93_02262760
ov93_02262760: ; 0x02262760
	push {r4, r5, r6, lr}
	add r4, r3, #0
	ldr r3, [r4]
	ldr r1, [r2]
	add r5, r3, #0
	add r5, #0x30
	ldrb r5, [r5]
	mov r2, #0
	cmp r5, #0
	ble _0226278E
_02262774:
	add r6, r3, #0
	add r6, #0x2c
	ldrb r6, [r6]
	cmp r0, r6
	bne _02262786
	lsl r0, r2, #2
	add r0, r4, r0
	str r1, [r0, #0xc]
	b _0226278E
_02262786:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, r5
	blt _02262774
_0226278E:
	ldr r0, [r4]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r2, r0
	blt _0226279C
	bl GF_AssertFail
_0226279C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	thumb_func_end ov93_02262760

	thumb_func_start ov93_022627A4
ov93_022627A4: ; 0x022627A4
	push {r3, lr}
	mov r0, #0x64
	str r0, [sp]
	mov r0, #0x17
	add r1, sp, #0
	mov r2, #4
	bl sub_02037030
	cmp r0, #1
	bne _022627BC
	mov r0, #1
	pop {r3, pc}
_022627BC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov93_022627A4

	thumb_func_start ov93_022627C0
ov93_022627C0: ; 0x022627C0
	push {r4, lr}
	add r4, r1, #0
	ldr r2, [r4]
	lsl r3, r2, #2
	ldr r2, _022627E4 ; =ov93_02263114
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _022627E0
	blx r2
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #1
	pop {r4, pc}
_022627E0:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_022627E4: .word ov93_02263114
	thumb_func_end ov93_022627C0

	thumb_func_start ov93_022627E8
ov93_022627E8: ; 0x022627E8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #1
	str r0, [sp]
	add r2, sp, #4
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov93_022627E8

	thumb_func_start ov93_02262814
ov93_02262814: ; 0x02262814
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl sub_0203769C
	ldrb r1, [r4, #4]
	cmp r1, r0
	beq _0226282C
	add r0, r5, #0
	add r1, r4, #4
	bl ov93_0225FEC4
_0226282C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_02262814

	thumb_func_start ov93_02262830
ov93_02262830: ; 0x02262830
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #2
	str r0, [sp]
	add r0, sp, #0
	strh r5, [r0, #4]
	mov r1, #5
	strb r1, [r0, #6]
	strb r4, [r0, #7]
	add r0, r6, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov93_02262830

	thumb_func_start ov93_02262860
ov93_02262860: ; 0x02262860
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02262880 ; =0x00002FD0
	add r5, r0, #0
	ldr r2, [r5, r1]
	add r2, r2, #1
	str r2, [r5, r1]
	bl ov93_02260908
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	add r0, r5, #0
	bl ov93_0225E48C
	pop {r3, r4, r5, pc}
	nop
_02262880: .word 0x00002FD0
	thumb_func_end ov93_02262860

	thumb_func_start ov93_02262884
ov93_02262884: ; 0x02262884
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	add r6, r3, #0
	bl MI_CpuFill8
	mov r0, #3
	str r0, [sp]
	add r0, sp, #0
	strh r5, [r0, #4]
	strb r4, [r0, #6]
	mov r1, #4
	strb r1, [r0, #7]
	strb r6, [r0, #8]
	add r0, r7, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov93_02262884

	thumb_func_start ov93_022628B8
ov93_022628B8: ; 0x022628B8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrh r1, [r4, #4]
	add r5, r0, #0
	ldr r0, _022628E8 ; =0x00002FC8
	ldr r3, _022628EC ; =0x00001428
	str r1, [r5, r0]
	ldr r1, [r5]
	ldrb r2, [r4, #6]
	add r1, #0x30
	ldrb r1, [r1]
	ldr r0, [r5, #0x2c]
	add r3, r5, r3
	bl ov93_0225FBF0
	ldr r0, _022628F0 ; =0x00002FCC
	mov r1, #1
	str r1, [r5, r0]
	ldrb r1, [r4, #7]
	ldrb r2, [r4, #8]
	add r0, r5, #0
	bl ov93_0225E48C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022628E8: .word 0x00002FC8
_022628EC: .word 0x00001428
_022628F0: .word 0x00002FCC
	thumb_func_end ov93_022628B8

	thumb_func_start ov93_022628F4
ov93_022628F4: ; 0x022628F4
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #4
	str r0, [sp]
	mov r1, #2
	add r0, sp, #0
	strb r1, [r0, #4]
	strb r4, [r0, #5]
	add r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_022628F4

	thumb_func_start ov93_02262920
ov93_02262920: ; 0x02262920
	add r2, r1, #0
	mov r1, #3
	str r1, [r0, #0x20]
	ldrb r1, [r2, #4]
	ldr r3, _02262930 ; =ov93_0225E48C
	ldrb r2, [r2, #5]
	bx r3
	nop
_02262930: .word ov93_0225E48C
	thumb_func_end ov93_02262920

	thumb_func_start ov93_02262934
ov93_02262934: ; 0x02262934
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #5
	str r0, [sp]
	mov r1, #3
	add r0, sp, #0
	strb r1, [r0, #4]
	strb r4, [r0, #5]
	add r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_02262934

	thumb_func_start ov93_02262960
ov93_02262960: ; 0x02262960
	add r3, r1, #0
	ldr r1, _02262974 ; =0x00002FBC
	mov r2, #1
	str r2, [r0, r1]
	mov r1, #6
	str r1, [r0, #0x20]
	ldrb r1, [r3, #4]
	ldrb r2, [r3, #5]
	ldr r3, _02262978 ; =ov93_0225E48C
	bx r3
	.balign 4, 0
_02262974: .word 0x00002FBC
_02262978: .word ov93_0225E48C
	thumb_func_end ov93_02262960

	thumb_func_start ov93_0226297C
ov93_0226297C: ; 0x0226297C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #6
	str r0, [sp]
	add r0, sp, #0
	strb r5, [r0, #4]
	strb r4, [r0, #5]
	add r0, r6, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov93_0226297C

	thumb_func_start ov93_022629A8
ov93_022629A8: ; 0x022629A8
	ldr r3, _022629B4 ; =ov93_0225E48C
	add r2, r1, #0
	ldrb r1, [r2, #4]
	ldrb r2, [r2, #5]
	bx r3
	nop
_022629B4: .word ov93_0225E48C
	thumb_func_end ov93_022629A8

	thumb_func_start ov93_022629B8
ov93_022629B8: ; 0x022629B8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #7
	str r0, [sp]
	mov r1, #6
	add r0, sp, #0
	strb r1, [r0, #4]
	strb r4, [r0, #5]
	add r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_022629B8

	thumb_func_start ov93_022629E4
ov93_022629E4: ; 0x022629E4
	add r2, r1, #0
	mov r1, #1
	str r1, [r0, #0x20]
	ldrb r1, [r2, #4]
	ldr r3, _022629F4 ; =ov93_0225E48C
	ldrb r2, [r2, #5]
	bx r3
	nop
_022629F4: .word ov93_0225E48C
	thumb_func_end ov93_022629E4

	.rodata

_02262C6C:
	.byte 0x06, 0x00, 0x08, 0x00
	.byte 0x07, 0x00

ov93_02262C72: ; 0x02262C72
	.byte 0x1D, 0x00, 0x0D, 0x00, 0x3D, 0x00, 0x2D, 0x00

ov93_02262C7A: ; 0x02262C7A
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x0F, 0x00
	.byte 0x12, 0x00

ov93_02262C82: ; 0x02262C82
	.byte 0x52, 0x00, 0x51, 0x00, 0x53, 0x00, 0x54, 0x00

ov93_02262C8A: ; 0x02262C8A
	.byte 0x20, 0x00, 0x10, 0x00, 0x30, 0x00
	.byte 0x40, 0x00, 0x00, 0x00

ov93_02262C94: ; 0x02262C94
	.word ov93_0226154C
	.word ov93_02261554
	.word ov93_02261744
	.word ov93_022618C4

ov93_02262CA4: ; 0x02262CA4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00

ov93_02262CB4: ; 0x02262CB4
	.byte 0x80, 0x00

ov93_02262CB6: ; 0x02262CB6
	.byte 0xA4, 0x00, 0x80, 0x00, 0x1C, 0x00, 0x34, 0x00, 0x60, 0x00
	.byte 0xCC, 0x00, 0x60, 0x00

ov93_02262CC4: ; 0x02262CC4
	.byte 0x08

ov93_02262CC5: ; 0x02262CC5
	.byte 0x14

ov93_02262CC6: ; 0x02262CC6
	.byte 0x07, 0x00, 0x08, 0x11, 0x07, 0x00, 0x08, 0x0E, 0x06, 0x00
	.byte 0x08, 0x0A, 0x06, 0x00, 0x08, 0x06, 0x05, 0x00

ov93_02262CD8: ; 0x02262CD8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x02, 0x01, 0x03

ov93_02262CEC: ; 0x02262CEC
	.byte 0x0B, 0x00

ov93_02262CEE: ; 0x02262CEE
	.byte 0x0C, 0x00

ov93_02262CF0: ; 0x02262CF0
	.byte 0x00, 0x11, 0x00, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x00, 0x17, 0x00, 0x00, 0x07, 0x00, 0x08, 0x00
	.byte 0x00, 0x1D, 0x00, 0x00

ov93_02262D04: ; 0x02262D04
	.byte 0x20, 0x00, 0x10, 0x00, 0x30, 0x00, 0x40, 0x00, 0x20, 0x00, 0x10, 0x00
	.byte 0x30, 0x00, 0x40, 0x00, 0x20, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x40, 0x00, 0x10, 0x00, 0x30, 0x00

ov93_02262D2C: ; 0x02262D2C
	.byte 0x02, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x03, 0x00, 0x02, 0x00, 0x04, 0x00, 0x01, 0x00, 0x03, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x03, 0x00

ov93_02262D54: ; 0x02262D54
	.byte 0x52, 0x00, 0x51, 0x00, 0x53, 0x00, 0x54, 0x00, 0x52, 0x00, 0x51, 0x00
	.byte 0x53, 0x00, 0x54, 0x00, 0x52, 0x00, 0x51, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x53, 0x00
	.byte 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x54, 0x00, 0x51, 0x00, 0x53, 0x00

ov93_02262D7C: ; 0x02262D7C
	.byte 0x16, 0x00, 0x15, 0x00
	.byte 0x17, 0x00, 0x18, 0x00, 0x16, 0x00, 0x15, 0x00, 0x17, 0x00, 0x18, 0x00, 0x16, 0x00, 0x17, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x18, 0x00, 0x17, 0x00, 0x00, 0x00, 0x16, 0x00, 0x15, 0x00
	.byte 0x17, 0x00, 0x18, 0x00

ov93_02262DA4: ; 0x02262DA4
	.byte 0x1D, 0x00, 0x2D, 0x00, 0x0D, 0x00, 0x3D, 0x00, 0x1D, 0x00, 0x2D, 0x00
	.byte 0x0D, 0x00, 0x3D, 0x00, 0x1D, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x3D, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x2D, 0x00, 0x0D, 0x00, 0x3D, 0x00

ov93_02262DCC: ; 0x02262DCC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262E00: ; 0x02262E00
	.byte 0x80, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov93_02262E34: ; 0x02262E34
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262E68: ; 0x02262E68
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262E9C: ; 0x02262E9C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262ED0: ; 0x02262ED0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov93_02262F04: ; 0x02262F04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262F38: ; 0x02262F38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262F6C: ; 0x02262F6C
	.byte 0x28, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x12, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262FA0: ; 0x02262FA0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00
	.byte 0x11, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov93_02262FD4: ; 0x02262FD4
	.byte 0xB8, 0x0B, 0x00, 0x00, 0x70, 0x17, 0x00, 0x00, 0x40, 0x1F, 0x00, 0x00
	.byte 0xE8, 0x03, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0xA6, 0x19, 0x00, 0x00
	.byte 0xFA, 0x20, 0x00, 0x00, 0x4E, 0x28, 0x00, 0x00, 0xEC, 0x20, 0x00, 0x00, 0x54, 0x2A, 0x00, 0x00
	.byte 0xBC, 0x33, 0x00, 0x00, 0x48, 0x26, 0x00, 0x00, 0x38, 0x31, 0x00, 0x00, 0x28, 0x3C, 0x00, 0x00

ov93_02263010: ; 0x02263010
	.byte 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02, 0x00, 0x00, 0x80, 0x00, 0xF0, 0xFF, 0x0A, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02
	.byte 0x00, 0x00, 0xF0, 0xFF, 0x60, 0x00, 0x09, 0x00, 0x03, 0x03, 0x00, 0x00, 0x10, 0x01, 0x60, 0x00
	.byte 0x08, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02, 0x00, 0x00, 0xF0, 0xFF, 0x60, 0x00, 0x09, 0x00
	.byte 0x04, 0x03, 0x00, 0x00, 0x80, 0x00, 0xF0, 0xFF, 0x0A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01
	.byte 0x60, 0x00, 0x08, 0x00, 0x03, 0x01, 0x00, 0x00

	.public ov93_022630D8
ov93_022630D8:
	.byte 0x64, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00

ov93_022630E4: ; 0x022630E4
	.word 0
	.word sub_020342C0
	.word 0
	.word ov93_02262760
	.word ov93_02262714
	.word 0
	.word ov93_02262718
	.word ov93_02262710
	.word 0
	.word ov93_0226273C
	.word sub_020342C0
	.word 0

ov93_02263114: ; 0x02263114
	.word 0
	.word ov93_02262814
	.word ov93_02262860
	.word ov93_022628B8
	.word ov93_02262920
	.word ov93_02262960
	.word ov93_022629A8
	.word ov93_022629E4
	; 0x02263134
