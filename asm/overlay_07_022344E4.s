	.include "macros.inc"
	.include "overlay_07.inc"
	.include "global.inc"

    .text

	thumb_func_start ov07_022344E4
ov07_022344E4: ; 0x022344E4
	push {r3, lr}
	sub r1, r1, r3
	neg r1, r1
	sub r0, r0, r2
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r1, r1, #0x10
	add r2, r1, #0
	asr r0, r0, #0x10
	mul r2, r1
	add r1, r0, #0
	mul r1, r0
	add r0, r2, r1
	lsl r0, r0, #0xc
	bl FX_Sqrt
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_022344E4

	thumb_func_start ov07_02234510
ov07_02234510: ; 0x02234510
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl SealOnCapsuleGetX
	add r4, r0, #0
	add r0, r5, #0
	bl SealOnCapsuleGetY
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xbe
	mov r3, #0x46
	bl ov07_022344E4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02234510

	thumb_func_start ov07_02234530
ov07_02234530: ; 0x02234530
	push {r4, lr}
	sub sp, #8
	ldr r3, _02234588 ; =ov07_0223777C
	add r4, r0, #0
	add r2, sp, #0
	mov r1, #7
_0223453C:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0223453C
	add r0, r4, #0
	bl SealOnCapsuleGetID
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl CapsuleMenu_IsAlphabetSeal
	cmp r0, #0
	bne _0223457E
	add r0, r4, #0
	bl ov07_02234510
	cmp r0, #0x38
	blt _02234568
	mov r0, #3
	b _02234576
_02234568:
	add r0, r0, #1
	mov r1, #0x14
	bl _s32_div_f
	cmp r0, #3
	blt _02234576
	mov r0, #3
_02234576:
	add r1, sp, #0
	add sp, #8
	ldrb r0, [r1, r0]
	pop {r4, pc}
_0223457E:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	add sp, #8
	pop {r4, pc}
	nop
_02234588: .word ov07_0223777C
	thumb_func_end ov07_02234530

    .rodata

ov07_0223777C: ; 0x0223777C
	.byte 0x00, 0x08, 0x0E, 0x14
	.byte 0x14, 0x10, 0x10, 0x00
