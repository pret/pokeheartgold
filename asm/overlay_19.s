	.include "asm/macros.inc"
	.include "overlay_19.inc"
	.include "global.inc"

	.text

	thumb_func_start ov19_02259E20
ov19_02259E20: ; 0x02259E20
	push {r3, r4, r5, lr}
	mov r2, #0x73
	lsl r2, r2, #2
	strb r1, [r0, r2]
	sub r2, #0xc
	add r5, r0, r2
	lsl r4, r1, #2
	ldr r2, _02259E40 ; =_0225A03C
	ldr r0, [r5, r4]
	ldrb r1, [r2, r1]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r4]
	bl Sprite_ResetAnimCtrlState
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02259E40: .word _0225A03C
	thumb_func_end ov19_02259E20

	thumb_func_start ov19_02259E44
ov19_02259E44: ; 0x02259E44
	push {r3, lr}
	mov r1, #0x73
	lsl r1, r1, #2
	ldrb r2, [r0, r1]
	sub r1, #0xc
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r0, [r0, r1]
	bl Sprite_IsCellAnimationRunning
	cmp r0, #0
	bne _02259E60
	mov r0, #1
	pop {r3, pc}
_02259E60:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov19_02259E44

	thumb_func_start ov19_02259E64
ov19_02259E64: ; 0x02259E64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [sp, #0x20]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl BufferPlayersName
	ldrh r0, [r5, #0x32]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_02068F98
	mov r0, #0
	str r0, [sp]
	mov r3, #2
	add r0, r4, #0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #4]
	bl BufferString
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x18
	bl CopyU16ArrayToString
	mov r0, #0
	mov r1, #2
	str r0, [sp]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #4]
	bl BufferString
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	add r0, r4, #0
	lsr r2, r2, #0x18
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	mov r2, #0x7d
	lsl r2, r2, #4
	add r2, r3, r2
	mov r1, #3
	mov r3, #4
	bl BufferIntegerAsString
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	add r0, r4, #0
	lsr r2, r2, #0x10
	lsl r2, r2, #0x18
	mov r1, #4
	lsr r2, r2, #0x18
	bl BufferIntegerAsString
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	add r0, r4, #0
	lsr r2, r2, #8
	lsl r2, r2, #0x18
	mov r1, #5
	lsr r2, r2, #0x18
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov19_02259E64

	thumb_func_start ov19_02259F0C
ov19_02259F0C: ; 0x02259F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r5, #0
	add r7, r0, #0
	str r5, [sp, #0x10]
_02259F16:
	ldr r0, [sp, #0x10]
	mov r4, #0
	add r0, r0, #2
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_02259F20:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, r4, r5
	add r3, r4, #0
	str r0, [sp, #8]
	mov r0, #0
	add r2, r2, #1
	add r3, #0xd
	str r0, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r7, #0x18]
	mov r1, #7
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r4, r4, #1
	cmp r4, #5
	blt _02259F20
	ldr r0, [sp, #0x10]
	add r5, r5, #5
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _02259F16
	ldr r0, [r7, #0x18]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov19_02259F0C

	thumb_func_start ov19_02259F64
ov19_02259F64: ; 0x02259F64
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #0x30]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	mov r5, #0x40
	sub r3, r5, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A000 ; =0x00010500
	lsr r3, r3, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x30]
	add r0, #0x3c
	mov r1, #4
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	add r0, #0x3c
	bl ScheduleWindowCopyToVram
	ldr r0, [r4, #0x10]
	str r0, [sp]
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	ldr r3, [r4]
	bl ov19_02259E64
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov19_0225A008
	cmp r0, #1
	ldr r0, [r4, #0x28]
	bls _02259FCC
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x38]
	bl StringExpandPlaceholders
	b _02259FD4
_02259FCC:
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x34]
	bl StringExpandPlaceholders
_02259FD4:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A004 ; =0x00030200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x2c]
	add r0, #0x4c
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	add r0, #0x4c
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl ov19_02259F0C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225A000: .word 0x00010500
_0225A004: .word 0x00030200
	thumb_func_end ov19_02259F64

	thumb_func_start ov19_0225A008
ov19_0225A008: ; 0x0225A008
	push {r3, r4}
	mov r1, #0
	ldr r3, _0225A038 ; =0x000001ED
	add r2, r1, #0
_0225A010:
	lsl r4, r2, #2
	add r4, r0, r4
	add r4, #0x6c
	ldrh r4, [r4]
	cmp r4, #0
	ble _0225A026
	cmp r4, r3
	bgt _0225A026
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
_0225A026:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r2, #6
	blo _0225A010
	add r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_0225A038: .word 0x000001ED
	thumb_func_end ov19_0225A008

	.rodata

_0225A03C:
	.byte 0x09, 0x01, 0x04, 0x00

	.global ov19_0225A040
ov19_0225A040: ; 0x0225A040
	.byte 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x00

	.global ov19_0225A04E
ov19_0225A04E: ; 0x0225A04E
	.byte 0x05, 0x18
	.byte 0x15, 0x08, 0x02, 0x01, 0xF0, 0x01, 0x05, 0x01, 0x08, 0x1C, 0x08, 0x0A, 0x10, 0x01

	.global ov19_0225A05E
ov19_0225A05E: ; 0x0225A05E
	.byte 0xA2, 0xBC, 0xC2, 0xFE
	.byte 0x18, 0x38, 0x50, 0x60
	.byte 0x18, 0x38, 0xA0, 0xB0
	.byte 0xFF, 0x00, 0x00, 0x00

	.balign 4, 0
	.global ov19_0225A070
ov19_0225A070: ; 0x0225A070
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov19_0225A08C
ov19_0225A08C: ; 0x0225A08C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov19_0225A0A8
ov19_0225A0A8: ; 0x0225A0A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0D, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.global ov19_0225A0C4
ov19_0225A0C4: ; 0x0225A0C4
	.byte 0x01, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x28, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
