	.include "asm/macros.inc"
	.include "overlay_80_02238648.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02238648
ov80_02238648: ; 0x02238648
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_02096808
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl Save_PlayerData_GetProfileAddr
	add r7, r0, #0
	mov r0, #0
	add r4, #0x20
	add r1, r0, #0
	ldrb r5, [r4]
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _02238828 ; =0xFFFFE0FF
	and r0, r2
	str r0, [r1]
	ldr r0, _0223882C ; =0x04001000
	ldr r3, [r0]
	and r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _02238830 ; =0xFFFF1FFF
	and r3, r2
	str r3, [r1]
	ldr r3, [r0]
	add r1, #0x50
	and r2, r3
	str r2, [r0]
	mov r2, #0
	strh r2, [r1]
	add r0, #0x50
	strh r2, [r0]
	ldr r2, _02238834 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r2, #9
	mov r0, #3
	mov r1, #0x65
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r0, #0x65
	mov r1, #0xc4
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	str r6, [r4, #8]
	add r0, #0xc1
	ldr r1, _02238838 ; =0x0000FFFF
	strb r5, [r0]
	mov r2, #0
	add r3, r4, #0
_022386D4:
	add r0, r3, #0
	add r0, #0x70
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r0]
	cmp r2, #8
	blt _022386D4
	mov r0, #0x65
	bl ov80_022392DC
	str r0, [r4, #0xc]
	mov r0, #0x65
	bl PaletteData_Init
	str r0, [r4, #4]
	mov r1, #1
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r4, #4]
	lsl r2, r1, #9
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r2, #7
	ldr r0, [r4, #4]
	mov r1, #2
	lsl r2, r2, #6
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r2, #2
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r0, #0x65
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0x40
	mov r1, #0x65
	bl GF_CreateVramTransferManager
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, [r4]
	add r1, r5, #0
	bl ov80_02238CD8
	add r0, r4, #0
	bl ov80_02238F10
	add r0, r4, #0
	bl ov80_02238FA0
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r4, #0
	bl ov80_02239384
	mov r0, #0x65
	bl ov80_02239960
	str r0, [r4, #0x10]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r7, #0
	bl ov80_02239004
	ldr r0, _0223883C ; =ov80_02238AB0
	ldr r2, _02238840 ; =0x0000EA60
	add r1, r4, #0
	bl CreateSysTask
	add r1, r4, #0
	add r1, #0x94
	str r0, [r1]
	ldr r0, _02238844 ; =ov80_02238ABC
	ldr r2, _02238848 ; =0x0000EE48
	add r1, r4, #0
	bl CreateSysTask
	add r1, r4, #0
	add r1, #0x98
	str r0, [r1]
	ldr r0, _0223884C ; =ov80_02238AC8
	ldr r2, _02238850 ; =0x00013880
	add r1, r4, #0
	bl CreateSysTask
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	mov r1, #3
	bl ov80_0222ACA0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02004AC8
	add r0, r5, #0
	mov r1, #3
	bl ov80_0222ACA0
	add r1, r0, #0
	lsl r1, r1, #0x10
	mov r0, #0
	lsr r1, r1, #0x10
	bl sub_02055198
	mov r0, #1
	bl sub_02002B50
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	ldr r0, _02238854 ; =ov80_02238A7C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r0, _02238858 ; =ov80_02238AAC
	add r1, r4, #0
	mov r2, #0xa
	bl sub_0200E33C
	add r1, r4, #0
	add r1, #0xa0
	str r0, [r1]
	add r2, r4, #0
	add r2, #0xc1
	add r1, r4, #0
	ldrb r2, [r2]
	add r0, r4, #0
	add r1, #0x90
	bl ov80_0222AD9C
	bl sub_0203A880
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238828: .word 0xFFFFE0FF
_0223882C: .word 0x04001000
_02238830: .word 0xFFFF1FFF
_02238834: .word 0x04000304
_02238838: .word 0x0000FFFF
_0223883C: .word ov80_02238AB0
_02238840: .word 0x0000EA60
_02238844: .word ov80_02238ABC
_02238848: .word 0x0000EE48
_0223884C: .word ov80_02238AC8
_02238850: .word 0x00013880
_02238854: .word ov80_02238A7C
_02238858: .word ov80_02238AAC
	thumb_func_end ov80_02238648

	thumb_func_start ov80_0223885C
ov80_0223885C: ; 0x0223885C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02096808
	add r2, r4, #0
	add r2, #0xc1
	add r1, r4, #0
	ldrb r2, [r2]
	add r0, r4, #0
	add r1, #0x90
	bl ov80_0222ADB4
	add r0, r4, #0
	bl ov80_0223927C
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl ov80_022393E8
	ldr r0, [r4, #0x10]
	bl ov80_02239980
	bl GF_DestroyVramTransferManager
	ldr r0, [r4, #4]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	mov r1, #3
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	bl PaletteData_Free
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl DestroySysTask
	ldr r0, [r4, #0xc]
	bl ov80_0223937C
	bl sub_02021238
	add r0, r4, #0
	bl FreeToHeap
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022389A4 ; =0xFFFF1FFF
	and r1, r0
	str r1, [r2]
	ldr r2, _022389A8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0x65
	bl DestroyHeap
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	bl sub_0203A914
	mov r1, #5
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	lsl r1, r1, #0x18
	lsl r2, r2, #8
	bl MIi_CpuClear16
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	ldr r1, _022389B0 ; =0x05000200
	lsl r2, r2, #8
	bl MIi_CpuClear16
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	ldr r1, _022389B4 ; =0x05000400
	lsl r2, r2, #8
	bl MIi_CpuClear16
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	ldr r1, _022389B8 ; =0x05000600
	lsl r2, r2, #8
	bl MIi_CpuClear16
	ldr r0, _022389BC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _022389C0 ; =0x04001050
	strh r1, [r0]
	pop {r4, pc}
	nop
_022389A4: .word 0xFFFF1FFF
_022389A8: .word 0x04001000
_022389AC: .word 0x00007FFF
_022389B0: .word 0x05000200
_022389B4: .word 0x05000400
_022389B8: .word 0x05000600
_022389BC: .word 0x04000050
_022389C0: .word 0x04001050
	thumb_func_end ov80_0223885C

	thumb_func_start ov80_022389C4
ov80_022389C4: ; 0x022389C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r5, #0
	mov r7, #6
_022389CC:
	ldr r0, [r6, #8]
	add r1, r5, #0
	bl sub_0209686C
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02238A0A
	add r1, r7, #0
	bl ov42_02228188
	strb r0, [r4, #0x12]
	ldr r0, [r4]
	mov r1, #5
	bl ov42_02228188
	strh r0, [r4, #0xa]
	ldr r0, [r4]
	mov r1, #0
	bl ov42_02228188
	strh r0, [r4, #0xe]
	ldr r0, [r4]
	mov r1, #1
	bl ov42_02228188
	strh r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl ov42_022291F4
	strb r0, [r4, #0x13]
_02238A0A:
	add r5, r5, #1
	cmp r5, #0x20
	blt _022389CC
	add r0, r6, #0
	bl ov80_02239740
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022389C4

	thumb_func_start ov80_02238A18
ov80_02238A18: ; 0x02238A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_02096864
	ldr r7, _02238A78 ; =0x0000FFFF
	add r4, r0, #0
	mov r6, #0
_02238A2A:
	ldrh r1, [r4]
	cmp r1, r7
	beq _02238A3A
	ldrb r2, [r4, #2]
	ldr r0, [r5, #0x20]
	mov r3, #0x65
	bl ov42_02228FE0
_02238A3A:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x18
	blt _02238A2A
	ldr r7, _02238A78 ; =0x0000FFFF
	mov r4, #0
	add r6, sp, #0
_02238A48:
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl sub_0209686C
	ldrh r1, [r0, #0xc]
	cmp r1, r7
	beq _02238A66
	add r1, r6, #0
	bl ov80_02239900
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov80_02239510
_02238A66:
	add r4, r4, #1
	cmp r4, #0x20
	blt _02238A48
	add r0, r5, #0
	bl ov80_02239828
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238A78: .word 0x0000FFFF
	thumb_func_end ov80_02238A18

	thumb_func_start ov80_02238A7C
ov80_02238A7C: ; 0x02238A7C
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r0, [r4, #4]
	bl sub_0200398C
	ldr r0, [r4]
	bl DoScheduledBgGpuUpdates
	ldr r3, _02238AA4 ; =0x027E0000
	ldr r1, _02238AA8 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02238AA4: .word 0x027E0000
_02238AA8: .word 0x00003FF8
	thumb_func_end ov80_02238A7C

	thumb_func_start ov80_02238AAC
ov80_02238AAC: ; 0x02238AAC
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02238AAC

	thumb_func_start ov80_02238AB0
ov80_02238AB0: ; 0x02238AB0
	ldr r3, _02238AB8 ; =ov42_0222807C
	ldr r0, [r1, #0x14]
	bx r3
	nop
_02238AB8: .word ov42_0222807C
	thumb_func_end ov80_02238AB0

	thumb_func_start ov80_02238ABC
ov80_02238ABC: ; 0x02238ABC
	ldr r3, _02238AC4 ; =ov80_02238C78
	add r0, r1, #0
	bx r3
	nop
_02238AC4: .word ov80_02238C78
	thumb_func_end ov80_02238ABC

	thumb_func_start ov80_02238AC8
ov80_02238AC8: ; 0x02238AC8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r0, [r7, #8]
	mov r1, #0x1f
	bl sub_0209686C
	ldr r1, [r0]
	cmp r1, #0
	beq _02238AE2
	add r0, r7, #0
	add r0, #0x1c
	bl ov42_02229358
_02238AE2:
	add r0, r7, #0
	bl ov80_02238B28
	ldr r0, [r7, #0x20]
	bl ov42_022290DC
	ldr r4, [r7, #0x6c]
	mov r6, #0
	add r5, r7, #0
_02238AF4:
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	beq _02238B04
	mov r1, #1
	tst r1, r4
	beq _02238B04
	bl sub_0200DC18
_02238B04:
	add r6, r6, #1
	lsr r4, r4, #1
	add r5, r5, #4
	cmp r6, #8
	blt _02238AF4
	ldr r0, [r7, #0x38]
	bl sub_0200D020
	bl sub_0200D03C
	bl ov80_02239A38
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02238AC8

	thumb_func_start ov80_02238B28
ov80_02238B28: ; 0x02238B28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_02096808
	add r4, r0, #0
	add r0, #0x20
	ldrb r0, [r0]
	mov r1, #0xc
	bl ov80_0222ACA0
	cmp r0, #0
	beq _02238B46
	cmp r0, #1
	beq _02238B74
_02238B46:
	ldr r0, [r5, #0x24]
	cmp r0, #0
	beq _02238B54
	add r1, r5, #0
	add r1, #0x1c
	bl ov42_02229420
_02238B54:
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _02238B7A
	add r4, #0x20
	ldrb r0, [r4]
	mov r1, #0xd
	bl ov80_0222ACA0
	cmp r0, #1
	bne _02238B7A
	ldr r0, [r5, #0x28]
	add r5, #0x1c
	add r1, r5, #0
	bl ov42_02229420
	pop {r3, r4, r5, pc}
_02238B74:
	add r0, r5, #0
	bl ov80_02238B7C
_02238B7A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02238B28

	thumb_func_start ov80_02238B7C
ov80_02238B7C: ; 0x02238B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_02096808
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x1c
	bl ov42_022293A8
	mov r1, #0xaa
	ldrsh r1, [r5, r1]
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r0, r5, #0
	add r0, #0x1c
	bl ov42_022293B0
	mov r1, #0xa8
	ldrsh r1, [r5, r1]
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	cmp r4, #0
	ble _02238BC6
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #4]
	b _02238BD6
_02238BC6:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #4]
_02238BD6:
	cmp r6, #0
	ble _02238BEE
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp]
	b _02238BFE
_02238BEE:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp]
_02238BFE:
	ldr r0, [r5, #0x34]
	bl sub_0200CF6C
	str r0, [sp, #8]
	ldr r0, [sp]
	bl _ffix
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl _ffix
	add r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl G2dRenderer_SetMainSurfaceCoords
	ldr r0, [r5]
	mov r1, #3
	mov r2, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r5]
	add r2, r1, #0
	add r3, r4, #0
	bl ScheduleSetBgPosText
	add r0, r7, #0
	add r0, #0x20
	ldrb r0, [r0]
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02238C74 ; =0x0000FFFF
	cmp r0, r1
	beq _02238C6E
	add r7, #0x20
	ldrb r0, [r7]
	mov r1, #0xd
	bl ov80_0222ACA0
	cmp r0, #1
	bne _02238C6E
	ldr r0, [r5]
	mov r1, #2
	mov r2, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5]
	mov r1, #2
	mov r2, #3
	add r3, r4, #0
	bl ScheduleSetBgPosText
_02238C6E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238C74: .word 0x0000FFFF
	thumb_func_end ov80_02238B7C

	thumb_func_start ov80_02238C78
ov80_02238C78: ; 0x02238C78
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r1, sp, #0
	bl ov42_02229A08
	cmp r0, #1
	bne _02238CA0
	add r4, sp, #0
_02238C8C:
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl ov42_02228068
	ldr r0, [r5, #0x30]
	add r1, r4, #0
	bl ov42_02229A08
	cmp r0, #1
	beq _02238C8C
_02238CA0:
	ldr r0, [r5, #0x2c]
	add r1, sp, #8
	bl ov42_02229AC8
	cmp r0, #1
	bne _02238CD4
	add r6, sp, #0
	add r4, sp, #8
_02238CB0:
	ldr r0, [r5, #0x18]
	ldr r1, [r5, #0x14]
	add r2, r4, #0
	add r3, r6, #0
	bl ov42_02228C80
	cmp r0, #1
	bne _02238CC8
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	bl ov42_02228068
_02238CC8:
	ldr r0, [r5, #0x2c]
	add r1, r4, #0
	bl ov42_02229AC8
	cmp r0, #1
	beq _02238CB0
_02238CD4:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov80_02238C78

	thumb_func_start ov80_02238CD8
ov80_02238CD8: ; 0x02238CD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa8
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #0
	bl ov80_0222ACA0
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r6, _02238EF8 ; =ov80_0223D5D8
	add r3, sp, #0x2c
	mov r2, #5
_02238CF4:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02238CF4
	add r0, sp, #0x2c
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	ldr r6, _02238EFC ; =ov80_0223D560
	add r3, sp, #0x1c
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	str r4, [sp, #0x20]
	bl SetBothScreensModesAndDisable
	ldr r6, _02238F00 ; =ov80_0223D600
	add r3, sp, #0x54
	mov r2, #0xa
_02238D56:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02238D56
	ldr r0, [r6]
	cmp r4, #0
	str r0, [r3]
	bne _02238D74
	mov r2, #0
	add r1, sp, #0x74
	strb r2, [r1, #0xd]
	add r0, sp, #0x94
	strb r2, [r0, #9]
	strb r2, [r1, #0x10]
	strb r2, [r0, #0xc]
_02238D74:
	add r0, r7, #0
	mov r1, #4
	bl ov80_0222ACA0
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, sp, #0x94
	strb r6, [r0, #8]
	add r0, r7, #0
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02238F04 ; =0x0000FFFF
	cmp r0, r1
	beq _02238D96
	add r0, sp, #0x74
	strb r6, [r0, #0xc]
_02238D96:
	cmp r4, #0
	add r2, sp, #0x54
	bne _02238E20
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	add r2, sp, #0x70
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #3
	add r2, sp, #0x8c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r1, #3
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	b _02238EA2
_02238E20:
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r1, #2
	add r0, r5, #0
	add r2, sp, #0x70
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #3
	add r2, sp, #0x8c
	mov r3, #2
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r1, #3
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
_02238EA2:
	ldr r1, _02238F08 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r4, _02238F0C ; =ov80_0223D59C
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #4
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #4
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add sp, #0xa8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238EF8: .word ov80_0223D5D8
_02238EFC: .word ov80_0223D560
_02238F00: .word ov80_0223D600
_02238F04: .word 0x0000FFFF
_02238F08: .word 0x04000008
_02238F0C: .word ov80_0223D59C
	thumb_func_end ov80_02238CD8

	thumb_func_start ov80_02238F10
ov80_02238F10: ; 0x02238F10
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0x10
	mov r2, #7
	mov r3, #0x65
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x65
	bl PaletteData_LoadNarc
	ldr r0, [r4, #8]
	bl sub_02096808
	ldr r0, [r0, #4]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x65
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02238F98 ; =0x000003E2
	mov r1, #1
	mov r3, #0xb
	bl LoadUserFrameGfx2
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #0xb0
	mov r3, #0x20
	bl sub_020032A4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x65
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02238F9C ; =0x000003D9
	mov r1, #1
	mov r3, #0xc
	bl LoadUserFrameGfx1
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #0xc0
	mov r3, #0x20
	bl sub_020032A4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02238F98: .word 0x000003E2
_02238F9C: .word 0x000003D9
	thumb_func_end ov80_02238F10

	thumb_func_start ov80_02238FA0
ov80_02238FA0: ; 0x02238FA0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0xb7
	mov r1, #0x65
	bl NARC_New
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #0x65
	str r1, [sp, #0xc]
	ldr r2, [r5]
	mov r1, #0x81
	mov r3, #4
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x82
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	mov r1, #0xb7
	mov r2, #0xbe
	mov r3, #0x65
	bl PaletteData_LoadNarc
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02238FA0

	thumb_func_start ov80_02239004
ov80_02239004: ; 0x02239004
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0x65
	add r6, r2, #0
	bl ov42_02228010
	str r0, [r5, #0x14]
	mov r0, #0x10
	add r1, r0, #0
	mov r2, #0x65
	bl ov42_02227EE0
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0x1c
	bl ov42_02229394
	ldr r0, [r5, #0x38]
	bl sub_0200E2B0
	add r7, r0, #0
	add r0, r6, #0
	bl ov80_0222A7EC
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x65
	str r0, [sp, #8]
	ldr r1, [r5, #4]
	add r0, r7, #0
	mov r2, #0x20
	bl ov42_02228F24
	ldr r3, _02239270 ; =ov80_0223D554
	str r0, [r5, #0x20]
	add r2, sp, #0x20
	mov r1, #0xb
_0223905A:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0223905A
	add r0, r4, #0
	mov r1, #5
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x10]
	add r0, r4, #0
	mov r1, #6
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x11]
	add r0, r4, #0
	mov r1, #0xc
	bl ov80_0222ACA0
	add r6, r0, #0
	bne _0223909C
	ldr r0, [r5, #0x34]
	bl sub_0200CF6C
	ldr r1, [r5]
	add r2, sp, #0x20
	mov r3, #0x65
	bl ov42_022293B8
	str r0, [r5, #0x24]
_0223909C:
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02239274 ; =0x0000FFFF
	cmp r0, r1
	beq _022390DA
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x11]
	mov r0, #2
	strb r0, [r1, #9]
	mov r2, #1
	mov r0, #8
	strb r2, [r1, #0xb]
	strb r0, [r1, #0xc]
	strb r2, [r1, #0xe]
	cmp r6, #0
	bne _022390DA
	ldr r0, [r5, #0x34]
	bl sub_0200CF6C
	ldr r1, [r5]
	add r2, sp, #0x20
	mov r3, #0x65
	bl ov42_022293B8
	str r0, [r5, #0x28]
_022390DA:
	mov r0, #0x80
	mov r1, #0x65
	bl ov42_02229A40
	str r0, [r5, #0x2c]
	mov r0, #0x80
	mov r1, #0x65
	bl ov42_02229974
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x18]
	ldr r1, _02239278 ; =ov80_0223D654
	bl ov42_02227F48
	add r0, r4, #0
	mov r1, #0
	bl ov80_0222ACA0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #5
	bl ov80_0222ACA0
	mov r1, #0x65
	str r0, [sp, #0x10]
	bl NARC_New
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #7
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	cmp r7, #0
	bne _0223915A
	add r0, r4, #0
	mov r1, #8
	bl ov80_0222ACA0
	add r2, r0, #0
	mov r1, #0
	mov r0, #0x16
	str r1, [sp]
	lsl r0, r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x10]
	mov r3, #0x65
	bl PaletteData_LoadNarc
	b _02239198
_0223915A:
	add r0, r4, #0
	mov r1, #8
	bl ov80_0222ACA0
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #0x1c
	mov r3, #0x65
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x14]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	ldr r0, [sp, #0x1c]
	mov r1, #6
	mov r2, #2
	ldr r0, [r0, #0xc]
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	ldr r0, [sp, #0x14]
	bl FreeToHeap
_02239198:
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	mov r2, #2
	add r3, r1, #0
	bl sub_02003D5C
	add r0, r4, #0
	mov r1, #6
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02239274 ; =0x0000FFFF
	cmp r0, r1
	beq _0223925E
	add r0, r4, #0
	mov r1, #0xa
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	cmp r7, #0
	beq _0223925E
	add r0, r4, #0
	mov r1, #0xb
	bl ov80_0222ACA0
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #0x18
	mov r3, #0x65
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, [sp, #0x18]
	add r4, r0, #0
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	ldr r0, [sp, #0x18]
	mov r1, #1
	lsl r1, r1, #0xe
	ldr r0, [r0, #0xc]
	lsr r2, r1, #1
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	add r0, r4, #0
	bl FreeToHeap
_0223925E:
	ldr r0, [r5]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl NARC_Delete
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02239270: .word ov80_0223D554
_02239274: .word 0x0000FFFF
_02239278: .word ov80_0223D654
	thumb_func_end ov80_02239004

	thumb_func_start ov80_0223927C
ov80_0223927C: ; 0x0223927C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #8]
	bl sub_02096868
	add r5, r0, #0
	mov r4, #0
_0223928A:
	ldr r0, [r5]
	cmp r0, #0
	beq _0223929E
	bl ov42_02228100
	ldr r0, [r5, #0x38]
	cmp r0, #0
	beq _0223929E
	bl GF_AssertFail
_0223929E:
	add r4, r4, #1
	add r5, #0x3c
	cmp r4, #0x20
	blt _0223928A
	ldr r0, [r6, #0x14]
	bl ov42_02228050
	ldr r0, [r6, #0x18]
	bl ov42_02227F28
	ldr r0, [r6, #0x20]
	bl ov42_02228F94
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _022392C2
	bl ov42_0222940C
_022392C2:
	ldr r0, [r6, #0x28]
	cmp r0, #0
	beq _022392CC
	bl ov42_0222940C
_022392CC:
	ldr r0, [r6, #0x2c]
	bl ov42_02229A78
	ldr r0, [r6, #0x30]
	bl ov42_022299AC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0223927C

	thumb_func_start ov80_022392DC
ov80_022392DC: ; 0x022392DC
	push {r3, lr}
	sub sp, #8
	mov r2, #1
	ldr r1, _022392F4 ; =ov80_022392F8
	str r2, [sp]
	str r1, [sp, #4]
	mov r1, #0
	add r3, r1, #0
	bl GF_3DVramMan_Create
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
_022392F4: .word ov80_022392F8
	thumb_func_end ov80_022392DC

	thumb_func_start ov80_022392F8
ov80_022392F8: ; 0x022392F8
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02239364 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02239368 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0223936C ; =0x0000CFFB
	and r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	sub r2, #0x1c
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _02239370 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02239374 ; =0xBFFF0000
	ldr r0, _02239378 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_02239364: .word 0x04000008
_02239368: .word 0xFFFFCFFD
_0223936C: .word 0x0000CFFB
_02239370: .word 0x00007FFF
_02239374: .word 0xBFFF0000
_02239378: .word 0x04000580
	thumb_func_end ov80_022392F8

	thumb_func_start ov80_0223937C
ov80_0223937C: ; 0x0223937C
	ldr r3, _02239380 ; =GF_3DVramMan_Delete
	bx r3
	.balign 4, 0
_02239380: .word GF_3DVramMan_Delete
	thumb_func_end ov80_0223937C

	thumb_func_start ov80_02239384
ov80_02239384: ; 0x02239384
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x65
	bl sub_0200CF18
	ldr r1, _022393D8 ; =ov80_0223D5B8
	ldr r2, _022393DC ; =ov80_0223D570
	mov r3, #0x20
	str r0, [r4, #0x34]
	bl sub_0200CF70
	ldr r1, _022393E0 ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	ldr r0, [r4, #0x34]
	bl sub_0200CF38
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	mov r2, #0x80
	bl sub_0200CFF4
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r2, _022393E4 ; =ov80_0223D584
	bl sub_0200D3F8
	ldr r0, [r4, #0x34]
	bl sub_0200CF6C
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	pop {r4, pc}
	nop
_022393D8: .word ov80_0223D5B8
_022393DC: .word ov80_0223D570
_022393E0: .word 0x00200010
_022393E4: .word ov80_0223D584
	thumb_func_end ov80_02239384

	thumb_func_start ov80_022393E8
ov80_022393E8: ; 0x022393E8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
_022393F0:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _022393FA
	bl ov80_02239BE8
_022393FA:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #8
	blt _022393F0
	ldr r7, _02239474 ; =0x0000FFFF
	mov r6, #0
	add r4, r5, #0
_02239408:
	add r0, r4, #0
	add r0, #0x70
	ldrh r1, [r0]
	cmp r1, r7
	beq _02239418
	ldr r0, [r5, #0x38]
	bl ov80_02239B7C
_02239418:
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, #8
	blt _02239408
	ldr r7, _02239478 ; =0x0000C350
	mov r4, #0
	add r6, r5, #0
_02239426:
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _0223945A
	bl sub_0200D9DC
	ldr r1, _02239478 ; =0x0000C350
	ldr r0, [r5, #0x38]
	add r1, r4, r1
	bl sub_0200D958
	ldr r1, _02239478 ; =0x0000C350
	ldr r0, [r5, #0x38]
	add r1, r4, r1
	bl sub_0200D968
	ldr r1, _02239478 ; =0x0000C350
	ldr r0, [r5, #0x38]
	add r1, r4, r1
	bl sub_0200D978
	ldr r0, [r5, #0x38]
	add r1, r4, r7
	bl sub_0200D988
_0223945A:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #4
	blt _02239426
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D998
	ldr r0, [r5, #0x34]
	bl sub_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239474: .word 0x0000FFFF
_02239478: .word 0x0000C350
	thumb_func_end ov80_022393E8

	thumb_func_start ov80_0223947C
ov80_0223947C: ; 0x0223947C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #8]
	add r5, r1, #0
	bl sub_02096864
	add r7, r0, #0
	ldrh r3, [r5]
	mov r1, #0
	add r2, r7, #0
_02239490:
	ldrh r0, [r2]
	cmp r3, r0
	beq _022394D2
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x18
	blt _02239490
	ldr r0, _022394D4 ; =0x0000FFFF
	mov r4, #0
	add r2, r7, #0
_022394A4:
	ldrh r1, [r2]
	cmp r1, r0
	beq _022394B2
	add r4, r4, #1
	add r2, r2, #4
	cmp r4, #0x18
	blt _022394A4
_022394B2:
	cmp r4, #0x18
	bne _022394BA
	bl GF_AssertFail
_022394BA:
	ldrh r0, [r5]
	lsl r2, r4, #2
	add r1, r7, r2
	strh r0, [r7, r2]
	ldrh r0, [r5, #2]
	mov r3, #0x65
	strh r0, [r1, #2]
	ldrh r1, [r5]
	ldrb r2, [r5, #2]
	ldr r0, [r6, #0x20]
	bl ov42_02228FE0
_022394D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022394D4: .word 0x0000FFFF
	thumb_func_end ov80_0223947C

	thumb_func_start ov80_022394D8
ov80_022394D8: ; 0x022394D8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #8]
	add r5, r1, #0
	bl sub_02096864
	add r7, r0, #0
	mov r4, #0
	add r1, r7, #0
_022394EA:
	ldrh r0, [r1]
	cmp r5, r0
	bne _02239500
	ldr r0, [r6, #0x20]
	add r1, r5, #0
	bl ov42_02229004
	ldr r1, _0223950C ; =0x0000FFFF
	lsl r0, r4, #2
	strh r1, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02239500:
	add r4, r4, #1
	add r1, r1, #4
	cmp r4, #0x18
	blt _022394EA
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223950C: .word 0x0000FFFF
	thumb_func_end ov80_022394D8

	thumb_func_start ov80_02239510
ov80_02239510: ; 0x02239510
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldr r0, [r6, #8]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02096868
	mov r1, #0
	mvn r1, r1
	cmp r4, r1
	bne _02239540
	mov r4, #0
_0223952A:
	ldr r1, [r0]
	cmp r1, #0
	beq _02239538
	add r4, r4, #1
	add r0, #0x3c
	cmp r4, #0x20
	blt _0223952A
_02239538:
	cmp r4, #0x20
	bne _02239540
	bl GF_AssertFail
_02239540:
	mov r0, #6
	ldrsh r0, [r5, r0]
	add r1, sp, #8
	strh r0, [r1]
	mov r0, #8
	ldrsh r0, [r5, r0]
	strh r0, [r1, #2]
	ldrh r0, [r5, #4]
	strh r0, [r1, #4]
	ldrh r0, [r5, #2]
	strh r0, [r1, #6]
	ldrb r0, [r5, #0xa]
	strh r0, [r1, #8]
	ldrh r0, [r5]
	strh r0, [r1, #0xa]
	ldr r0, [r6, #0x14]
	add r1, sp, #8
	bl ov42_022280B8
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	ldr r1, [sp, #4]
	mov r2, #0
	mov r3, #0x65
	bl ov42_0222903C
	ldrb r1, [r5, #0xb]
	add r7, r0, #0
	bl ov42_02229200
	str r5, [sp]
	ldr r0, [r6, #8]
	ldr r2, [sp, #4]
	add r1, r4, #0
	add r3, r7, #0
	bl ov80_02239914
	ldr r0, [sp, #4]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02239510

	thumb_func_start ov80_02239590
ov80_02239590: ; 0x02239590
	push {r3, r4, r5, lr}
	ldr r0, [r0, #8]
	add r5, r1, #0
	bl sub_02096868
	add r4, r0, #0
	mov r1, #0
	add r2, r4, #0
_022395A0:
	ldr r0, [r2]
	cmp r0, r5
	bne _022395D8
	mov r0, #0x3c
	add r5, r1, #0
	mul r5, r0
	ldr r0, [r4, r5]
	bl ov42_02228100
	add r0, r4, r5
	ldr r0, [r0, #4]
	bl ov42_022290C4
	add r0, r4, r5
	ldr r0, [r0, #0x38]
	cmp r0, #0
	beq _022395C6
	bl GF_AssertFail
_022395C6:
	add r0, r4, r5
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	ldr r1, _022395E4 ; =0x0000FFFF
	add r0, r4, r5
	strh r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
_022395D8:
	add r1, r1, #1
	add r2, #0x3c
	cmp r1, #0x20
	blt _022395A0
	pop {r3, r4, r5, pc}
	nop
_022395E4: .word 0x0000FFFF
	thumb_func_end ov80_02239590

	thumb_func_start ov80_022395E8
ov80_022395E8: ; 0x022395E8
	push {r4, r5, r6, lr}
	ldr r0, [r0, #8]
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02096868
	mov r1, #0
	add r3, r0, #0
_022395FA:
	ldrh r2, [r3, #0xc]
	cmp r5, r2
	bne _0223961C
	cmp r4, #0
	beq _0223960C
	mov r2, #0x3c
	mul r2, r1
	ldr r2, [r0, r2]
	str r2, [r4]
_0223960C:
	cmp r6, #0
	beq _02239628
	mov r2, #0x3c
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #4]
	str r0, [r6]
	pop {r4, r5, r6, pc}
_0223961C:
	add r1, r1, #1
	add r3, #0x3c
	cmp r1, #0x20
	blt _022395FA
	bl GF_AssertFail
_02239628:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_022395E8

	thumb_func_start ov80_0223962C
ov80_0223962C: ; 0x0223962C
	push {r3, r4, r5, lr}
	ldr r3, _02239658 ; =0x0000FFFF
	mov r4, #0
	add r5, r0, #0
_02239634:
	add r2, r5, #0
	add r2, #0x70
	ldrh r2, [r2]
	cmp r2, r3
	bne _02239648
	lsl r2, r4, #1
	add r0, r0, r2
	add r0, #0x70
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_02239648:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #8
	blt _02239634
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_02239658: .word 0x0000FFFF
	thumb_func_end ov80_0223962C

	thumb_func_start ov80_0223965C
ov80_0223965C: ; 0x0223965C
	push {r3, r4}
	mov r3, #0
	add r4, r0, #0
_02239662:
	add r2, r4, #0
	add r2, #0x70
	ldrh r2, [r2]
	cmp r1, r2
	bne _0223967A
	lsl r1, r3, #1
	add r0, r0, r1
	ldr r2, _02239688 ; =0x0000FFFF
	add r0, #0x70
	strh r2, [r0]
	pop {r3, r4}
	bx lr
_0223967A:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #8
	blt _02239662
	pop {r3, r4}
	bx lr
	nop
_02239688: .word 0x0000FFFF
	thumb_func_end ov80_0223965C

	thumb_func_start ov80_0223968C
ov80_0223968C: ; 0x0223968C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #8
	blo _0223969E
	bl GF_AssertFail
_0223969E:
	add r7, r5, #0
	lsl r0, r4, #2
	add r7, #0x3c
	str r0, [sp]
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _022396B0
	bl GF_AssertFail
_022396B0:
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	add r2, r6, #0
	bl ov80_02239BB8
	ldr r1, [sp]
	str r0, [sp, #4]
	str r0, [r7, r1]
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0x5c
	strh r6, [r0]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov80_02239708
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223968C

	thumb_func_start ov80_022396D8
ov80_022396D8: ; 0x022396D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blo _022396E6
	bl GF_AssertFail
_022396E6:
	lsl r4, r4, #2
	add r5, #0x3c
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _022396F4
	bl GF_AssertFail
_022396F4:
	ldr r0, [r5, r4]
	bl ov80_02239BE8
	mov r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022396D8

	thumb_func_start ov80_02239700
ov80_02239700: ; 0x02239700
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0x3c]
	bx lr
	thumb_func_end ov80_02239700

	thumb_func_start ov80_02239708
ov80_02239708: ; 0x02239708
	push {r3, r4}
	cmp r2, #1
	bne _0223971E
	mov r2, #1
	ldr r3, [r0, #0x6c]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	str r1, [r0, #0x6c]
	pop {r3, r4}
	bx lr
_0223971E:
	mov r2, #1
	add r3, r2, #0
	lsl r3, r1
	sub r1, r2, #2
	ldr r4, [r0, #0x6c]
	eor r1, r3
	and r1, r4
	str r1, [r0, #0x6c]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02239708

	thumb_func_start ov80_02239734
ov80_02239734: ; 0x02239734
	ldr r0, [r0, #0x6c]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end ov80_02239734

	thumb_func_start ov80_02239740
ov80_02239740: ; 0x02239740
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0, #8]
	bl sub_02096878
	ldr r4, [sp]
	add r6, r0, #0
	ldr r0, _02239814 ; =0x0000FFFF
	add r4, #0x3c
	mov r3, #0
_02239756:
	lsl r2, r3, #1
	add r1, r4, r2
	ldrh r1, [r1, #0x34]
	cmp r1, r0
	beq _02239764
	strh r1, [r6, r2]
	add r3, r3, #1
_02239764:
	add r3, r3, #1
	cmp r3, #8
	blt _02239756
	add r0, r6, #0
	str r0, [sp, #8]
	add r0, #0x12
	str r0, [sp, #8]
	add r0, r6, #0
	add r5, r6, #0
	str r0, [sp, #4]
	add r0, #0x10
	mov r7, #0
	add r5, #0x16
	str r4, [sp, #0xc]
	str r0, [sp, #4]
_02239782:
	ldr r0, [r4]
	cmp r0, #0
	beq _022397F0
	bl sub_0200DC64
	strb r0, [r6, #0x15]
	ldr r0, [r4]
	bl sub_0200DCD4
	ldrh r2, [r5]
	ldr r1, _02239818 ; =0xFFFFE000
	and r1, r2
	ldr r2, _0223981C ; =0x00001FFF
	and r0, r2
	orr r0, r1
	strh r0, [r5]
	lsl r1, r7, #0x10
	ldr r0, [sp]
	lsr r1, r1, #0x10
	bl ov80_02239734
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r2, [r5]
	ldr r1, _02239820 ; =0xFFFFDFFF
	lsr r0, r0, #0x12
	and r1, r2
	orr r0, r1
	strh r0, [r5]
	ldr r0, [r4]
	bl sub_0200DCFC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r2, [r5]
	ldr r1, _02239824 ; =0xFFFFBFFF
	lsr r0, r0, #0x11
	and r1, r2
	orr r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldrh r0, [r0, #0x20]
	ldr r2, [sp, #8]
	strb r0, [r6, #0x14]
	ldr r0, [r4]
	bl sub_0200DE44
	mov r0, #2
	ldrh r1, [r5]
	lsl r0, r0, #0xe
	orr r0, r1
	strh r0, [r5]
_022397F0:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r4, r4, #4
	add r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r6, #8
	add r0, #8
	add r5, #8
	str r0, [sp, #4]
	cmp r7, #8
	blt _02239782
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239814: .word 0x0000FFFF
_02239818: .word 0xFFFFE000
_0223981C: .word 0x00001FFF
_02239820: .word 0xFFFFDFFF
_02239824: .word 0xFFFFBFFF
	thumb_func_end ov80_02239740

	thumb_func_start ov80_02239828
ov80_02239828: ; 0x02239828
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, [r7, #8]
	bl sub_02096878
	add r5, r0, #0
	mov r0, #0xb8
	mov r1, #0x65
	bl NARC_New
	str r0, [sp, #4]
	mov r6, #0
	add r4, r5, #0
_02239844:
	ldrh r1, [r4]
	ldr r0, _022398E0 ; =0x0000FFFF
	cmp r1, r0
	beq _02239862
	str r1, [sp]
	ldr r0, [r7, #0x34]
	ldr r1, [r7, #0x38]
	ldr r2, [sp, #4]
	ldr r3, [r7, #4]
	bl ov80_02239AF8
	ldrh r1, [r4]
	add r0, r7, #0
	bl ov80_0223962C
_02239862:
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, #8
	blt _02239844
	add r4, r5, #0
	mov r6, #0
	add r4, #0x16
_02239870:
	ldrh r0, [r4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _022398C4
	ldrb r2, [r5, #0x14]
	lsl r1, r6, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl ov80_0223968C
	mov r1, #0x10
	mov r2, #0x12
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	str r0, [sp, #8]
	bl sub_0200DDB8
	ldrh r1, [r4]
	ldr r0, [sp, #8]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1f
	bl sub_0200DCE8
	ldrh r2, [r4]
	lsl r1, r6, #0x10
	add r0, r7, #0
	lsl r2, r2, #0x12
	lsr r1, r1, #0x10
	lsr r2, r2, #0x1f
	bl ov80_02239708
	ldrb r1, [r5, #0x15]
	ldr r0, [sp, #8]
	bl sub_0200DC4C
	ldrh r1, [r4]
	ldr r0, [sp, #8]
	lsl r1, r1, #0x13
	lsr r1, r1, #0x13
	bl sub_0200DCC0
_022398C4:
	add r6, r6, #1
	add r4, #8
	add r5, #8
	cmp r6, #8
	blt _02239870
	ldr r0, [sp, #4]
	bl NARC_Delete
	ldr r0, [r7, #8]
	bl sub_02096884
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022398E0: .word 0x0000FFFF
	thumb_func_end ov80_02239828

	thumb_func_start ov80_022398E4
ov80_022398E4: ; 0x022398E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x1c
	add r6, r1, #0
	add r4, r2, #0
	bl ov42_022293A8
	add r5, #0x1c
	strh r0, [r4]
	add r0, r5, #0
	bl ov42_022293B0
	strh r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022398E4

	thumb_func_start ov80_02239900
ov80_02239900: ; 0x02239900
	add r0, #8
	mov r3, #0xf
_02239904:
	ldrh r2, [r0]
	add r0, r0, #2
	strh r2, [r1]
	add r1, r1, #2
	sub r3, r3, #1
	bne _02239904
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02239900

	thumb_func_start ov80_02239914
ov80_02239914: ; 0x02239914
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0209686C
	str r5, [r0]
	str r4, [r0, #4]
	ldr r3, [sp, #0x10]
	add r0, #8
	mov r2, #0xf
_02239928:
	ldrh r1, [r3]
	add r3, r3, #2
	strh r1, [r0]
	add r0, r0, #2
	sub r2, r2, #1
	bne _02239928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02239914

	thumb_func_start ov80_02239938
ov80_02239938: ; 0x02239938
	push {r4, lr}
	add r4, r1, #0
	bl sub_02096868
	mov r2, #0
_02239942:
	ldr r1, [r0]
	cmp r1, #0
	beq _0223994E
	ldrh r1, [r0, #0xc]
	cmp r1, r4
	beq _0223995C
_0223994E:
	add r2, r2, #1
	add r0, #0x3c
	cmp r2, #0x20
	blt _02239942
	bl GF_AssertFail
	mov r0, #0
_0223995C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239938

    .rodata

ov80_0223D554: ; 0x0223D554
	.byte 0x00, 0x03, 0x00, 0x05, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00

ov80_0223D560: ; 0x0223D560
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov80_0223D570: ; 0x0223D570
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x20, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov80_0223D584: ; 0x0223D584
	.byte 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00

ov80_0223D59C: ; 0x0223D59C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223D5B8: ; 0x0223D5B8
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov80_0223D5D8: ; 0x0223D5D8
	.byte 0x06, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov80_0223D600: ; 0x0223D600
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x01, 0x08
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x05, 0x0C, 0x01, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223D654: ; 0x0223D654
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

