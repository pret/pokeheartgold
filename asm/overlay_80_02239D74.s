	.include "asm/macros.inc"
	.include "overlay_80_02239D74.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02239D74
ov80_02239D74: ; 0x02239D74
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x65
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl ov80_02239DD0
	str r0, [r4]
	add r0, r6, #0
	bl ov80_02239F48
	str r0, [r4, #4]
	mov r0, #9
	str r0, [sp]
	ldr r0, _02239DB4 ; =0x04000050
	mov r1, #4
	mov r2, #0x1f
	mov r3, #8
	bl G2x_SetBlendAlpha_
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02239DB4: .word 0x04000050
	thumb_func_end ov80_02239D74

	thumb_func_start ov80_02239DB8
ov80_02239DB8: ; 0x02239DB8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov80_02239EC4
	ldr r0, [r4, #4]
	bl ov80_02239F94
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_02239DB8

	thumb_func_start ov80_02239DD0
ov80_02239DD0: ; 0x02239DD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r1, _02239EAC ; =0x0002200C
	add r4, r0, #0
	mov r0, #0x65
	bl AllocFromHeap
	ldr r2, _02239EAC ; =0x0002200C
	str r0, [sp, #8]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #8]
	mov r1, #0x65
	str r4, [r0, #4]
	mov r0, #0xb7
	bl NARC_New
	ldr r5, [sp, #8]
	ldr r4, _02239EB0 ; =ov80_0223DB2C
	str r0, [sp, #4]
	mov r6, #0
	add r5, #8
_02239DFE:
	mov r0, #0x65
	str r0, [sp]
	ldrh r1, [r4]
	ldr r0, [sp, #4]
	mov r2, #1
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	mov r2, #1
	add r0, #0xc
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl MIi_CpuCopy32
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	lsl r0, r0, #0xc
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, r0
	cmp r6, #2
	blt _02239DFE
	ldr r0, [sp, #4]
	bl NARC_Delete
	mov r0, #0xb7
	mov r1, #0x65
	bl NARC_New
	mov r1, #0x65
	str r1, [sp]
	mov r1, #0xe
	mov r2, #1
	add r3, sp, #0xc
	add r4, r0, #0
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r3, [sp, #0xc]
	add r5, r0, #0
	ldr r2, _02239EB4 ; =0x00002008
	ldr r1, [sp, #8]
	ldr r0, [r3, #0x14]
	add r1, r1, r2
	ldr r2, [r3, #0x10]
	bl MIi_CpuCopy32
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0x65
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #1
	add r3, sp, #0xc
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r3, [sp, #0xc]
	add r5, r0, #0
	ldr r2, _02239EB8 ; =0x00012008
	ldr r1, [sp, #8]
	ldr r0, [r3, #0x14]
	add r1, r1, r2
	ldr r2, [r3, #0x10]
	bl MIi_CpuCopy32
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, _02239EBC ; =ov80_02239ED8
	ldr r1, [sp, #8]
	ldr r2, _02239EC0 ; =0x0001368C
	bl CreateSysTask
	ldr r1, [sp, #8]
	str r0, [r1]
	add r0, r1, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02239EAC: .word 0x0002200C
_02239EB0: .word ov80_0223DB2C
_02239EB4: .word 0x00002008
_02239EB8: .word 0x00012008
_02239EBC: .word ov80_02239ED8
_02239EC0: .word 0x0001368C
	thumb_func_end ov80_02239DD0

	thumb_func_start ov80_02239EC4
ov80_02239EC4: ; 0x02239EC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239EC4

	thumb_func_start ov80_02239ED8
ov80_02239ED8: ; 0x02239ED8
	push {r3, r4, lr}
	sub sp, #4
	ldr r3, _02239F3C ; =0x00022008
	add r4, r1, #0
	ldrb r0, [r4, r3]
	cmp r0, #0xc
	bhs _02239EEE
	add r0, r0, #1
	add sp, #4
	strb r0, [r4, r3]
	pop {r3, r4, pc}
_02239EEE:
	mov r0, #0
	strb r0, [r4, r3]
	str r0, [sp]
	add r3, r3, #1
	ldrb r3, [r4, r3]
	ldr r2, _02239F40 ; =0x00002008
	ldr r0, [r4, #4]
	add r2, r4, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	mov r3, #1
	mov r1, #3
	lsl r3, r3, #0x10
	bl BG_LoadCharTilesData
	ldr r2, _02239F44 ; =0x00022009
	add r3, r4, #0
	ldrb r2, [r4, r2]
	add r3, #8
	ldr r0, [r4, #4]
	lsl r2, r2, #0xc
	add r2, r3, r2
	mov r3, #1
	mov r1, #3
	lsl r3, r3, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, _02239F44 ; =0x00022009
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r0, r2
	strb r0, [r4, r1]
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239F3C: .word 0x00022008
_02239F40: .word 0x00002008
_02239F44: .word 0x00022009
	thumb_func_end ov80_02239ED8

	thumb_func_start ov80_02239F48
ov80_02239F48: ; 0x02239F48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x65
	mov r1, #0x6c
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x6c
	bl MI_CpuFill8
	add r0, r4, #0
	str r5, [r4, #4]
	mov r1, #2
	add r0, #0x68
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	add r1, r4, #0
	add r0, #0xa0
	add r1, #8
	mov r2, #0x60
	bl MIi_CpuCopy16
	ldr r0, _02239F8C ; =ov80_02239FA8
	ldr r2, _02239F90 ; =0x0001368D
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239F8C: .word ov80_02239FA8
_02239F90: .word 0x0001368D
	thumb_func_end ov80_02239F48

	thumb_func_start ov80_02239F94
ov80_02239F94: ; 0x02239F94
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239F94

	thumb_func_start ov80_02239FA8
ov80_02239FA8: ; 0x02239FA8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	cmp r0, #8
	bhs _02239FC8
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	add r4, #0x69
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02239FC8:
	add r0, r4, #0
	mov r2, #0
	add r0, #0x69
	strb r2, [r0]
	mov r0, #0x20
	str r0, [sp]
	add r1, #0x68
	ldrb r1, [r1]
	add r3, r4, #0
	ldr r0, [r4, #4]
	add r3, #8
	lsl r1, r1, #5
	add r1, r3, r1
	mov r3, #0x60
	bl PaletteData_LoadPalette
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x68
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	cmp r0, #3
	blo _0223A006
	mov r0, #0
	add r4, #0x68
	strb r0, [r4]
_0223A006:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239FA8

    .rodata

ov80_0223DB2C: ; 0x0223DB2C
	.byte 0x14, 0x00, 0x15, 0x00
