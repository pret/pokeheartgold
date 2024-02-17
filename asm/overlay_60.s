#include "constants/sndseq.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "overlay_60.inc"
	.include "global.inc"

	.text

	.extern IntroMovie_CreateSpriteResourceManagers
	.extern IntroMovie_DestroySpriteResourceManagers
	.extern IntroMovie_GetSpriteResourceManagersArray
	.extern IntroMovie_StartSpriteAnimAndMakeVisible
	.extern IntroMovie_BuildSpriteResourcesHeaderAndTemplate
	.extern IntroMovie_RendererSetSurfaceCoords
	.extern IntroMovie_StartBgScroll_VBlank
	.extern IntroMovie_StartBgScroll_NotVBlank
	.extern IntroMovie_WaitBgScrollAnim
	.extern IntroMovie_CancelBgScrollAnim
	.extern IntroMovie_StartWindowPanEffect
	.extern IntroMovie_WaitWindowPanEffect
	.extern IntroMovie_GetBgConfig
	.extern IntroMovie_GetBgLinearAnimsController
	.extern IntroMovie_GetIntroSkippedFlag
	.extern IntroMovie_GetTotalFrameCount
	.extern IntroMovie_InitBgAnimGxState
	.extern IntroMovie_BeginCircleWipeEffect
	.extern IntroMovie_WaitCircleWipeEffect
	.extern IntroMovie_AdvanceSceneStep
	.extern IntroMovie_GetSceneStep
	.extern IntroMovie_GetSceneStepTimer
	.extern IntroMovie_Scene4_VBlankCB

	thumb_func_start ov60_021EA508
ov60_021EA508: ; 0x021EA508
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	ldr r3, _021EA694 ; =_021EB610
	add r4, r0, #0
	str r1, [sp, #0x10]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA698 ; =_021EB5EC
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x3c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA69C ; =_021EB604
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x30
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA6A0 ; =_021EB628
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA6A4 ; =_021EB5F8
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021EA6A8 ; =_021EB5E4
	str r0, [r2]
	add r0, r4, #0
	bl IntroMovie_CreateSpriteResourceManagers
	add r0, r4, #0
	bl IntroMovie_GetSpriteResourceManagersArray
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7]
	add r1, #0xbe
	mov r2, #0x52
	mov r3, #1
	bl AddCharResObjFromNarc
	ldr r1, [sp, #0x10]
	mov r3, #0
	str r0, [r1, #4]
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r7, #4]
	add r1, #0xbe
	mov r2, #0x51
	bl AddPlttResObjFromNarc
	ldr r1, [sp, #0x10]
	mov r2, #0x54
	str r0, [r1, #8]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7, #8]
	add r1, #0xbe
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	ldr r1, [sp, #0x10]
	mov r2, #0x53
	str r0, [r1, #0xc]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7, #0xc]
	add r1, #0xbe
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	ldr r1, [sp, #0x10]
	str r0, [r1, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
_021EA5D2:
	ldr r0, [sp, #0x14]
	add r2, sp, #0x3c
	lsl r6, r0, #2
	add r0, sp, #0x18
	ldr r4, [r0, r6]
	ldr r0, [sp, #0x14]
	mov r3, #1
	lsl r1, r0, #4
	ldr r0, [sp, #0x10]
	str r4, [sp]
	add r5, r0, r1
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r1, #0x42
	ldr r0, [r7]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	bl AddCharResObjFromNarc
	str r0, [r5, #0x14]
	mov r1, #0x42
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r2, sp, #0x48
	ldr r0, [r7, #4]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x18]
	mov r1, #0x42
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	add r2, sp, #0x24
	ldr r0, [r7, #8]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x1c]
	mov r1, #0x42
	str r4, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	add r2, sp, #0x30
	ldr r0, [r7, #0xc]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x20]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #3
	blo _021EA5D2
	mov r4, #0
_021EA664:
	ldr r0, [sp, #0x10]
	lsl r1, r4, #4
	add r5, r0, r1
	ldr r0, [r5, #4]
	bl sub_0200ACF0
	ldr r0, [r5, #8]
	bl sub_0200AF94
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021EA664
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA694: .word _021EB610
_021EA698: .word _021EB5EC
_021EA69C: .word _021EB604
_021EA6A0: .word _021EB628
_021EA6A4: .word _021EB5F8
_021EA6A8: .word _021EB5E4
	thumb_func_end ov60_021EA508

	thumb_func_start ov60_021EA6AC
ov60_021EA6AC: ; 0x021EA6AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0x44]
	bl Sprite_Delete
	ldr r0, [r5, #0x48]
	bl Sprite_Delete
	ldr r0, [r5, #0x4c]
	bl Sprite_Delete
	mov r4, #0
_021EA6C6:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x50]
	bl Sprite_Delete
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021EA6C6
	mov r4, #0
_021EA6DC:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #4]
	bl sub_0200AEB0
	ldr r0, [r6, #8]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021EA6DC
	add r0, r7, #0
	bl IntroMovie_DestroySpriteResourceManagers
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov60_021EA6AC

	thumb_func_start ov60_021EA700
ov60_021EA700: ; 0x021EA700
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	ldr r3, _021EA824 ; =_021EB61C
	add r7, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r7, #0
	str r0, [r2]
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	mov r0, #0
	add r2, r0, #0
	mov r3, #2
	bl IntroMovie_BuildSpriteResourcesHeaderAndTemplate
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #0x16
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r6, #0x44]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x44]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x44]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	mov r3, #1
	bl IntroMovie_BuildSpriteResourcesHeaderAndTemplate
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r6, #0x48]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x48]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x48]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	mov r3, #1
	bl IntroMovie_BuildSpriteResourcesHeaderAndTemplate
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r6, #0x4c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x4c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x4c]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	mov r4, #0
_021EA7D0:
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	lsl r5, r4, #2
	add r0, sp, #8
	ldr r0, [r0, r5]
	add r1, r7, #0
	mov r2, #0
	mov r3, #1
	bl IntroMovie_BuildSpriteResourcesHeaderAndTemplate
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r5, r6, r5
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r5, #0x50]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x50]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x50]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021EA7D0
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA824: .word _021EB61C
	thumb_func_end ov60_021EA700

	thumb_func_start ov60_021EA828
ov60_021EA828: ; 0x021EA828
	push {r4, lr}
	ldr r3, _021EA848 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015354
	cmp r4, #0
	bne _021EA840
	bl GF_AssertFail
_021EA840:
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021EA848: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov60_021EA828

	thumb_func_start ov60_021EA84C
ov60_021EA84C: ; 0x021EA84C
	push {r4, lr}
	ldr r3, _021EA86C ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #1
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _021EA85E
	bl GF_AssertFail
_021EA85E:
	add r0, r4, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021EA86C: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov60_021EA84C

	thumb_func_start ov60_021EA870
ov60_021EA870: ; 0x021EA870
	push {r3}
	sub sp, #0xc
	add r1, sp, #0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	mov r1, #0x40
	str r2, [sp]
	str r2, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #8]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	add r1, r2, r1
	str r1, [r0, #0x30]
	add sp, #0xc
	pop {r3}
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EA870

	thumb_func_start ov60_021EA8B0
ov60_021EA8B0: ; 0x021EA8B0
	push {r3, lr}
	bl Thunk_G3X_Reset
	bl sub_0201543C
	bl sub_02015460
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	pop {r3, pc}
	thumb_func_end ov60_021EA8B0

	thumb_func_start ov60_021EA8C8
ov60_021EA8C8: ; 0x021EA8C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x64]
	add r6, r1, #0
	mov r1, #1
	bl sub_02015528
	mov r0, #0xc
	add r4, r6, #0
	mul r4, r0
	ldr r1, _021EA908 ; =_021EB6EC
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C ; =ov60_021EA870
	mov r3, #0
	bl sub_02015494
	ldr r1, _021EA910 ; =_021EB6EC+4
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C ; =ov60_021EA870
	mov r3, #0
	bl sub_02015494
	ldr r1, _021EA914 ; =_021EB6EC+8
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C ; =ov60_021EA870
	mov r3, #0
	bl sub_02015494
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EA908: .word _021EB6EC
_021EA90C: .word ov60_021EA870
_021EA910: .word _021EB6EC+4
_021EA914: .word _021EB6EC+8
	thumb_func_end ov60_021EA8C8

	thumb_func_start ov60_021EA918
ov60_021EA918: ; 0x021EA918
	push {r3, lr}
	ldr r0, _021EA978 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _021EA97C ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021EA980 ; =0x0000CFFB
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
	ldr r2, _021EA984 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _021EA988 ; =0xBFFF0000
	ldr r0, _021EA98C ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_021EA978: .word 0x04000008
_021EA97C: .word 0xFFFFCFFD
_021EA980: .word 0x0000CFFB
_021EA984: .word 0x00007FFF
_021EA988: .word 0xBFFF0000
_021EA98C: .word 0x04000580
	thumb_func_end ov60_021EA918

	thumb_func_start ov60_021EA990
ov60_021EA990: ; 0x021EA990
	push {r4, lr}
	add r4, r0, #0
	str r1, [r4, #0x68]
	ldr r0, _021EA9A4 ; =ov60_021EA9A8
	add r1, r4, #0
	mov r2, #0
	bl SysTask_CreateOnVBlankQueue
	str r0, [r4, #0x6c]
	pop {r4, pc}
	.balign 4, 0
_021EA9A4: .word ov60_021EA9A8
	thumb_func_end ov60_021EA990

	thumb_func_start ov60_021EA9A8
ov60_021EA9A8: ; 0x021EA9A8
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x68]
	cmp r0, #0
	beq _021EA9DA
	ldr r0, _021EAA10 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	mov r0, #4
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #4
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	mov r0, #8
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	b _021EAA00
_021EA9DA:
	ldr r0, _021EAA10 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	mov r0, #4
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #4
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r0, #8
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
_021EAA00:
	bl GfGfx_SwapDisplay
	ldr r0, [r4, #0x6c]
	bl SysTask_Destroy
	mov r0, #0
	str r0, [r4, #0x6c]
	pop {r4, pc}
	.balign 4, 0
_021EAA10: .word gSystem + 0x60
	thumb_func_end ov60_021EA9A8

	; file boundary

	thumb_func_start IntroMovie_Scene5
IntroMovie_Scene5: ; 0x021EAA14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetIntroSkippedFlag
	cmp r0, #0
	beq _021EAA26
	mov r0, #2
	strb r0, [r4]
_021EAA26:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021EAA36
	cmp r0, #1
	beq _021EAA46
	cmp r0, #2
	beq _021EAA62
	b _021EAA6E
_021EAA36:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene5_Init
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EAA6E
_021EAA46:
	add r0, r5, #0
	bl IntroMovie_GetTotalFrameCount
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene5_Main
	cmp r0, #0
	beq _021EAA6E
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EAA6E
_021EAA62:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene5_Exit
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EAA6E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end IntroMovie_Scene5

	thumb_func_start ov60_021EAA74
ov60_021EAA74: ; 0x021EAA74
	push {r3, lr}
	bl IntroMovie_GetBgConfig
	bl DoScheduledBgGpuUpdates
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021EAA74

	thumb_func_start IntroMovie_Scene5_Init
IntroMovie_Scene5_Init: ; 0x021EAA84
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetBgConfig
	add r6, r0, #0
	ldr r0, _021EAAFC ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GfGfx_SwapDisplay
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	add r0, r5, #0
	bl ov60_021EAC5C
	add r0, r5, #0
	bl IntroMovie_InitBgAnimGxState
	ldr r0, _021EAB00 ; =ov60_021EAA74
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r4, #0
	bl ov60_021EAD14
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl IntroMovie_RendererSetSurfaceCoords
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EAE10
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EAE18
	add r0, r4, #0
	add r1, r6, #0
	bl ov60_021EADF0
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EAAFC: .word gSystem + 0x60
_021EAB00: .word ov60_021EAA74
	thumb_func_end IntroMovie_Scene5_Init

	thumb_func_start IntroMovie_Scene5_Main
IntroMovie_Scene5_Main: ; 0x021EAB04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl IntroMovie_GetBgConfig
	add r6, r0, #0
	add r0, r4, #0
	bl IntroMovie_GetBgLinearAnimsController
	add r5, r0, #0
	add r0, r4, #0
	bl IntroMovie_GetSceneStepTimer
	add r7, r0, #0
	add r0, r4, #0
	bl IntroMovie_GetSceneStep
	cmp r0, #4
	bhi _021EAC08
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EAB36: ; jump table
	.short _021EAB40 - _021EAB36 - 2 ; case 0
	.short _021EAB5E - _021EAB36 - 2 ; case 1
	.short _021EAB6E - _021EAB36 - 2 ; case 2
	.short _021EABD6 - _021EAB36 - 2 ; case 3
	.short _021EABFA - _021EAB36 - 2 ; case 4
_021EAB40:
	mov r0, #0x12
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	mov r1, #9
	mov r2, #5
	mov r3, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EAC08
_021EAB5E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EAC08
	add r0, r4, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EAC08
_021EAB6E:
	mov r0, #0x3f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0x49
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0
	bl IntroMovie_StartBgScroll_VBlank
#ifdef HEARTGOLD
	mov r0, #0x3f
	mvn r0, r0
#else
	mov r0, #0x40
#endif
	str r0, [sp]
	mov r0, #0x49
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, #0x30
	mov r2, #2
	mov r3, #0
	bl IntroMovie_StartBgScroll_VBlank
#ifdef HEARTGOLD
	mov r0, #0x3f
	mvn r0, r0
#else
	mov r0, #0x40
#endif
	str r0, [sp]
	mov r0, #0x49
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, #0x30
	mov r2, #5
	mov r3, #0
	bl IntroMovie_StartBgScroll_VBlank
#ifdef HEARTGOLD
	mov r0, #0x3f
	mvn r0, r0
#else
	mov r0, #0x40
#endif
	str r0, [sp]
	mov r0, #0x49
	add r5, #0x30
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #6
	mov r3, #0
	bl IntroMovie_StartBgScroll_VBlank
	add r0, r4, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EAC08
_021EABD6:
	cmp r7, #0x14
	blo _021EAC08
	mov r0, #0x32
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _021EAC10 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EAC08
_021EABFA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EAC08
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021EAC08:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
#ifdef HEARTGOLD
	nop
#endif
_021EAC10: .word 0x00007FFF
	thumb_func_end IntroMovie_Scene5_Main

	thumb_func_start IntroMovie_Scene5_Exit
IntroMovie_Scene5_Exit: ; 0x021EAC14
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl IntroMovie_GetBgConfig
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _021EAC5A
	add r0, r6, #0
	add r1, r5, #0
	bl ov60_021EAE14
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r5, #1]
_021EAC5A:
	pop {r4, r5, r6, pc}
	thumb_func_end IntroMovie_Scene5_Exit

	thumb_func_start ov60_021EAC5C
ov60_021EAC5C: ; 0x021EAC5C
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl IntroMovie_GetBgConfig
	add r3, sp, #0x70
	ldr r5, _021EAD00 ; =_021EB7C0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021EAD04 ; =_021EB7EC
	add r3, sp, #0x54
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
	ldr r5, _021EAD08 ; =_021EB7D0
	add r3, sp, #0x38
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
	ldr r5, _021EAD0C ; =_021EB808
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
	ldr r5, _021EAD10 ; =_021EB824
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021EAD00: .word _021EB7C0
_021EAD04: .word _021EB7EC
_021EAD08: .word _021EB7D0
_021EAD0C: .word _021EB808
_021EAD10: .word _021EB824
	thumb_func_end ov60_021EAC5C

	thumb_func_start ov60_021EAD14
ov60_021EAD14: ; 0x021EAD14
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3b
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3c
	add r2, r4, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3f
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3d
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3e
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x40
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x4a
	mov r2, #0
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x1f
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x27
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	bl GfGfx_BothDispOn
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov60_021EAD14

	thumb_func_start ov60_021EADF0
ov60_021EADF0: ; 0x021EADF0
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0xa0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #6
	mov r2, #3
	mov r3, #0xa0
	bl BgSetPosTextAndCommit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov60_021EADF0

	thumb_func_start ov60_021EAE10
ov60_021EAE10: ; 0x021EAE10
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EAE10

	thumb_func_start ov60_021EAE14
ov60_021EAE14: ; 0x021EAE14
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EAE14

	thumb_func_start ov60_021EAE18
ov60_021EAE18: ; 0x021EAE18
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EAE18

	.rodata

	.public _021EB5E4
_021EB5E4:
	.byte 0x04, 0x04, 0x04, 0x04
	.size _021EB5E4,.-_021EB5E4
	.public _021EB5E8
_021EB5E8:
	.word 0x4A
	.size _021EB5E8,.-_021EB5E8
	.public _021EB5EC
_021EB5EC:
	.byte 0x56, 0x00, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00
	.size _021EB5EC,.-_021EB5EC
	.public _021EB5F8
_021EB5F8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00
	.size _021EB5F8,.-_021EB5F8
	.public _021EB604
_021EB604:
	.byte 0x57, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.size _021EB604,.-_021EB604
	.public _021EB610
_021EB610:
	.byte 0x55, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
	.size _021EB610,.-_021EB610
	.public _021EB61C
_021EB61C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.size _021EB61C,.-_021EB61C
	.public _021EB628
_021EB628:
	.byte 0x58, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00
	.size _021EB628,.-_021EB628
	.public _021EB634
_021EB634:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.size _021EB634,.-_021EB634
	.public _021EB644
_021EB644:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB644,.-_021EB644
	.public _021EB660
_021EB660:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB660,.-_021EB660
	.public _021EB67C
_021EB67C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB67C,.-_021EB67C
	.public _021EB698
_021EB698:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.size _021EB698,.-_021EB698
	.public _021EB6B4
_021EB6B4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB6B4,.-_021EB6B4
	.public _021EB6D0
_021EB6D0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB6D0,.-_021EB6D0
	.public _021EB6EC
_021EB6EC:
	.byte 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.size _021EB6EC,.-_021EB6EC
	.public _021EB710
_021EB710:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB710,.-_021EB710
	.public _021EB73C
_021EB73C:
	.byte 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB73C,.-_021EB73C
	.public _021EB768
_021EB768:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
	.size _021EB768,.-_021EB768
	.public _021EB794
_021EB794:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB794,.-_021EB794

	; file boundary?

_021EB7C0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB7C0,.-_021EB7C0
_021EB7D0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB7D0,.-_021EB7D0
_021EB7EC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB7EC,.-_021EB7EC
_021EB808:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.size _021EB808,.-_021EB808
_021EB824:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB824,.-_021EB824
