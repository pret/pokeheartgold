	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020292A8
sub_020292A8: ; 0x020292A8
	mov r0, #0x1e
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020292A8

	thumb_func_start sub_020292B0
sub_020292B0: ; 0x020292B0
	push {r4, lr}
	mov r2, #0x1e
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	add r0, r4, #0
	bl ZeroBoxMonData
	add r0, r4, #0
	add r0, #0xec
	bl ZeroBoxMonData
	mov r0, #0x76
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020292B0

	thumb_func_start sub_020292DC
sub_020292DC: ; 0x020292DC
	mov r2, #0xec
	mul r2, r1
	add r0, r0, r2
	bx lr
	thumb_func_end sub_020292DC

	thumb_func_start sub_020292E4
sub_020292E4: ; 0x020292E4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020292E4

	thumb_func_start sub_020292E8
sub_020292E8: ; 0x020292E8
	add r0, #0x88
	bx lr
	thumb_func_end sub_020292E8

	thumb_func_start sub_020292EC
sub_020292EC: ; 0x020292EC
	add r0, #0xe8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020292EC

	thumb_func_start sub_020292F4
sub_020292F4: ; 0x020292F4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020292F4

	thumb_func_start sub_020292F8
sub_020292F8: ; 0x020292F8
	mov r1, #0x76
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02029306
	mov r0, #1
	bx lr
_02029306:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020292F8

	thumb_func_start sub_0202930C
sub_0202930C: ; 0x0202930C
	mov r1, #0x76
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_0202930C

	thumb_func_start sub_02029314
sub_02029314: ; 0x02029314
	mov r1, #0x77
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end sub_02029314

	thumb_func_start sub_0202931C
sub_0202931C: ; 0x0202931C
	add r0, #0xe8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202931C

	thumb_func_start sub_02029324
sub_02029324: ; 0x02029324
	add r2, r0, #0
	add r2, #0xe8
	ldr r2, [r2]
	add r0, #0xe8
	add r1, r2, r1
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02029324

	thumb_func_start sub_02029334
sub_02029334: ; 0x02029334
	mov r2, #0x76
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end sub_02029334

	thumb_func_start sub_0202933C
sub_0202933C: ; 0x0202933C
	mov r2, #0x77
	lsl r2, r2, #2
	strb r1, [r0, r2]
	bx lr
	thumb_func_end sub_0202933C

	thumb_func_start sub_02029344
sub_02029344: ; 0x02029344
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0xc
	mov r2, #0
	bl GetBoxMonData
	add r5, #0xec
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl GetBoxMonData
	cmp r4, r0
	beq _02029366
	mov r0, #1
	pop {r3, r4, r5, pc}
_02029366:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02029344

	thumb_func_start sub_0202936C
sub_0202936C: ; 0x0202936C
	push {r3, r4}
	add r4, r0, #0
	add r3, r1, #0
	mov r2, #0x1d
_02029374:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _02029374
	ldr r0, [r3]
	str r0, [r4]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202936C

	thumb_func_start sub_02029384
sub_02029384: ; 0x02029384
	push {r3, r4}
	mov r1, #0
	add r2, r0, #0
	add r4, r1, #0
_0202938C:
	add r1, r1, #1
	strh r4, [r2, #0x38]
	add r2, r2, #2
	cmp r1, #8
	blt _0202938C
	add r3, r0, #0
	mov r2, #0
_0202939A:
	add r1, r3, #0
	add r1, #0x48
	add r4, r4, #1
	add r3, r3, #2
	strh r2, [r1]
	cmp r4, #0xb
	blt _0202939A
	ldr r1, _020293B4 ; =0x0000FFFF
	strh r1, [r0, #0x38]
	add r0, #0x48
	strh r1, [r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_020293B4: .word 0x0000FFFF
	thumb_func_end sub_02029384

	thumb_func_start sub_020293B8
sub_020293B8: ; 0x020293B8
	push {r4, lr}
	add r4, r0, #0
	bl ZeroBoxMonData
	add r0, r4, #0
	mov r1, #0
	add r0, #0xe8
	add r4, #0x88
	str r1, [r0]
	add r0, r4, #0
	bl sub_02029384
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020293B8

	thumb_func_start sub_020293D4
sub_020293D4: ; 0x020293D4
	ldr r3, _020293DC ; =SavArray_get
	mov r1, #7
	bx r3
	nop
_020293DC: .word SavArray_get
	thumb_func_end sub_020293D4
