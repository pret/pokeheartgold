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
	.include "overlay_01_021F72DC.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021F72DC
ov01_021F72DC: ; 0x021F72DC
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetGfxID
	cmp r0, #0xf8
	bgt _021F7356
	bge _021F737E
	cmp r0, #0x62
	bgt _021F7308
	cmp r0, #0x61
	blt _021F72FA
	beq _021F737E
	cmp r0, #0x62
	beq _021F737E
	b _021F7388
_021F72FA:
	cmp r0, #0
	bgt _021F7302
	beq _021F737E
	b _021F7388
_021F7302:
	cmp r0, #0x15
	beq _021F737E
	b _021F7388
_021F7308:
	cmp r0, #0xb0
	bgt _021F7310
	beq _021F737E
	b _021F7388
_021F7310:
	add r1, r0, #0
	sub r1, #0xb1
	cmp r1, #0x18
	bhi _021F7388
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F7324: ; jump table
	.short _021F737E - _021F7324 - 2 ; case 0
	.short _021F737E - _021F7324 - 2 ; case 1
	.short _021F737E - _021F7324 - 2 ; case 2
	.short _021F737E - _021F7324 - 2 ; case 3
	.short _021F737E - _021F7324 - 2 ; case 4
	.short _021F7388 - _021F7324 - 2 ; case 5
	.short _021F7388 - _021F7324 - 2 ; case 6
	.short _021F7388 - _021F7324 - 2 ; case 7
	.short _021F7388 - _021F7324 - 2 ; case 8
	.short _021F7388 - _021F7324 - 2 ; case 9
	.short _021F7388 - _021F7324 - 2 ; case 10
	.short _021F737E - _021F7324 - 2 ; case 11
	.short _021F737E - _021F7324 - 2 ; case 12
	.short _021F7388 - _021F7324 - 2 ; case 13
	.short _021F7388 - _021F7324 - 2 ; case 14
	.short _021F7388 - _021F7324 - 2 ; case 15
	.short _021F7388 - _021F7324 - 2 ; case 16
	.short _021F7388 - _021F7324 - 2 ; case 17
	.short _021F7388 - _021F7324 - 2 ; case 18
	.short _021F737E - _021F7324 - 2 ; case 19
	.short _021F737E - _021F7324 - 2 ; case 20
	.short _021F737E - _021F7324 - 2 ; case 21
	.short _021F737E - _021F7324 - 2 ; case 22
	.short _021F737E - _021F7324 - 2 ; case 23
	.short _021F737E - _021F7324 - 2 ; case 24
_021F7356:
	ldr r2, _021F73C0 ; =0x00000103
	cmp r0, r2
	bgt _021F736E
	bge _021F737E
	cmp r0, #0xf9
	bgt _021F7366
	beq _021F737E
	b _021F7388
_021F7366:
	sub r1, r2, #1
	cmp r0, r1
	beq _021F737E
	b _021F7388
_021F736E:
	add r1, r2, #1
	cmp r0, r1
	bgt _021F7378
	beq _021F737E
	b _021F7388
_021F7378:
	add r1, r2, #2
	cmp r0, r1
	bne _021F7388
_021F737E:
	add r0, r4, #0
	bl sub_0205F40C
	ldr r0, [r0, #4]
	pop {r4, pc}
_021F7388:
	mov r1, #0x6b
	lsl r1, r1, #2
	cmp r0, r1
	blt _021F73A0
	ldr r1, _021F73C4 ; =0x000003E1
	cmp r0, r1
	bgt _021F73A0
	add r0, r4, #0
	bl sub_0205F40C
	ldr r0, [r0]
	pop {r4, pc}
_021F73A0:
	ldr r1, _021F73C8 ; =0x00000106
	cmp r0, r1
	blt _021F73B4
	add r1, r1, #7
	cmp r0, r1
	bgt _021F73B4
	add r0, r4, #0
	bl sub_02064084
	pop {r4, pc}
_021F73B4:
	add r0, r4, #0
	bl sub_0205F40C
	ldr r0, [r0, #4]
	pop {r4, pc}
	nop
_021F73C0: .word 0x00000103
_021F73C4: .word 0x000003E1
_021F73C8: .word 0x00000106
	thumb_func_end ov01_021F72DC

	thumb_func_start ov01_021F73CC
ov01_021F73CC: ; 0x021F73CC
	push {r3, r4, r5, lr}
	mov r1, #0x14
	add r5, r0, #0
	bl sub_0205F3E8
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	strb r0, [r4, #2]
	add r0, r5, #0
	add r1, r4, #4
	bl ov01_021F9510
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021F73F2
	add r0, r5, #0
	bl sub_0205F484
_021F73F2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F73CC

	thumb_func_start ov01_021F73F4
ov01_021F73F4: ; 0x021F73F4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F40C
	add r1, r0, #0
	add r0, r4, #0
	add r1, r1, #4
	bl ov01_021F95A8
	pop {r4, pc}
	thumb_func_end ov01_021F73F4

	thumb_func_start ov01_021F7408
ov01_021F7408: ; 0x021F7408
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021F7420
	add r1, r4, #0
	add r1, #8
	bl ov01_021F9610
_021F7420:
	add r0, r5, #0
	add r1, r4, #4
	bl ov01_021F95A8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F7408

	thumb_func_start ov01_021F7434
ov01_021F7434: ; 0x021F7434
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7476
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021F7456
	add r0, r5, #0
	add r1, r4, #4
	bl ov01_021F9510
_021F7456:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021F7476
	add r1, r4, #0
	add r1, #8
	bl ov01_021F9630
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl ov01_021FA3E8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearFlagsBits
_021F7476:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F7434

	thumb_func_start ov01_021F7478
ov01_021F7478: ; 0x021F7478
	push {r3, r4, r5, lr}
	mov r1, #0x18
	add r5, r0, #0
	bl sub_0205F3E8
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	strb r0, [r4, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9510
	mov r0, #0
	strb r0, [r4, #0x15]
	ldrb r1, [r4, #0x17]
	mov r0, #2
	bic r1, r0
	strb r1, [r4, #0x17]
	ldrb r1, [r4, #0x17]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0x17]
	ldr r0, [r4]
	cmp r0, #0
	beq _021F74B2
	add r0, r5, #0
	bl sub_0205F484
_021F74B2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F7478

	thumb_func_start ov01_021F74B4
ov01_021F74B4: ; 0x021F74B4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F40C
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F95A8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F74B4

	thumb_func_start ov01_021F74C8
ov01_021F74C8: ; 0x021F74C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021F74DE
	add r1, r4, #4
	bl ov01_021F9610
_021F74DE:
	ldrb r1, [r4, #0x17]
	mov r0, #2
	bic r1, r0
	strb r1, [r4, #0x17]
	ldrb r1, [r4, #0x17]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #0x17]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F95A8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F74C8

	thumb_func_start ov01_021F7504
ov01_021F7504: ; 0x021F7504
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldrb r0, [r4, #0x17]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _021F7522
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _021F7524
_021F7522:
	b _021F7654
_021F7524:
	add r0, r5, #0
	bl MapObject_GetManager
	bl MapObjectManager_GetFieldSysPtr
	str r0, [sp, #0x10]
	ldr r0, [r0, #0xc]
	bl SaveArray_Party_Get
	bl GetFirstAliveMonInParty_CrashIfNone
	str r0, [sp, #0xc]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	ldr r0, [sp, #0xc]
	bl GetMonGender
	str r0, [sp, #8]
	lsl r1, r6, #0x10
	ldr r2, [sp, #8]
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl FollowingPokemon_GetSpriteID
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	bl MonIsShiny
	str r0, [sp, #4]
	lsl r2, r6, #0x18
	ldrb r1, [r4, #0x17]
	mov r0, #2
	lsr r2, r2, #0x18
	orr r0, r1
	strb r0, [r4, #0x17]
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	bl FollowPokeMapObjectSetParams
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl MapObject_SetGfxID
	add r0, r5, #0
	bl sub_0205FCD4
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetFlagsBits
	add r0, r5, #0
	add r1, sp, #0x30
	bl MapObject_GetPositionVec
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r1, r0, #0
	mov r0, #2
	lsl r2, r1, #0x10
	lsl r0, r0, #0xe
	add r0, r2, r0
	str r0, [sp, #0x30]
	add r0, r5, #0
	bl MapObject_SetPrevX
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetPrevHeight
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r1, r0, #0
	mov r0, #2
	lsl r2, r1, #0x10
	lsl r0, r0, #0xe
	add r0, r2, r0
	str r0, [sp, #0x38]
	add r0, r5, #0
	bl MapObject_SetPrevY
	add r0, r5, #0
	add r1, sp, #0x30
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl MapObject_ClearHeldMovement
	ldr r0, [sp, #0x10]
	add r0, #0xf4
	ldr r0, [r0]
	cmp r0, r7
	bne _021F761C
	ldr r0, [sp, #0x10]
	add r0, #0xfc
	ldrh r0, [r0]
	cmp r0, r6
	bne _021F761C
	ldr r0, [sp, #0x10]
	add r0, #0xfb
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	cmp r1, r0
	bne _021F761C
	ldr r0, [sp, #0x10]
	add r0, #0xf8
	ldrb r1, [r0]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _021F7636
_021F761C:
	ldr r0, [sp, #8]
	lsl r2, r6, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #4]
	add r1, r7, #0
	lsr r2, r2, #0x18
	bl FieldSystem_SetFollowPokeParam
	add r0, r5, #0
	mov r1, #1
	bl MapObject_ForceSetFacingDirection
_021F7636:
	mov r1, #0
	ldr r0, [sp, #0xc]
	add r2, r1, #0
	bl GetMonData
	add r3, r0, #0
	mov r1, #0x42
	lsl r2, r7, #0x10
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #0xc]
	lsr r2, r2, #0x10
	bl FieldSystemUnkSub108_Set
_021F7654:
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7700
	ldr r0, [r4]
	cmp r0, #0
	bne _021F766C
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9510
_021F766C:
	ldr r0, [r4]
	cmp r0, #0
	beq _021F7700
	ldrb r1, [r4, #0x17]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #0x17]
	add r1, sp, #0x18
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	add r1, sp, #0x24
	bl MapObject_GetFacingVec
	add r0, r5, #0
	bl MapObject_GetGfxID
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r1, r0, #0
	add r0, r5, #0
	add r2, sp, #0x18
	bl ov01_021F8E70
	ldr r0, [sp, #0x18]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x2c]
	add r0, r5, #0
	bl MapObject_SetFacingVec
	add r0, r5, #0
	bl ov01_02205564
	cmp r0, #0
	beq _021F76CC
	ldr r2, [r4]
	mov r0, #1
	add r1, r5, #0
	bl ov01_0220589C
	b _021F76E0
_021F76CC:
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _021F76E0
	ldr r2, [r4]
	mov r0, #1
	add r1, r5, #0
	bl ov01_02205808
_021F76E0:
	ldr r0, [r4]
	add r1, r4, #4
	bl ov01_021F9630
	ldr r1, [r4]
	add r0, r5, #0
	bl ov01_021FA3E8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearFlagsBits
	add r0, r5, #0
	bl sub_0205F484
_021F7700:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F7504

	thumb_func_start ov01_021F7704
ov01_021F7704: ; 0x021F7704
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F40C
	mov r1, #0
	strb r1, [r0, #0x15]
	add r0, r4, #0
	bl MapObject_GetFacingVecPtr
	mov r1, #0
	str r1, [r0, #4]
	pop {r4, pc}
	thumb_func_end ov01_021F7704

	thumb_func_start ov01_021F771C
ov01_021F771C: ; 0x021F771C
	push {r3, lr}
	mov r1, #0xfd
	bl GetMapObjectByID
	bl sub_0205F40C
	ldr r0, [r0]
	pop {r3, pc}
	thumb_func_end ov01_021F771C

	thumb_func_start ov01_021F772C
ov01_021F772C: ; 0x021F772C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205F40C
	str r0, [sp]
	ldr r7, [r0, #4]
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F779C
	cmp r7, #0
	beq _021F779C
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F330
	add r5, r0, #0
	cmp r5, #9
	blt _021F7760
	bl GF_AssertFail
_021F7760:
	lsl r6, r5, #2
	ldr r5, _021F77A0 ; =ov01_02208AC0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	ldr r5, [r5, r6]
	add r0, r4, #0
	add r1, r7, #0
	blx r5
	add r0, r4, #0
	bl MapObject_GetFacingVecPtr
	mov r1, #2
	lsl r1, r1, #0xa
	str r1, [r0, #8]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0, #2]
	add r0, r4, #0
	bl sub_0205F330
	ldr r1, [sp]
	strb r0, [r1, #3]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8C88
_021F779C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F77A0: .word ov01_02208AC0
	thumb_func_end ov01_021F772C

	thumb_func_start ov01_021F77A4
ov01_021F77A4: ; 0x021F77A4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205F40C
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F77CE
	ldr r5, [r5, #4]
	cmp r5, #0
	beq _021F77CE
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021F8C88
_021F77CE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F77A4

	thumb_func_start ov01_021F77D0
ov01_021F77D0: ; 0x021F77D0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205F40C
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F780E
	ldr r5, [r5, #4]
	cmp r5, #0
	beq _021F780E
	add r0, r4, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F77FE
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F77FE:
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021F8C88
_021F780E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F77D0

	thumb_func_start ov01_021F7810
ov01_021F7810: ; 0x021F7810
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	ldr r6, [r4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7890
	cmp r6, #0
	beq _021F7890
	ldrb r1, [r4, #0x17]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _021F7866
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #0x17]
	add r0, r5, #0
	bl ov01_02205564
	cmp r0, #0
	beq _021F7852
	ldr r2, [r4]
	mov r0, #1
	add r1, r5, #0
	bl ov01_0220589C
	b _021F7866
_021F7852:
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _021F7866
	mov r0, #1
	add r1, r5, #0
	add r2, r6, #0
	bl ov01_02205808
_021F7866:
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov01_021F8D80
	add r0, r5, #0
	add r1, r6, #0
	strb r7, [r4, #0x10]
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021F8C88
_021F7890:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7810

	thumb_func_start ov01_021F7894
ov01_021F7894: ; 0x021F7894
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	ldr r6, [r4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7914
	cmp r6, #0
	beq _021F7914
	ldrb r1, [r4, #0x17]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _021F78EA
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #0x17]
	add r0, r5, #0
	bl ov01_02205564
	cmp r0, #0
	beq _021F78D6
	ldr r2, [r4]
	mov r0, #1
	add r1, r5, #0
	bl ov01_0220589C
	b _021F78EA
_021F78D6:
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _021F78EA
	mov r0, #1
	add r1, r5, #0
	add r2, r6, #0
	bl ov01_02205808
_021F78EA:
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov01_021F8D80
	add r0, r5, #0
	add r1, r6, #0
	strb r7, [r4, #0x10]
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021F8C88
_021F7914:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7894

	thumb_func_start ov01_021F7918
ov01_021F7918: ; 0x021F7918
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7968
	ldr r6, [r4]
	cmp r6, #0
	beq _021F7968
	ldrb r1, [r4, #0x17]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _021F7958
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #0x17]
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _021F7958
	mov r0, #1
	add r1, r5, #0
	add r2, r6, #0
	bl ov01_02205808
_021F7958:
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021F8C88
_021F7968:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7918

	thumb_func_start ov01_021F796C
ov01_021F796C: ; 0x021F796C
	push {r4, lr}
	mov r0, #2
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F7990
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	b _021F7996
_021F7990:
	add r0, r4, #0
	bl ov01_021F8C30
_021F7996:
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F04
	pop {r4, pc}
	thumb_func_end ov01_021F796C

	thumb_func_start ov01_021F79A0
ov01_021F79A0: ; 0x021F79A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F79C4
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F79C4:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F79D8
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl sub_02023F04
_021F79D8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F79A0

	thumb_func_start ov01_021F79DC
ov01_021F79DC: ; 0x021F79DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F7A00
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F7A00:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F7A14
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F7A14:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F79DC

	thumb_func_start ov01_021F7A18
ov01_021F7A18: ; 0x021F7A18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F7A3C
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F7A3C:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F7A50
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F7A50:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7A18

	thumb_func_start ov01_021F7A54
ov01_021F7A54: ; 0x021F7A54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F7A78
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F7A78:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F7A8C
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl sub_02023F04
_021F7A8C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7A54

	thumb_func_start ov01_021F7A90
ov01_021F7A90: ; 0x021F7A90
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #2
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F7ABC
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	mov r0, #0
	strh r0, [r4]
_021F7ABC:
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #6
	beq _021F7AC8
	mov r0, #0
	strh r0, [r4]
_021F7AC8:
	add r0, r6, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F7B0C
	ldr r6, _021F7B10 ; =ov01_02208A64
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #0
	str r0, [r3]
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl sub_02023F04
	mov r0, #0
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4]
	ldrsh r1, [r4, r0]
	lsl r2, r1, #2
	add r1, sp, #0
	ldr r1, [r1, r2]
	cmp r1, #0
	bne _021F7B0C
	strh r0, [r4]
_021F7B0C:
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F7B10: .word ov01_02208A64
	thumb_func_end ov01_021F7A90

	thumb_func_start ov01_021F7B14
ov01_021F7B14: ; 0x021F7B14
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #2
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F7B40
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	mov r0, #0
	strh r0, [r4]
_021F7B40:
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #7
	beq _021F7B4C
	mov r0, #0
	strh r0, [r4]
_021F7B4C:
	add r0, r6, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F7B88
	ldr r6, _021F7B8C ; =ov01_02208A08
	add r3, sp, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #0
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl sub_02023F04
	mov r0, #0
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4]
	ldrsh r1, [r4, r0]
	lsl r2, r1, #2
	add r1, sp, #0
	ldr r1, [r1, r2]
	cmp r1, #0
	bne _021F7B88
	strh r0, [r4]
_021F7B88:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F7B8C: .word ov01_02208A08
	thumb_func_end ov01_021F7B14

	thumb_func_start ov01_021F7B90
ov01_021F7B90: ; 0x021F7B90
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #2
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F7BBC
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	mov r0, #0
	strh r0, [r4]
_021F7BBC:
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #8
	beq _021F7BC8
	mov r0, #0
	strh r0, [r4]
_021F7BC8:
	add r0, r6, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F7C0C
	ldr r6, _021F7C10 ; =ov01_02208A80
	add r3, sp, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #0
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl sub_02023F04
	mov r0, #0
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4]
	ldrsh r1, [r4, r0]
	lsl r2, r1, #2
	add r1, sp, #0
	ldr r1, [r1, r2]
	cmp r1, #0
	bne _021F7C0C
	strh r0, [r4]
_021F7C0C:
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F7C10: .word ov01_02208A80
	thumb_func_end ov01_021F7B90

	thumb_func_start ov01_021F7C14
ov01_021F7C14: ; 0x021F7C14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205F40C
	str r0, [sp]
	ldr r7, [r0, #4]
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7C78
	cmp r7, #0
	beq _021F7C78
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F330
	add r5, r0, #0
	cmp r5, #0xa
	blt _021F7C48
	bl GF_AssertFail
_021F7C48:
	lsl r6, r5, #2
	ldr r5, _021F7C7C ; =ov01_02208B0C
	ldr r2, [sp]
	ldr r3, [sp, #4]
	ldr r5, [r5, r6]
	add r0, r4, #0
	add r1, r7, #0
	blx r5
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0, #2]
	add r0, r4, #0
	bl sub_0205F330
	ldr r1, [sp]
	strb r0, [r1, #3]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8C88
_021F7C78:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F7C7C: .word ov01_02208B0C
	thumb_func_end ov01_021F7C14

	thumb_func_start ov01_021F7C80
ov01_021F7C80: ; 0x021F7C80
	push {r4, lr}
	mov r0, #2
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	bne _021F7C94
	mov r0, #3
	ldrsb r0, [r2, r0]
	cmp r0, #9
	bne _021F7CAC
_021F7C94:
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	b _021F7CB2
_021F7CAC:
	add r0, r4, #0
	bl ov01_021F8C30
_021F7CB2:
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F04
	pop {r4, pc}
	thumb_func_end ov01_021F7C80

	thumb_func_start ov01_021F7CBC
ov01_021F7CBC: ; 0x021F7CBC
	push {r4, lr}
	mov r0, #3
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r0, #9
	beq _021F7CD8
	add r0, r4, #0
	mov r1, #4
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F7CD8:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	pop {r4, pc}
	thumb_func_end ov01_021F7CBC

	thumb_func_start ov01_021F7CE4
ov01_021F7CE4: ; 0x021F7CE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_0205F40C
	add r6, r0, #0
	add r0, r5, #0
	ldr r4, [r6, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7DA2
	cmp r4, #0
	beq _021F7DA2
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F330
	cmp r0, #0
	bne _021F7D56
	cmp r7, #1
	bls _021F7D1C
	mov r0, #1
	str r0, [sp, #4]
	b _021F7D20
_021F7D1C:
	mov r0, #0
	str r0, [sp, #4]
_021F7D20:
	add r0, r4, #0
	bl sub_02023EF4
	ldr r1, [sp, #4]
	cmp r1, r0
	bne _021F7D34
	mov r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _021F7D4C
_021F7D34:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F04
_021F7D4C:
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F04
	b _021F7D88
_021F7D56:
	cmp r7, #1
	bls _021F7D60
	mov r0, #1
	str r0, [sp]
	b _021F7D64
_021F7D60:
	mov r0, #0
	str r0, [sp]
_021F7D64:
	add r0, r4, #0
	bl sub_02023EF4
	ldr r1, [sp]
	cmp r1, r0
	beq _021F7D7E
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F7D7E:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F7D88:
	strb r7, [r6, #2]
	add r0, r5, #0
	bl sub_0205F330
	strb r0, [r6, #3]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F8C88
_021F7DA2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7CE4

	thumb_func_start ov01_021F7DA8
ov01_021F7DA8: ; 0x021F7DA8
	push {r3, r4, r5, lr}
	mov r1, #0x14
	add r5, r0, #0
	bl sub_0205F3E8
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	strb r0, [r4]
	add r0, r5, #0
	add r1, r4, #4
	bl ov01_021F9510
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021F7DCE
	add r0, r5, #0
	bl sub_0205F484
_021F7DCE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F7DA8

	thumb_func_start ov01_021F7DD0
ov01_021F7DD0: ; 0x021F7DD0
	push {r3, r4, lr}
	sub sp, #0xc
	add r2, sp, #0
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	add r4, r0, #0
	str r1, [r2, #8]
	bl sub_0205F40C
	add r1, r0, #0
	add r0, r4, #0
	add r1, r1, #4
	bl ov01_021F95A8
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_SetFacingVec
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7DD0

	thumb_func_start ov01_021F7DFC
ov01_021F7DFC: ; 0x021F7DFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021F7E14
	add r1, r4, #0
	add r1, #8
	bl ov01_021F9610
_021F7E14:
	add r0, r5, #0
	add r1, r4, #4
	bl ov01_021F95A8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F7DFC

	thumb_func_start ov01_021F7E28
ov01_021F7E28: ; 0x021F7E28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7E6A
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021F7E4A
	add r0, r5, #0
	add r1, r4, #4
	bl ov01_021F9510
_021F7E4A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021F7E6A
	add r1, r4, #0
	add r1, #8
	bl ov01_021F9630
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl ov01_021FA3E8
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearFlagsBits
_021F7E6A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F7E28

	thumb_func_start ov01_021F7E6C
ov01_021F7E6C: ; 0x021F7E6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205F40C
	str r0, [sp]
	ldr r7, [r0, #4]
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F7EDC
	cmp r7, #0
	beq _021F7EDC
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F330
	add r5, r0, #0
	cmp r5, #0xa
	blt _021F7EA0
	bl GF_AssertFail
_021F7EA0:
	lsl r6, r5, #2
	ldr r5, _021F7EE0 ; =ov01_02208B34
	ldr r2, [sp]
	ldr r3, [sp, #4]
	ldr r5, [r5, r6]
	add r0, r4, #0
	add r1, r7, #0
	blx r5
	add r0, r4, #0
	bl MapObject_GetFacingVecPtr
	mov r1, #2
	lsl r1, r1, #0xa
	str r1, [r0, #8]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0]
	add r0, r4, #0
	bl sub_0205F330
	ldr r1, [sp]
	strb r0, [r1, #2]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8C88
_021F7EDC:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F7EE0: .word ov01_02208B34
	thumb_func_end ov01_021F7E6C

	thumb_func_start ov01_021F7EE4
ov01_021F7EE4: ; 0x021F7EE4
	push {r3, r4, r5, lr}
	add r4, r2, #0
	mov r0, #0
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F7F12
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	ldrb r1, [r4, #3]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #3]
	pop {r3, r4, r5, pc}
_021F7F12:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #9
	bne _021F7F28
	ldrb r1, [r4, #3]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
_021F7F28:
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021F7F4A
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F8C64
	ldrb r1, [r4, #3]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #3]
	pop {r3, r4, r5, pc}
_021F7F4A:
	add r0, r5, #0
	bl ov01_021F8C30
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7EE4

	thumb_func_start ov01_021F7F54
ov01_021F7F54: ; 0x021F7F54
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #0
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F7F7C
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	b _021F7FB2
_021F7F7C:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #9
	bne _021F7F92
	ldrb r1, [r4, #3]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #3]
	pop {r4, r5, r6, pc}
_021F7F92:
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021F7FB2
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F8C64
	ldrb r1, [r4, #3]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #3]
_021F7FB2:
	add r0, r6, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F7FC6
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xa
	bl sub_02023F04
_021F7FC6:
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F7F54

	thumb_func_start ov01_021F7FC8
ov01_021F7FC8: ; 0x021F7FC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F7FEE
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	b _021F8004
_021F7FEE:
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #9
	bne _021F8004
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F8C64
_021F8004:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F8018
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F8018:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F7FC8

	thumb_func_start ov01_021F801C
ov01_021F801C: ; 0x021F801C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F8042
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	b _021F8058
_021F8042:
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #9
	bne _021F8058
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F8C64
_021F8058:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F806C
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F806C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F801C

	thumb_func_start ov01_021F8070
ov01_021F8070: ; 0x021F8070
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F8096
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	b _021F80AC
_021F8096:
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #9
	bne _021F80AC
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F8C64
_021F80AC:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F80C0
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl sub_02023F04
_021F80C0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8070

	thumb_func_start ov01_021F80C4
ov01_021F80C4: ; 0x021F80C4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #0
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F80F2
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	mov r0, #0
	strb r0, [r4, #1]
	b _021F8108
_021F80F2:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #9
	bne _021F8108
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F8C64
_021F8108:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #6
	beq _021F8114
	mov r0, #0
	strb r0, [r4, #1]
_021F8114:
	add r0, r6, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F815A
	ldr r6, _021F8160 ; =ov01_02208A48
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl sub_02023F04
	mov r0, #1
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #1]
	ldrsb r0, [r4, r0]
	lsl r1, r0, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _021F815A
	mov r0, #0
	strb r0, [r4, #1]
_021F815A:
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_021F8160: .word ov01_02208A48
	thumb_func_end ov01_021F80C4

	thumb_func_start ov01_021F8164
ov01_021F8164: ; 0x021F8164
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #0
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F8192
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	mov r0, #0
	strb r0, [r4, #1]
	b _021F81A8
_021F8192:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #9
	bne _021F81A8
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F8C64
_021F81A8:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #7
	beq _021F81B4
	mov r0, #0
	strb r0, [r4, #1]
_021F81B4:
	add r0, r6, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F81F2
	ldr r6, _021F81F8 ; =ov01_022089D8
	add r3, sp, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #1
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl sub_02023F04
	mov r0, #1
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #1]
	ldrsb r0, [r4, r0]
	lsl r1, r0, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _021F81F2
	mov r0, #0
	strb r0, [r4, #1]
_021F81F2:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021F81F8: .word ov01_022089D8
	thumb_func_end ov01_021F8164

	thumb_func_start ov01_021F81FC
ov01_021F81FC: ; 0x021F81FC
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #0
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	beq _021F822A
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	mov r0, #0
	strb r0, [r4, #1]
	b _021F8240
_021F822A:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #9
	bne _021F8240
	add r0, r3, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F8C64
_021F8240:
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #8
	beq _021F824C
	mov r0, #0
	strb r0, [r4, #1]
_021F824C:
	add r0, r6, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F8292
	ldr r6, _021F8298 ; =ov01_02208AA0
	add r3, sp, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #1
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl sub_02023F04
	mov r0, #1
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #1]
	ldrsb r0, [r4, r0]
	lsl r1, r0, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _021F8292
	mov r0, #0
	strb r0, [r4, #1]
_021F8292:
	add sp, #0x20
	pop {r4, r5, r6, pc}
	nop
_021F8298: .word ov01_02208AA0
	thumb_func_end ov01_021F81FC

	thumb_func_start ov01_021F829C
ov01_021F829C: ; 0x021F829C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	beq _021F82C2
	add r0, r3, #0
	bl ov01_021FA458
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	b _021F82DA
_021F82C2:
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #9
	beq _021F82DA
	add r0, r3, #0
	bl ov01_021FA458
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #4
	bl ov01_021F8C3C
_021F82DA:
	add r0, r5, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F82EE
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F82EE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F829C

	thumb_func_start ov01_021F82F0
ov01_021F82F0: ; 0x021F82F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4, #4]
	str r0, [sp]
	add r0, r7, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F836C
	ldr r0, [sp]
	cmp r0, #0
	beq _021F836C
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #8]
	add r0, r7, #0
	bl sub_0205F330
	str r0, [sp, #4]
	cmp r0, #0xc
	blt _021F8328
	bl GF_AssertFail
_021F8328:
	mov r1, #2
	ldrsb r2, [r4, r1]
	cmp r2, #0
	bne _021F8342
	ldr r0, [sp, #4]
	cmp r0, r2
	beq _021F8342
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021F8342
	sub r0, r1, #3
	strb r0, [r4]
_021F8342:
	ldr r5, [sp, #4]
	ldr r1, [sp]
	lsl r6, r5, #2
	ldr r5, _021F8370 ; =ov01_02208AE4
	ldr r3, [sp, #8]
	ldr r5, [r5, r6]
	add r0, r7, #0
	add r2, r4, #0
	blx r5
	ldr r0, [sp, #8]
	ldr r1, [sp]
	strb r0, [r4]
	ldr r0, [sp, #4]
	strb r0, [r4, #2]
	add r0, r7, #0
	bl ov01_021FA3E8
	ldr r1, [sp]
	add r0, r7, #0
	bl ov01_021F8C88
_021F836C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F8370: .word ov01_02208AE4
	thumb_func_end ov01_021F82F0

	thumb_func_start ov01_021F8374
ov01_021F8374: ; 0x021F8374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r3, #0
	add r4, r2, #0
	add r2, sp, #0
	ldr r3, _021F83FC ; =ov01_02208A38
	add r5, r1, #0
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	lsl r0, r6, #2
	ldr r1, [r7, r0]
	mov r0, #0
	ldrsb r0, [r4, r0]
	cmp r6, r0
	beq _021F83B2
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	ldrb r1, [r4, #3]
	mov r0, #1
	add sp, #0x10
	bic r1, r0
	strb r1, [r4, #3]
	pop {r3, r4, r5, r6, r7, pc}
_021F83B2:
	mov r2, #2
	ldrsb r0, [r4, r2]
	cmp r0, #0
	beq _021F83CA
	ldrb r1, [r4, #3]
	mov r0, #1
	add sp, #0x10
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #3]
	pop {r3, r4, r5, r6, r7, pc}
_021F83CA:
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021F83EE
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	ldrb r1, [r4, #3]
	mov r0, #1
	add sp, #0x10
	bic r1, r0
	strb r1, [r4, #3]
	pop {r3, r4, r5, r6, r7, pc}
_021F83EE:
	add r0, r5, #0
	lsl r1, r2, #0xb
	bl sub_02023F04
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F83FC: .word ov01_02208A38
	thumb_func_end ov01_021F8374

	thumb_func_start ov01_021F8400
ov01_021F8400: ; 0x021F8400
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, r3, #0
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl ov01_021FA464
	add r4, r0, #0
	mov r0, #0
	ldrsb r1, [r6, r0]
	ldr r0, [sp]
	cmp r0, r1
	bne _021F8424
	mov r0, #2
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _021F8436
_021F8424:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	b _021F8466
_021F8436:
	cmp r0, #0xa
	beq _021F844C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	b _021F8466
_021F844C:
	add r0, r5, #0
	bl sub_02023EF4
	cmp r4, r0
	beq _021F8466
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
_021F8466:
	add r0, r7, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F847A
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xa
	bl sub_02023F04
_021F847A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F8400

	thumb_func_start ov01_021F847C
ov01_021F847C: ; 0x021F847C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, r3, #0
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl ov01_021FA464
	add r4, r0, #0
	mov r0, #0
	ldrsb r1, [r6, r0]
	ldr r0, [sp]
	cmp r0, r1
	beq _021F84AA
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	b _021F84DE
_021F84AA:
	mov r0, #2
	ldrsb r0, [r6, r0]
	cmp r0, #0xb
	beq _021F84C4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
	b _021F84DE
_021F84C4:
	add r0, r5, #0
	bl sub_02023EF4
	cmp r4, r0
	beq _021F84DE
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
_021F84DE:
	add r0, r7, #0
	bl ov01_021F9344
	cmp r0, #0
	bne _021F84F2
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F84F2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F847C

	thumb_func_start ov01_021F84F4
ov01_021F84F4: ; 0x021F84F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205F40C
	ldr r7, [r0, #4]
	str r0, [sp]
	cmp r7, #0
	beq _021F8562
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F8562
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F330
	add r5, r0, #0
	cmp r5, #4
	blt _021F8528
	bl GF_AssertFail
_021F8528:
	lsl r6, r5, #2
	ldr r5, _021F8568 ; =ov01_022089E8
	ldr r2, [sp]
	ldr r3, [sp, #4]
	ldr r5, [r5, r6]
	add r0, r4, #0
	add r1, r7, #0
	blx r5
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8708
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0]
	add r0, r4, #0
	bl sub_0205F330
	ldr r1, [sp]
	strb r0, [r1, #2]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8C88
_021F8562:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F8568: .word ov01_022089E8
	thumb_func_end ov01_021F84F4

	thumb_func_start ov01_021F856C
ov01_021F856C: ; 0x021F856C
	push {r4, lr}
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	bne _021F8580
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _021F8596
_021F8580:
	ldr r1, _021F85B8 ; =ov01_022089F8
	lsl r2, r3, #2
	ldr r1, [r1, r2]
	add r0, r4, #0
	bl sub_02023EE0
	mov r1, #0xf
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F40
_021F8596:
	add r0, r4, #0
	bl sub_02023F70
	mov r1, #1
	lsl r1, r1, #0xc
	sub r1, r0, r1
	bpl _021F85A6
	mov r1, #0
_021F85A6:
	add r0, r4, #0
	bl sub_02023F40
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F04
	pop {r4, pc}
	nop
_021F85B8: .word ov01_022089F8
	thumb_func_end ov01_021F856C

	thumb_func_start ov01_021F85BC
ov01_021F85BC: ; 0x021F85BC
	push {r4, lr}
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	bne _021F85D0
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _021F85E4
_021F85D0:
	ldr r1, _021F85F0 ; =ov01_022089F8
	lsl r2, r3, #2
	ldr r1, [r1, r2]
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F85E4:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	pop {r4, pc}
	.balign 4, 0
_021F85F0: .word ov01_022089F8
	thumb_func_end ov01_021F85BC

	thumb_func_start ov01_021F85F4
ov01_021F85F4: ; 0x021F85F4
	push {r3, r4, r5, lr}
	add r4, r2, #0
	mov r0, #0
	ldrsb r0, [r4, r0]
	add r5, r1, #0
	cmp r3, r0
	bne _021F860A
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #2
	beq _021F8628
_021F860A:
	ldr r1, _021F86B4 ; =ov01_022089F8
	lsl r2, r3, #2
	ldr r1, [r1, r2]
	add r0, r5, #0
	bl sub_02023EE0
	mov r1, #0xf
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_02023F40
	ldrb r1, [r4, #3]
	mov r0, #0xfe
	bic r1, r0
	strb r1, [r4, #3]
_021F8628:
	add r0, r5, #0
	bl sub_02023F70
	add r1, r0, #0
	ldrb r0, [r4, #3]
	lsl r2, r0, #0x18
	lsr r2, r2, #0x19
	beq _021F8642
	cmp r2, #1
	beq _021F8664
	cmp r2, #2
	beq _021F868A
	b _021F86A4
_021F8642:
	mov r3, #1
	lsl r3, r3, #0xc
	sub r1, r1, r3
	mov r3, #0xa
	lsl r3, r3, #0xc
	cmp r1, r3
	bgt _021F86A4
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xfe
	lsl r2, r2, #0x19
	bic r0, r3
	lsr r2, r2, #0x18
	orr r0, r2
	strb r0, [r4, #3]
	b _021F86A4
_021F8664:
	mov r3, #1
	lsl r3, r3, #0xc
	add r1, r1, r3
	mov r3, #0xf
	lsl r3, r3, #0xc
	cmp r1, r3
	blt _021F86A4
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xfe
	lsl r2, r2, #0x19
	bic r0, r3
	lsr r2, r2, #0x18
	orr r0, r2
	strb r0, [r4, #3]
	mov r0, #0
	strb r0, [r4, #1]
	b _021F86A4
_021F868A:
	mov r0, #1
	ldrsb r2, [r4, r0]
	add r2, r2, #1
	strb r2, [r4, #1]
	ldrsb r0, [r4, r0]
	cmp r0, #0x1e
	blt _021F86A4
	mov r0, #0
	strb r0, [r4, #1]
	ldrb r2, [r4, #3]
	mov r0, #0xfe
	bic r2, r0
	strb r2, [r4, #3]
_021F86A4:
	add r0, r5, #0
	bl sub_02023F40
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F04
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F86B4: .word ov01_022089F8
	thumb_func_end ov01_021F85F4

	thumb_func_start ov01_021F86B8
ov01_021F86B8: ; 0x021F86B8
	push {r4, lr}
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	bne _021F86CC
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #3
	beq _021F86E2
_021F86CC:
	ldr r1, _021F8704 ; =ov01_022089F8
	lsl r2, r3, #2
	ldr r1, [r1, r2]
	add r0, r4, #0
	bl sub_02023EE0
	mov r1, #0xf
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F40
_021F86E2:
	add r0, r4, #0
	bl sub_02023F70
	mov r1, #1
	lsl r1, r1, #0xc
	sub r1, r0, r1
	bpl _021F86F2
	mov r1, #0
_021F86F2:
	add r0, r4, #0
	bl sub_02023F40
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F04
	pop {r4, pc}
	nop
_021F8704: .word ov01_022089F8
	thumb_func_end ov01_021F86B8

	thumb_func_start ov01_021F8708
ov01_021F8708: ; 0x021F8708
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r2, #0
	add r2, sp, #0
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	add r0, r1, #0
	bl sub_02023F30
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	cmp r4, #3
	bhi _021F876E
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F8738: ; jump table
	.short _021F876E - _021F8738 - 2 ; case 0
	.short _021F8740 - _021F8738 - 2 ; case 1
	.short _021F874C - _021F8738 - 2 ; case 2
	.short _021F875E - _021F8738 - 2 ; case 3
_021F8740:
	cmp r0, #0x18
	blt _021F876E
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	b _021F876E
_021F874C:
	cmp r0, #0x28
	bge _021F8758
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp]
	b _021F876E
_021F8758:
	ldr r0, _021F8784 ; =0xFFFFB000
	str r0, [sp]
	b _021F876E
_021F875E:
	cmp r0, #0x38
	bge _021F8768
	ldr r0, _021F8788 ; =0xFFFFF000
	str r0, [sp]
	b _021F876E
_021F8768:
	mov r0, #5
	lsl r0, r0, #0xc
	str r0, [sp]
_021F876E:
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xa
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, sp, #0
	bl MapObject_SetFacingVec
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021F8784: .word 0xFFFFB000
_021F8788: .word 0xFFFFF000
	thumb_func_end ov01_021F8708

	thumb_func_start ov01_021F878C
ov01_021F878C: ; 0x021F878C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205F40C
	ldr r7, [r0, #4]
	str r0, [sp]
	cmp r7, #0
	beq _021F87FA
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F87FA
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F330
	add r5, r0, #0
	cmp r5, #2
	blt _021F87C0
	bl GF_AssertFail
_021F87C0:
	lsl r6, r5, #2
	ldr r5, _021F8800 ; =ov01_022089CC + 4
	ldr r2, [sp]
	ldr r3, [sp, #4]
	ldr r5, [r5, r6]
	add r0, r4, #0
	add r1, r7, #0
	blx r5
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8874
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0]
	add r0, r4, #0
	bl sub_0205F330
	ldr r1, [sp]
	strb r0, [r1, #2]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8C88
_021F87FA:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F8800: .word ov01_022089CC + 4
	thumb_func_end ov01_021F878C

	thumb_func_start ov01_021F8804
ov01_021F8804: ; 0x021F8804
	push {r4, lr}
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	bne _021F8818
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _021F882C
_021F8818:
	ldr r1, _021F8838 ; =ov01_02208A18
	lsl r2, r3, #2
	ldr r1, [r1, r2]
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F882C:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	pop {r4, pc}
	.balign 4, 0
_021F8838: .word ov01_02208A18
	thumb_func_end ov01_021F8804

	thumb_func_start ov01_021F883C
ov01_021F883C: ; 0x021F883C
	push {r4, lr}
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	bne _021F8850
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _021F8864
_021F8850:
	ldr r1, _021F8870 ; =ov01_02208A18
	lsl r2, r3, #2
	ldr r1, [r1, r2]
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F8864:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	pop {r4, pc}
	.balign 4, 0
_021F8870: .word ov01_02208A18
	thumb_func_end ov01_021F883C

	thumb_func_start ov01_021F8874
ov01_021F8874: ; 0x021F8874
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r2, #0
	add r2, sp, #0
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	add r0, r1, #0
	bl sub_02023F30
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	cmp r4, #3
	bhi _021F88DA
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F88A4: ; jump table
	.short _021F88DA - _021F88A4 - 2 ; case 0
	.short _021F88AC - _021F88A4 - 2 ; case 1
	.short _021F88B8 - _021F88A4 - 2 ; case 2
	.short _021F88CA - _021F88A4 - 2 ; case 3
_021F88AC:
	cmp r0, #0x18
	blt _021F88DA
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	b _021F88DA
_021F88B8:
	cmp r0, #0x28
	bge _021F88C4
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp]
	b _021F88DA
_021F88C4:
	ldr r0, _021F88E8 ; =0xFFFFB000
	str r0, [sp]
	b _021F88DA
_021F88CA:
	cmp r0, #0x38
	bge _021F88D4
	ldr r0, _021F88EC ; =0xFFFFF000
	str r0, [sp]
	b _021F88DA
_021F88D4:
	mov r0, #5
	lsl r0, r0, #0xc
	str r0, [sp]
_021F88DA:
	add r0, r5, #0
	add r1, sp, #0
	bl MapObject_SetFacingVec
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021F88E8: .word 0xFFFFB000
_021F88EC: .word 0xFFFFF000
	thumb_func_end ov01_021F8874

	thumb_func_start ov01_021F88F0
ov01_021F88F0: ; 0x021F88F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r6, r0, #0
	add r0, r5, #0
	ldr r4, [r6, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F894A
	cmp r4, #0
	beq _021F894A
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r7, r0, #0
	strb r7, [r6]
	add r0, r5, #0
	bl sub_0205F330
	strb r0, [r6, #2]
	add r0, r7, #0
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F04
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F8C88
_021F894A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F88F0

	thumb_func_start ov01_021F894C
ov01_021F894C: ; 0x021F894C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r6, r0, #0
	add r0, r5, #0
	ldr r4, [r6, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F89B6
	cmp r4, #0
	beq _021F89B6
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	strb r0, [r6]
	add r0, r5, #0
	bl sub_0205F330
	strb r0, [r6, #2]
	add r0, r4, #0
	bl sub_02023EF4
	cmp r0, #0
	beq _021F8990
	add r0, r4, #0
	mov r1, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F8990:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	add r0, r5, #0
	bl MapObject_GetFacingVecPtr
	mov r1, #2
	lsl r1, r1, #0xa
	str r1, [r0, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F8C88
_021F89B6:
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F894C

	thumb_func_start ov01_021F89B8
ov01_021F89B8: ; 0x021F89B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r6, r0, #0
	add r0, r5, #0
	ldr r4, [r6, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F8A48
	cmp r4, #0
	beq _021F8A48
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205F330
	cmp r0, #0
	bne _021F8A0A
	add r0, r4, #0
	bl sub_02023EF4
	cmp r0, #1
	beq _021F89FE
	add r0, r4, #0
	mov r1, #1
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F89FE:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	b _021F8A2E
_021F8A0A:
	add r0, r4, #0
	bl sub_02023EF4
	cmp r0, #0
	beq _021F8A24
	add r0, r4, #0
	mov r1, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F8A24:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
_021F8A2E:
	strb r7, [r6]
	add r0, r5, #0
	bl sub_0205F330
	strb r0, [r6, #2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F8C88
_021F8A48:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F89B8

	thumb_func_start ov01_021F8A4C
ov01_021F8A4C: ; 0x021F8A4C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r6, #0
	ldr r5, [r4, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F8AAE
	cmp r5, #0
	beq _021F8AAE
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	mov r1, #0
	ldrsb r1, [r4, r1]
	add r7, r0, #0
	cmp r7, r1
	beq _021F8A8A
	bl ov01_021FA44C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02023EE0
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F40
_021F8A8A:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	add r0, r6, #0
	add r1, r5, #0
	bl ov01_021FA3E8
	add r0, r6, #0
	add r1, r5, #0
	bl ov01_021F8C88
	add r0, r6, #0
	strb r7, [r4]
	bl sub_0205F330
	strb r0, [r4, #2]
_021F8AAE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F8A4C

	thumb_func_start ov01_021F8AB0
ov01_021F8AB0: ; 0x021F8AB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F40C
	add r6, r0, #0
	add r0, r5, #0
	ldr r4, [r6, #4]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F8B2C
	cmp r4, #0
	beq _021F8B2C
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205F330
	add r7, r0, #0
	mov r0, #2
	ldrsb r0, [r6, r0]
	cmp r7, r0
	beq _021F8B00
	cmp r7, #0
	bne _021F8AF0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023EE0
	b _021F8AF8
_021F8AF0:
	add r0, r4, #0
	mov r1, #1
	bl sub_02023EE0
_021F8AF8:
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F8B00:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	add r0, r5, #0
	bl MapObject_GetFacingVecPtr
	mov r1, #2
	lsl r1, r1, #0xa
	str r1, [r0, #8]
	ldr r0, [sp]
	add r1, r4, #0
	strb r0, [r6]
	add r0, r5, #0
	strb r7, [r6, #2]
	bl ov01_021FA3E8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F8C88
_021F8B2C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8AB0

	thumb_func_start ov01_021F8B30
ov01_021F8B30: ; 0x021F8B30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205F40C
	ldr r7, [r0, #4]
	str r0, [sp]
	cmp r7, #0
	beq _021F8B9E
	add r0, r4, #0
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021F8B9E
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F330
	add r5, r0, #0
	cmp r5, #1
	blt _021F8B64
	bl GF_AssertFail
_021F8B64:
	lsl r6, r5, #2
	ldr r5, _021F8BA4 ; =ov01_022089CC
	ldr r2, [sp]
	ldr r3, [sp, #4]
	ldr r5, [r5, r6]
	add r0, r4, #0
	add r1, r7, #0
	blx r5
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8BE0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0]
	add r0, r4, #0
	bl sub_0205F330
	ldr r1, [sp]
	strb r0, [r1, #2]
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021F8C88
_021F8B9E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F8BA4: .word ov01_022089CC
	thumb_func_end ov01_021F8B30

	thumb_func_start ov01_021F8BA8
ov01_021F8BA8: ; 0x021F8BA8
	push {r4, lr}
	mov r0, #0
	ldrsb r0, [r2, r0]
	add r4, r1, #0
	cmp r3, r0
	bne _021F8BBC
	mov r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _021F8BD0
_021F8BBC:
	ldr r1, _021F8BDC ; =ov01_02208A28
	lsl r2, r3, #2
	ldr r1, [r1, r2]
	add r0, r4, #0
	bl sub_02023EE0
	add r0, r4, #0
	mov r1, #0
	bl sub_02023F40
_021F8BD0:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02023F04
	pop {r4, pc}
	.balign 4, 0
_021F8BDC: .word ov01_02208A28
	thumb_func_end ov01_021F8BA8

	thumb_func_start ov01_021F8BE0
ov01_021F8BE0: ; 0x021F8BE0
	push {lr}
	sub sp, #0xc
	add r1, sp, #0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	mov r2, #2
	ldr r3, [sp, #8]
	lsl r2, r2, #0xa
	add r2, r3, r2
	str r2, [sp, #8]
	bl MapObject_SetFacingVec
	add sp, #0xc
	pop {pc}
	thumb_func_end ov01_021F8BE0

	thumb_func_start ov01_021F8C00
ov01_021F8C00: ; 0x021F8C00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_02023F70
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r4, r1, #0xc
	add r0, r4, #0
	add r1, r6, #0
	bl _s32_div_f
	sub r1, r4, r1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_02023F40
	add r0, r5, #0
	mov r1, #0
	bl sub_02023F04
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8C00

	thumb_func_start ov01_021F8C30
ov01_021F8C30: ; 0x021F8C30
	ldr r3, _021F8C38 ; =ov01_021F8C00
	mov r1, #8
	bx r3
	nop
_021F8C38: .word ov01_021F8C00
	thumb_func_end ov01_021F8C30

	thumb_func_start ov01_021F8C3C
ov01_021F8C3C: ; 0x021F8C3C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl ov01_021F8C00
	add r0, r5, #0
	bl sub_02023F70
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02023F40
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8C3C

	thumb_func_start ov01_021F8C64
ov01_021F8C64: ; 0x021F8C64
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F8C30
	add r0, r5, #0
	bl sub_02023F70
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02023F40
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F8C64

	thumb_func_start ov01_021F8C88
ov01_021F8C88: ; 0x021F8C88
	push {r4, r5, r6, lr}
	mov r4, #1
	add r6, r1, #0
	lsl r1, r4, #9
	add r5, r0, #0
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021F8C9C
	mov r4, #0
_021F8C9C:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021F8CBA
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_TestFlagsBits
	cmp r0, #0
	bne _021F8CBA
	mov r4, #0
_021F8CBA:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl sub_02023EA4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8C88

	thumb_func_start ov01_021F8CC8
ov01_021F8CC8: ; 0x021F8CC8
	push {r4, lr}
	ldr r3, _021F8CF4 ; =ov01_022073D8
	add r2, r1, #0
	ldr r4, [r3]
	ldr r1, _021F8CF8 ; =0x0000FFFF
	cmp r4, r1
	beq _021F8CEE
_021F8CD6:
	cmp r4, r0
	bne _021F8CE6
	add r3, r3, #4
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	pop {r4, pc}
_021F8CE6:
	add r3, #0x10
	ldr r4, [r3]
	cmp r4, r1
	bne _021F8CD6
_021F8CEE:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
_021F8CF4: .word ov01_022073D8
_021F8CF8: .word 0x0000FFFF
	thumb_func_end ov01_021F8CC8

	thumb_func_start ov01_021F8CFC
ov01_021F8CFC: ; 0x021F8CFC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r1, #4
	bl sub_0205F3E8
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetGfxID
	add r1, sp, #0
	bl ov01_021F8CC8
	add r0, r5, #0
	add r1, sp, #0
	bl ov01_021FD2EC
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov01_021F8CFC

	thumb_func_start ov01_021F8D24
ov01_021F8D24: ; 0x021F8D24
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F8D24

	thumb_func_start ov01_021F8D28
ov01_021F8D28: ; 0x021F8D28
	push {r4, lr}
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021F8D3E
	bl ov01_021F1640
	mov r0, #0
	str r0, [r4]
_021F8D3E:
	pop {r4, pc}
	thumb_func_end ov01_021F8D28

	thumb_func_start ov01_021F8D40
ov01_021F8D40: ; 0x021F8D40
	push {r4, lr}
	bl sub_0205F40C
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021F8D56
	bl ov01_021F1640
	mov r0, #0
	str r0, [r4]
_021F8D56:
	pop {r4, pc}
	thumb_func_end ov01_021F8D40

	thumb_func_start ov01_021F8D58
ov01_021F8D58: ; 0x021F8D58
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F40C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetGfxID
	add r1, sp, #0
	bl ov01_021F8CC8
	add r0, r5, #0
	add r1, sp, #0
	bl ov01_021FD2EC
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F8D58

	.rodata

ov01_022089CC: ; 0x022089CC
	.word ov01_021F8BA8
	.word ov01_021F8804
	.word ov01_021F883C

ov01_022089D8: ; 0x022089D8
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov01_022089E8: ; 0x022089E8
	.word ov01_021F856C
	.word ov01_021F85BC
	.word ov01_021F85F4
	.word ov01_021F86B8

ov01_022089F8: ; 0x022089F8
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov01_02208A08: ; 0x02208A08
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov01_02208A18: ; 0x02208A18
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov01_02208A28: ; 0x02208A28
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov01_02208A38: ; 0x02208A38
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00

ov01_02208A48: ; 0x02208A48
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov01_02208A64: ; 0x02208A64
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov01_02208A80: ; 0x02208A80
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov01_02208AA0: ; 0x02208AA0
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov01_02208AC0: ; 0x02208AC0
	.word ov01_021F796C
	.word ov01_021F79A0
	.word ov01_021F79A0
	.word ov01_021F79DC
	.word ov01_021F7A18
	.word ov01_021F7A54
	.word ov01_021F7A90
	.word ov01_021F7B14
	.word ov01_021F7B90

ov01_02208AE4: ; 0x02208AE4
	.word ov01_021F8374
	.word ov01_021F7F54
	.word ov01_021F7F54
	.word ov01_021F7FC8
	.word ov01_021F801C
	.word ov01_021F80C4
	.word ov01_021F80C4
	.word ov01_021F80C4
	.word ov01_021F8400
	.word ov01_021F847C

ov01_02208B0C: ; 0x02208B0C
	.word ov01_021F7C80
	.word ov01_021F79A0
	.word ov01_021F79A0
	.word ov01_021F79DC
	.word ov01_021F7A18
	.word ov01_021F7A54
	.word ov01_021F7A90
	.word ov01_021F7B14
	.word ov01_021F7B90
	.word ov01_021F7CBC

ov01_02208B34: ; 0x02208B34
	.word ov01_021F7EE4
	.word ov01_021F7F54
	.word ov01_021F7F54
	.word ov01_021F7FC8
	.word ov01_021F801C
	.word ov01_021F8070
	.word ov01_021F80C4
	.word ov01_021F8164
	.word ov01_021F81FC
	.word ov01_021F829C
