	.include "asm/macros.inc"
	.include "overlay_100.inc"
	.include "global.inc"

	.extern ov100_021E69F8
	.extern ov100_021E6A3C
	.extern ov100_021E6AC0
	.extern ov100_021E6C44
	.extern ov100_021E6F88
	.extern ov100_021E6FBC
	.extern ov100_021E5A88
	.extern ov100_021E5B4C
	.extern ov100_021E5BB0

	.text

	thumb_func_start ov100_021E616C
ov100_021E616C: ; 0x021E616C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ov100_021E6914
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldrb r3, [r5, #8]
	ldr r0, [r5]
	mov r1, #0xb
	mov r2, #1
	bl ov100_021E69F8
	add r1, r5, #0
	add r1, #0x94
	mov r4, #0
	str r0, [r1]
	add r6, r5, #0
	add r7, r4, #0
_021E6196:
	str r7, [sp]
	lsl r0, r4, #0x18
	str r7, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r4, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0x40
	str r7, [sp, #0x10]
	add r0, #0x94
	ldr r0, [r0]
	add r2, r1, #0
	add r3, r7, #0
	bl ov100_021E6AC0
	add r1, r6, #0
	add r1, #0x98
	add r4, r4, #1
	add r6, r6, #4
	str r0, [r1]
	cmp r4, #4
	blt _021E6196
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0xad
	mov r2, #0x30
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x46
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xac
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x56
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb0
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x6e
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb4
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x7e
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x62
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xbc
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0xc5
	mov r2, #0x30
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r5, #0
	mov r1, #1
	bl ov100_021E5BB0
	add r0, r5, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #1
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	ldr r0, [r5, #0x20]
	ldrh r0, [r0, #0x10]
	bl MapHeader_GetField14_1D
	cmp r0, #0
	bne _021E62F4
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #1
	bl UnkImageStruct_SetSpriteAnimCtrlCurrentFrame
_021E62F4:
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_021E62FA:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r7, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r1, #1
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	ble _021E62FA
	mov r4, #4
	add r5, #0x10
	mov r6, #1
_021E6320:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r6, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _021E6320
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E616C

	thumb_func_start ov100_021E6338
ov100_021E6338: ; 0x021E6338
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	add r5, r7, #0
	add r6, r4, #0
_021E6342:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r6, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	bl ov100_021E6C44
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _021E6342
	add r0, r7, #0
	add r0, #0x94
	ldr r0, [r0]
	bl ov100_021E6A3C
	add r0, r7, #0
	bl ov100_021E6950
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6338

	thumb_func_start ov100_021E6374
ov100_021E6374: ; 0x021E6374
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl ov100_021E6F88
	str r0, [r4, #0x7c]
	ldrb r0, [r4, #5]
	ldr r1, _021E63EC ; =_021E7720
	lsl r0, r0, #0x19
	lsr r2, r0, #0x19
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	lsl r3, r2, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	ldr r1, [r1, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	ldr r3, _021E63F0 ; =_021E74A0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldrb r2, [r3, r2]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x7c]
	bl ov100_021E7014
	ldrb r0, [r4, #4]
	cmp r0, #4
	bne _021E63D8
	ldr r0, [r4, #0x7c]
	mov r1, #0
	mov r2, #2
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
_021E63D8:
	add r0, r4, #0
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_021E63EC: .word _021E7720
_021E63F0: .word _021E74A0
	thumb_func_end ov100_021E6374

	thumb_func_start ov100_021E63F4
ov100_021E63F4: ; 0x021E63F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl ov100_021E70A4
	ldr r0, [r4, #0x7c]
	bl ov100_021E6FBC
	pop {r4, pc}
	thumb_func_end ov100_021E63F4

	thumb_func_start ov100_021E6408
ov100_021E6408: ; 0x021E6408
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E6428
	bl OverlayManager_Run
	cmp r0, #0
	beq _021E6428
	ldr r0, [r4]
	bl OverlayManager_Delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E6428:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov100_021E6408

	.rodata

_021E74A0:
	.byte 0x03, 0x04, 0x04, 0x05

	.global ov100_021E74A4
ov100_021E74A4: ; 0x021E74A4
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000

	.global ov100_021E74B4
ov100_021E74B4: ; 0x021E74B4
	.byte 0x00, 0xFF, 0xFF, 0x01
	.byte 0x00, 0xFF, 0x01, 0x02
	.byte 0x00, 0x01, 0xFF, 0x02
	.byte 0x00, 0x01, 0x02, 0x03

	.global ov100_021E74C4
ov100_021E74C4: ; 0x021E74C4
	.byte 0xA0, 0xC0, 0x08, 0x38
	.byte 0xA0, 0xC0, 0x38, 0x68
	.byte 0xA0, 0xC0, 0x68, 0x98
	.byte 0xA0, 0xC0, 0x98, 0xC8
	.byte 0xA0, 0xC0, 0xCE, 0xFE
	.byte 0xFF, 0x00, 0x00, 0x00

ov100_021E74DC:
	.byte 0x00, 0x00, 0x02, 0x01
	.byte 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0xB0, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

	.global ov100_021E7500
ov100_021E7500: ; 0x021E7500
	.word 0x00000001
	.word 0x00000000
	.word 0x00000004
	.word 0x00000000
	.word 0x00000010
	.word 0x00000000
	.word 0x00000100
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000

ov100_021E7528:
	.byte 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x80, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E7558:
	.byte 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

	.global ov100_021E7588
ov100_021E7588: ; 0x021E7588
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000

ov100_021E75C0:
	.byte 0x00, 0x00, 0x04, 0x01, 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02
	.byte 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0x80, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x02, 0x04, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x04, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

	.data

_021E7720:
	.word ov100_021E74DC
	.word ov100_021E7528
	.word ov100_021E7558
	.word ov100_021E75C0
	; 0x021E7730
