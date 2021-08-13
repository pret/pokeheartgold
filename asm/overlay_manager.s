	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start OverlayManager_new
OverlayManager_new: ; 0x0200724C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #0x28
	bl AllocFromHeap
	add r3, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0
	str r0, [r3, #0x10]
	str r0, [r3, #0x14]
	str r4, [r3, #0x18]
	str r0, [r3, #0x1c]
	str r0, [r3, #0x20]
	str r0, [r3, #0x24]
	add r0, r3, #0
	pop {r3, r4, r5, pc}
	thumb_func_end OverlayManager_new

	thumb_func_start OverlayManager_delete
OverlayManager_delete: ; 0x02007278
	ldr r3, _0200727C ; =FreeToHeap
	bx r3
	.balign 4, 0
_0200727C: .word FreeToHeap
	thumb_func_end OverlayManager_delete

	thumb_func_start sub_02007280
sub_02007280: ; 0x02007280
	push {r4, lr}
	add r4, r0, #0
	add r0, r2, #0
	bl AllocFromHeap
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02007280

	thumb_func_start sub_02007290
sub_02007290: ; 0x02007290
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end sub_02007290

	thumb_func_start sub_02007294
sub_02007294: ; 0x02007294
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end sub_02007294

	thumb_func_start sub_020072A4
sub_020072A4: ; 0x020072A4
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end sub_020072A4

	thumb_func_start OverlayManager_run
OverlayManager_run: ; 0x020072A8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	cmp r1, #3
	bhi _02007326
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020072BE: ; jump table
	.short _020072C6 - _020072BE - 2 ; case 0
	.short _020072DA - _020072BE - 2 ; case 1
	.short _020072F2 - _020072BE - 2 ; case 2
	.short _02007308 - _020072BE - 2 ; case 3
_020072C6:
	mov r1, #0
	ldr r0, [r4, #0xc]
	mvn r1, r1
	cmp r0, r1
	beq _020072D6
	mov r1, #2
	bl HandleLoadOverlay
_020072D6:
	mov r0, #1
	str r0, [r4, #0x10]
_020072DA:
	add r1, r4, #0
	ldr r2, [r4]
	add r0, r4, #0
	add r1, #0x14
	blx r2
	cmp r0, #1
	bne _02007326
	mov r0, #2
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02007326
_020072F2:
	add r1, r4, #0
	ldr r2, [r4, #4]
	add r1, #0x14
	blx r2
	cmp r0, #1
	bne _02007326
	mov r0, #3
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02007326
_02007308:
	add r1, r4, #0
	ldr r2, [r4, #8]
	add r1, #0x14
	blx r2
	cmp r0, #1
	bne _02007326
	mov r1, #0
	ldr r0, [r4, #0xc]
	mvn r1, r1
	cmp r0, r1
	beq _02007322
	bl UnloadOverlayByID
_02007322:
	mov r0, #1
	pop {r4, pc}
_02007326:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end OverlayManager_run
