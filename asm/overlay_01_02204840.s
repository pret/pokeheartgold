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

	thumb_func_start FieldSys_AnimApricornTree
FieldSys_AnimApricornTree: ; 0x02204840
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x20
	mov r1, #0x28
	add r7, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4]
	str r6, [r4, #8]
	str r7, [r4, #0x24]
	ldr r0, [r5, #0x10]
	ldr r1, _02204870 ; =Task_AnimApricornTree
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02204870: .word Task_AnimApricornTree
	thumb_func_end FieldSys_AnimApricornTree

	thumb_func_start Task_AnimApricornTree
Task_AnimApricornTree: ; 0x02204874
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0xa
	bhi _0220493C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0220489A: ; jump table
	.short _022048B0 - _0220489A - 2 ; case 0
	.short _022048E0 - _0220489A - 2 ; case 1
	.short _0220490A - _0220489A - 2 ; case 2
	.short _02204978 - _0220489A - 2 ; case 3
	.short _022049BE - _0220489A - 2 ; case 4
	.short _02204A06 - _0220489A - 2 ; case 5
	.short _02204A8E - _0220489A - 2 ; case 6
	.short _02204A1E - _0220489A - 2 ; case 7
	.short _02204A40 - _0220489A - 2 ; case 8
	.short _02204A66 - _0220489A - 2 ; case 9
	.short _02204A7C - _0220489A - 2 ; case 10
_022048B0:
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_02055708
	cmp r0, #0
	bne _022048C8
	ldr r0, [r4, #0x24]
	mov r1, #0
	strh r1, [r0]
	mov r0, #0xa
	str r0, [r4]
	b _02204A8E
_022048C8:
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	ldr r1, _02204A94 ; =ov01_02204B78
	add r0, r6, #0
	bl TaskManager_Call
	mov r0, #1
	str r0, [r4]
	b _02204A8E
_022048E0:
	ldr r0, [r4, #8]
	bl MapObject_UnpauseMovement
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_0205F328
	add r0, r4, #0
	mov r1, #0
	add r0, #0x23
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x22
	strb r1, [r0]
	mov r0, #2
	str r0, [r4]
	ldr r0, _02204A98 ; =SEQ_SE_GS_KI_YURERU
	bl PlaySE
	b _02204A8E
_0220490A:
	mov r1, #0x22
	ldrsb r0, [r4, r1]
	sub r2, r0, #1
	add r0, r4, #0
	add r0, #0x22
	strb r2, [r0]
	ldrsb r0, [r4, r1]
	cmp r0, #0
	bgt _02204932
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x23
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x22
	strb r1, [r0]
_02204932:
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	cmp r0, #2
	bhs _0220493E
_0220493C:
	b _02204A8E
_0220493E:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0205F328
	ldr r0, [r4, #8]
	bl MapObject_PauseMovement
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_02055708
	cmp r0, #0
	beq _0220496C
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_02055760
	ldr r0, [r4, #0x24]
	mov r1, #1
	strh r1, [r0]
	mov r0, #3
	str r0, [r4]
	b _02204A8E
_0220496C:
	ldr r0, [r4, #0x24]
	mov r1, #0
	strh r1, [r0]
	mov r0, #0xa
	str r0, [r4]
	b _02204A8E
_02204978:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	mov r1, #0
	str r1, [r4, #0x14]
	str r1, [r4, #0x1c]
	str r1, [r4, #0x18]
	cmp r0, #3
	bhi _022049B8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02204996: ; jump table
	.short _0220499E - _02204996 - 2 ; case 0
	.short _022049A6 - _02204996 - 2 ; case 1
	.short _022049B2 - _02204996 - 2 ; case 2
	.short _022049AC - _02204996 - 2 ; case 3
_0220499E:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x1c]
	b _022049B8
_022049A6:
	ldr r0, _02204A9C ; =0xFFFFF000
	str r0, [r4, #0x1c]
	b _022049B8
_022049AC:
	ldr r0, _02204A9C ; =0xFFFFF000
	str r0, [r4, #0x14]
	b _022049B8
_022049B2:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x14]
_022049B8:
	mov r0, #4
	str r0, [r4]
	b _02204A8E
_022049BE:
	ldr r0, [r5, #0x40]
	add r1, sp, #4
	add r2, sp, #0
	bl PlayerAvatar_GetCoordsInFront
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl sub_020557A0
	sub r6, r0, #1
	bpl _022049D8
	bl GF_AssertFail
_022049D8:
	ldr r1, _02204AA0 ; =0x0000010E
	ldr r0, [r5, #0x3c]
	ldr r2, [sp, #4]
	ldr r3, [sp]
	add r1, r6, r1
	bl ov01_02204AAC
	str r0, [r4, #4]
	add r1, sp, #8
	bl MapObject_GetPositionVec
	mov r0, #3
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, sp, #8
	bl MapObject_SetPositionVec
	mov r0, #5
	str r0, [r4]
	b _02204A8E
_02204A06:
	ldr r0, [r4, #4]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02204A8E
	ldr r0, [r4, #8]
	ldr r1, _02204AA4 ; =0x00000106
	bl ov01_021FA930
	mov r0, #7
	str r0, [r4]
	b _02204A8E
_02204A1E:
	ldr r0, [r4, #8]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02204A8E
	mov r0, #8
	strh r0, [r4, #0x20]
	ldr r0, [r4, #8]
	mov r1, #2
	bl sub_0205F328
	ldr r0, [r4, #8]
	bl MapObject_UnpauseMovement
	mov r0, #8
	str r0, [r4]
	b _02204A8E
_02204A40:
	mov r1, #0x20
	ldrsh r0, [r4, r1]
	sub r0, r0, #1
	strh r0, [r4, #0x20]
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _02204A8E
	ldr r0, [r4, #4]
	lsl r1, r1, #4
	bl MapObject_ClearBits
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, _02204AA8 ; =SEQ_SE_GS_FW255E
	bl PlaySE
	mov r0, #9
	str r0, [r4]
	b _02204A8E
_02204A66:
	bl ov01_02204B24
	cmp r0, #0
	beq _02204A8E
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0205F328
	mov r0, #0xa
	str r0, [r4]
	b _02204A8E
_02204A7C:
	ldr r0, [r4, #8]
	bl MapObject_PauseMovement
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02204A8E:
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02204A94: .word ov01_02204B78
_02204A98: .word SEQ_SE_GS_KI_YURERU
_02204A9C: .word 0xFFFFF000
_02204AA0: .word 0x0000010E
_02204AA4: .word 0x00000106
_02204AA8: .word SEQ_SE_GS_FW255E
	thumb_func_end Task_AnimApricornTree

	thumb_func_start ov01_02204AAC
ov01_02204AAC: ; 0x02204AAC
	push {r3, r4, lr}
	sub sp, #0xc
	str r1, [sp]
	mov r4, #0
	str r4, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	add r1, r2, #0
	add r2, r3, #0
	add r3, r4, #0
	bl CreateSpecialFieldObject
	add r4, r0, #0
	bne _02204ACC
	bl GF_AssertFail
_02204ACC:
	add r0, r4, #0
	mov r1, #0xfc
	bl MapObject_SetID
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetType
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetFlagID
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetXRange
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetYRange
	mov r1, #9
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl MapObject_SetBits
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl MapObject_ClearBits
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F89C
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #8
	bl MapObject_SetBits
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_02204AAC

	thumb_func_start ov01_02204B24
ov01_02204B24: ; 0x02204B24
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [r4, #0xc]
	ldr r0, _02204B74 ; =ov01_022095F4
	ldr r2, [sp, #4]
	ldrsb r0, [r0, r1]
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x10
	blt _02204B6E
	ldr r0, [r4, #4]
	bl MapObject_Remove
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02204B6E:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02204B74: .word ov01_022095F4
	thumb_func_end ov01_02204B24

	thumb_func_start ov01_02204B78
ov01_02204B78: ; 0x02204B78
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	add r0, r7, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r7, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _02204C40
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02204BAC: ; jump table
	.short _02204BB4 - _02204BAC - 2 ; case 0
	.short _02204BC2 - _02204BAC - 2 ; case 1
	.short _02204BF6 - _02204BAC - 2 ; case 2
	.short _02204C30 - _02204BAC - 2 ; case 3
_02204BB4:
	add r0, r6, #0
	bl MapObject_UnpauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204C40
_02204BC2:
	add r0, r6, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02204C40
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	mov r1, #2
	ldr r0, [r5, #0x40]
	lsl r1, r1, #0xc
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	add r0, r6, #0
	mov r1, #0
	bl sub_0205F328
	mov r0, #0
	str r0, [r7]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204C40
_02204BF6:
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	cmp r0, #0x18
	ble _02204C40
	add r0, r6, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _02204C40
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	bl sub_0205C99C
	add r1, r0, #0
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204C40
_02204C30:
	add r0, r6, #0
	bl MapObject_PauseMovement
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02204C40:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204B78

	thumb_func_start ov01_02204C44
ov01_02204C44: ; 0x02204C44
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x18
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	cmp r4, #0
	beq _02204C60
	mov r0, #1
	b _02204C62
_02204C60:
	mov r0, #0
_02204C62:
	str r0, [r2]
	str r6, [r2, #8]
	str r7, [r2, #0xc]
	ldr r0, [r2, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r2, #0xc]
	strh r1, [r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02204C7C ; =ov01_02204C80
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02204C7C: .word ov01_02204C80
	thumb_func_end ov01_02204C44

	thumb_func_start ov01_02204C80
ov01_02204C80: ; 0x02204C80
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	add r1, sp, #0
	bl ov02_022470A0
	cmp r0, #0
	beq _02204CC0
	ldr r0, [r4, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02050B90
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204CC0:
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_02204CF8
	cmp r0, #0
	beq _02204CDC
	ldr r1, _02204CF4 ; =ov01_02204DA0
	add r0, r5, #0
	add r2, r4, #0
	bl TaskManager_Jump
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204CDC:
	ldr r0, [r4, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02204CF4: .word ov01_02204DA0
	thumb_func_end ov01_02204C80

	thumb_func_start ov01_02204CF8
ov01_02204CF8: ; 0x02204CF8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	ldr r2, [r6, #0x20]
	add r5, r1, #0
	ldr r2, [r2]
	add r0, sp, #0
	mov r1, #0xff
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrh r4, [r0]
	cmp r4, #0
	bne _02204D1A
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204D1A:
	ldrh r0, [r0, #2]
	cmp r0, #3
	blo _02204D2A
	bl GF_AssertFail
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02204D2A:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _02204D50
	add r0, r6, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	b _02204D52
_02204D50:
	mov r0, #0x7b
_02204D52:
	str r0, [r5, #4]
	cmp r0, #0x15
	beq _02204D62
	cmp r0, #0x2a
	beq _02204D66
	cmp r0, #0x33
	beq _02204D6A
	b _02204D6C
_02204D62:
	add r4, r4, #5
	b _02204D6C
_02204D66:
	add r4, r4, #5
	b _02204D6C
_02204D6A:
	add r4, r4, #5
_02204D6C:
	ldr r0, [r5]
	cmp r0, #0
	beq _02204D74
	add r4, r4, #5
_02204D74:
	cmp r4, #0x64
	ble _02204D7A
	mov r4, #0x64
_02204D7A:
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r4
	bge _02204D98
	add r0, sp, #0
	ldrh r1, [r0]
	add sp, #4
	strh r1, [r5, #0x10]
	ldrh r0, [r0, #2]
	strh r0, [r5, #0x12]
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02204D98:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_02204CF8

	thumb_func_start ov01_02204DA0
ov01_02204DA0: ; 0x02204DA0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetSys
	ldr r1, [r4]
	cmp r1, #0
	beq _02204DC8
	cmp r1, #1
	beq _02204DEC
	cmp r1, #2
	beq _02204E04
	b _02204E7A
_02204DC8:
	ldr r1, [r5]
	cmp r1, #0
	beq _02204DD4
	bl FollowingPokemon_GetMapObject
	b _02204DDA
_02204DD4:
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
_02204DDA:
	mov r1, #0
	mov r2, #1
	bl ov01_02200540
	str r0, [r5, #0x14]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204E7A
_02204DEC:
	ldr r0, [r5, #0x14]
	bl ov01_022003F4
	cmp r0, #0
	beq _02204E7A
	ldr r0, [r5, #0x14]
	bl sub_02068B48
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02204E7A
_02204E04:
	bl ov01_02204E8C
	add r4, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0x20
	beq _02204E14
	cmp r0, #0x69
	bne _02204E1E
_02204E14:
	cmp r4, #7
	bhs _02204E1E
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02204E1E:
	cmp r4, #8
	blo _02204E26
	bl GF_AssertFail
_02204E26:
	ldrh r0, [r5, #0x12]
	cmp r0, #0
	beq _02204E36
	cmp r0, #1
	beq _02204E3E
	cmp r0, #2
	beq _02204E46
	b _02204E4E
_02204E36:
	ldr r0, _02204E80 ; =ov01_02209614
	lsl r1, r4, #1
	ldrh r2, [r0, r1]
	b _02204E66
_02204E3E:
	ldr r0, _02204E84 ; =ov01_02209604
	lsl r1, r4, #1
	ldrh r2, [r0, r1]
	b _02204E66
_02204E46:
	ldr r0, _02204E88 ; =ov01_02209624
	lsl r1, r4, #1
	ldrh r2, [r0, r1]
	b _02204E66
_02204E4E:
	bl GF_AssertFail
	ldr r0, [r5, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	strh r1, [r0]
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02204E66:
	ldr r0, [r5, #8]
	mov r1, #1
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	strh r2, [r0]
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02204E7A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02204E80: .word ov01_02209614
_02204E84: .word ov01_02209604
_02204E88: .word ov01_02209624
	thumb_func_end ov01_02204DA0

	thumb_func_start ov01_02204E8C
ov01_02204E8C: ; 0x02204E8C
	push {r3, lr}
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x19
	bhs _02204EA4
	mov r0, #0
	pop {r3, pc}
_02204EA4:
	cmp r0, #0x2d
	bhs _02204EAC
	mov r0, #1
	pop {r3, pc}
_02204EAC:
	cmp r0, #0x37
	bhs _02204EB4
	mov r0, #2
	pop {r3, pc}
_02204EB4:
	cmp r0, #0x41
	bhs _02204EBC
	mov r0, #3
	pop {r3, pc}
_02204EBC:
	cmp r0, #0x4b
	bhs _02204EC4
	mov r0, #4
	pop {r3, pc}
_02204EC4:
	cmp r0, #0x55
	bhs _02204ECC
	mov r0, #5
	pop {r3, pc}
_02204ECC:
	cmp r0, #0x5f
	bhs _02204ED4
	mov r0, #6
	pop {r3, pc}
_02204ED4:
	mov r0, #7
	pop {r3, pc}
	thumb_func_end ov01_02204E8C

	.rodata

ov01_022095F4: ; 0x022095F4
	.byte  4,  3,  3,  2,  2,  1,  1,  0
	.byte  0, -1, -2, -3, -4, -5, -6, -7

ov01_02209604: ; 0x02209604
#ifdef HEARTGOLD
	.short ITEM_RED_SHARD, ITEM_YELLOW_SHARD, ITEM_HELIX_FOSSIL
#else
	.short ITEM_BLUE_SHARD, ITEM_GREEN_SHARD, ITEM_DOME_FOSSIL
#endif
	.short ITEM_MAX_ETHER
#ifdef HEARTGOLD
	.short ITEM_BLUE_SHARD, ITEM_GREEN_SHARD
#else
	.short ITEM_RED_SHARD, ITEM_YELLOW_SHARD
#endif
	.short ITEM_OLD_AMBER, ITEM_MAX_REVIVE

ov01_02209614: ; 0x02209614
	.short ITEM_MAX_ETHER, ITEM_REVIVE, ITEM_HEART_SCALE, ITEM_RED_SHARD, ITEM_BLUE_SHARD, ITEM_GREEN_SHARD
	.short ITEM_YELLOW_SHARD, ITEM_STAR_PIECE

ov01_02209624: ; 0x02209624
	.short ITEM_MAX_ETHER, ITEM_PEARL, ITEM_BIG_PEARL
#ifdef HEARTGOLD
	.short ITEM_RED_SHARD, ITEM_YELLOW_SHARD, ITEM_CLAW_FOSSIL, ITEM_CLAW_FOSSIL
#else
	.short ITEM_BLUE_SHARD, ITEM_GREEN_SHARD, ITEM_ROOT_FOSSIL, ITEM_ROOT_FOSSIL
#endif
	.short ITEM_RARE_BONE
