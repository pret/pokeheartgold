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
	.include "global.inc"

	.text

	thumb_func_start ov01_021E6880
ov01_021E6880: ; 0x021E6880
	ldrh r2, [r0]
	mov r1, #1
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #2
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #4
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #0x18
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #0x20
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #0x40
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #0x80
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	ldr r1, _021E68F4 ; =0xFFFFFEFF
	and r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _021E68F8 ; =0xFFFFFDFF
	and r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _021E68FC ; =0xFFFFFBFF
	and r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _021E6900 ; =0xFFFFF7FF
	and r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _021E6904 ; =0xFFFFEFFF
	and r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _021E6908 ; =0xFFFFDFFF
	and r2, r1
	strh r2, [r0]
	mov r2, #0xff
	strb r2, [r0, #4]
	asr r1, r1, #0xe
	strb r1, [r0, #5]
	bx lr
	nop
_021E68F4: .word 0xFFFFFEFF
_021E68F8: .word 0xFFFFFDFF
_021E68FC: .word 0xFFFFFBFF
_021E6900: .word 0xFFFFF7FF
_021E6904: .word 0xFFFFEFFF
_021E6908: .word 0xFFFFDFFF
	thumb_func_end ov01_021E6880

	thumb_func_start ov01_021E690C
ov01_021E690C: ; 0x021E690C
	push {r3, lr}
	bl ov01_021F6B10
	cmp r0, #1
	bne _021E691A
	mov r0, #1
	pop {r3, pc}
_021E691A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021E690C

	thumb_func_start ov01_021E6920
ov01_021E6920: ; 0x021E6920
	ldr r3, _021E6924 ; =ov01_021F6B64
	bx r3
	.balign 4, 0
_021E6924: .word ov01_021F6B64
	thumb_func_end ov01_021E6920

	thumb_func_start ov01_021E6928
ov01_021E6928: ; 0x021E6928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	str r2, [sp]
	add r6, r3, #0
	bl ov01_021E6880
	add r0, r4, #0
	bl FieldSys_GetPlayerAvatar
	bl sub_0205CB38
	cmp r0, #0
	beq _021E694E
	mov r0, #2
	orr r0, r6
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
_021E694E:
	ldr r0, [r4, #0x40]
	bl sub_0205C6D4
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x40]
	bl sub_0205C6CC
	str r0, [sp, #8]
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #2
	strh r0, [r5, #6]
	add r0, r4, #0
	strh r6, [r5, #8]
	bl sub_0203C3CC
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	cmp r0, #3
	beq _021E6982
	cmp r0, #0
	beq _021E6982
	b _021E6A88
_021E6982:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021E6992
	mov r1, #2
	ldr r0, [sp]
	lsl r1, r1, #0xa
	tst r0, r1
	bne _021E699C
_021E6992:
	add r0, r4, #0
	add r0, #0xd0
	ldrh r0, [r0]
	cmp r0, #9
	bne _021E69BC
_021E699C:
	add r0, r4, #0
	bl ov01_021E690C
	cmp r0, #1
	bne _021E6A66
	ldrh r1, [r5]
	mov r0, #0x18
	bic r1, r0
	mov r0, #8
	orr r0, r1
	strh r0, [r5]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	strh r1, [r0]
	b _021E6A66
_021E69BC:
	cmp r0, #0xa
	bne _021E69E0
	add r0, r4, #0
	bl ov01_021E690C
	cmp r0, #1
	bne _021E6A66
	ldrh r1, [r5]
	mov r0, #0x18
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r5]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	strh r1, [r0]
	b _021E6A66
_021E69E0:
	cmp r0, #0xb
	bne _021E69F8
	ldrh r1, [r5]
	mov r0, #2
	lsl r0, r0, #8
	orr r0, r1
	strh r0, [r5]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	strh r1, [r0]
	b _021E6A66
_021E69F8:
	mov r2, #1
	ldr r1, [sp]
	lsl r2, r2, #0xa
	tst r1, r2
	bne _021E6A06
	cmp r0, #0
	beq _021E6A52
_021E6A06:
	add r0, r4, #0
	bl ov01_021F6B00
	cmp r0, #4
	bne _021E6A30
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl sub_02018410
	mov r0, #2
	ldrh r1, [r5]
	lsl r0, r0, #8
	orr r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	mov r0, #4
	orr r0, r1
	strh r0, [r5]
	b _021E6A66
_021E6A30:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021E6A66
	ldrh r1, [r5]
	mov r0, #4
	orr r0, r1
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0xd0
	ldrh r0, [r0]
	cmp r0, #1
	bne _021E6A66
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	strh r1, [r0]
	b _021E6A66
_021E6A52:
	ldr r0, [sp]
	mov r1, #1
	tst r0, r1
	beq _021E6A66
	ldrh r2, [r5]
	mov r0, #1
	bic r2, r0
	add r0, r2, #0
	orr r0, r1
	strh r0, [r5]
_021E6A66:
	mov r0, #0xf0
	tst r0, r6
	beq _021E6A7C
	ldrh r1, [r5]
	mov r0, #0x20
	orr r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r5]
_021E6A7C:
	ldrh r1, [r5]
	mov r0, #1
	lsl r0, r0, #8
	orr r0, r1
	strh r0, [r5]
	b _021E6A90
_021E6A88:
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	strh r1, [r0]
_021E6A90:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bne _021E6AA4
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021E6AA4
	ldrh r1, [r5]
	mov r0, #0x80
	orr r0, r1
	strh r0, [r5]
_021E6AA4:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bne _021E6AB2
	ldrh r1, [r5]
	mov r0, #2
	orr r0, r1
	strh r0, [r5]
_021E6AB2:
	cmp r7, #0
	bne _021E6ABC
	mov r0, #0x40
	tst r0, r6
	bne _021E6ADA
_021E6ABC:
	cmp r7, #1
	bne _021E6AC6
	mov r0, #0x80
	tst r0, r6
	bne _021E6ADA
_021E6AC6:
	cmp r7, #2
	bne _021E6AD0
	mov r0, #0x20
	tst r0, r6
	bne _021E6ADA
_021E6AD0:
	cmp r7, #3
	bne _021E6ADE
	mov r0, #0x10
	tst r0, r6
	beq _021E6ADE
_021E6ADA:
	strb r7, [r5, #5]
	b _021E6AE4
_021E6ADE:
	mov r0, #0
	mvn r0, r0
	strb r0, [r5, #5]
_021E6AE4:
	ldr r0, [r4, #0x40]
	ldr r1, [sp]
	add r2, r6, #0
	bl sub_0205DD94
	strb r0, [r5, #4]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E6928

	thumb_func_start ov01_021E6AF4
ov01_021E6AF4: ; 0x021E6AF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	add r4, r1, #0
	lsl r0, r0, #0x12
	lsr r0, r0, #0x1f
	bne _021E6B12
	add r0, r4, #0
	mov r1, #1
	bl TryStartMapScriptByType
	cmp r0, #1
	bne _021E6B12
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6B12:
	ldrh r0, [r5]
	lsl r0, r0, #0x12
	lsr r0, r0, #0x1f
	bne _021E6B66
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	bl HasEnoughAlivePokemonForDoubleBattle
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _021E6B36
	mov r6, #1
_021E6B36:
	add r0, r4, #0
	add r1, r6, #0
	bl TryGetSeenByNpcTrainers
	cmp r0, #1
	bne _021E6B66
	ldr r0, [r4, #0x40]
	bl sub_0205CF44
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_PauseAllMovement
	add r0, r4, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021E6B62
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
_021E6B62:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6B66:
	ldrh r0, [r5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021E6B86
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ClearFlag965
	add r0, r4, #0
	bl ov01_021E7628
	cmp r0, #1
	bne _021E6B86
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6B86:
	add r0, r4, #0
	bl BugContestTimeoutCheck
	cmp r0, #0
	beq _021E6B94
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6B94:
	ldrh r1, [r5, #6]
	ldrh r2, [r5, #8]
	ldr r0, [r4, #0x40]
	mov r6, #0
	bl sub_0205DD94
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	mov r1, #2
	bl StrengthFlagAction
	cmp r0, #0
	beq _021E6BB6
	mov r0, #1
	orr r6, r0
_021E6BB6:
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #MOVE_WATERFALL
	bl GetIdxOfFirstPartyMonWithMove
	cmp r0, #0xff
	beq _021E6BCA
	mov r0, #2
	orr r6, r0
_021E6BCA:
	ldr r1, [r4, #0x40]
	add r0, r4, #0
	add r2, r7, #0
	add r3, r6, #0
	bl ov01_021F1D94
	cmp r0, #1
	bne _021E6BDE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6BDE:
	ldrh r0, [r5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021E6C02
	add r0, r4, #0
	bl ov01_021E7114
	cmp r0, #0
	beq _021E6BF4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6BF4:
	add r0, r4, #0
	bl ov01_021E6DC4
	cmp r0, #1
	bne _021E6C02
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6C02:
	ldrh r0, [r5]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	beq _021E6C24
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	ldrb r1, [r5, #4]
	cmp r1, r0
	bne _021E6C24
	add r0, r4, #0
	bl ov01_021E6DC4
	cmp r0, #1
	bne _021E6C24
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6C24:
	ldrh r0, [r5]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E6D0C
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0203DC64
	cmp r0, #1
	bne _021E6C86
	ldr r0, [r4, #0x40]
	bl sub_0205CF60
	cmp r0, #1
	bne _021E6C50
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205CFBC
_021E6C50:
	ldr r0, [sp]
	bl MapObject_GetType
	cmp r0, #9
	beq _021E6C72
	ldr r5, [sp]
	add r0, r5, #0
	bl MapObject_GetScript
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	add r2, r5, #0
	bl StartMapSceneScript
	b _021E6C7C
_021E6C72:
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0
	bl StartMapSceneScript
_021E6C7C:
	mov r0, #0
	add r4, #0xd0
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6C86:
	add r0, r4, #0
	bl Field_GetBgEvents
	add r6, r0, #0
	add r0, r4, #0
	bl Field_GetNumBgEvents
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl GetInteractedBackgroundEventScript
	add r1, r0, #0
	ldr r0, _021E6DBC ; =0x0000FFFF
	cmp r1, r0
	beq _021E6CBC
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #0
	add r4, #0xd0
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6CBC:
	add r0, r4, #0
	bl ov01_021E7B54
	add r1, r0, #0
	add r0, r4, #0
	bl GetInteractedMetatileScript
	add r1, r0, #0
	ldr r0, _021E6DBC ; =0x0000FFFF
	cmp r1, r0
	beq _021E6CE8
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #0
	add r4, #0xd0
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6CE8:
	add r0, r4, #0
	bl ov01_021E7F38
	add r1, r0, #0
	ldr r0, _021E6DBC ; =0x0000FFFF
	cmp r1, r0
	beq _021E6D0C
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #0
	add r4, #0xd0
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6D0C:
	ldrh r0, [r5]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _021E6D2A
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021E7198
	cmp r0, #1
	bne _021E6D2A
	add r0, r4, #0
	bl ov01_021E7C70
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6D2A:
	ldrh r0, [r5]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1e
	beq _021E6D4C
	add r0, r4, #0
	bl UseRegisteredItemButtonInField
	add r6, r0, #0
	beq _021E6D4C
	ldrh r1, [r5]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1e
	bl ov01_021E6920
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6D4C:
	ldrh r0, [r5]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _021E6D6E
	add r0, r4, #0
	bl sub_0203BC10
	cmp r0, #1
	bne _021E6D6E
	ldr r0, _021E6DC0 ; =SEQ_SE_DP_WIN_OPEN
	bl PlaySE
	add r0, r4, #0
	bl sub_0203BC28
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021E6D6E:
	add r0, r4, #0
	bl ov02_02252334
	cmp r0, #0
	beq _021E6D88
	mov r1, #0x81
	add r0, r4, #0
	lsl r1, r1, #4
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6D88:
	ldrh r0, [r5]
	lsl r1, r0, #0x16
	lsr r1, r1, #0x1f
	beq _021E6D9E
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021F6A9C
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021E6D9E:
	lsl r0, r0, #0x17
	lsr r0, r0, #0x1f
	beq _021E6DB6
	add r0, r4, #0
	bl Fsys_GetGearPhoneRingManager
	bl ov02_02251F20
	cmp r0, #0
	beq _021E6DB6
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021E6DB6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6DBC: .word 0x0000FFFF
_021E6DC0: .word SEQ_SE_DP_WIN_OPEN
	thumb_func_end ov01_021E6AF4

	thumb_func_start ov01_021E6DC4
ov01_021E6DC4: ; 0x021E6DC4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl Field_GetBgEvents
	add r5, r0, #0
	add r0, r4, #0
	bl Field_GetNumBgEvents
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0203DDA4
	add r1, r0, #0
	ldr r0, _021E6DFC ; =0x0000FFFF
	cmp r1, r0
	beq _021E6DF6
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6DF6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6DFC: .word 0x0000FFFF
	thumb_func_end ov01_021E6DC4

	thumb_func_start ov01_021E6E00
ov01_021E6E00: ; 0x021E6E00
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r0, [r4]
	add r5, r1, #0
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _021E6E32
	mov r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _021E6E32
	add r0, r5, #0
	bl ov01_021E7B38
	bl sub_0205B73C
	cmp r0, #0
	beq _021E6E32
	ldr r1, _021E6ED0 ; =0x0000238D
	add r0, r5, #0
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6E32:
	bl sub_02037958
	cmp r0, #0
	bne _021E6E4E
	bl sub_0203769C
	bl sub_02057F18
	cmp r0, #0
	bne _021E6E4E
	bl sub_02058740
	cmp r0, #0
	bne _021E6E52
_021E6E4E:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E6E52:
	ldrh r0, [r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E6EA2
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0203DC64
	cmp r0, #1
	bne _021E6EA2
	ldr r0, [sp]
	bl MapObject_GetMovement
	cmp r0, #1
	beq _021E6EA2
	ldr r0, [r5, #0x40]
	bl sub_0205CF60
	cmp r0, #1
	bne _021E6E88
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205CFBC
_021E6E88:
	ldr r4, [sp]
	add r0, r4, #0
	bl MapObject_GetScript
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	add r2, r4, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6EA2:
	ldrh r0, [r4]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	beq _021E6EB4
	add r0, r5, #0
	bl sub_02059D44
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6EB4:
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _021E6ECA
	ldr r0, _021E6ED4 ; =SEQ_SE_DP_WIN_OPEN
	bl PlaySE
	add r0, r5, #0
	bl sub_0203BD20
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6ECA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6ED0: .word 0x0000238D
_021E6ED4: .word SEQ_SE_DP_WIN_OPEN
	thumb_func_end ov01_021E6E00

	thumb_func_start ov01_021E6ED8
ov01_021E6ED8: ; 0x021E6ED8
	push {r3, r4, r5, lr}
	mov r5, #0
	mov r4, #1
_021E6EDE:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E6EEA
	add r5, r5, #1
_021E6EEA:
	add r4, r4, #1
	cmp r4, #5
	blt _021E6EDE
	cmp r5, #1
	blt _021E6EF8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6EF8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E6ED8

	thumb_func_start ov01_021E6EFC
ov01_021E6EFC: ; 0x021E6EFC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_02033250
	mov r1, #0xfe
	tst r0, r1
	beq _021E6F2E
	bl ov01_021E6ED8
	cmp r0, #0
	beq _021E6F2A
	bl sub_02037454
	cmp r0, #1
	ble _021E6F2A
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6F2A:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E6F2E:
	ldrh r0, [r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E6F78
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0203DC64
	cmp r0, #1
	bne _021E6F78
	ldr r0, [r5, #0x40]
	bl sub_0205CF60
	cmp r0, #1
	bne _021E6F5A
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205CFBC
_021E6F5A:
	bl sub_020380B0
	ldr r4, [sp]
	add r0, r4, #0
	bl MapObject_GetScript
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	add r2, r4, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6F78:
	ldrh r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021E6F98
	add r0, r5, #0
	bl ov01_021E7B38
	bl sub_0205BA18
	cmp r0, #0
	beq _021E6F98
	add r0, r5, #0
	bl sub_02053F14
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6F98:
	ldrh r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _021E6FCC
	bl sub_02037454
	cmp r0, #1
	bgt _021E6FCC
	add r0, r5, #0
	bl ov01_021E690C
	cmp r0, #0
	beq _021E6FCC
	ldr r0, _021E6FD0 ; =SEQ_SE_DP_WIN_OPEN
	bl PlaySE
	add r0, r5, #0
	bl sub_0203BCDC
	mov r0, #4
	bl sub_0205A904
	bl sub_020380CC
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6FCC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6FD0: .word SEQ_SE_DP_WIN_OPEN
	thumb_func_end ov01_021E6EFC

	thumb_func_start ov01_021E6FD4
ov01_021E6FD4: ; 0x021E6FD4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldrh r0, [r5]
	add r4, r1, #0
	lsl r0, r0, #0x12
	lsr r0, r0, #0x1f
	bne _021E6FF6
	add r0, r4, #0
	mov r1, #1
	bl TryStartMapScriptByType
	cmp r0, #1
	bne _021E6FF6
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E6FF6:
	ldrh r0, [r5]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E70AE
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0203DC64
	cmp r0, #1
	bne _021E7054
	ldr r0, [r4, #0x40]
	bl sub_0205CF60
	cmp r0, #1
	bne _021E7022
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205CFBC
_021E7022:
	ldr r0, [sp]
	bl MapObject_GetType
	cmp r0, #9
	beq _021E7044
	ldr r5, [sp]
	add r0, r5, #0
	bl MapObject_GetScript
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	add r2, r5, #0
	bl StartMapSceneScript
	b _021E704E
_021E7044:
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0
	bl StartMapSceneScript
_021E704E:
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E7054:
	add r0, r4, #0
	bl Field_GetBgEvents
	add r6, r0, #0
	add r0, r4, #0
	bl Field_GetNumBgEvents
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl GetInteractedBackgroundEventScript
	add r1, r0, #0
	ldr r0, _021E710C ; =0x0000FFFF
	cmp r1, r0
	beq _021E7086
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl StartMapSceneScript
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E7086:
	add r0, r4, #0
	bl ov01_021E7B54
	add r1, r0, #0
	add r0, r4, #0
	bl GetInteractedMetatileScript
	add r1, r0, #0
	ldr r0, _021E710C ; =0x0000FFFF
	cmp r1, r0
	beq _021E70AE
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	mov r2, #0
	bl StartMapSceneScript
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E70AE:
	ldrh r0, [r5]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _021E70C8
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021E7198
	cmp r0, #1
	bne _021E70C8
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E70C8:
	ldrh r0, [r5]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1e
	beq _021E70EC
	add r0, r4, #0
	bl UseRegisteredItemButtonInField
	add r6, r0, #0
	beq _021E70EC
	ldrh r1, [r5]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1e
	bl ov01_021E6920
	add sp, #4
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E70EC:
	ldrh r0, [r5]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _021E7106
	ldr r0, _021E7110 ; =SEQ_SE_DP_WIN_OPEN
	bl PlaySE
	add r0, r4, #0
	bl sub_0203BC28
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E7106:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E710C: .word 0x0000FFFF
_021E7110: .word SEQ_SE_DP_WIN_OPEN
	thumb_func_end ov01_021E6FD4

	thumb_func_start ov01_021E7114
ov01_021E7114: ; 0x021E7114
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x7e
	ldrh r1, [r0]
	ldr r0, _021E7194 ; =0x0000FFFF
	cmp r1, r0
	bhs _021E7132
	add r0, r4, #0
	add r0, #0x7e
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x7e
	strh r1, [r0]
_021E7132:
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	bl PlayerAvatar_GetStandingTileCoords
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _021E7172
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl sub_02055874
	cmp r0, #1
	bne _021E716C
	add r0, r4, #0
	bl sub_0205589C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_020511F8
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E716C:
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E7172:
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	beq _021E718E
	add r0, r4, #0
	bl ov02_02246C8C
	cmp r0, #1
	bne _021E718E
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E718E:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E7194: .word 0x0000FFFF
	thumb_func_end ov01_021E7114

	thumb_func_start ov01_021E7198
ov01_021E7198: ; 0x021E7198
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r5, r1, #0
	mov r1, #5
	ldrsb r2, [r5, r1]
	sub r1, r1, #6
	add r6, r0, #0
	cmp r2, r1
	bne _021E71B0
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E71B0:
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl PlayerAvatar_GetStandingTileCoords
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	add r4, r0, #0
	bl sub_0205BAA0
	cmp r0, #0
	beq _021E7208
	mov r0, #5
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _021E7202
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	add r3, sp, #0x14
	bl ov01_021E7B90
	cmp r0, #0
	beq _021E7202
	mov r3, #0
	str r3, [sp]
	mov r0, #5
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl sub_02055C9C
	add sp, #0x28
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E7202:
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E7208:
	add r0, r4, #0
	bl sub_0205BAAC
	cmp r0, #0
	beq _021E724E
	mov r0, #5
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _021E7248
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	add r3, sp, #0x14
	bl ov01_021E7B90
	cmp r0, #0
	beq _021E7248
	mov r3, #0
	str r3, [sp]
	mov r0, #5
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl sub_02055C9C
	add sp, #0x28
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E7248:
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E724E:
	add r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl PlayerAvatar_GetFacingTileCoords
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	bl sub_020548C0
	cmp r0, #0
	bne _021E726C
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E726C:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	add r3, sp, #0x14
	bl ov01_021E7B90
	cmp r0, #0
	beq _021E72B6
	mov r0, #5
	ldrsb r1, [r5, r0]
	sub r0, r0, #6
	cmp r1, r0
	beq _021E72B6
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	bl sub_0205B70C
	cmp r0, #0
	beq _021E72B6
	mov r3, #0
	str r3, [sp]
	mov r0, #5
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl sub_02055C9C
	add sp, #0x28
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E72B6:
	add r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl PlayerAvatar_GetStandingTileCoords
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	add r4, r0, #0
	bl sub_0205B718
	cmp r0, #0
	bne _021E72DE
	add r0, r4, #0
	bl sub_0205B748
	cmp r0, #0
	beq _021E72EC
_021E72DE:
	mov r0, #5
	ldrsb r0, [r5, r0]
	cmp r0, #3
	beq _021E7360
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E72EC:
	add r0, r4, #0
	bl sub_0205B724
	cmp r0, #0
	bne _021E7300
	add r0, r4, #0
	bl sub_0205B754
	cmp r0, #0
	beq _021E730E
_021E7300:
	mov r0, #5
	ldrsb r0, [r5, r0]
	cmp r0, #2
	beq _021E7360
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E730E:
	add r0, r4, #0
	bl sub_0205B73C
	cmp r0, #0
	bne _021E7322
	add r0, r4, #0
	bl sub_0205B76C
	cmp r0, #0
	beq _021E7330
_021E7322:
	mov r0, #5
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _021E7360
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E7330:
	add r0, r4, #0
	bl sub_0205B810
	cmp r0, #0
	beq _021E7348
	mov r0, #5
	ldrsb r0, [r5, r0]
	cmp r0, #3
	beq _021E7360
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E7348:
	add r0, r4, #0
	bl sub_0205B81C
	cmp r0, #0
	beq _021E7360
	mov r0, #5
	ldrsb r0, [r5, r0]
	cmp r0, #2
	beq _021E7360
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E7360:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	add r3, sp, #0x14
	bl ov01_021E7B90
	cmp r0, #0
	bne _021E7376
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E7376:
	add r0, r4, #0
	bl sub_0205B70C
	cmp r0, #0
	beq _021E7384
	mov r1, #1
	b _021E73FC
_021E7384:
	add r0, r4, #0
	bl sub_0205B810
	cmp r0, #0
	beq _021E7392
	mov r1, #3
	b _021E73FC
_021E7392:
	add r0, r4, #0
	bl sub_0205B81C
	cmp r0, #0
	beq _021E73A0
	mov r1, #3
	b _021E73FC
_021E73A0:
	add r0, r4, #0
	bl sub_0205B718
	cmp r0, #0
	bne _021E73DC
	add r0, r4, #0
	bl sub_0205B748
	cmp r0, #0
	bne _021E73DC
	add r0, r4, #0
	bl sub_0205B724
	cmp r0, #0
	bne _021E73DC
	add r0, r4, #0
	bl sub_0205B754
	cmp r0, #0
	bne _021E73DC
	add r0, r4, #0
	bl sub_0205B73C
	cmp r0, #0
	bne _021E73DC
	add r0, r4, #0
	bl sub_0205B76C
	cmp r0, #0
	beq _021E73F6
_021E73DC:
	mov r3, #0
	str r3, [sp]
	mov r0, #5
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl sub_02055CD8
	add sp, #0x28
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E73F6:
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E73FC:
	mov r3, #0
	str r3, [sp]
	mov r0, #5
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl sub_02055C9C
	mov r0, #1
	add sp, #0x28
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021E7198

	thumb_func_start GetInteractedMetatileScript
GetInteractedMetatileScript: ; 0x021E7418
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	bl PlayerAvatar_GetFacingDirection
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl GetMetatileBehaviorAt
	add r7, r0, #0
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B78C
	cmp r0, #0
	beq _021E7450
	ldr r0, _021E75DC ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_021E7450:
	add r0, r4, #0
	bl sub_0205B7E0
	cmp r0, #0
	beq _021E7462
	cmp r6, #0
	bne _021E7462
	ldr r0, _021E75E0 ; =std_pokecenter_pc
	pop {r3, r4, r5, r6, r7, pc}
_021E7462:
	add r0, r4, #0
	bl sub_0205B84C
	cmp r0, #0
	beq _021E7470
	ldr r0, _021E75E4 ; =std_picture_books
	pop {r3, r4, r5, r6, r7, pc}
_021E7470:
	add r0, r4, #0
	bl sub_0205B858
	cmp r0, #0
	beq _021E747E
	ldr r0, _021E75E8 ; =std_books_for_pkmn
	pop {r3, r4, r5, r6, r7, pc}
_021E747E:
	add r0, r4, #0
	bl sub_0205B864
	cmp r0, #0
	beq _021E748C
	ldr r0, _021E75EC ; =std_chock_full
	pop {r3, r4, r5, r6, r7, pc}
_021E748C:
	add r0, r4, #0
	bl sub_0205B870
	cmp r0, #0
	beq _021E749A
	ldr r0, _021E75F0 ; =std_magazines
	pop {r3, r4, r5, r6, r7, pc}
_021E749A:
	add r0, r4, #0
	bl sub_0205B87C
	cmp r0, #0
	beq _021E74A8
	ldr r0, _021E75F4 ; =std_trash_empty
	pop {r3, r4, r5, r6, r7, pc}
_021E74A8:
	add r0, r4, #0
	bl sub_0205B888
	cmp r0, #0
	beq _021E74B6
	ldr r0, _021E75F8 ; =std_vibrant_pkmn_goods
	pop {r3, r4, r5, r6, r7, pc}
_021E74B6:
	add r0, r4, #0
	bl sub_0205B894
	cmp r0, #0
	beq _021E74C4
	ldr r0, _021E75FC ; =std_convenient_items
	pop {r3, r4, r5, r6, r7, pc}
_021E74C4:
	add r0, r4, #0
	bl sub_0205B8A0
	cmp r0, #0
	beq _021E74D2
	ldr r0, _021E7600 ; =std_pkmn_merchandise
	pop {r3, r4, r5, r6, r7, pc}
_021E74D2:
	add r0, r4, #0
	bl sub_0205B7EC
	cmp r0, #0
	beq _021E74E0
	ldr r0, _021E7604 ; =std_town_map
	pop {r3, r4, r5, r6, r7, pc}
_021E74E0:
	add r0, r4, #0
	bl sub_0205B9AC
	cmp r0, #0
	beq _021E74F2
	cmp r6, #0
	bne _021E74F2
	ldr r0, _021E7608 ; =std_tv
	pop {r3, r4, r5, r6, r7, pc}
_021E74F2:
	add r0, r4, #0
	bl MetatileBehavior_IsHeadbutt
	cmp r0, #0
	beq _021E7500
	ldr r0, _021E760C ; =std_field_headbutt
	pop {r3, r4, r5, r6, r7, pc}
_021E7500:
	add r0, r4, #0
	add r1, r6, #0
	bl MetatileBehavior_IsRockClimbInDirection
	cmp r0, #0
	beq _021E7510
	ldr r0, _021E7610 ; =std_field_rock_climb
	pop {r3, r4, r5, r6, r7, pc}
_021E7510:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _021E7570
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	add r1, r7, #0
	add r2, r4, #0
	bl Field_PlayerCanStartSurfingByStandingAndFacingTileBehaviors
	cmp r0, #0
	beq _021E7550
	add r0, r6, #0
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021E7550
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #MOVE_SURF
	bl GetIdxOfFirstPartyMonWithMove
	cmp r0, #0xff
	beq _021E7550
	ldr r0, _021E7614 ; =std_field_surf
	pop {r3, r4, r5, r6, r7, pc}
_021E7550:
	add r0, r5, #0
	bl ov02_0224E35C
	cmp r0, #0
	beq _021E75AC
	add r0, r5, #0
	bl ov01_021E7B70
	add r1, r0, #0
	add r0, r4, #0
	bl ov02_0224E4CC
	cmp r0, #0
	beq _021E75AC
	ldr r0, _021E7618 ; =std_safari_place_object
	pop {r3, r4, r5, r6, r7, pc}
_021E7570:
	add r0, r4, #0
	bl MetatileBehavior_IsWaterfall
	cmp r0, #0
	beq _021E757E
	ldr r0, _021E761C ; =std_field_waterfall
	pop {r3, r4, r5, r6, r7, pc}
_021E757E:
	add r0, r4, #0
	bl MetatileBehavior_IsWhirlpool
	cmp r0, #0
	beq _021E758C
	ldr r0, _021E7620 ; =std_field_whirlpool
	pop {r3, r4, r5, r6, r7, pc}
_021E758C:
	add r0, r5, #0
	bl ov02_0224E35C
	cmp r0, #0
	beq _021E75AC
	add r0, r5, #0
	bl ov01_021E7B70
	add r1, r0, #0
	add r0, r4, #0
	bl ov02_0224E4DC
	cmp r0, #0
	beq _021E75AC
	ldr r0, _021E7618 ; =std_safari_place_object
	pop {r3, r4, r5, r6, r7, pc}
_021E75AC:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #0
	beq _021E75D6
	ldr r0, [r5, #0xc]
	bl Save_SafariZone_get
	bl sub_0202F620
	cmp r0, #0
	bne _021E75D6
	add r0, r4, #0
	bl sub_0205BAEC
	cmp r0, #0
	beq _021E75D6
	ldr r0, _021E7624 ; =std_safari_remove_object
	pop {r3, r4, r5, r6, r7, pc}
_021E75D6:
	ldr r0, _021E75DC ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E75DC: .word 0x0000FFFF
_021E75E0: .word std_pokecenter_pc
_021E75E4: .word std_picture_books
_021E75E8: .word std_books_for_pkmn
_021E75EC: .word std_chock_full
_021E75F0: .word std_magazines
_021E75F4: .word std_trash_empty
_021E75F8: .word std_vibrant_pkmn_goods
_021E75FC: .word std_convenient_items
_021E7600: .word std_pkmn_merchandise
_021E7604: .word std_town_map
_021E7608: .word std_tv
_021E760C: .word std_field_headbutt
_021E7610: .word std_field_rock_climb
_021E7614: .word std_field_surf
_021E7618: .word std_safari_place_object
_021E761C: .word std_field_waterfall
_021E7620: .word std_field_whirlpool
_021E7624: .word std_safari_remove_object
	thumb_func_end GetInteractedMetatileScript

	thumb_func_start ov01_021E7628
ov01_021E7628: ; 0x021E7628
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #6
	add r5, r0, #0
	bl Fsys_IsSavGymmickTypeEqualTo
	cmp r0, #0
	beq _021E7644
	add r0, r5, #0
	bl ov04_02255090
	cmp r0, #0
	beq _021E7644
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7644:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r2, r0, #0
	ldr r1, [r5, #0x40]
	add r0, r5, #0
	bl ov01_021F3114
	cmp r0, #1
	ldr r0, [r5, #0x40]
	bne _021E7672
	bl PlayerAvatar_GetMapObject
	bl sub_0205F504
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov04_02256BE4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7672:
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021E7DFC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetMetatileBehaviorAt
	add r7, r0, #0
	add r0, r5, #0
	bl ov01_021E774C
	cmp r0, #1
	bne _021E76A4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E76A4:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov01_021E7784
	cmp r0, #1
	bne _021E76BE
	add r0, r5, #0
	bl ov01_021E7C70
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E76BE:
	ldr r0, [r5, #0x40]
	bl sub_0205CA38
	cmp r0, #0
	beq _021E76CC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E76CC:
	add r0, r5, #0
	mov r1, #5
	mov r2, #1
	bl ov01_021F6830
	add r0, r5, #0
	bl ov01_021E7A98
	add r0, r5, #0
	bl ov01_021E794C
	cmp r0, #1
	bne _021E76EA
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E76EA:
	add r0, r5, #0
	bl ov01_021E79CC
	cmp r0, #1
	bne _021E76F8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E76F8:
	add r0, r5, #0
	bl ov01_021E788C
	cmp r0, #1
	bne _021E7706
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7706:
	add r0, r5, #0
	bl ov01_021E78D8
	cmp r0, #1
	bne _021E7714
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7714:
	add r0, r5, #0
	bl ov01_021E7A08
	cmp r0, #1
	bne _021E7722
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7722:
	add r0, r5, #0
	bl ov01_021E78E4
	cmp r0, #0
	beq _021E7732
	add r0, r5, #0
	bl ov01_021E790C
_021E7732:
	add r0, r5, #0
	bl sub_02069FB0
	cmp r0, #0
	beq _021E7746
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl FsysUnkSub108_MoveMoodTowardsNeutral
_021E7746:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E7628

	thumb_func_start ov01_021E774C
ov01_021E774C: ; 0x021E774C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl Field_GetCoordEvents
	add r5, r0, #0
	add r0, r4, #0
	bl Field_GetNumCoordEvents
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0203DE04
	add r1, r0, #0
	ldr r0, _021E7780 ; =0x0000FFFF
	cmp r1, r0
	beq _021E777A
	add r0, r4, #0
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E777A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E7780: .word 0x0000FFFF
	thumb_func_end ov01_021E774C

	thumb_func_start ov01_021E7784
ov01_021E7784: ; 0x021E7784
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r3, #0
	add r3, sp, #0xc
	add r4, r0, #0
	bl ov01_021E7B90
	cmp r0, #0
	bne _021E779C
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E779C:
	add r0, r5, #0
	bl sub_0205B7F8
	cmp r0, #1
	bne _021E77E0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #2
	bne _021E77B4
	mov r0, #3
	b _021E77C6
_021E77B4:
	cmp r0, #3
	bne _021E77BC
	mov r0, #2
	b _021E77C6
_021E77BC:
	bl GF_AssertFail
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E77C6:
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02055C9C
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E77E0:
	add r0, r5, #0
	bl sub_0205B804
	cmp r0, #1
	bne _021E781C
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #2
	beq _021E7802
	cmp r0, #3
	beq _021E7802
	bl GF_AssertFail
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E7802:
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02055C9C
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E781C:
	add r0, r5, #0
	bl sub_0205B730
	cmp r0, #0
	bne _021E7830
	add r0, r5, #0
	bl sub_0205B760
	cmp r0, #0
	beq _021E7846
_021E7830:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02055CD8
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E7846:
	add r0, r5, #0
	bl sub_0205BA18
	cmp r0, #0
	beq _021E7860
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02053E08
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E7860:
	add r0, r5, #0
	bl sub_0205BAB8
	cmp r0, #0
	beq _021E7884
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02055C9C
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E7884:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021E7784

	thumb_func_start ov01_021E788C
ov01_021E788C: ; 0x021E788C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_DayCare_get
	add r1, r5, #0
	add r2, r4, #0
	bl HandleDayCareStep
	cmp r0, #1
	bne _021E78CE
	ldr r0, [r4, #0xc]
	bl Sav2_GameStats_get
	add r5, r0, #0
	mov r1, #0xc
	bl GameStats_Inc
	add r0, r5, #0
	mov r1, #0xf
	bl GameStats_AddSpecial
	ldr r1, _021E78D4 ; =std_hatch_egg
	add r0, r4, #0
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E78CE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E78D4: .word std_hatch_egg
	thumb_func_end ov01_021E788C

	thumb_func_start ov01_021E78D8
ov01_021E78D8: ; 0x021E78D8
	ldr r3, _021E78E0 ; =PlayerStepEvent_RepelCounterDecrement
	add r1, r0, #0
	ldr r0, [r1, #0xc]
	bx r3
	.balign 4, 0
_021E78E0: .word PlayerStepEvent_RepelCounterDecrement
	thumb_func_end ov01_021E78D8

	thumb_func_start ov01_021E78E4
ov01_021E78E4: ; 0x021E78E4
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	mov r5, #0
	bl SavArray_Flags_get
	add r4, r0, #0
	bl ScriptState_GetVar404B
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #0x80
	blo _021E7902
	add r1, r5, #0
	mov r5, #1
_021E7902:
	add r0, r4, #0
	bl ScriptState_SetVar404B
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E78E4

	thumb_func_start ov01_021E790C
ov01_021E790C: ; 0x021E790C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r6, #0
	bl GetPartyCount
	add r7, r0, #0
	mov r4, #0
	cmp r7, #0
	ble _021E7948
_021E7932:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	add r2, r5, #0
	bl MonApplyFriendshipMod
	add r4, r4, #1
	cmp r4, r7
	blt _021E7932
_021E7948:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E790C

	thumb_func_start ov01_021E794C
ov01_021E794C: ; 0x021E794C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPoisonStepCounter
	ldrh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #3
	and r1, r2
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	beq _021E797A
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E797A:
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl ApplyPoisonStep
	cmp r0, #0
	beq _021E799C
	cmp r0, #1
	beq _021E79A0
	cmp r0, #2
	beq _021E79AC
	b _021E79C2
_021E799C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E79A0:
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x20]
	bl ov01_021FB630
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E79AC:
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x20]
	bl ov01_021FB630
	ldr r1, _021E79C8 ; =std_survive_poisoning
	add r0, r5, #0
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E79C2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E79C8: .word std_survive_poisoning
	thumb_func_end ov01_021E794C

	thumb_func_start ov01_021E79CC
ov01_021E79CC: ; 0x021E79CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #0
	bne _021E79E2
	mov r0, #0
	pop {r4, pc}
_021E79E2:
	ldr r0, [r4, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetSafariBallsCounter
	ldrh r0, [r0]
	cmp r0, #0
	bne _021E7A00
	ldr r1, _021E7A04 ; =0x00002263
	add r0, r4, #0
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r4, pc}
_021E7A00:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E7A04: .word 0x00002263
	thumb_func_end ov01_021E79CC

	thumb_func_start ov01_021E7A08
ov01_021E7A08: ; 0x021E7A08
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SaveData_GetMomsSavingsAddr
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	ldr r1, _021E7A5C ; =0x00000984
	bl CheckFlagInArray
	cmp r0, #0
	bne _021E7A56
	add r0, r5, #0
	mov r1, #2
	bl sub_0202F08C
	cmp r0, #0
	bne _021E7A56
	ldr r0, [r4, #0xc]
	bl Sav2_GameStats_get
	mov r1, #1
	bl GameStats_GetCapped
	mov r1, #1
	lsl r1, r1, #0xa
	cmp r0, r1
	blo _021E7A56
	add r0, r4, #0
	bl Fsys_GetGearPhoneRingManager
	mov r1, #2
	mov r2, #1
	bl sub_02092E14
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E7A56:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E7A5C: .word 0x00000984
	thumb_func_end ov01_021E7A08

	thumb_func_start BugContestTimeoutCheck
BugContestTimeoutCheck: ; 0x021E7A60
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl FieldSys_BugContest_get
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag996
	cmp r0, #0
	bne _021E7A7C
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E7A7C:
	ldr r0, [r5, #0x1c]
	cmp r0, #0x14
	blo _021E7A90
	ldr r1, _021E7A94 ; =std_bug_contest_time_up
	add r0, r4, #0
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E7A90:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7A94: .word std_bug_contest_time_up
	thumb_func_end BugContestTimeoutCheck

	thumb_func_start ov01_021E7A98
ov01_021E7A98: ; 0x021E7A98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0
	bl GameStats_GetCapped
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_ApricornBox_get
	add r1, r4, #0
	bl sub_02032058
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E7A98

	thumb_func_start PlayerAvatar_GetStandingTileCoords
PlayerAvatar_GetStandingTileCoords: ; 0x021E7AB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	add r6, r2, #0
	bl GetPlayerXCoord
	str r0, [r4]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end PlayerAvatar_GetStandingTileCoords

	thumb_func_start PlayerAvatar_GetFacingTileCoords
PlayerAvatar_GetFacingTileCoords: ; 0x021E7AD4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	add r6, r2, #0
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ShiftFieldCoordsByCompassDirection
	pop {r4, r5, r6, pc}
	thumb_func_end PlayerAvatar_GetFacingTileCoords

	thumb_func_start ShiftFieldCoordsByCompassDirection
ShiftFieldCoordsByCompassDirection: ; 0x021E7AF0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r3, #0
	add r6, r1, #0
	add r1, r4, #0
	add r2, r5, #0
	bl PlayerAvatar_GetStandingTileCoords
	cmp r6, #3
	bhi _021E7B36
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7B10: ; jump table
	.short _021E7B18 - _021E7B10 - 2 ; case 0
	.short _021E7B20 - _021E7B10 - 2 ; case 1
	.short _021E7B28 - _021E7B10 - 2 ; case 2
	.short _021E7B30 - _021E7B10 - 2 ; case 3
_021E7B18:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	pop {r4, r5, r6, pc}
_021E7B20:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	pop {r4, r5, r6, pc}
_021E7B28:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_021E7B30:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021E7B36:
	pop {r4, r5, r6, pc}
	thumb_func_end ShiftFieldCoordsByCompassDirection

	thumb_func_start ov01_021E7B38
ov01_021E7B38: ; 0x021E7B38
	push {r4, lr}
	sub sp, #8
	add r1, sp, #4
	add r2, sp, #0
	add r4, r0, #0
	bl PlayerAvatar_GetStandingTileCoords
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl GetMetatileBehaviorAt
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021E7B38

	thumb_func_start ov01_021E7B54
ov01_021E7B54: ; 0x021E7B54
	push {r4, lr}
	sub sp, #8
	add r1, sp, #4
	add r2, sp, #0
	add r4, r0, #0
	bl PlayerAvatar_GetFacingTileCoords
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl GetMetatileBehaviorAt
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021E7B54

	thumb_func_start ov01_021E7B70
ov01_021E7B70: ; 0x021E7B70
	push {r4, lr}
	sub sp, #8
	add r1, sp, #4
	add r2, sp, #0
	add r4, r0, #0
	bl PlayerAvatar_GetFacingTileCoords
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl sub_020548C0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021E7B70

	thumb_func_start ov01_021E7B90
ov01_021E7B90: ; 0x021E7B90
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r1, #0
	str r2, [sp]
	add r5, r3, #0
	bl Field_GetWarpEventAtXYPos
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021E7BAC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7BAC:
	add r0, r4, #0
	add r1, r6, #0
	bl Field_GetWarpEventI
	cmp r0, #0
	bne _021E7BBC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7BBC:
	ldrh r3, [r0, #6]
	mov r1, #1
	lsl r1, r1, #8
	cmp r3, r1
	bne _021E7BEC
	ldrh r1, [r0, #4]
	ldr r0, _021E7C24 ; =0x00000FFF
	cmp r1, r0
	beq _021E7BD2
	bl GF_AssertFail
_021E7BD2:
	ldr r0, [r4, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetDynamicWarp
	add r2, r0, #0
	ldmia r2!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r2]
	str r0, [r5]
	b _021E7BFE
_021E7BEC:
	ldrh r2, [r0, #2]
	ldrh r1, [r0]
	ldrh r0, [r0, #4]
	str r0, [r5]
	str r3, [r5, #4]
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	mov r0, #1
	str r0, [r5, #0x10]
_021E7BFE:
	ldr r0, [r4, #0xc]
	bl Save_FlyPoints_get
	bl sub_0203B95C
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	ldr r1, [r4, #0x20]
	ldr r1, [r1]
	str r1, [r5]
	str r6, [r5, #4]
	ldr r1, [sp]
	str r7, [r5, #8]
	str r1, [r5, #0xc]
	str r0, [r5, #0x10]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7C24: .word 0x00000FFF
	thumb_func_end ov01_021E7B90

	thumb_func_start ov01_021E7C28
ov01_021E7C28: ; 0x021E7C28
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r7, r1, #0
	str r2, [sp]
	add r4, r3, #0
	bl Save_FlyPoints_get
	bl FlyPoints_GetSpecialSpawnWarpPtr
	add r6, r0, #0
	ldr r3, [r5, #0x20]
	add r2, r6, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	cmp r4, #0
	str r0, [r2]
	str r4, [r6, #0x10]
	ldr r0, [sp]
	str r7, [r6, #8]
	str r0, [r6, #0xc]
	bne _021E7C60
	ldr r0, [r6, #0xc]
	add r0, r0, #1
	str r0, [r6, #0xc]
_021E7C60:
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	str r0, [r6]
	mov r0, #0
	mvn r0, r0
	str r0, [r6, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E7C28

	thumb_func_start ov01_021E7C70
ov01_021E7C70: ; 0x021E7C70
	push {r3, r4, lr}
	sub sp, #0x1c
	add r1, sp, #4
	add r2, sp, #0
	add r4, r0, #0
	bl PlayerAvatar_GetStandingTileCoords
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	add r3, sp, #8
	bl ov01_021E7B90
	cmp r0, #0
	beq _021E7CBA
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_MapIsOnMainMatrix
	cmp r0, #1
	bne _021E7CFC
	ldr r0, [sp, #8]
	bl MapHeader_MapIsOnMainMatrix
	cmp r0, #0
	bne _021E7CFC
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r3, r0, #0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl ov01_021E7C28
	add sp, #0x1c
	pop {r3, r4, pc}
_021E7CBA:
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	bl PlayerAvatar_GetFacingTileCoords
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	add r3, sp, #8
	bl ov01_021E7B90
	cmp r0, #0
	beq _021E7CFC
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_MapIsOnMainMatrix
	cmp r0, #1
	bne _021E7CFC
	ldr r0, [sp, #8]
	bl MapHeader_MapIsOnMainMatrix
	cmp r0, #0
	bne _021E7CFC
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r3, r0, #0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl ov01_021E7C28
_021E7CFC:
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov01_021E7C70

	thumb_func_start ov01_021E7D00
ov01_021E7D00: ; 0x021E7D00
	push {r3, r4, r5, r6}
	add r5, r0, #0
	lsr r4, r1, #0x1f
	lsl r0, r1, #0x1b
	sub r0, r0, r4
	mov r6, #0x1b
	ror r0, r6
	add r1, r4, r0
	lsr r4, r2, #0x1f
	lsl r0, r2, #0x1b
	sub r0, r0, r4
	ror r0, r6
	add r2, r4, r0
	ldrh r4, [r5, #2]
	mov r3, #0
	mvn r3, r3
	lsr r4, r4, #3
	mov r0, #0
	cmp r4, #0
	ble _021E7D50
	add r4, r5, #0
_021E7D2A:
	ldrb r6, [r4, #8]
	cmp r6, r1
	bgt _021E7D44
	ldrb r6, [r4, #0xa]
	cmp r1, r6
	bgt _021E7D44
	ldrb r6, [r4, #9]
	cmp r6, r2
	bgt _021E7D44
	ldrb r6, [r4, #0xb]
	cmp r2, r6
	bgt _021E7D44
	add r3, r0, #0
_021E7D44:
	ldrh r6, [r5, #2]
	add r0, r0, #1
	add r4, #8
	lsr r6, r6, #3
	cmp r0, r6
	blt _021E7D2A
_021E7D50:
	add r0, r3, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021E7D00

	thumb_func_start ov01_021E7D58
ov01_021E7D58: ; 0x021E7D58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r7, r2, #0
	add r4, r1, #0
	bl SavArray_Flags_get
	add r6, r0, #0
	lsl r0, r7, #3
	add r0, r4, r0
	ldrb r0, [r0, #4]
	lsl r1, r0, #2
	ldr r0, _021E7DE4 ; =ov01_022063BC
	ldrh r4, [r0, r1]
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0x8b
	bne _021E7D9A
	add r0, r6, #0
	bl CheckDisabledCianwoodWaterfall
	cmp r0, #0
	beq _021E7D9A
	ldr r0, _021E7DE8 ; =0x0000085F
	cmp r4, r0
	bne _021E7D9A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7D9A:
	ldr r1, [r5]
	ldr r0, _021E7DEC ; =0x0000016D
	cmp r1, r0
	bne _021E7DB6
	add r0, r6, #0
	bl CheckSolvedLtSurgeGym
	cmp r0, #0
	beq _021E7DB6
	ldr r0, _021E7DF0 ; =0x00000866
	cmp r4, r0
	bne _021E7DB6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7DB6:
	add r0, r6, #0
	bl CheckBattledSnorlax
	cmp r0, #1
	bne _021E7DCA
	ldr r0, _021E7DF4 ; =0x00000865
	cmp r4, r0
	bne _021E7DCA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7DCA:
	add r0, r6, #0
	bl CheckBattledRedGyarados
	cmp r0, #0
	beq _021E7DDE
	ldr r0, _021E7DF8 ; =0x0000085D
	cmp r4, r0
	bne _021E7DDE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7DDE:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7DE4: .word ov01_022063BC
_021E7DE8: .word 0x0000085F
_021E7DEC: .word 0x0000016D
_021E7DF0: .word 0x00000866
_021E7DF4: .word 0x00000865
_021E7DF8: .word 0x0000085D
	thumb_func_end ov01_021E7D58

	thumb_func_start ov01_021E7DFC
ov01_021E7DFC: ; 0x021E7DFC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	bl sub_02054874
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xc4
	mov r1, #1
	ldr r2, [r0]
	mvn r1, r1
	cmp r2, r1
	bne _021E7E22
	add r0, r5, #0
	add r1, r1, #1
	add r0, #0xc4
	str r1, [r0]
	b _021E7E30
_021E7E22:
	sub r0, r1, #1
	cmp r2, r0
	bne _021E7E30
	add r0, r5, #0
	add r1, r1, #1
	add r0, #0xc4
	str r1, [r0]
_021E7E30:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov01_021E7D00
	mov r1, #0
	add r7, r0, #0
	mvn r1, r1
	cmp r7, r1
	beq _021E7EC6
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov01_021E7D58
	cmp r0, #0
	beq _021E7EEC
	add r0, r6, #4
	lsl r4, r7, #3
	str r0, [sp]
	ldrb r0, [r0, r4]
	cmp r0, #0x10
	bhs _021E7EBC
	lsl r1, r0, #2
	ldr r0, _021E7EF0 ; =ov01_022063BC
	add r2, r5, #0
	add r2, #0xc4
	ldrh r0, [r0, r1]
	ldr r2, [r2]
	cmp r2, r0
	beq _021E7E80
	ldr r2, _021E7EF4 ; =ov01_022063BC + 2
	ldrh r1, [r2, r1]
	cmp r1, #1
	bne _021E7E7C
	bl sub_02006088
	b _021E7E80
_021E7E7C:
	bl PlaySE
_021E7E80:
	ldr r0, [sp]
	add r5, #0xc4
	ldrb r0, [r0, r4]
	lsl r1, r0, #2
	ldr r0, _021E7EF0 ; =ov01_022063BC
	ldrh r0, [r0, r1]
	str r0, [r5]
	add r5, r6, #5
	ldrb r2, [r5, r4]
	cmp r2, #3
	bhs _021E7EEC
	ldr r1, _021E7EF8 ; =ov01_02206388
	mov r0, #0
	ldrb r1, [r1, r2]
	mov r2, #0xf
	bl GF_SndHandleMoveVolume
	ldr r1, [sp]
	mov r0, #5
	ldrb r2, [r1, r4]
	lsl r1, r2, #1
	add r3, r2, r1
	ldr r1, _021E7EFC ; =ov01_0220638C
	ldrb r2, [r5, r4]
	add r1, r1, r3
	ldrb r1, [r2, r1]
	add r2, r0, #0
	bl GF_SndHandleMoveVolume
	pop {r3, r4, r5, r6, r7, pc}
_021E7EBC:
	cmp r7, #0x10
	blt _021E7EEC
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_021E7EC6:
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, r1
	beq _021E7EEC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0xa
	bl StopSE
	mov r0, #0
	mov r1, #0x80
	mov r2, #0xf
	bl GF_SndHandleMoveVolume
	mov r0, #0
	mvn r0, r0
	add r5, #0xc4
	str r0, [r5]
_021E7EEC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7EF0: .word ov01_022063BC
_021E7EF4: .word ov01_022063BC + 2
_021E7EF8: .word ov01_02206388
_021E7EFC: .word ov01_0220638C
	thumb_func_end ov01_021E7DFC

	thumb_func_start ov01_021E7F00
ov01_021E7F00: ; 0x021E7F00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	add r4, r1, #0
	cmp r0, #0
	bne _021E7F34
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	cmp r4, #0
	beq _021E7F2C
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	add r0, #0xc4
	str r1, [r0]
_021E7F2C:
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021E7DFC
_021E7F34:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021E7F00

	thumb_func_start ov01_021E7F38
ov01_021E7F38: ; 0x021E7F38
	push {r3, lr}
	bl FieldSys_FacingModelIsHeadbuttTree
	cmp r0, #0
	beq _021E7F46
	ldr r0, _021E7F4C ; =std_field_headbutt
	pop {r3, pc}
_021E7F46:
	ldr r0, _021E7F50 ; =0x0000FFFF
	pop {r3, pc}
	nop
_021E7F4C: .word std_field_headbutt
_021E7F50: .word 0x0000FFFF
	thumb_func_end ov01_021E7F38

	thumb_func_start ov01_021E7F54
ov01_021E7F54: ; 0x021E7F54
	push {r3, r4, r5, lr}
	add r1, sp, #0
	add r5, r0, #0
	bl sub_0203DC64
	cmp r0, #1
	bne _021E7F7C
	ldr r0, [sp]
	bl MapObject_GetType
	cmp r0, #0
	beq _021E7F74
	cmp r0, #3
	bne _021E7F78
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E7F74:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E7F78:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E7F7C:
	add r0, r5, #0
	bl Field_GetBgEvents
	add r4, r0, #0
	add r0, r5, #0
	bl Field_GetNumBgEvents
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetInteractedBackgroundEventScript
	ldr r1, _021E7FA4 ; =0x0000FFFF
	cmp r0, r1
	beq _021E7F9E
	mov r0, #2
	pop {r3, r4, r5, pc}
_021E7F9E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E7FA4: .word 0x0000FFFF
	thumb_func_end ov01_021E7F54

	thumb_func_start FieldSys_FacingModelIsHeadbuttTree
FieldSys_FacingModelIsHeadbuttTree: ; 0x021E7FA8
	push {r4, lr}
	sub sp, #8
	add r1, sp, #4
	add r2, sp, #0
	add r4, r0, #0
	bl PlayerAvatar_GetFacingTileCoords
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl MapCoordToMatrixIndex
	ldr r1, [r4, #0x30]
	bl GetMapModelNo
	bl MapModel_IsHeadbuttTree
	cmp r0, #0
	beq _021E7FD4
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E7FD4:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldSys_FacingModelIsHeadbuttTree

	.rodata

	.public ov01_02206378
ov01_02206378:
	.word ov01_021E5924, ov01_021E5BE4, ov01_021E5C24, 0xFFFFFFFF
ov01_02206388:
	.byte 0x60, 0x40, 0x20, 0x00

ov01_0220638C: ; 0x0220638C
	.byte 0x40, 0x60, 0x7F
	.byte 0x2E, 0x60, 0x7F
	.byte 0x2E, 0x60, 0x7F
	.byte 0x40, 0x60, 0x7F
	.byte 0x2E, 0x40, 0x60
	.byte 0x40, 0x60, 0x6C
	.byte 0x2E, 0x60, 0x6C
	.byte 0x2E, 0x60, 0x7F
	.byte 0x2E, 0x60, 0x7F
	.byte 0x2E, 0x60, 0x7F
	.byte 0x2E, 0x60, 0x7F
	.byte 0x2E, 0x48, 0x6C
	.byte 0x2E, 0x60, 0x7F
	.byte 0x2E, 0x60, 0x7F
	.byte 0x40, 0x60, 0x7F
	.byte 0x2E, 0x60, 0x7F

ov01_022063BC: ; 0x022063BC
	.short SEQ_SE_GS_N_SESERAGI, 0x0001
	.short SEQ_SE_GS_N_HUUSHA, 0x0000
	.short SEQ_SE_GS_N_UMIBE, 0x0000
	.short SEQ_SE_GS_N_HASHIRA, 0x0001
	.short SEQ_SE_GS_N_UZUSIO, 0x0000
	.short SEQ_SE_GS_N_TAKI, 0x0000
	.short SEQ_SE_GS_N_YOUGAN, 0x0001
	.short SEQ_SE_GS_N_KANSEI, 0x0000
	.short SEQ_SE_GS_N_KITEKI, 0x0000
	.short SEQ_SE_GS_KABIGON_IBIKI, 0x0001
	.short SEQ_SE_GS_N_MOTER, 0x0001
	.short SEQ_SE_GS_N_KANE, 0x0001
	.short SEQ_SE_GS_KYOUHUU, 0x0001
	.short SEQ_SE_GS_N_ENGINE, 0x0001
	.short SEQ_SE_GS_N_HUNSUI, 0x0000
	.short SEQ_SE_GS_DENGEKIBARIA, 0x0000
