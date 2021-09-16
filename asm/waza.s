	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start LoadAllWazaTbl
LoadAllWazaTbl: ; 0x02073300
	push {r3, lr}
	mov r1, #0x75
	lsl r1, r1, #6
	mov r2, #0
	str r1, [sp]
	mov r1, #0xb
	add r3, r2, #0
	bl ReadFromNarcMemberByIdPair
	pop {r3, pc}
	thumb_func_end LoadAllWazaTbl

	thumb_func_start GetWazaAttr
GetWazaAttr: ; 0x02073314
	push {r4, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #0
	bl LoadWazaEntry
	add r0, sp, #0
	add r1, r4, #0
	bl GetAttrFromWazaTbl
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end GetWazaAttr

	thumb_func_start WazaGetMaxPp
WazaGetMaxPp: ; 0x0207332C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	cmp r5, #3
	bls _02073336
	mov r5, #3
_02073336:
	mov r1, #5
	bl GetWazaAttr
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	mov r0, #0x14
	mul r0, r4
	mul r0, r5
	mov r1, #0x64
	bl _s32_div_f
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end WazaGetMaxPp

	thumb_func_start GetAttrFromWazaTbl
GetAttrFromWazaTbl: ; 0x02073354
	cmp r1, #0xb
	bhi _020733AC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02073364: ; jump table
	.short _0207337C - _02073364 - 2 ; case 0
	.short _02073380 - _02073364 - 2 ; case 1
	.short _02073384 - _02073364 - 2 ; case 2
	.short _02073388 - _02073364 - 2 ; case 3
	.short _0207338C - _02073364 - 2 ; case 4
	.short _02073390 - _02073364 - 2 ; case 5
	.short _02073394 - _02073364 - 2 ; case 6
	.short _02073398 - _02073364 - 2 ; case 7
	.short _0207339C - _02073364 - 2 ; case 8
	.short _020733A2 - _02073364 - 2 ; case 9
	.short _020733A6 - _02073364 - 2 ; case 10
	.short _020733AA - _02073364 - 2 ; case 11
_0207337C:
	ldrh r0, [r0]
	bx lr
_02073380:
	ldrb r0, [r0, #2]
	bx lr
_02073384:
	ldrb r0, [r0, #3]
	bx lr
_02073388:
	ldrb r0, [r0, #4]
	bx lr
_0207338C:
	ldrb r0, [r0, #5]
	bx lr
_02073390:
	ldrb r0, [r0, #6]
	bx lr
_02073394:
	ldrb r0, [r0, #7]
	bx lr
_02073398:
	ldrh r0, [r0, #8]
	bx lr
_0207339C:
	mov r1, #0xa
	ldrsb r0, [r0, r1]
	bx lr
_020733A2:
	ldrb r0, [r0, #0xb]
	bx lr
_020733A6:
	ldrb r0, [r0, #0xc]
	bx lr
_020733AA:
	ldrb r0, [r0, #0xd]
_020733AC:
	bx lr
	.balign 4, 0
	thumb_func_end GetAttrFromWazaTbl

	thumb_func_start LoadWazaEntry
LoadWazaEntry: ; 0x020733B0
	ldr r3, _020733BC ; =ReadWholeNarcMemberByIdPair
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0xb
	bx r3
	nop
_020733BC: .word ReadWholeNarcMemberByIdPair
	thumb_func_end LoadWazaEntry
