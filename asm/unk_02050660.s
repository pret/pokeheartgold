	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02050660
sub_02050660: ; 0x02050660
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02050686
	cmp r0, #1
	beq _0205069A
	b _020506A8
_02050686:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0203E3C4
	bl sub_0203E354
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020506A8
_0205069A:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _020506A8
	mov r0, #1
	pop {r4, r5, r6, pc}
_020506A8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02050660

	thumb_func_start sub_020506AC
sub_020506AC: ; 0x020506AC
	ldr r3, _020506B4 ; =sub_02050530
	add r2, r1, #0
	ldr r1, _020506B8 ; =sub_02050660
	bx r3
	.balign 4, 0
_020506B4: .word sub_02050530
_020506B8: .word sub_02050660
	thumb_func_end sub_020506AC

	thumb_func_start sub_020506BC
sub_020506BC: ; 0x020506BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x14
	add r7, r2, #0
	add r4, r3, #0
	bl AllocFromHeapAtEnd
	str r4, [r0]
	cmp r4, #0
	beq _020506D8
	mov r1, #0
	str r1, [r4]
_020506D8:
	str r6, [r0, #4]
	str r7, [r0, #8]
	str r5, [r0, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020506BC

	thumb_func_start sub_020506E0
sub_020506E0: ; 0x020506E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02051BF8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020506E0

	thumb_func_start sub_020506F4
sub_020506F4: ; 0x020506F4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4]
	cmp r2, #0
	beq _02050704
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x14]
	str r0, [r2]
_02050704:
	ldr r2, [r4, #0x10]
	add r0, r1, #0
	ldr r2, [r2, #0x14]
	ldr r1, _02050720 ; =0x00004013
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl VarSet
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x14]
	bl sub_02052554
	pop {r4, pc}
	nop
_02050720: .word 0x00004013
	thumb_func_end sub_020506F4

	thumb_func_start sub_02050724
sub_02050724: ; 0x02050724
	push {r3, lr}
	mov r2, #2
	ldr r3, [r0]
	lsl r2, r2, #0x1e
	tst r2, r3
	bne _02050734
	bl sub_0205239C
_02050734:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02050724

	thumb_func_start sub_02050738
sub_02050738: ; 0x02050738
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r6, r0, #0
	add r0, r7, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #5
	bhi _02050856
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02050764: ; jump table
	.short _02050770 - _02050764 - 2 ; case 0
	.short _02050788 - _02050764 - 2 ; case 1
	.short _02050796 - _02050764 - 2 ; case 2
	.short _020507A6 - _02050764 - 2 ; case 3
	.short _02050838 - _02050764 - 2 ; case 4
	.short _0205084C - _02050764 - 2 ; case 5
_02050770:
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	ldr r1, [r6, #4]
	ldr r2, [r6, #8]
	add r0, r7, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050856
_02050788:
	add r0, r7, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050856
_02050796:
	ldr r1, [r6, #0x10]
	add r0, r7, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050856
_020507A6:
	ldr r0, [r6, #0x10]
	add r1, r5, #0
	bl sub_02050724
	ldr r0, [r6, #0x10]
	ldr r1, [r0]
	cmp r1, #0
	beq _020507C2
	mov r0, #1
	lsl r0, r0, #8
	cmp r1, r0
	beq _020507C2
	cmp r1, #0x4a
	bne _020507CE
_020507C2:
	add r0, r5, #0
	bl sub_02093070
	add r0, r5, #0
	bl sub_020930C4
_020507CE:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x7c
	strh r1, [r0]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020506F4
	cmp r0, #0
	bne _0205080A
	ldr r0, [r6, #0x10]
	ldr r1, [r0]
	mov r0, #2
	lsl r0, r0, #0xa
	tst r0, r1
	beq _02050800
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
	b _0205080A
_02050800:
	add r0, r6, #0
	bl sub_020506E0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205080A:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #0
	beq _02050822
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
_02050822:
	ldr r1, [r6, #0x10]
	add r0, r5, #0
	bl sub_02051660
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050856
_02050838:
	ldr r0, [r5, #0x3c]
	bl sub_0205F5A4
	add r0, r7, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050856
_0205084C:
	add r0, r6, #0
	bl sub_020506E0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02050856:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02050738

	thumb_func_start sub_0205085C
sub_0205085C: ; 0x0205085C
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #8]
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02050878 ; =sub_02050738
	add r0, r4, #0
	bl sub_02050530
	pop {r4, pc}
	.balign 4, 0
_02050878: .word sub_02050738
	thumb_func_end sub_0205085C

	thumb_func_start sub_0205087C
sub_0205087C: ; 0x0205087C
	push {r3, lr}
	mov r2, #0xf
	and r0, r2
	cmp r0, #6
	bhi _020508B4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02050892: ; jump table
	.short _020508B4 - _02050892 - 2 ; case 0
	.short _020508A0 - _02050892 - 2 ; case 1
	.short _020508AA - _02050892 - 2 ; case 2
	.short _020508B4 - _02050892 - 2 ; case 3
	.short _020508B4 - _02050892 - 2 ; case 4
	.short _020508AA - _02050892 - 2 ; case 5
	.short _020508A0 - _02050892 - 2 ; case 6
_020508A0:
	ldr r0, [r1, #0xc]
	mov r1, #1
	bl sub_02034AC0
	pop {r3, pc}
_020508AA:
	ldr r0, [r1, #0xc]
	sub r2, #0x10
	add r1, r2, #0
	bl sub_02034AC0
_020508B4:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205087C

	thumb_func_start sub_020508B8
sub_020508B8: ; 0x020508B8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _0205095C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020508E4: ; jump table
	.short _020508EE - _020508E4 - 2 ; case 0
	.short _02050900 - _020508E4 - 2 ; case 1
	.short _0205090E - _020508E4 - 2 ; case 2
	.short _0205091E - _020508E4 - 2 ; case 3
	.short _02050952 - _020508E4 - 2 ; case 4
_020508EE:
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r0, r6, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205095C
_02050900:
	add r0, r6, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205095C
_0205090E:
	ldr r1, [r5, #0x10]
	add r0, r6, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205095C
_0205091E:
	ldr r0, [r5, #0x10]
	add r1, r7, #0
	ldr r0, [r0, #0x14]
	bl sub_0205087C
	ldr r0, [r5, #0x10]
	add r1, r7, #0
	bl sub_02052444
	ldr r0, [r7, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x14
	bl GameStats_AddSpecial
	add r0, r5, #0
	add r1, r7, #0
	bl sub_020506F4
	add r0, r6, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205095C
_02050952:
	add r0, r5, #0
	bl sub_020506E0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205095C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020508B8

	thumb_func_start sub_02050960
sub_02050960: ; 0x02050960
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0205098A
	cmp r0, #1
	beq _020509AE
	cmp r0, #2
	beq _020509DC
	b _020509EA
_0205098A:
	mov r0, #0
	bl sub_02004AD8
	ldr r1, [r5, #8]
	mov r0, #5
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #1
	bl sub_02004EC4
	ldr r1, [r5, #0x10]
	add r0, r7, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020509EA
_020509AE:
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	ldr r0, [r0, #0x14]
	bl sub_0205087C
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	bl sub_02052444
	ldr r0, [r6, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x14
	bl GameStats_AddSpecial
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020506F4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020509EA
_020509DC:
	add r0, r5, #0
	bl sub_020506E0
	bl sub_0202FC24
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020509EA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02050960

	thumb_func_start sub_020509F0
sub_020509F0: ; 0x020509F0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #5
	bhi _02050AA6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02050A1C: ; jump table
	.short _02050A28 - _02050A1C - 2 ; case 0
	.short _02050A3A - _02050A1C - 2 ; case 1
	.short _02050A48 - _02050A1C - 2 ; case 2
	.short _02050A58 - _02050A1C - 2 ; case 3
	.short _02050A8E - _02050A1C - 2 ; case 4
	.short _02050A9C - _02050A1C - 2 ; case 5
_02050A28:
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r0, r6, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050AA6
_02050A3A:
	add r0, r6, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050AA6
_02050A48:
	ldr r1, [r5, #0x10]
	add r0, r6, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050AA6
_02050A58:
	ldr r0, [r5, #0x10]
	add r1, r7, #0
	bl sub_02052444
	add r0, r7, #0
	add r0, #0xa0
	ldr r0, [r0]
	cmp r0, #0
	beq _02050A78
	mov r1, #0x4e
	ldr r2, [r5, #0x10]
	lsl r1, r1, #2
	add r0, r7, #0
	add r1, r2, r1
	bl sub_02067484
_02050A78:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_020506F4
	add r0, r6, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050AA6
_02050A8E:
	add r0, r6, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050AA6
_02050A9C:
	add r0, r5, #0
	bl sub_020506E0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02050AA6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020509F0

	thumb_func_start sub_02050AAC
sub_02050AAC: ; 0x02050AAC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #8]
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02050AC8 ; =sub_020509F0
	add r0, r4, #0
	bl sub_02050530
	pop {r4, pc}
	.balign 4, 0
_02050AC8: .word sub_020509F0
	thumb_func_end sub_02050AAC

	thumb_func_start sub_02050ACC
sub_02050ACC: ; 0x02050ACC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x14
	add r7, r2, #0
	add r4, r3, #0
	bl AllocFromHeapAtEnd
	str r4, [r0, #0xc]
	cmp r4, #0
	beq _02050AE8
	mov r1, #0
	str r1, [r4]
_02050AE8:
	str r6, [r0, #4]
	str r7, [r0, #8]
	str r5, [r0, #0x10]
	mov r1, #0
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02050ACC

	thumb_func_start sub_02050AF4
sub_02050AF4: ; 0x02050AF4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02051BF8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02050AF4

	thumb_func_start sub_02050B08
sub_02050B08: ; 0x02050B08
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	str r0, [sp]
	add r0, r4, #0
	bl sub_020517E8
	add r6, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r7, r0, #0
	ldr r0, [sp]
	bl sub_02066860
	cmp r0, #0
	beq _02050B48
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02050B84 ; =sub_02050D1C
	add r0, r5, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
_02050B48:
	ldr r0, [sp]
	bl sub_02066870
	cmp r0, #0
	beq _02050B6A
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02050B88 ; =sub_02050EB8
	add r0, r5, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
_02050B6A:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl sub_02050ACC
	add r2, r0, #0
	ldr r1, _02050B8C ; =sub_02050C18
	add r0, r5, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02050B84: .word sub_02050D1C
_02050B88: .word sub_02050EB8
_02050B8C: .word sub_02050C18
	thumb_func_end sub_02050B08

	thumb_func_start sub_02050B90
sub_02050B90: ; 0x02050B90
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #0xc]
	add r4, r2, #0
	add r5, r1, #0
	bl SavArray_Flags_get
	str r0, [sp]
	add r0, r4, #0
	bl sub_020517E8
	add r6, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r7, r0, #0
	ldr r0, [sp]
	bl sub_02066860
	cmp r0, #0
	beq _02050BD0
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02050C0C ; =sub_02050D1C
	add r0, r5, #0
	bl sub_02050510
	pop {r3, r4, r5, r6, r7, pc}
_02050BD0:
	ldr r0, [sp]
	bl sub_02066870
	cmp r0, #0
	beq _02050BF2
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02050C10 ; =sub_02050EB8
	add r0, r5, #0
	bl sub_02050510
	pop {r3, r4, r5, r6, r7, pc}
_02050BF2:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	bl sub_02050ACC
	add r2, r0, #0
	ldr r1, _02050C14 ; =sub_02050C18
	add r0, r5, #0
	bl sub_02050510
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02050C0C: .word sub_02050D1C
_02050C10: .word sub_02050EB8
_02050C14: .word sub_02050C18
	thumb_func_end sub_02050B90

	thumb_func_start sub_02050C18
sub_02050C18: ; 0x02050C18
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #5
	bhi _02050D12
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02050C3C: ; jump table
	.short _02050C48 - _02050C3C - 2 ; case 0
	.short _02050C6C - _02050C3C - 2 ; case 1
	.short _02050C7A - _02050C3C - 2 ; case 2
	.short _02050C8A - _02050C3C - 2 ; case 3
	.short _02050CEC - _02050C3C - 2 ; case 4
	.short _02050D02 - _02050C3C - 2 ; case 5
_02050C48:
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #8
	bl GameStats_Inc
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050D12
_02050C6C:
	add r0, r6, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050D12
_02050C7A:
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050D12
_02050C8A:
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl sub_02050724
	add r0, r5, #0
	bl sub_02093070
	add r0, r5, #0
	bl sub_020930C4
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x14]
	bl sub_02052554
	cmp r0, #0
	bne _02050CBE
	add r0, r4, #0
	bl sub_02050AF4
	ldr r1, _02050D18 ; =sub_02052858
	add r0, r6, #0
	mov r2, #0
	bl sub_02050510
	mov r0, #0
	pop {r4, r5, r6, pc}
_02050CBE:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #0
	beq _02050CD6
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
_02050CD6:
	ldr r1, [r4, #0x10]
	add r0, r5, #0
	bl sub_02051660
	add r0, r6, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050D12
_02050CEC:
	ldr r1, [r4, #0x10]
	add r0, r5, #0
	bl ov02_0224B998
	add r0, r6, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050D12
_02050D02:
	ldr r0, [r5, #0x3c]
	bl sub_0205F5A4
	add r0, r4, #0
	bl sub_02050AF4
	mov r0, #1
	pop {r4, r5, r6, pc}
_02050D12:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02050D18: .word sub_02052858
	thumb_func_end sub_02050C18

	thumb_func_start sub_02050D1C
sub_02050D1C: ; 0x02050D1C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r6, r0, #0
	add r0, r7, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B9B8
	str r0, [sp]
	ldr r0, [r4]
	cmp r0, #8
	bls _02050D4A
	b _02050EA8
_02050D4A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02050D56: ; jump table
	.short _02050D68 - _02050D56 - 2 ; case 0
	.short _02050D8C - _02050D56 - 2 ; case 1
	.short _02050D9A - _02050D56 - 2 ; case 2
	.short _02050DAA - _02050D56 - 2 ; case 3
	.short _02050E12 - _02050D56 - 2 ; case 4
	.short _02050E26 - _02050D56 - 2 ; case 5
	.short _02050E34 - _02050D56 - 2 ; case 6
	.short _02050E48 - _02050D56 - 2 ; case 7
	.short _02050E9E - _02050D56 - 2 ; case 8
_02050D68:
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #8
	bl GameStats_Inc
	ldr r1, [r6, #4]
	ldr r2, [r6, #8]
	add r0, r7, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050D8C:
	add r0, r7, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050D9A:
	ldr r1, [r6, #0x10]
	add r0, r7, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050DAA:
	ldr r0, [r6, #0x10]
	add r1, r5, #0
	bl sub_02050724
	ldr r0, [r6, #0x10]
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bne _02050DD6
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	ldr r0, [r6, #0x10]
	mov r1, #0
	ldr r0, [r0, #8]
	bl GetPartyMonByIndex
	add r0, r5, #0
	bl sub_02093070
	add r0, r5, #0
	bl sub_020930C4
_02050DD6:
	ldr r1, [r6, #0x10]
	add r0, r5, #0
	bl sub_02051660
	ldr r0, [sp]
	ldrh r0, [r0]
	cmp r0, #0
	bne _02050E02
	ldr r0, [r6, #0x10]
	ldr r0, [r0, #0x14]
	cmp r0, #4
	beq _02050E02
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	add r1, r0, #0
	add r0, r7, #0
	bl sub_020537A8
	b _02050E0A
_02050E02:
	mov r0, #5
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02050E0A:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050E12:
	mov r2, #0
	ldr r1, _02050EAC ; =0x00002265
	add r0, r7, #0
	add r3, r2, #0
	bl sub_0203FED4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050E26:
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050E34:
	ldr r0, [r5, #0x3c]
	bl sub_0205F5A4
	add r0, r7, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050E48:
	ldr r0, [sp]
	ldrh r0, [r0]
	cmp r0, #0
	bne _02050E66
	ldr r0, [r6, #0x10]
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bne _02050E96
	mov r2, #0
	ldr r1, _02050EB0 ; =0x00002263
	add r0, r7, #0
	add r3, r2, #0
	bl sub_0203FED4
	b _02050E96
_02050E66:
	ldr r0, [r5, #0xc]
	bl GetStoragePCPointer
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r5, r0, #0
	add r0, r6, #0
	bl PCStorage_FindFirstBoxWithEmptySlot
	cmp r0, #0x12
	bne _02050E96
	add r0, r5, #0
	bl GetPartyCount
	cmp r0, #6
	bne _02050E96
	mov r2, #0
	ldr r1, _02050EB4 ; =0x00002264
	add r0, r7, #0
	add r3, r2, #0
	bl sub_0203FED4
_02050E96:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050EA8
_02050E9E:
	add r0, r6, #0
	bl sub_020506E0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02050EA8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02050EAC: .word 0x00002265
_02050EB0: .word 0x00002263
_02050EB4: .word 0x00002264
	thumb_func_end sub_02050D1C

	thumb_func_start sub_02050EB8
sub_02050EB8: ; 0x02050EB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0206DB28
	str r0, [sp]
	add r0, r7, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [sp]
	bl sub_0206DB30
	str r0, [sp, #4]
	ldr r0, [r4]
	cmp r0, #7
	bls _02050EEC
	b _02051012
_02050EEC:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02050EF8: ; jump table
	.short _02050F08 - _02050EF8 - 2 ; case 0
	.short _02050F2C - _02050EF8 - 2 ; case 1
	.short _02050F3A - _02050EF8 - 2 ; case 2
	.short _02050F4A - _02050EF8 - 2 ; case 3
	.short _02050FA4 - _02050EF8 - 2 ; case 4
	.short _02050FC4 - _02050EF8 - 2 ; case 5
	.short _02050FD2 - _02050EF8 - 2 ; case 6
	.short _02050FE6 - _02050EF8 - 2 ; case 7
_02050F08:
	ldr r0, [r6, #0x3c]
	bl sub_0205F574
	ldr r0, [r6, #0xc]
	bl Sav2_GameStats_get
	mov r1, #8
	bl GameStats_Inc
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r0, r7, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02051012
_02050F2C:
	add r0, r7, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02051012
_02050F3A:
	ldr r1, [r5, #0x10]
	add r0, r7, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02051012
_02050F4A:
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	bl sub_02050724
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x14]
	bl sub_02052554
	cmp r0, #0
	bne _02050F74
	add r0, r5, #0
	bl sub_020506E0
	ldr r1, _02051018 ; =sub_0205298C
	add r0, r7, #0
	mov r2, #0
	bl sub_02050510
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02050F74:
	ldr r1, [r5, #0x10]
	add r0, r6, #0
	bl sub_02051660
	ldr r2, [r5, #0x10]
	ldr r0, [r2, #0x14]
	cmp r0, #4
	bne _02050F9C
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r7, #0
	bl sub_0206DB94
	add r0, r6, #0
	bl sub_02093070
	add r0, r6, #0
	bl sub_020930C4
_02050F9C:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02051012
_02050FA4:
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	cmp r0, #0
	bne _02050FBC
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x14]
	cmp r0, #4
	beq _02050FBC
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0206DB58
_02050FBC:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02051012
_02050FC4:
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02051012
_02050FD2:
	ldr r0, [r6, #0x3c]
	bl sub_0205F5A4
	add r0, r7, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02051012
_02050FE6:
	add r0, r5, #0
	bl sub_020506E0
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	cmp r0, #0
	bne _0205100C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bne _0205100C
	ldr r1, _0205101C ; =0x000028A1
	add r0, r7, #0
	mov r2, #0
	bl sub_0203FF0C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205100C:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02051012:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02051018: .word sub_0205298C
_0205101C: .word 0x000028A1
	thumb_func_end sub_02050EB8

	thumb_func_start sub_02051020
sub_02051020: ; 0x02051020
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	add r7, r1, #0
	str r2, [sp, #8]
	add r6, r3, #0
	bl sub_0205064C
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0
	bl sub_020518D8
	add r4, r0, #0
	add r1, r5, #0
	bl sub_02051F00
	str r4, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0x24]
	add r0, r5, #0
	add r1, r7, #0
	bl ov02_02247F30
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02051062
	mov r1, #0x63
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #8
	orr r0, r2
	str r0, [r4, r1]
_02051062:
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #8
	bl GameStats_Inc
	add r0, r4, #0
	bl sub_020517E8
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	str r6, [sp]
	bl sub_0205085C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02051020

	thumb_func_start sub_02051090
sub_02051090: ; 0x02051090
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #4]
	add r7, r1, #0
	str r2, [sp, #8]
	add r6, r3, #0
	bl sub_0205064C
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0
	bl sub_020518D8
	add r4, r0, #0
	add r1, r5, #0
	bl sub_02051F00
	str r4, [sp]
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl ov02_02247F30
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	mov r1, #0
	bl GetPartyMonByIndex
	mov r1, #0x6e
	add r2, sp, #0xc
	bl SetMonData
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020510E6
	mov r1, #0x63
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #8
	orr r0, r2
	str r0, [r4, r1]
_020510E6:
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #8
	bl GameStats_Inc
	add r0, r4, #0
	bl sub_020517E8
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	str r6, [sp]
	bl sub_0205085C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02051090

	thumb_func_start sub_02051114
sub_02051114: ; 0x02051114
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _020511F4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02051140: ; jump table
	.short _0205114E - _02051140 - 2 ; case 0
	.short _02051172 - _02051140 - 2 ; case 1
	.short _02051180 - _02051140 - 2 ; case 2
	.short _02051190 - _02051140 - 2 ; case 3
	.short _020511B0 - _02051140 - 2 ; case 4
	.short _020511BE - _02051140 - 2 ; case 5
	.short _020511D2 - _02051140 - 2 ; case 6
_0205114E:
	ldr r0, [r6, #0x3c]
	bl sub_0205F574
	ldr r0, [r6, #0xc]
	bl Sav2_GameStats_get
	mov r1, #8
	bl GameStats_Inc
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r0, r7, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020511F4
_02051172:
	add r0, r7, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020511F4
_02051180:
	ldr r1, [r5, #0x10]
	add r0, r7, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020511F4
_02051190:
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	bl sub_02050724
	ldr r1, [r5, #0x10]
	add r0, r6, #0
	bl sub_020558AC
	ldr r1, [r5, #0x10]
	add r0, r6, #0
	bl sub_02051660
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020511F4
_020511B0:
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020511F4
_020511BE:
	ldr r0, [r6, #0x3c]
	bl sub_0205F5A4
	add r0, r7, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020511F4
_020511D2:
	add r0, r5, #0
	bl sub_020506E0
	add r0, r6, #0
	bl sub_020558BC
	cmp r0, #0
	bne _020511F0
	add r0, r7, #0
	mov r1, #3
	mov r2, #0
	bl sub_0203FF0C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020511F0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020511F4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02051114

	thumb_func_start sub_020511F8
sub_020511F8: ; 0x020511F8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020517E8
	add r6, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02051224 ; =sub_02051114
	add r0, r5, #0
	bl sub_020504F0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02051224: .word sub_02051114
	thumb_func_end sub_020511F8

	thumb_func_start sub_02051228
sub_02051228: ; 0x02051228
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	add r6, r1, #0
	add r7, r2, #0
	bl sub_0205064C
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0
	bl sub_020518D8
	add r1, r5, #0
	add r4, r0, #0
	bl sub_02051F00
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	str r4, [sp]
	bl ov02_02247F30
	mov r0, #0x63
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #8
	bl GameStats_Inc
	add r0, r4, #0
	bl sub_020517E8
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_0205085C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02051228

	thumb_func_start sub_0205128C
sub_0205128C: ; 0x0205128C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02050650
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _0205132E
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020512B8: ; jump table
	.short _020512C6 - _020512B8 - 2 ; case 0
	.short _020512DE - _020512B8 - 2 ; case 1
	.short _020512EC - _020512B8 - 2 ; case 2
	.short _020512FC - _020512B8 - 2 ; case 3
	.short _02051302 - _020512B8 - 2 ; case 4
	.short _02051310 - _020512B8 - 2 ; case 5
	.short _02051324 - _020512B8 - 2 ; case 6
_020512C6:
	ldr r0, [r7, #0x3c]
	bl sub_0205F574
	ldr r1, [r6, #4]
	ldr r2, [r6, #8]
	add r0, r5, #0
	bl sub_02055218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205132E
_020512DE:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205132E
_020512EC:
	ldr r1, [r6, #0x10]
	add r0, r5, #0
	bl sub_020506AC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205132E
_020512FC:
	add r0, r0, #1
	str r0, [r4]
	b _0205132E
_02051302:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205132E
_02051310:
	ldr r0, [r7, #0x3c]
	bl sub_0205F5A4
	add r0, r5, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205132E
_02051324:
	add r0, r6, #0
	bl sub_020506E0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205132E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205128C

	thumb_func_start sub_02051334
sub_02051334: ; 0x02051334
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r1, r0, #0
	mov r0, #0xb
	bl sub_02051AAC
	add r4, r0, #0
	bl sub_020517E8
	add r6, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _0205136C ; =sub_0205128C
	add r0, r5, #0
	bl sub_02050530
	pop {r4, r5, r6, pc}
	nop
_0205136C: .word sub_0205128C
	thumb_func_end sub_02051334

	thumb_func_start sub_02051370
sub_02051370: ; 0x02051370
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #4]
	add r7, r1, #0
	add r6, r2, #0
	str r3, [sp, #8]
	bl sub_0205064C
	str r0, [sp, #0xc]
	cmp r6, #0
	beq _02051398
	cmp r7, r6
	beq _02051398
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02051394
	mov r4, #0x13
	b _020513AC
_02051394:
	mov r4, #0x4b
	b _020513AC
_02051398:
	cmp r7, r6
	bne _020513A0
	mov r4, #3
	b _020513AC
_020513A0:
	ldr r0, [sp, #0x28]
	mov r4, #1
	cmp r0, #0
	beq _020513AC
	lsl r0, r4, #0xb
	orr r4, r0
_020513AC:
	mov r0, #0xb
	add r1, r4, #0
	bl sub_020518D8
	ldr r1, [sp, #0xc]
	add r5, r0, #0
	bl sub_02051F00
	str r7, [r5, #0x1c]
	ldr r0, [sp, #8]
	str r6, [r5, #0x24]
	str r0, [r5, #0x20]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x30]
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl EnemyTrainerSet_Init
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	mov r1, #9
	bl GameStats_Inc
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _020513FE
	mov r0, #8
	tst r0, r4
	beq _020513F2
	ldr r0, _02051420 ; =0x000001CE
	mov r1, #0
	strb r1, [r5, r0]
	b _020513FE
_020513F2:
	mov r0, #2
	tst r0, r4
	bne _020513FE
	ldr r0, _02051424 ; =0x000001CD
	mov r1, #0
	strb r1, [r5, r0]
_020513FE:
	add r0, r5, #0
	bl sub_020517E8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020517FC
	add r3, r0, #0
	ldr r0, [sp, #0x34]
	add r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r2, r4, #0
	bl sub_0205085C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02051420: .word 0x000001CE
_02051424: .word 0x000001CD
	thumb_func_end sub_02051370

	thumb_func_start sub_02051428
sub_02051428: ; 0x02051428
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r7, r0, #0
	add r4, r1, #0
	bl sub_0205064C
	add r6, r0, #0
	mov r0, #0xb
	add r1, r5, #0
	bl sub_020518D8
	add r5, r0, #0
	add r1, r6, #0
	add r2, r4, #0
	bl sub_020522F0
	add r0, r5, #0
	bl sub_020517E8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020517FC
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _02051470 ; =sub_020508B8
	add r0, r7, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02051470: .word sub_020508B8
	thumb_func_end sub_02051428

	thumb_func_start sub_02051474
sub_02051474: ; 0x02051474
	push {r4, lr}
	add r4, r1, #0
	bl sub_02029264
	mov r1, #8
	tst r1, r4
	beq _02051486
	mov r4, #0xe
	b _02051492
_02051486:
	mov r1, #2
	tst r1, r4
	beq _02051490
	mov r4, #7
	b _02051492
_02051490:
	mov r4, #0
_02051492:
	cmp r0, #0xff
	beq _0205149E
	bl ov03_02256B40
	add r0, r0, #1
	add r4, r4, r0
_0205149E:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02051474

	thumb_func_start sub_020514A4
sub_020514A4: ; 0x020514A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r7, r1, #0
	str r2, [sp, #4]
	add r4, r3, #0
	bl sub_0205064C
	add r6, r0, #0
	cmp r4, #0
	bne _020514C8
	mov r0, #0xb
	mov r1, #5
	bl sub_020518D8
	add r4, r0, #0
	mov r5, #0
	b _020514F6
_020514C8:
	cmp r4, #1
	bne _020514DA
	mov r0, #0xb
	mov r1, #7
	bl sub_020518D8
	add r4, r0, #0
	mov r5, #7
	b _020514F6
_020514DA:
	mov r0, #0xb
	mov r1, #0x8f
	bl sub_020518D8
	add r4, r0, #0
	mov r1, #1
	str r1, [r4, #0x1c]
	mov r1, #2
	str r1, [r4, #0x24]
	ldr r1, [r6, #0xc]
	mov r2, #0xb
	bl EnemyTrainerSet_Init
	mov r5, #0xe
_020514F6:
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02051F2C
	ldr r0, [r6, #0xc]
	mov r1, #0xb
	add r2, sp, #8
	bl sub_0202FBF0
	ldr r0, _02051538 ; =0x000001B2
	strb r5, [r4, r0]
	add r0, r4, #0
	bl sub_020517E8
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r0, [sp]
	ldr r1, _0205153C ; =sub_02050960
	str r7, [r2, #0xc]
	bl sub_02050530
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02051538: .word 0x000001B2
_0205153C: .word sub_02050960
	thumb_func_end sub_020514A4

	thumb_func_start sub_02051540
sub_02051540: ; 0x02051540
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02051566
	cmp r0, #1
	beq _02051578
	b _0205158E
_02051566:
	ldr r1, _02051594 ; =sub_020508B8
	add r0, r5, #0
	add r2, r7, #0
	bl sub_02050530
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205158E
_02051578:
	bl sub_0202FC48
	cmp r0, #1
	bne _02051584
	bl sub_0202FC24
_02051584:
	add r0, r6, #0
	bl sub_02058190
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205158E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02051594: .word sub_020508B8
	thumb_func_end sub_02051540

	thumb_func_start sub_02051598
sub_02051598: ; 0x02051598
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	add r1, r7, #0
	bl sub_020518D8
	add r1, r5, #0
	add r2, r6, #0
	add r4, r0, #0
	bl sub_020522F0
	ldr r0, [r5, #0xc]
	mov r1, #0xb
	add r2, sp, #0
	bl sub_0202FBF0
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	add r1, r7, #0
	bl sub_02051474
	ldr r1, _020515F4 ; =0x000001B2
	strb r0, [r4, r1]
	add r0, r4, #0
	bl sub_020517E8
	add r6, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _020515F8 ; =sub_02051540
	add r0, r5, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020515F4: .word 0x000001B2
_020515F8: .word sub_02051540
	thumb_func_end sub_02051598

	thumb_func_start sub_020515FC
sub_020515FC: ; 0x020515FC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	add r1, r7, #0
	bl sub_020518D8
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	add r4, r0, #0
	bl sub_020520B0
	ldr r0, [r5, #0xc]
	mov r1, #0xb
	add r2, sp, #0
	bl sub_0202FBF0
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	add r1, r7, #0
	bl sub_02051474
	ldr r1, _02051658 ; =0x000001B2
	strb r0, [r4, r1]
	add r0, r4, #0
	bl sub_020517E8
	add r6, r0, #0
	add r0, r4, #0
	bl sub_020517FC
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_020506BC
	add r2, r0, #0
	ldr r1, _0205165C ; =sub_02051540
	add r0, r5, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02051658: .word 0x000001B2
_0205165C: .word sub_02051540
	thumb_func_end sub_020515FC

	thumb_func_start sub_02051660
sub_02051660: ; 0x02051660
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r1]
	mov r3, #4
	ldr r2, [r1, #0x14]
	tst r3, r0
	bne _02051734
	mov r3, #0x80
	add r5, r0, #0
	tst r5, r3
	bne _02051734
	cmp r0, #0
	beq _02051684
	add r3, #0x80
	cmp r0, r3
	beq _02051684
	cmp r0, #0x4a
	bne _020516D0
_02051684:
	cmp r2, #1
	bne _02051696
	ldr r0, [r4, #0xc]
	bl Sav2_GameStats_get
	mov r1, #9
	bl GameStats_AddSpecial
	pop {r3, r4, r5, pc}
_02051696:
	cmp r2, #4
	bne _02051734
	ldr r0, [r1, #8]
	mov r1, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	mov r0, #0
	bl sub_02074930
	cmp r0, #0
	ldr r0, [r4, #0xc]
	beq _020516C4
	bl Sav2_GameStats_get
	mov r1, #0xa
	bl GameStats_AddSpecial
	pop {r3, r4, r5, pc}
_020516C4:
	bl Sav2_GameStats_get
	mov r1, #0xb
	bl GameStats_AddSpecial
	pop {r3, r4, r5, pc}
_020516D0:
	mov r3, #1
	tst r3, r0
	bne _020516DC
	mov r3, #0x10
	tst r3, r0
	beq _020516EE
_020516DC:
	cmp r2, #1
	bne _02051734
	ldr r0, [r4, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0xc
	bl GameStats_AddSpecial
	pop {r3, r4, r5, pc}
_020516EE:
	mov r3, #0x20
	add r5, r0, #0
	tst r5, r3
	bne _020516FC
	lsl r3, r3, #4
	tst r0, r3
	beq _02051734
_020516FC:
	cmp r2, #4
	bne _02051734
	ldr r0, [r1, #8]
	mov r1, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	mov r0, #0
	bl sub_02074930
	cmp r0, #0
	ldr r0, [r4, #0xc]
	beq _0205172A
	bl Sav2_GameStats_get
	mov r1, #0xa
	bl GameStats_AddSpecial
	pop {r3, r4, r5, pc}
_0205172A:
	bl Sav2_GameStats_get
	mov r1, #0xb
	bl GameStats_AddSpecial
_02051734:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02051660

	thumb_func_start sub_02051738
sub_02051738: ; 0x02051738
	push {r4, lr}
	add r2, r0, #0
	ldr r4, [r2]
	mov r0, #1
	tst r0, r4
	beq _02051788
	add r2, #0x5d
	ldrb r0, [r2]
	bl sub_02051868
	mov r1, #0x80
	tst r1, r4
	beq _02051764
	cmp r0, #0x27
	beq _020517A0
	mov r0, #2
	tst r0, r4
	beq _02051760
	mov r0, #0x25
	pop {r4, pc}
_02051760:
	mov r0, #0x23
	pop {r4, pc}
_02051764:
	cmp r0, #0x1d
	blo _0205176C
	cmp r0, #0x22
	bls _020517A0
_0205176C:
	cmp r0, #0x2b
	beq _020517A0
	cmp r0, #0x2c
	beq _020517A0
	mov r1, #2
	tst r1, r4
	beq _0205177E
	mov r0, #0x25
	pop {r4, pc}
_0205177E:
	mov r1, #4
	tst r1, r4
	beq _020517A0
	mov r0, #0x24
	pop {r4, pc}
_02051788:
	mov r1, #0x56
	lsl r1, r1, #2
	ldr r0, [r2, #8]
	ldr r1, [r2, r1]
	bl sub_02051894
	cmp r0, #0x2a
	blo _020517A0
	mov r1, #2
	tst r1, r4
	beq _020517A0
	mov r0, #0x26
_020517A0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02051738
