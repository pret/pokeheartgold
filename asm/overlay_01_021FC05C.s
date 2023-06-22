#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "overlay_01_021FC05C.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FC05C
ov01_021FC05C: ; 0x021FC05C
	push {r3, r4, lr}
	sub sp, #4
	ldr r0, [r1, #8]
	add r4, r2, #0
	bl ov01_021FC14C
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x13
	bl ov01_021FC1A4
	mov r3, #0
	str r3, [r4, #0x14]
	mov r0, #0x10
	str r0, [sp]
	ldr r0, _021FC0A0 ; =0x04000050
	mov r1, #4
	mov r2, #0x29
	bl G2x_SetBlendAlpha_
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _021FC0A4 ; =SEQ_SE_DP_FW230
	bl PlaySE
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021FC0A0: .word 0x04000050
_021FC0A4: .word SEQ_SE_DP_FW230
	thumb_func_end ov01_021FC05C

	thumb_func_start ov01_021FC0A8
ov01_021FC0A8: ; 0x021FC0A8
	push {r3, r4, lr}
	sub sp, #4
	ldr r0, [r1, #8]
	add r4, r2, #0
	bl ov01_021FC14C
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	mov r3, #0xf
	bl ov01_021FC1A4
	mov r0, #0
	str r0, [r4, #0x14]
	mov r0, #6
	str r0, [sp]
	ldr r0, _021FC0D8 ; =0x04000050
	mov r1, #4
	mov r2, #0x21
	mov r3, #0xa
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021FC0D8: .word 0x04000050
	thumb_func_end ov01_021FC0A8

	thumb_func_start ov01_021FC0DC
ov01_021FC0DC: ; 0x021FC0DC
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FC0DC

	thumb_func_start ov01_021FC0E0
ov01_021FC0E0: ; 0x021FC0E0
	push {r4, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x14]
	cmp r0, #1
	beq _021FC106
	add r0, r4, #0
	bl ov01_021FC1B4
	cmp r0, #0
	beq _021FC0F8
	mov r0, #1
	str r0, [r4, #0x14]
_021FC0F8:
	ldr r1, [r4]
	mov r0, #0x10
	sub r0, r0, r1
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _021FC108 ; =0x04000052
	strh r1, [r0]
_021FC106:
	pop {r4, pc}
	.balign 4, 0
_021FC108: .word 0x04000052
	thumb_func_end ov01_021FC0E0

	thumb_func_start ov01_021FC10C
ov01_021FC10C: ; 0x021FC10C
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FC10C

	thumb_func_start ov01_021FC110
ov01_021FC110: ; 0x021FC110
	ldr r0, [r0, #4]
	ldr r3, _021FC11C ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _021FC120 ; =ov01_02208BCC
	bx r3
	nop
_021FC11C: .word ov01_021E67BC
_021FC120: .word ov01_02208BCC
	thumb_func_end ov01_021FC110

	thumb_func_start ov01_021FC124
ov01_021FC124: ; 0x021FC124
	ldr r3, _021FC128 ; =ov01_021E683C
	bx r3
	.balign 4, 0
_021FC128: .word ov01_021E683C
	thumb_func_end ov01_021FC124

	thumb_func_start ov01_021FC12C
ov01_021FC12C: ; 0x021FC12C
	push {r3, lr}
	bl ov01_021E687C
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC12C

	thumb_func_start ov01_021FC138
ov01_021FC138: ; 0x021FC138
	ldr r0, [r0, #4]
	ldr r3, _021FC144 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _021FC148 ; =ov01_02208BE4
	bx r3
	nop
_021FC144: .word ov01_021E67BC
_021FC148: .word ov01_02208BE4
	thumb_func_end ov01_021FC138

	thumb_func_start ov01_021FC14C
ov01_021FC14C: ; 0x021FC14C
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r1, _021FC19C ; =0x00005D5F
	add r5, r0, #0
	add r0, sp, #4
	strh r1, [r0]
	mov r0, #2
	add r1, sp, #4
	add r2, r0, #0
	mov r3, #0xc2
	bl BG_LoadPlttData
	mov r0, #4
	mov r1, #0x20
	bl AllocFromHeap
	mov r1, #0x11
	mov r2, #0x20
	add r4, r0, #0
	bl memset
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	mov r3, #0x20
	bl BG_LoadCharTilesData
	add r0, r4, #0
	bl FreeToHeap
	ldr r2, _021FC1A0 ; =0x00006001
	add r0, r5, #0
	mov r1, #2
	bl BgFillTilemapBufferAndCommit
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FC19C: .word 0x00005D5F
_021FC1A0: .word 0x00006001
	thumb_func_end ov01_021FC14C

	thumb_func_start ov01_021FC1A4
ov01_021FC1A4: ; 0x021FC1A4
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov01_021FC1A4

	thumb_func_start ov01_021FC1B4
ov01_021FC1B4: ; 0x021FC1B4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	mul r0, r1
	ldr r1, [r4, #0x10]
	bl _s32_div_f
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _021FC1DA
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_021FC1DA:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov01_021FC1B4

	thumb_func_start ov01_021FC1E0
ov01_021FC1E0: ; 0x021FC1E0
	ldr r3, _021FC1E8 ; =BG_SetMaskColor
	mov r0, #2
	mov r1, #0
	bx r3
	.balign 4, 0
_021FC1E8: .word BG_SetMaskColor
	thumb_func_end ov01_021FC1E0

	thumb_func_start ov01_021FC1EC
ov01_021FC1EC: ; 0x021FC1EC
	ldr r3, _021FC1F4 ; =BG_SetMaskColor
	mov r0, #2
	ldr r1, _021FC1F8 ; =0x00007FFF
	bx r3
	.balign 4, 0
_021FC1F4: .word BG_SetMaskColor
_021FC1F8: .word 0x00007FFF
	thumb_func_end ov01_021FC1EC

	thumb_func_start ov01_021FC1FC
ov01_021FC1FC: ; 0x021FC1FC
	push {r4, lr}
	sub sp, #8
	ldr r1, _021FC254 ; =0x00007FFF
	add r4, r0, #0
	add r0, sp, #4
	strh r1, [r0]
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r1, _021FC258 ; =0x0400000C
	mov r0, #3
	ldrh r2, [r1]
	mov r3, #0xc4
	bic r2, r0
	mov r0, #3
	orr r0, r2
	strh r0, [r1]
	mov r0, #2
	add r1, sp, #4
	add r2, r0, #0
	bl BG_LoadPlttData
	mov r1, #2
	str r1, [sp]
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #1
	bl BG_FillCharDataRange
	ldr r0, [r4, #8]
	ldr r2, _021FC25C ; =0x00006002
	mov r1, #2
	bl BgFillTilemapBufferAndCommit
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov01_021FC1E0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021FC254: .word 0x00007FFF
_021FC258: .word 0x0400000C
_021FC25C: .word 0x00006002
	thumb_func_end ov01_021FC1FC

	thumb_func_start ov01_021FC260
ov01_021FC260: ; 0x021FC260
	push {r4, lr}
	sub sp, #8
	ldr r1, _021FC2B8 ; =0x00007FFF
	add r4, r0, #0
	add r0, sp, #4
	strh r1, [r0]
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r1, _021FC2BC ; =0x0400000E
	mov r0, #3
	ldrh r2, [r1]
	mov r3, #0xc4
	bic r2, r0
	mov r0, #3
	orr r2, r0
	strh r2, [r1]
	add r1, sp, #4
	mov r2, #2
	bl BG_LoadPlttData
	mov r2, #2
	str r2, [sp]
	ldr r0, [r4, #8]
	mov r1, #3
	mov r3, #1
	bl BG_FillCharDataRange
	ldr r0, [r4, #8]
	ldr r2, _021FC2C0 ; =0x00006002
	mov r1, #3
	bl BgFillTilemapBufferAndCommit
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov01_021FC1E0
	add sp, #8
	pop {r4, pc}
	nop
_021FC2B8: .word 0x00007FFF
_021FC2BC: .word 0x0400000E
_021FC2C0: .word 0x00006002
	thumb_func_end ov01_021FC260

	thumb_func_start ov01_021FC2C4
ov01_021FC2C4: ; 0x021FC2C4
	mov r0, #0
	bx lr
	thumb_func_end ov01_021FC2C4

	thumb_func_start ov01_021FC2C8
ov01_021FC2C8: ; 0x021FC2C8
	push {r3, lr}
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov01_021EB31C
	ldr r3, _021FC2EC ; =ov01_02208BC0
	mov r2, #0
_021FC2D6:
	ldr r1, [r3]
	cmp r0, r1
	bne _021FC2E0
	mov r0, #0
	pop {r3, pc}
_021FC2E0:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #3
	blt _021FC2D6
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_021FC2EC: .word ov01_02208BC0
	thumb_func_end ov01_021FC2C8

	thumb_func_start ov01_021FC2F0
ov01_021FC2F0: ; 0x021FC2F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021FC302
	bl ov01_021FC124
	mov r0, #0
	str r0, [r4]
_021FC302:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC2F0

	thumb_func_start GetHoneySweetScentWorkSize
GetHoneySweetScentWorkSize: ; 0x021FC30C
	mov r0, #0xc
	bx lr
	thumb_func_end GetHoneySweetScentWorkSize

	thumb_func_start Task_HoneyOrSweetScent
Task_HoneyOrSweetScent: ; 0x021FC310
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #9
	bls _021FC32A
	b _021FC4AE
_021FC32A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021FC336: ; jump table
	.short _021FC34A - _021FC336 - 2 ; case 0
	.short _021FC376 - _021FC336 - 2 ; case 1
	.short _021FC392 - _021FC336 - 2 ; case 2
	.short _021FC3A8 - _021FC336 - 2 ; case 3
	.short _021FC3FA - _021FC336 - 2 ; case 4
	.short _021FC40E - _021FC336 - 2 ; case 5
	.short _021FC434 - _021FC336 - 2 ; case 6
	.short _021FC456 - _021FC336 - 2 ; case 7
	.short _021FC476 - _021FC336 - 2 ; case 8
	.short _021FC488 - _021FC336 - 2 ; case 9
_021FC34A:
	add r0, r5, #0
	bl ov01_021FC2C8
	cmp r0, #1
	bne _021FC36C
	mov r0, #1
	strh r0, [r4, #8]
	add r0, r5, #0
	bl ov01_021FC2C4
	str r0, [r4, #4]
	cmp r0, #0
	beq _021FC39C
	add r0, r5, #0
	bl ov01_021FC1EC
	b _021FC4B2
_021FC36C:
	mov r0, #7
	strh r0, [r4, #8]
	mov r0, #0x14
	strh r0, [r4, #0xa]
	b _021FC4B2
_021FC376:
	add r0, r5, #0
	bl ov01_021FC110
	str r0, [r4]
	mov r0, #2
	mov r1, #0
	strh r0, [r4, #8]
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _021FC4B2
_021FC392:
	ldr r0, [r4]
	bl ov01_021FC12C
	cmp r0, #0
	bne _021FC39E
_021FC39C:
	b _021FC4B2
_021FC39E:
	mov r0, #0x16
	strh r0, [r4, #0xa]
	mov r0, #3
	strh r0, [r4, #8]
	b _021FC4B2
_021FC3A8:
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	sub r0, r0, #1
	strh r0, [r4, #0xa]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	beq _021FC3F4
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _021FC4B2
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl GetMetatileBehaviorAt
	add r1, r0, #0
	add r0, r5, #0
	bl ov02_02247F9C
	cmp r0, #0
	beq _021FC3EE
	mov r0, #6
	strh r0, [r4, #8]
	b _021FC4B2
_021FC3EE:
	mov r0, #4
	strh r0, [r4, #8]
	b _021FC4B2
_021FC3F4:
	mov r0, #4
	strh r0, [r4, #8]
	b _021FC4B2
_021FC3FA:
	ldr r0, [r4]
	bl ov01_021FC124
	add r0, r5, #0
	bl ov01_021FC138
	str r0, [r4]
	mov r0, #5
	strh r0, [r4, #8]
	b _021FC4B2
_021FC40E:
	ldr r0, [r4]
	bl ov01_021FC12C
	cmp r0, #0
	beq _021FC4B2
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _021FC4B8 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #2
	mov r1, #3
	bl SetBgPriority
	mov r0, #8
	strh r0, [r4, #8]
	b _021FC4B2
_021FC434:
	bl ov01_021FC2F0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021FC444
	add r0, r5, #0
	bl ov01_021FC260
_021FC444:
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_02247170
	cmp r0, #0
	bne _021FC4B2
	bl GF_AssertFail
	b _021FC4B2
_021FC456:
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #0xa]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _021FC4B2
	mov r2, #0
	ldr r1, _021FC4BC ; =0x000007E3
	add r0, r6, #0
	add r3, r2, #0
	bl QueueScript
	mov r0, #9
	strh r0, [r4, #8]
	b _021FC4B2
_021FC476:
	mov r2, #0
	ldr r1, _021FC4C0 ; =0x000007E2
	add r0, r6, #0
	add r3, r2, #0
	bl QueueScript
	mov r0, #9
	strh r0, [r4, #8]
	b _021FC4B2
_021FC488:
	bl ov01_021FC2F0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021FC498
	add r0, r5, #0
	bl ov01_021FC1FC
_021FC498:
	ldr r0, [r5, #8]
	mov r1, #2
	mov r2, #0
	bl BgFillTilemapBufferAndCommit
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	pop {r4, r5, r6, pc}
_021FC4AE:
	bl GF_AssertFail
_021FC4B2:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021FC4B8: .word 0x04000050
_021FC4BC: .word 0x000007E3
_021FC4C0: .word 0x000007E2
	thumb_func_end Task_HoneyOrSweetScent

	.rodata

ov01_02208BC0: ; 0x02208BC0
	.word 1, 5, 9

ov01_02208BCC: ; 0x02208BCC
	.word 0x00000400
	.word 0x00000018
	.word ov01_021FC05C
	.word ov01_021FC0DC
	.word ov01_021FC0E0
	.word ov01_021FC10C

ov01_02208BE4: ; 0x02208BE4
	.word 0x00000400
	.word 0x00000018
	.word ov01_021FC0A8
	.word ov01_021FC0DC
	.word ov01_021FC0E0
	.word ov01_021FC10C
