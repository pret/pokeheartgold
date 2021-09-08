	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Sav2_Pokewalker_get
Sav2_Pokewalker_get: ; 0x020325EC
	ldr r3, _020325F4 ; =SavArray_get
	mov r1, #0x27
	bx r3
	nop
_020325F4: .word SavArray_get
	thumb_func_end Sav2_Pokewalker_get

	thumb_func_start Pokewalker_sizeof
Pokewalker_sizeof: ; 0x020325F8
	mov r0, #0x4d
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end Pokewalker_sizeof

	thumb_func_start Pokewalker_init
Pokewalker_init: ; 0x02032600
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x4d
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuClearFast
	add r0, r4, #0
	mov r1, #0
	bl Pokewalker_UnlockCourse
	add r0, r4, #0
	mov r1, #1
	bl Pokewalker_UnlockCourse
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Pokewalker_init

	thumb_func_start sub_02032624
sub_02032624: ; 0x02032624
	push {r3, r4, r5, lr}
	mov r1, #0x13
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	bl Pokewalker_init
	mov r0, #0x13
	lsl r0, r0, #4
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02032624

	thumb_func_start sub_0203263C
sub_0203263C: ; 0x0203263C
	mov r1, #0x49
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end sub_0203263C

	thumb_func_start sub_02032644
sub_02032644: ; 0x02032644
	mov r1, #0x49
	lsl r1, r1, #2
	ldrh r2, [r0, r1]
	add r2, r2, #1
	strh r2, [r0, r1]
	bx lr
	thumb_func_end sub_02032644

	thumb_func_start sub_02032650
sub_02032650: ; 0x02032650
	mov r3, #0x4a
	lsl r3, r3, #2
	str r1, [r0, r3]
	add r1, r3, #4
	ldr r1, [r0, r1]
	add r2, r1, r2
	add r1, r3, #4
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	ldr r2, _02032670 ; =0x0098967F
	cmp r1, r2
	blo _0203266C
	add r1, r3, #4
	str r2, [r0, r1]
_0203266C:
	bx lr
	nop
_02032670: .word 0x0098967F
	thumb_func_end sub_02032650

	thumb_func_start sub_02032674
sub_02032674: ; 0x02032674
	push {r3, r4}
	mov r3, #0x4a
	lsl r3, r3, #2
	ldr r4, [r0, r3]
	str r4, [r1]
	add r1, r3, #4
	ldr r0, [r0, r1]
	str r0, [r2]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02032674

	thumb_func_start sub_02032688
sub_02032688: ; 0x02032688
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _02032698
	bl GF_AssertFail
_02032698:
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02032688

	thumb_func_start sub_020326A4
sub_020326A4: ; 0x020326A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _020326B4
	bl GF_AssertFail
_020326B4:
	strh r4, [r5]
	strh r6, [r5, #2]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020326A4

	thumb_func_start sub_020326BC
sub_020326BC: ; 0x020326BC
	ldr r3, _020326C8 ; =sub_020D48B4
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #4
	mov r2, #0x88
	bx r3
	.balign 4, 0
_020326C8: .word sub_020D48B4
	thumb_func_end sub_020326BC

	thumb_func_start sub_020326CC
sub_020326CC: ; 0x020326CC
	ldr r3, _020326D8 ; =MIi_CpuClearFast
	add r1, r0, #0
	mov r0, #0
	add r1, r1, #4
	mov r2, #0x88
	bx r3
	.balign 4, 0
_020326D8: .word MIi_CpuClearFast
	thumb_func_end sub_020326CC

	thumb_func_start sub_020326DC
sub_020326DC: ; 0x020326DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020326FC
	cmp r0, #0
	beq _020326F8
	add r0, r5, #4
	add r1, r4, #0
	mov r2, #0x88
	bl sub_020D48B4
	mov r0, #1
	pop {r3, r4, r5, pc}
_020326F8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020326DC

	thumb_func_start sub_020326FC
sub_020326FC: ; 0x020326FC
	mov r2, #0
_020326FE:
	add r1, r0, r2
	ldrb r1, [r1, #4]
	cmp r1, #0
	bne _0203270C
	add r2, r2, #1
	cmp r2, #0x88
	blt _020326FE
_0203270C:
	cmp r2, #0x88
	bne _02032714
	mov r0, #0
	bx lr
_02032714:
	mov r0, #1
	bx lr
	thumb_func_end sub_020326FC

	thumb_func_start sub_02032718
sub_02032718: ; 0x02032718
	add r0, #0xf8
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032718

	thumb_func_start sub_02032720
sub_02032720: ; 0x02032720
	add r0, #0xf8
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032720

	thumb_func_start sub_02032728
sub_02032728: ; 0x02032728
	add r0, #0xfc
	bx lr
	thumb_func_end sub_02032728

	thumb_func_start sub_0203272C
sub_0203272C: ; 0x0203272C
	cmp r1, #0x20
	blt _02032734
	mov r0, #0
	bx lr
_02032734:
	mov r2, #0x13
	lsl r2, r2, #4
	ldr r0, [r0, r2]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_0203272C

	thumb_func_start Pokewalker_UnlockCourse
Pokewalker_UnlockCourse: ; 0x02032744
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x20
	blt _02032752
	bl GF_AssertFail
_02032752:
	mov r0, #0x13
	lsl r0, r0, #4
	mov r1, #1
	ldr r2, [r5, r0]
	lsl r1, r4
	orr r1, r2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Pokewalker_UnlockCourse

	thumb_func_start sub_02032764
sub_02032764: ; 0x02032764
	add r0, #0xfa
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032764

	thumb_func_start sub_0203276C
sub_0203276C: ; 0x0203276C
	mov r1, #1
	add r0, #0xfa
	strh r1, [r0]
	bx lr
	thumb_func_end sub_0203276C
