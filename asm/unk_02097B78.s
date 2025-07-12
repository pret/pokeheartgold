#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02097B78.inc"
	.include "global.inc"

	.text

	thumb_func_start LegendaryCinematic_Init
LegendaryCinematic_Init: ; 0x02097B78
	push {r3, r4, r5, lr}
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x99
	lsl r2, r2, #0x12
	bl Heap_Create
	ldr r1, _02097BA8 ; =0x0000041C
	add r0, r5, #0
	mov r2, #0x99
	bl OverlayManager_CreateAndGetData
	ldr r2, _02097BA8 ; =0x0000041C
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetArgs
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02097BA8: .word 0x0000041C
	thumb_func_end LegendaryCinematic_Init

	thumb_func_start LegendaryCinematic_Main
LegendaryCinematic_Main: ; 0x02097BAC
	push {r3, lr}
	bl OverlayManager_GetData
	ldr r1, [r0]
	add r1, #0x4c
	ldrh r1, [r1]
	lsl r2, r1, #2
	ldr r1, _02097BCC ; =_02108F38
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _02097BC8
	mov r0, #1
	pop {r3, pc}
_02097BC8:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02097BCC: .word _02108F38
	thumb_func_end LegendaryCinematic_Main

	thumb_func_start LegendaryCinematic_Exit
LegendaryCinematic_Exit: ; 0x02097BD0
	push {r3, lr}
	bl OverlayManager_FreeData
	mov r0, #0x99
	bl Heap_Destroy
	mov r0, #1
	pop {r3, pc}
	thumb_func_end LegendaryCinematic_Exit

	.rodata

	.balign 4, 0
_02108F38:
	.word ScriptCinematic_HoOh
	.word ScriptCinematic_Lugia
	.word ScriptCinematic_Arceus
