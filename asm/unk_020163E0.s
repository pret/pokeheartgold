	.include "asm/macros.inc"
	.include "unk_020163E0.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020163E0
sub_020163E0: ; 0x020163E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	ldr r0, _02016488 ; =sub_020164D0
	mov r1, #0x50
	mov r2, #0
	bl CreateSysTaskAndEnvironment
	str r0, [sp, #4]
	bl sub_0201F988
	add r4, r0, #0
	cmp r5, #0
	beq _02016424
	cmp r6, #0
	bne _02016414
	add r0, r5, #0
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	str r0, [sp]
	ldr r0, _0201648C ; =sub_020165D4
	str r0, [r4, #4]
	b _0201643E
_02016414:
	add r0, r5, #0
	mov r1, #1
	bl PaletteData_GetUnfadedBuf
	str r0, [sp]
	ldr r0, _02016490 ; =sub_020165F0
	str r0, [r4, #4]
	b _0201643E
_02016424:
	cmp r6, #0
	bne _02016434
	bl sub_02026E84
	str r0, [sp]
	ldr r0, _02016494 ; =sub_020165A4
	str r0, [r4, #4]
	b _0201643E
_02016434:
	bl sub_02026E94
	str r0, [sp]
	ldr r0, _02016498 ; =sub_020165BC
	str r0, [r4, #4]
_0201643E:
	ldr r1, [sp]
	lsl r0, r7, #5
	str r0, [sp, #8]
	add r0, r1, r0
	add r1, r4, #0
	add r1, #0xc
	mov r2, #0x20
	bl MIi_CpuCopy16
	ldr r1, [sp]
	ldr r0, [sp, #8]
	mov r2, #0x20
	add r0, r1, r0
	add r1, r4, #0
	add r1, #0x2c
	bl MIi_CpuCopy16
	ldr r0, [sp, #4]
	mov r1, #1
	str r0, [r4]
	add r0, r4, #0
	str r5, [r4, #8]
	add r0, #0x4c
	strb r6, [r0]
	add r0, r4, #0
	add r0, #0x4d
	strb r7, [r0]
	add r0, r4, #0
	add r0, #0x4e
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02016488: .word sub_020164D0
_0201648C: .word sub_020165D4
_02016490: .word sub_020165F0
_02016494: .word sub_020165A4
_02016498: .word sub_020165BC
	thumb_func_end sub_020163E0

	thumb_func_start sub_0201649C
sub_0201649C: ; 0x0201649C
	cmp r1, #0
	beq _020164AA
	cmp r1, #1
	beq _020164B2
	cmp r1, #2
	beq _020164BA
	bx lr
_020164AA:
	mov r1, #0
	add r0, #0x4e
	strb r1, [r0]
	bx lr
_020164B2:
	mov r1, #2
	add r0, #0x4e
	strb r1, [r0]
	bx lr
_020164BA:
	mov r1, #3
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201649C

	thumb_func_start sub_020164C4
sub_020164C4: ; 0x020164C4
	ldr r3, _020164CC ; =DestroySysTaskAndEnvironment
	ldr r0, [r0]
	bx r3
	nop
_020164CC: .word DestroySysTaskAndEnvironment
	thumb_func_end sub_020164C4

	thumb_func_start sub_020164D0
sub_020164D0: ; 0x020164D0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #3
	bhi _02016546
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020164EC: ; jump table
	.short _020164F4 - _020164EC - 2 ; case 0
	.short _02016504 - _020164EC - 2 ; case 1
	.short _02016546 - _020164EC - 2 ; case 2
	.short _02016538 - _020164EC - 2 ; case 3
_020164F4:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	mov r0, #1
	add r4, #0x4e
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02016504:
	add r0, r4, #0
	bl sub_02016548
	cmp r0, #1
	bne _02016518
	add r1, r4, #0
	ldr r2, [r4, #4]
	add r0, r4, #0
	add r1, #0x2c
	blx r2
_02016518:
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _02016546
	mov r0, #0
	add r4, #0x4f
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02016538:
	ldr r2, [r4, #4]
	add r0, r4, #0
	add r1, #0xc
	blx r2
	add r0, r5, #0
	bl DestroySysTaskAndEnvironment
_02016546:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020164D0

	thumb_func_start sub_02016548
sub_02016548: ; 0x02016548
	push {r4, r5}
	add r1, r0, #0
	add r1, #0x4f
	ldrb r1, [r1]
	cmp r1, #0
	bne _02016576
	mov r1, #0x1e
	mov r4, #0
	mov r3, #1
	lsl r1, r1, #0xa
_0201655C:
	add r2, r3, #0
	lsl r2, r4
	tst r2, r1
	beq _02016568
	ldrh r2, [r0, #0xc]
	strh r2, [r0, #0x2c]
_02016568:
	add r4, r4, #1
	add r0, r0, #2
	cmp r4, #0x10
	blo _0201655C
	mov r0, #1
	pop {r4, r5}
	bx lr
_02016576:
	cmp r1, #0x18
	bne _0201659E
	mov r1, #0x1e
	mov r5, #0
	add r4, r0, #0
	mov r3, #1
	lsl r1, r1, #0xa
_02016584:
	add r2, r3, #0
	lsl r2, r5
	tst r2, r1
	beq _02016590
	ldrh r2, [r0, #0x2a]
	strh r2, [r4, #0x2c]
_02016590:
	add r5, r5, #1
	add r4, r4, #2
	cmp r5, #0x10
	blo _02016584
	mov r0, #1
	pop {r4, r5}
	bx lr
_0201659E:
	mov r0, #0
	pop {r4, r5}
	bx lr
	thumb_func_end sub_02016548

	thumb_func_start sub_020165A4
sub_020165A4: ; 0x020165A4
	push {r3, lr}
	add r3, r0, #0
	add r3, #0x4d
	ldrb r3, [r3]
	mov r0, #0
	mov r2, #0x20
	lsl r3, r3, #0x15
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020165A4

	thumb_func_start sub_020165BC
sub_020165BC: ; 0x020165BC
	push {r3, lr}
	add r3, r0, #0
	add r3, #0x4d
	ldrb r3, [r3]
	mov r0, #4
	mov r2, #0x20
	lsl r3, r3, #0x15
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020165BC

	thumb_func_start sub_020165D4
sub_020165D4: ; 0x020165D4
	push {r3, lr}
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r3, #8]
	add r3, #0x4d
	ldrb r3, [r3]
	mov r2, #0
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020165D4

	thumb_func_start sub_020165F0
sub_020165F0: ; 0x020165F0
	push {r3, lr}
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r3, #8]
	add r3, #0x4d
	ldrb r3, [r3]
	mov r2, #1
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020165F0
