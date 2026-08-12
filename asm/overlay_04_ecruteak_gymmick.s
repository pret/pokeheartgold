#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_MortyGymTrainerObjectToCandleIdx
ov04_MortyGymTrainerObjectToCandleIdx: ; 0x02254F20
	push {r3, lr}
	bl MapObject_GetID
	ldr r2, _02254F40 ; =sMortyGymTrainerObjectIds
	mov r3, #0
_02254F2A:
	lsl r1, r3, #2
	ldr r1, [r2, r1]
	cmp r0, r1
	beq _02254F3C
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #4
	blo _02254F2A
_02254F3C:
	add r0, r3, #0
	pop {r3, pc}
	.balign 4, 0
_02254F40: .word sMortyGymTrainerObjectIds
	thumb_func_end ov04_MortyGymTrainerObjectToCandleIdx

	thumb_func_start ov04_02254F44
ov04_02254F44: ; 0x02254F44
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObjectManager_GetObjectCount
	add r5, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObjectManager_GetObjects
	mov r4, #0
	str r0, [sp]
	cmp r5, #0
	ble _02254F88
	add r6, r4, #0
	add r7, sp, #0
_02254F62:
	ldr r0, [sp]
	bl MapObject_CheckActive
	cmp r0, #1
	bne _02254F7C
	ldr r0, [sp]
	bl ov01_021F72DC
	bl sub_02023F90
	add r1, r6, #0
	bl NNS_G3dMdlSetMdlFogEnableFlagAll
_02254F7C:
	add r0, r7, #0
	bl MapObjectArray_NextObject2
	add r4, r4, #1
	cmp r4, r5
	blt _02254F62
_02254F88:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02254F44

    .rodata

sMortyGymTrainerObjectIds: ; 0x02257604
	.word obj_T27GYM0101_itako
	.word obj_T27GYM0101_itako_2
	.word obj_T27GYM0101_itako_3
	.word obj_T27GYM0101_itako_4
