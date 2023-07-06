#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_020850F4.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_020850F4
sub_020850F4: ; 0x020850F4
	push {r3, r4, r5, lr}
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x6c
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #0xfd
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0x6c
	bl OverlayManager_CreateAndGetData
	mov r2, #0xfd
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetArgs
	add r5, r0, #0
	mov r0, #0xee
	lsl r0, r0, #2
	add r3, r4, r0
	mov r2, #6
_0208512C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208512C
	ldr r0, [r5]
	str r0, [r3]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02085238 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0208523C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0xbe
	mov r1, #0x6c
	bl NARC_New
	mov r1, #0xbb
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6c
	bl BgConfig_Alloc
	mov r1, #0xbe
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6c
	bl PaletteData_Init
	mov r1, #0xbf
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl sub_02003B50
	mov r2, #0xbf
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	mov r1, #0
	sub r2, #0xfc
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r2, r1, #9
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	mov r1, #2
	ldr r0, [r4, r0]
	lsl r2, r1, #8
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r2, #0xbf
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	mov r1, #3
	sub r2, #0xfc
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0208545C
	add r0, r4, #0
	bl sub_020863F4
	add r0, r4, #0
	bl sub_02085688
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r4, #0
	bl sub_020860B8
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0208520A
	bl sub_0203A880
	mov r0, #1
	mov r1, #0x6c
	bl sub_0203A948
_0208520A:
	mov r0, #7
	str r0, [sp]
	ldr r0, _02085240 ; =0x04000050
	mov r1, #0
	mov r2, #6
	mov r3, #0xf
	bl G2x_SetBlendAlpha_
	mov r0, #8
	str r0, [sp]
	ldr r0, _02085244 ; =0x04001050
	mov r1, #0
	mov r2, #0xe
	mov r3, #7
	bl G2x_SetBlendAlpha_
	ldr r0, _02085248 ; =sub_020855CC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02085238: .word 0xFFFFE0FF
_0208523C: .word 0x04001000
_02085240: .word 0x04000050
_02085244: .word 0x04001050
_02085248: .word sub_020855CC
	thumb_func_end sub_020850F4

	thumb_func_start sub_0208524C
sub_0208524C: ; 0x0208524C
	push {r3, r4, r5, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_02085BEC
	add r5, r0, #0
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02085270
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
_02085270:
	cmp r5, #0
	beq _02085278
	mov r0, #1
	pop {r3, r4, r5, pc}
_02085278:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208524C

	thumb_func_start sub_0208527C
sub_0208527C: ; 0x0208527C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02085294
	bl sub_0203A914
_02085294:
	add r0, r4, #0
	bl sub_020866CC
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl PaletteData_Free
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl NARC_Delete
	bl sub_02021238
	mov r1, #0x2f
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D998
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D108
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x6c
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0208527C

	thumb_func_start sub_020853B4
sub_020853B4: ; 0x020853B4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	str r0, [sp]
	mov r1, #0x34
	add r5, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldr r1, [sp]
	add r0, r6, #1
	str r6, [r4]
	bl String_New
	str r0, [r4, #0x1c]
	str r7, [r4, #0x20]
	mov r2, #0
	add r1, r5, #0
	add r3, r4, #0
_020853DA:
	ldr r0, [r1]
	add r2, r2, #1
	str r0, [r3, #4]
	add r1, r1, #4
	add r3, r3, #4
	cmp r2, #4
	blt _020853DA
	sub r0, r2, #1
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	lsl r0, r2, #2
	add r0, r4, r0
	str r1, [r0, #4]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x30]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020853B4

	thumb_func_start sub_02085400
sub_02085400: ; 0x02085400
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_020853B4
	mov r1, #0
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02085400

	thumb_func_start sub_0208541C
sub_0208541C: ; 0x0208541C
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_020853B4
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x24]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x28]
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_0208541C

	thumb_func_start sub_02085438
sub_02085438: ; 0x02085438
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _02085446
	bl GF_AssertFail
_02085446:
	cmp r4, #0
	bne _0208544E
	bl GF_AssertFail
_0208544E:
	ldr r0, [r4, #0x1c]
	bl String_Delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02085438

	thumb_func_start sub_0208545C
sub_0208545C: ; 0x0208545C
	push {r4, r5, lr}
	sub sp, #0xec
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r5, _020855BC ; =_02102630
	add r3, sp, #0
	mov r2, #5
_0208546C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208546C
	add r0, sp, #0
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
	ldr r5, _020855C0 ; =_02102658
	add r3, sp, #0x98
	mov r2, #0xa
_020854B8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020854B8
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0x98
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0xb4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #0xd0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r5, _020855C4 ; =_021026AC
	add r3, sp, #0x28
	mov r2, #0xe
_02085526:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02085526
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #0x28
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #0x44
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0x60
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #0x7c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, _020855C8 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0xec
	pop {r4, r5, pc}
	.balign 4, 0
_020855BC: .word _02102630
_020855C0: .word _02102658
_020855C4: .word _021026AC
_020855C8: .word gSystem + 0x60
	thumb_func_end sub_0208545C

	thumb_func_start sub_020855CC
sub_020855CC: ; 0x020855CC
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200398C
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DoScheduledBgGpuUpdates
	ldr r3, _020855FC ; =OS_IRQTable
	ldr r1, _02085600 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_020855FC: .word OS_IRQTable
_02085600: .word 0x00003FF8
	thumb_func_end sub_020855CC

	.rodata

	.public _02102620
_02102620:
	.word sub_020850F4, sub_0208524C, sub_0208527C, 0xFFFFFFFF
_02102630:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_02102658:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x06, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021026AC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
