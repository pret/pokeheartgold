#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "unk_0206793C.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0206793C
sub_0206793C: ; 0x0206793C
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r2, r0, #0
	ldr r1, _02067958 ; =_020FE79C
	add r0, r4, #0
	add r2, #0xc
	bl CallApplicationAsTask
	pop {r4, pc}
	.balign 4, 0
_02067958: .word _020FE79C
	thumb_func_end sub_0206793C

	thumb_func_start Task_NPCTrade
Task_NPCTrade: ; 0x0206795C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #6
	bhi _02067A16
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02067982: ; jump table
	.short _02067990 - _02067982 - 2 ; case 0
	.short _020679B8 - _02067982 - 2 ; case 1
	.short _020679C6 - _02067982 - 2 ; case 2
	.short _020679D4 - _02067982 - 2 ; case 3
	.short _020679E2 - _02067982 - 2 ; case 4
	.short _020679F0 - _02067982 - 2 ; case 5
	.short _020679FE - _02067982 - 2 ; case 6
_02067990:
	ldr r0, [r4, #0x24]
	add r3, r4, #0
	str r0, [sp]
	ldr r0, [r4, #0x28]
	add r3, #0xc
	str r0, [sp, #4]
	ldr r1, [r4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl NPCTrade_CreateTradeAnim
	ldr r1, [r4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl NPCTrade_ReceiveMonToSlot
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679B8:
	add r0, r5, #0
	bl PalleteFadeUntilFinished
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679C6:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679D4:
	add r0, r5, #0
	bl sub_0206793C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679E2:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679F0:
	add r0, r5, #0
	bl sub_0205532C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679FE:
	ldr r0, [r4, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #0x28]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02067A16:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end Task_NPCTrade

	thumb_func_start CallTask_NPCTrade
CallTask_NPCTrade: ; 0x02067A1C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x2c
	add r6, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x2c
	add r4, r0, #0
	bl memset
	mov r0, #0
	str r0, [r4, #4]
	str r5, [r4]
	ldr r0, [sp]
	str r6, [r4, #8]
	bl AllocMonZeroed
	str r0, [r4, #0x24]
	ldr r0, [sp]
	bl AllocMonZeroed
	str r0, [r4, #0x28]
	ldr r1, _02067A5C ; =Task_NPCTrade
	add r0, r7, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02067A5C: .word Task_NPCTrade
	thumb_func_end CallTask_NPCTrade

	.rodata

	.balign 4, 0
_020FE79C:
	.word ov71_02246960, ov71_02246BB8, ov71_02246B58, FS_OVERLAY_ID(OVY_71)
