#include "constants/sndseq.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "overlay_60.inc"
	.include "global.inc"

	.text

	.extern ov60_021E6ED8
	.extern ov60_021E6F00
	.extern ov60_021E6F20
	.extern ov60_021E6F28
	.extern ov60_021E6F3C
	.extern ov60_021E6FAC
	.extern ov60_021E7074
	.extern ov60_021E7120
	.extern ov60_021E72FC
	.extern ov60_021E7324
	.extern ov60_021E7398
	.extern ov60_021E7434
	.extern IntroMovie_GetBgConfig
	.extern ov60_021E768C
	.extern IntroMovie_GetIntroSkippedFlag
	.extern IntroMovie_GetTotalFrameCount
	.extern ov60_021E76A0
	.extern ov60_021E76F4
	.extern ov60_021E77A0
	.extern IntroMovie_AdvanceSceneStep
	.extern IntroMovie_GetSceneStep
	.extern IntroMovie_GetSceneStepTimer

	; file boundary

	thumb_func_start IntroMovie_Scene2
IntroMovie_Scene2: ; 0x021E80E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetIntroSkippedFlag
	cmp r0, #0
	beq _021E80F2
	mov r0, #2
	strb r0, [r4]
_021E80F2:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E8102
	cmp r0, #1
	beq _021E8112
	cmp r0, #2
	beq _021E812E
	b _021E813A
_021E8102:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene2_Init
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E813A
_021E8112:
	add r0, r5, #0
	bl IntroMovie_GetTotalFrameCount
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene2_Main
	cmp r0, #0
	beq _021E813A
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E813A
_021E812E:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene2_Exit
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E813A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end IntroMovie_Scene2

	thumb_func_start ov60_021E8140
ov60_021E8140: ; 0x021E8140
	push {r3, lr}
	bl IntroMovie_GetBgConfig
	bl DoScheduledBgGpuUpdates
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021E8140

	thumb_func_start IntroMovie_Scene2_Init
IntroMovie_Scene2_Init: ; 0x021E8150
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _021E81CC ; =0x00007FFF
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _021E81CC ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	add r0, r5, #0
	bl IntroMovie_GetBgConfig
	add r6, r0, #0
	bl sub_020216C8
	bl sub_02022638
	ldr r0, _021E81D0 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GfGfx_SwapDisplay
	add r0, r5, #0
	bl ov60_021E866C
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E81D4 ; =ov60_021E8140
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl ov60_021E8724
	mov r1, #0
	mov r0, #0xc0
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov60_021E6FAC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E87FC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E8978
	add r0, r5, #0
	add r1, r6, #0
	bl ov60_021E81D8
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E81CC: .word 0x00007FFF
_021E81D0: .word gSystem + 0x60
_021E81D4: .word ov60_021E8140
	thumb_func_end IntroMovie_Scene2_Init

	thumb_func_start ov60_021E81D8
ov60_021E81D8: ; 0x021E81D8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	bl ov60_021E768C
	add r4, r0, #0
	mov r0, #5
	lsl r0, r0, #6
	add r1, r4, #0
	str r0, [sp]
	mov r3, #0
	add r0, r5, #0
	add r1, #0x30
	mov r2, #1
	str r3, [sp, #4]
	bl ov60_021E7074
	mov r0, #0xc0
	mov r2, #0
	str r0, [sp]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x30
	add r3, r2, #0
	str r2, [sp, #4]
	bl ov60_021E7074
	mov r0, #0x40
	str r0, [sp]
	sub r0, #0x41
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, #0x30
	mov r2, #2
	mov r3, #0
	bl ov60_021E7074
	mov r0, #0x40
	str r0, [sp]
	sub r0, #0x41
	add r4, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #4
	mov r3, #0
	bl ov60_021E7074
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021E81D8

	thumb_func_start IntroMovie_Scene2_Main
IntroMovie_Scene2_Main: ; 0x021E8240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetBgConfig
	add r7, r0, #0
	add r0, r6, #0
	bl ov60_021E768C
	add r5, r0, #0
	add r0, r6, #0
	bl IntroMovie_GetSceneStepTimer
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl IntroMovie_GetSceneStep
	cmp r0, #7
	bls _021E826A
	b _021E85D8
_021E826A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8276: ; jump table
	.short _021E8286 - _021E8276 - 2 ; case 0
	.short _021E82A8 - _021E8276 - 2 ; case 1
	.short _021E8340 - _021E8276 - 2 ; case 2
	.short _021E83D4 - _021E8276 - 2 ; case 3
	.short _021E845E - _021E8276 - 2 ; case 4
	.short _021E84EA - _021E8276 - 2 ; case 5
	.short _021E8576 - _021E8276 - 2 ; case 6
	.short _021E85C8 - _021E8276 - 2 ; case 7
_021E8286:
	mov r0, #3
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	ldr r3, _021E85C0 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	strb r0, [r4, #3]
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E85D8
_021E82A8:
	ldrb r0, [r4, #3]
	cmp r0, #0xa
	bhs _021E82CA
	ldr r1, _021E85C4 ; =_021EB1CC
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	ldr r1, [sp, #0xc]
	cmp r1, r2
	bne _021E82CA
	add r0, r4, r0
	ldr r0, [r0, #0x3c]
	mov r1, #1
	bl ov60_021E6F28
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
_021E82CA:
	ldr r0, [sp, #0xc]
	cmp r0, #0x37
	bls _021E837C
	mov r0, #0xbf
	mvn r0, r0
	str r0, [sp]
	mov r0, #5
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0
	bl ov60_021E7120
	mov r0, #0xbf
	mvn r0, r0
	str r0, [sp]
	mov r0, #5
	add r5, #0x30
	mov r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r2, #0
	bl ov60_021E7120
	mov r0, #5
	mov r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xc0
	bl ov60_021E8AE0
	mov r0, #5
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	mov r3, #0xc0
	bl ov60_021E8AE0
	mov r1, #0
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #4
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E85D8
_021E8340:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E837C
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E837C
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E837C
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E837C
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021E837E
_021E837C:
	b _021E85D8
_021E837E:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x5a
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0x20
	bl ov60_021E7120
	mov r2, #0
	add r5, #0x30
	str r2, [sp]
	mov r0, #0x5a
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	mov r3, #0x20
	bl ov60_021E7120
	mov r1, #0
	mov r0, #0x5a
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x20
	add r3, r1, #0
	bl ov60_021E8AE0
	mov r1, #1
	mov r0, #0x5a
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x21
	mov r3, #0
	bl ov60_021E8AE0
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E85D8
_021E83D4:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	mov r0, #0
	str r0, [sp]
	mov r0, #7
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0x40
	bl ov60_021E7120
	mov r2, #0
	add r5, #0x30
	str r2, [sp]
	mov r0, #7
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	mov r3, #0x40
	bl ov60_021E7120
	mov r1, #0
	mov r0, #7
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x40
	add r3, r1, #0
	bl ov60_021E8AE0
	mov r1, #1
	mov r0, #7
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x41
	mov r3, #0
	bl ov60_021E8AE0
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E85D8
_021E845E:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	bne _021E8494
_021E8492:
	b _021E85D8
_021E8494:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x42
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0x20
	bl ov60_021E7120
	mov r2, #0
	add r5, #0x30
	str r2, [sp]
	mov r0, #0x42
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	mov r3, #0x20
	bl ov60_021E7120
	mov r1, #0
	mov r0, #0x42
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x20
	add r3, r1, #0
	bl ov60_021E8AE0
	mov r1, #1
	mov r0, #0x42
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x21
	mov r3, #0
	bl ov60_021E8AE0
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E85D8
_021E84EA:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	mov r0, #0x7f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xa
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0
	bl ov60_021E7120
	mov r0, #0x3f
	mvn r0, r0
	str r0, [sp]
	mov r0, #5
	add r5, #0x30
	mov r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r2, #0
	bl ov60_021E7120
	mov r0, #0xa
	mov r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0x80
	bl ov60_021E8AE0
	mov r0, #0xa
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	mov r3, #0x80
	bl ov60_021E8AE0
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E85D8
_021E8576:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r5, #0x30
	add r0, r5, #0
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	mov r1, #1
	add r0, r6, #0
	add r2, r1, #0
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E85D8
	nop
_021E85C0: .word 0x00007FFF
_021E85C4: .word _021EB1CC
_021E85C8:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E85D8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E85D8:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end IntroMovie_Scene2_Main

	thumb_func_start IntroMovie_Scene2_Exit
IntroMovie_Scene2_Exit: ; 0x021E85E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r6, r1, #0
	bl ov60_021E768C
	str r0, [sp, #4]
	ldr r0, [sp]
	bl IntroMovie_GetBgConfig
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _021E8666
	mov r4, #0
	add r7, r4, #0
_021E8608:
	mov r0, #0x28
	mul r0, r4
	add r5, r6, r0
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	beq _021E861A
	bl SysTask_Destroy
	str r7, [r5, #0x6c]
_021E861A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E8608
	ldr r0, [sp]
	add r1, r6, #0
	bl ov60_021E8914
	ldr r0, [sp, #4]
	mov r1, #4
	add r0, #0x30
	bl ov60_021E7324
	ldr r0, [sp, #4]
	mov r1, #2
	add r0, #0x30
	str r0, [sp, #4]
	bl ov60_021E7324
	ldr r0, [sp, #8]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #8]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #8]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #8]
	mov r1, #2
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r6, #1]
_021E8666:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end IntroMovie_Scene2_Exit

	thumb_func_start ov60_021E866C
ov60_021E866C: ; 0x021E866C
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl IntroMovie_GetBgConfig
	add r3, sp, #0x70
	ldr r5, _021E8710 ; =_021EB14C
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E8714 ; =_021EB15C
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E8718 ; =_021EB194
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r5, _021E871C ; =_021EB1B0
	add r3, sp, #0x1c
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
	ldr r5, _021E8720 ; =_021EB178
	add r3, sp, #0
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E8710: .word _021EB14C
_021E8714: .word _021EB15C
_021E8718: .word _021EB194
_021E871C: .word _021EB1B0
_021E8720: .word _021EB178
	thumb_func_end ov60_021E866C

	thumb_func_start ov60_021E8724
ov60_021E8724: ; 0x021E8724
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
	mov r1, #0x21
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x22
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x23
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x24
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x25
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x26
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	mov r2, #0
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x20
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x1f
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
	thumb_func_end ov60_021E8724

	thumb_func_start ov60_021E87FC
ov60_021E87FC: ; 0x021E87FC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, _021E8910 ; =_021EB138
	add r4, r0, #0
	bl ov60_021E6ED8
	add r0, r4, #0
	bl ov60_021E6F20
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	mov r2, #0x4e
	mov r3, #1
	bl AddCharResObjFromNarc
	str r0, [r5, #4]
	mov r3, #0
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x4d
	bl AddPlttResObjFromNarc
	str r0, [r5, #8]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x50
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0xc]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x4f
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r2, #0x4a
	add r1, r2, #0
	str r0, [r5, #0x10]
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	bl AddCharResObjFromNarc
	str r0, [r5, #0x14]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x49
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x18]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x4c
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x1c]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x4b
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x20]
	mov r4, #0
_021E88E0:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #4]
	bl sub_0200ACF0
	ldr r0, [r6, #8]
	bl sub_0200AF94
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E88E0
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E8910: .word _021EB138
	thumb_func_end ov60_021E87FC

	thumb_func_start ov60_021E8914
ov60_021E8914: ; 0x021E8914
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0x24]
	bl Sprite_Delete
	ldr r0, [r5, #0x28]
	bl Sprite_Delete
	ldr r0, [r5, #0x2c]
	bl Sprite_Delete
	ldr r0, [r5, #0x30]
	bl Sprite_Delete
	ldr r0, [r5, #0x34]
	bl Sprite_Delete
	ldr r0, [r5, #0x38]
	bl Sprite_Delete
	mov r4, #0
_021E8940:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl Sprite_Delete
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xa
	blo _021E8940
	mov r4, #0
_021E8956:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #4]
	bl sub_0200AEB0
	ldr r0, [r6, #8]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E8956
	add r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E8914

	thumb_func_start ov60_021E8978
ov60_021E8978: ; 0x021E8978
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	ldr r3, _021E8AD8 ; =_021EB140
	add r5, r1, #0
	str r0, [sp, #8]
	add r2, sp, #0xc
	mov r1, #0xa
_021E8986:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E8986
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	mov r0, #0
	ldr r1, [sp, #8]
	add r2, r0, #0
	mov r3, #3
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x20]
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [sp, #0x24]
	mov r4, #0
	add r7, sp, #0xc
_021E89B6:
	lsl r0, r4, #2
	add r6, r5, r0
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r6, #0x3c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x3c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldrb r1, [r7, r4]
	ldr r0, [r6, #0x3c]
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xa
	blo _021E89B6
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	mov r0, #1
	ldr r1, [sp, #8]
	add r2, r0, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #1
	lsl r0, r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, _021E8ADC ; =0xFFFA0000
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x24]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x24]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x2c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x34]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x34]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x34]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	mov r0, #1
	ldr r1, [sp, #8]
	add r2, r0, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #5
	lsl r0, r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, _021E8ADC ; =0xFFFA0000
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x28]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x28]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x28]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x30]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x30]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x38]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x38]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x38]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8AD8: .word _021EB140
_021E8ADC: .word 0xFFFA0000
	thumb_func_end ov60_021E8978

	thumb_func_start ov60_021E8AE0
ov60_021E8AE0: ; 0x021E8AE0
	push {r4, r5, r6, lr}
	add r5, r2, #0
	add r6, r3, #0
	cmp r1, #0
	bne _021E8AFA
	add r4, r0, #0
	ldr r1, [r0, #0x24]
	add r4, #0x64
	str r1, [r4, #0x1c]
	ldr r1, [r0, #0x2c]
	str r1, [r4, #0x20]
	ldr r0, [r0, #0x34]
	b _021E8B08
_021E8AFA:
	add r4, r0, #0
	ldr r1, [r0, #0x28]
	add r4, #0x8c
	str r1, [r4, #0x1c]
	ldr r1, [r0, #0x30]
	str r1, [r4, #0x20]
	ldr r0, [r0, #0x38]
_021E8B08:
	str r0, [r4, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8B14
	bl GF_AssertFail
_021E8B14:
	mov r0, #1
	str r0, [r4]
	ldr r0, [sp, #0x10]
	strh r0, [r4, #4]
	mov r0, #0
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, [r4, #0x1c]
	bl Sprite_GetMatrixPtr
	ldr r2, [r0]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	str r1, [r4, #0x14]
	ldr r1, [r0, #4]
	mov r2, #0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	str r0, [r4, #0x18]
	str r5, [r4, #0xc]
	ldr r0, _021E8B54 ; =ov60_021E8B7C
	add r1, r4, #0
	str r6, [r4, #0x10]
	bl SysTask_CreateOnMainQueue
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	nop
_021E8B54: .word ov60_021E8B7C
	thumb_func_end ov60_021E8AE0

	thumb_func_start ov60_021E8B58
ov60_021E8B58: ; 0x021E8B58
	cmp r1, #0
	bne _021E8B60
	add r0, #0x64
	b _021E8B62
_021E8B60:
	add r0, #0x8c
_021E8B62:
	ldr r1, [r0]
	cmp r1, #0
	bne _021E8B6C
	mov r0, #1
	bx lr
_021E8B6C:
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _021E8B76
	mov r0, #1
	bx lr
_021E8B76:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021E8B58

	thumb_func_start ov60_021E8B7C
ov60_021E8B7C: ; 0x021E8B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r1, sp, #4
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r0, [r5, #6]
	add r0, r0, #1
	strb r0, [r5, #6]
	mov r0, #4
	ldrb r4, [r5, #6]
	ldrsh r6, [r5, r0]
	ldr r1, [r5, #0xc]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [r5, #0x10]
	add r7, r0, #0
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [r5, #0x14]
	add r1, r7, r1
	str r1, [sp]
	ldr r1, [r5, #0x18]
	add r7, r0, r1
	cmp r4, r6
	blt _021E8BD0
	ldr r0, [r5, #8]
	bl SysTask_Destroy
	mov r1, #0
	str r1, [r5, #8]
	mov r0, #1
	strb r0, [r5, #7]
	str r1, [r5]
_021E8BD0:
	ldr r0, [sp]
	add r1, sp, #4
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	lsl r0, r7, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	bl Sprite_SetMatrix
	ldr r0, [r5, #0x20]
	add r1, sp, #4
	bl Sprite_SetMatrix
	ldr r0, [r5, #0x24]
	add r1, sp, #4
	bl Sprite_SetMatrix
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov60_021E8B7C

	; file boundary

	thumb_func_start IntroMovie_Scene3
IntroMovie_Scene3: ; 0x021E8BF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetIntroSkippedFlag
	cmp r0, #0
	beq _021E8C0A
	mov r0, #2
	strb r0, [r4]
_021E8C0A:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E8C1A
	cmp r0, #1
	beq _021E8C2A
	cmp r0, #2
	beq _021E8C46
	b _021E8C52
_021E8C1A:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene3_Init
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E8C52
_021E8C2A:
	add r0, r5, #0
	bl IntroMovie_GetTotalFrameCount
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene3_Main
	cmp r0, #0
	beq _021E8C52
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E8C52
_021E8C46:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene3_Exit
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E8C52:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end IntroMovie_Scene3

	thumb_func_start ov60_021E8C58
ov60_021E8C58: ; 0x021E8C58
	push {r3, lr}
	bl IntroMovie_GetBgConfig
	bl DoScheduledBgGpuUpdates
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021E8C58

	thumb_func_start IntroMovie_Scene3_Init
IntroMovie_Scene3_Init: ; 0x021E8C68
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetBgConfig
	add r6, r0, #0
	bl sub_020216C8
	bl sub_02022638
	ldr r0, _021E8CF8 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GfGfx_SwapDisplay
	add r0, r5, #0
	bl ov60_021E9580
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E8CFC ; =ov60_021E8C58
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r4, #0
	bl ov60_021E9638
	mov r1, #0
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov60_021E6FAC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E9768
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E98C0
	mov r0, #4
	str r0, [sp]
	ldr r0, _021E8D00 ; =ov60_021E9BFC
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov60_021E99B8
	add r0, r4, #0
	add r1, r6, #0
	bl ov60_021E8D04
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E8CF8: .word gSystem + 0x60
_021E8CFC: .word ov60_021E8C58
_021E8D00: .word ov60_021E9BFC
	thumb_func_end IntroMovie_Scene3_Init

	thumb_func_start ov60_021E8D04
ov60_021E8D04: ; 0x021E8D04
	push {r3, lr}
	ldr r0, [r0, #0x64]
	mov r1, #1
	bl ov60_021E6F28
	mov r0, #6
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r0, #1
	add r1, r0, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	pop {r3, pc}
	thumb_func_end ov60_021E8D04

	thumb_func_start IntroMovie_Scene3_Main
IntroMovie_Scene3_Main: ; 0x021E8D38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	bl IntroMovie_GetBgConfig
	add r7, r0, #0
	add r0, r6, #0
	bl ov60_021E768C
	add r4, r0, #0
	add r0, r6, #0
	bl IntroMovie_GetSceneStepTimer
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov60_021E9B60
	add r0, r6, #0
	bl IntroMovie_GetSceneStep
	cmp r0, #0x17
	bhi _021E8DEA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8D74: ; jump table
	.short _021E8DA4 - _021E8D74 - 2 ; case 0
	.short _021E8DC6 - _021E8D74 - 2 ; case 1
	.short _021E8DE0 - _021E8D74 - 2 ; case 2
	.short _021E8E12 - _021E8D74 - 2 ; case 3
	.short _021E8E2C - _021E8D74 - 2 ; case 4
	.short _021E8E5C - _021E8D74 - 2 ; case 5
	.short _021E8E76 - _021E8D74 - 2 ; case 6
	.short _021E8E90 - _021E8D74 - 2 ; case 7
	.short _021E8EA4 - _021E8D74 - 2 ; case 8
	.short _021E8EB6 - _021E8D74 - 2 ; case 9
	.short _021E8F08 - _021E8D74 - 2 ; case 10
	.short _021E8F38 - _021E8D74 - 2 ; case 11
	.short _021E8FBE - _021E8D74 - 2 ; case 12
	.short _021E9016 - _021E8D74 - 2 ; case 13
	.short _021E9070 - _021E8D74 - 2 ; case 14
	.short _021E90B6 - _021E8D74 - 2 ; case 15
	.short _021E90F4 - _021E8D74 - 2 ; case 16
	.short _021E910C - _021E8D74 - 2 ; case 17
	.short _021E918E - _021E8D74 - 2 ; case 18
	.short _021E920C - _021E8D74 - 2 ; case 19
	.short _021E9278 - _021E8D74 - 2 ; case 20
	.short _021E936E - _021E8D74 - 2 ; case 21
	.short _021E93D8 - _021E8D74 - 2 ; case 22
	.short _021E9460 - _021E8D74 - 2 ; case 23
_021E8DA4:
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov60_021E9C84
	add r0, r6, #0
	mov r1, #0
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8DC6:
	ldr r0, [sp, #0x10]
	cmp r0, #0x28
	bls _021E8DEA
	add r0, r6, #0
	mov r1, #3
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8DE0:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	bne _021E8DEC
_021E8DEA:
	b _021E9476
_021E8DEC:
	add r0, r6, #0
	mov r1, #2
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	mov r0, #0x1d
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov60_021E9C84
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8E12:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2e
	bls _021E8F0E
	add r0, r6, #0
	mov r1, #3
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8E2C:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	add r0, r6, #0
	mov r1, #2
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	mov r0, #0x1d
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov60_021E9C84
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8E5C:
	ldr r0, [sp, #0x10]
	cmp r0, #0x62
	bls _021E8F0E
	add r0, r6, #0
	mov r1, #3
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8E76:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	mov r0, #0x1d
	ldr r1, _021E91A8 ; =0x0000FFFF
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8E90:
	add r0, r6, #0
	mov r1, #2
	mov r2, #0
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8EA4:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8EB6:
	ldr r3, _021E91AC ; =_021EB250
	add r2, sp, #0x1f8
	ldmia r3!, {r0, r1}
	add r4, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrb r2, [r5, #3]
	lsl r0, r2, #2
	ldr r1, [r4, r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	blt _021E8F0E
	add r0, r2, #1
	strb r0, [r5, #3]
	ldrb r0, [r5, #3]
	mov r1, #4
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r3, [r0, #0x24]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldrb r0, [r5, #3]
	cmp r0, #3
	blo _021E8F0E
	ldr r0, [r5, #0x64]
	mov r1, #0
	bl ov60_021E6F28
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8F08:
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	bhs _021E8F10
_021E8F0E:
	b _021E9476
_021E8F10:
	mov r0, #1
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	ldr r3, [r5, #0x34]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #4
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8F38:
	ldr r0, [sp, #0x10]
	cmp r0, #5
	bne _021E8F60
	ldr r3, _021E91B0 ; =_021EB3C8
	add r2, sp, #0x1cc
	mov r5, #5
_021E8F44:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E8F44
	ldr r0, [r3]
	mov r1, #5
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x1cc
	bl ov60_021E7398
_021E8F60:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2c
	blo _021E9024
	ldr r3, _021E91B4 ; =_021EB3F4
	add r2, sp, #0x1a0
	mov r5, #5
_021E8F6C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E8F6C
	ldr r0, [r3]
	mov r1, #7
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x1a0
	bl ov60_021E7398
	ldr r2, _021E91B8 ; =0x04001000
	mov r3, #0xff
	ldr r1, [r2]
	ldr r0, _021E91BC ; =0xFFFF1FFF
	add r4, #0x30
	and r1, r0
	lsr r0, r2, #0xd
	orr r0, r1
	str r0, [r2]
	mov r0, #0
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #4
	mvn r3, r3
	bl ov60_021E7074
	mov r0, #1
	add r1, r0, #0
	bl GfGfx_EngineBTogglePlanes
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E8FBE:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #4
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9024
	ldr r3, _021E91C0 ; =_021EB420
	add r2, sp, #0x174
	mov r5, #5
_021E8FD2:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E8FD2
	ldr r0, [r3]
	mov r1, #7
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x174
	bl ov60_021E7398
	mov r0, #0
	mov r2, #5
	str r0, [sp]
	mov r0, #7
	add r4, #0x30
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	add r3, #0xfb
	bl ov60_021E7074
	mov r0, #2
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E9016:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	bne _021E9026
_021E9024:
	b _021E9476
_021E9026:
	ldr r3, _021E91C4 ; =_021EB44C
	add r2, sp, #0x148
	mov r5, #5
_021E902C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E902C
	ldr r0, [r3]
	mov r1, #1
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x148
	bl ov60_021E7398
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r4, #0x30
	mov r3, #0xff
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #6
	mvn r3, r3
	bl ov60_021E7074
	mov r0, #4
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E9070:
	add r4, #0x30
	add r0, r4, #0
	mov r1, #6
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E912E
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _021E91BC ; =0xFFFF1FFF
	ldr r3, _021E91B8 ; =0x04001000
	and r2, r1
	str r2, [r0]
	ldr r2, [r3]
	lsr r0, r0, #0xc
	and r1, r2
	str r1, [r3]
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x29
	add r2, r7, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E90B6:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2a
	blo _021E912E
	ldr r5, _021E91C8 ; =_021EB478
	add r3, sp, #0x11c
	mov r2, #5
_021E90C2:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E90C2
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x11c
	bl ov60_021E7398
	ldr r2, _021E91B8 ; =0x04001000
	ldr r0, _021E91BC ; =0xFFFF1FFF
	ldr r1, [r2]
	and r1, r0
	lsr r0, r2, #0xd
	orr r0, r1
	str r0, [r2]
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E90F4:
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl ov60_021E7434
	cmp r0, #0
	beq _021E912E
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E910C:
	ldr r0, [sp, #0x10]
	cmp r0, #0x38
	bne _021E911A
	ldr r0, [r5, #0x68]
	mov r1, #1
	bl ov60_021E6F28
_021E911A:
	ldr r0, [sp, #0x10]
	cmp r0, #0x91
	bne _021E9128
	ldr r0, [r5, #0x6c]
	mov r1, #1
	bl ov60_021E6F28
_021E9128:
	ldr r0, [sp, #0x10]
	cmp r0, #0x91
	bhs _021E9130
_021E912E:
	b _021E9476
_021E9130:
	ldr r3, _021E91CC ; =_021EB4A4
	add r2, sp, #0xf0
	mov r5, #5
_021E9136:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E9136
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0xf0
	bl ov60_021E7398
	ldr r1, _021E91D0 ; =0x000046B9
	ldr r0, _021E91D4 ; =0x04001042
	add r4, #0x30
	strh r1, [r0]
	ldr r1, _021E91D8 ; =0x000040C0
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E91DC ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x1d
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	strh r1, [r0, #6]
	mov r0, #0
	mov r2, #5
	str r0, [sp]
	mov r0, #0xa
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	sub r3, #0x79
	bl ov60_021E7074
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E918E:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9294
	mov r0, #2
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	ldr r5, _021E91E0 ; =_021EB4D0
	b _021E91E4
	.balign 4, 0
_021E91A8: .word 0x0000FFFF
_021E91AC: .word _021EB250
_021E91B0: .word _021EB3C8
_021E91B4: .word _021EB3F4
_021E91B8: .word 0x04001000
_021E91BC: .word 0xFFFF1FFF
_021E91C0: .word _021EB420
_021E91C4: .word _021EB44C
_021E91C8: .word _021EB478
_021E91CC: .word _021EB4A4
_021E91D0: .word 0x000046B9
_021E91D4: .word 0x04001042
_021E91D8: .word 0x000040C0
_021E91DC: .word 0xFFFFC0FF
_021E91E0: .word _021EB4D0
_021E91E4:
	add r3, sp, #0xc4
	mov r2, #5
_021E91E8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E91E8
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	add r2, r1, #0
	add r3, sp, #0xc4
	bl ov60_021E7398
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E920C:
	ldr r0, [r5, #0x70]
	mov r1, #1
	bl ov60_021E6F28
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	blo _021E9294
	ldr r3, _021E9480 ; =_021EB4FC
	add r2, sp, #0x98
	mov r5, #5
_021E9220:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E9220
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x98
	bl ov60_021E7398
	ldr r1, _021E9484 ; =0x000046B9
	ldr r0, _021E9488 ; =0x04001042
	add r4, #0x30
	strh r1, [r0]
	ldr r1, _021E948C ; =0x00004080
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E9490 ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x19
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	strh r1, [r0, #6]
	mov r0, #0
	mov r2, #6
	str r0, [sp]
	mov r0, #0xa
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	sub r3, #0x7a
	bl ov60_021E7074
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E9278:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9294
	add r0, r4, #0
	add r0, #0x30
	mov r1, #6
	bl ov60_021E72FC
	cmp r0, #0
	bne _021E9296
_021E9294:
	b _021E9476
_021E9296:
	mov r0, #4
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r0, #5
	ldr r2, _021E9494 ; =_021EB528
	add r3, sp, #0x6c
	mov ip, r0
_021E92A6:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r0, ip
	sub r0, r0, #1
	mov ip, r0
	bne _021E92A6
	ldr r0, [r2]
	mov r1, #0
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	add r2, r1, #0
	add r3, sp, #0x6c
	bl ov60_021E7398
	ldr r3, [r5, #0x38]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #5
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r3, [r5, #0x3c]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r3, [r5, #0x40]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #7
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	mov r2, #0
	add r0, r7, #0
	mov r1, #5
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r7, #0
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r2, #0
	add r0, r7, #0
	mov r1, #6
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r7, #0
	mov r1, #6
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r2, #0
	add r0, r7, #0
	mov r1, #7
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r7, #0
	mov r1, #7
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r0, #2
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	mov r0, #4
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E936E:
	ldr r0, [r5, #0x74]
	mov r1, #1
	bl ov60_021E6F28
	ldr r0, [sp, #0x10]
	cmp r0, #0x1e
	blo _021E9476
	ldr r3, _021E9498 ; =_021EB370
	add r2, sp, #0x40
	mov r5, #5
_021E9382:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E9382
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x40
	bl ov60_021E7398
	ldr r1, _021E9484 ; =0x000046B9
	ldr r0, _021E9488 ; =0x04001042
	add r4, #0x30
	strh r1, [r0]
	ldr r1, _021E948C ; =0x00004080
	mov r3, #0x74
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E9490 ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x1e
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	strh r1, [r0, #6]
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #4
	bl ov60_021E7074
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E93D8:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #4
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9476
	mov r0, #1
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	ldr r3, _021E949C ; =_021EB39C
	add r2, sp, #0x14
	mov r5, #5
_021E93F4:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E93F4
	ldr r0, [r3]
	mov r1, #0xfd
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x14
	bl ov60_021E7398
	mov r0, #0x2f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xfe
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #5
	mov r3, #0
	bl ov60_021E7074
	mov r0, #0x1f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xfe
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #6
	mov r3, #0
	bl ov60_021E7074
	mov r0, #7
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xfe
	add r4, #0x30
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #7
	mov r3, #0
	bl ov60_021E7074
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021E9476
_021E9460:
	add r4, #0x30
	add r0, r4, #0
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9476
	add sp, #0x1fc
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E9476:
	mov r0, #0
	add sp, #0x1fc
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	nop
_021E9480: .word _021EB4FC
_021E9484: .word 0x000046B9
_021E9488: .word 0x04001042
_021E948C: .word 0x00004080
_021E9490: .word 0xFFFFC0FF
_021E9494: .word _021EB528
_021E9498: .word _021EB370
_021E949C: .word _021EB39C
	thumb_func_end IntroMovie_Scene3_Main

	thumb_func_start IntroMovie_Scene3_Exit
IntroMovie_Scene3_Exit: ; 0x021E94A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r7, r1, #0
	bl IntroMovie_GetBgConfig
	str r0, [sp, #4]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _021E957C
	bl Camera_UnsetStaticPtr
	add r0, r7, #0
	add r0, #0x80
	ldr r0, [r0]
	bl Camera_Delete
	mov r0, #0
	str r0, [sp, #8]
_021E94CE:
	ldr r1, [sp, #8]
	mov r0, #0x68
	mul r0, r1
	mov r5, #0
	add r6, r7, r0
_021E94D8:
	lsl r4, r5, #2
	add r1, r6, r4
	mov r0, #7
	add r1, #0xe4
	lsl r0, r0, #6
	ldr r1, [r1]
	add r0, r7, r0
	bl NNS_G3dFreeAnmObj
	add r0, r6, r4
	add r0, #0xdc
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _021E94D8
	add r6, #0xd8
	ldr r0, [r6]
	bl FreeToHeap
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #3
	blo _021E94CE
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl GF_3DVramMan_Delete
	mov r4, #0
_021E9520:
	lsl r0, r4, #2
	add r0, r7, r0
	ldr r0, [r0, #4]
	bl FreeToHeap
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E9520
	mov r4, #0
_021E9536:
	lsl r0, r4, #2
	add r0, r7, r0
	ldr r0, [r0, #0x18]
	bl FreeToHeap
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021E9536
	ldr r0, [r7, #0x14]
	bl FreeToHeap
	ldr r0, [sp]
	add r1, r7, #0
	bl ov60_021E9878
	ldr r0, [sp, #4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #4]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #4]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #4]
	mov r1, #7
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r7, #1]
_021E957C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end IntroMovie_Scene3_Exit

	thumb_func_start ov60_021E9580
ov60_021E9580: ; 0x021E9580
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl IntroMovie_GetBgConfig
	add r3, sp, #0x70
	ldr r5, _021E9624 ; =_021EB268
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E9628 ; =_021EB2DC
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E962C ; =_021EB2F8
	add r3, sp, #0x38
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
	ldr r5, _021E9630 ; =_021EB314
	add r3, sp, #0x1c
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
	ldr r5, _021E9634 ; =_021EB330
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E9624: .word _021EB268
_021E9628: .word _021EB2DC
_021E962C: .word _021EB2F8
_021E9630: .word _021EB314
_021E9634: .word _021EB330
	thumb_func_end ov60_021E9580

	thumb_func_start ov60_021E9638
ov60_021E9638: ; 0x021E9638
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, _021E9760 ; =_021EB288
	str r0, [sp, #0x10]
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x20
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _021E9764 ; =_021EB25C
	add r2, sp, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0x28
	str r0, [r2]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r1, #0x2e
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	add r7, r6, #0
	mov r4, #0
	add r7, #0x24
_021E9692:
	mov r0, #0x4a
	lsl r5, r4, #2
	str r0, [sp]
	add r1, sp, #0x20
	ldr r1, [r1, r5]
	add r0, #0xbe
	mov r2, #1
	add r3, r7, r5
	bl GfGfxLoader_GetScrnData
	add r1, r6, r5
	str r0, [r1, #4]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E9692
	add r7, r6, #0
	mov r5, #0
	add r7, #0x38
_021E96BA:
	mov r0, #0x4a
	lsl r4, r5, #2
	str r0, [sp]
	add r1, sp, #0x14
	ldr r1, [r1, r4]
	add r0, #0xbe
	mov r2, #1
	add r3, r7, r4
	bl GfGfxLoader_GetScrnData
	add r1, r6, r4
	str r0, [r1, #0x18]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _021E96BA
	mov r0, #0x4a
	add r3, r6, #0
	str r0, [sp]
	add r0, #0xbe
	mov r1, #0x2f
	mov r2, #1
	add r3, #0x34
	bl GfGfxLoader_GetScrnData
	str r0, [r6, #0x14]
	ldr r3, [r6, #0x24]
	mov r0, #0
	str r0, [sp]
	add r2, r3, #0
	ldr r0, [sp, #0x10]
	ldr r3, [r3, #8]
	mov r1, #4
	add r2, #0xc
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r1, #0x30
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r1, #0x31
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
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
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9760: .word _021EB288
_021E9764: .word _021EB25C
	thumb_func_end ov60_021E9638

	thumb_func_start ov60_021E9768
ov60_021E9768: ; 0x021E9768
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, _021E9874 ; =_021EB1F4
	add r4, r0, #0
	bl ov60_021E6ED8
	add r0, r4, #0
	bl ov60_021E6F20
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	mov r2, #0x42
	mov r3, #1
	bl AddCharResObjFromNarc
	str r0, [r5, #0x44]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x41
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x48]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x44
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x4c]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x43
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x50]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	mov r2, #0x46
	mov r3, #1
	bl AddCharResObjFromNarc
	str r0, [r5, #0x54]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x45
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x58]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x48
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x5c]
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x47
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x60]
	mov r4, #0
_021E984E:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #0x44]
	bl sub_0200ACF0
	ldr r0, [r6, #0x48]
	bl sub_0200AF94
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E984E
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E9874: .word _021EB1F4
	thumb_func_end ov60_021E9768

	thumb_func_start ov60_021E9878
ov60_021E9878: ; 0x021E9878
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0x64]
	bl Sprite_Delete
	ldr r0, [r5, #0x68]
	bl Sprite_Delete
	ldr r0, [r5, #0x6c]
	bl Sprite_Delete
	ldr r0, [r5, #0x70]
	bl Sprite_Delete
	ldr r0, [r5, #0x74]
	bl Sprite_Delete
	mov r4, #0
_021E989E:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #0x44]
	bl sub_0200AEB0
	ldr r0, [r6, #0x48]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E989E
	add r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E9878

	thumb_func_start ov60_021E98C0
ov60_021E98C0: ; 0x021E98C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	ldr r3, _021E99B0 ; =_021EB214
	str r0, [sp, #8]
	add r5, r1, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021E99B4 ; =_021EB220
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, [sp, #8]
	str r0, [r2]
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	mov r0, #2
	mov r2, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x2c]
	mov r0, #0x26
	lsl r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl CreateSprite
	str r0, [r5, #0x64]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x64]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x64]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #3
	mov r2, #0
	mov r3, #2
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x10
	str r0, [sp, #0x2c]
	mov r0, #0x26
	lsl r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl CreateSprite
	str r0, [r5, #0x68]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x68]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x68]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r7, #0
	add r6, sp, #0x18
	add r4, sp, #0xc
_021E9962:
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #3
	mov r2, #0
	mov r3, #2
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x2c]
	ldr r0, [r6]
	lsl r0, r0, #0xc
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl CreateSprite
	str r0, [r5, #0x6c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x6c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x6c]
	ldr r1, [r4]
	bl Set2dSpriteAnimSeqNo
	add r7, r7, #1
	add r6, r6, #4
	add r5, r5, #4
	add r4, r4, #4
	cmp r7, #3
	blt _021E9962
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E99B0: .word _021EB214
_021E99B4: .word _021EB220
	thumb_func_end ov60_021E98C0

	thumb_func_start ov60_021E99B8
ov60_021E99B8: ; 0x021E99B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0xc]
	mov r0, #0x42
	lsl r0, r0, #2
	mov r1, #0x4a
	bl NARC_New
	str r0, [sp, #0x18]
	mov r1, #7
	ldr r0, [sp, #0xc]
	lsl r1, r1, #6
	add r0, r0, r1
	mov r1, #0x4a
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0
	str r0, [sp, #0x1c]
_021E99DE:
	ldr r0, [sp, #0x1c]
	mov r1, #0x68
	add r7, r0, #0
	mul r7, r1
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	lsl r2, r1, #2
	ldr r1, _021E9B44 ; =_021EB22C
	ldr r1, [r1, r2]
	mov r2, #0x4a
	bl NARC_AllocAndReadWholeMember
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0xc]
	add r1, r1, r7
	add r1, #0xd8
	str r0, [r1]
	ldr r0, [sp, #0xc]
	add r2, #0xd8
	add r0, #0x84
	add r0, r0, r7
	add r1, sp, #0x28
	add r2, r2, r7
	bl sub_0201F51C
	ldr r0, [sp, #0xc]
	add r0, r0, r7
	add r0, #0xd8
	ldr r0, [r0]
	bl NNS_G3dGetTex
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r2, #0x40
	bl NNSi_G3dModifyMatFlag
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r2, #0x80
	bl NNSi_G3dModifyMatFlag
	mov r2, #2
	ldr r0, [sp, #0x28]
	mov r1, #0
	lsl r2, r2, #8
	bl NNSi_G3dModifyMatFlag
	mov r2, #1
	ldr r0, [sp, #0x28]
	mov r1, #0
	lsl r2, r2, #0xa
	bl NNSi_G3dModifyMatFlag
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r2, #0xf
	bl NNSi_G3dModifyPolygonAttrMask
	ldr r0, [sp, #0x1c]
	ldr r1, _021E9B48 ; =_021EB2C4
	lsl r0, r0, #3
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	mov r6, #0
	add r5, r0, r7
	str r0, [sp, #0x20]
	add r0, #0x84
	str r0, [sp, #0x20]
_021E9A6A:
	ldr r1, [sp, #0x10]
	lsl r4, r6, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r1, r4]
	mov r2, #0x4a
	bl NARC_AllocAndReadWholeMember
	add r1, r5, r4
	add r1, #0xdc
	str r0, [r1]
	add r0, r5, r4
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	str r0, [sp, #0x24]
	mov r0, #7
	ldr r1, [sp, #0xc]
	lsl r0, r0, #6
	add r0, r1, r0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl NNS_G3dAllocAnmObj
	add r1, r5, r4
	add r1, #0xe4
	str r0, [r1]
	add r0, r5, r4
	add r0, #0xe4
	ldr r0, [r0]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x14]
	bl NNS_G3dAnmObjInit
	add r1, r5, r4
	ldr r0, [sp, #0x20]
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r0, r7
	bl NNS_G3dRenderObjAddAnmObj
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	blo _021E9A6A
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	cmp r0, #3
	blo _021E99DE
	ldr r0, [sp, #0x18]
	bl NARC_Delete
	mov r0, #0x4a
	bl Camera_New
	ldr r1, [sp, #0xc]
	add r3, sp, #0x2c
	add r1, #0x80
	ldr r4, _021E9B4C ; =_021EB238
	str r0, [r1]
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r1, _021E9B50 ; =0x0019AEC1
	str r0, [r3]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r3, _021E9B54 ; =0x000005C1
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #8]
	add r0, r2, #0
	ldr r2, _021E9B58 ; =_021EB29C
	bl Camera_Init_FromTargetDistanceAndAngle
	ldr r1, [sp, #0xc]
	ldr r0, _021E9B5C ; =0x00000981
	add r1, #0x80
	ldr r1, [r1]
	bl Camera_SetPerspectiveAngle
	ldr r0, [sp, #0xc]
	add r0, #0x80
	str r0, [sp, #0xc]
	ldr r0, [r0]
	bl Camera_SetStaticPtr
	mov r0, #0x1f
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xe
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #5
	mov r2, #2
	add r3, r1, #0
	bl NNS_G3dGlbPolygonAttr
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9B44: .word _021EB22C
_021E9B48: .word _021EB2C4
_021E9B4C: .word _021EB238
_021E9B50: .word 0x0019AEC1
_021E9B54: .word 0x000005C1
_021E9B58: .word _021EB29C
_021E9B5C: .word 0x00000981
	thumb_func_end ov60_021E99B8

	thumb_func_start ov60_021E9B60
ov60_021E9B60: ; 0x021E9B60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r4, _021E9BF0 ; =_021EB34C
	add r5, r0, #0
	add r3, sp, #0x18
	mov r2, #4
_021E9B6C:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E9B6C
	ldr r0, [r4]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021E9BF4 ; =_021EB244
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, _021E9BF8 ; =0x0000FFFF
	cmp r4, r0
	beq _021E9BEC
	bl Thunk_G3X_Reset
	bl Camera_PushLookAtToNNSGlb
	lsl r0, r4, #0x18
	lsr r1, r0, #0x18
	mov r4, #1
	mov r0, #0x68
	add r7, r1, #0
	mul r7, r0
	mov r2, #0
	add r3, r5, r7
	lsl r4, r4, #0xc
_021E9BB4:
	lsl r0, r2, #2
	add r0, r3, r0
	add r0, #0xe4
	ldr r1, [r0]
	ldr r6, [r1, #8]
	ldr r0, [r1]
	ldrh r6, [r6, #4]
	add r0, r0, r4
	lsl r6, r6, #0xc
	cmp r0, r6
	bge _021E9BCC
	str r0, [r1]
_021E9BCC:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #2
	blo _021E9BB4
	add r5, #0x84
	add r0, r5, r7
	add r1, sp, #0
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl Draw3dModel
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
_021E9BEC:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9BF0: .word _021EB34C
_021E9BF4: .word _021EB244
_021E9BF8: .word 0x0000FFFF
	thumb_func_end ov60_021E9B60

	thumb_func_start ov60_021E9BFC
ov60_021E9BFC: ; 0x021E9BFC
	push {r3, lr}
	ldr r0, _021E9C68 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _021E9C6C ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021E9C70 ; =0x0000CFFB
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	ldr r0, _021E9C74 ; =_021EB278
	bl G3X_SetEdgeColorTable
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _021E9C78 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _021E9C7C ; =0xBFFF0000
	ldr r0, _021E9C80 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	nop
_021E9C68: .word 0x04000008
_021E9C6C: .word 0xFFFFCFFD
_021E9C70: .word 0x0000CFFB
_021E9C74: .word _021EB278
_021E9C78: .word 0x00007FFF
_021E9C7C: .word 0xBFFF0000
_021E9C80: .word 0x04000580
	thumb_func_end ov60_021E9BFC

	thumb_func_start ov60_021E9C84
ov60_021E9C84: ; 0x021E9C84
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [sp]
	mov r1, #0x30
	mul r1, r0
	ldr r2, _021E9CF0 ; =_021EB554
	lsl r0, r0, #3
	add r6, r2, r1
	ldr r1, _021E9CF4 ; =_021EB2AC
	mov r4, #0
	add r5, r1, r0
	mov r7, #0xc
_021E9C9C:
	add r1, r4, #0
	mul r1, r7
	add r3, r6, r1
	ldr r2, [r3, #4]
	ldr r1, [r6, r1]
	ldr r3, [r3, #8]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, r4, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl NNS_G3dGlbLightVector
	lsl r1, r4, #1
	ldrh r1, [r5, r1]
	add r0, r4, #0
	bl NNS_G3dGlbLightColor
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E9C9C
	ldr r0, [sp]
	ldr r1, _021E9CF8 ; =_021EB208
	lsl r4, r0, #1
	ldr r0, _021E9CFC ; =_021EB202
	ldrh r1, [r1, r4]
	ldrh r0, [r0, r4]
	mov r2, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _021E9D00 ; =_021EB1FC
	ldr r1, _021E9D04 ; =_021EB20E
	ldrh r0, [r0, r4]
	ldrh r1, [r1, r4]
	mov r2, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9CF0: .word _021EB554
_021E9CF4: .word _021EB2AC
_021E9CF8: .word _021EB208
_021E9CFC: .word _021EB202
_021E9D00: .word _021EB1FC
_021E9D04: .word _021EB20E
	thumb_func_end ov60_021E9C84

	; file boundary

	thumb_func_start IntroMovie_Scene4
IntroMovie_Scene4: ; 0x021E9D08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetIntroSkippedFlag
	cmp r0, #0
	beq _021E9D1A
	mov r0, #2
	strb r0, [r4]
_021E9D1A:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E9D2A
	cmp r0, #1
	beq _021E9D3A
	cmp r0, #2
	beq _021E9D56
	b _021E9D62
_021E9D2A:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene4_Init
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E9D62
_021E9D3A:
	add r0, r5, #0
	bl IntroMovie_GetTotalFrameCount
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene4_Main
	cmp r0, #0
	beq _021E9D62
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E9D62
_021E9D56:
	add r0, r5, #0
	add r1, r4, #0
	bl IntroMovie_Scene4_Exit
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E9D62:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end IntroMovie_Scene4

	thumb_func_start ov60_021E9D68
ov60_021E9D68: ; 0x021E9D68
	push {r3, lr}
	bl IntroMovie_GetBgConfig
	bl DoScheduledBgGpuUpdates
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021E9D68

	thumb_func_start IntroMovie_Scene4_Init
IntroMovie_Scene4_Init: ; 0x021E9D78
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetBgConfig
	add r6, r0, #0
	bl sub_020216C8
	bl sub_02022638
	ldr r0, _021E9E6C ; =gSystem + 0x60
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
	bl ov60_021EA2A0
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E9E70 ; =ov60_021E9D68
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r4, #0
	bl ov60_021EA3A0
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov60_021E6FAC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EA508
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EA700
	mov r0, #4
	str r0, [sp]
	ldr r0, _021E9E74 ; =ov60_021EA918
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	str r0, [r4, #0x5c]
	bl sub_02014DA0
	mov r1, #0x12
	mov r0, #0x4a
	lsl r1, r1, #0xa
	bl AllocFromHeap
	str r0, [r4, #0x60]
	mov r0, #1
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	mov r3, #0x12
	ldr r0, _021E9E78 ; =ov60_021EA828
	ldr r1, _021E9E7C ; =ov60_021EA84C
	ldr r2, [r4, #0x60]
	lsl r3, r3, #0xa
	bl sub_02014DB4
	str r0, [r4, #0x64]
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl Camera_SetPerspectiveClippingPlane
	mov r0, #0x3b
	mov r1, #4
	mov r2, #0x4a
	bl sub_02015264
	add r1, r0, #0
	ldr r0, [r4, #0x64]
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	add r0, r5, #0
	add r1, r6, #0
	bl ov60_021EA4AC
	mov r1, #0
	ldr r0, _021E9E80 ; =0x04000050
	mov r2, #0x3e
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E9E6C: .word gSystem + 0x60
_021E9E70: .word ov60_021E9D68
_021E9E74: .word ov60_021EA918
_021E9E78: .word ov60_021EA828
_021E9E7C: .word ov60_021EA84C
_021E9E80: .word 0x04000050
	thumb_func_end IntroMovie_Scene4_Init

	thumb_func_start IntroMovie_Scene4_Main
IntroMovie_Scene4_Main: ; 0x021E9E84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xc0
	add r6, r0, #0
	add r4, r1, #0
	bl IntroMovie_GetBgConfig
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl ov60_021E768C
	add r5, r0, #0
	add r0, r6, #0
	bl IntroMovie_GetSceneStepTimer
	add r7, r0, #0
	add r0, r6, #0
	bl IntroMovie_GetSceneStep
	cmp r0, #0x14
	bls _021E9EAE
	b _021EA1FA
_021E9EAE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E9EBA: ; jump table
	.short _021E9EE4 - _021E9EBA - 2 ; case 0
	.short _021E9F04 - _021E9EBA - 2 ; case 1
	.short _021E9F14 - _021E9EBA - 2 ; case 2
	.short _021E9FAE - _021E9EBA - 2 ; case 3
	.short _021E9FD2 - _021E9EBA - 2 ; case 4
	.short _021E9FE0 - _021E9EBA - 2 ; case 5
	.short _021EA05A - _021E9EBA - 2 ; case 6
	.short _021EA0B2 - _021E9EBA - 2 ; case 7
	.short _021EA0C2 - _021E9EBA - 2 ; case 8
	.short _021EA0D2 - _021E9EBA - 2 ; case 9
	.short _021EA0E6 - _021E9EBA - 2 ; case 10
	.short _021EA0F6 - _021E9EBA - 2 ; case 11
	.short _021EA106 - _021E9EBA - 2 ; case 12
	.short _021EA116 - _021E9EBA - 2 ; case 13
	.short _021EA128 - _021E9EBA - 2 ; case 14
	.short _021EA138 - _021E9EBA - 2 ; case 15
	.short _021EA148 - _021E9EBA - 2 ; case 16
	.short _021EA158 - _021E9EBA - 2 ; case 17
	.short _021EA182 - _021E9EBA - 2 ; case 18
	.short _021EA1D4 - _021E9EBA - 2 ; case 19
	.short _021EA1EA - _021E9EBA - 2 ; case 20
_021E9EE4:
	mov r0, #0xa
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #9
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021E9F04:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E9FD6
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021E9F14:
	ldr r3, _021EA204 ; =_021EB73C
	add r2, sp, #0x94
	mov r7, #5
_021E9F1A:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _021E9F1A
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #0
	add r3, sp, #0x94
	bl ov60_021E7398
	ldr r3, _021EA208 ; =_021EB768
	add r2, sp, #0x68
	mov r7, #5
_021E9F3C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _021E9F3C
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #1
	add r3, sp, #0x68
	bl ov60_021E7398
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [sp, #0xc]
	add r1, #0x30
	mov r2, #5
	mov r3, #0xc0
	bl ov60_021E7074
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	mov r2, #1
	str r0, [sp, #4]
	add r5, #0x30
	add r3, r2, #0
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	sub r3, #0xc1
	bl ov60_021E7074
	ldr r0, [r4, #0x44]
	mov r1, #1
	bl ov60_021E6F28
	ldr r0, [r4, #0x48]
	mov r1, #1
	bl ov60_021E6F28
	mov r0, #2
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #2
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021E9FAE:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9FD6
	add r5, #0x30
	add r0, r5, #0
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9FD6
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021E9FD2:
	cmp r7, #0x19
	bhi _021E9FD8
_021E9FD6:
	b _021EA1FA
_021E9FD8:
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021E9FE0:
	ldr r4, _021EA20C ; =_021EB794
	add r3, sp, #0x3c
	mov r2, #5
_021E9FE6:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E9FE6
	ldr r0, [r4]
	mov r1, #0xa
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #0
	add r3, sp, #0x3c
	bl ov60_021E7398
	ldr r4, _021EA210 ; =_021EB710
	add r3, sp, #0x10
	mov r2, #5
_021EA008:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021EA008
	ldr r0, [r4]
	mov r1, #0xa
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #1
	add r3, sp, #0x10
	bl ov60_021E7398
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [sp, #0xc]
	add r1, #0x30
	mov r2, #5
	mov r3, #0xc0
	bl ov60_021E7074
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	mov r2, #1
	str r0, [sp, #4]
	add r5, #0x30
	add r3, r2, #0
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	sub r3, #0xc1
	bl ov60_021E7074
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA05A:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021EA0DC
	add r5, #0x30
	add r0, r5, #0
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021EA0DC
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl ov60_021E6F28
	ldr r0, [r4, #0x48]
	mov r1, #0
	bl ov60_021E6F28
	mov r0, #2
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #2
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021EA214 ; =0xFFFF1FFF
	and r1, r0
	str r1, [r2]
	ldr r2, _021EA218 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA0B2:
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA0C2:
	add r0, r4, #0
	mov r1, #0
	bl ov60_021EA8C8
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA0D2:
	ldr r0, [r4, #0x64]
	bl sub_020154B0
	cmp r0, #0
	beq _021EA0DE
_021EA0DC:
	b _021EA1FA
_021EA0DE:
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA0E6:
	add r0, r4, #0
	mov r1, #0
	bl ov60_021EA990
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA0F6:
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA106:
	add r0, r4, #0
	mov r1, #1
	bl ov60_021EA8C8
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA116:
	ldr r0, [r4, #0x64]
	bl sub_020154B0
	cmp r0, #0
	bne _021EA1FA
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA128:
	add r0, r4, #0
	mov r1, #1
	bl ov60_021EA990
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA138:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA148:
	add r0, r4, #0
	mov r1, #2
	bl ov60_021EA8C8
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA158:
	ldr r0, [r4, #0x64]
	bl sub_020154B0
	cmp r0, #0
	bne _021EA1FA
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #8
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA182:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EA1FA
	mov r0, #1
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #2
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #4
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r5, #0
	add r7, r5, #0
_021EA1B6:
	lsl r0, r5, #2
	add r0, r4, r0
	ldr r0, [r0, #0x50]
	add r1, r7, #0
	bl ov60_021E6F28
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _021EA1B6
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA1D4:
	mov r0, #0
	bl SetMasterBrightnessNeutral
	ldr r0, [r4, #0x4c]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl IntroMovie_AdvanceSceneStep
	b _021EA1FA
_021EA1EA:
	ldr r0, [r4, #0x4c]
	bl Sprite_IsCellAnimationFinished
	cmp r0, #0
	bne _021EA1FA
	add sp, #0xc0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA1FA:
	bl ov60_021EA8B0
	mov r0, #0
	add sp, #0xc0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA204: .word _021EB73C
_021EA208: .word _021EB768
_021EA20C: .word _021EB794
_021EA210: .word _021EB710
_021EA214: .word 0xFFFF1FFF
_021EA218: .word 0x04001000
	thumb_func_end IntroMovie_Scene4_Main

	thumb_func_start IntroMovie_Scene4_Exit
IntroMovie_Scene4_Exit: ; 0x021EA21C
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
	beq _021EA28A
	ldr r0, _021EA29C ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x64]
	bl sub_02014EBC
	ldr r0, [r5, #0x60]
	bl FreeToHeap
	ldr r0, [r5, #0x5c]
	bl GF_3DVramMan_Delete
	add r0, r6, #0
	add r1, r5, #0
	bl ov60_021EA6AC
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r5, #1]
_021EA28A:
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	beq _021EA298
	bl SysTask_Destroy
	mov r0, #0
	str r0, [r5, #0x6c]
_021EA298:
	pop {r4, r5, r6, pc}
	nop
_021EA29C: .word 0x04000050
	thumb_func_end IntroMovie_Scene4_Exit

	thumb_func_start ov60_021EA2A0
ov60_021EA2A0: ; 0x021EA2A0
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	bl IntroMovie_GetBgConfig
	add r3, sp, #0xa8
	ldr r5, _021EA384 ; =_021EB634
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021EA388 ; =_021EB644
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
	ldr r5, _021EA38C ; =_021EB660
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
	ldr r5, _021EA390 ; =_021EB67C
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
	ldr r5, _021EA394 ; =_021EB698
	add r3, sp, #0x38
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
	ldr r5, _021EA398 ; =_021EB6B4
	add r3, sp, #0x1c
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
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021EA39C ; =_021EB6D0
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021EA384: .word _021EB634
_021EA388: .word _021EB644
_021EA38C: .word _021EB660
_021EA390: .word _021EB67C
_021EA394: .word _021EB698
_021EA398: .word _021EB6B4
_021EA39C: .word _021EB6D0
	thumb_func_end ov60_021EA2A0

	thumb_func_start ov60_021EA3A0
ov60_021EA3A0: ; 0x021EA3A0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x36
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
	mov r1, #0x36
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
	mov r1, #0x3a
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
	mov r1, #0x37
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x38
	add r2, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x39
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
	mov r1, #0x37
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x38
	add r2, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	mov r2, #0
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x35
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x35
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
	thumb_func_end ov60_021EA3A0

	thumb_func_start ov60_021EA4AC
ov60_021EA4AC: ; 0x021EA4AC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	bl ov60_021E768C
	add r4, r0, #0
	mov r0, #0
	mov r2, #5
	str r0, [sp]
	add r1, r4, #0
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, #0x30
	sub r3, #0xc5
	bl ov60_021E7074
	mov r0, #0
	str r0, [sp]
	add r4, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	mov r3, #0xc0
	bl ov60_021E7074
	mov r0, #4
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #2
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #2
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	mov r0, #1
	add r1, r0, #0
	bl GfGfx_EngineATogglePlanes
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021EA4AC

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
	bl ov60_021E6ED8
	add r0, r4, #0
	bl ov60_021E6F20
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
	bl ov60_021E6F00
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
	bl ov60_021E6F3C
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
	bl ov60_021E6F3C
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
	bl ov60_021E6F3C
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
	bl ov60_021E6F3C
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
	bl ov60_021E76A0
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
	bl ov60_021E6FAC
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
	bl ov60_021E768C
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
	bl ov60_021E7074
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
	bl ov60_021E7074
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
	bl ov60_021E7074
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
	bl ov60_021E7074
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

_021EB138:
	.byte 0x02, 0x02, 0x02, 0x02
	.word 0x4A
	.size _021EB138,.-_021EB138
_021EB140:
	.byte 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x00, 0x00
	.size _021EB140,.-_021EB140
_021EB14C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB14C,.-_021EB14C
_021EB15C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB15C,.-_021EB15C
_021EB178:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x05, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.size _021EB178,.-_021EB178
_021EB194:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB194,.-_021EB194
_021EB1B0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x01, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB1B0,.-_021EB1B0
_021EB1CC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00
	.size _021EB1CC,.-_021EB1CC

	; file boundary?

_021EB1F4:
	.byte 0x02, 0x02, 0x02, 0x02
	.word 0x4A
	.size _021EB1F4,.-_021EB1F4
_021EB1FC:
	.byte 0x10, 0x42, 0xCE, 0x41
	.byte 0x31, 0x46
	.size _021EB1FC,.-_021EB1FC
_021EB202:
	.byte 0xEF, 0x3D, 0xCE, 0x41, 0xEF, 0x3D
	.size _021EB202,.-_021EB202
_021EB208:
	.byte 0x69, 0x2D, 0x4A, 0x29, 0x8B, 0x31
	.size _021EB208,.-_021EB208
_021EB20E:
	.byte 0xCE, 0x39
	.byte 0x08, 0x2D, 0x08, 0x1D
	.size _021EB20E,.-_021EB20E
_021EB214:
	.byte 0x20, 0x02, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00, 0x60, 0x02, 0x00, 0x00
	.size _021EB214,.-_021EB214
_021EB220:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.size _021EB220,.-_021EB220
_021EB22C:
	.byte 0x67, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
	.size _021EB22C,.-_021EB22C
_021EB238:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00
	.size _021EB238,.-_021EB238
_021EB244:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.size _021EB244,.-_021EB244
_021EB250:
	.byte 0x38, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00
	.size _021EB250,.-_021EB250
_021EB25C:
	.byte 0x32, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
	.size _021EB25C,.-_021EB25C
_021EB268:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.size _021EB268,.-_021EB268
_021EB278:
	.byte 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.size _021EB278,.-_021EB278
_021EB288:
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x19, 0x00
	.size _021EB288,.-_021EB288
_021EB29C:
	.byte 0x02, 0xD6, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00
	.size _021EB29C,.-_021EB29C
_021EB2AC:
	.byte 0xD6, 0x52, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00, 0x6B, 0x41, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x13, 0x32, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00
	.size _021EB2AC,.-_021EB2AC
_021EB2C4:
	.byte 0x68, 0x00, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
	.size _021EB2C4,.-_021EB2C4
_021EB2DC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB2DC,.-_021EB2DC
_021EB2F8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.size _021EB2F8,.-_021EB2F8
_021EB314:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB314,.-_021EB314
_021EB330:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x03, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB330,.-_021EB330
_021EB34C:
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.size _021EB34C,.-_021EB34C
_021EB370:
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB370,.-_021EB370
_021EB39C:
	.byte 0x46, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB39C,.-_021EB39C
_021EB3C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
	.size _021EB3C8,.-_021EB3C8
_021EB3F4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB3F4,.-_021EB3F4
_021EB420:
	.byte 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB420,.-_021EB420
_021EB44C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB44C,.-_021EB44C
_021EB478:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
	.size _021EB478,.-_021EB478
_021EB4A4:
	.byte 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB4A4,.-_021EB4A4
_021EB4D0:
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB4D0,.-_021EB4D0
_021EB4FC:
	.byte 0x46, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB4FC,.-_021EB4FC
_021EB528:
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
	.size _021EB528,.-_021EB528
_021EB554:
	.byte 0x7E, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x86, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x86, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00
	.size _021EB554,.-_021EB554

	; file boundary?

_021EB5E4:
	.byte 0x04, 0x04, 0x04, 0x04
	.word 0x4A
	.size _021EB5E4,.-_021EB5E4
_021EB5EC:
	.byte 0x56, 0x00, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00
	.size _021EB5EC,.-_021EB5EC
_021EB5F8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00
	.size _021EB5F8,.-_021EB5F8
_021EB604:
	.byte 0x57, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.size _021EB604,.-_021EB604
_021EB610:
	.byte 0x55, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
	.size _021EB610,.-_021EB610
_021EB61C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.size _021EB61C,.-_021EB61C
_021EB628:
	.byte 0x58, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00
	.size _021EB628,.-_021EB628
_021EB634:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.size _021EB634,.-_021EB634
_021EB644:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB644,.-_021EB644
_021EB660:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB660,.-_021EB660
_021EB67C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB67C,.-_021EB67C
_021EB698:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.size _021EB698,.-_021EB698
_021EB6B4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB6B4,.-_021EB6B4
_021EB6D0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size _021EB6D0,.-_021EB6D0
_021EB6EC:
	.byte 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.size _021EB6EC,.-_021EB6EC
_021EB710:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB710,.-_021EB710
_021EB73C:
	.byte 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.size _021EB73C,.-_021EB73C
_021EB768:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
	.size _021EB768,.-_021EB768
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
