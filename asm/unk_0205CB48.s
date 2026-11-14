#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/field_move_response.h"
	.include "macros.inc"
	.include "unk_0205CB48.inc"
	.include "global.inc"

	.text

	thumb_func_start PlayerAvatar_SetMovement_BikeThirdGearBrake
PlayerAvatar_SetMovement_BikeThirdGearBrake: ; 0x0205D978
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	bl PlayerAvatar_DecelerateBike
	str r0, [sp]
	add r0, r5, #0
	bl PlayerAvatar_GetNextFacingDirection
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	bl PlayerAvatar_CheckCollision
	add r4, r0, #0
	mov r0, #4
	tst r0, r4
	beq _0205D9AC
	add r0, r6, #0
	mov r1, #0x38
	bl sub_0206234C
	str r0, [sp, #4]
	b _0205D9FE
_0205D9AC:
	mov r0, #0x40
	tst r0, r4
	beq _0205D9C4
	add r0, r6, #0
	mov r1, #0
	bl sub_0206234C
	str r0, [sp, #4]
	add r0, r5, #0
	bl PlayerAvatar_ClearSpeed
	b _0205D9FE
_0205D9C4:
	cmp r4, #0
	beq _0205D9F4
	mov r0, #0
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0x1c
	bl sub_0206234C
	str r0, [sp, #4]
	mov r0, #8
	tst r0, r4
	bne _0205D9E4
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D9E4:
	add r0, r7, #0
	add r1, r6, #0
	bl MapObject_SetNextFacingDirection
	add r0, r5, #0
	bl PlayerAvatar_ClearSpeed
	b _0205D9FE
_0205D9F4:
	add r0, r5, #0
	add r1, r6, #0
	bl PlayerAvatar_GetMovementActionFromSpeed
	str r0, [sp, #4]
_0205D9FE:
	ldr r0, [sp]
	cmp r0, #0
	bne _0205DA0C
	add r0, r5, #0
	mov r1, #0
	bl PlayerAvatar_SetBikeBrake
_0205DA0C:
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	bl PlayerAvatar_SetMovement
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PlayerAvatar_SetMovement_BikeThirdGearBrake

	thumb_func_start PlayerAvatar_SetMovement
PlayerAvatar_SetMovement: ; 0x0205DA1C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r1, r4, #0
	bl PlayerAvatar_SetUnk8
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PlayerAvatar_SetMovement

	thumb_func_start PlayerAvatar_CheckCollision
PlayerAvatar_CheckCollision: ; 0x0205DA34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #0
	bl sub_0205DAA8
	mov r1, #0xa
	str r0, [sp]
	tst r0, r1
	beq _0205DA60
	mov r0, #1
	orr r4, r0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DBF4
	cmp r0, #0
	beq _0205DA60
	mov r0, #8
	orr r4, r0
_0205DA60:
	ldr r0, [sp]
	mov r1, #4
	tst r0, r1
	beq _0205DA6C
	mov r0, #2
	orr r4, r0
_0205DA6C:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DB68
	cmp r0, #0
	beq _0205DA7E
	mov r0, #4
	orr r4, r0
_0205DA7E:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DCA0
	cmp r0, #1
	bne _0205DA90
	mov r0, #0x20
	orr r4, r0
_0205DA90:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205DCFC
	cmp r0, #1
	bne _0205DAA2
	mov r0, #1
	orr r4, r0
_0205DAA2:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PlayerAvatar_CheckCollision

	thumb_func_start sub_0205DAA8
sub_0205DAA8: ; 0x0205DAA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r2, [sp, #4]
	add r0, r5, #0
	bl MapObject_GetXCoord
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl GetDeltaXByFacingDirection
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl MapObject_GetYCoord
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObject_GetZCoord
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl GetDeltaYByFacingDirection
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #0x1c
	bl MapObject_CopyPositionVector
	ldr r1, [sp, #0x14]
	ldr r6, [sp, #0xc]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r7, r1
	add r3, r6, r3
	mov r4, #0
	bl sub_02060D94
	cmp r0, #1
	bne _0205DAFC
	mov r0, #1
	orr r4, r0
_0205DAFC:
	add r0, r5, #0
	bl MapObject_GetFieldSystem
	ldr r2, [sp, #0x14]
	add r1, sp, #0x18
	str r1, [sp]
	ldr r6, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r1, sp, #0x1c
	add r2, r7, r2
	add r3, r6, r3
	bl sub_020549F4
	cmp r0, #1
	bne _0205DB2C
	mov r0, #2
	orr r4, r0
	add r1, sp, #0x18
	mov r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0205DB2C
	mov r0, #8
	orr r4, r0
_0205DB2C:
	ldr r3, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, r3, r2
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r7, r1
	bl sub_02060DEC
	cmp r0, #1
	bne _0205DB46
	mov r0, #2
	orr r4, r0
_0205DB46:
	add r0, r5, #0
	ldr r1, [sp, #0x14]
	ldr r5, [sp, #0xc]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	add r1, r7, r1
	add r3, r5, r3
	bl sub_02060BFC
	cmp r0, #1
	bne _0205DB60
	mov r0, #4
	orr r4, r0
_0205DB60:
	add r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205DAA8

	thumb_func_start sub_0205DB68
sub_0205DB68: ; 0x0205DB68
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0
	add r4, r2, #0
	mvn r0, r0
	add r5, r1, #0
	cmp r4, r0
	beq _0205DBF0
	add r0, r5, #0
	bl MapObject_GetFieldSystem
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetXCoord
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetZCoord
	add r5, r0, #0
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r5, r2
	bl GetMetatileBehavior
	cmp r4, #3
	bhi _0205DBF0
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205DBB8: ; jump table
	.short _0205DBC0 - _0205DBB8 - 2 ; case 0
	.short _0205DBCC - _0205DBB8 - 2 ; case 1
	.short _0205DBD8 - _0205DBB8 - 2 ; case 2
	.short _0205DBE4 - _0205DBB8 - 2 ; case 3
_0205DBC0:
	bl MetatileBehavior_IsJumpNorth
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBCC:
	bl MetatileBehavior_IsJumpSouth
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBD8:
	bl MetatileBehavior_IsJumpWest
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBE4:
	bl MetatileBehavior_IsJumpEast
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBF0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DB68

	thumb_func_start sub_0205DBF4
sub_0205DBF4: ; 0x0205DBF4
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0
	add r4, r2, #0
	mvn r0, r0
	add r5, r1, #0
	cmp r4, r0
	beq _0205DC9C
	add r0, r5, #0
	bl MapObject_GetFieldSystem
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetXCoord
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetZCoord
	str r0, [sp]
	ldr r2, [sp]
	add r0, r7, #0
	add r1, r6, #0
	bl GetMetatileBehavior
	add r5, r0, #0
	cmp r4, #3
	bhi _0205DC74
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0205DC36: ; jump table
	.short _0205DC3E - _0205DC36 - 2 ; case 0
	.short _0205DC4A - _0205DC36 - 2 ; case 1
	.short _0205DC58 - _0205DC36 - 2 ; case 2
	.short _0205DC66 - _0205DC36 - 2 ; case 3
_0205DC3E:
	bl MetatileBehavior_IsWarpEntranceNorth
	cmp r0, #1
	bne _0205DC4A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC4A:
	add r0, r5, #0
	bl MetatileBehavior_IsWarpEntranceSouth
	cmp r0, #1
	bne _0205DC58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC58:
	add r0, r5, #0
	bl MetatileBehavior_IsWarpEntranceWest
	cmp r0, #1
	bne _0205DC66
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC66:
	add r0, r5, #0
	bl MetatileBehavior_IsWarpEntranceEast
	cmp r0, #1
	bne _0205DC74
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC74:
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r5, r0, #0
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r3, r0, #0
	ldr r2, [sp]
	add r0, r7, #0
	add r1, r6, r5
	add r2, r2, r3
	bl GetMetatileBehavior
	bl MetatileBehavior_IsDoor
	cmp r0, #1
	bne _0205DC9C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC9C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DBF4

	thumb_func_start sub_0205DCA0
sub_0205DCA0: ; 0x0205DCA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r0, #0
	add r4, r2, #0
	mvn r0, r0
	add r5, r1, #0
	cmp r4, r0
	beq _0205DCF6
	add r0, r5, #0
	bl MapObject_GetFieldSystem
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetXCoord
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetZCoord
	str r0, [sp, #4]
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r3, r0, #0
	ldr r2, [sp, #4]
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r2, r3
	bl GetMetatileBehavior
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02060E54
	cmp r0, #0
	beq _0205DCF6
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DCF6:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DCA0

	thumb_func_start sub_0205DCFC
sub_0205DCFC: ; 0x0205DCFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	mvn r1, r1
	cmp r4, r1
	beq _0205DD8E
	bl PlayerAvatar_GetState
	cmp r0, #1
	bne _0205DD8E
	add r0, r5, #0
	bl MapObject_GetFieldSystem
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetXCoord
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetZCoord
	str r0, [sp, #4]
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r3, r0, #0
	ldr r2, [sp, #4]
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r2, r3
	bl GetMetatileBehavior
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #0
	beq _0205DD5C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD5C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #0
	beq _0205DD6E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD6E:
	add r0, r4, #0
	bl MetatileBehavior_IsVeryTallGrass
	cmp r0, #0
	beq _0205DD7E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD7E:
	add r0, r4, #0
	bl MetatileBehavior_IsMud
	cmp r0, #0
	beq _0205DD8E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD8E:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DCFC

	thumb_func_start sub_0205DD94
sub_0205DD94: ; 0x0205DD94
	ldr r3, _0205DD98 ; =PlayerAvatar_GetDirectionFromKeys
	bx r3
	.balign 4, 0
_0205DD98: .word PlayerAvatar_GetDirectionFromKeys
	thumb_func_end sub_0205DD94

	thumb_func_start sub_0205DD9C
sub_0205DD9C: ; 0x0205DD9C
	mov r1, #0x20
	tst r1, r0
	beq _0205DDA6
	mov r0, #2
	bx lr
_0205DDA6:
	mov r1, #0x10
	tst r0, r1
	beq _0205DDB0
	mov r1, #3
	b _0205DDB2
_0205DDB0:
	sub r1, #0x11
_0205DDB2:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DD9C

	thumb_func_start sub_0205DDB8
sub_0205DDB8: ; 0x0205DDB8
	mov r1, #0x40
	tst r1, r0
	beq _0205DDC2
	mov r0, #0
	bx lr
_0205DDC2:
	mov r1, #0x80
	tst r0, r1
	beq _0205DDCC
	mov r1, #1
	b _0205DDCE
_0205DDCC:
	sub r1, #0x81
_0205DDCE:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DDB8

	thumb_func_start PlayerAvatar_GetDirectionFromKeys
PlayerAvatar_GetDirectionFromKeys: ; 0x0205DDD4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205DD9C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205DDB8
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	cmp r4, r1
	beq _0205DE34
	cmp r5, r1
	bne _0205DDFA
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DDFA:
	add r0, r6, #0
	bl PlayerAvatar_GetNextFacingDirection
	add r7, r0, #0
	add r0, r6, #0
	bl PlayerAvatar_GetFaceLeftOrRight
	str r0, [sp]
	add r0, r6, #0
	bl PlayerAvatar_GetFaceUpOrDown
	mov r1, #0
	mvn r1, r1
	cmp r7, r1
	beq _0205DE32
	ldr r1, [sp]
	cmp r4, r1
	bne _0205DE26
	cmp r5, r0
	bne _0205DE26
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DE26:
	cmp r5, r0
	beq _0205DE2E
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DE2E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205DE32:
	add r0, r5, #0
_0205DE34:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PlayerAvatar_GetDirectionFromKeys

	thumb_func_start sub_0205DE38
sub_0205DE38: ; 0x0205DE38
	push {r4, lr}
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205DE4C
	mov r0, #1
	pop {r4, pc}
_0205DE4C:
	add r0, r4, #0
	bl MapObject_GetMovementCommand
	bl sub_0205DE64
	cmp r0, #1
	bne _0205DE5E
	mov r0, #1
	pop {r4, pc}
_0205DE5E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205DE38

	thumb_func_start sub_0205DE64
sub_0205DE64: ; 0x0205DE64
	sub r0, #0x1c
	cmp r0, #3
	bhi _0205DE82
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DE76: ; jump table
	.short _0205DE7E - _0205DE76 - 2 ; case 0
	.short _0205DE7E - _0205DE76 - 2 ; case 1
	.short _0205DE7E - _0205DE76 - 2 ; case 2
	.short _0205DE7E - _0205DE76 - 2 ; case 3
_0205DE7E:
	mov r0, #1
	bx lr
_0205DE82:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DE64

	thumb_func_start PlayerAvatar_IsRunButtonHeld
PlayerAvatar_IsRunButtonHeld: ; 0x0205DE88
	mov r0, #2
	tst r0, r1
	beq _0205DE92
	mov r0, #1
	bx lr
_0205DE92:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end PlayerAvatar_IsRunButtonHeld

	thumb_func_start sub_0205DE98
sub_0205DE98: ; 0x0205DE98
	push {r3, lr}
	bl PlayerAvatar_GetUnk8
	sub r0, #0x58
	cmp r0, #3
	bhi _0205DEBC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DEB0: ; jump table
	.short _0205DEB8 - _0205DEB0 - 2 ; case 0
	.short _0205DEB8 - _0205DEB0 - 2 ; case 1
	.short _0205DEB8 - _0205DEB0 - 2 ; case 2
	.short _0205DEB8 - _0205DEB0 - 2 ; case 3
_0205DEB8:
	mov r0, #1
	pop {r3, pc}
_0205DEBC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205DE98

	thumb_func_start sub_0205DEC0
sub_0205DEC0: ; 0x0205DEC0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl PlayerAvatar_GetState
	cmp r0, #3
	bhi _0205DF02
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DEDA: ; jump table
	.short _0205DEE2 - _0205DEDA - 2 ; case 0
	.short _0205DEF2 - _0205DEDA - 2 ; case 1
	.short _0205DEE2 - _0205DEDA - 2 ; case 2
	.short _0205DEE2 - _0205DEDA - 2 ; case 3
_0205DEE2:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayerAvatar_UpdateMoveState
	bl PlayerAvatar_ValidateState
	add r4, r0, #0
	b _0205DF08
_0205DEF2:
	add r0, r4, #0
	add r1, r5, #0
	bl PlayerAvatar_GetBikeStateThirdGear
	bl PlayerAvatarBikeState_GetMoveStateThirdGear
	add r4, r0, #0
	b _0205DF08
_0205DF02:
	mov r4, #0
	bl GF_AssertFail
_0205DF08:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205DEC0

	thumb_func_start sub_0205DF0C
sub_0205DF0C: ; 0x0205DF0C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r2, #0
	add r6, r3, #0
	bl PlayerAvatar_GetDirectionFromKeys
	str r0, [sp]
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0205DEC0
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl PlayerAvatar_SetMoveState
	cmp r4, #0
	bne _0205DF3E
	add r0, r5, #0
	bl PlayerAvatar_GetFacingDirection
	mov r1, #0
	bl sub_0206234C
	pop {r3, r4, r5, r6, r7, pc}
_0205DF3E:
	cmp r4, #2
	bne _0205DF4C
	ldr r0, [sp]
	mov r1, #0x28
	bl sub_0206234C
	pop {r3, r4, r5, r6, r7, pc}
_0205DF4C:
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	ldr r0, [sp, #0x1c]
	mov r4, #4
	add r1, r0, #0
	tst r1, r4
	beq _0205DF60
	mov r4, #0x38
	b _0205DFBE
_0205DF60:
	cmp r0, #0
	beq _0205DF76
	mov r1, #8
	mov r4, #0x1c
	tst r0, r1
	bne _0205DFBE
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
	b _0205DFBE
_0205DF76:
	cmp r6, #5
	bhi _0205DFA8
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205DF86: ; jump table
	.short _0205DF92 - _0205DF86 - 2 ; case 0
	.short _0205DF94 - _0205DF86 - 2 ; case 1
	.short _0205DF98 - _0205DF86 - 2 ; case 2
	.short _0205DF9C - _0205DF86 - 2 ; case 3
	.short _0205DFA0 - _0205DF86 - 2 ; case 4
	.short _0205DFA4 - _0205DF86 - 2 ; case 5
_0205DF92:
	b _0205DFAA
_0205DF94:
	mov r4, #8
	b _0205DFAA
_0205DF98:
	mov r4, #0xc
	b _0205DFAA
_0205DF9C:
	mov r4, #0x4c
	b _0205DFAA
_0205DFA0:
	mov r4, #0x10
	b _0205DFAA
_0205DFA4:
	mov r4, #0x14
	b _0205DFAA
_0205DFA8:
	mov r4, #4
_0205DFAA:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0205DFBE
	add r0, r5, #0
	add r1, r7, #0
	bl PlayerAvatar_IsRunButtonHeld
	cmp r0, #1
	bne _0205DFBE
	mov r4, #0x58
_0205DFBE:
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_0206234C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205DF0C

	thumb_func_start sub_0205DFC8
sub_0205DFC8: ; 0x0205DFC8
	push {r3, lr}
	bl PlayerAvatar_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	pop {r3, pc}
	thumb_func_end sub_0205DFC8

	thumb_func_start sub_0205DFD4
sub_0205DFD4: ; 0x0205DFD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl PlayerAvatar_SetMovement
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205DFD4

	thumb_func_start sub_0205DFEC
sub_0205DFEC: ; 0x0205DFEC
	push {r4, lr}
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	add r1, r4, #0
	bl LocalMapObject_GetNextPositionMetatileBehavior
	pop {r4, pc}
	thumb_func_end sub_0205DFEC

	thumb_func_start sub_0205DFFC
sub_0205DFFC: ; 0x0205DFFC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r6, r2, #0
	add r7, r3, #0
	bl PlayerAvatar_GetXCoord
	add r4, r0, #0
	add r0, r5, #0
	bl GetDeltaXByFacingDirection
	add r0, r4, r0
	str r0, [r6]
	ldr r0, [sp]
	bl PlayerAvatar_GetZCoord
	add r4, r0, #0
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
	add r0, r4, r0
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205DFFC

	thumb_func_start PlayerAvatar_GetCoordsInFront
PlayerAvatar_GetCoordsInFront: ; 0x0205E02C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_0205DFFC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end PlayerAvatar_GetCoordsInFront

	thumb_func_start PlayerAvatar_IncrementStepsRecord
PlayerAvatar_IncrementStepsRecord: ; 0x0205E048
	push {r3, r4, r5, lr}
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetFieldSystem
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_GameStats_Get
	mov r1, #0 ; GAME_STAT_STEPS_WALKED
	add r4, r0, #0
	bl GameStats_Inc
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #1 ; PLAYER_STATE_CYCLING
	bne _0205E074
	add r0, r4, #0
	mov r1, #1 ; GAME_STAT_STEPS_BIKED
	bl GameStats_Inc
_0205E074:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PlayerAvatar_IncrementStepsRecord

	thumb_func_start PlayerAvatar_IsOnCyclingRoadBridge
PlayerAvatar_IsOnCyclingRoadBridge: ; 0x0205E078
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	cmp r2, r1
	beq _0205E08A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205E08A:
	bl PlayerAvatar_GetState
	cmp r0, #1
	beq _0205E096
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205E096:
	add r0, r5, #0
	bl PlayerAvatar_CheckBikeStateLocked
	cmp r0, #0
	bne _0205E0A4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205E0A4:
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r1, r4, #0
	bl sub_02060EEC
	cmp r0, #1
	bne _0205E0B8
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205E0B8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end PlayerAvatar_IsOnCyclingRoadBridge

	.rodata

	.public sTileMovementFunctions
sTileMovementFunctions:
	.word PlayerAvatar_TileMove_None
	.word PlayerAvatar_TileMove_Ice
	.word PlayerAvatar_TileMove_CyclingRoadDown

	.public sTileBehaviorCheckTable
sTileBehaviorCheckTable:
	.word MetatileBehavior_IsIce, 1 ; TILE_MOVE_ICE
	.word 0, 3 ; NULL, TILE_MOVE_MAX

	.public sWalkSounds
sWalkSounds:
	.short SEQ_SE_GS_ASHIOTO_A_WALK, 0 ; Footstep A Walk
	.short SEQ_SE_GS_ASHIOTO_A, 0 ; Footstep A
	.short SEQ_SE_GS_OCHIBA, 0 ; Fallen Leaves
	.short SEQ_SE_GS_EDAPAKI, 0 ; Branch Snap
	.short SEQ_SE_GS_KUSA2, 0 ; Grass 2
	.short SEQ_SE_GS_ASHIOTO_B, 1 ; Footstep B
	.short SEQ_SE_GS_ASHIOTO_D, 1 ; Footstep D
	.short SEQ_SE_GS_ASHIOTO_D_2, 0 ; Footstep D2
	.short SEQ_SE_GS_ASHIOTO_E, 0 ; Footstep E
	.short SEQ_SE_GS_ASHIOTO_B, 1 ; Footstep B
	.short SEQ_SE_GS_ASHIOTO_F, 1 ; Footstep F
	.short SEQ_SE_GS_ASHIOTO_D, 0 ; Footstep D
	.short SEQ_SE_GS_ASHIOTO_H, 0 ; Footstep H
	.short SEQ_SE_GS_ASHIOTO_G, 0 ; Footstep G
	.short SEQ_SE_DP_BOX02, 0
	.short SEQ_SE_DP_BOX01, 0
