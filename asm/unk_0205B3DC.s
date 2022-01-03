	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FCA24:
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x01, 0x06, 0x07, 0x00
	.byte 0x02, 0x03, 0x04, 0x05
	.byte 0x03, 0x00, 0x05, 0x06
	.byte 0x04, 0x01, 0x02, 0x07
	.byte 0x05, 0x02, 0x07, 0x00
	.byte 0x06, 0x03, 0x04, 0x01
	.byte 0x07, 0x04, 0x05, 0x06
_020FCA44:
	.byte 0x03, 0x3C, 0x3C
	.byte 0x05, 0x06, 0x06
	.byte 0x0B, 0x18, 0x18
	.byte 0x1F, 0x39, 0x39
	.byte 0x32, 0x30, 0x30
	.byte 0x33, 0x0E, 0x0E
	.byte 0x3E, 0x20, 0x20
	.byte 0x46, 0x31, 0x31

	.byte 0x06, 0x03, 0x03
	.byte 0x07, 0x0A, 0x0A
	.byte 0x0D, 0x24, 0x24
	.byte 0x0E, 0x19, 0x19
	.byte 0x23, 0x55, 0x55
	.byte 0x25, 0x23, 0x23
	.byte 0x2A, 0x12, 0x12
	.byte 0x3F, 0x21, 0x21

	.text

	thumb_func_start sub_0205B3DC
sub_0205B3DC: ; 0x0205B3DC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	lsl r0, r0, #0x1d
	ldr r2, _0205B410 ; =_020FCA24
	lsr r0, r0, #0x1b
	add r5, r2, r0
	lsl r2, r1, #3
	lsl r1, r2, #1
	ldr r0, _0205B414 ; =_020FCA44
	add r1, r2, r1
	mov r4, #0
	add r6, r0, r1
_0205B3F4:
	ldrb r3, [r5]
	add r0, r7, #0
	add r1, r4, #0
	lsl r2, r3, #1
	add r2, r3, r2
	add r2, r6, r2
	ldrb r2, [r2, #1]
	bl BufferTrainerClassName
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #4
	blt _0205B3F4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205B410: .word _020FCA24
_0205B414: .word _020FCA44
	thumb_func_end sub_0205B3DC

	thumb_func_start sub_0205B418
sub_0205B418: ; 0x0205B418
	lsl r0, r0, #0x1d
	lsr r3, r0, #0x1b
	ldr r0, _0205B430 ; =_020FCA24
	add r0, r0, r3
	ldrb r2, [r2, r0]
	lsl r0, r1, #3
	add r1, r2, r0
	lsl r0, r1, #1
	add r1, r1, r0
	ldr r0, _0205B434 ; =_020FCA44
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0205B430: .word _020FCA24
_0205B434: .word _020FCA44
	thumb_func_end sub_0205B418

	thumb_func_start sub_0205B438
sub_0205B438: ; 0x0205B438
	push {r3, r4}
	lsl r4, r0, #3
	lsl r0, r4, #1
	ldr r2, _0205B460 ; =_020FCA44
	add r0, r4, r0
	mov r3, #0
	add r2, r2, r0
_0205B446:
	ldrb r0, [r2]
	cmp r1, r0
	bne _0205B452
	add r0, r3, r4
	pop {r3, r4}
	bx lr
_0205B452:
	add r3, r3, #1
	add r2, r2, #3
	cmp r3, #8
	blt _0205B446
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0205B460: .word _020FCA44
	thumb_func_end sub_0205B438

	thumb_func_start sub_0205B464
sub_0205B464: ; 0x0205B464
	ldr r3, _0205B468 ; =sub_0205B438
	bx r3
	.balign 4, 0
_0205B468: .word sub_0205B438
	thumb_func_end sub_0205B464

	thumb_func_start sub_0205B46C
sub_0205B46C: ; 0x0205B46C
	push {r4, lr}
	add r4, r2, #0
	bl sub_0205B438
	cmp r4, #0
	beq _0205B49A
	cmp r4, #1
	beq _0205B48A
	cmp r4, #2
	bne _0205B494
	lsl r1, r0, #1
	add r1, r0, r1
	ldr r0, _0205B49C ; =_020FCA44 + 1
	ldrb r0, [r0, r1]
	pop {r4, pc}
_0205B48A:
	lsl r1, r0, #1
	add r1, r0, r1
	ldr r0, _0205B4A0 ; =_020FCA44 + 2
	ldrb r0, [r0, r1]
	pop {r4, pc}
_0205B494:
	bl GF_AssertFail
	mov r0, #0
_0205B49A:
	pop {r4, pc}
	.balign 4, 0
_0205B49C: .word _020FCA44 + 1
_0205B4A0: .word _020FCA44 + 2
	thumb_func_end sub_0205B46C

	thumb_func_start sub_0205B4A4
sub_0205B4A4: ; 0x0205B4A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x54
	mov r1, #0xb
	add r2, sp, #0
	add r3, r5, #0
	bl GfGfxLoader_GetPlttData
	mov r1, #9
	add r4, r0, #0
	add r0, r5, #0
	lsl r1, r1, #6
	bl AllocFromHeap
	add r5, r0, #0
	ldr r0, [sp]
	mov r2, #0
	ldr r3, [r0, #0xc]
	mov r0, #1
	add r6, r5, #0
	lsl r0, r0, #8
_0205B4D0:
	ldrh r1, [r3]
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r6]
	add r6, r6, #2
	cmp r2, r0
	blt _0205B4D0
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205B4A4
