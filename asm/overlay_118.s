	.include "asm/macros.inc"
	.include "overlay_118.inc"
	.include "global.inc"

	.text

	thumb_func_start ov118_0225F020
ov118_0225F020: ; 0x0225F020
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #8
	bls _0225F032
	b _0225F218
_0225F032:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F03E: ; jump table
	.short _0225F050 - _0225F03E - 2 ; case 0
	.short _0225F12C - _0225F03E - 2 ; case 1
	.short _0225F144 - _0225F03E - 2 ; case 2
	.short _0225F150 - _0225F03E - 2 ; case 3
	.short _0225F17E - _0225F03E - 2 ; case 4
	.short _0225F18E - _0225F03E - 2 ; case 5
	.short _0225F1CC - _0225F03E - 2 ; case 6
	.short _0225F1EA - _0225F03E - 2 ; case 7
	.short _0225F1FA - _0225F03E - 2 ; case 8
_0225F050:
	mov r0, #4
	mov r1, #0x20
	bl Heap_Alloc
	mov r1, #0
	mov r2, #0x20
	str r0, [r4, #0xc]
	bl memset
	mov r0, #2
	mov r1, #1
	ldr r5, [r4, #0xc]
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225F264 ; =0xFFFFE0FF
	and r1, r0
	mov r0, #0x15
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	ldr r2, _0225F268 ; =_0225F270
	ldr r0, [r0, #8]
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #8]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	ldr r2, _0225F26C ; =ov118_0225F28C
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	mov r1, #0xa8
	ldr r0, [r0, #8]
	mov r2, #0xa7
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #3
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x20]
	mov r3, #0xa6
	bl ov01_021F0500
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #8
	mov r1, #0
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl BG_SetMaskColor
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	mov r2, #0
	mov r3, #0x80
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x10]
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r0, #8]
	mov r2, #0
	add r3, #0xfd
	bl BgSetPosTextAndCommit
	mov r0, #0x15
	bl GfGfx_EngineASetPlanes
	mov r0, #1
	str r0, [r4]
	b _0225F218
_0225F12C:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r1, r0, #0
	sub r1, #0x11
	add r2, r1, #0
	add r3, r4, #4
	bl ov01_021EFCF8
	mov r0, #2
	str r0, [r4]
	b _0225F218
_0225F144:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225F218
	mov r0, #3
	str r0, [r4]
	b _0225F218
_0225F150:
	mov r0, #0x12
	mov r1, #2
	mov r3, #5
	str r0, [sp]
	add r0, r5, #0
	lsl r1, r1, #0x12
	mov r2, #0
	lsl r3, r3, #0xc
	bl ov01_021EFEC8
	mov r0, #2
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #1
	str r0, [r5, #0x1c]
	mov r0, #4
	str r0, [r4]
	b _0225F218
_0225F17E:
	add r0, r5, #0
	bl ov01_021EFF28
	cmp r0, #0
	beq _0225F218
	mov r0, #5
	str r0, [r4]
	b _0225F218
_0225F18E:
	ldr r0, [r4, #0x10]
	mov r2, #0
	ldr r0, [r0, #8]
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #8]
	mov r2, #0
	lsl r3, r1, #7
	bl BgSetPosTextAndCommit
	mov r1, #0
	str r1, [r5, #0x1c]
	ldr r2, [r5, #0x18]
	add r0, r2, #1
	str r0, [r5, #0x18]
	cmp r2, #5
	bls _0225F218
	mov r0, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #1
	str r0, [r5, #0x1c]
	mov r0, #0
	str r0, [r5, #0x18]
	mov r0, #6
	str r0, [r4]
	b _0225F218
_0225F1CC:
	mov r0, #0x12
	mov r2, #2
	mov r3, #5
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0x12
	lsl r3, r3, #0xc
	bl ov01_021EFEC8
	mov r0, #1
	str r0, [r5, #0x1c]
	mov r0, #7
	str r0, [r4]
	b _0225F218
_0225F1EA:
	add r0, r5, #0
	bl ov01_021EFF28
	cmp r0, #0
	beq _0225F218
	mov r0, #8
	str r0, [r4]
	b _0225F218
_0225F1FA:
	mov r0, #0
	str r0, [r5, #0x1c]
	bl sub_0200FC20
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225F20C
	mov r0, #1
	str r0, [r1]
_0225F20C:
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_021EFCDC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_0225F218:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0225F25E
	ldr r0, [r4, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #8]
	mov r1, #1
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	ldr r3, [r5]
	mov r1, #3
	asr r5, r3, #0xc
	lsl r3, r1, #7
	ldr r0, [r0, #8]
	mov r2, #0
	sub r3, r3, r5
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #8]
	add r2, r1, #0
	mov r3, #0
	bl ScheduleSetBgPosText
_0225F25E:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0225F264: .word 0xFFFFE0FF
_0225F268: .word _0225F270
_0225F26C: .word ov118_0225F28C
	thumb_func_end ov118_0225F020

	.rodata

_0225F270:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov118_0225F28C: ; 0x0225F28C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x0225F2A8
