	.include "asm/macros.inc"
	.include "unk_0203DB6C.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0203DB6C
sub_0203DB6C: ; 0x0203DB6C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DB6C

	thumb_func_start sub_0203DB70
sub_0203DB70: ; 0x0203DB70
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DB70

	thumb_func_start sub_0203DB74
sub_0203DB74: ; 0x0203DB74
	mov r0, #1
	bx lr
	thumb_func_end sub_0203DB74

	thumb_func_start _GetCoordsOfFacingTile
_GetCoordsOfFacingTile: ; 0x0203DB78
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x40]
	add r4, r1, #0
	add r5, r2, #0
	bl PlayerAvatar_GetFacingDirection
	add r7, r0, #0
	ldr r0, [r6, #0x40]
	bl GetPlayerXCoord
	str r0, [r4]
	ldr r0, [r6, #0x40]
	bl GetPlayerYCoord
	str r0, [r5]
	cmp r7, #3
	bhi _0203DBCE
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203DBA8: ; jump table
	.short _0203DBB0 - _0203DBA8 - 2 ; case 0
	.short _0203DBB8 - _0203DBA8 - 2 ; case 1
	.short _0203DBC0 - _0203DBA8 - 2 ; case 2
	.short _0203DBC8 - _0203DBA8 - 2 ; case 3
_0203DBB0:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	b _0203DBCE
_0203DBB8:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203DBCE
_0203DBC0:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	b _0203DBCE
_0203DBC8:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0203DBCE:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end _GetCoordsOfFacingTile

	thumb_func_start sub_0203DBD4
sub_0203DBD4: ; 0x0203DBD4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl PlayerAvatar_GetMapObject
	bl sub_0205F9D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F9D0
	cmp r4, r0
	bne _0203DBF0
	mov r0, #1
	b _0203DBF2
_0203DBF0:
	mov r0, #0
_0203DBF2:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203DBD4

	thumb_func_start FieldSystem_GetFacingObject
FieldSystem_GetFacingObject: ; 0x0203DBF8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r1, #0
	add r1, sp, #4
	add r2, sp, #0
	add r5, r0, #0
	bl _GetCoordsOfFacingTile
	add r4, r0, #0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl GetMetatileBehaviorAt
	bl sub_0205B700
	cmp r0, #1
	bne _0203DC52
	cmp r4, #3
	bhi _0203DC52
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203DC2C: ; jump table
	.short _0203DC34 - _0203DC2C - 2 ; case 0
	.short _0203DC3C - _0203DC2C - 2 ; case 1
	.short _0203DC44 - _0203DC2C - 2 ; case 2
	.short _0203DC4C - _0203DC2C - 2 ; case 3
_0203DC34:
	ldr r0, [sp]
	sub r0, r0, #1
	str r0, [sp]
	b _0203DC52
_0203DC3C:
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	b _0203DC52
_0203DC44:
	ldr r0, [sp, #4]
	sub r0, r0, #1
	str r0, [sp, #4]
	b _0203DC52
_0203DC4C:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_0203DC52:
	ldr r0, [r5, #0x3c]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	mov r3, #0
	bl sub_0205FB58
	str r0, [r6]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end FieldSystem_GetFacingObject

	thumb_func_start sub_0203DC64
sub_0203DC64: ; 0x0203DC64
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl FieldSystem_GetFacingObject
	ldr r0, [r4]
	cmp r0, #0
	beq _0203DC8C
	bl MapObject_CheckFlag19Is0
	cmp r0, #1
	bne _0203DC8C
	ldr r0, [r5, #0x40]
	ldr r1, [r4]
	bl sub_0203DBD4
	cmp r0, #1
	bne _0203DC8C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0203DC8C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203DC64

	thumb_func_start GetInteractedBackgroundEventScript
GetInteractedBackgroundEventScript: ; 0x0203DC90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	add r1, sp, #0xc
	add r2, sp, #8
	add r6, r0, #0
	bl _GetCoordsOfFacingTile
	ldr r0, [sp, #4]
	mov r7, #0
	cmp r0, #0
	ble _0203DD04
	ldr r4, [sp]
	add r5, r4, #0
_0203DCAE:
	ldr r1, [sp, #0xc]
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _0203DCF8
	ldr r1, [sp, #8]
	ldr r0, [r4, #8]
	cmp r1, r0
	bne _0203DCF8
	ldrh r0, [r4, #2]
	cmp r0, #2
	bne _0203DCDE
	add r0, r6, #0
	add r1, r5, #0
	bl BgEventIsUncollectedHiddenItem
	cmp r0, #1
	bne _0203DCF8
	mov r0, #0x14
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp]
	add sp, #0x10
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0203DCDE:
	add r0, r6, #0
	add r1, r5, #0
	bl BgEventDirectionIsCompatibleWithPlayerFacing
	cmp r0, #1
	bne _0203DCF8
	mov r0, #0x14
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp]
	add sp, #0x10
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0203DCF8:
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r4, #0x14
	add r5, #0x14
	cmp r7, r0
	blt _0203DCAE
_0203DD04:
	ldr r0, _0203DD0C ; =0x0000FFFF
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203DD0C: .word 0x0000FFFF
	thumb_func_end GetInteractedBackgroundEventScript

	thumb_func_start BgEventIsUncollectedHiddenItem
BgEventIsUncollectedHiddenItem: ; 0x0203DD10
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r1, #2]
	cmp r0, #2
	beq _0203DD1E
	mov r0, #0
	pop {r4, pc}
_0203DD1E:
	ldrh r0, [r1]
	bl HiddenItemScriptNoToFlagId
	add r1, r0, #0
	add r0, r4, #0
	bl FlagGet
	cmp r0, #1
	beq _0203DD34
	mov r0, #1
	b _0203DD36
_0203DD34:
	mov r0, #0
_0203DD36:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
	thumb_func_end BgEventIsUncollectedHiddenItem

	thumb_func_start BgEventDirectionIsCompatibleWithPlayerFacing
BgEventDirectionIsCompatibleWithPlayerFacing: ; 0x0203DD3C
	push {r4, lr}
	add r4, r1, #0
	ldrh r1, [r4, #0x10]
	cmp r1, #4
	bne _0203DD4A
	mov r0, #1
	pop {r4, pc}
_0203DD4A:
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #3
	bhi _0203DDA0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203DD60: ; jump table
	.short _0203DD68 - _0203DD60 - 2 ; case 0
	.short _0203DD76 - _0203DD60 - 2 ; case 1
	.short _0203DD84 - _0203DD60 - 2 ; case 2
	.short _0203DD92 - _0203DD60 - 2 ; case 3
_0203DD68:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _0203DD72
	cmp r0, #6
	bne _0203DDA0
_0203DD72:
	mov r0, #1
	pop {r4, pc}
_0203DD76:
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	beq _0203DD80
	cmp r0, #6
	bne _0203DDA0
_0203DD80:
	mov r0, #1
	pop {r4, pc}
_0203DD84:
	ldrh r0, [r4, #0x10]
	cmp r0, #2
	beq _0203DD8E
	cmp r0, #5
	bne _0203DDA0
_0203DD8E:
	mov r0, #1
	pop {r4, pc}
_0203DD92:
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	beq _0203DD9C
	cmp r0, #5
	bne _0203DDA0
_0203DD9C:
	mov r0, #1
	pop {r4, pc}
_0203DDA0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end BgEventDirectionIsCompatibleWithPlayerFacing

	thumb_func_start sub_0203DDA4
sub_0203DDA4: ; 0x0203DDA4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r6, r1, #0
	add r4, r2, #0
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #0
	beq _0203DDBE
	add sp, #8
	ldr r0, _0203DE00 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_0203DDBE:
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl _GetCoordsOfFacingTile
	mov r0, #0
	cmp r4, #0
	ble _0203DDF8
	ldr r2, [sp, #4]
	ldr r3, [sp]
	add r1, r6, #0
_0203DDD4:
	ldr r5, [r1, #4]
	cmp r2, r5
	bne _0203DDF0
	ldr r5, [r1, #8]
	cmp r3, r5
	bne _0203DDF0
	ldrh r5, [r1, #2]
	cmp r5, #1
	bne _0203DDF0
	mov r1, #0x14
	mul r1, r0
	add sp, #8
	ldrh r0, [r6, r1]
	pop {r4, r5, r6, pc}
_0203DDF0:
	add r0, r0, #1
	add r1, #0x14
	cmp r0, r4
	blt _0203DDD4
_0203DDF8:
	ldr r0, _0203DE00 ; =0x0000FFFF
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0203DE00: .word 0x0000FFFF
	thumb_func_end sub_0203DDA4

	thumb_func_start sub_0203DE04
sub_0203DE04: ; 0x0203DE04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [r0, #0x40]
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl GetPlayerYCoord
	add r4, r0, #0
	ldr r0, [sp, #8]
	mov r7, #0
	cmp r0, #0
	ble _0203DE68
	ldr r5, [sp, #4]
_0203DE2A:
	ldrh r1, [r5, #2]
	cmp r6, r1
	blt _0203DE5E
	ldrh r0, [r5, #6]
	add r0, r1, r0
	cmp r6, r0
	bge _0203DE5E
	ldrh r1, [r5, #4]
	cmp r4, r1
	blt _0203DE5E
	ldrh r0, [r5, #8]
	add r0, r1, r0
	cmp r4, r0
	bge _0203DE5E
	ldrh r1, [r5, #0xe]
	ldr r0, [sp]
	bl VarGet
	ldrh r1, [r5, #0xc]
	cmp r1, r0
	bne _0203DE5E
	ldr r0, [sp, #4]
	lsl r1, r7, #4
	add sp, #0xc
	ldrh r0, [r0, r1]
	pop {r4, r5, r6, r7, pc}
_0203DE5E:
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r5, #0x10
	cmp r7, r0
	blt _0203DE2A
_0203DE68:
	ldr r0, _0203DE70 ; =0x0000FFFF
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0203DE70: .word 0x0000FFFF
	thumb_func_end sub_0203DE04
