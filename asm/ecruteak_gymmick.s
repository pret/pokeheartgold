#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_02254CBC
ov04_02254CBC: ; 0x02254CBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #1
	bl SavGymmick_AssertMagic_GetData
	add r7, r0, #0
	mov r0, #4
	mov r1, #0x1c
	bl AllocFromHeap
	ldr r1, [r5, #4]
	mov r2, #0x1c
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	mov r1, #1
	lsl r1, r1, #8
	ldr r4, [r0, #0x24]
	add r0, r1, #0
	add r0, #0x1c
	str r1, [r5, r0]
	mov r0, #0xa
	mov r3, #0
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, [r5, #0x4c]
	sub r1, r3, #1
	mov r2, #1
	bl ov01_021EA864
	mov r1, #0
	ldr r0, [r5, #0x4c]
	mvn r1, r1
	mov r2, #0
	mov r3, #0x1f
	bl ov01_021EA89C
	mov r1, #0
	add r2, sp, #0x14
	sub r0, r1, #1
_02254D1E:
	add r1, r1, #1
	strb r0, [r2]
	add r2, r2, #1
	cmp r1, #0x20
	blt _02254D1E
	ldr r0, [r5, #0x4c]
	add r1, sp, #0x14
	bl ov01_021EA8C4
	add r0, r5, #0
	bl ov04_02254F44
	mov r6, #0
_02254D38:
	ldr r0, [r5, #0x3c]
	add r1, r6, #2
	bl GetMapObjectByID
	add r1, sp, #8
	bl MapObject_GetPositionVec
	ldr r0, [r5, #0x54]
	mov r1, #0x80
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r2, sp, #8
	mov r3, #0
	bl ov01_021F3C0C
	str r0, [r4]
	ldrb r0, [r7, r6]
	cmp r0, #0
	beq _02254D78
	add r0, r5, #0
	ldr r1, [r4]
	add r0, #0x9c
	lsl r1, r1, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	mov r1, #1
	bl ov01_021F3B2C
_02254D78:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02254D38
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02254CBC

	thumb_func_start ov04_02254D84
ov04_02254D84: ; 0x02254D84
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_02254D84

	thumb_func_start ov04_02254D98
ov04_02254D98: ; 0x02254D98
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r1, [r6, #4]
	ldr r5, [r1, #0x24]
	mov r1, #0x1e
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	bl ov04_MortyGymTrainerObjectToCandleIdx
	cmp r0, #4
	bne _02254DB8
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02254DB8:
	str r0, [r5, #0x10]
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [r5, #0x18]
	ldr r0, _02254DCC ; =ov04_02254E20
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02254DCC: .word ov04_02254E20
	thumb_func_end ov04_02254D98

	thumb_func_start ov04_02254DD0
ov04_02254DD0: ; 0x02254DD0
	ldr r0, [r0, #4]
	ldr r3, _02254DDC ; =sub_0200E390
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02254DDC: .word DestroySysTask
	thumb_func_end ov04_02254DD0

	thumb_func_start ov04_02254DE0
ov04_02254DE0: ; 0x02254DE0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #4]
	ldr r4, [r2, #0x24]
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	ldr r0, [r6]
	bl ov04_MortyGymTrainerObjectToCandleIdx
	str r0, [r4, #0x10]
	ldr r0, [r6]
	mov r1, #0x10
	str r0, [r4, #0x18]
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r1, #0
	str r1, [r2]
	mov r0, #1
	str r0, [r2, #4]
	str r1, [r2, #8]
	str r5, [r2, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, _02254E1C ; =ov04_02254E50
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_02254E1C: .word ov04_02254E50
	thumb_func_end ov04_02254DE0

	thumb_func_start ov04_02254E20
ov04_02254E20: ; 0x02254E20
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r0, [r5, #4]
	add r1, sp, #0
	ldr r4, [r0, #0x24]
	ldr r0, [r4, #0x18]
	bl MapObject_GetPositionVec
	ldr r1, [r4, #0x10]
	add r5, #0x9c
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	add r1, sp, #0
	bl ov01_021F3B1C
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov04_02254E20

	thumb_func_start ov04_02254E50
ov04_02254E50: ; 0x02254E50
	push {r4, r5, r6, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, [r1, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _02254E6E
	cmp r0, #1
	beq _02254E86
	cmp r0, #2
	beq _02254EFE
	b _02254F18
_02254E6E:
	ldr r1, [r4, #8]
	add r0, r1, #1
	str r0, [r4, #8]
	cmp r1, #0x1e
	blt _02254F18
	ldr r0, _02254F1C ; =SEQ_SE_GS_ROUSOKU_KIERU
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02254F18
_02254E86:
	add r1, #0x9c
	ldr r0, [r1]
	ldr r1, [r5, #0x10]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	ldr r1, [r4, #4]
	add r6, r0, #0
	cmp r1, #4
	blt _02254ECC
	mov r1, #1
	bl ov01_021F3B2C
	ldr r0, [r4, #0xc]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #1
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [r5, #0x10]
	mov r2, #1
	strb r2, [r0, r1]
	ldr r0, [r5, #0x18]
	mov r1, #0xfa
	bl ov01_021FA930
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02254ED0
_02254ECC:
	add r0, r1, #1
	str r0, [r4, #4]
_02254ED0:
	add r0, r6, #0
	bl ov01_021F3B04
	add r5, r0, #0
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [r5]
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [r5, #4]
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [r5, #8]
	b _02254F18
_02254EFE:
	ldr r0, [r5, #0x18]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02254F18
	ldr r0, [r4, #0xc]
	bl ov04_02254F44
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02254F18:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02254F1C: .word SEQ_SE_GS_ROUSOKU_KIERU
	thumb_func_end ov04_02254E50

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
	bl MapObjectMan_GetCount
	add r5, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_GetArray
	mov r4, #0
	str r0, [sp]
	cmp r5, #0
	ble _02254F88
	add r6, r4, #0
	add r7, sp, #0
_02254F62:
	ldr r0, [sp]
	bl MapObject_IsInUse
	cmp r0, #1
	bne _02254F7C
	ldr r0, [sp]
	bl ov01_021F72DC
	bl sub_02023F90
	add r1, r6, #0
	bl NNS_G3dMdlSetMdlFogEnableFlagAll
_02254F7C:
	add r0, r7, #0
	bl sub_0205F1D0
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
