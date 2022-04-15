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

	thumb_func_start ov01_PlayerAvatar_OrrTransitionFlags
ov01_PlayerAvatar_OrrTransitionFlags: ; 0x021F1AFC
	ldr r3, _021F1B00 ; =PlayerAvatar_OrrTransitionFlags
	bx r3
	.balign 4, 0
_021F1B00: .word PlayerAvatar_OrrTransitionFlags
	thumb_func_end ov01_PlayerAvatar_OrrTransitionFlags

	thumb_func_start ov01_PlayerAvatar_ApplyTransitionFlags
ov01_PlayerAvatar_ApplyTransitionFlags: ; 0x021F1B04
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #0
	bl PlayerAvatar_GetTransitionFlags
	ldr r5, _021F1B34 ; =sPlayerAvatarBitUpdateFuncs
	add r4, r0, #0
_021F1B12:
	mov r0, #1
	tst r0, r4
	beq _021F1B1E
	ldr r1, [r5]
	add r0, r7, #0
	blx r1
_021F1B1E:
	add r6, r6, #1
	lsr r4, r4, #1
	add r5, r5, #4
	cmp r6, #0xf
	blo _021F1B12
	add r0, r7, #0
	mov r1, #0
	bl PlayerAvatar_SetTransitionFlags
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F1B34: .word sPlayerAvatarBitUpdateFuncs
	thumb_func_end ov01_PlayerAvatar_ApplyTransitionFlags

	thumb_func_start ov01_021F1B38
ov01_021F1B38: ; 0x021F1B38
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	add r0, r4, #0
	mov r1, #0
	bl PlayerAvatar_SetState
	add r0, r4, #0
	bl sub_0205C74C
	add r0, r4, #0
	bl sub_0205C790
	cmp r0, #0
	beq _021F1B6C
	bl ov01_021F1640
_021F1B6C:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205C78C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1B38

	thumb_func_start ov01_021F1B78
ov01_021F1B78: ; 0x021F1B78
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #1
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	add r0, r4, #0
	mov r1, #1
	bl PlayerAvatar_SetState
	add r0, r4, #0
	bl sub_0205C74C
	add r0, r4, #0
	bl sub_0205C790
	cmp r0, #0
	beq _021F1BAC
	bl ov01_021F1640
_021F1BAC:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205C78C
	ldr r0, _021F1BBC ; =SEQ_SE_DP_JITENSYA
	bl PlaySE
	pop {r4, pc}
	.balign 4, 0
_021F1BBC: .word SEQ_SE_DP_JITENSYA
	thumb_func_end ov01_021F1B78

	thumb_func_start ov01_021F1BC0
ov01_021F1BC0: ; 0x021F1BC0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #2
	bl sub_0205C898
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_021F3084
	add r0, r5, #0
	mov r1, #2
	bl PlayerAvatar_SetState
	add r0, r5, #0
	bl sub_0205C74C
	add r0, r5, #0
	bl sub_0205C790
	cmp r0, #0
	beq _021F1BF6
	bl ov01_021F1640
_021F1BF6:
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C78C
	add r0, r5, #0
	bl PlayerAvatar_GetFacingDirection
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_GetFieldSysPtr
	mov r0, #1
	mov r1, #0
	str r0, [sp]
	add r0, r6, #0
	add r2, r1, #0
	add r3, r4, #0
	bl ov01_021FE7DC
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205C78C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1BC0

	thumb_func_start ov01_021F1C30
ov01_021F1C30: ; 0x021F1C30
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #3
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	add r0, r4, #0
	mov r1, #3
	bl PlayerAvatar_SetState
	add r0, r4, #0
	bl sub_0205C74C
	add r0, r4, #0
	bl sub_0205C790
	cmp r0, #0
	beq _021F1C64
	bl ov01_021F1640
_021F1C64:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205C78C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1C30

	thumb_func_start ov01_021F1C70
ov01_021F1C70: ; 0x021F1C70
	ldr r3, _021F1C78 ; =sub_0205CA4C
	mov r1, #1
	bx r3
	nop
_021F1C78: .word sub_0205CA4C
	thumb_func_end ov01_021F1C70

	thumb_func_start ov01_021F1C7C
ov01_021F1C7C: ; 0x021F1C7C
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #5
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1C7C

	thumb_func_start ov01_021F1C98
ov01_021F1C98: ; 0x021F1C98
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #7
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1C98

	thumb_func_start ov01_021F1CB4
ov01_021F1CB4: ; 0x021F1CB4
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #8
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1CB4

	thumb_func_start ov01_021F1CD0
ov01_021F1CD0: ; 0x021F1CD0
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #9
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1CD0

	thumb_func_start ov01_021F1CEC
ov01_021F1CEC: ; 0x021F1CEC
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0xa
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1CEC

	thumb_func_start ov01_021F1D08
ov01_021F1D08: ; 0x021F1D08
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0xb
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1D08

	thumb_func_start ov01_021F1D24
ov01_021F1D24: ; 0x021F1D24
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0xc
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1D24

	thumb_func_start ov01_021F1D40
ov01_021F1D40: ; 0x021F1D40
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #6
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1D40

	thumb_func_start ov01_021F1D5C
ov01_021F1D5C: ; 0x021F1D5C
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0xd
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1D5C

	thumb_func_start ov01_021F1D78
ov01_021F1D78: ; 0x021F1D78
	push {r4, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0xe
	bl sub_0205C898
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021F3084
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1D78

	thumb_func_start ov01_021F1D94
ov01_021F1D94: ; 0x021F1D94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	add r7, r3, #0
	bl sub_0205CA38
	cmp r0, #1
	bne _021F1DBE
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl ov01_021F2538
	cmp r0, #1
	bne _021F1DBA
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F1DBA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1DBE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205CBE4
	cmp r0, #0
	bne _021F1DCE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1DCE:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _021F1DDA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1DDA:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov01_021F1DF4
	cmp r0, #1
	bne _021F1DEE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F1DEE:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1D94

	thumb_func_start ov01_021F1DF4
ov01_021F1DF4: ; 0x021F1DF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r6, r3, #0
	bl sub_0205DEC0
	str r0, [sp]
	mov r0, #1
	tst r0, r6
	beq _021F1E22
	ldr r3, [sp]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021F1E54
	cmp r0, #1
	bne _021F1E22
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F1E22:
	mov r0, #2
	tst r0, r6
	beq _021F1E3C
	ldr r3, [sp]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021F24F4
	cmp r0, #1
	bne _021F1E3C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F1E3C:
	ldr r3, [sp]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021F232C
	cmp r0, #1
	bne _021F1E50
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F1E50:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F1DF4

	thumb_func_start ov01_021F1E54
ov01_021F1E54: ; 0x021F1E54
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	cmp r3, #1
	beq _021F1E64
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1E64:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F3094
	add r6, r0, #0
	bne _021F1E74
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1E74:
	bl MapObject_GetGfxID
	cmp r0, #0x54
	beq _021F1E80
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1E80:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02060BB8
	mov r1, #1
	bic r0, r1
	beq _021F1E92
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1E92:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	add r3, r6, #0
	bl ov01_021F1EA4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1E54

	thumb_func_start ov01_021F1EA4
ov01_021F1EA4: ; 0x021F1EA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x14
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov01_021F30D0
	add r2, r0, #0
	str r5, [r2, #4]
	str r4, [r2, #8]
	str r7, [r2, #0x10]
	ldr r1, _021F1EC8 ; =ov01_021F1ECC
	add r0, r4, #0
	str r6, [r2, #0xc]
	bl FieldSys_CreateTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F1EC8: .word ov01_021F1ECC
	thumb_func_end ov01_021F1EA4

	thumb_func_start ov01_021F1ECC
ov01_021F1ECC: ; 0x021F1ECC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0x10]
	cmp r0, #0
	beq _021F1EF0
	cmp r0, #1
	beq _021F1F3C
	cmp r0, #2
	beq _021F1F62
	b _021F1F82
_021F1EF0:
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _021F1F82
	add r0, r6, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	bne _021F1F0E
	ldr r0, [r4, #0xc]
	bl sub_0205DE38
	cmp r0, #0
	beq _021F1F82
_021F1F0E:
	ldr r0, [r4, #4]
	mov r1, #8
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetHeldMovement
	ldr r0, [r4, #4]
	mov r1, #0x20
	bl sub_0206234C
	add r1, r0, #0
	add r0, r6, #0
	bl MapObject_SetHeldMovement
	ldr r0, _021F1F88 ; =SEQ_SE_DP_UG_023
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021F1F82
_021F1F3C:
	add r0, r5, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _021F1F82
	add r0, r6, #0
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _021F1F82
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F1F62:
	ldr r6, [r4, #8]
	add r0, r4, #0
	bl ov01_021F30F4
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	cmp r0, #0xed
	bne _021F1F7E
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov01_021F2004
	pop {r3, r4, r5, r6, r7, pc}
_021F1F7E:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F1F82:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F1F88: .word SEQ_SE_DP_UG_023
	thumb_func_end ov01_021F1ECC

	thumb_func_start ov01_021F1F8C
ov01_021F1F8C: ; 0x021F1F8C
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _021F2000 ; =ov01_02206A14
	add r7, r0, #0
	add r5, r1, #0
	mov r6, #0
_021F1F96:
	add r0, r5, #0
	bl sub_0205F254
	ldrh r1, [r4]
	cmp r1, r0
	bne _021F1FF4
	add r0, r5, #0
	bl MapObject_GetID
	ldrh r1, [r4, #6]
	cmp r1, r0
	bne _021F1FF4
	add r0, r5, #0
	bl MapObject_GetCurrentX
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _021F1FF4
	add r0, r5, #0
	bl MapObject_GetCurrentY
	ldrh r1, [r4, #4]
	cmp r1, r0
	bne _021F1FF4
	add r0, r5, #0
	bl MapObject_GetFlagID
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl FlagSet
	add r0, r5, #0
	bl DeleteMapObject
	mov r1, #0xa
	add r2, r6, #0
	mul r2, r1
	ldr r1, _021F2000 ; =ov01_02206A14
	add r0, r7, #0
	add r1, r1, r2
	ldrh r1, [r1, #8]
	bl FlagClear
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F1FF4:
	add r6, r6, #1
	add r4, #0xa
	cmp r6, #4
	blo _021F1F96
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F2000: .word ov01_02206A14
	thumb_func_end ov01_021F1F8C

	thumb_func_start ov01_021F2004
ov01_021F2004: ; 0x021F2004
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl ov01_021F1F8C
	cmp r0, #0
	bne _021F2018
	mov r0, #1
	pop {r4, pc}
_021F2018:
	ldr r1, _021F2028 ; =0x0000271F
	add r0, r4, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r0, #0
	pop {r4, pc}
	nop
_021F2028: .word 0x0000271F
	thumb_func_end ov01_021F2004

	thumb_func_start ov01_021F202C
ov01_021F202C: ; 0x021F202C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x2c
	add r7, r1, #0
	add r5, r2, #0
	bl ov01_021F30D0
	add r4, r0, #0
	str r7, [r4, #4]
	str r6, [r4, #0x1c]
	ldr r0, [r6, #0x40]
	str r0, [r4, #0x20]
	bl PlayerAvatar_GetMapObject
	add r2, r4, #0
	str r0, [r4, #0x24]
	add r2, #0xc
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r6, #0x10]
	ldr r1, _021F2064 ; =ov01_021F2118
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2064: .word ov01_021F2118
	thumb_func_end ov01_021F202C

	thumb_func_start ScriptCallTask_Surf
ScriptCallTask_Surf: ; 0x021F2068
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r2, #0
	add r5, r1, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r1, r6, #0
	bl ov01_021F3100
	add r1, r0, #0
	add r0, r4, #0
	add r2, sp, #0
	bl ov01_021F3040
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetState
	sub r0, r0, #1
	cmp r0, #1
	bhi _021F2098
	mov r0, #1
	str r0, [sp]
	b _021F20B0
_021F2098:
	add r0, r4, #0
	bl ov01_02206268
	cmp r0, #0
	beq _021F20B0
	add r0, r4, #0
	bl ov01_022062CC
	cmp r6, r0
	bne _021F20B0
	mov r0, #0
	str r0, [sp]
_021F20B0:
	add r0, r4, #0
	add r1, r5, #0
	add r2, sp, #0
	bl ov01_021F202C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScriptCallTask_Surf

	thumb_func_start Field_PlayerCanStartSurfingByStandingAndFacingTileBehaviors
Field_PlayerCanStartSurfingByStandingAndFacingTileBehaviors: ; 0x021F20C0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r1, #0
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B778
	cmp r0, #1
	bne _021F2112
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA30
	cmp r0, #1
	beq _021F20F0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA24
	cmp r0, #1
	bne _021F20FE
_021F20F0:
	add r0, r6, #0
	bl sub_0205F83C
	cmp r0, #1
	bne _021F20FE
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F20FE:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B78C
	cmp r0, #1
	bne _021F210E
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F210E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F2112:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Field_PlayerCanStartSurfingByStandingAndFacingTileBehaviors

	thumb_func_start ov01_021F2118
ov01_021F2118: ; 0x021F2118
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #9
	bhi _021F221C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F2134: ; jump table
	.short _021F2148 - _021F2134 - 2 ; case 0
	.short _021F217C - _021F2134 - 2 ; case 1
	.short _021F2192 - _021F2134 - 2 ; case 2
	.short _021F21D2 - _021F2134 - 2 ; case 3
	.short _021F21FC - _021F2134 - 2 ; case 4
	.short _021F2210 - _021F2134 - 2 ; case 5
	.short _021F222A - _021F2134 - 2 ; case 6
	.short _021F2274 - _021F2134 - 2 ; case 7
	.short _021F22A0 - _021F2134 - 2 ; case 8
	.short _021F22C2 - _021F2134 - 2 ; case 9
_021F2148:
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag99A
	cmp r0, #0
	bne _021F2172
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _021F2172
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl Fsys_SetSavedMusicId
	ldr r0, [r4, #0x1c]
	ldr r1, _021F2328 ; =0x000003F6
	mov r2, #1
	bl Fsys_PlayOrFadeToNewMusicId
_021F2172:
	ldr r0, [r4]
	add r0, r0, #1
	add r0, r0, #1
	str r0, [r4]
	b _021F2324
_021F217C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	ble _021F221C
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021F2324
_021F2192:
	ldr r0, [r4, #0xc]
	cmp r0, #1
	ldr r0, [r4, #0x1c]
	bne _021F21A8
	add r1, r4, #0
	add r1, #0xc
	bl ov01_021F3054
	mov r0, #5
	str r0, [r4]
	b _021F2324
_021F21A8:
	mov r1, #0xb
	bl ov02_02250780
	cmp r0, #0
	beq _021F21C4
	mov r0, #0x42
	ldr r1, [r4, #0x1c]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl FsysUnkSub108_AddMonMood
	mov r1, #2
	b _021F21C6
_021F21C4:
	mov r1, #1
_021F21C6:
	ldr r0, [r4, #0x1c]
	bl ov02_022507B4
	mov r0, #3
	str r0, [r4]
	b _021F2324
_021F21D2:
	ldr r0, [r4, #0x14]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [r4, #0x14]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r5, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
	mov r0, #4
	str r0, [r4]
	b _021F2324
_021F21FC:
	bl IsCryFinished
	cmp r0, #0
	bne _021F221C
	add r0, r5, #0
	bl ov01_02205EE0
	mov r0, #6
	str r0, [r4]
	b _021F2324
_021F2210:
	add r0, r4, #0
	add r0, #0xc
	bl ov01_021F3068
	cmp r0, #1
	beq _021F221E
_021F221C:
	b _021F2324
_021F221E:
	ldr r0, [r4, #0x1c]
	bl ov01_02205D68
	mov r0, #6
	str r0, [r4]
	b _021F2324
_021F222A:
	ldr r0, [r4, #0x20]
	bl GetPlayerXCoord
	add r5, r0, #0
	ldr r0, [r4, #4]
	bl GetDeltaXByFacingDirection
	add r6, r0, #0
	ldr r0, [r4, #0x20]
	bl GetPlayerYCoord
	add r7, r0, #0
	ldr r0, [r4, #4]
	bl GetDeltaYByFacingDirection
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4, #0x24]
	ldr r3, [r4, #4]
	add r1, r5, r6
	add r2, r7, r2
	bl ov01_021FE7DC
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x28]
	bl sub_0205C78C
	ldr r0, [r4, #0x20]
	mov r1, #2
	bl PlayerAvatar_SetState
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021F2324
_021F2274:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	ble _021F2324
	ldr r0, [r4, #0x20]
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0
	bl sub_0205C898
	add r1, r0, #0
	ldr r0, [r4, #0x20]
	bl ov01_021F3084
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021F2324
_021F22A0:
	ldr r0, [r4, #0x24]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021F2324
	ldr r0, [r4, #4]
	mov r1, #0x34
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x24]
	bl MapObject_SetHeldMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021F2324
_021F22C2:
	ldr r0, [r4, #0x24]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _021F2324
	ldr r0, [r4, #0x24]
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl ov01_021FE9F4
	ldr r0, [r4, #0x20]
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #2
	bl sub_0205C898
	add r1, r0, #0
	ldr r0, [r4, #0x20]
	bl ov01_021F3084
	ldr r0, [r4, #0x1c]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021F2312
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x1c]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_02205790
	ldr r0, [r4, #0x1c]
	bl FollowingPokemon_GetMapObject
	mov r1, #0x38
	bl sub_0205FC94
_021F2312:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl ov01_021E7F00
	add r0, r4, #0
	bl ov01_021F30F4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F2324:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F2328: .word 0x000003F6
	thumb_func_end ov01_021F2118

	thumb_func_start ov01_021F232C
ov01_021F232C: ; 0x021F232C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	cmp r3, #1
	bne _021F2342
	add r0, r5, #0
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _021F2346
_021F2342:
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2346:
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0205DA34
	cmp r0, #0x20
	bne _021F235E
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F235E:
	mov r1, #0x20
	bic r0, r1
	beq _021F2368
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2368:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov01_021F2378
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F232C

	thumb_func_start ov01_021F2378
ov01_021F2378: ; 0x021F2378
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x18
	add r5, r1, #0
	add r7, r2, #0
	bl ov01_021F30D0
	add r4, r0, #0
	str r6, [r4, #4]
	str r5, [r4, #8]
	str r7, [r4, #0xc]
	add r0, r7, #0
	bl PlayerAvatar_GetMapObject
	str r0, [r4, #0x10]
	add r0, r7, #0
	bl sub_0205C790
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _021F23A6
	bl GF_AssertFail
_021F23A6:
	ldr r1, _021F23B4 ; =ov01_021F23B8
	add r0, r5, #0
	add r2, r4, #0
	bl FieldSys_CreateTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F23B4: .word ov01_021F23B8
	thumb_func_end ov01_021F2378

	thumb_func_start ov01_021F23B8
ov01_021F23B8: ; 0x021F23B8
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4]
	cmp r0, #0
	beq _021F23D0
	cmp r0, #1
	beq _021F2412
	cmp r0, #2
	beq _021F24B8
	b _021F24F0
_021F23D0:
	ldr r0, [r4, #0x10]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	beq _021F23DC
	b _021F24F0
_021F23DC:
	ldr r0, [r4, #0xc]
	bl PlayerAvatar_GetGender
	add r1, r0, #0
	mov r0, #0
	bl sub_0205C898
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov01_021F3084
	ldr r0, [r4, #4]
	mov r1, #0x34
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl MapObject_SetHeldMovement
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl ov01_021FE9F4
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _021F24F0
_021F2412:
	ldr r0, [r4, #0x10]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _021F24F0
	ldr r0, [r4, #0x10]
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r4, #0x14]
	bl ov01_021F1640
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0205C78C
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl PlayerAvatar_SetState
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov01_021E7F00
	ldr r0, [r4, #8]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021F2476
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_02205790
	ldr r0, [r4, #8]
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov01_0220609C
	ldr r0, [r4, #8]
	bl FollowingPokemon_GetMapObject
	mov r1, #0x30
	bl sub_0205FC94
_021F2476:
	ldr r0, [r4, #8]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag99A
	cmp r0, #0
	bne _021F249A
	ldr r0, [r4, #8]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl GetMapMusic
	add r1, r0, #0
	ldr r0, [r4, #8]
	mov r2, #4
	bl Fsys_PlayOrFadeToNewMusicId
_021F249A:
	bl SndRadio_GetSeqNo
	cmp r0, #0
	beq _021F24AE
	mov r0, #0x28
	strh r0, [r4, #2]
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _021F24F0
_021F24AE:
	add r0, r4, #0
	bl ov01_021F30F4
	mov r0, #1
	pop {r4, pc}
_021F24B8:
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _021F24D2
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov01_021E7F00
	add r0, r4, #0
	bl ov01_021F30F4
	mov r0, #1
	pop {r4, pc}
_021F24D2:
	ldrh r0, [r4, #2]
	sub r0, r0, #1
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _021F24F0
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov01_021E7F00
	add r0, r4, #0
	bl ov01_021F30F4
	mov r0, #1
	pop {r4, pc}
_021F24F0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F23B8

	thumb_func_start ov01_021F24F4
ov01_021F24F4: ; 0x021F24F4
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	cmp r4, #1
	bne _021F250E
	cmp r3, #1
	bne _021F250E
	add r0, r5, #0
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _021F2512
_021F250E:
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2512:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DFEC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsWaterfall
	cmp r0, #0
	bne _021F252A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F252A:
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021F28EC
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F24F4

	thumb_func_start ov01_021F2538
ov01_021F2538: ; 0x021F2538
	push {r3, lr}
	add r0, r1, #0
	bl PlayerAvatar_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov01_021F2538

	thumb_func_start ov01_021F2548
ov01_021F2548: ; 0x021F2548
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x30
	add r7, r1, #0
	add r5, r2, #0
	bl ov01_021F30D0
	add r4, r0, #0
	str r7, [r4, #4]
	str r6, [r4, #0xc]
	ldr r0, [r6, #0x40]
	str r0, [r4, #0x10]
	bl PlayerAvatar_GetMapObject
	add r2, r4, #0
	str r0, [r4, #0x14]
	add r2, #0x1c
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x1c]
	cmp r0, #1
	bne _021F257C
	mov r0, #5
	b _021F257E
_021F257C:
	mov r0, #6
_021F257E:
	strh r0, [r4, #2]
	ldr r0, [r6, #0x10]
	ldr r1, _021F258C ; =ov01_021F2628
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F258C: .word ov01_021F2628
	thumb_func_end ov01_021F2548

	thumb_func_start ScriptCallTask_RockClimb
ScriptCallTask_RockClimb: ; 0x021F2590
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r2, #0
	add r5, r1, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r1, r6, #0
	bl ov01_021F3100
	add r1, r0, #0
	add r0, r4, #0
	add r2, sp, #0
	bl ov01_021F3040
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetState
	sub r0, r0, #1
	cmp r0, #1
	bhi _021F25C0
	mov r0, #1
	str r0, [sp]
	b _021F25D8
_021F25C0:
	add r0, r4, #0
	bl ov01_02206268
	cmp r0, #0
	beq _021F25D8
	add r0, r4, #0
	bl ov01_022062CC
	cmp r6, r0
	bne _021F25D8
	mov r0, #0
	str r0, [sp]
_021F25D8:
	add r0, r4, #0
	add r1, r5, #0
	add r2, sp, #0
	bl ov01_021F2548
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScriptCallTask_RockClimb

	thumb_func_start MetatileBehavior_IsRockClimbInDirection
MetatileBehavior_IsRockClimbInDirection: ; 0x021F25E8
	push {r3, lr}
	cmp r1, #3
	bhi _021F2622
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F25FA: ; jump table
	.short _021F2602 - _021F25FA - 2 ; case 0
	.short _021F2602 - _021F25FA - 2 ; case 1
	.short _021F2612 - _021F25FA - 2 ; case 2
	.short _021F2612 - _021F25FA - 2 ; case 3
_021F2602:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B834
	cmp r0, #1
	bne _021F2622
	mov r0, #1
	pop {r3, pc}
_021F2612:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B840
	cmp r0, #1
	bne _021F2622
	mov r0, #1
	pop {r3, pc}
_021F2622:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MetatileBehavior_IsRockClimbInDirection

	thumb_func_start ov01_021F2628
ov01_021F2628: ; 0x021F2628
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl TaskManager_GetEnv
	ldr r7, _021F268C ; =ov01_022069D0
	add r4, r0, #0
_021F2634:
	ldr r0, [r4, #0x1c]
	cmp r0, #1
	bne _021F2648
	ldrh r2, [r4]
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #2
	ldr r2, [r7, r2]
	blx r2
	b _021F2656
_021F2648:
	ldrh r2, [r4]
	add r0, r4, #0
	add r1, r6, #0
	lsl r3, r2, #2
	ldr r2, _021F2690 ; =ov01_022069F0
	ldr r2, [r2, r3]
	blx r2
_021F2656:
	add r5, r0, #0
	cmp r5, #2
	beq _021F2634
	cmp r5, #1
	bne _021F2686
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_02205790
	ldr r0, [r4, #0xc]
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ov01_0220609C
	add r0, r4, #0
	bl ov01_021F30F4
_021F2686:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F268C: .word ov01_022069D0
_021F2690: .word ov01_022069F0
	thumb_func_end ov01_021F2628

	thumb_func_start ov01_021F2694
ov01_021F2694: ; 0x021F2694
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x1c
	bl ov01_021F3054
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F2694

	thumb_func_start ov01_021F26AC
ov01_021F26AC: ; 0x021F26AC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x1c
	bl ov01_021F3068
	cmp r0, #1
	bne _021F26C6
	ldr r0, [r4, #0xc]
	bl ov01_02205D68
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021F26C6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F26AC

	thumb_func_start ov01_021F26CC
ov01_021F26CC: ; 0x021F26CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov02_02250780
	cmp r0, #0
	beq _021F26EE
	mov r0, #0x42
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl FsysUnkSub108_AddMonMood
	mov r1, #2
	b _021F26F0
_021F26EE:
	mov r1, #1
_021F26F0:
	ldr r0, [r4, #0xc]
	bl ov02_022507B4
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F26CC

	thumb_func_start ov01_021F2700
ov01_021F2700: ; 0x021F2700
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r4, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
	ldrh r0, [r5]
	add r0, r0, #1
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2700

	thumb_func_start ov01_021F2734
ov01_021F2734: ; 0x021F2734
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl IsCryFinished
	cmp r0, #0
	beq _021F2746
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2746:
	add r0, r5, #0
	bl ov01_02205EE0
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2734

	thumb_func_start ov01_021F2758
ov01_021F2758: ; 0x021F2758
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl GetDeltaXByFacingDirection
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	bl GetPlayerYCoord
	add r7, r0, #0
	ldr r0, [r5, #4]
	bl GetDeltaYByFacingDirection
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r3, [r5, #4]
	add r1, r4, r6
	add r2, r7, r2
	bl ov01_021FEAB0
	str r0, [r5, #0x18]
	ldr r0, [r5, #0xc]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021F27A2
	ldr r0, [r5, #0xc]
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
_021F27A2:
	ldr r0, [r5, #0xc]
	bl ov02_0224D9A4
	str r0, [r5, #0x2c]
	ldr r0, _021F27BC ; =SEQ_SE_DP_UG_023
	bl PlaySE
	ldrh r0, [r5]
	add r0, r0, #1
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F27BC: .word SEQ_SE_DP_UG_023
	thumb_func_end ov01_021F2758

	thumb_func_start ov01_021F27C0
ov01_021F27C0: ; 0x021F27C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021F27E4
	ldr r0, [r4, #4]
	mov r1, #0x34
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x14]
	bl MapObject_SetHeldMovement
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021F27E4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F27C0

	thumb_func_start ov01_021F27E8
ov01_021F27E8: ; 0x021F27E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _021F2804
	ldrh r0, [r4]
	mov r1, #1
	add r0, r0, #1
	strh r0, [r4]
	ldr r0, [r4, #0x18]
	bl ov01_021FEB30
_021F2804:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F27E8

	thumb_func_start ov01_021F2808
ov01_021F2808: ; 0x021F2808
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021F282C
	ldr r0, [r4, #4]
	mov r1, #0x10
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x14]
	bl MapObject_SetHeldMovement
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021F282C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F2808

	thumb_func_start ov01_021F2830
ov01_021F2830: ; 0x021F2830
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	bne _021F2842
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2842:
	ldr r0, [r5, #0x14]
	bl MapObject_GetNextFacing
	add r4, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r4, #0
	bl MetatileBehavior_IsRockClimbInDirection
	cmp r0, #1
	bne _021F2868
	ldrh r0, [r5, #2]
	strh r0, [r5]
	mov r0, #2
	pop {r3, r4, r5, pc}
_021F2868:
	ldr r0, [r5, #4]
	mov r1, #0x34
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r5, #0x14]
	bl MapObject_SetHeldMovement
	mov r1, #0
	str r1, [r5, #8]
	ldrh r0, [r5]
	add r0, r0, #1
	strh r0, [r5]
	ldr r0, [r5, #0x18]
	bl ov01_021FEB30
	ldr r0, [r5, #0x2c]
	bl ov02_0224D9B8
	mov r0, #0
	str r0, [r5, #0x2c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F2830

	thumb_func_start ov01_021F2894
ov01_021F2894: ; 0x021F2894
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	bne _021F28A6
	mov r0, #0
	pop {r4, pc}
_021F28A6:
	ldr r0, [r4, #0x14]
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r4, #0x18]
	bl ov01_021F1640
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2894

	thumb_func_start ov01_021F28B8
ov01_021F28B8: ; 0x021F28B8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x54
	add r7, r1, #0
	add r5, r2, #0
	bl ov01_021F30D0
	add r4, r0, #0
	str r7, [r4, #4]
	str r6, [r4, #0x34]
	ldr r0, [r6, #0x40]
	str r0, [r4, #0x38]
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	str r0, [r4, #0x3c]
	cmp r5, #0
	beq _021F28E8
	add r2, r4, #0
	add r2, #0x40
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
_021F28E8:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F28B8

	thumb_func_start ov01_021F28EC
ov01_021F28EC: ; 0x021F28EC
	push {r4, lr}
	mov r2, #0
	add r4, r0, #0
	bl ov01_021F28B8
	add r2, r0, #0
	ldr r1, _021F2904 ; =ov01_021F2944
	add r0, r4, #0
	bl FieldSys_CreateTask
	pop {r4, pc}
	nop
_021F2904: .word ov01_021F2944
	thumb_func_end ov01_021F28EC

	thumb_func_start ScriptCallTask_Waterfall
ScriptCallTask_Waterfall: ; 0x021F2908
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r2, #0
	add r6, r0, #0
	add r7, r1, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r1, r5, #0
	bl ov01_021F3100
	add r1, r0, #0
	add r0, r4, #0
	add r2, sp, #0
	bl ov01_021F3040
	add r0, r4, #0
	add r1, r7, #0
	add r2, sp, #0
	bl ov01_021F28B8
	add r2, r0, #0
	ldr r1, _021F2940 ; =ov01_021F2944
	add r0, r6, #0
	bl TaskManager_Call
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F2940: .word ov01_021F2944
	thumb_func_end ScriptCallTask_Waterfall

	thumb_func_start ov01_021F2944
ov01_021F2944: ; 0x021F2944
	push {r4, r5, r6, lr}
	bl TaskManager_GetEnv
	ldr r6, _021F2990 ; =ov01_022069BC
	ldr r4, _021F2994 ; =ov01_022069A8
	add r5, r0, #0
_021F2950:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _021F2962
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	b _021F296C
_021F2962:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	blx r1
_021F296C:
	cmp r0, #2
	beq _021F2950
	cmp r0, #1
	bne _021F298A
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x34]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_02205790
	add r0, r5, #0
	bl ov01_021F30F4
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F298A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021F2990: .word ov01_022069BC
_021F2994: .word ov01_022069A8
	thumb_func_end ov01_021F2944

	thumb_func_start ov01_021F2998
ov01_021F2998: ; 0x021F2998
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	cmp r0, #1
	bne _021F29B6
	add r1, r4, #0
	ldr r0, [r4, #0x34]
	add r1, #0x40
	bl ov01_021F3054
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
_021F29B6:
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2998

	thumb_func_start ov01_021F29C0
ov01_021F29C0: ; 0x021F29C0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x40
	bl ov01_021F3068
	cmp r0, #1
	bne _021F29DA
	ldr r0, _021F29E0 ; =SEQ_SE_DP_FW463
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F29DA:
	mov r0, #0
	pop {r4, pc}
	nop
_021F29E0: .word SEQ_SE_DP_FW463
	thumb_func_end ov01_021F29C0

	thumb_func_start ov01_021F29E4
ov01_021F29E4: ; 0x021F29E4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5, #0x3c]
	bl MapObject_GetCurrentX
	add r4, r0, #0
	mov r0, #0
	bl GetDeltaXByFacingDirection
	lsl r0, r0, #1
	add r4, r4, r0
	ldr r0, [r5, #0x3c]
	bl MapObject_GetCurrentY
	add r6, r0, #0
	mov r0, #0
	bl GetDeltaYByFacingDirection
	lsl r0, r0, #1
	add r6, r6, r0
	add r2, r5, #0
	add r0, r4, #0
	add r1, r6, #0
	add r2, #0x28
	bl sub_020611C8
	ldr r0, [r5, #0x30]
	mov r1, #1
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	ldr r2, [r5, #0x2c]
	ldr r3, [r5, #0x28]
	bl sub_02054790
	str r0, [r5, #0x2c]
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F2A3C
	bl GF_AssertFail
_021F2A3C:
	str r4, [r5, #0xc]
	ldr r0, [r5, #0x2c]
	asr r1, r0, #3
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	str r0, [r5, #0x10]
	str r6, [r5, #0x14]
	ldr r0, [r5, #0x3c]
	add r1, sp, #0x18
	bl MapObject_GetPositionVec
	ldr r1, [sp, #0x20]
	ldr r0, [r5, #0x30]
	cmp r1, r0
	bgt _021F2A62
	bl GF_AssertFail
_021F2A62:
	ldr r1, [sp, #0x1c]
	ldr r0, [r5, #0x2c]
	cmp r1, r0
	blt _021F2A6E
	bl GF_AssertFail
_021F2A6E:
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r5, #0x2c]
	ldr r0, [sp, #0x1c]
	add r3, sp, #0xc
	sub r2, r1, r0
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #0x20]
	str r2, [sp, #0x10]
	sub r1, r1, r0
	asr r0, r2, #5
	lsr r0, r0, #0x1a
	add r0, r2, r0
	asr r0, r0, #6
	str r0, [sp, #0x10]
	asr r0, r1, #5
	lsr r0, r0, #0x1a
	add r0, r1, r0
	add r2, r5, #0
	str r1, [sp, #0x14]
	asr r0, r0, #6
	str r0, [sp, #0x14]
	ldmia r3!, {r0, r1}
	add r2, #0x1c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x34]
	bl ov02_0224D598
	str r0, [r5, #0x50]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_021F29E4

	thumb_func_start ov01_021F2AB8
ov01_021F2AB8: ; 0x021F2AB8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x20]
	add r1, r1, r0
	str r1, [sp, #4]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	ble _021F2AD6
	str r0, [sp, #4]
_021F2AD6:
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x20
	blt _021F2AF2
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F2AF2:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_021F2AB8

	thumb_func_start ov01_021F2AF8
ov01_021F2AF8: ; 0x021F2AF8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x20]
	add r1, r1, r0
	str r1, [sp, #4]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	ble _021F2B16
	str r0, [sp, #4]
_021F2B16:
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x24]
	add r1, r1, r0
	str r1, [sp, #8]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _021F2B26
	str r0, [sp, #8]
_021F2B26:
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x40
	bge _021F2B3E
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021F2B3E:
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	beq _021F2B4A
	bl GF_AssertFail
_021F2B4A:
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	beq _021F2B56
	bl GF_AssertFail
_021F2B56:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0xc]
	bl MapObject_SetCurrentX
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x10]
	bl MapObject_SetCurrentHeight
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x14]
	bl MapObject_SetCurrentY
	ldr r0, [r4, #0x3c]
	bl sub_02060F78
	ldr r0, [r4, #0x50]
	bl ov02_0224D5AC
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_021F2AF8

	thumb_func_start ov01_021F2B80
ov01_021F2B80: ; 0x021F2B80
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	cmp r0, #1
	bne _021F2B9E
	add r1, r4, #0
	ldr r0, [r4, #0x34]
	add r1, #0x40
	bl ov01_021F3054
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
_021F2B9E:
	mov r0, #2
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov01_021F2B80

	thumb_func_start ov01_021F2BA4
ov01_021F2BA4: ; 0x021F2BA4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x40
	bl ov01_021F3068
	cmp r0, #1
	bne _021F2BBE
	ldr r0, _021F2BC4 ; =SEQ_SE_DP_FW463
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F2BBE:
	mov r0, #0
	pop {r4, pc}
	nop
_021F2BC4: .word SEQ_SE_DP_FW463
	thumb_func_end ov01_021F2BA4

	thumb_func_start ov01_021F2BC8
ov01_021F2BC8: ; 0x021F2BC8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5, #0x3c]
	bl MapObject_GetCurrentX
	add r4, r0, #0
	mov r0, #1
	bl GetDeltaXByFacingDirection
	lsl r0, r0, #1
	add r4, r4, r0
	ldr r0, [r5, #0x3c]
	bl MapObject_GetCurrentY
	add r6, r0, #0
	mov r0, #1
	bl GetDeltaYByFacingDirection
	lsl r0, r0, #1
	add r6, r6, r0
	add r2, r5, #0
	add r0, r4, #0
	add r1, r6, #0
	add r2, #0x28
	bl sub_020611C8
	add r1, r5, #0
	ldr r0, [r5, #0x34]
	add r1, #0x28
	bl sub_0206121C
	mov r0, #0
	str r0, [r5, #0x18]
	str r4, [r5, #0xc]
	ldr r0, [r5, #0x2c]
	asr r1, r0, #3
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	str r0, [r5, #0x10]
	str r6, [r5, #0x14]
	ldr r0, [r5, #0x3c]
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	ldr r1, [sp, #0x14]
	ldr r0, [r5, #0x30]
	cmp r1, r0
	blt _021F2C32
	bl GF_AssertFail
_021F2C32:
	ldr r1, [sp, #0x10]
	ldr r0, [r5, #0x2c]
	cmp r1, r0
	bgt _021F2C3E
	bl GF_AssertFail
_021F2C3E:
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x2c]
	ldr r0, [sp, #0x10]
	add r3, sp, #0
	sub r2, r1, r0
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #0x14]
	str r2, [sp, #4]
	sub r1, r1, r0
	asr r0, r2, #5
	lsr r0, r0, #0x1a
	add r0, r2, r0
	asr r0, r0, #6
	str r0, [sp, #4]
	asr r0, r1, #5
	lsr r0, r0, #0x1a
	add r0, r1, r0
	add r2, r5, #0
	str r1, [sp, #8]
	asr r0, r0, #6
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, #0x1c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x34]
	bl ov02_0224D598
	str r0, [r5, #0x50]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F2BC8

	thumb_func_start ov01_021F2C88
ov01_021F2C88: ; 0x021F2C88
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x24]
	add r1, r1, r0
	str r1, [sp, #8]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	ble _021F2CA8
	str r0, [sp, #8]
	b _021F2CB0
_021F2CA8:
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	add r0, r1, r0
	str r0, [r4, #0x18]
_021F2CB0:
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x20
	blt _021F2CCC
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F2CCC:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2C88

	thumb_func_start ov01_021F2CD4
ov01_021F2CD4: ; 0x021F2CD4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x20]
	add r1, r1, r0
	str r1, [sp, #4]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	bge _021F2CF2
	str r0, [sp, #4]
_021F2CF2:
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x24]
	add r1, r1, r0
	str r1, [sp, #8]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	ble _021F2D04
	str r0, [sp, #8]
	b _021F2D0C
_021F2D04:
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	add r0, r1, r0
	str r0, [r4, #0x18]
_021F2D0C:
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x40
	bge _021F2D24
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021F2D24:
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	beq _021F2D30
	bl GF_AssertFail
_021F2D30:
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	beq _021F2D3C
	bl GF_AssertFail
_021F2D3C:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0xc]
	bl MapObject_SetCurrentX
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x10]
	bl MapObject_SetCurrentHeight
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x14]
	bl MapObject_SetCurrentY
	ldr r0, [r4, #0x3c]
	bl sub_02060F78
	ldr r0, [r4, #0x50]
	bl ov02_0224D5AC
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2CD4

	thumb_func_start ov01_021F2D68
ov01_021F2D68: ; 0x021F2D68
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x54
	add r7, r1, #0
	add r5, r2, #0
	bl ov01_021F30D0
	add r4, r0, #0
	str r7, [r4, #4]
	str r6, [r4, #0x34]
	ldr r0, [r6, #0x40]
	str r0, [r4, #0x38]
	bl PlayerAvatar_GetMapObject
	add r2, r4, #0
	str r0, [r4, #0x3c]
	add r2, #0x40
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r6, #0x10]
	ldr r1, _021F2DA0 ; =ov01_021F2DD0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2DA0: .word ov01_021F2DD0
	thumb_func_end ov01_021F2D68

	thumb_func_start ScriptCallTask_Whirlpool
ScriptCallTask_Whirlpool: ; 0x021F2DA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r2, #0
	add r6, r1, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r1, r5, #0
	bl ov01_021F3100
	add r1, r0, #0
	add r0, r4, #0
	add r2, sp, #0
	bl ov01_021F3040
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #0
	bl ov01_021F2D68
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ScriptCallTask_Whirlpool

	thumb_func_start ov01_021F2DD0
ov01_021F2DD0: ; 0x021F2DD0
	push {r4, r5, r6, lr}
	bl TaskManager_GetEnv
	ldr r6, _021F2E04 ; =ov01_02206994
	add r5, r0, #0
_021F2DDA:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	blx r1
	add r4, r0, #0
	cmp r4, #2
	beq _021F2DDA
	cmp r4, #1
	bne _021F2E00
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x34]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_02205790
	add r0, r5, #0
	bl ov01_021F30F4
_021F2E00:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F2E04: .word ov01_02206994
	thumb_func_end ov01_021F2DD0

	thumb_func_start ov01_021F2E08
ov01_021F2E08: ; 0x021F2E08
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	ldr r0, [r4, #0x34]
	add r1, #0x40
	bl ov01_021F3054
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F2E08

	thumb_func_start ov01_021F2E20
ov01_021F2E20: ; 0x021F2E20
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x40
	bl ov01_021F3068
	cmp r0, #1
	bne _021F2E34
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F2E34:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F2E20

	thumb_func_start ov01_021F2E38
ov01_021F2E38: ; 0x021F2E38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021F2E50
	ldr r0, [r4, #0x34]
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
_021F2E50:
	ldr r0, [r4, #0x34]
	bl ov02_0224D67C
	str r0, [r4, #0x50]
	ldr r0, _021F2E68 ; =SEQ_SE_DP_FW463
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021F2E68: .word SEQ_SE_DP_FW463
	thumb_func_end ov01_021F2E38

	thumb_func_start ov01_021F2E6C
ov01_021F2E6C: ; 0x021F2E6C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021F2E90
	ldr r0, [r4, #4]
	mov r1, #4
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObject_SetHeldMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F2E90:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F2E6C

	thumb_func_start ov01_021F2E94
ov01_021F2E94: ; 0x021F2E94
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	bne _021F2EA6
	mov r0, #0
	pop {r4, pc}
_021F2EA6:
	ldr r0, [r4, #0x3c]
	bl MapObject_GetNextFacing
	ldr r0, [r4, #0x3c]
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsWhirlpool
	cmp r0, #1
	bne _021F2EC6
	mov r0, #3
	str r0, [r4]
	mov r0, #2
	pop {r4, pc}
_021F2EC6:
	ldr r0, [r4, #0x50]
	bl ov02_0224D690
	mov r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x3c]
	bl MapObject_ClearHeldMovementIfActive
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2E94

	thumb_func_start ov01_021F2EDC
ov01_021F2EDC: ; 0x021F2EDC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl sub_0205F73C
	cmp r0, #0
	beq _021F2F22
	add r0, r4, #0
	bl PlayerAvatar_GetState
	cmp r0, #0
	bne _021F2F22
	add r0, r5, #0
	bl MapObject_GetGfxID
	sub r0, #0xc4
	cmp r0, #1
	bls _021F2F22
	add r0, r4, #0
	bl PlayerAvatar_GetTransitionFlags
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x40
	bl ov01_PlayerAvatar_OrrTransitionFlags
	add r0, r4, #0
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_PlayerAvatar_OrrTransitionFlags
_021F2F22:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F2EDC

	thumb_func_start ov01_021F2F24
ov01_021F2F24: ; 0x021F2F24
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl sub_0205F73C
	cmp r0, #0
	beq _021F2F6C
	add r0, r4, #0
	bl PlayerAvatar_GetState
	cmp r0, #0
	bne _021F2F6C
	add r0, r5, #0
	bl MapObject_GetGfxID
	cmp r0, #0xc4
	beq _021F2F4E
	cmp r0, #0xc5
	bne _021F2F6C
_021F2F4E:
	add r0, r4, #0
	bl PlayerAvatar_GetTransitionFlags
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl ov01_PlayerAvatar_OrrTransitionFlags
	add r0, r4, #0
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_PlayerAvatar_OrrTransitionFlags
_021F2F6C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F2F24

	thumb_func_start Field_PlayerMovementSavingSet
Field_PlayerMovementSavingSet: ; 0x021F2F70
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r6, [r7, #0x40]
	add r0, r6, #0
	bl PlayerAvatar_GetState
	add r4, r0, #0
	beq _021F2F88
	cmp r4, #3
	beq _021F2F88
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F2F88:
	add r0, r6, #0
	bl PlayerAvatar_GetMapObject
	str r0, [sp]
	mov r0, #4
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r5, r0, #0
	mov r0, #0
	str r0, [r5]
	str r7, [r5, #8]
	str r6, [r5, #0xc]
	str r4, [r5, #4]
	cmp r4, #0
	bne _021F2FAC
	mov r4, #0x80
	b _021F2FBC
_021F2FAC:
	cmp r4, #3
	bne _021F2FB6
	mov r4, #1
	lsl r4, r4, #0xe
	b _021F2FBC
_021F2FB6:
	bl GF_AssertFail
	mov r4, #0x80
_021F2FBC:
	ldr r0, [sp]
	bl MapObject_UnpauseMovement
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_PlayerAvatar_OrrTransitionFlags
	add r0, r6, #0
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	ldr r0, _021F2FE8 ; =ov01_021F3030
	ldr r2, _021F2FEC ; =0x0000FFFF
	add r1, r5, #0
	bl CreateSysTask
	add r4, r0, #0
	bne _021F2FE2
	bl GF_AssertFail
_021F2FE2:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2FE8: .word ov01_021F3030
_021F2FEC: .word 0x0000FFFF
	thumb_func_end Field_PlayerMovementSavingSet

	thumb_func_start Field_PlayerMovementSavingClear
Field_PlayerMovementSavingClear: ; 0x021F2FF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	beq _021F302E
	bl sub_0201F988
	add r6, r0, #0
	ldr r0, [r6, #4]
	ldr r4, [r6, #0xc]
	cmp r0, #0
	bne _021F300C
	add r0, r4, #0
	bl ov01_021F1B38
	b _021F3022
_021F300C:
	cmp r0, #3
	bne _021F3018
	add r0, r4, #0
	bl ov01_021F1C30
	b _021F3022
_021F3018:
	bl GF_AssertFail
	add r0, r4, #0
	bl ov01_021F1B38
_021F3022:
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_021F302E:
	pop {r4, r5, r6, pc}
	thumb_func_end Field_PlayerMovementSavingClear

	thumb_func_start ov01_021F3030
ov01_021F3030: ; 0x021F3030
	push {r3, lr}
	ldr r0, [r1, #0xc]
	bl PlayerAvatar_GetMapObject
	bl sub_0205F484
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3030

	thumb_func_start ov01_021F3040
ov01_021F3040: ; 0x021F3040
	push {r4, lr}
	add r4, r2, #0
	mov r2, #1
	str r2, [r4]
	str r1, [r4, #8]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetGender
	str r0, [r4, #4]
	pop {r4, pc}
	thumb_func_end ov01_021F3040

	thumb_func_start ov01_021F3054
ov01_021F3054: ; 0x021F3054
	push {r4, lr}
	add r4, r1, #0
	ldr r2, [r4, #8]
	ldr r3, [r4, #4]
	mov r1, #0
	bl ov02_02249458
	str r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3054

	thumb_func_start ov01_021F3068
ov01_021F3068: ; 0x021F3068
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl ov02_0224953C
	cmp r0, #1
	bne _021F3080
	ldr r0, [r4, #0xc]
	bl ov02_02249548
	mov r0, #1
	pop {r4, pc}
_021F3080:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021F3068

	thumb_func_start ov01_021F3084
ov01_021F3084: ; 0x021F3084
	push {r4, lr}
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	add r1, r4, #0
	bl ov01_021FA930
	pop {r4, pc}
	thumb_func_end ov01_021F3084

	thumb_func_start ov01_021F3094
ov01_021F3094: ; 0x021F3094
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl GetPlayerXCoord
	add r6, r0, #0
	add r0, r5, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r4, #0
	bl GetPlayerYCoord
	str r0, [sp]
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerAvatar_GetMapObject
	bl sub_0205F35C
	ldr r2, [sp]
	add r1, r6, r7
	add r2, r2, r5
	mov r3, #0
	bl sub_0205FB58
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F3094

	thumb_func_start ov01_021F30D0
ov01_021F30D0: ; 0x021F30D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	add r1, r5, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _021F30E4
	bl GF_AssertFail
_021F30E4:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F30D0

	thumb_func_start ov01_021F30F4
ov01_021F30F4: ; 0x021F30F4
	ldr r3, _021F30FC ; =FreeToHeapExplicit
	add r1, r0, #0
	mov r0, #4
	bx r3
	.balign 4, 0
_021F30FC: .word FreeToHeapExplicit
	thumb_func_end ov01_021F30F4

	thumb_func_start ov01_021F3100
ov01_021F3100: ; 0x021F3100
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3100

	.rodata

ov01_02206994: ; 0x02206994
	.word ov01_021F2E08
	.word ov01_021F2E20
	.word ov01_021F2E38
	.word ov01_021F2E6C
	.word ov01_021F2E94

ov01_022069A8: ; 0x022069A8
	.word ov01_021F2998
	.word ov01_021F29C0
	.word ov01_021F29E4
	.word ov01_021F2AB8
	.word ov01_021F2AF8

ov01_022069BC: ; 0x022069BC
	.word ov01_021F2B80
	.word ov01_021F2BA4
	.word ov01_021F2BC8
	.word ov01_021F2C88
	.word ov01_021F2CD4

ov01_022069D0: ; 0x022069D0
	.word ov01_021F2694
	.word ov01_021F26AC
	.word ov01_021F2758
	.word ov01_021F27C0
	.word ov01_021F27E8
	.word ov01_021F2808
	.word ov01_021F2830
	.word ov01_021F2894

ov01_022069F0: ; 0x022069F0
	.word ov01_021F26CC
	.word ov01_021F2700
	.word ov01_021F2734
	.word ov01_021F2758
	.word ov01_021F27C0
	.word ov01_021F27E8
	.word ov01_021F2808
	.word ov01_021F2830
	.word ov01_021F2894

ov01_02206A14: ; 0x02206A14
	.byte 0xED, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEE, 0x01, 0xED, 0x00
	.byte 0x0A, 0x00, 0x12, 0x00, 0x01, 0x00, 0xEF, 0x01, 0xED, 0x00, 0x12, 0x00, 0x07, 0x00, 0x02, 0x00
	.byte 0xF0, 0x01, 0xED, 0x00, 0x13, 0x00, 0x13, 0x00, 0x03, 0x00, 0xF1, 0x01

sPlayerAvatarBitUpdateFuncs: ; 0x02206A3C
	.word ov01_021F1B38
	.word ov01_021F1B78
	.word ov01_021F1BC0
	.word ov01_021F1C70
	.word ov01_021F1C7C
	.word ov01_021F1C98
	.word ov01_021F1CB4
	.word ov01_021F1CD0
	.word ov01_021F1CEC
	.word ov01_021F1D08
	.word ov01_021F1C30
	.word ov01_021F1D24
	.word ov01_021F1D40
	.word ov01_021F1D5C
	.word ov01_021F1D78
