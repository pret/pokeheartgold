	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0203B91C
sub_0203B91C: ; 0x0203B91C
	mov r0, #0x80
	bx lr
	thumb_func_end sub_0203B91C

	thumb_func_start sub_0203B920
sub_0203B920: ; 0x0203B920
	mov r0, #5
	lsl r0, r0, #0xa
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B920

	thumb_func_start sub_0203B928
sub_0203B928: ; 0x0203B928
	ldr r3, _0203B934 ; =MIi_CpuClear32
	mov r2, #5
	add r1, r0, #0
	mov r0, #0
	lsl r2, r2, #0xa
	bx r3
	.balign 4, 0
_0203B934: .word MIi_CpuClear32
	thumb_func_end sub_0203B928

	thumb_func_start sub_0203B938
sub_0203B938: ; 0x0203B938
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x80
	bl memset
	add r0, r4, #0
	add r0, #0x6c
	bl sub_0205C7BC
	bl sub_0203BA70
	add r4, #0x68
	strh r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B938

	thumb_func_start sub_0203B958
sub_0203B958: ; 0x0203B958
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B958

	thumb_func_start sub_0203B95C
sub_0203B95C: ; 0x0203B95C
	add r0, #0x14
	bx lr
	thumb_func_end sub_0203B95C

	thumb_func_start sub_0203B960
sub_0203B960: ; 0x0203B960
	add r0, #0x28
	bx lr
	thumb_func_end sub_0203B960

	thumb_func_start sub_0203B964
sub_0203B964: ; 0x0203B964
	add r0, #0x50
	bx lr
	thumb_func_end sub_0203B964

	thumb_func_start sub_0203B968
sub_0203B968: ; 0x0203B968
	add r0, #0x3c
	bx lr
	thumb_func_end sub_0203B968

	thumb_func_start sub_0203B96C
sub_0203B96C: ; 0x0203B96C
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x3c
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0203B96C

	thumb_func_start sub_0203B980
sub_0203B980: ; 0x0203B980
	add r0, #0x64
	bx lr
	thumb_func_end sub_0203B980

	thumb_func_start sub_0203B984
sub_0203B984: ; 0x0203B984
	add r0, #0x66
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B984

	thumb_func_start sub_0203B98C
sub_0203B98C: ; 0x0203B98C
	add r0, #0x66
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B98C

	thumb_func_start sub_0203B994
sub_0203B994: ; 0x0203B994
	add r0, #0x68
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B994

	thumb_func_start sub_0203B99C
sub_0203B99C: ; 0x0203B99C
	add r0, #0x68
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B99C

	thumb_func_start sub_0203B9A4
sub_0203B9A4: ; 0x0203B9A4
	add r0, #0x6a
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B9A4

	thumb_func_start sub_0203B9AC
sub_0203B9AC: ; 0x0203B9AC
	add r0, #0x6a
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B9AC

	thumb_func_start sub_0203B9B4
sub_0203B9B4: ; 0x0203B9B4
	add r0, #0x6c
	bx lr
	thumb_func_end sub_0203B9B4

	thumb_func_start sub_0203B9B8
sub_0203B9B8: ; 0x0203B9B8
	add r0, #0x78
	bx lr
	thumb_func_end sub_0203B9B8

	thumb_func_start sub_0203B9BC
sub_0203B9BC: ; 0x0203B9BC
	add r0, #0x76
	bx lr
	thumb_func_end sub_0203B9BC

	thumb_func_start sub_0203B9C0
sub_0203B9C0: ; 0x0203B9C0
	add r0, #0x74
	bx lr
	thumb_func_end sub_0203B9C0

	thumb_func_start sub_0203B9C4
sub_0203B9C4: ; 0x0203B9C4
	ldr r3, _0203B9CC ; =SavArray_get
	mov r1, #5
	bx r3
	nop
_0203B9CC: .word SavArray_get
	thumb_func_end sub_0203B9C4

	thumb_func_start sub_0203B9D0
sub_0203B9D0: ; 0x0203B9D0
	ldr r3, _0203B9D8 ; =SavArray_get
	mov r1, #0xa
	bx r3
	nop
_0203B9D8: .word SavArray_get
	thumb_func_end sub_0203B9D0

	thumb_func_start sub_0203B9DC
sub_0203B9DC: ; 0x0203B9DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0203B9D0
	add r2, r0, #0
	ldr r1, [r4, #0x3c]
	add r0, r4, #0
	mov r3, #0x40
	bl sub_0205E5EC
	pop {r4, pc}
	thumb_func_end sub_0203B9DC

	thumb_func_start sub_0203B9F4
sub_0203B9F4: ; 0x0203B9F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203B9D0
	ldr r2, _0203BA54 ; =0x000003CF
	mov r1, #0x40
	add r7, r0, #0
	bl sub_0205FD00
	add r4, r0, #0
	beq _0203BA48
	ldrb r0, [r4, #8]
	cmp r0, #0xfd
	bne _0203BA48
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl sub_02054388
	str r0, [sp]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	ldr r0, [sp]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0x7b
	lsl r1, r1, #2
	cmp r6, r1
	beq _0203BA40
	bl GF_AssertFail
	b _0203BA48
_0203BA40:
	cmp r0, #0
	bne _0203BA48
	ldr r0, _0203BA58 ; =0x000003CE
	strh r0, [r4, #0x12]
_0203BA48:
	ldr r0, [r5, #0x3c]
	add r1, r7, #0
	mov r2, #0x40
	bl sub_0205E648
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203BA54: .word 0x000003CF
_0203BA58: .word 0x000003CE
	thumb_func_end sub_0203B9F4
