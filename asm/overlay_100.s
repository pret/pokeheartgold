	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov100_021E5900
ov100_021E5900: ; 0x021E5900
	ldr r1, [r0, #0xc]
	str r1, [r0, #0x10]
	ldr r1, _021E591C ; =gSystem
	ldr r2, [r1, #0x48]
	ldr r1, _021E5920 ; =0x00000CF3
	tst r1, r2
	beq _021E5916
	mov r1, #0
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
_021E5916:
	mov r0, #0
	bx lr
	nop
_021E591C: .word gSystem
_021E5920: .word 0x00000CF3
	thumb_func_end ov100_021E5900

	thumb_func_start ov100_021E5924
ov100_021E5924: ; 0x021E5924
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021E59C0 ; =ov100_021E74C4
	bl sub_02025224
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021E59BC
	mov r1, #0
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E59C4 ; =gSystem + 0x40
	ldr r0, [r5, #0x74]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #1
	bne _021E595C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021E595C:
	ldrb r0, [r5, #4]
	cmp r4, r0
	bne _021E596A
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021E596A:
	cmp r4, #1
	bne _021E597A
	ldrb r0, [r5, #5]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	mov r0, #2
	tst r0, r1
	beq _021E598A
_021E597A:
	cmp r4, #2
	bne _021E5992
	ldrb r0, [r5, #5]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	mov r0, #1
	tst r0, r1
	bne _021E5992
_021E598A:
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021E5992:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov100_021E5B4C
	cmp r4, #4
	beq _021E59A6
	ldr r0, _021E59C8 ; =0x00000942
	b _021E59AA
_021E59A6:
	mov r0, #0x25
	lsl r0, r0, #6
_021E59AA:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
	mov r0, #0
	strb r0, [r5, #6]
	mov r0, #1
	str r0, [r5, #0xc]
	add r0, r4, #0
_021E59BC:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E59C0: .word ov100_021E74C4
_021E59C4: .word gSystem + 0x40
_021E59C8: .word 0x00000942
	thumb_func_end ov100_021E5924

	thumb_func_start ov100_021E59CC
ov100_021E59CC: ; 0x021E59CC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E5A7C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021E59E6
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E59E6:
	mov r0, #1
	tst r0, r1
	beq _021E5A44
	ldr r0, [r5, #0x7c]
	ldr r1, [r0, #8]
	ldrb r2, [r1, #1]
	ldr r4, [r1, #4]
	mov r1, #0xc
	add r6, r2, #0
	mul r6, r1
	mov r1, #0
	add r2, r1, #0
	bl ov100_021E7128
	mov r0, #0
	strb r0, [r5, #6]
	ldrh r0, [r4, r6]
	cmp r0, #4
	beq _021E5A10
	ldr r0, _021E5A80 ; =0x00000942
	b _021E5A14
_021E5A10:
	mov r0, #0x25
	lsl r0, r0, #6
_021E5A14:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
	ldrh r1, [r4, r6]
	ldrb r0, [r5, #4]
	cmp r1, r0
	bne _021E5A34
	ldr r1, [r5, #0x5c]
	cmp r1, #0
	beq _021E5A2E
	ldr r0, [r5, #0x64]
	blx r1
_021E5A2E:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021E5A34:
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov100_021E5B4C
	ldrh r0, [r4, r6]
	pop {r4, r5, r6, pc}
_021E5A44:
	mov r0, #0x20
	tst r0, r1
	beq _021E5A5E
	ldr r0, _021E5A84 ; =0x0000093F
	bl PlaySE
	ldr r0, [r5, #0x7c]
	mov r1, #0
	bl ov100_021E73AC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021E5A5E:
	mov r0, #0x10
	tst r1, r0
	beq _021E5A78
	ldr r0, _021E5A84 ; =0x0000093F
	bl PlaySE
	ldr r0, [r5, #0x7c]
	mov r1, #1
	bl ov100_021E73AC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021E5A78:
	sub r0, #0x11
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E5A7C: .word gSystem
_021E5A80: .word 0x00000942
_021E5A84: .word 0x0000093F
	thumb_func_end ov100_021E59CC

	thumb_func_start ov100_021E5A88
ov100_021E5A88: ; 0x021E5A88
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldrb r0, [r5, #5]
	mov r1, #0x20
	mov r3, #0x14
	lsl r0, r0, #0x19
	lsr r4, r0, #0x19
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrh r2, [r0]
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r2, r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl CopyToBgTilemapRect
	mov r0, #1
	tst r0, r4
	bne _021E5B04
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	mov r1, #6
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	mov r2, #8
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	mov r3, #0x14
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #0xd
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl CopyToBgTilemapRect
_021E5B04:
	mov r0, #2
	tst r0, r4
	bne _021E5B40
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	mov r1, #6
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	mov r2, #8
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	mov r3, #0x14
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #7
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl CopyToBgTilemapRect
_021E5B40:
	ldr r0, [r5, #0x74]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov100_021E5A88

	thumb_func_start ov100_021E5B4C
ov100_021E5B4C: ; 0x021E5B4C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov100_021E5A88
	cmp r4, #4
	bne _021E5B62
	mov r2, #0x1a
	b _021E5B6C
_021E5B62:
	mov r0, #6
	mul r0, r4
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
_021E5B6C:
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	mov r1, #6
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	lsl r1, r6, #0x1a
	str r2, [sp, #0xc]
	lsr r1, r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r3, #0x14
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x74]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov100_021E5B4C

	thumb_func_start ov100_021E5BB0
ov100_021E5BB0: ; 0x021E5BB0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0x10
	add r1, sp, #4
	bl GF_RTC_CopyDateTime
	cmp r4, #0
	bne _021E5BD6
	add r0, r5, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _021E5BD6
	add sp, #0x20
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E5BD6:
	ldr r4, [sp, #4]
	mov r1, #0xa
	add r0, r4, #0
	bl _u32_div_f
	add r1, sp, #0
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r0, sp, #0
	strb r1, [r0, #1]
	ldr r4, [sp, #8]
	mov r1, #0xa
	add r0, r4, #0
	bl _u32_div_f
	add r1, sp, #0
	strb r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r0, sp, #0
	strb r1, [r0, #3]
	mov r4, #0
	add r6, sp, #0
_021E5C0E:
	lsl r0, r4, #2
	add r0, r5, r0
	add r0, #0xac
	ldrb r1, [r6, r4]
	ldr r0, [r0]
	bl sub_0200DCC0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E5C0E
	add r0, r5, #0
	ldr r1, [sp, #0x1c]
	add r0, #0xa8
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl sub_0200DCC0
	add r3, sp, #4
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	add r2, #0x80
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0
	strb r0, [r5, #7]
	mov r0, #1
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E5BB0

	thumb_func_start ov100_021E5C50
ov100_021E5C50: ; 0x021E5C50
	cmp r0, #0x15
	bls _021E5C7C
	cmp r0, #0x19
	bne _021E5C60
	cmp r1, #8
	bne _021E5C60
	mov r0, #2
	bx lr
_021E5C60:
	cmp r0, #0x1c
	bne _021E5C68
	cmp r1, #6
	beq _021E5C74
_021E5C68:
	cmp r0, #0x1c
	bne _021E5C78
	cmp r1, #8
	bls _021E5C78
	cmp r1, #0xd
	bhs _021E5C78
_021E5C74:
	mov r0, #1
	bx lr
_021E5C78:
	mov r0, #0
	bx lr
_021E5C7C:
	mov r0, #2
	bx lr
	thumb_func_end ov100_021E5C50

	thumb_func_start ov100_021E5C80
ov100_021E5C80: ; 0x021E5C80
	ldr r2, [r0, #0x20]
	ldr r3, _021E5CA0 ; =ov100_021E5C50
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r2, #4
	lsr r1, r1, #0x1b
	add r1, r2, r1
	lsl r0, r0, #0xb
	lsl r1, r1, #0xb
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bx r3
	nop
_021E5CA0: .word ov100_021E5C50
	thumb_func_end ov100_021E5C80

	thumb_func_start ov100_021E5CA4
ov100_021E5CA4: ; 0x021E5CA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r1, #7
	ldr r3, [r5]
	mov r0, #3
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	mov r1, #6
	ldr r3, [r5]
	mov r0, #7
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	mov r4, #0
	mov r6, #0x40
	add r7, r4, #0
_021E5CCA:
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #1
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r7, #0
	bl BG_ClearCharDataRange
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #5
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	cmp r4, #3
	blt _021E5CCA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E5CA4

	thumb_func_start ov100_021E5D3C
ov100_021E5D3C: ; 0x021E5D3C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0x10
	bls _021E5D4E
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E5D4E:
	cmp r1, #0
	bne _021E5D88
	mov r0, #0x10
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x78]
	add r2, r1, #0
	mov r3, #0xe0
	bl sub_02003E5C
	ldrb r1, [r4, #9]
	mov r0, #0x10
	mov r2, #0x40
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x78]
	mov r1, #2
	mov r3, #0xc0
	bl sub_02003E5C
	b _021E5DAC
_021E5D88:
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x78]
	add r2, r1, #0
	mov r3, #0xe0
	bl sub_02003E5C
	ldrb r0, [r4, #9]
	mov r1, #2
	mov r2, #0x40
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x78]
	mov r3, #0xc0
	bl sub_02003E5C
_021E5DAC:
	ldrb r0, [r4, #9]
	cmp r0, #0x10
	blo _021E5DBC
	add r0, r0, #2
	strb r0, [r4, #9]
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E5DBC:
	add r0, r0, #2
	strb r0, [r4, #9]
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E5D3C

	thumb_func_start ov100_021E5DC8
ov100_021E5DC8: ; 0x021E5DC8
	ldrb r1, [r0, #5]
	ldr r2, _021E5DD8 ; =ov100_021E74B4
	lsl r1, r1, #0x19
	lsr r3, r1, #0x17
	ldrb r1, [r0, #4]
	add r0, r2, r3
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_021E5DD8: .word ov100_021E74B4
	thumb_func_end ov100_021E5DC8

	thumb_func_start ov100_021E5DDC
ov100_021E5DDC: ; 0x021E5DDC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	cmp r1, #3
	bhi _021E5E72
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5DF2: ; jump table
	.short _021E5DFA - _021E5DF2 - 2 ; case 0
	.short _021E5E4A - _021E5DF2 - 2 ; case 1
	.short _021E5E56 - _021E5DF2 - 2 ; case 2
	.short _021E5E62 - _021E5DF2 - 2 ; case 3
_021E5DFA:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5E7C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5E80 ; =0x04001000
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
	bl sub_020210BC
	mov r0, #2
	bl sub_02021148
	b _021E5E72
_021E5E4A:
	bl ov100_021E5FFC
	add r0, r4, #0
	bl ov100_021E60C4
	b _021E5E72
_021E5E56:
	bl ov100_021E616C
	add r0, r4, #0
	bl ov100_021E6374
	b _021E5E72
_021E5E62:
	ldr r0, _021E5E84 ; =ov100_021E65F4
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	str r0, [r4, #0x18]
	mov r0, #1
	pop {r4, pc}
_021E5E72:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E5E7C: .word 0xFFFFE0FF
_021E5E80: .word 0x04001000
_021E5E84: .word ov100_021E65F4
	thumb_func_end ov100_021E5DDC

	thumb_func_start ov100_021E5E88
ov100_021E5E88: ; 0x021E5E88
	push {r4, lr}
	add r4, r0, #0
	bl sub_02021238
	mov r0, #0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov100_021E63F4
	add r0, r4, #0
	bl ov100_021E6338
	add r0, r4, #0
	bl ov100_021E6134
	add r0, r4, #0
	bl ov100_021E6094
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E5E88

	thumb_func_start ov100_021E5EB4
ov100_021E5EB4: ; 0x021E5EB4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	mov r0, #0x8f
	bl NARC_ctor
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x30
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	add r2, r6, #0
	mov r3, #0x8f
	bl sub_0208820C
	add r0, r4, #0
	add r0, #0x24
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	add r2, r6, #0
	mov r3, #0x8f
	bl sub_0208820C
	mov r0, #0
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r2, r4, #0
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, #0x1e
	bl sub_02003220
	mov r0, #1
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r2, r4, #0
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, #0x18
	bl sub_02003220
	mov r0, #2
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, r4, #0
	bl sub_02003220
	mov r0, #3
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, r4, #0
	bl sub_02003220
	add r2, r5, #0
	add r2, #0xc4
	add r1, r4, #0
	ldr r2, [r2]
	add r0, r6, #0
	add r1, #0x36
	bl NARC_ReadWholeMember
	add r0, r5, #0
	add r0, #0xc4
	add r1, r5, #0
	ldr r0, [r0]
	add r1, #0xc8
	bl NNS_G2dGetUnpackedScreenData
	ldrb r1, [r5, #4]
	cmp r1, #4
	bne _021E5F9C
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov100_021E5B4C
	b _021E5FA4
_021E5F9C:
	add r0, r5, #0
	mov r2, #1
	bl ov100_021E5B4C
_021E5FA4:
	add r4, #0x2a
	str r4, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	add r2, r6, #0
	mov r3, #0x8f
	bl sub_0208820C
	add r0, r6, #0
	bl NARC_dtor
	ldr r0, [r5, #0x74]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x74]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov100_021E5EB4

	thumb_func_start ov100_021E5FDC
ov100_021E5FDC: ; 0x021E5FDC
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5FF8 ; =ov100_021E7500
	add r3, sp, #0
	mov r2, #5
_021E5FE6:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5FE6
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5FF8: .word ov100_021E7500
	thumb_func_end ov100_021E5FDC

	thumb_func_start ov100_021E5FFC
ov100_021E5FFC: ; 0x021E5FFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	bl ov100_021E5FDC
	ldr r0, [r5]
	bl BgConfig_Alloc
	str r0, [r5, #0x74]
	ldr r2, _021E6084 ; =0x04000304
	ldr r0, _021E6088 ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r4, _021E608C ; =ov100_021E74A4
	add r3, sp, #0x38
	and r0, r1
	strh r0, [r2]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021E6090 ; =ov100_021E7588
	add r3, sp, #0
	mov r2, #7
_021E6032:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6032
	mov r7, #0
	add r6, sp, #0
	add r4, r7, #0
_021E6040:
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	lsl r0, r4, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add r7, r7, #1
	add r6, #0x1c
	add r4, r4, #4
	cmp r7, #2
	blt _021E6040
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6084: .word 0x04000304
_021E6088: .word 0xFFFF7FFF
_021E608C: .word ov100_021E74A4
_021E6090: .word ov100_021E7588
	thumb_func_end ov100_021E5FFC

	thumb_func_start ov100_021E6094
ov100_021E6094: ; 0x021E6094
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x74]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x74]
	bl FreeToHeap
	ldr r2, _021E60BC ; =0x04000304
	ldr r0, _021E60C0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E60BC: .word 0x04000304
_021E60C0: .word 0xFFFF7FFF
	thumb_func_end ov100_021E6094

	thumb_func_start ov100_021E60C4
ov100_021E60C4: ; 0x021E60C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x8f
	bl NARC_ctor
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_020030E8
	str r0, [r5, #0x78]
	mov r2, #2
	ldr r3, [r5]
	mov r1, #0
	lsl r2, r2, #8
	bl PaletteData_AllocBuffers
	mov r1, #2
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	lsl r2, r1, #8
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	lsl r2, r1, #9
	bl PaletteData_AllocBuffers
	mov r2, #2
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	mov r1, #3
	lsl r2, r2, #8
	bl PaletteData_AllocBuffers
	mov r0, #0x8f
	mov r1, #0x36
	bl GetNarcMemberSizeByIdPair
	add r1, r0, #0
	ldr r0, [r5]
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0xc4
	str r0, [r1]
	ldrb r1, [r5, #8]
	add r0, r5, #0
	bl ov100_021E5EB4
	add r0, r4, #0
	bl NARC_dtor
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov100_021E60C4

	thumb_func_start ov100_021E6134
ov100_021E6134: ; 0x021E6134
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #0x78]
	mov r1, #3
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	bl sub_02003104
	mov r0, #0
	str r0, [r4, #0x78]
	pop {r4, pc}
	thumb_func_end ov100_021E6134

	thumb_func_start ov100_021E616C
ov100_021E616C: ; 0x021E616C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ov100_021E6914
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldrb r3, [r5, #8]
	ldr r0, [r5]
	mov r1, #0xb
	mov r2, #1
	bl ov100_021E69F8
	add r1, r5, #0
	add r1, #0x94
	mov r4, #0
	str r0, [r1]
	add r6, r5, #0
	add r7, r4, #0
_021E6196:
	str r7, [sp]
	lsl r0, r4, #0x18
	str r7, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r4, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0x40
	str r7, [sp, #0x10]
	add r0, #0x94
	ldr r0, [r0]
	add r2, r1, #0
	add r3, r7, #0
	bl ov100_021E6AC0
	add r1, r6, #0
	add r1, #0x98
	add r4, r4, #1
	add r6, r6, #4
	str r0, [r1]
	cmp r4, #4
	blt _021E6196
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0xad
	mov r2, #0x30
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x46
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xac
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x56
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb0
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x6e
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb4
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x7e
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x62
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xbc
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0xc5
	mov r2, #0x30
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r5, #0
	mov r1, #1
	bl ov100_021E5BB0
	add r0, r5, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DC78
	ldr r0, [r5, #0x20]
	ldrh r0, [r0, #0x10]
	bl MapHeader_GetField14_1D
	cmp r0, #0
	bne _021E62F4
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCC0
_021E62F4:
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_021E62FA:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r7, #0
	bl sub_0200DCE8
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DC78
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	ble _021E62FA
	mov r4, #4
	add r5, #0x10
	mov r6, #1
_021E6320:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _021E6320
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E616C

	thumb_func_start ov100_021E6338
ov100_021E6338: ; 0x021E6338
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	add r5, r7, #0
	add r6, r4, #0
_021E6342:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	bl ov100_021E6C44
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _021E6342
	add r0, r7, #0
	add r0, #0x94
	ldr r0, [r0]
	bl ov100_021E6A3C
	add r0, r7, #0
	bl ov100_021E6950
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6338

	thumb_func_start ov100_021E6374
ov100_021E6374: ; 0x021E6374
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl ov100_021E6F88
	str r0, [r4, #0x7c]
	ldrb r0, [r4, #5]
	ldr r1, _021E63EC ; =_021E7720
	lsl r0, r0, #0x19
	lsr r2, r0, #0x19
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	lsl r3, r2, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	ldr r1, [r1, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	ldr r3, _021E63F0 ; =_021E74A0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldrb r2, [r3, r2]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x7c]
	bl ov100_021E7014
	ldrb r0, [r4, #4]
	cmp r0, #4
	bne _021E63D8
	ldr r0, [r4, #0x7c]
	mov r1, #0
	mov r2, #2
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
_021E63D8:
	add r0, r4, #0
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_021E63EC: .word _021E7720
_021E63F0: .word _021E74A0
	thumb_func_end ov100_021E6374

	thumb_func_start ov100_021E63F4
ov100_021E63F4: ; 0x021E63F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl ov100_021E70A4
	ldr r0, [r4, #0x7c]
	bl ov100_021E6FBC
	pop {r4, pc}
	thumb_func_end ov100_021E63F4

	thumb_func_start ov100_021E6408
ov100_021E6408: ; 0x021E6408
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E6428
	bl OverlayManager_run
	cmp r0, #0
	beq _021E6428
	ldr r0, [r4]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E6428:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov100_021E6408

	thumb_func_start ov100_Phone_OvyInit
ov100_Phone_OvyInit: ; 0x021E642C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r0, #0
	bl sub_0200616C
	mov r2, #0x32
	mov r0, #3
	mov r1, #0x5a
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0xcc
	mov r2, #0x5a
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xcc
	bl memset
	str r5, [r4, #0x20]
	mov r0, #0x5a
	str r0, [r4]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl SaveData_GSPlayerMisc_get
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl SavArray_Flags_get
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x28]
	bl Pokegear_GetRegisteredCardsArray
	ldrb r2, [r4, #5]
	mov r1, #0x7f
	bic r2, r1
	mov r1, #0x7f
	and r0, r1
	orr r0, r2
	strb r0, [r4, #5]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x28]
	bl sub_020183F0
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x28]
	bl sub_0202EE7C
	strb r0, [r4, #8]
	ldr r0, [r4, #0x20]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E64C8
	cmp r0, #1
	bne _021E64C8
	mov r0, #3
	strb r0, [r4, #4]
	b _021E64FC
_021E64C8:
	ldr r0, [r4, #0x28]
	bl sub_0202EDF8
	strb r0, [r4, #4]
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _021E64E8
	ldrb r0, [r4, #5]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	mov r0, #1
	tst r0, r1
	bne _021E64FC
	mov r0, #0
	strb r0, [r4, #4]
	b _021E64FC
_021E64E8:
	cmp r0, #1
	bne _021E64FC
	ldrb r0, [r4, #5]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	mov r0, #2
	tst r0, r1
	bne _021E64FC
	mov r0, #0
	strb r0, [r4, #4]
_021E64FC:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x38
	strb r1, [r0]
	add r0, r4, #0
	ldr r2, _021E651C ; =0x0000FFFF
	add r0, #0x56
	strh r2, [r0]
	mov r0, #1
	strb r0, [r4, #6]
	mov r0, #0x37
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E651C: .word 0x0000FFFF
	thumb_func_end ov100_Phone_OvyInit

	thumb_func_start ov100_Phone_OvyExec
ov100_Phone_OvyExec: ; 0x021E6520
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #0xc
	bhi _021E65B8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E653A: ; jump table
	.short _021E6554 - _021E653A - 2 ; case 0
	.short _021E655C - _021E653A - 2 ; case 1
	.short _021E6564 - _021E653A - 2 ; case 2
	.short _021E656C - _021E653A - 2 ; case 3
	.short _021E6574 - _021E653A - 2 ; case 4
	.short _021E657C - _021E653A - 2 ; case 5
	.short _021E6584 - _021E653A - 2 ; case 6
	.short _021E658C - _021E653A - 2 ; case 7
	.short _021E6594 - _021E653A - 2 ; case 8
	.short _021E659C - _021E653A - 2 ; case 9
	.short _021E65A4 - _021E653A - 2 ; case 10
	.short _021E65AC - _021E653A - 2 ; case 11
	.short _021E65B4 - _021E653A - 2 ; case 12
_021E6554:
	bl ov100_021E665C
	str r0, [r4]
	b _021E65B8
_021E655C:
	bl ov100_021E669C
	str r0, [r4]
	b _021E65B8
_021E6564:
	bl ov100_021E67D4
	str r0, [r4]
	b _021E65B8
_021E656C:
	bl ov100_021E67EC
	str r0, [r4]
	b _021E65B8
_021E6574:
	bl ov100_021E68A8
	str r0, [r4]
	b _021E65B8
_021E657C:
	bl ov100_021E68C0
	str r0, [r4]
	b _021E65B8
_021E6584:
	bl ov100_021E66B0
	str r0, [r4]
	b _021E65B8
_021E658C:
	bl ov100_021E66C8
	str r0, [r4]
	b _021E65B8
_021E6594:
	bl ov100_021E673C
	str r0, [r4]
	b _021E65B8
_021E659C:
	bl ov100_021E6794
	str r0, [r4]
	b _021E65B8
_021E65A4:
	bl ov100_021E6840
	str r0, [r4]
	b _021E65B8
_021E65AC:
	bl ov100_021E6858
	str r0, [r4]
	b _021E65B8
_021E65B4:
	mov r0, #1
	pop {r4, pc}
_021E65B8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov100_Phone_OvyExec

	thumb_func_start ov100_Phone_OvyExit
ov100_Phone_OvyExit: ; 0x021E65BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldrb r1, [r4, #4]
	ldr r0, [r4, #0x28]
	bl sub_0202EDFC
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl sub_02018410
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	bl sub_02004B10
	bl sub_0203E354
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov100_Phone_OvyExit

	thumb_func_start ov100_021E65F4
ov100_021E65F4: ; 0x021E65F4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0x58]
	cmp r2, #0
	beq _021E6602
	ldr r1, [r4, #0x64]
	blx r2
_021E6602:
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _021E660C
	bl sub_0200398C
_021E660C:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _021E663C
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6632
	add r0, r4, #0
	mov r1, #0
	bl ov100_021E5BB0
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl ov100_021E6AB0
_021E6632:
	add r0, r4, #0
	bl ov100_021E69E8
	bl sub_0200D034
_021E663C:
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E6654 ; =0x027E0000
	ldr r1, _021E6658 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E6654: .word 0x027E0000
_021E6658: .word 0x00003FF8
	thumb_func_end ov100_021E65F4

	thumb_func_start ov100_021E665C
ov100_021E665C: ; 0x021E665C
	push {r4, lr}
	add r4, r0, #0
	bl ov100_021E5DDC
	cmp r0, #0
	bne _021E666C
	mov r0, #0
	pop {r4, pc}
_021E666C:
	ldrb r0, [r4, #4]
	cmp r0, #4
	bhi _021E6698
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E667E: ; jump table
	.short _021E6694 - _021E667E - 2 ; case 0
	.short _021E668C - _021E667E - 2 ; case 1
	.short _021E6688 - _021E667E - 2 ; case 2
	.short _021E6690 - _021E667E - 2 ; case 3
	.short _021E6688 - _021E667E - 2 ; case 4
_021E6688:
	mov r0, #6
	pop {r4, pc}
_021E668C:
	mov r0, #4
	pop {r4, pc}
_021E6690:
	mov r0, #0xa
	pop {r4, pc}
_021E6694:
	mov r0, #2
	pop {r4, pc}
_021E6698:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov100_021E665C

	thumb_func_start ov100_021E669C
ov100_021E669C: ; 0x021E669C
	push {r3, lr}
	bl ov100_021E5E88
	cmp r0, #0
	beq _021E66AA
	mov r0, #0xc
	pop {r3, pc}
_021E66AA:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov100_021E669C

	thumb_func_start ov100_021E66B0
ov100_021E66B0: ; 0x021E66B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E66C4 ; =ov100_021E762C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_new
	str r0, [r4, #0x70]
	mov r0, #7
	pop {r4, pc}
	.balign 4, 0
_021E66C4: .word ov100_021E762C
	thumb_func_end ov100_021E66B0

	thumb_func_start ov100_021E66C8
ov100_021E66C8: ; 0x021E66C8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E66DA
	mov r0, #7
	pop {r4, pc}
_021E66DA:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	str r1, [r4, #0x1c]
	cmp r0, #6
	bhi _021E6736
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E66F0: ; jump table
	.short _021E670E - _021E66F0 - 2 ; case 0
	.short _021E671A - _021E66F0 - 2 ; case 1
	.short _021E66FE - _021E66F0 - 2 ; case 2
	.short _021E6728 - _021E66F0 - 2 ; case 3
	.short _021E6736 - _021E66F0 - 2 ; case 4
	.short _021E6736 - _021E66F0 - 2 ; case 5
	.short _021E6706 - _021E66F0 - 2 ; case 6
_021E66FE:
	mov r0, #2
	strb r0, [r4, #4]
	mov r0, #6
	pop {r4, pc}
_021E6706:
	mov r0, #4
	strb r0, [r4, #4]
	mov r0, #8
	pop {r4, pc}
_021E670E:
	strb r1, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #2
	pop {r4, pc}
_021E671A:
	mov r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #4
	pop {r4, pc}
_021E6728:
	mov r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #0xa
	pop {r4, pc}
_021E6736:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E66C8

	thumb_func_start ov100_021E673C
ov100_021E673C: ; 0x021E673C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov100_021E5E88
	cmp r0, #0
	bne _021E6750
	add sp, #4
	mov r0, #8
	pop {r3, r4, pc}
_021E6750:
	ldr r3, [r4, #0x20]
	ldr r0, [r4]
	str r0, [sp]
	mov r0, #0
	ldr r2, [r3, #0x24]
	ldr r3, [r3, #0x28]
	add r1, r0, #0
	bl sub_02090C94
	str r0, [r4, #0x6c]
	add r0, r4, #0
	ldr r1, _021E678C ; =0x0000FFFF
	add r0, #0x56
	strh r1, [r0]
	add r1, r4, #0
	add r1, #0x56
	ldrh r1, [r1]
	ldr r0, [r4, #0x6c]
	bl sub_02090D14
	ldr r0, _021E6790 ; =ov100_021E761C
	ldr r1, [r4, #0x6c]
	ldr r2, [r4]
	bl OverlayManager_new
	str r0, [r4, #0x70]
	mov r0, #9
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E678C: .word 0x0000FFFF
_021E6790: .word ov100_021E761C
	thumb_func_end ov100_021E673C

	thumb_func_start ov100_021E6794
ov100_021E6794: ; 0x021E6794
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E67A6
	mov r0, #9
	pop {r4, pc}
_021E67A6:
	ldr r0, [r4, #0x6c]
	bl sub_02090D48
	cmp r0, #0
	bne _021E67BC
	ldr r0, [r4, #0x6c]
	bl sub_02090D50
	add r1, r4, #0
	add r1, #0x56
	strh r0, [r1]
_021E67BC:
	ldr r0, [r4, #0x6c]
	bl sub_02090D0C
	add r0, r4, #0
	mov r1, #1
	add r0, #0x38
	strb r1, [r0]
	mov r0, #4
	strb r0, [r4, #4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6794

	thumb_func_start ov100_021E67D4
ov100_021E67D4: ; 0x021E67D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E67E8 ; =ov100_021E760C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_new
	str r0, [r4, #0x70]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E67E8: .word ov100_021E760C
	thumb_func_end ov100_021E67D4

	thumb_func_start ov100_021E67EC
ov100_021E67EC: ; 0x021E67EC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E67FE
	mov r0, #3
	pop {r4, pc}
_021E67FE:
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #1
	beq _021E6820
	cmp r1, #2
	beq _021E6812
	cmp r1, #3
	beq _021E682E
	b _021E683C
_021E6812:
	mov r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #6
	pop {r4, pc}
_021E6820:
	mov r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #4
	pop {r4, pc}
_021E682E:
	mov r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #0xa
	pop {r4, pc}
_021E683C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E67EC

	thumb_func_start ov100_021E6840
ov100_021E6840: ; 0x021E6840
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6854 ; =ov100_021E75FC
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_new
	str r0, [r4, #0x70]
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
_021E6854: .word ov100_021E75FC
	thumb_func_end ov100_021E6840

	thumb_func_start ov100_021E6858
ov100_021E6858: ; 0x021E6858
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E686A
	mov r0, #0xb
	pop {r4, pc}
_021E686A:
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #0
	beq _021E688A
	cmp r1, #1
	beq _021E6896
	cmp r1, #2
	bne _021E68A4
	mov r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #6
	pop {r4, pc}
_021E688A:
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #2
	pop {r4, pc}
_021E6896:
	mov r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #4
	pop {r4, pc}
_021E68A4:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E6858

	thumb_func_start ov100_021E68A8
ov100_021E68A8: ; 0x021E68A8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E68BC ; =ov100_021E763C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_new
	str r0, [r4, #0x70]
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
_021E68BC: .word ov100_021E763C
	thumb_func_end ov100_021E68A8

	thumb_func_start ov100_021E68C0
ov100_021E68C0: ; 0x021E68C0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E68D2
	mov r0, #5
	pop {r4, pc}
_021E68D2:
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #0
	beq _021E68F4
	cmp r1, #2
	beq _021E68E6
	cmp r1, #3
	beq _021E6900
	b _021E690E
_021E68E6:
	mov r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #6
	pop {r4, pc}
_021E68F4:
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #2
	pop {r4, pc}
_021E6900:
	mov r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #0xa
	pop {r4, pc}
_021E690E:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E68C0

	thumb_func_start ov100_021E6914
ov100_021E6914: ; 0x021E6914
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r4]
	bl sub_0200CF18
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r4, #0
	ldr r2, _021E694C ; =ov100_021E764C
	add r0, #0x8c
	ldr r1, [r2, #0x74]
	ldr r0, [r0]
	ldr r2, [r2, #0x78]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	pop {r4, pc}
	.balign 4, 0
_021E694C: .word ov100_021E764C
	thumb_func_end ov100_021E6914

	thumb_func_start ov100_021E6950
ov100_021E6950: ; 0x021E6950
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_0200D108
	add r0, r4, #0
	mov r1, #0
	add r0, #0x8c
	str r1, [r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6950

	thumb_func_start ov100_021E6978
ov100_021E6978: ; 0x021E6978
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x8c
	ldr r0, [r0]
	add r5, r1, #0
	cmp r0, #0
	beq _021E69BE
	bl sub_0200CF38
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r2, _021E69C0 ; =ov100_021E76BC
	lsl r5, r5, #4
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r5]
	bl sub_0200CFF4
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	ldr r2, _021E69C4 ; =ov100_021E76BC + 12
	add r0, #0x8c
	add r4, #0x90
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [r2, r5]
	mov r3, #1
	bl sub_0200D2A4
_021E69BE:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E69C0: .word ov100_021E76BC
_021E69C4: .word ov100_021E76BC + 12
	thumb_func_end ov100_021E6978

	thumb_func_start ov100_021E69C8
ov100_021E69C8: ; 0x021E69C8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x90
	ldr r1, [r0]
	cmp r1, #0
	beq _021E69E4
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_0200D0E4
	mov r0, #0
	add r4, #0x90
	str r0, [r4]
_021E69E4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E69C8

	thumb_func_start ov100_021E69E8
ov100_021E69E8: ; 0x021E69E8
	push {r3, lr}
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	beq _021E69F6
	bl sub_0200D020
_021E69F6:
	pop {r3, pc}
	thumb_func_end ov100_021E69E8

	thumb_func_start ov100_021E69F8
ov100_021E69F8: ; 0x021E69F8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x16
	lsl r1, r1, #4
	add r6, r0, #0
	add r5, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r2, #0x16
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	str r6, [r4]
	cmp r5, #4
	bls _021E6A22
	mov r0, #4
	strh r0, [r4, #0xa]
	b _021E6A24
_021E6A22:
	strh r5, [r4, #0xa]
_021E6A24:
	strh r7, [r4, #0xc]
	add r0, sp, #8
	ldrh r0, [r0, #0x10]
	strh r0, [r4, #0xe]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #4]
	ldr r1, [sp]
	add r0, r4, #0
	bl ov100_021E6C4C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E69F8

	thumb_func_start ov100_021E6A3C
ov100_021E6A3C: ; 0x021E6A3C
	push {r4, lr}
	add r4, r0, #0
	bl ov100_021E6CF4
	mov r2, #0x16
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov100_021E6A3C

	thumb_func_start ov100_021E6A58
ov100_021E6A58: ; 0x021E6A58
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x15
	add r6, r1, #0
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r0, #0x10
	ldr r1, [r1]
	mov r2, #0x8f
	ldr r5, [r1]
	mov r1, #0
	str r1, [sp]
	ldr r1, [r4]
	add r3, r6, #6
	str r1, [sp, #4]
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl ReplaceCharResObjFromNarc
	add r0, r5, #0
	bl sub_0200AE8C
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0x10
	ldr r1, [r1]
	mov r2, #0x8f
	ldr r5, [r1]
	mov r1, #0
	str r1, [sp]
	ldr r1, [r4]
	add r3, r6, #0
	str r1, [sp, #4]
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl ReplacePlttResObjFromNarc
	add r0, r5, #0
	bl sub_0200B084
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov100_021E6A58

	thumb_func_start ov100_021E6AB0
ov100_021E6AB0: ; 0x021E6AB0
	push {r3, lr}
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _021E6ABC
	bl sub_0202457C
_021E6ABC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6AB0

	thumb_func_start ov100_021E6AC0
ov100_021E6AC0: ; 0x021E6AC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	str r2, [sp, #0x2c]
	add r5, r0, #0
	str r3, [sp, #0x30]
	add r7, r1, #0
	ldr r0, [r5]
	mov r1, #0x10
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4, #8]
	ldr r0, [r5]
	mov r1, #0x24
	bl AllocFromHeap
	ldr r1, [r4, #8]
	str r0, [r1]
	ldr r0, [r4, #8]
	ldr r0, [r0]
	str r0, [r4, #4]
	ldr r0, [sp, #0x88]
	cmp r0, #0
	bne _021E6B04
	mov r6, #1
	b _021E6B06
_021E6B04:
	mov r6, #2
_021E6B06:
	mov r3, #0xe
	lsl r3, r3, #0xc
	mov r0, #0
	str r3, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	add r0, sp, #0x68
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0x10]
	mov r0, #5
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	str r2, [sp, #0x14]
	add r2, r0, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r0, #0
	add r2, #8
	ldr r2, [r5, r2]
	add r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	add r2, r3, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [r4, #4]
	add r1, r3, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x10]
	cmp r7, #0
	str r0, [sp, #0x34]
	ldr r0, [r4, #4]
	str r0, [sp, #0x38]
	beq _021E6B66
	lsl r0, r7, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E6B74
_021E6B66:
	lsl r0, r7, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E6B74:
	bl _ffix
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _021E6B92
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E6BA0
_021E6B92:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E6BA0:
	bl _ffix
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _021E6BBE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E6BCC
_021E6BBE:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E6BCC:
	bl _ffix
	str r0, [sp, #0x44]
	cmp r6, #2
	bne _021E6BE0
	mov r0, #3
	ldr r1, [sp, #0x40]
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x40]
_021E6BE0:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	mov r1, #0
	add r0, sp, #0x34
	strh r1, [r0, #0x20]
	add r0, sp, #0x68
	ldrb r0, [r0, #0x14]
	str r6, [sp, #0x5c]
	str r0, [sp, #0x58]
	ldr r0, [r5]
	str r0, [sp, #0x60]
	add r0, sp, #0x34
	bl CreateSprite
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r4]
	ldr r1, [r5, r1]
	cmp r0, #0
	ldr r1, [r1]
	ldr r7, [r1]
	beq _021E6C34
	add r1, sp, #0x68
	ldrb r5, [r1, #0x1c]
	add r1, r5, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0200B12C
	ldr r1, _021E6C40 ; =ov100_021E770C
	add r2, r0, #0
	ldrb r1, [r1, r5]
	ldr r0, [r4]
	add r1, r1, r2
	bl sub_02024A14
	b _021E6C38
_021E6C34:
	bl GF_AssertFail
_021E6C38:
	add r0, r4, #0
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	nop
_021E6C40: .word ov100_021E770C
	thumb_func_end ov100_021E6AC0

	thumb_func_start ov100_021E6C44
ov100_021E6C44: ; 0x021E6C44
	ldr r3, _021E6C48 ; =sub_0200D9DC
	bx r3
	.balign 4, 0
_021E6C48: .word sub_0200D9DC
	thumb_func_end ov100_021E6C44

	thumb_func_start ov100_021E6C4C
ov100_021E6C4C: ; 0x021E6C4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	ldr r1, _021E6CF0 ; =ov100_021E764C
	str r0, [sp]
	ldrb r2, [r1]
	add r0, sp, #0xc
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	ldrb r1, [r1, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr r0, [sp]
	ldr r2, [sp]
	ldr r1, [sp]
	ldrh r0, [r0, #0xc]
	ldr r2, [r2]
	add r1, #0x14
	bl G2dRenderer_Init
	ldr r1, [sp]
	mov r6, #0x15
	str r0, [r1, #0x10]
	add r0, r1, #0
	ldrh r1, [r0, #0xa]
	add r0, sp, #0xc
	ldr r5, [sp]
	strb r1, [r0, #1]
	mov r0, #0
	str r0, [sp, #8]
	add r7, sp, #0xc
	add r4, r0, #0
	lsl r6, r6, #4
_021E6C92:
	ldr r2, [sp]
	ldrb r0, [r7]
	ldr r1, [sp, #8]
	ldr r2, [r2]
	bl Create2DGfxResObjMan
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r1, [sp]
	ldrb r0, [r7]
	ldr r1, [r1]
	bl Create2DGfxResObjList
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r3, [r5, r0]
	mov r1, #0
	ldr r0, [r3, #4]
	cmp r0, #0
	bls _021E6CD4
	add r2, r1, #0
_021E6CC4:
	ldr r0, [r3]
	add r1, r1, #1
	str r4, [r0, r2]
	ldr r3, [r5, r6]
	add r2, r2, #4
	ldr r0, [r3, #4]
	cmp r1, r0
	blo _021E6CC4
_021E6CD4:
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, #1
	add r5, r5, #4
	str r0, [sp, #8]
	cmp r0, #4
	blo _021E6C92
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov100_021E6D34
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6CF0: .word ov100_021E764C
	thumb_func_end ov100_021E6C4C

	thumb_func_start ov100_021E6CF4
ov100_021E6CF4: ; 0x021E6CF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl sub_02024504
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AED4
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200B0CC
	mov r7, #0x15
	lsl r7, r7, #4
	add r6, r7, #0
	mov r4, #0
	sub r6, #0x10
_021E6D1C:
	ldr r0, [r5, r7]
	bl Delete2DGfxResObjList
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _021E6D1C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6CF4

	thumb_func_start ov100_021E6D34
ov100_021E6D34: ; 0x021E6D34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #0x15
	str r1, [sp, #0x10]
	lsl r0, r0, #4
	ldr r4, [r7, r0]
	mov r1, #0xe
	lsl r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r7, #0xe]
	sub r0, #0x10
	mov r3, #0
	str r1, [sp, #4]
	ldr r1, [r7]
	str r1, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r0, [r7, r0]
	mov r1, #0x8f
	add r2, r2, #6
	bl AddCharResObjFromNarc
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6D70
	bl GF_AssertFail
_021E6D70:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _021E6D94
	cmp r0, #1
	beq _021E6D80
	cmp r0, #2
	beq _021E6D8A
	b _021E6D94
_021E6D80:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200ADA4
	b _021E6D9C
_021E6D8A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200AE18
	b _021E6D9C
_021E6D94:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200ACF0
_021E6D9C:
	mov r4, #0
	add r5, r7, #0
_021E6DA0:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	mov r0, #0xe
	lsl r0, r0, #0xc
	str r0, [sp]
	add r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x8f
	add r2, #0xc
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	ldr r1, [r6]
	str r0, [r1]
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6DD6
	bl GF_AssertFail
_021E6DD6:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _021E6DA0
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r4, [r7, r0]
	mov r1, #0xe
	lsl r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r7, #0xe]
	sub r0, #0x10
	mov r3, #0
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldr r1, [r7]
	str r1, [sp, #0xc]
	ldr r0, [r7, r0]
	ldr r2, [sp, #0x10]
	mov r1, #0x8f
	bl AddPlttResObjFromNarc
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6E14
	bl GF_AssertFail
_021E6E14:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200B00C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E6D34

	thumb_func_start ov100_021E6E20
ov100_021E6E20: ; 0x021E6E20
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x28
	add r5, r6, #0
	mul r5, r0
	add r0, r7, #0
	add r1, r5, #0
	strh r6, [r4]
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #8]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6E20

	thumb_func_start ov100_021E6E58
ov100_021E6E58: ; 0x021E6E58
	push {r4, lr}
	add r4, r0, #0
	ldrh r3, [r4]
	mov r2, #0x28
	ldr r0, [r4, #8]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6E58

	thumb_func_start ov100_021E6E84
ov100_021E6E84: ; 0x021E6E84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #2]
	mov r4, #0
	cmp r0, #0
	bls _021E6EC0
	mov r7, #6
	mov r6, #0x28
_021E6E94:
	add r0, r4, #0
	ldr r1, [r5, #8]
	mul r0, r6
	add r2, r1, r0
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _021E6EB4
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _021E6EB4
	mov r1, #4
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r7]
	bl sub_0200DD88
_021E6EB4:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r4, r0
	blo _021E6E94
_021E6EC0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6E84

	thumb_func_start ov100_021E6EC4
ov100_021E6EC4: ; 0x021E6EC4
	push {r3, r4}
	ldrh r4, [r0, #2]
	ldrh r2, [r0]
	cmp r4, r2
	blo _021E6ED4
	ldr r0, _021E6EF0 ; =0x0000FFFF
	pop {r3, r4}
	bx lr
_021E6ED4:
	mov r2, #0x28
	ldr r3, [r0, #8]
	mul r2, r4
	add r4, r3, r2
	str r1, [r4, #0x20]
	mov r1, #1
	strb r1, [r3, r2]
	strb r1, [r4, #1]
	ldrh r2, [r0, #2]
	add r1, r2, #1
	strh r1, [r0, #2]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E6EF0: .word 0x0000FFFF
	thumb_func_end ov100_021E6EC4

	thumb_func_start ov100_021E6EF4
ov100_021E6EF4: ; 0x021E6EF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r3, [r5, #2]
	mov r4, #0
	cmp r3, #0
	bls _021E6F20
	mov r6, #0x28
_021E6F02:
	add r0, r4, #0
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _021E6F14
	bl sub_0200D018
_021E6F14:
	add r0, r4, #1
	lsl r0, r0, #0x10
	ldrh r3, [r5, #2]
	lsr r4, r0, #0x10
	cmp r4, r3
	blo _021E6F02
_021E6F20:
	mov r2, #0x28
	ldr r0, [r5, #8]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r5, #2]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6EF4

	thumb_func_start ov100_021E6F34
ov100_021E6F34: ; 0x021E6F34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	ldrh r1, [r5, #2]
	ldr r0, [sp]
	ldr r4, [sp]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r4, r1
	bhs _021E6F6A
	mov r6, #0x28
_021E6F4C:
	add r0, r4, #0
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _021E6F5E
	bl sub_0200D018
_021E6F5E:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r4, r0
	blo _021E6F4C
_021E6F6A:
	ldr r0, [sp]
	ldr r3, [r5, #8]
	mov r2, #0x28
	add r1, r0, #0
	mul r1, r2
	add r0, r3, r1
	mov r1, #0
	mul r2, r7
	bl MI_CpuFill8
	ldrh r0, [r5, #2]
	sub r0, r0, r7
	strh r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6F34

	thumb_func_start ov100_021E6F88
ov100_021E6F88: ; 0x021E6F88
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	strh r5, [r4]
	lsl r5, r5, #5
	add r0, r6, #0
	add r1, r5, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #4]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6F88

	thumb_func_start ov100_021E6FBC
ov100_021E6FBC: ; 0x021E6FBC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r2, [r5]
	mov r4, #0
	cmp r2, #0
	ble _021E6FF0
	add r6, r4, #0
_021E6FCA:
	ldr r1, [r5, #4]
	add r0, r1, r6
	ldrb r1, [r1, r6]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021E6FE6
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _021E6FE6
	lsl r1, r4, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl ov100_021E70A4
_021E6FE6:
	ldrh r2, [r5]
	add r4, r4, #1
	add r6, #0x20
	cmp r4, r2
	blt _021E6FCA
_021E6FF0:
	ldr r0, [r5, #4]
	mov r1, #0
	lsl r2, r2, #5
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6FBC

	thumb_func_start ov100_021E7014
ov100_021E7014: ; 0x021E7014
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	str r1, [sp]
	add r7, r2, #0
	add r5, r3, #0
	bl ov100_021E70FC
	add r6, r0, #0
	ldr r0, _021E70A0 ; =0x0000FFFF
	cmp r6, r0
	beq _021E709C
	ldr r2, [r4, #4]
	lsl r1, r6, #5
	ldrb r0, [r2, r1]
	mov r3, #1
	add r4, r2, r1
	bic r0, r3
	mov r3, #1
	orr r0, r3
	strb r0, [r2, r1]
	ldrb r3, [r2, r1]
	mov r0, #4
	orr r0, r3
	strb r0, [r2, r1]
	strb r7, [r4, #2]
	ldrb r0, [r4, #2]
	mov r1, #0xc
	sub r0, r0, #1
	strb r0, [r4, #3]
	ldrb r2, [r4, #2]
	ldr r0, [sp, #0x1c]
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldrb r3, [r4, #2]
	mov r2, #0xc
	ldr r0, [sp]
	ldr r1, [r4, #4]
	mul r2, r3
	bl MI_CpuCopy8
	ldrb r0, [r4, #2]
	cmp r5, r0
	blo _021E7074
	mov r0, #0
	strb r0, [r4, #1]
	b _021E7076
_021E7074:
	strb r5, [r4, #1]
_021E7076:
	ldrb r0, [r4]
	mov r1, #2
	bic r0, r1
	ldr r1, [sp, #0x18]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1e
	orr r0, r1
	strb r0, [r4]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x1c]
	add r0, r6, #0
_021E709C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E70A0: .word 0x0000FFFF
	thumb_func_end ov100_021E7014

	thumb_func_start ov100_021E70A4
ov100_021E70A4: ; 0x021E70A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	cmp r1, r0
	bhs _021E70BA
	ldr r0, [r5, #4]
	lsl r4, r1, #5
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E70BE
_021E70BA:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E70BE:
	ldrh r0, [r5, #2]
	cmp r0, r1
	bne _021E70CC
	ldr r0, _021E70F8 ; =0x0000FFFF
	strh r0, [r5, #2]
	mov r0, #0
	str r0, [r5, #8]
_021E70CC:
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, r0, r4
	ldrb r3, [r2, #2]
	ldr r0, [r2, #4]
	mov r2, #0xc
	mul r2, r3
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	add r0, r0, r4
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, [r5, #4]
	mov r1, #0
	add r0, r0, r4
	mov r2, #0x20
	bl MI_CpuFill8
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E70F8: .word 0x0000FFFF
	thumb_func_end ov100_021E70A4

	thumb_func_start ov100_021E70FC
ov100_021E70FC: ; 0x021E70FC
	ldrh r1, [r0]
	mov r3, #0
	cmp r1, #0
	bls _021E711E
	ldr r0, [r0, #4]
_021E7106:
	lsl r2, r3, #5
	ldrb r2, [r0, r2]
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bne _021E7114
	add r0, r3, #0
	bx lr
_021E7114:
	add r2, r3, #1
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	cmp r3, r1
	blo _021E7106
_021E711E:
	ldr r0, _021E7124 ; =0x0000FFFF
	bx lr
	nop
_021E7124: .word 0x0000FFFF
	thumb_func_end ov100_021E70FC

	thumb_func_start ov100_021E7128
ov100_021E7128: ; 0x021E7128
	push {r4, r5, r6, lr}
	add r6, r1, #0
	ldr r1, _021E71B0 ; =0x0000FFFF
	add r5, r2, #0
	cmp r6, r1
	bne _021E7138
	ldr r4, [r0, #8]
	b _021E7150
_021E7138:
	ldrh r1, [r0]
	cmp r6, r1
	bhs _021E714C
	ldr r1, [r0, #4]
	lsl r0, r6, #5
	add r4, r1, r0
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E7150
_021E714C:
	ldr r0, _021E71B0 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021E7150:
	ldrb r0, [r4]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E7184
	add r1, r5, #0
	bl sub_0200DCE0
	ldrb r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl sub_0200DCE0
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl sub_0200DCE0
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl sub_0200DCE0
	b _021E71AC
_021E7184:
	add r1, r5, #0
	bl sub_0200DCE8
	ldrb r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl sub_0200DCE8
_021E71AC:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E71B0: .word 0x0000FFFF
	thumb_func_end ov100_021E7128

	thumb_func_start ov100_021E71B4
ov100_021E71B4: ; 0x021E71B4
	push {r3, r4, r5, lr}
	ldr r2, _021E72F4 ; =0x0000FFFF
	cmp r1, r2
	bne _021E71C0
	ldr r4, [r0, #8]
	b _021E71CE
_021E71C0:
	ldrh r2, [r0]
	cmp r1, r2
	blo _021E71C8
	b _021E72F2
_021E71C8:
	ldr r2, [r0, #4]
	lsl r0, r1, #5
	add r4, r2, r0
_021E71CE:
	ldrb r1, [r4, #1]
	mov r0, #0xc
	ldr r2, [r4, #4]
	mul r0, r1
	add r5, r2, r0
	ldrb r0, [r4]
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1f
	bne _021E726A
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E71F2
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl sub_0200DD88
	pop {r3, r4, r5, pc}
_021E71F2:
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	pop {r3, r4, r5, pc}
_021E726A:
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E727C
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
_021E727C:
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
_021E72F2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E72F4: .word 0x0000FFFF
	thumb_func_end ov100_021E71B4

	thumb_func_start ov100_021E72F8
ov100_021E72F8: ; 0x021E72F8
	push {r4, lr}
	add r4, r1, #0
	ldrh r1, [r0]
	cmp r4, r1
	blo _021E7306
	ldr r0, _021E7330 ; =0x0000FFFF
	pop {r4, pc}
_021E7306:
	ldr r1, [r0, #4]
	lsl r3, r4, #5
	add r1, r1, r3
	str r1, [r0, #8]
	strh r4, [r0, #2]
	cmp r2, #0xff
	beq _021E7326
	ldr r1, [r0, #4]
	add r3, r1, r3
	ldrb r1, [r3, #2]
	cmp r2, r1
	blo _021E7324
	mov r1, #0
	strb r1, [r3, #1]
	b _021E7326
_021E7324:
	strb r2, [r3, #1]
_021E7326:
	ldr r1, _021E7330 ; =0x0000FFFF
	bl ov100_021E71B4
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_021E7330: .word 0x0000FFFF
	thumb_func_end ov100_021E72F8

	thumb_func_start ov100_021E7334
ov100_021E7334: ; 0x021E7334
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
	.balign 4, 0
	thumb_func_end ov100_021E7334

	thumb_func_start ov100_021E733C
ov100_021E733C: ; 0x021E733C
	ldr r2, _021E7364 ; =0x0000FFFF
	cmp r1, r2
	bne _021E7348
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
_021E7348:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E735A
	lsl r2, r1, #5
	ldr r1, [r0, #4]
	ldrb r0, [r1, r2]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E735E
_021E735A:
	mov r0, #0
	bx lr
_021E735E:
	add r0, r1, r2
	ldrb r0, [r0, #1]
	bx lr
	.balign 4, 0
_021E7364: .word 0x0000FFFF
	thumb_func_end ov100_021E733C

	thumb_func_start ov100_021E7368
ov100_021E7368: ; 0x021E7368
	push {r3, r4}
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021E73A8
	ldrb r3, [r0, #1]
	mov r2, #0xc
	ldr r4, [r0, #4]
	mul r2, r3
	add r2, r4, r2
	cmp r1, #3
	bhi _021E739E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E738A: ; jump table
	.short _021E739E - _021E738A - 2 ; case 0
	.short _021E7392 - _021E738A - 2 ; case 1
	.short _021E7396 - _021E738A - 2 ; case 2
	.short _021E739A - _021E738A - 2 ; case 3
_021E7392:
	ldrb r2, [r2, #3]
	b _021E73A0
_021E7396:
	ldrb r2, [r2, #4]
	b _021E73A0
_021E739A:
	ldrb r2, [r2, #5]
	b _021E73A0
_021E739E:
	ldrb r2, [r2, #2]
_021E73A0:
	ldrb r1, [r0, #3]
	cmp r2, r1
	bhi _021E73A8
	strb r2, [r0, #1]
_021E73A8:
	pop {r3, r4}
	bx lr
	thumb_func_end ov100_021E7368

	thumb_func_start ov100_021E73AC
ov100_021E73AC: ; 0x021E73AC
	push {r4, lr}
	add r4, r0, #0
	bl ov100_021E7368
	ldr r1, _021E73C4 ; =0x0000FFFF
	add r0, r4, #0
	bl ov100_021E71B4
	ldr r0, [r4, #8]
	ldrb r0, [r0, #1]
	pop {r4, pc}
	nop
_021E73C4: .word 0x0000FFFF
	thumb_func_end ov100_021E73AC

	thumb_func_start ov100_021E73C8
ov100_021E73C8: ; 0x021E73C8
	ldr r3, _021E73D0 ; =ov100_021E73D4
	add r2, r1, #0
	ldrh r1, [r0, #2]
	bx r3
	.balign 4, 0
_021E73D0: .word ov100_021E73D4
	thumb_func_end ov100_021E73C8

	thumb_func_start ov100_021E73D4
ov100_021E73D4: ; 0x021E73D4
	push {r3, r4, r5, lr}
	ldr r3, _021E7410 ; =0x0000FFFF
	cmp r1, r3
	bne _021E73E2
	ldr r4, [r0, #8]
	ldrh r1, [r0, #2]
	b _021E73FA
_021E73E2:
	ldrh r3, [r0]
	cmp r1, r3
	bhs _021E73F6
	ldr r5, [r0, #4]
	lsl r3, r1, #5
	add r4, r5, r3
	ldrb r3, [r5, r3]
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1f
	bne _021E73FA
_021E73F6:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E73FA:
	ldrb r3, [r4, #3]
	cmp r3, r2
	bhs _021E7404
	mov r2, #0
	b _021E7404
_021E7404:
	strb r2, [r4, #1]
	bl ov100_021E71B4
	ldrb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	nop
_021E7410: .word 0x0000FFFF
	thumb_func_end ov100_021E73D4

	thumb_func_start ov100_021E7414
ov100_021E7414: ; 0x021E7414
	push {r4, r5, r6, lr}
	add r5, r2, #0
	ldr r2, _021E749C ; =0x0000FFFF
	cmp r1, r2
	bne _021E7420
	ldrh r1, [r0, #2]
_021E7420:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E7498
	ldr r2, [r0, #4]
	lsl r0, r1, #5
	ldrb r1, [r2, r0]
	add r4, r2, r0
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	beq _021E7498
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1f
	bne _021E746A
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _021E7450
	ldr r0, [r4, #0x10]
	bl sub_02024964
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl sub_0200DC70
	pop {r4, r5, r6, pc}
_021E7450:
	mov r6, #0
_021E7452:
	ldr r0, [r4, #0x10]
	bl sub_02024964
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl sub_0200DC70
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E7452
	pop {r4, r5, r6, pc}
_021E746A:
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _021E7480
	ldr r0, [r4, #0x10]
	bl sub_0200DCAC
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl sub_0200DC78
	pop {r4, r5, r6, pc}
_021E7480:
	mov r6, #0
_021E7482:
	ldr r0, [r4, #0x10]
	bl sub_0200DCAC
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl sub_0200DC78
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E7482
_021E7498:
	pop {r4, r5, r6, pc}
	nop
_021E749C: .word 0x0000FFFF
	thumb_func_end ov100_021E7414

	.rodata

_021E74A0:
	.byte 0x03, 0x04, 0x04, 0x05

ov100_021E74A4: ; 0x021E74A4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov100_021E74B4: ; 0x021E74B4
	.byte 0x00, 0xFF, 0xFF, 0x01, 0x00, 0xFF, 0x01, 0x02, 0x00, 0x01, 0xFF, 0x02
	.byte 0x00, 0x01, 0x02, 0x03

ov100_021E74C4: ; 0x021E74C4
	.byte 0xA0, 0xC0, 0x08, 0x38, 0xA0, 0xC0, 0x38, 0x68, 0xA0, 0xC0, 0x68, 0x98
	.byte 0xA0, 0xC0, 0x98, 0xC8, 0xA0, 0xC0, 0xCE, 0xFE, 0xFF, 0x00, 0x00, 0x00

ov100_021E74DC:
	.byte 0x00, 0x00, 0x02, 0x01
	.byte 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0xB0, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E7500: ; 0x021E7500
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov100_021E7528:
	.byte 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x80, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E7558:
	.byte 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E7588: ; 0x021E7588
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov100_021E75C0:
	.byte 0x00, 0x00, 0x04, 0x01, 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02
	.byte 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0x80, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x02, 0x04, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x04, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E75FC: ; 0x021E75FC
	.word ov101_021EF848, ov101_021EF890, ov101_021EF940, FS_OVERLAY_ID(OVY_101)

ov100_021E760C: ; 0x021E760C
	.word ov101_021EE8E8, ov101_021EE924, ov101_021EE9A4, FS_OVERLAY_ID(OVY_101)

ov100_021E761C: ; 0x021E761C
	.word ov102_021E7740, ov102_021E77B8, ov102_021E7868, FS_OVERLAY_ID(OVY_102)

ov100_021E762C: ; 0x021E762C
	.word ov101_021E7740, ov101_021E779C, ov101_021E7834, FS_OVERLAY_ID(OVY_101)

ov100_021E763C: ; 0x021E763C
	.word ov101_021F4480, ov101_021F44BC, ov101_021F452C, FS_OVERLAY_ID(OVY_101)

ov100_021E764C: ; 0x021E764C
	.byte 0x01, 0x01, 0x01, 0x01

ov100_021E7650:
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x29, 0x00, 0x28, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x52, 0x00

ov100_021E765E:
	.byte 0x2E, 0x00
	.byte 0x2F, 0x00, 0x2D, 0x00, 0x2C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x53, 0x00

ov100_021E766C:
	.byte 0x26, 0x00, 0x27, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x51, 0x00

ov100_021E767A:
	.byte 0x22, 0x00, 0x23, 0x00, 0x21, 0x00
	.byte 0x20, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x50, 0x00

ov100_021E7688:
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov100_021E769C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov100_021E76BC: ; 0x021E76BC
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E7650
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E766C
	.word 0x000000C0, ov100_021E769C, ov100_021E7688, ov100_021E767A
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E765E
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E767A

ov100_021E770C: ; 0x021E770C
	.byte 0x02, 0x02, 0x02, 0x03
	.byte 0x01, 0x01, 0x01, 0x01

	.data

_021E7720:
	.word ov100_021E74DC
	.word ov100_021E7528
	.word ov100_021E7558
	.word ov100_021E75C0
	; 0x021E7730
