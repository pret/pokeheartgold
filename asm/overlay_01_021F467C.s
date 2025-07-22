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
	.include "overlay_01_021F467C.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021F467C
ov01_021F467C: ; 0x021F467C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #2
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #4
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	bl GX_ResetBankForBG
	mov r0, #4
	add r1, r0, #0
	bl AllocFromHeap
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	mov r2, #4
	bl MIi_CpuClear32
	ldr r6, _021F46D8 ; =ov01_02206B94
	add r3, sp, #0
	mov r2, #5
_021F46BA:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F46BA
	ldr r0, [r6]
	str r0, [r3]
	add r0, sp, #0
	str r5, [sp, #0x20]
	str r4, [sp, #0x24]
	bl ov01_021F4464
	str r0, [r7]
	add r0, r7, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F46D8: .word ov01_02206B94
	thumb_func_end ov01_021F467C

	thumb_func_start ov01_021F46DC
ov01_021F46DC: ; 0x021F46DC
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	ldr r0, [r4]
	mov r2, #0
	add r3, r1, #0
	bl ov01_021F44B4
	mov r0, #4
	bl GX_SetBankForBG
	mov r0, #0xe
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	ldr r1, [r4]
	mov r0, #4
	bl Heap_FreeExplicit
	pop {r4, pc}
	thumb_func_end ov01_021F46DC

	.rodata

ov01_02206B94: ; 0x02206B94
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
