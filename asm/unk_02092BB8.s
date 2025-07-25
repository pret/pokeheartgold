#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02092BB8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02092BB8
sub_02092BB8: ; 0x02092BB8
	push {r4, lr}
	mov r1, #4
	bl Heap_Alloc
	mov r1, #0
	mov r2, #2
	add r4, r0, #0
	bl sub_02092BD8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02092BB8

	thumb_func_start sub_02092BD0
sub_02092BD0: ; 0x02092BD0
	ldr r3, _02092BD4 ; =Heap_Free
	bx r3
	.balign 4, 0
_02092BD4: .word Heap_Free
	thumb_func_end sub_02092BD0

	thumb_func_start sub_02092BD8
sub_02092BD8: ; 0x02092BD8
	strh r1, [r0]
	strh r2, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02092BD8

	thumb_func_start sub_02092BE0
sub_02092BE0: ; 0x02092BE0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end sub_02092BE0

	thumb_func_start sub_02092BE4
sub_02092BE4: ; 0x02092BE4
	ldrh r0, [r0]
	bx lr
	thumb_func_end sub_02092BE4
