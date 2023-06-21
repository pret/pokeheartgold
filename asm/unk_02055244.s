	.include "asm/macros.inc"
	.include "unk_02055244.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02055244
sub_02055244: ; 0x02055244
	push {r3, lr}
	bl TaskManager_GetFieldSystem
	bl sub_0203DF7C
	cmp r0, #0
	bne _02055256
	mov r0, #1
	pop {r3, pc}
_02055256:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02055244

	thumb_func_start sub_0205525C
sub_0205525C: ; 0x0205525C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	bl sub_0203DF7C
	cmp r0, #0
	bne _02055274
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_02055274:
	add r0, r4, #0
	bl sub_0203DF34
	ldr r1, _02055288 ; =sub_02055244
	add r0, r5, #0
	mov r2, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_02055288: .word sub_02055244
	thumb_func_end sub_0205525C

	thumb_func_start sub_0205528C
sub_0205528C: ; 0x0205528C
	push {r3, lr}
	bl TaskManager_GetFieldSystem
	bl sub_020505C8
	cmp r0, #0
	beq _0205529E
	mov r0, #1
	pop {r3, pc}
_0205529E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205528C

	thumb_func_start sub_020552A4
sub_020552A4: ; 0x020552A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	bl sub_0203DF7C
	cmp r0, #0
	beq _020552BC
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_020552BC:
	add r0, r4, #0
	bl sub_020505C0
	ldr r1, _020552D0 ; =sub_0205528C
	add r0, r5, #0
	mov r2, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_020552D0: .word sub_0205528C
	thumb_func_end sub_020552A4

	thumb_func_start sub_020552D4
sub_020552D4: ; 0x020552D4
	push {r3, lr}
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _020552E2
	mov r0, #1
	pop {r3, pc}
_020552E2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020552D4

	thumb_func_start PalleteFadeUntilFinished
PalleteFadeUntilFinished: ; 0x020552E8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	bl sub_0203DF7C
	cmp r0, #0
	bne _02055302
	bl GF_AssertFail
	add sp, #0xc
	pop {r3, r4, pc}
_02055302:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r1, _02055328 ; =sub_020552D4
	add r0, r4, #0
	mov r2, #0
	bl TaskManager_Call
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02055328: .word sub_020552D4
	thumb_func_end PalleteFadeUntilFinished

	thumb_func_start sub_0205532C
sub_0205532C: ; 0x0205532C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	bl sub_0203DF7C
	cmp r0, #0
	bne _02055346
	bl GF_AssertFail
	add sp, #0xc
	pop {r3, r4, pc}
_02055346:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r1, _0205536C ; =sub_020552D4
	add r0, r4, #0
	mov r2, #0
	bl TaskManager_Call
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0205536C: .word sub_020552D4
	thumb_func_end sub_0205532C

	thumb_func_start sub_02055370
sub_02055370: ; 0x02055370
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0205538A
	cmp r0, #1
	beq _02055398
	cmp r0, #2
	beq _020553A6
	b _020553AA
_0205538A:
	add r0, r5, #0
	bl PalleteFadeUntilFinished
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020553AA
_02055398:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020553AA
_020553A6:
	mov r0, #1
	pop {r3, r4, r5, pc}
_020553AA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02055370

	thumb_func_start sub_020553B0
sub_020553B0: ; 0x020553B0
	ldr r3, _020553B8 ; =TaskManager_Call
	ldr r1, _020553BC ; =sub_02055370
	mov r2, #0
	bx r3
	.balign 4, 0
_020553B8: .word TaskManager_Call
_020553BC: .word sub_02055370
	thumb_func_end sub_020553B0

	thumb_func_start sub_020553C0
sub_020553C0: ; 0x020553C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetFieldSystem
	ldr r1, [r4]
	cmp r1, #0
	beq _020553E0
	cmp r1, #1
	beq _020553EE
	cmp r1, #2
	beq _02055400
	b _02055404
_020553E0:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02055404
_020553EE:
	bl ov01_021EFAF8
	add r0, r5, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02055404
_02055400:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02055404:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020553C0

	thumb_func_start sub_02055408
sub_02055408: ; 0x02055408
	ldr r3, _02055410 ; =TaskManager_Call
	ldr r1, _02055414 ; =sub_020553C0
	mov r2, #0
	bx r3
	.balign 4, 0
_02055410: .word TaskManager_Call
_02055414: .word sub_020553C0
	thumb_func_end sub_02055408
