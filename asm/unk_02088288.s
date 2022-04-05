#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_02088288
sub_02088288: ; 0x02088288
	mov r0, #1
	bx lr
	thumb_func_end sub_02088288

	thumb_func_start sub_0208828C
sub_0208828C: ; 0x0208828C
	push {r3, lr}
	bl SavArray_Flags_get
	bl CheckFlag982
	pop {r3, pc}
	thumb_func_end sub_0208828C

	thumb_func_start sub_02088298
sub_02088298: ; 0x02088298
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _02088408 ; =0xFFFFE0FF
	and r0, r2
	str r0, [r1]
	ldr r0, _0208840C ; =0x04001000
	ldr r3, [r0]
	and r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _02088410 ; =0xFFFF1FFF
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
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r2, #0x45
	mov r0, #3
	mov r1, #0x13
	lsl r2, r2, #0xc
	bl CreateHeap
	mov r0, #0x27
	mov r1, #0x13
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #0xa2
	mov r1, #0x13
	bl NARC_ctor
	add r5, r0, #0
	ldr r1, _02088414 ; =0x000007D8
	add r0, r6, #0
	mov r2, #0x13
	bl OverlayManager_CreateAndGetData
	ldr r2, _02088414 ; =0x000007D8
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x13
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	str r1, [r0, #0x38]
	mov r1, #1
	mov r0, #0x13
	add r2, r1, #0
	bl sub_02016EDC
	mov r1, #0xb3
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xb4
	mov r1, #0x13
	bl NARC_ctor
	ldr r1, _02088418 ; =0x000007B8
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x13
	bl FontID_SetAccessDirect
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	bl sub_02088610
	ldr r0, [r4]
	bl sub_02088630
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl sub_020887C4
	bl sub_0208887C
	add r0, r4, #0
	bl sub_0208DE40
	mov r0, #4
	mov r1, #0x13
	bl FontID_Alloc
	add r0, r4, #0
	bl sub_02088894
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020889D0
	add r0, r4, #0
	bl sub_020897C0
	add r0, r4, #0
	bl sub_0208B1AC
	add r0, r4, #0
	bl sub_0208B2C0
	add r0, r4, #0
	bl sub_0208E3AC
	add r0, r4, #0
	bl sub_0208B48C
	add r0, r4, #0
	bl sub_0208B4EC
	add r0, r4, #0
	bl sub_0208BECC
	add r0, r4, #0
	bl sub_0208C3E4
	add r0, r4, #0
	bl sub_02089CB4
	add r0, r4, #0
	bl sub_0208DF2C
	ldr r0, _0208841C ; =sub_020885DC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r2, _02088420 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	bl GX_BothDispOn
	mov r1, #0
	mov r0, #0x3d
	add r2, r1, #0
	bl sub_02004EC4
	bl sub_0203A964
	add r0, r5, #0
	bl NARC_dtor
	add r0, r7, #0
	bl NARC_dtor
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02088408: .word 0xFFFFE0FF
_0208840C: .word 0x04001000
_02088410: .word 0xFFFF1FFF
_02088414: .word 0x000007D8
_02088418: .word 0x000007B8
_0208841C: .word sub_020885DC
_02088420: .word 0x04000304
	thumb_func_end sub_02088298

	thumb_func_start sub_02088424
sub_02088424: ; 0x02088424
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0x16
	bls _02088436
	b _0208854A
_02088436:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02088442: ; jump table
	.short _02088470 - _02088442 - 2 ; case 0
	.short _0208848C - _02088442 - 2 ; case 1
	.short _02088494 - _02088442 - 2 ; case 2
	.short _0208849C - _02088442 - 2 ; case 3
	.short _020884A4 - _02088442 - 2 ; case 4
	.short _020884AC - _02088442 - 2 ; case 5
	.short _020884BC - _02088442 - 2 ; case 6
	.short _020884B4 - _02088442 - 2 ; case 7
	.short _020884C4 - _02088442 - 2 ; case 8
	.short _020884CC - _02088442 - 2 ; case 9
	.short _020884D4 - _02088442 - 2 ; case 10
	.short _020884DC - _02088442 - 2 ; case 11
	.short _020884E4 - _02088442 - 2 ; case 12
	.short _020884EC - _02088442 - 2 ; case 13
	.short _020884F4 - _02088442 - 2 ; case 14
	.short _020884FC - _02088442 - 2 ; case 15
	.short _02088504 - _02088442 - 2 ; case 16
	.short _0208850C - _02088442 - 2 ; case 17
	.short _02088514 - _02088442 - 2 ; case 18
	.short _02088530 - _02088442 - 2 ; case 19
	.short _02088544 - _02088442 - 2 ; case 20
	.short _0208851C - _02088442 - 2 ; case 21
	.short _02088524 - _02088442 - 2 ; case 22
_02088470:
	mov r0, #0
	mov r1, #0x13
	bl sub_020880CC
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	mov r0, #1
	str r0, [r4]
	b _0208854A
_0208848C:
	bl sub_02088B08
	str r0, [r4]
	b _0208854A
_02088494:
	bl sub_02088B40
	str r0, [r4]
	b _0208854A
_0208849C:
	bl sub_02088D18
	str r0, [r4]
	b _0208854A
_020884A4:
	bl sub_02088D34
	str r0, [r4]
	b _0208854A
_020884AC:
	bl sub_02088D48
	str r0, [r4]
	b _0208854A
_020884B4:
	bl sub_02088E68
	str r0, [r4]
	b _0208854A
_020884BC:
	bl sub_02088E98
	str r0, [r4]
	b _0208854A
_020884C4:
	bl sub_02089028
	str r0, [r4]
	b _0208854A
_020884CC:
	bl sub_02089208
	str r0, [r4]
	b _0208854A
_020884D4:
	bl sub_020892F4
	str r0, [r4]
	b _0208854A
_020884DC:
	bl sub_02089308
	str r0, [r4]
	b _0208854A
_020884E4:
	bl sub_0208931C
	str r0, [r4]
	b _0208854A
_020884EC:
	bl sub_0208942C
	str r0, [r4]
	b _0208854A
_020884F4:
	bl sub_02089454
	str r0, [r4]
	b _0208854A
_020884FC:
	bl sub_02089698
	str r0, [r4]
	b _0208854A
_02088504:
	bl sub_02089478
	str r0, [r4]
	b _0208854A
_0208850C:
	bl sub_02089608
	str r0, [r4]
	b _0208854A
_02088514:
	bl sub_02089658
	str r0, [r4]
	b _0208854A
_0208851C:
	bl sub_02089670
	str r0, [r4]
	b _0208854A
_02088524:
	bl sub_02089680
	cmp r0, #1
	bne _0208854A
	mov r0, #1
	pop {r3, r4, r5, pc}
_02088530:
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	mov r0, #2
	str r0, [r4]
	b _0208854A
_02088544:
	bl sub_02089794
	str r0, [r4]
_0208854A:
	add r0, r5, #0
	bl sub_0208B278
	add r0, r5, #0
	bl sub_0208C3C0
	mov r0, #1
	lsl r0, r0, #0xa
	ldr r0, [r5, r0]
	bl sub_0200D020
	add r0, r5, #0
	bl sub_0208DEDC
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02088424

	thumb_func_start sub_0208856C
sub_0208856C: ; 0x0208856C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl sub_0208DEFC
	add r0, r4, #0
	bl sub_0208B258
	add r0, r4, #0
	bl sub_0208C560
	ldr r0, [r4]
	bl sub_0208877C
	bl sub_02021238
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl sub_02088AF8
	add r0, r4, #0
	bl sub_0208895C
	mov r0, #4
	bl FontID_Release
	ldr r0, _020885D4 ; =0x000007B8
	ldr r0, [r4, r0]
	bl NARC_dtor
	mov r0, #0
	bl FontID_SetAccessLazy
	ldr r0, _020885D8 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x13
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020885D4: .word 0x000007B8
_020885D8: .word 0x04000050
	thumb_func_end sub_0208856C

	thumb_func_start sub_020885DC
sub_020885DC: ; 0x020885DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02009418
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r3, _02088608 ; =OS_IRQTable
	ldr r1, _0208860C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02088608: .word OS_IRQTable
_0208860C: .word 0x00003FF8
	thumb_func_end sub_020885DC

	thumb_func_start sub_02088610
sub_02088610: ; 0x02088610
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0208862C ; =_02103990
	add r3, sp, #0
	mov r2, #5
_0208861A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208861A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0208862C: .word _02103990
	thumb_func_end sub_02088610

	thumb_func_start sub_02088630
sub_02088630: ; 0x02088630
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	ldr r5, _02088760 ; =_021038C4
	add r3, sp, #0xa8
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _02088764 ; =_021038E8
	add r3, sp, #0x8c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02088768 ; =_02103904
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r4, #0
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	ldr r5, _0208876C ; =_02103920
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _02088770 ; =_0210393C
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02088774 ; =_02103958
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02088778 ; =_02103974
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x13
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x13
	bl BG_ClearCharDataRange
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_02088760: .word _021038C4
_02088764: .word _021038E8
_02088768: .word _02103904
_0208876C: .word _02103920
_02088770: .word _0210393C
_02088774: .word _02103958
_02088778: .word _02103974
	thumb_func_end sub_02088630

	thumb_func_start sub_0208877C
sub_0208877C: ; 0x0208877C
	push {r4, lr}
	add r4, r0, #0
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	mov r0, #0x13
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208877C

	thumb_func_start sub_020887C4
sub_020887C4: ; 0x020887C4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x13
	mov r1, #0
	add r4, r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0
	mov r0, #0x11
	str r1, [sp]
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #2
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xd
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x13
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #4
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0
	mov r0, #0x11
	str r1, [sp]
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #1
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x14
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x15
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020887C4

	thumb_func_start sub_0208887C
sub_0208887C: ; 0x0208887C
	push {r3, lr}
	mov r0, #8
	str r0, [sp]
	ldr r0, _02088890 ; =0x04000050
	mov r1, #1
	mov r2, #0x1e
	mov r3, #0x17
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_02088890: .word 0x04000050
	thumb_func_end sub_0208887C

	thumb_func_start sub_02088894
sub_02088894: ; 0x02088894
	push {r4, lr}
	ldr r2, _02088940 ; =0x0000012E
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	mov r1, #0x7a
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r2, #0x6a
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #2
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r1, _02088944 ; =0x000007A4
	mov r2, #0
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #2
	mov r3, #0x13
	bl MessagePrinter_new
	ldr r1, _02088948 ; =0x0000079C
	str r0, [r4, r1]
	mov r0, #0x13
	bl ScrStrBufs_new
	ldr r1, _0208894C ; =0x000007A8
	str r0, [r4, r1]
	mov r0, #0xc
	mov r1, #0x13
	bl String_ctor
	mov r1, #0x23
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0xc
	mov r1, #0x13
	bl String_ctor
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #8
	mov r1, #0x13
	bl String_ctor
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x80
	mov r1, #0x13
	bl String_ctor
	ldr r1, _02088950 ; =0x000007AC
	ldr r2, _02088954 ; =0x000002EE
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r1, _02088958 ; =0x000007B4
	str r0, [r4, r1]
	mov r0, #8
	mov r1, #0x13
	bl String_ctor
	mov r2, #0x7b
	lsl r2, r2, #4
	str r0, [r4, r2]
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0208893C
	ldr r0, [r4, r2]
	bl CopyU16ArrayToString
_0208893C:
	pop {r4, pc}
	nop
_02088940: .word 0x0000012E
_02088944: .word 0x000007A4
_02088948: .word 0x0000079C
_0208894C: .word 0x000007A8
_02088950: .word 0x000007AC
_02088954: .word 0x000002EE
_02088958: .word 0x000007B4
	thumb_func_end sub_02088894

	thumb_func_start sub_0208895C
sub_0208895C: ; 0x0208895C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020889BC ; =0x000007B4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _020889C0 ; =0x000007A4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _020889C4 ; =0x0000079C
	ldr r0, [r4, r0]
	bl MessagePrinter_delete
	ldr r0, _020889C8 ; =0x000007A8
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _020889CC ; =0x000007AC
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
_020889BC: .word 0x000007B4
_020889C0: .word 0x000007A4
_020889C4: .word 0x0000079C
_020889C8: .word 0x000007A8
_020889CC: .word 0x000007AC
	thumb_func_end sub_0208895C

	thumb_func_start sub_020889D0
sub_020889D0: ; 0x020889D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	mov r1, #2
	mov r2, #7
	mov r3, #0x13
	bl sub_0201956C
	mov r1, #0x7d
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r2, #6
	str r2, [sp]
	ldr r0, [r5, r1]
	mov r1, #0
	mov r3, #0x11
	bl sub_020195F4
	mov r1, #0
	mov r0, #0x7d
	str r1, [sp]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r2, r4, #0
	mov r3, #0x45
	bl sub_020196B8
	mov r2, #6
	mov r0, #0x7d
	str r2, [sp]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	mov r3, #0x11
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	add r2, r4, #0
	mov r3, #0x46
	bl sub_020196B8
	mov r0, #4
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	mov r2, #6
	mov r3, #0xa
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	add r2, r4, #0
	mov r3, #0x47
	bl sub_020196B8
	mov r0, #4
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	mov r2, #6
	mov r3, #0xa
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	add r2, r4, #0
	mov r3, #0x48
	bl sub_020196B8
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	mov r2, #6
	mov r3, #0xb
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	add r2, r4, #0
	mov r3, #0x49
	bl sub_020196B8
	mov r0, #3
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r2, #6
	ldr r0, [r5, r0]
	mov r1, #5
	add r3, r2, #0
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #5
	add r2, r4, #0
	mov r3, #0x4a
	bl sub_020196B8
	mov r1, #6
	mov r0, #3
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	add r2, r4, #0
	mov r3, #0x4b
	bl sub_020196B8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020889D0

	thumb_func_start sub_02088AF8
sub_02088AF8: ; 0x02088AF8
	mov r1, #0x7d
	lsl r1, r1, #4
	ldr r3, _02088B04 ; =sub_020195C0
	ldr r0, [r0, r1]
	bx r3
	nop
_02088B04: .word sub_020195C0
	thumb_func_end sub_02088AF8

	thumb_func_start sub_02088B08
sub_02088B08: ; 0x02088B08
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02088B3C
	add r0, r4, #0
	bl sub_0208E444
	add r0, r4, #0
	bl sub_02089C50
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bne _02088B30
	mov r0, #8
	pop {r4, pc}
_02088B30:
	cmp r0, #4
	bne _02088B38
	mov r0, #0x10
	pop {r4, pc}
_02088B38:
	mov r0, #2
	pop {r4, pc}
_02088B3C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02088B08

	thumb_func_start sub_02088B40
sub_02088B40: ; 0x02088B40
	push {r4, r5, r6, lr}
	ldr r2, _02088CF8 ; =0x000007BF
	add r5, r0, #0
	ldrb r1, [r5, r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _02088B5E
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	strb r1, [r0, #0x17]
	mov r0, #0x15
	pop {r4, r5, r6, pc}
_02088B5E:
	ldr r3, _02088CFC ; =gSystem
	mov r1, #0x20
	ldr r4, [r3, #0x4c]
	add r6, r4, #0
	tst r6, r1
	beq _02088B74
	sub r1, #0x21
	bl sub_02089E30
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088B74:
	mov r1, #0x10
	tst r1, r4
	beq _02088B84
	mov r1, #1
	bl sub_02089E30
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088B84:
	mov r1, #0x40
	add r6, r4, #0
	tst r6, r1
	beq _02088B96
	sub r1, #0x41
	bl sub_0208A2C0
	mov r0, #0x13
	pop {r4, r5, r6, pc}
_02088B96:
	mov r1, #0x80
	tst r1, r4
	beq _02088BA6
	mov r1, #1
	bl sub_0208A2C0
	mov r0, #0x13
	pop {r4, r5, r6, pc}
_02088BA6:
	ldr r1, [r3, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02088BD2
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	strb r1, [r0, #0x17]
	add r0, r5, #0
	mov r1, #0
	bl sub_0208ADB8
	add r0, r5, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r4, r5, r6, pc}
_02088BD2:
	mov r0, #1
	tst r0, r1
	beq _02088C12
	sub r0, r2, #3
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _02088BE6
	cmp r0, #2
	beq _02088BFA
	b _02088C12
_02088BE6:
	ldr r0, _02088D00 ; =0x0000069B
	bl PlaySE
	ldr r1, _02088D04 ; =0x000007BD
	mov r0, #0xf
	ldrb r2, [r5, r1]
	bic r2, r0
	strb r2, [r5, r1]
	mov r0, #3
	pop {r4, r5, r6, pc}
_02088BFA:
	add r0, r2, #7
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _02088C12
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	ldr r0, _02088D0C ; =0x000007C4
	mov r1, #0
	strb r1, [r5, r0]
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_02088C12:
	ldr r0, _02088D10 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _02088C56
	add r0, r5, #0
	bl sub_0208ADCC
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02088C56
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x99
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02088C56
	ldr r0, _02088D00 ; =0x0000069B
	bl PlaySE
	ldr r2, _02088D04 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	mov r0, #3
	pop {r4, r5, r6, pc}
_02088C56:
	ldr r0, _02088D10 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _02088C88
	add r0, r5, #0
	bl sub_0208AEC4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02088C88
	cmp r4, #9
	bge _02088C88
	ldr r0, _02088D14 ; =0x000007C6
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _02088C88
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	ldr r0, _02088D0C ; =0x000007C4
	strb r4, [r5, r0]
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_02088C88:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _02088CF0
	add r0, r5, #0
	bl sub_0208AEB4
	cmp r0, #0
	bne _02088CC6
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02088CC2
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x14
	bl sub_0208B0B0
	pop {r4, r5, r6, pc}
_02088CC2:
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088CC6:
	cmp r0, #1
	bne _02088CF0
	add r0, r5, #0
	mov r1, #1
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02088CEC
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x14
	bl sub_0208B0B0
	pop {r4, r5, r6, pc}
_02088CEC:
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088CF0:
	add r0, r5, #0
	bl sub_02089E98
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02088CF8: .word 0x000007BF
_02088CFC: .word gSystem
_02088D00: .word 0x0000069B
_02088D04: .word 0x000007BD
_02088D08: .word 0x000005DD
_02088D0C: .word 0x000007C4
_02088D10: .word 0x000007BC
_02088D14: .word 0x000007C6
	thumb_func_end sub_02088B40

	thumb_func_start sub_02088D18
sub_02088D18: ; 0x02088D18
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208A564
	cmp r0, #1
	bne _02088D30
	add r0, r4, #0
	mov r1, #1
	bl sub_0208AFA0
	mov r0, #5
	pop {r4, pc}
_02088D30:
	mov r0, #3
	pop {r4, pc}
	thumb_func_end sub_02088D18

	thumb_func_start sub_02088D34
sub_02088D34: ; 0x02088D34
	push {r3, lr}
	bl sub_0208A63C
	cmp r0, #1
	bne _02088D42
	mov r0, #2
	pop {r3, pc}
_02088D42:
	mov r0, #4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02088D34

	thumb_func_start sub_02088D48
sub_02088D48: ; 0x02088D48
	push {r4, lr}
	ldr r1, _02088E58 ; =gSystem
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #0x40
	add r3, r2, #0
	tst r3, r1
	beq _02088D72
	sub r1, #0x41
	bl sub_0208A71C
	cmp r0, #1
	bne _02088D6E
	ldr r0, _02088E5C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0208A79C
_02088D6E:
	mov r0, #5
	pop {r4, pc}
_02088D72:
	mov r1, #0x80
	tst r1, r2
	beq _02088D92
	mov r1, #1
	bl sub_0208A71C
	cmp r0, #1
	bne _02088D8E
	ldr r0, _02088E5C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0208A79C
_02088D8E:
	mov r0, #5
	pop {r4, pc}
_02088D92:
	mov r0, #1
	tst r0, r2
	beq _02088DB4
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #1
	beq _02088DB4
	ldr r0, _02088E60 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #7
	bl sub_0208B08C
	pop {r4, pc}
_02088DB4:
	mov r0, #2
	tst r0, r2
	beq _02088DD4
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AFA0
	add r0, r4, #0
	mov r1, #4
	bl sub_0208B044
	pop {r4, pc}
_02088DD4:
	add r0, r4, #0
	bl sub_0208AE08
	cmp r0, #4
	bne _02088DFA
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #1
	beq _02088E52
	ldr r0, _02088E60 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #7
	bl sub_0208B08C
	pop {r4, pc}
_02088DFA:
	cmp r0, #5
	bne _02088E18
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AFA0
	add r0, r4, #0
	mov r1, #4
	bl sub_0208B044
	pop {r4, pc}
_02088E18:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02088E52
	lsl r1, r0, #1
	add r2, r4, r1
	mov r1, #0x99
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _02088E52
	ldr r3, _02088E64 ; =0x000007BD
	mov r2, #0xf
	ldrb r1, [r4, r3]
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #0xf
	and r0, r2
	orr r0, r1
	strb r0, [r4, r3]
	ldr r0, _02088E5C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0208A79C
	mov r0, #5
	pop {r4, pc}
_02088E52:
	mov r0, #5
	pop {r4, pc}
	nop
_02088E58: .word gSystem
_02088E5C: .word 0x000005DC
_02088E60: .word 0x000005DD
_02088E64: .word 0x000007BD
	thumb_func_end sub_02088D48

	thumb_func_start sub_02088E68
sub_02088E68: ; 0x02088E68
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0208AFA0
	add r0, r4, #0
	bl sub_0208BC78
	ldr r2, _02088E94 ; =0x000007BD
	mov r1, #0xf0
	ldrb r3, [r4, r2]
	add r0, r3, #0
	bic r0, r1
	lsl r1, r3, #0x1c
	lsr r1, r1, #0x1c
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, r2]
	mov r0, #6
	pop {r4, pc}
	nop
_02088E94: .word 0x000007BD
	thumb_func_end sub_02088E68

	thumb_func_start sub_02088E98
sub_02088E98: ; 0x02088E98
	push {r3, r4, r5, lr}
	ldr r1, _02089014 ; =gSystem
	add r5, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #0x40
	add r3, r2, #0
	tst r3, r1
	beq _02088EC2
	sub r1, #0x41
	bl sub_0208A71C
	cmp r0, #1
	bne _02088EBE
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_02088EBE:
	mov r0, #6
	pop {r3, r4, r5, pc}
_02088EC2:
	mov r1, #0x80
	tst r1, r2
	beq _02088EE2
	mov r1, #1
	bl sub_0208A71C
	cmp r0, #1
	bne _02088EDE
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_02088EDE:
	mov r0, #6
	pop {r3, r4, r5, pc}
_02088EE2:
	mov r1, #1
	add r3, r2, #0
	tst r3, r1
	beq _02088F3E
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02089020 ; =0x000007BD
	ldrb r0, [r5, r0]
	lsl r1, r0, #0x1c
	lsl r0, r0, #0x18
	lsr r1, r1, #0x1c
	lsr r0, r0, #0x1c
	cmp r1, r0
	beq _02088F34
	ldr r0, _02089024 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A834
	ldr r1, _02089020 ; =0x000007BD
	add r0, r5, #0
	ldrb r2, [r5, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl sub_0208BB24
	add r0, r5, #0
	bl sub_0208DB64
	add r0, r5, #0
	bl sub_0208A79C
	b _02088F3A
_02088F34:
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
_02088F3A:
	mov r0, #5
	pop {r3, r4, r5, pc}
_02088F3E:
	mov r1, #2
	tst r1, r2
	beq _02088F68
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	mov r1, #5
	bl sub_0208B044
	pop {r3, r4, r5, pc}
_02088F68:
	bl sub_0208ADDC
	add r4, r0, #0
	cmp r4, #4
	bne _02088F96
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	mov r1, #5
	bl sub_0208B044
	pop {r3, r4, r5, pc}
_02088F96:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02089010
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x99
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02089010
	add r0, r5, #0
	mov r1, #1
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r2, _02089020 ; =0x000007BD
	ldrb r0, [r5, r2]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1c
	cmp r4, r1
	beq _02089006
	mov r1, #0xf
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	ldr r0, _02089024 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A834
	ldr r1, _02089020 ; =0x000007BD
	add r0, r5, #0
	ldrb r2, [r5, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl sub_0208BB24
	add r0, r5, #0
	bl sub_0208DB64
	add r0, r5, #0
	bl sub_0208A79C
	b _0208900C
_02089006:
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
_0208900C:
	mov r0, #5
	pop {r3, r4, r5, pc}
_02089010:
	mov r0, #6
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089014: .word gSystem
_02089018: .word 0x000005DC
_0208901C: .word 0x0000042C
_02089020: .word 0x000007BD
_02089024: .word 0x000005DD
	thumb_func_end sub_02088E98

	thumb_func_start sub_02089028
sub_02089028: ; 0x02089028
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _020891F4 ; =gSystem
	add r5, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #0x40
	add r3, r2, #0
	tst r3, r1
	beq _02089052
	sub r1, #0x41
	bl sub_0208A71C
	cmp r0, #1
	bne _0208904E
	ldr r0, _020891F8 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_0208904E:
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_02089052:
	mov r1, #0x80
	tst r1, r2
	beq _02089072
	mov r1, #1
	bl sub_0208A71C
	cmp r0, #1
	bne _0208906E
	ldr r0, _020891F8 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_0208906E:
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_02089072:
	mov r1, #1
	tst r1, r2
	beq _020890D8
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r0, _02089200 ; =0x000007BD
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #4
	bne _0208909E
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r2, #4
	strb r2, [r1, #0x16]
	ldr r0, [r5, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	mov r0, #0x15
	pop {r3, r4, r5, r6, r7, pc}
_0208909E:
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0x99
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	bl MoveIsHM
	cmp r0, #1
	bne _020890D0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020890D0
	ldr r0, _02089204 ; =0x0000044C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	add r0, r5, #0
	bl sub_0208DBF0
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_020890D0:
	add r0, r5, #0
	bl sub_0208AED4
	pop {r3, r4, r5, r6, r7, pc}
_020890D8:
	mov r1, #2
	tst r1, r2
	beq _02089100
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r2, #4
	strb r2, [r1, #0x16]
	ldr r0, [r5, r0]
	mov r1, #1
	strb r1, [r0, #0x17]
	add r0, r5, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r3, r4, r5, r6, r7, pc}
_02089100:
	bl sub_0208AE48
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _020891F0
	cmp r4, #4
	beq _02089118
	cmp r4, #5
	beq _02089140
	b _02089170
_02089118:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020891F0
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r1, _02089200 ; =0x000007BD
	mov r0, #0xf
	ldrb r2, [r5, r1]
	bic r2, r0
	mov r0, #4
	orr r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	bl sub_0208A79C
	b _020891F0
_02089140:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r1, _02089200 ; =0x000007BD
	mov r0, #0xf
	ldrb r2, [r5, r1]
	bic r2, r0
	mov r0, #5
	orr r0, r2
	strb r0, [r5, r1]
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r2, #4
	strb r2, [r1, #0x16]
	ldr r0, [r5, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	add r0, r5, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r3, r4, r5, r6, r7, pc}
_02089170:
	mov r0, #0x99
	lsl r0, r0, #2
	add r6, r5, r0
	lsl r7, r4, #1
	ldrh r0, [r6, r7]
	bl MoveIsHM
	cmp r0, #1
	bne _020891C2
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020891C2
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r2, _02089200 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	ldr r0, _02089204 ; =0x0000044C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	add r0, r5, #0
	bl sub_0208BBDC
	add r0, r5, #0
	bl sub_0208DBF0
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_020891C2:
	ldrh r0, [r6, r7]
	cmp r0, #0
	beq _020891F0
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r2, _02089200 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	add r0, r5, #0
	bl sub_0208A79C
	add r0, r5, #0
	bl sub_0208AED4
	pop {r3, r4, r5, r6, r7, pc}
_020891F0:
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020891F4: .word gSystem
_020891F8: .word 0x000005DC
_020891FC: .word 0x000005DD
_02089200: .word 0x000007BD
_02089204: .word 0x0000044C
	thumb_func_end sub_02089028

	thumb_func_start sub_02089208
sub_02089208: ; 0x02089208
	push {r4, lr}
	ldr r1, _020892E0 ; =gSystem
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	beq _0208923C
	ldr r0, _020892E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _020892E8 ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1c
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	strb r2, [r1, #0x16]
	ldr r0, [r4, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0208B068
	pop {r4, pc}
_0208923C:
	mov r1, #2
	tst r1, r2
	beq _02089270
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _020892EC ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _020892F0 ; =0x0000042C
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AF08
	add r0, r4, #0
	mov r1, #8
	bl sub_0208B044
	pop {r4, pc}
_02089270:
	bl sub_0208AE88
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _020892DA
	cmp r0, #0
	beq _02089286
	cmp r0, #1
	beq _020892AC
	b _020892DA
_02089286:
	ldr r0, _020892E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _020892E8 ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1c
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	strb r2, [r1, #0x16]
	ldr r0, [r4, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0208B068
	pop {r4, pc}
_020892AC:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _020892EC ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _020892F0 ; =0x0000042C
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AF08
	add r0, r4, #0
	mov r1, #8
	bl sub_0208B044
	pop {r4, pc}
_020892DA:
	mov r0, #9
	pop {r4, pc}
	nop
_020892E0: .word gSystem
_020892E4: .word 0x000005DD
_020892E8: .word 0x000007BD
_020892EC: .word 0x00000428
_020892F0: .word 0x0000042C
	thumb_func_end sub_02089208

	thumb_func_start sub_020892F4
sub_020892F4: ; 0x020892F4
	push {r3, lr}
	bl sub_0208A9C4
	cmp r0, #1
	bne _02089302
	mov r0, #0xc
	pop {r3, pc}
_02089302:
	mov r0, #0xa
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020892F4

	thumb_func_start sub_02089308
sub_02089308: ; 0x02089308
	push {r3, lr}
	bl sub_0208AA9C
	cmp r0, #1
	bne _02089316
	mov r0, #2
	pop {r3, pc}
_02089316:
	mov r0, #0xb
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02089308

	thumb_func_start sub_0208931C
sub_0208931C: ; 0x0208931C
	push {r3, r4, r5, lr}
	ldr r3, _02089418 ; =gSystem
	mov r1, #0x20
	ldr r2, [r3, #0x4c]
	add r4, r0, #0
	add r5, r2, #0
	tst r5, r1
	beq _02089336
	sub r1, #0x21
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089336:
	mov r1, #0x10
	tst r1, r2
	beq _02089346
	mov r1, #1
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089346:
	mov r1, #0x40
	add r5, r2, #0
	tst r5, r1
	beq _02089358
	sub r1, #0x43
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089358:
	mov r1, #0x80
	tst r1, r2
	beq _02089368
	mov r1, #3
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089368:
	ldr r2, [r3, #0x48]
	mov r1, #3
	tst r1, r2
	beq _02089382
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xb
	bl sub_0208B0F4
	pop {r3, r4, r5, pc}
_02089382:
	bl sub_0208AEC4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bgt _02089392
	beq _02089414
	b _020893F8
_02089392:
	cmp r0, #0xb
	bgt _020893F8
	cmp r0, #9
	blt _020893F8
	beq _020893A6
	cmp r0, #0xa
	beq _020893C6
	cmp r0, #0xb
	beq _020893E6
	b _020893F8
_020893A6:
	ldr r0, _0208941C ; =0x00000504
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #1
	bne _02089414
	ldr r0, _02089420 ; =0x000005DC
	bl PlaySE
	ldr r0, _0208941C ; =0x00000504
	mov r1, #2
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xd
	pop {r3, r4, r5, pc}
_020893C6:
	ldr r0, _02089424 ; =0x00000508
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #1
	bne _02089414
	ldr r0, _02089420 ; =0x000005DC
	bl PlaySE
	ldr r0, _02089424 ; =0x00000508
	mov r1, #3
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_020893E6:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xb
	bl sub_0208B0F4
	pop {r3, r4, r5, pc}
_020893F8:
	ldr r1, _02089428 ; =0x000007C4
	ldrb r2, [r4, r1]
	cmp r2, r0
	beq _02089410
	strb r0, [r4, r1]
	ldr r0, _02089420 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AB58
_02089410:
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089414:
	mov r0, #0xc
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089418: .word gSystem
_0208941C: .word 0x00000504
_02089420: .word 0x000005DC
_02089424: .word 0x00000508
_02089428: .word 0x000007C4
	thumb_func_end sub_0208931C

	thumb_func_start sub_0208942C
sub_0208942C: ; 0x0208942C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02089450 ; =0x00000504
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _0208944A
	mov r1, #8
	add r0, r4, #0
	mvn r1, r1
	bl sub_0208AB58
	mov r0, #0xc
	pop {r4, pc}
_0208944A:
	mov r0, #0xd
	pop {r4, pc}
	nop
_02089450: .word 0x00000504
	thumb_func_end sub_0208942C

	thumb_func_start sub_02089454
sub_02089454: ; 0x02089454
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02089474 ; =0x00000508
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _02089470
	add r0, r4, #0
	mov r1, #9
	bl sub_0208AB58
	mov r0, #0xc
	pop {r4, pc}
_02089470:
	mov r0, #0xe
	pop {r4, pc}
	.balign 4, 0
_02089474: .word 0x00000508
	thumb_func_end sub_02089454

	thumb_func_start sub_02089478
sub_02089478: ; 0x02089478
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _020895E8 ; =gSystem
	add r5, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	bne _0208948A
	b _020895E0
_0208948A:
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldrb r1, [r1, #0x11]
	cmp r1, #2
	bne _020894AE
	bl sub_0208A520
	add r6, r0, #0
	mov r0, #0x13
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	b _020894B4
_020894AE:
	bl sub_0208A520
	add r4, r0, #0
_020894B4:
	ldr r0, _020895EC ; =0x000007BE
	mov r2, #0
	strb r2, [r5, r0]
	ldr r0, _020895F0 ; =0x00000275
	mov r1, #0x13
	ldrb r6, [r5, r0]
	add r0, r4, #0
	bl GetMonData
	ldr r1, _020895F0 ; =0x00000275
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _020894DA
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #1
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_020894DA:
	ldr r0, _020895F4 ; =0x00000276
	mov r1, #0x14
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _020895F4 ; =0x00000276
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _020894FC
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #2
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_020894FC:
	ldr r0, _020895F8 ; =0x00000277
	mov r1, #0x15
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _020895F8 ; =0x00000277
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _0208951E
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #4
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_0208951E:
	mov r0, #0x9e
	lsl r0, r0, #2
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0
	bl GetMonData
	mov r1, #0x9e
	lsl r1, r1, #2
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _02089544
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #8
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_02089544:
	ldr r0, _020895FC ; =0x00000279
	mov r1, #0x17
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _020895FC ; =0x00000279
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _02089566
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #0x10
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_02089566:
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	bl GetMonData
	ldr r1, _02089600 ; =0x0000027A
	strb r0, [r5, r1]
	sub r1, #0x4e
	ldr r0, [r5, r1]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _02089584
	add r0, r4, #0
	bl FreeToHeap
_02089584:
	mov r1, #7
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x13
	bl LoadFontPal1
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r0, [r0, #4]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r2, _02089604 ; =0x000003E2
	mov r1, #1
	mov r3, #0xd
	bl LoadUserFrameGfx2
	ldr r0, _020895EC ; =0x000007BE
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _020895C8
	add r0, r5, #0
	mov r1, #0xfe
	bl sub_0208DDA0
	add sp, #8
	mov r0, #0x12
	pop {r4, r5, r6, pc}
_020895C8:
	add r0, r5, #0
	bl sub_0208E174
	add r0, r5, #0
	bl sub_0208BCD4
	add r0, r5, #0
	bl sub_0208BDC8
	add sp, #8
	mov r0, #0x11
	pop {r4, r5, r6, pc}
_020895E0:
	mov r0, #0x10
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_020895E8: .word gSystem
_020895EC: .word 0x000007BE
_020895F0: .word 0x00000275
_020895F4: .word 0x00000276
_020895F8: .word 0x00000277
_020895FC: .word 0x00000279
_02089600: .word 0x0000027A
_02089604: .word 0x000003E2
	thumb_func_end sub_02089478

	thumb_func_start sub_02089608
sub_02089608: ; 0x02089608
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02089650 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0208964A
	ldr r0, _02089654 ; =0x000007BE
	mov r1, #0
	ldrb r2, [r5, r0]
	mov r0, #1
_0208961E:
	add r4, r0, #0
	lsl r4, r1
	add r3, r2, #0
	tst r3, r4
	beq _02089640
	add r0, r5, #0
	bl sub_0208DDA0
	ldr r0, _02089654 ; =0x000007BE
	ldrb r1, [r5, r0]
	eor r1, r4
	strb r1, [r5, r0]
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0208964A
	mov r0, #0x12
	pop {r3, r4, r5, pc}
_02089640:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #5
	blo _0208961E
_0208964A:
	mov r0, #0x11
	pop {r3, r4, r5, pc}
	nop
_02089650: .word gSystem
_02089654: .word 0x000007BE
	thumb_func_end sub_02089608

	thumb_func_start sub_02089658
sub_02089658: ; 0x02089658
	ldr r0, _0208966C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _02089666
	mov r0, #0x15
	bx lr
_02089666:
	mov r0, #0x12
	bx lr
	nop
_0208966C: .word gSystem
	thumb_func_end sub_02089658

	thumb_func_start sub_02089670
sub_02089670: ; 0x02089670
	push {r3, lr}
	mov r0, #1
	mov r1, #0x13
	bl sub_020880CC
	mov r0, #0x16
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02089670

	thumb_func_start sub_02089680
sub_02089680: ; 0x02089680
	push {r3, lr}
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0208968E
	mov r0, #1
	b _02089690
_0208968E:
	mov r0, #0
_02089690:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02089680

	thumb_func_start sub_02089698
sub_02089698: ; 0x02089698
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _02089788 ; =0x000007BE
	add r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	beq _020896B0
	cmp r0, #1
	beq _020896F6
	cmp r0, #2
	beq _0208975E
	b _02089782
_020896B0:
	add r0, r3, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #0
	add r0, #0xd
	ldrb r0, [r4, r0]
	add r1, #0xf
	add r2, #0xa
	str r0, [sp, #4]
	add r0, r3, #0
	add r0, #0xe
	ldrb r0, [r4, r0]
	add r3, #0xb
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4]
	bl BgTilemapRectChangePalette
	ldr r1, _0208978C ; =0x000007CD
	ldr r0, [r4]
	ldrb r1, [r4, r1]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _02089788 ; =0x000007BE
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02089782
_020896F6:
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #0
	add r0, #0x10
	strb r1, [r4, r0]
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _02089782
	add r0, r3, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #0
	add r0, #0xd
	ldrb r0, [r4, r0]
	add r1, #0xf
	add r2, #0xa
	str r0, [sp, #4]
	add r0, r3, #0
	add r0, #0xe
	ldrb r0, [r4, r0]
	add r3, #0xb
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4]
	bl BgTilemapRectChangePalette
	ldr r1, _0208978C ; =0x000007CD
	ldr r0, [r4]
	ldrb r1, [r4, r1]
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, _02089790 ; =0x000007CE
	mov r0, #0
	strb r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x10
	ldrb r0, [r4, r0]
	sub r1, #0x10
	add r0, r0, #1
	strb r0, [r4, r1]
	b _02089782
_0208975E:
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #0
	add r0, #0x10
	strb r1, [r4, r0]
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _02089782
	mov r0, #0
	strb r0, [r4, r3]
	add r3, #0x11
	add sp, #0xc
	ldrb r0, [r4, r3]
	pop {r3, r4, pc}
_02089782:
	mov r0, #0xf
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02089788: .word 0x000007BE
_0208978C: .word 0x000007CD
_02089790: .word 0x000007CE
	thumb_func_end sub_02089698

	thumb_func_start sub_02089794
sub_02089794: ; 0x02089794
	push {r4, lr}
	ldr r1, _020897BC ; =0x000007C9
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #5
	bne _020897AA
	mov r1, #0
	mvn r1, r1
	bl sub_0208A2C0
	b _020897B0
_020897AA:
	mov r1, #1
	bl sub_0208A2C0
_020897B0:
	add r0, r4, #0
	bl sub_0208B118
	mov r0, #0x13
	pop {r4, pc}
	nop
_020897BC: .word 0x000007C9
	thumb_func_end sub_02089794

	thumb_func_start sub_020897C0
sub_020897C0: ; 0x020897C0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208A520
	mov r2, #0x8b
	lsl r2, r2, #2
	add r1, r0, #0
	ldr r0, [r4, r2]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _020897E2
	add r2, r2, #4
	add r0, r4, #0
	add r2, r4, r2
	bl sub_020897F0
	pop {r4, pc}
_020897E2:
	add r2, r2, #4
	add r0, r4, #0
	add r2, r4, r2
	bl sub_0208981C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020897C0

	thumb_func_start sub_020897F0
sub_020897F0: ; 0x020897F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x13
	add r6, r1, #0
	add r7, r2, #0
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0208981C
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020897F0

	thumb_func_start sub_0208981C
sub_0208981C: ; 0x0208981C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	bl AcquireMonLock
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xc]
	add r0, r5, #0
	bl Mon_GetBoxMon
	mov r2, #0x7a
	lsl r2, r2, #4
	add r6, r0, #0
	ldr r0, [r7, r2]
	add r2, #0xc
	ldr r2, [r7, r2]
	mov r1, #0xb
	bl ReadMsgDataIntoString
	ldr r0, _02089BC0 ; =0x000007A8
	mov r1, #0
	ldr r0, [r7, r0]
	add r2, r6, #0
	bl BufferBoxMonSpeciesName
	ldr r2, _02089BC0 ; =0x000007A8
	mov r1, #0x23
	ldr r0, [r7, r2]
	lsl r1, r1, #4
	add r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	bl StringExpandPlaceholders
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r7, r2]
	add r2, #0xc
	ldr r2, [r7, r2]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, _02089BC0 ; =0x000007A8
	mov r1, #0
	ldr r0, [r7, r0]
	add r2, r6, #0
	bl BufferBoxMonNickname
	ldr r2, _02089BC0 ; =0x000007A8
	mov r1, #0x8d
	ldr r0, [r7, r2]
	lsl r1, r1, #2
	add r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	bl StringExpandPlaceholders
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r7, r2]
	add r2, #0xc
	ldr r2, [r7, r2]
	mov r1, #0xe
	bl ReadMsgDataIntoString
	ldr r0, _02089BC0 ; =0x000007A8
	mov r1, #0
	ldr r0, [r7, r0]
	add r2, r6, #0
	bl BufferBoxMonOTName
	ldr r2, _02089BC0 ; =0x000007A8
	mov r1, #0x8e
	ldr r0, [r7, r2]
	lsl r1, r1, #2
	add r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	bl StringExpandPlaceholders
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xe]
	add r0, r5, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldrb r1, [r4, #0x12]
	mov r2, #0x7f
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #0x7f
	and r0, r2
	orr r0, r1
	strb r0, [r4, #0x12]
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x1f
	ldr r2, [r4, #0x50]
	ldr r1, _02089BC4 ; =0xEFFFFFFF
	lsr r0, r0, #3
	and r1, r2
	orr r0, r1
	str r0, [r4, #0x50]
	add r0, r5, #0
	mov r1, #0xb0
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208992C
	ldr r0, [r4, #0x50]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0208992C
	ldrb r1, [r4, #0x12]
	mov r0, #0x80
	bic r1, r0
	strb r1, [r4, #0x12]
	b _02089934
_0208992C:
	ldrb r1, [r4, #0x12]
	mov r0, #0x80
	orr r0, r1
	strb r0, [r4, #0x12]
_02089934:
	add r0, r5, #0
	bl GetMonGender
	ldrb r1, [r4, #0x13]
	mov r2, #3
	bic r1, r2
	mov r2, #3
	and r0, r2
	orr r0, r1
	strb r0, [r4, #0x13]
	add r0, r5, #0
	mov r1, #0x9b
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1a
	ldrb r1, [r4, #0x13]
	mov r2, #0xfc
	lsr r0, r0, #0x18
	bic r1, r2
	orr r0, r1
	strb r0, [r4, #0x13]
	add r0, r5, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #0x11]
	add r0, r5, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [r4, #0x14]
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	str r0, [r4, #0x18]
	add r0, r5, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x44
	strb r0, [r1]
	ldrb r1, [r4, #0x12]
	ldrh r0, [r4, #0xc]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	bl GetMonExpBySpeciesAndLevel
	str r0, [r4, #0x1c]
	ldrb r0, [r4, #0x12]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	cmp r1, #0x64
	bne _020899C0
	ldr r0, [r4, #0x1c]
	b _020899C8
_020899C0:
	ldrh r0, [r4, #0xc]
	add r1, r1, #1
	bl GetMonExpBySpeciesAndLevel
_020899C8:
	str r0, [r4, #0x20]
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x24]
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x26]
	add r0, r5, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x28]
	add r0, r5, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x2a]
	add r0, r5, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x2c]
	add r0, r5, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x2e]
	add r0, r5, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x30]
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x32
	strb r0, [r1]
	add r0, r5, #0
	bl GetMonNature
	add r1, r4, #0
	add r1, #0x33
	strb r0, [r1]
	mov r6, #0
_02089A3C:
	lsl r0, r6, #1
	add r0, r4, r0
	add r1, r6, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	ldr r1, [sp]
	mov r2, #0
	strh r0, [r1, #0x34]
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x3a
	bl GetMonData
	add r1, r4, r6
	add r1, #0x3c
	strb r0, [r1]
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x3e
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp]
	ldrh r0, [r0, #0x34]
	bl WazaGetMaxPp
	add r1, r4, r6
	add r1, #0x40
	strb r0, [r1]
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _02089A3C
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x45
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x46
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x15
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x47
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x48
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x17
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x49
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x4a
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #5
	add r0, #0x4b
	strb r1, [r0]
	mov r6, #0
_02089AF6:
	add r0, r5, #0
	add r1, r6, #0
	bl MonGetFlavorPreference
	cmp r0, #1
	bne _02089B0A
	add r0, r4, #0
	add r0, #0x4b
	strb r6, [r0]
	b _02089B14
_02089B0A:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #5
	blo _02089AF6
_02089B14:
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x4c
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x4e
	strh r0, [r1]
	add r0, r5, #0
	bl sub_0208AD64
	mov r1, #0xf
	ldr r2, [r4, #0x50]
	lsl r1, r1, #0x1c
	and r2, r1
	ldr r1, _02089BC8 ; =0x0FFFFFFF
	and r0, r1
	orr r0, r2
	str r0, [r4, #0x50]
	add r0, r5, #0
	bl Pokemon_IsImmuneToPokerus
	cmp r0, #1
	bne _02089B64
	ldr r1, [r4, #0x50]
	ldr r0, _02089BCC ; =0x3FFFFFFF
	and r1, r0
	mov r0, #2
	lsl r0, r0, #0x1e
	orr r0, r1
	str r0, [r4, #0x50]
	b _02089B9A
_02089B64:
	add r0, r5, #0
	bl Pokemon_HasPokerus
	cmp r0, #1
	bne _02089B92
	ldr r2, [r4, #0x50]
	ldr r1, _02089BCC ; =0x3FFFFFFF
	add r0, r4, #0
	and r2, r1
	add r1, r1, #1
	orr r1, r2
	str r1, [r4, #0x50]
	lsl r1, r1, #4
	lsr r1, r1, #4
	add r0, #0x50
	cmp r1, #7
	bne _02089B9A
	mov r1, #0xf
	ldr r2, [r0]
	lsl r1, r1, #0x1c
	and r1, r2
	str r1, [r0]
	b _02089B9A
_02089B92:
	ldr r1, [r4, #0x50]
	ldr r0, _02089BCC ; =0x3FFFFFFF
	and r0, r1
	str r0, [r4, #0x50]
_02089B9A:
	add r0, r5, #0
	bl MonIsShiny
	cmp r0, #1
	ldr r1, [r4, #0x50]
	bne _02089BAE
	mov r0, #2
	lsl r0, r0, #0x1c
	orr r0, r1
	b _02089BB2
_02089BAE:
	ldr r0, _02089BD0 ; =0xDFFFFFFF
	and r0, r1
_02089BB2:
	str r0, [r4, #0x50]
	mov r6, #0
	str r6, [r4, #0x54]
	str r6, [r4, #0x58]
	str r6, [r4, #0x5c]
	ldr r0, _02089BD4 ; =0x000007C6
	b _02089BD8
	.balign 4, 0
_02089BC0: .word 0x000007A8
_02089BC4: .word 0xEFFFFFFF
_02089BC8: .word 0x0FFFFFFF
_02089BCC: .word 0x3FFFFFFF
_02089BD0: .word 0xDFFFFFFF
_02089BD4: .word 0x000007C6
_02089BD8:
	str r6, [r4, #0x60]
	strb r6, [r7, r0]
_02089BDC:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl GetRibbonAttr
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02089C14
	lsr r0, r6, #5
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x1f
	add r2, r6, #0
	and r2, r1
	mov r1, #1
	ldr r3, [r0, #0x54]
	lsl r1, r2
	orr r1, r3
	str r1, [r0, #0x54]
	ldr r0, _02089C4C ; =0x000007C6
	ldrb r0, [r7, r0]
	add r1, r0, #1
	ldr r0, _02089C4C ; =0x000007C6
	strb r1, [r7, r0]
_02089C14:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #0x50
	blo _02089BDC
	mov r6, #0xa5
	mov r4, #0
	lsl r6, r6, #2
_02089C24:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xb5
	mov r2, #0
	bl GetMonData
	add r1, r7, r4
	strb r0, [r1, r6]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _02089C24
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ReleaseMonLock
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02089C4C: .word 0x000007C6
	thumb_func_end sub_0208981C

	thumb_func_start sub_02089C50
sub_02089C50: ; 0x02089C50
	push {r4, lr}
	sub sp, #8
	mov r2, #0xa
	add r4, r0, #0
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _02089CAA
	ldr r0, _02089CB0 ; =0x000007B8
	sub r2, #0x44
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	add r1, sp, #4
	mov r3, #1
	bl sub_020729A4
	mov r2, #0x8f
	lsl r2, r2, #2
	add r1, r2, #0
	ldrh r0, [r4, r2]
	sub r1, #0x83
	cmp r0, r1
	bne _02089C9A
	add r0, sp, #4
	ldrb r0, [r0]
	mov r1, #0
	sub r2, #0x10
	str r0, [sp]
	ldr r0, [r4, r2]
	mov r2, #0x64
	ldr r0, [r0, #0x28]
	add r3, r1, #0
	bl sub_02006EA0
	add sp, #8
	pop {r4, pc}
_02089C9A:
	add r2, #0x42
	ldrh r2, [r4, r2]
	add r1, sp, #4
	ldrb r1, [r1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_020062E0
_02089CAA:
	add sp, #8
	pop {r4, pc}
	nop
_02089CB0: .word 0x000007B8
	thumb_func_end sub_02089C50

	thumb_func_start sub_02089CB4
sub_02089CB4: ; 0x02089CB4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _02089CCE
	cmp r0, #1
	beq _02089CCE
	cmp r0, #2
	beq _02089CD6
	b _02089CDC
_02089CCE:
	ldr r0, _02089D3C ; =0x000007BC
	mov r1, #0
	strb r1, [r4, r0]
	b _02089CDC
_02089CD6:
	ldr r0, _02089D3C ; =0x000007BC
	mov r1, #1
	strb r1, [r4, r0]
_02089CDC:
	add r0, r4, #0
	bl sub_0208B448
	add r0, r4, #0
	bl sub_0208B5A8
	add r0, r4, #0
	bl sub_0208C2A0
	add r0, r4, #0
	bl sub_0208BD38
	add r0, r4, #0
	bl sub_0208BCD4
	add r0, r4, #0
	bl sub_0208C42C
	add r0, r4, #0
	bl sub_0208CBD4
	add r0, r4, #0
	bl sub_02089F98
	add r0, r4, #0
	bl sub_0208B9C8
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bne _02089D26
	add r0, r4, #0
	bl sub_0208A8F4
	pop {r4, pc}
_02089D26:
	add r0, r4, #0
	bl sub_0208B400
	add r0, r4, #0
	bl sub_0208BF9C
	add r0, r4, #0
	bl sub_0208BFD0
	pop {r4, pc}
	nop
_02089D3C: .word 0x000007BC
	thumb_func_end sub_02089CB4

	thumb_func_start sub_02089D40
sub_02089D40: ; 0x02089D40
	push {r3, r4, r5, r6}
	mov r6, #0
	strb r6, [r0, #0x15]
	add r0, #0x15
	mov r3, #1
_02089D4A:
	ldrb r5, [r1, r6]
	cmp r5, #4
	beq _02089D64
	add r2, r3, #0
	ldrb r4, [r0]
	lsl r2, r5
	orr r2, r4
	strb r2, [r0]
	add r2, r6, #1
	lsl r2, r2, #0x18
	lsr r6, r2, #0x18
	cmp r6, #4
	blo _02089D4A
_02089D64:
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_02089D40

	thumb_func_start sub_02089D68
sub_02089D68: ; 0x02089D68
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r1, _02089E10 ; =0x000007BC
	add r5, r0, #0
	ldrsb r1, [r5, r1]
	cmp r1, r4
	beq _02089E0C
	bl sub_0208C4E0
	ldr r0, _02089E10 ; =0x000007BC
	strb r4, [r5, r0]
	add r0, r5, #0
	bl sub_0208B448
	add r0, r5, #0
	bl sub_0208B5A8
	add r0, r5, #0
	bl sub_0208B89C
	add r0, r5, #0
	bl sub_0208B9C8
	add r0, r5, #0
	bl sub_0208C2A0
	add r0, r5, #0
	bl sub_0208BCD4
	add r0, r5, #0
	bl sub_0208C42C
	mov r0, #3
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x14
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r5]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	mov r0, #3
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x14
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #4
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r5]
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	bl sub_0208CBD4
	add r0, r5, #0
	bl sub_02089F98
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bne _02089E0C
	add r0, r5, #0
	bl sub_0208A950
_02089E0C:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089E10: .word 0x000007BC
	thumb_func_end sub_02089D68

	thumb_func_start sub_02089E14
sub_02089E14: ; 0x02089E14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02089E2C ; =0x000005E1
	add r4, r1, #0
	bl PlaySE
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02089D68
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089E2C: .word 0x000005E1
	thumb_func_end sub_02089E14

	thumb_func_start sub_02089E30
sub_02089E30: ; 0x02089E30
	push {r3, r4, r5, r6, r7, lr}
	add r3, r0, #0
	ldr r0, _02089E7C ; =0x000007BC
	add r2, r1, #0
	ldrsb r1, [r3, r0]
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r4, [r3, r0]
	mov ip, r1
	lsl r4, r4, #3
	lsr r4, r4, #0x1f
	bne _02089E7A
	sub r0, #0x54
	ldr r0, [r3, r0]
	mov r7, #0
	ldrb r0, [r0, #0x15]
	mov r6, #2
	mov r4, #1
_02089E54:
	add r1, r1, r2
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bpl _02089E60
	add r1, r6, #0
	b _02089E66
_02089E60:
	cmp r1, #2
	ble _02089E66
	add r1, r7, #0
_02089E66:
	add r5, r4, #0
	lsl r5, r1
	tst r5, r0
	beq _02089E54
	mov r0, ip
	cmp r1, r0
	beq _02089E7A
	add r0, r3, #0
	bl sub_02089E14
_02089E7A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02089E7C: .word 0x000007BC
	thumb_func_end sub_02089E30

	thumb_func_start sub_02089E80
sub_02089E80: ; 0x02089E80
	mov r2, #0x8b
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	ldrb r3, [r0, #0x15]
	mov r0, #1
	add r2, r0, #0
	lsl r2, r1
	add r1, r3, #0
	tst r1, r2
	bne _02089E96
	mov r0, #0
_02089E96:
	bx lr
	thumb_func_end sub_02089E80

	thumb_func_start sub_02089E98
sub_02089E98: ; 0x02089E98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0208E544
	add r5, r0, #0
	cmp r5, #0xff
	bne _02089EAA
	mov r0, #2
	pop {r3, r4, r5, pc}
_02089EAA:
	cmp r5, #9
	bhi _02089F4C
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02089EBA: ; jump table
	.short _02089ECE - _02089EBA - 2 ; case 0
	.short _02089EE6 - _02089EBA - 2 ; case 1
	.short _02089EE6 - _02089EBA - 2 ; case 2
	.short _02089F0A - _02089EBA - 2 ; case 3
	.short _02089F24 - _02089EBA - 2 ; case 4
	.short _02089F24 - _02089EBA - 2 ; case 5
	.short _02089F24 - _02089EBA - 2 ; case 6
	.short _02089F24 - _02089EBA - 2 ; case 7
	.short _02089F24 - _02089EBA - 2 ; case 8
	.short _02089F24 - _02089EBA - 2 ; case 9
_02089ECE:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02089E80
	cmp r0, #0
	beq _02089F4C
	lsl r1, r5, #0x18
	add r0, r4, #0
	asr r1, r1, #0x18
	bl sub_02089E14
	b _02089F4C
_02089EE6:
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _02089F4C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02089E80
	cmp r0, #0
	beq _02089F4C
	lsl r1, r5, #0x18
	add r0, r4, #0
	asr r1, r1, #0x18
	bl sub_02089E14
	b _02089F4C
_02089F0A:
	add r0, r4, #0
	mov r1, #1
	bl sub_0208ADB8
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r3, r4, r5, pc}
_02089F24:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	sub r5, r5, #4
	ldrb r0, [r0, #0x14]
	cmp r0, r5
	beq _02089F4C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0208A310
	cmp r0, #0
	beq _02089F4C
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_0208A234
	mov r0, #0x13
	pop {r3, r4, r5, pc}
_02089F4C:
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02089E98

	thumb_func_start sub_02089F50
sub_02089F50: ; 0x02089F50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r1, r2, #0
	mov r0, #0xa2
	mov r2, #0x13
	add r4, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	add r7, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	mov r3, #0
	lsl r1, r4, #0x18
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r0, [r5]
	lsr r1, r1, #0x18
	add r2, #0xc
	bl LoadRectToBgTilemapRect
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02089F50

	thumb_func_start sub_02089F98
sub_02089F98: ; 0x02089F98
	push {r3, r4, r5, lr}
	mov r1, #0x8b
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _02089FBC
	ldr r1, _0208A0DC ; =0x000007BC
	ldrsb r1, [r4, r1]
	cmp r1, #2
	bne _02089FBC
	ldr r1, [r4]
	mov r2, #0xb
	mov r3, #3
	bl sub_02089F50
	b _02089FD4
_02089FBC:
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E0 ; =_021039B8
	mov r3, #3
	ldr r2, [r2, r5]
	bl sub_02089F50
_02089FD4:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldrb r1, [r1, #0x12]
	cmp r1, #2
	bne _0208A024
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E4 ; =_021039B8 + 8
	mov r3, #6
	ldr r2, [r2, r5]
	bl sub_02089F50
	ldr r0, [r4]
	mov r1, #5
	mov r2, #0
	mov r3, #0x80
	bl ScheduleSetBgPosText
	ldr r0, [r4]
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	bne _0208A090
	add r0, r4, #0
	bl sub_0208AF70
	b _0208A090
_0208A024:
	add r0, #0x54
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	beq _0208A048
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E4 ; =_021039B8 + 8
	mov r3, #6
	ldr r2, [r2, r5]
	bl sub_02089F50
	b _0208A090
_0208A048:
	add r0, r4, #0
	mov r1, #2
	bl sub_02089E80
	cmp r0, #0
	beq _0208A06E
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E8 ; =_021039B8 + 4
	mov r3, #6
	ldr r2, [r2, r5]
	bl sub_02089F50
	b _0208A090
_0208A06E:
	ldr r0, _0208A0DC ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0208A084
	ldr r1, [r4]
	add r0, r4, #0
	mov r2, #0x4d
	mov r3, #6
	bl sub_02089F50
	b _0208A090
_0208A084:
	ldr r1, [r4]
	add r0, r4, #0
	mov r2, #0x4e
	mov r3, #6
	bl sub_02089F50
_0208A090:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _0208A0B2
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r1, #4
	ldr r0, [r4, r0]
	mov r2, #0x14
	add r3, r1, #0
	bl sub_020196E8
	add r0, r4, #0
	bl sub_0208B118
_0208A0B2:
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0208A0D8
	ldr r0, _0208A0DC ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0208A0CE
	add r0, r4, #0
	bl sub_0208A1A0
	pop {r3, r4, r5, pc}
_0208A0CE:
	cmp r0, #1
	bne _0208A0D8
	add r0, r4, #0
	bl sub_0208A0EC
_0208A0D8:
	pop {r3, r4, r5, pc}
	nop
_0208A0DC: .word 0x000007BC
_0208A0E0: .word _021039B8
_0208A0E4: .word _021039B8 + 8
_0208A0E8: .word _021039B8 + 4
	thumb_func_end sub_02089F98

	thumb_func_start sub_0208A0EC
sub_0208A0EC: ; 0x0208A0EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0x95
	add r6, r0, #0
	lsl r1, r1, #2
	ldrh r0, [r6, r1]
	add r1, r1, #2
	ldrh r1, [r6, r1]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0208A126
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208A112: ; jump table
	.short _0208A11C - _0208A112 - 2 ; case 0
	.short _0208A124 - _0208A112 - 2 ; case 1
	.short _0208A120 - _0208A112 - 2 ; case 2
	.short _0208A11C - _0208A112 - 2 ; case 3
	.short _0208A11C - _0208A112 - 2 ; case 4
_0208A11C:
	ldr r7, _0208A194 ; =0x0000F097
	b _0208A126
_0208A120:
	ldr r7, _0208A198 ; =0x0000F0B7
	b _0208A126
_0208A124:
	ldr r7, _0208A19C ; =0x0000F0D7
_0208A126:
	mov r1, #0x95
	lsl r1, r1, #2
	ldrh r0, [r6, r1]
	add r1, r1, #2
	ldrh r1, [r6, r1]
	mov r2, #0x30
	bl sub_02088068
	add r4, r0, #0
	add r0, r7, #0
	add r0, #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r5, #0
	str r0, [sp, #0x10]
_0208A144:
	cmp r4, #8
	blo _0208A14C
	ldr r2, [sp, #0x10]
	b _0208A152
_0208A14C:
	add r0, r7, r4
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_0208A152:
	mov r0, #5
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r3, r5, #0
	str r0, [sp, #8]
	mov r0, #0x11
	add r3, #0xa
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r6]
	mov r1, #3
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	cmp r4, #8
	bhs _0208A178
	mov r4, #0
	b _0208A17E
_0208A178:
	sub r4, #8
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_0208A17E:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #6
	blo _0208A144
	ldr r0, [r6]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0208A194: .word 0x0000F097
_0208A198: .word 0x0000F0B7
_0208A19C: .word 0x0000F0D7
	thumb_func_end sub_0208A0EC

	thumb_func_start sub_0208A1A0
sub_0208A1A0: ; 0x0208A1A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0208A228 ; =0x00000242
	add r6, r0, #0
	ldrb r0, [r6, r2]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	cmp r0, #0x64
	bhs _0208A1C8
	add r0, r2, #0
	add r1, r2, #0
	add r0, #0xa
	add r1, #0xe
	add r2, r2, #6
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	ldr r2, [r6, r2]
	sub r1, r1, r0
	sub r0, r2, r0
	b _0208A1CC
_0208A1C8:
	mov r1, #0
	add r0, r1, #0
_0208A1CC:
	mov r2, #0x38
	bl sub_02088068
	add r4, r0, #0
	mov r5, #0
	mov r7, #0x13
_0208A1D8:
	cmp r4, #8
	blo _0208A1E0
	ldr r2, _0208A22C ; =0x0000E03F
	b _0208A1E8
_0208A1E0:
	ldr r0, _0208A230 ; =0x0000E037
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_0208A1E8:
	str r7, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r3, r5, #0
	str r0, [sp, #8]
	mov r0, #0x11
	add r3, #9
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r6]
	mov r1, #6
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	cmp r4, #8
	bhs _0208A20C
	mov r4, #0
	b _0208A212
_0208A20C:
	sub r4, #8
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_0208A212:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #7
	blo _0208A1D8
	ldr r0, [r6]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208A228: .word 0x00000242
_0208A22C: .word 0x0000E03F
_0208A230: .word 0x0000E037
	thumb_func_end sub_0208A1A0

	thumb_func_start sub_0208A234
sub_0208A234: ; 0x0208A234
	push {r4, lr}
	mov r2, #0x8b
	add r4, r0, #0
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	strb r1, [r2, #0x14]
	bl sub_020897C0
	add r0, r4, #0
	bl sub_02089C50
	add r0, r4, #0
	bl sub_0208C57C
	add r0, r4, #0
	bl sub_0208C614
	add r0, r4, #0
	bl sub_0208C6B4
	add r0, r4, #0
	bl sub_02089F98
	add r0, r4, #0
	bl sub_0208E4B4
	add r0, r4, #0
	bl sub_0208B448
	add r0, r4, #0
	bl sub_0208BA60
	add r0, r4, #0
	bl sub_0208B5A8
	add r0, r4, #0
	bl sub_0208B89C
	add r0, r4, #0
	bl sub_0208B9C8
	add r0, r4, #0
	bl sub_0208C2A0
	add r0, r4, #0
	bl sub_0208BE70
	add r0, r4, #0
	bl sub_0208B48C
	add r0, r4, #0
	bl sub_0208B4EC
	add r0, r4, #0
	bl sub_0208BCD4
	add r0, r4, #0
	bl sub_0208BD38
	add r0, r4, #0
	bl sub_0208CBD4
	add r0, r4, #0
	bl sub_0208B400
	add r0, r4, #0
	bl sub_0208BFD0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208A234

	thumb_func_start sub_0208A2C0
sub_0208A2C0: ; 0x0208A2C0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208A2E0
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0208A2DC
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_0208A234
_0208A2DC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208A2C0

	thumb_func_start sub_0208A2E0
sub_0208A2E0: ; 0x0208A2E0
	push {r3, lr}
	mov r2, #0x8b
	lsl r2, r2, #2
	ldr r2, [r0, r2]
	ldrb r2, [r2, #0x11]
	cmp r2, #0
	beq _0208A2F8
	cmp r2, #1
	beq _0208A2FE
	cmp r2, #2
	beq _0208A304
	b _0208A30A
_0208A2F8:
	bl sub_0208A3F4
	pop {r3, pc}
_0208A2FE:
	bl sub_0208A45C
	pop {r3, pc}
_0208A304:
	bl sub_0208A4B8
	pop {r3, pc}
_0208A30A:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	thumb_func_end sub_0208A2E0

	thumb_func_start sub_0208A310
sub_0208A310: ; 0x0208A310
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r5, r1, #0
	ldrb r0, [r2, #0x11]
	cmp r0, #0
	beq _0208A32C
	cmp r0, #1
	beq _0208A35C
	cmp r0, #2
	beq _0208A396
	b _0208A3C6
_0208A32C:
	bl sub_02070D90
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r6, r5, #0
	ldr r4, [r1]
	mul r6, r0
	add r0, r4, r6
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A3C6
	add r0, r4, r6
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A3C6
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A35C:
	ldrb r0, [r2, #0x13]
	cmp r5, r0
	bge _0208A3C6
	ldr r0, [r2]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A3C6
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A392
	add r0, r4, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A3C6
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A392:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A396:
	bl sub_02070D94
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r6, r5, #0
	ldr r4, [r1]
	mul r6, r0
	add r0, r4, r6
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A3C6
	add r0, r4, r6
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A3C6
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A3C6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208A310

	thumb_func_start sub_0208A3CC
sub_0208A3CC: ; 0x0208A3CC
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	ldrb r1, [r1, #0x12]
	cmp r1, #3
	bne _0208A3DC
	mov r0, #0
	bx lr
_0208A3DC:
	ldr r1, _0208A3F0 ; =0x000007BC
	ldrsb r0, [r0, r1]
	cmp r0, #0
	beq _0208A3EC
	cmp r0, #3
	beq _0208A3EC
	mov r0, #0
	bx lr
_0208A3EC:
	mov r0, #1
	bx lr
	.balign 4, 0
_0208A3F0: .word 0x000007BC
	thumb_func_end sub_0208A3CC

	thumb_func_start sub_0208A3F4
sub_0208A3F4: ; 0x0208A3F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	str r1, [sp]
	ldr r1, [r5, r0]
	mov r0, #0x14
	ldrsb r4, [r1, r0]
_0208A404:
	ldr r0, [sp]
	add r0, r4, r0
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	bmi _0208A41A
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x13]
	cmp r4, r0
	blt _0208A420
_0208A41A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0208A420:
	bl sub_02070D90
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r7, r4, #0
	ldr r6, [r1]
	mul r7, r0
	add r0, r6, r7
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A404
	add r0, r6, r7
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A456
	add r0, r5, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A404
_0208A456:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0208A3F4

	thumb_func_start sub_0208A45C
sub_0208A45C: ; 0x0208A45C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	add r7, r1, #0
	ldr r1, [r5, r0]
	mov r0, #0x14
	ldrsb r4, [r1, r0]
_0208A46C:
	add r0, r4, r7
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	bmi _0208A480
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrb r0, [r1, #0x13]
	cmp r4, r0
	blt _0208A486
_0208A480:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0208A486:
	ldr r0, [r1]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A46C
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A4B4
	add r0, r5, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A46C
_0208A4B4:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208A45C

	thumb_func_start sub_0208A4B8
sub_0208A4B8: ; 0x0208A4B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	str r1, [sp]
	ldr r1, [r5, r0]
	mov r0, #0x14
	ldrsb r4, [r1, r0]
_0208A4C8:
	ldr r0, [sp]
	add r0, r4, r0
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	bmi _0208A4DE
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x13]
	cmp r4, r0
	blt _0208A4E4
_0208A4DE:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0208A4E4:
	bl sub_02070D94
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r7, r4, #0
	ldr r6, [r1]
	mul r7, r0
	add r0, r6, r7
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A4C8
	add r0, r6, r7
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A51A
	add r0, r5, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A4C8
_0208A51A:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0208A4B8

	thumb_func_start sub_0208A520
sub_0208A520: ; 0x0208A520
	push {r4, lr}
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r4, [r0, r1]
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	beq _0208A538
	cmp r0, #1
	beq _0208A546
	cmp r0, #2
	beq _0208A550
	b _0208A55E
_0208A538:
	bl sub_02070D90
	ldrb r1, [r4, #0x14]
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_0208A546:
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyMonByIndex
	pop {r4, pc}
_0208A550:
	bl sub_02070D94
	ldrb r1, [r4, #0x14]
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_0208A55E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208A520

	thumb_func_start sub_0208A564
sub_0208A564: ; 0x0208A564
	push {r4, lr}
	ldr r1, _0208A630 ; =0x000007BE
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0208A57A
	cmp r1, #1
	beq _0208A5B6
	cmp r1, #2
	beq _0208A5E2
	b _0208A62A
_0208A57A:
	ldr r0, _0208A634 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0208A634 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	mov r2, #0
	ldr r0, [r4]
	mov r1, #5
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4]
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0x44
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0208A630 ; =0x000007BE
	mov r1, #1
	strb r1, [r4, r0]
	b _0208A62A
_0208A5B6:
	ldr r0, [r4]
	mov r1, #5
	bl Bg_GetXpos
	cmp r0, #0x80
	ldr r0, [r4]
	blt _0208A5D6
	mov r1, #5
	mov r2, #0
	mov r3, #0x80
	bl ScheduleSetBgPosText
	ldr r0, _0208A630 ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208A62A
_0208A5D6:
	mov r1, #5
	mov r2, #1
	mov r3, #0x40
	bl ScheduleSetBgPosText
	b _0208A62A
_0208A5E2:
	bl sub_0208DB1C
	add r0, r4, #0
	bl sub_0208A79C
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE0
	add r0, r4, #0
	bl sub_0208C068
	mov r0, #9
	lsl r0, r0, #6
	ldrb r1, [r4, r0]
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0208A616
	ldr r0, _0208A638 ; =0x00000434
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DCE0
_0208A616:
	ldr r0, _0208A634 ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0208A630 ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208A62A:
	mov r0, #0
	pop {r4, pc}
	nop
_0208A630: .word 0x000007BE
_0208A634: .word 0x00000428
_0208A638: .word 0x00000434
	thumb_func_end sub_0208A564

	thumb_func_start sub_0208A63C
sub_0208A63C: ; 0x0208A63C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208A70C ; =0x000007BE
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0208A652
	cmp r0, #1
	beq _0208A69C
	cmp r0, #2
	beq _0208A6C8
	b _0208A706
_0208A652:
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE0
	ldr r0, _0208A710 ; =0x00000434
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCE0
	ldr r0, _0208A714 ; =0x0000044C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCE0
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE0
	ldr r0, _0208A718 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl sub_0208DB58
	add r0, r4, #0
	bl sub_0208DAD4
	ldr r0, _0208A70C ; =0x000007BE
	mov r1, #1
	strb r1, [r4, r0]
	b _0208A706
_0208A69C:
	ldr r0, [r4]
	mov r1, #5
	bl Bg_GetXpos
	cmp r0, #0x80
	ldr r0, [r4]
	bgt _0208A6BC
	mov r2, #0
	mov r1, #5
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, _0208A70C ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208A706
_0208A6BC:
	mov r1, #5
	mov r2, #2
	mov r3, #0x40
	bl ScheduleSetBgPosText
	b _0208A706
_0208A6C8:
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x64
	bl ScheduleWindowCopyToVram
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x44
	bl ScheduleWindowCopyToVram
	ldr r0, _0208A718 ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl sub_0208B400
	ldr r0, _0208A70C ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208A706:
	mov r0, #0
	pop {r4, pc}
	nop
_0208A70C: .word 0x000007BE
_0208A710: .word 0x00000434
_0208A714: .word 0x0000044C
_0208A718: .word 0x00000428
	thumb_func_end sub_0208A63C

	thumb_func_start sub_0208A71C
sub_0208A71C: ; 0x0208A71C
	push {r4, r5, r6, r7}
	add r5, r0, #0
	ldr r0, _0208A798 ; =0x000007BD
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r4, r0, #0x1c
	lsl r0, r4, #0x18
	asr r2, r0, #0x18
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	ldrb r0, [r3, #0x12]
	cmp r0, #2
	bne _0208A746
	ldrh r0, [r3, #0x18]
	cmp r0, #0
	beq _0208A742
	mov r3, #4
	b _0208A748
_0208A742:
	mov r3, #3
	b _0208A748
_0208A746:
	mov r3, #3
_0208A748:
	mov r6, #0x99
	mov r0, #0
	lsl r6, r6, #2
_0208A74E:
	add r2, r2, r1
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bpl _0208A75A
	add r2, r3, #0
	b _0208A760
_0208A75A:
	cmp r2, r3
	ble _0208A760
	add r2, r0, #0
_0208A760:
	cmp r2, #4
	beq _0208A772
	lsl r7, r2, #1
	add r7, r5, r7
	ldrh r7, [r7, r6]
	cmp r7, #0
	bne _0208A772
	cmp r2, r4
	bne _0208A74E
_0208A772:
	cmp r2, r4
	beq _0208A790
	ldr r3, _0208A798 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r3]
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r5, r3]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0208A790:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0208A798: .word 0x000007BD
	thumb_func_end sub_0208A71C

	thumb_func_start sub_0208A79C
sub_0208A79C: ; 0x0208A79C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208BBDC
	ldr r0, _0208A7F4 ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	cmp r1, #4
	bne _0208A7D0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrh r1, [r0, #0x18]
	cmp r1, #0
	beq _0208A7C4
	add r0, r4, #0
	bl sub_0208A7F8
	pop {r4, pc}
_0208A7C4:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0208A7F8
	pop {r4, pc}
_0208A7D0:
	cmp r1, #5
	bne _0208A7E0
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0208A7F8
	pop {r4, pc}
_0208A7E0:
	lsl r1, r1, #1
	add r2, r4, r1
	mov r1, #0x99
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	add r0, r4, #0
	bl sub_0208A7F8
	pop {r4, pc}
	nop
_0208A7F4: .word 0x000007BD
	thumb_func_end sub_0208A79C

	thumb_func_start sub_0208A7F8
sub_0208A7F8: ; 0x0208A7F8
	push {r3, r4, r5, lr}
	mov r2, #0
	add r4, r1, #0
	mvn r2, r2
	add r5, r0, #0
	cmp r4, r2
	bne _0208A816
	bl sub_0208DAD4
	ldr r0, _0208A830 ; =0x0000044C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	pop {r3, r4, r5, pc}
_0208A816:
	bl sub_0208D9A0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0208BB8C
	ldr r0, _0208A830 ; =0x0000044C
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	pop {r3, r4, r5, pc}
	nop
_0208A830: .word 0x0000044C
	thumb_func_end sub_0208A7F8

	thumb_func_start sub_0208A834
sub_0208A834: ; 0x0208A834
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl sub_0208A520
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldrb r1, [r1, #0x11]
	cmp r1, #2
	ldr r1, _0208A8F0 ; =0x000007BD
	bne _0208A85A
	ldrb r2, [r4, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl BoxMonSwapMoves
	b _0208A868
_0208A85A:
	ldrb r2, [r4, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl MonSwapMoves
_0208A868:
	ldr r0, _0208A8F0 ; =0x000007BD
	mov r1, #0x99
	ldrb r6, [r4, r0]
	lsl r1, r1, #2
	add r5, r4, r1
	lsl r2, r6, #0x1c
	lsl r6, r6, #0x18
	lsr r6, r6, #0x1c
	lsl r6, r6, #1
	lsr r3, r2, #0x1b
	add r6, r4, r6
	ldrh r2, [r5, r3]
	ldrh r6, [r6, r1]
	strh r6, [r5, r3]
	ldrb r3, [r4, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	lsl r3, r3, #1
	add r3, r4, r3
	strh r2, [r3, r1]
	add r2, r1, #0
	add r2, #8
	ldrb r6, [r4, r0]
	add r5, r4, r2
	lsl r2, r6, #0x1c
	lsl r6, r6, #0x18
	lsr r6, r6, #0x1c
	add r7, r4, r6
	add r6, r1, #0
	lsr r3, r2, #0x1c
	add r6, #8
	ldrb r2, [r5, r3]
	ldrb r6, [r7, r6]
	strb r6, [r5, r3]
	ldrb r3, [r4, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	add r5, r4, r3
	add r3, r1, #0
	add r3, #8
	strb r2, [r5, r3]
	add r2, r1, #0
	add r2, #0xc
	ldrb r6, [r4, r0]
	add r5, r4, r2
	lsl r2, r6, #0x1c
	lsl r6, r6, #0x18
	lsr r6, r6, #0x1c
	add r7, r4, r6
	add r6, r1, #0
	lsr r3, r2, #0x1c
	add r6, #0xc
	ldrb r2, [r5, r3]
	ldrb r6, [r7, r6]
	strb r6, [r5, r3]
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r3, r4, r0
	add r0, r1, #0
	add r0, #0xc
	strb r2, [r3, r0]
	sub r1, #0x38
	ldr r0, [r4, r1]
	mov r2, #1
	str r2, [r0, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208A8F0: .word 0x000007BD
	thumb_func_end sub_0208A834

	thumb_func_start sub_0208A8F4
sub_0208A8F4: ; 0x0208A8F4
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0
	ldr r0, [r4]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	bl sub_0208DB1C
	add r0, r4, #0
	bl sub_0208A79C
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE0
	add r0, r4, #0
	bl sub_0208C068
	mov r0, #9
	lsl r0, r0, #6
	ldrb r1, [r4, r0]
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0208A93A
	ldr r0, _0208A948 ; =0x00000434
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DCE0
_0208A93A:
	ldr r0, _0208A94C ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
	nop
_0208A948: .word 0x00000434
_0208A94C: .word 0x00000428
	thumb_func_end sub_0208A8F4

	thumb_func_start sub_0208A950
sub_0208A950: ; 0x0208A950
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208DB1C
	add r0, r4, #0
	bl sub_0208A79C
	add r0, r4, #0
	bl sub_0208C068
	ldr r0, _0208A9BC ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0208A9A4
	add r0, r4, #0
	bl sub_0208C208
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE0
	mov r0, #9
	lsl r0, r0, #6
	ldrb r1, [r4, r0]
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0208A996
	ldr r0, _0208A9C0 ; =0x00000434
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DCE0
_0208A996:
	ldr r0, [r4]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	pop {r4, pc}
_0208A9A4:
	add r0, r4, #0
	bl sub_0208C0E8
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4]
	mov r1, #2
	add r3, #0xfd
	bl ScheduleSetBgPosText
	pop {r4, pc}
	nop
_0208A9BC: .word 0x000007BC
_0208A9C0: .word 0x00000434
	thumb_func_end sub_0208A950

	thumb_func_start sub_0208A9C4
sub_0208A9C4: ; 0x0208A9C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208AA8C ; =0x000007BE
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0208A9DA
	cmp r0, #1
	beq _0208AA32
	cmp r0, #2
	beq _0208AA5E
	b _0208AA86
_0208A9DA:
	mov r2, #0
	ldr r0, [r4]
	mov r1, #5
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4]
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	ldr r0, _0208AA90 ; =0x00000428
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _0208AA90 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0208AA94 ; =0x000007C5
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #1
	sub r0, r0, #7
	strb r1, [r4, r0]
	b _0208AA86
_0208AA32:
	ldr r0, [r4]
	mov r1, #5
	bl Bg_GetYpos
	cmp r0, #0x48
	ldr r0, [r4]
	blt _0208AA52
	mov r1, #5
	mov r2, #3
	mov r3, #0x48
	bl ScheduleSetBgPosText
	ldr r0, _0208AA8C ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208AA86
_0208AA52:
	mov r1, #5
	mov r2, #4
	mov r3, #0x24
	bl ScheduleSetBgPosText
	b _0208AA86
_0208AA5E:
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _0208AA98 ; =0x0000050C
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AB58
	ldr r0, _0208AA8C ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208AA86:
	mov r0, #0
	pop {r4, pc}
	nop
_0208AA8C: .word 0x000007BE
_0208AA90: .word 0x00000428
_0208AA94: .word 0x000007C5
_0208AA98: .word 0x0000050C
	thumb_func_end sub_0208A9C4

	thumb_func_start sub_0208AA9C
sub_0208AA9C: ; 0x0208AA9C
	push {r4, lr}
	ldr r1, _0208AB50 ; =0x000007BE
	add r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0208AAB2
	cmp r0, #1
	beq _0208AAE2
	cmp r0, #2
	beq _0208AB0E
	b _0208AB4A
_0208AAB2:
	mov r2, #0
	add r0, r1, #6
	strb r2, [r4, r0]
	add r0, r1, #7
	strb r2, [r4, r0]
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl sub_0208C2A0
	ldr r0, _0208AB50 ; =0x000007BE
	mov r1, #1
	strb r1, [r4, r0]
	b _0208AB4A
_0208AAE2:
	ldr r0, [r4]
	mov r1, #5
	bl Bg_GetYpos
	cmp r0, #0
	ldr r0, [r4]
	bgt _0208AB02
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	ldr r0, _0208AB50 ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208AB4A
_0208AB02:
	mov r1, #5
	add r2, r1, #0
	mov r3, #0x24
	bl ScheduleSetBgPosText
	b _0208AB4A
_0208AB0E:
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	ldr r0, _0208AB54 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _0208AB54 ; =0x00000428
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _0208AB50 ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208AB4A:
	mov r0, #0
	pop {r4, pc}
	nop
_0208AB50: .word 0x000007BE
_0208AB54: .word 0x00000428
	thumb_func_end sub_0208AA9C

	thumb_func_start sub_0208AB58
sub_0208AB58: ; 0x0208AB58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0208ACC4 ; =0x000007C4
	add r4, r1, #0
	add r1, r0, #1
	ldrb r7, [r5, r0]
	ldrb r6, [r5, r1]
	cmp r4, #1
	bne _0208AB80
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	cmp r1, #2
	beq _0208AB94
	ldr r0, _0208ACC4 ; =0x000007C4
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	b _0208AC34
_0208AB80:
	mov r2, #0
	mvn r2, r2
	cmp r4, r2
	bne _0208ABA0
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	cmp r1, #0
	bne _0208AB96
_0208AB94:
	b _0208ACC0
_0208AB96:
	ldr r0, _0208ACC4 ; =0x000007C4
	ldrb r1, [r5, r0]
	sub r1, r1, #1
	strb r1, [r5, r0]
	b _0208AC34
_0208ABA0:
	cmp r4, #3
	bne _0208ABD4
	cmp r7, #6
	blo _0208ABCE
	add r2, r6, #1
	lsl r1, r2, #3
	add r1, r2, r1
	add r2, r0, #2
	ldrb r2, [r5, r2]
	cmp r1, r2
	bge _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	add r2, r1, #1
	add r1, r0, #1
	strb r2, [r5, r1]
	ldrb r0, [r5, r0]
	mov r1, #3
	bl _s32_div_f
	ldr r0, _0208ACC4 ; =0x000007C4
	strb r1, [r5, r0]
	b _0208AC34
_0208ABCE:
	add r1, r7, #3
	strb r1, [r5, r0]
	b _0208AC34
_0208ABD4:
	sub r1, r2, #2
	cmp r4, r1
	bne _0208AC02
	cmp r7, #2
	bhi _0208ABFC
	cmp r6, #0
	beq _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	sub r2, r1, #1
	add r1, r0, #1
	strb r2, [r5, r1]
	ldrb r0, [r5, r0]
	mov r1, #3
	bl _s32_div_f
	ldr r0, _0208ACC4 ; =0x000007C4
	add r1, r1, #6
	strb r1, [r5, r0]
	b _0208AC34
_0208ABFC:
	sub r1, r7, #3
	strb r1, [r5, r0]
	b _0208AC34
_0208AC02:
	cmp r4, #9
	bne _0208AC20
	add r2, r6, #1
	lsl r1, r2, #3
	add r1, r2, r1
	add r2, r0, #2
	ldrb r2, [r5, r2]
	cmp r1, r2
	bge _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	add r0, r0, #1
	add r1, r1, #1
	strb r1, [r5, r0]
	b _0208AC34
_0208AC20:
	sub r2, #8
	cmp r4, r2
	bne _0208AC34
	cmp r6, #0
	beq _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	add r0, r0, #1
	sub r1, r1, #1
	strb r1, [r5, r0]
_0208AC34:
	ldr r0, _0208ACC4 ; =0x000007C4
	ldrb r1, [r5, r0]
	cmp r7, r1
	bne _0208AC44
	add r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r6, r0
	beq _0208AC56
_0208AC44:
	cmp r4, #9
	beq _0208AC56
	mov r0, #8
	mvn r0, r0
	cmp r4, r0
	beq _0208AC56
	ldr r0, _0208ACC8 ; =0x000005DC
	bl PlaySE
_0208AC56:
	ldr r1, _0208ACC4 ; =0x000007C4
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0208ACDC
	ldr r1, _0208ACCC ; =0x000007C7
	strb r0, [r5, r1]
	add r0, r5, #0
	bl sub_0208C380
	ldr r0, _0208ACD0 ; =0x000007C5
	ldrb r0, [r5, r0]
	cmp r6, r0
	beq _0208AC78
	add r0, r5, #0
	bl sub_0208C320
_0208AC78:
	add r0, r5, #0
	bl sub_0208D7C4
	ldr r0, _0208ACD0 ; =0x000007C5
	ldrb r0, [r5, r0]
	cmp r0, #0
	ldr r0, _0208ACD4 ; =0x00000504
	beq _0208AC92
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _0208AC9A
_0208AC92:
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0208AC9A:
	ldr r0, _0208ACD0 ; =0x000007C5
	ldrb r1, [r5, r0]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	add r2, r1, #1
	lsl r1, r2, #3
	add r1, r2, r1
	cmp r1, r0
	ldr r0, _0208ACD8 ; =0x00000508
	bge _0208ACB8
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
_0208ACB8:
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0208ACC0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208ACC4: .word 0x000007C4
_0208ACC8: .word 0x000005DC
_0208ACCC: .word 0x000007C7
_0208ACD0: .word 0x000007C5
_0208ACD4: .word 0x00000504
_0208ACD8: .word 0x00000508
	thumb_func_end sub_0208AB58

	thumb_func_start sub_0208ACDC
sub_0208ACDC: ; 0x0208ACDC
	push {r4, r5, r6, r7}
	ldr r2, _0208AD30 ; =0x000007C5
	mov r6, #0
	ldrb r3, [r0, r2]
	add r4, r6, #0
	lsl r2, r3, #3
	add r2, r3, r2
	add r1, r1, r2
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	mov r1, #0xa1
	mov r2, #1
	lsl r1, r1, #2
_0208ACF6:
	mov r3, #0x1f
	add r7, r4, #0
	and r7, r3
	add r3, r2, #0
	lsl r3, r7
	lsr r7, r4, #5
	lsl r7, r7, #2
	add r7, r0, r7
	ldr r7, [r7, r1]
	tst r3, r7
	beq _0208AD1E
	cmp r5, r6
	bne _0208AD18
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, r7}
	bx lr
_0208AD18:
	add r3, r6, #1
	lsl r3, r3, #0x18
	lsr r6, r3, #0x18
_0208AD1E:
	add r3, r4, #1
	lsl r3, r3, #0x10
	lsr r4, r3, #0x10
	cmp r4, #0x50
	blo _0208ACF6
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0208AD30: .word 0x000007C5
	thumb_func_end sub_0208ACDC

	thumb_func_start sub_0208AD34
sub_0208AD34: ; 0x0208AD34
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	str r0, [r5, #8]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r5, #0x10]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208AD34

	thumb_func_start sub_0208AD54
sub_0208AD54: ; 0x0208AD54
	mov r0, #0x40
	bx lr
	thumb_func_end sub_0208AD54

	thumb_func_start sub_0208AD58
sub_0208AD58: ; 0x0208AD58
	mov r0, #0x41
	bx lr
	thumb_func_end sub_0208AD58

	thumb_func_start sub_0208AD5C
sub_0208AD5C: ; 0x0208AD5C
	mov r0, #0x3f
	bx lr
	thumb_func_end sub_0208AD5C

	thumb_func_start sub_0208AD60
sub_0208AD60: ; 0x0208AD60
	mov r0, #0x3e
	bx lr
	thumb_func_end sub_0208AD60

	thumb_func_start sub_0208AD64
sub_0208AD64: ; 0x0208AD64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0208AD84
	mov r0, #6
	pop {r3, r4, r5, pc}
_0208AD84:
	mov r0, #0x88
	tst r0, r4
	beq _0208AD8E
	mov r0, #4
	pop {r3, r4, r5, pc}
_0208AD8E:
	mov r0, #7
	add r1, r4, #0
	tst r1, r0
	beq _0208AD9A
	mov r0, #3
	pop {r3, r4, r5, pc}
_0208AD9A:
	mov r1, #0x10
	tst r1, r4
	beq _0208ADA4
	mov r0, #5
	pop {r3, r4, r5, pc}
_0208ADA4:
	mov r1, #0x20
	tst r1, r4
	beq _0208ADAE
	mov r0, #2
	pop {r3, r4, r5, pc}
_0208ADAE:
	mov r1, #0x40
	tst r1, r4
	beq _0208ADB6
	mov r0, #1
_0208ADB6:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208AD64

	thumb_func_start sub_0208ADB8
sub_0208ADB8: ; 0x0208ADB8
	push {r3, lr}
	mov r2, #0x8b
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _0208ADCA
	bl sub_02018410
_0208ADCA:
	pop {r3, pc}
	thumb_func_end sub_0208ADB8

	thumb_func_start sub_0208ADCC
sub_0208ADCC: ; 0x0208ADCC
	ldr r3, _0208ADD4 ; =sub_02025224
	ldr r0, _0208ADD8 ; =_021038D4
	bx r3
	nop
_0208ADD4: .word sub_02025224
_0208ADD8: .word _021038D4
	thumb_func_end sub_0208ADCC

	thumb_func_start sub_0208ADDC
sub_0208ADDC: ; 0x0208ADDC
	push {r3, lr}
	ldr r0, _0208AE00 ; =_021038D4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0208ADFE
	ldr r0, _0208AE04 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208ADFA
	mov r0, #4
	pop {r3, pc}
_0208ADFA:
	mov r0, #0
	mvn r0, r0
_0208ADFE:
	pop {r3, pc}
	.balign 4, 0
_0208AE00: .word _021038D4
_0208AE04: .word _021038AC
	thumb_func_end sub_0208ADDC

	thumb_func_start sub_0208AE08
sub_0208AE08: ; 0x0208AE08
	push {r3, lr}
	ldr r0, _0208AE3C ; =_021038D4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0208AE38
	ldr r0, _0208AE40 ; =_021038B0
	bl sub_02025320
	cmp r0, #1
	bne _0208AE26
	mov r0, #4
	pop {r3, pc}
_0208AE26:
	ldr r0, _0208AE44 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208AE34
	mov r0, #5
	pop {r3, pc}
_0208AE34:
	mov r0, #0
	mvn r0, r0
_0208AE38:
	pop {r3, pc}
	nop
_0208AE3C: .word _021038D4
_0208AE40: .word _021038B0
_0208AE44: .word _021038AC
	thumb_func_end sub_0208AE08

	thumb_func_start sub_0208AE48
sub_0208AE48: ; 0x0208AE48
	push {r3, lr}
	ldr r0, _0208AE7C ; =_021038D4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0208AE78
	ldr r0, _0208AE80 ; =_021038B4
	bl sub_02025320
	cmp r0, #1
	bne _0208AE66
	mov r0, #4
	pop {r3, pc}
_0208AE66:
	ldr r0, _0208AE84 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208AE74
	mov r0, #5
	pop {r3, pc}
_0208AE74:
	mov r0, #0
	mvn r0, r0
_0208AE78:
	pop {r3, pc}
	nop
_0208AE7C: .word _021038D4
_0208AE80: .word _021038B4
_0208AE84: .word _021038AC
	thumb_func_end sub_0208AE48

	thumb_func_start sub_0208AE88
sub_0208AE88: ; 0x0208AE88
	push {r3, lr}
	ldr r0, _0208AEAC ; =_021038B4
	bl sub_02025320
	cmp r0, #1
	bne _0208AE98
	mov r0, #0
	pop {r3, pc}
_0208AE98:
	ldr r0, _0208AEB0 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208AEA6
	mov r0, #1
	pop {r3, pc}
_0208AEA6:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	.balign 4, 0
_0208AEAC: .word _021038B4
_0208AEB0: .word _021038AC
	thumb_func_end sub_0208AE88

	thumb_func_start sub_0208AEB4
sub_0208AEB4: ; 0x0208AEB4
	ldr r3, _0208AEBC ; =sub_02025224
	ldr r0, _0208AEC0 ; =_021038B8
	bx r3
	nop
_0208AEBC: .word sub_02025224
_0208AEC0: .word _021038B8
	thumb_func_end sub_0208AEB4

	thumb_func_start sub_0208AEC4
sub_0208AEC4: ; 0x0208AEC4
	ldr r3, _0208AECC ; =sub_02025224
	ldr r0, _0208AED0 ; =_021039E8
	bx r3
	nop
_0208AECC: .word sub_02025224
_0208AED0: .word _021039E8
	thumb_func_end sub_0208AEC4

	thumb_func_start sub_0208AED4
sub_0208AED4: ; 0x0208AED4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208AF00 ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0208AF04 ; =0x0000042C
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl sub_0208BCB4
	add r0, r4, #0
	mov r1, #1
	bl sub_0208AF08
	mov r0, #9
	pop {r4, pc}
	nop
_0208AF00: .word 0x00000428
_0208AF04: .word 0x0000042C
	thumb_func_end sub_0208AED4

	thumb_func_start sub_0208AF08
sub_0208AF08: ; 0x0208AF08
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	bne _0208AF34
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	mov r3, #0x12
	bl sub_020196E8
	ldr r0, _0208AF6C ; =0x00000448
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #1
	bl sub_0208DC68
	pop {r4, pc}
_0208AF34:
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _0208AF5C
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	mov r2, #0
	mov r3, #0x12
	bl sub_020196E8
	ldr r0, _0208AF6C ; =0x00000448
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	b _0208AF60
_0208AF5C:
	bl sub_0208AF70
_0208AF60:
	add r0, r4, #0
	mov r1, #0
	bl sub_0208DC68
	pop {r4, pc}
	nop
_0208AF6C: .word 0x00000448
	thumb_func_end sub_0208AF08

	thumb_func_start sub_0208AF70
sub_0208AF70: ; 0x0208AF70
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	mov r1, #6
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldr r2, _0208AF9C ; =0x00003006
	mov r3, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	nop
_0208AF9C: .word 0x00003006
	thumb_func_end sub_0208AF70

	thumb_func_start sub_0208AFA0
sub_0208AFA0: ; 0x0208AFA0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #1
	beq _0208AFE6
	cmp r1, #1
	bne _0208AFCE
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #2
	mov r2, #1
	mov r3, #0x10
	bl sub_020196E8
	add r0, r4, #0
	mov r1, #1
	bl sub_0208DD20
	pop {r4, pc}
_0208AFCE:
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #3
	mov r2, #1
	mov r3, #0x10
	bl sub_020196E8
	add r0, r4, #0
	mov r1, #0
	bl sub_0208DD20
_0208AFE6:
	pop {r4, pc}
	thumb_func_end sub_0208AFA0

	thumb_func_start sub_0208AFE8
sub_0208AFE8: ; 0x0208AFE8
	push {r3, r4, r5, r6}
	ldr r5, _0208B040 ; =0x000007C8
	add r4, r0, #0
	strb r2, [r4, r5]
	add r0, r5, #1
	strb r3, [r4, r0]
	add r2, sp, #0
	ldrb r3, [r2, #0x10]
	add r0, r5, #2
	strb r3, [r4, r0]
	ldrb r3, [r2, #0x14]
	add r0, r5, #3
	strb r3, [r4, r0]
	add r0, r5, #4
	ldrb r3, [r4, r0]
	mov r0, #0xf
	ldrb r6, [r2, #0x18]
	bic r3, r0
	mov r0, #0xf
	and r6, r0
	orr r6, r3
	add r3, r5, #4
	strb r6, [r4, r3]
	ldrb r2, [r2, #0x1c]
	ldrb r3, [r4, r3]
	mov r6, #0xf0
	lsl r2, r2, #0x1c
	bic r3, r6
	lsr r2, r2, #0x18
	orr r3, r2
	add r2, r5, #4
	strb r3, [r4, r2]
	add r2, r5, #5
	strb r1, [r4, r2]
	mov r2, #0
	add r1, r5, #6
	strb r2, [r4, r1]
	add r1, sp, #0x20
	ldrb r2, [r1]
	add r1, r5, #7
	strb r2, [r4, r1]
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0208B040: .word 0x000007C8
	thumb_func_end sub_0208AFE8

	thumb_func_start sub_0208B044
sub_0208B044: ; 0x0208B044
	push {lr}
	sub sp, #0x14
	mov r2, #9
	str r2, [sp]
	mov r2, #4
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #6
	mov r2, #0x17
	mov r3, #0x14
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	thumb_func_end sub_0208B044

	thumb_func_start sub_0208B068
sub_0208B068: ; 0x0208B068
	push {lr}
	sub sp, #0x14
	mov r2, #0xf
	str r2, [sp]
	mov r2, #4
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #6
	mov r3, #0x13
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0208B068

	thumb_func_start sub_0208B08C
sub_0208B08C: ; 0x0208B08C
	push {lr}
	sub sp, #0x14
	mov r2, #0xa
	str r2, [sp]
	mov r2, #2
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #6
	mov r3, #0x11
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0208B08C

	thumb_func_start sub_0208B0B0
sub_0208B0B0: ; 0x0208B0B0
	push {lr}
	sub sp, #0x14
	cmp r1, #0
	bne _0208B0D6
	mov r1, #6
	str r1, [sp]
	mov r3, #3
	str r3, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r2, #0x18
	mov r3, #5
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
_0208B0D6:
	mov r1, #6
	str r1, [sp]
	mov r3, #3
	str r3, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r2, #0x18
	mov r3, #0xd
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	thumb_func_end sub_0208B0B0

	thumb_func_start sub_0208B0F4
sub_0208B0F4: ; 0x0208B0F4
	push {lr}
	sub sp, #0x14
	mov r2, #6
	str r2, [sp]
	mov r2, #4
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #5
	mov r2, #0x1a
	mov r3, #0x1d
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	thumb_func_end sub_0208B0F4

	thumb_func_start sub_0208B118
sub_0208B118: ; 0x0208B118
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	mvn r1, r1
	add r4, r0, #0
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0208B140
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r1, #5
	ldr r0, [r4, r0]
	mov r2, #0x18
	add r3, r1, #0
	bl sub_020196E8
	b _0208B162
_0208B140:
	mov r0, #5
	str r0, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r2, #1
	mov r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
_0208B162:
	add r0, r4, #0
	mov r1, #1
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0208B186
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #6
	mov r2, #0x18
	mov r3, #0xd
	bl sub_020196E8
	add sp, #0x10
	pop {r4, pc}
_0208B186:
	mov r0, #0xd
	str r0, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r2, #1
	mov r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0208B118

	.rodata

_021038AC:
	.byte 0xA5, 0xBC, 0xBE, 0xF9
_021038B0:
	.byte 0x88, 0x97, 0x08, 0x57
_021038B4:
	.byte 0x98, 0xB7, 0x08, 0x7F
_021038B8:
	.byte 0x28, 0x3F, 0xC0, 0xEF, 0x68, 0x7F, 0xC0, 0xEF
	.byte 0xFF, 0x00, 0x00, 0x00
_021038C4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_021038D4:
	.byte 0x08, 0x27, 0x08, 0x7F, 0x28, 0x47, 0x08, 0x7F, 0x48, 0x67, 0x08, 0x7F
	.byte 0x68, 0x87, 0x08, 0x7F, 0xFF, 0x00, 0x00, 0x00
_021038E8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02103904:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x1B, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103920:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1A, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210393C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103958:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02103974:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103990:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_021039B8:
	.word 13, 12, 14
	.word 19, 17, 18
	.word 10, 9, 9
	.word 13, 12, 12
_021039E8:
	.byte 0x08, 0x27, 0x10, 0x2F, 0x08, 0x27, 0x30, 0x4F
	.byte 0x08, 0x27, 0x50, 0x70, 0x30, 0x4F, 0x10, 0x2F, 0x30, 0x4F, 0x30, 0x4F, 0x30, 0x4F, 0x50, 0x70
	.byte 0x58, 0x77, 0x10, 0x2F, 0x58, 0x77, 0x30, 0x4F, 0x58, 0x77, 0x50, 0x70, 0x0C, 0x33, 0x74, 0x8B
	.byte 0x4C, 0x73, 0x74, 0x8B, 0xB0, 0xBF, 0xD0, 0xFF, 0xFF, 0x00, 0x00, 0x00

	; File boundary

	.public _02103A1C
_02103A1C:
	.word sub_02088298, sub_02088424, sub_0208856C, 0xFFFFFFFF
