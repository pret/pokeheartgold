	.include "asm/macros.inc"
	.include "overlay_12_02261FD4.inc"
	.include "global.inc"

	.text

    thumb_func_start ov12_02261FD4
ov12_02261FD4: ; 0x02261FD4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02262008
	add r0, r1, #0
	bl BattleSystem_GetBattleType
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	bne _02262008
	mov r1, #0xb4
	add r0, r1, #0
	add r0, #0xe8
	strh r1, [r4, r0]
	ldr r0, _0226200C ; =ov12_0226203C
	ldr r2, _02262010 ; =0x000003F2
	add r1, r4, #0
	bl CreateSysTask
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r4, r1]
_02262008:
	pop {r4, pc}
	nop
_0226200C: .word ov12_0226203C
_02262010: .word 0x000003F2
	thumb_func_end ov12_02261FD4

	thumb_func_start ov12_02262014
ov12_02262014: ; 0x02262014
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0226203A
	bl DestroySysTask
	mov r0, #0x66
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r4, r0]
	add r0, r0, #4
	strh r2, [r4, r0]
	ldr r0, [r4, #0x20]
	mov r1, #4
	bl sub_020087A4
_0226203A:
	pop {r4, pc}
	thumb_func_end ov12_02262014

	thumb_func_start ov12_0226203C
ov12_0226203C: ; 0x0226203C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x67
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	add r0, #0x14
	strh r0, [r4, r1]
	add r0, r1, #0
	ldrh r2, [r4, r1]
	sub r0, #0x34
	cmp r2, r0
	blo _0226205C
	add r0, r1, #0
	sub r0, #0x34
	sub r0, r2, r0
	strh r0, [r4, r1]
_0226205C:
	mov r0, #0x67
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	bl GF_SinDegNoWrap
	mov r2, #6
	asr r1, r0, #0x1f
	lsl r2, r2, #0xa
	mov r3, #0
	bl _ll_mul
	add r2, r1, #0
	mov r1, #4
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	mov r4, #0
	lsl r3, r1, #9
	add r3, r5, r3
	adc r2, r4
	lsl r2, r2, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	asr r2, r2, #0xc
	bl sub_020087A4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0226203C
