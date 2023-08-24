#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "unk_0205CB48.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0205CB48
sub_0205CB48: ; 0x0205CB48
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0
	add r4, r2, #0
	mvn r1, r1
	add r5, r0, #0
	add r6, r3, #0
	cmp r4, r1
	bne _0205CB66
	add r2, sp, #8
	ldrh r2, [r2, #0x10]
	add r1, r6, #0
	bl sub_0205DDD4
	add r4, r0, #0
_0205CB66:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205CBEC
	cmp r0, #0
	beq _0205CBE2
	add r3, sp, #8
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205CC4C
	add r0, r5, #0
	bl Field_PlayerAvatar_ApplyTransitionFlags
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205D004
	cmp r0, #1
	bne _0205CB9A
	add r0, r5, #0
	bl ov01_021F2F24
	pop {r3, r4, r5, r6, r7, pc}
_0205CB9A:
	add r0, r5, #0
	bl PlayerAvatar_GetState
	cmp r0, #0
	bne _0205CBC4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205D40C
	cmp r0, #0
	beq _0205CBB8
	add r0, r5, #0
	bl ov01_021F2F24
	b _0205CBC4
_0205CBB8:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0205CBC4
	add r0, r5, #0
	bl ov01_021F2EDC
_0205CBC4:
	add r0, sp, #8
	ldrh r0, [r0, #0x10]
	add r1, r7, #0
	add r2, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r3, r6, #0
	bl sub_0205D340
	add r0, r5, #0
	bl sub_0205CC74
	add r0, r5, #0
	bl sub_0205CC94
_0205CBE2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205CB48

	thumb_func_start sub_0205CBE4
sub_0205CBE4: ; 0x0205CBE4
	ldr r3, _0205CBE8 ; =sub_0205CBEC
	bx r3
	.balign 4, 0
_0205CBE8: .word sub_0205CBEC
	thumb_func_end sub_0205CBE4

	thumb_func_start sub_0205CBEC
sub_0205CBEC: ; 0x0205CBEC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205CC04
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205CC04:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0205CC10
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205CC10:
	add r0, r6, #0
	bl MapObject_GetMovementCommand
	bl sub_0205DE64
	cmp r0, #1
	bne _0205CC46
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl sub_0205DA34
	cmp r0, #0
	bne _0205CC30
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205CC30:
	cmp r0, #0x20
	bne _0205CC42
	add r0, r5, #0
	bl PlayerAvatar_GetState
	cmp r0, #2
	bne _0205CC42
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205CC42:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205CC46:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205CBEC

	thumb_func_start sub_0205CC4C
sub_0205CC4C: ; 0x0205CC4C
	push {r4, r5, r6, lr}
	add r6, r3, #0
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205DD9C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205DDB8
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C778
	add r0, r5, #0
	bl sub_0205CAF4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205CC4C

	thumb_func_start sub_0205CC74
sub_0205CC74: ; 0x0205CC74
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205CB00
	cmp r0, #1
	bne _0205CC92
	add r0, r4, #0
	bl sub_0205C6CC
	cmp r0, #1
	bne _0205CC92
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CA4C
_0205CC92:
	pop {r4, pc}
	thumb_func_end sub_0205CC74

	thumb_func_start sub_0205CC94
sub_0205CC94: ; 0x0205CC94
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205C6CC
	cmp r0, #1
	bne _0205CD5E
	add r0, r6, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r4, #0
	bl MapObject_GetMovementCommand
	bl sub_02062390
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0205CCC8
	add r7, r5, #0
	b _0205CCD2
_0205CCC8:
	add r0, r4, #0
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_0205CCD2:
	add r0, r5, #0
	bl sub_0205B984
	cmp r0, #1
	bne _0205CCE4
	mov r0, #SEQ_SE_DP_FOOT3_0>>6
	lsl r0, r0, #6
	bl PlaySE
_0205CCE4:
	add r0, r5, #0
	bl sub_0205B7A4
	cmp r0, #1
	bne _0205CCF4
	ldr r0, _0205CD60 ; =SEQ_SE_DP_FOOT3_1
	bl PlaySE
_0205CCF4:
	add r0, r5, #0
	bl sub_0205B798
	add r0, r5, #0
	bl sub_0205B8AC
	cmp r0, #1
	bne _0205CD0A
	ldr r0, _0205CD64 ; =SEQ_SE_DP_MARSH_WALK
	bl PlaySE
_0205CD0A:
	add r0, r4, #0
	bl MapObject_GetMovementCommand
	str r0, [sp]
	add r0, r6, #0
	bl PlayerAvatar_GetState
	ldr r0, [sp]
	bl sub_0205DE64
	cmp r0, #0
	bne _0205CD56
	add r0, r5, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _0205CD36
	add r0, r7, #0
	bl sub_0205B6F4
	cmp r0, #1
	bne _0205CD3C
_0205CD36:
	ldr r0, _0205CD68 ; =SEQ_SE_DP_KUSA
	bl PlaySE
_0205CD3C:
	add r0, r5, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	beq _0205CD50
	add r0, r7, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	bne _0205CD56
_0205CD50:
	ldr r0, _0205CD6C ; =SEQ_SE_GS_KUSA2
	bl PlaySE
_0205CD56:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205CD70
_0205CD5E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205CD60: .word SEQ_SE_DP_FOOT3_1
_0205CD64: .word SEQ_SE_DP_MARSH_WALK
_0205CD68: .word SEQ_SE_DP_KUSA
_0205CD6C: .word SEQ_SE_GS_KUSA2
	thumb_func_end sub_0205CC94

	thumb_func_start sub_0205CD70
sub_0205CD70: ; 0x0205CD70
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl MapObject_GetMovementCommand
	bl sub_02062390
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r6, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r7, #0
	bl sub_0205B6F4
	cmp r0, #0
	bne _0205CE58
	add r0, r7, #0
	bl sub_0205B984
	cmp r0, #1
	beq _0205CE58
	add r0, r7, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _0205CE58
	add r0, r7, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #0
	bne _0205CE58
	mov r1, #0
	ldr r0, [sp]
	mvn r1, r1
	cmp r0, r1
	beq _0205CDD2
	ldr r1, [sp]
	add r0, r6, #0
	bl sub_02060FE0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0205CDD2:
	ldr r0, _0205CE5C ; =_020FCB98
	lsl r1, r4, #2
	ldrh r1, [r0, r1]
	ldr r0, _0205CE60 ; =SEQ_SE_GS_EDAPAKI
	cmp r1, r0
	bne _0205CDE6
	add r0, r5, #0
	bl sub_0205C7B4
	b _0205CDFE
_0205CDE6:
	add r0, r5, #0
	bl sub_0205C6D4
	cmp r0, #0
	bne _0205CDF8
	add r0, r5, #0
	bl sub_0205C7B4
	b _0205CDFE
_0205CDF8:
	add r0, r5, #0
	bl sub_0205C7A8
_0205CDFE:
	add r0, r5, #0
	bl sub_0205C7A4
	cmp r0, #0
	bne _0205CE58
	add r0, r5, #0
	bl PlayerAvatar_GetState
	cmp r0, #1
	beq _0205CE58
	cmp r0, #2
	beq _0205CE58
	cmp r4, #0x10
	bhs _0205CE52
	cmp r4, #0
	bne _0205CE2A
	add r0, r5, #0
	bl sub_0205DE98
	cmp r0, #1
	bne _0205CE2A
	mov r4, #1
_0205CE2A:
	ldr r0, _0205CE64 ; =_020FCB98 + 2
	lsl r1, r4, #2
	ldrh r0, [r0, r1]
	cmp r0, #1
	bne _0205CE40
	ldr r0, _0205CE5C ; =_020FCB98
	ldrh r4, [r0, r1]
	add r0, r4, #0
	bl sub_02006088
	b _0205CE4A
_0205CE40:
	ldr r0, _0205CE5C ; =_020FCB98
	ldrh r4, [r0, r1]
	add r0, r4, #0
	bl PlaySE
_0205CE4A:
	add r0, r4, #0
	bl sub_02005BA8
	pop {r3, r4, r5, r6, r7, pc}
_0205CE52:
	blo _0205CE58
	bl GF_AssertFail
_0205CE58:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0205CE5C: .word _020FCB98
_0205CE60: .word SEQ_SE_GS_EDAPAKI
_0205CE64: .word _020FCB98 + 2
	thumb_func_end sub_0205CD70

	thumb_func_start sub_0205CE68
sub_0205CE68: ; 0x0205CE68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205C6CC
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205C6D4
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0205D01C
	cmp r0, #0
	beq _0205CEA6
	cmp r0, #2
	beq _0205CEA6
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEA6:
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	bne _0205CEF2
	cmp r6, #0
	beq _0205CF40
	cmp r6, #1
	beq _0205CEBE
	cmp r6, #2
	beq _0205CEE8
	pop {r3, r4, r5, r6, r7, pc}
_0205CEBE:
	add r0, r7, #0
	bl MapObject_GetMovementCommand
	bl sub_0205DE64
	cmp r0, #1
	beq _0205CF40
	cmp r4, #0
	beq _0205CED4
	cmp r4, #3
	bne _0205CEDE
_0205CED4:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEDE:
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEE8:
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CEF2:
	add r0, r7, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _0205CF40
	cmp r6, #0
	beq _0205CF40
	cmp r6, #1
	beq _0205CF0A
	cmp r6, #2
	beq _0205CF26
	pop {r3, r4, r5, r6, r7, pc}
_0205CF0A:
	cmp r4, #0
	beq _0205CF40
	cmp r4, #3
	bne _0205CF1C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CF1C:
	add r0, r5, #0
	mov r1, #3
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CF26:
	cmp r4, #0
	beq _0205CF40
	cmp r4, #3
	bne _0205CF38
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6D0
	pop {r3, r4, r5, r6, r7, pc}
_0205CF38:
	add r0, r5, #0
	mov r1, #3
	bl sub_0205C6D0
_0205CF40:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205CE68

	thumb_func_start sub_0205CF44
sub_0205CF44: ; 0x0205CF44
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r4, #0
	mov r1, #0
	bl sub_0205C6D0
	add r0, r4, #0
	bl sub_0205C74C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205CF44

	thumb_func_start sub_0205CF60
sub_0205CF60: ; 0x0205CF60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205C6CC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205C6D4
	cmp r4, #0
	bne _0205CF78
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CF78:
	cmp r4, #2
	bne _0205CF80
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CF80:
	cmp r4, #1
	bne _0205CFB6
	cmp r0, #0
	beq _0205CF8C
	cmp r0, #3
	bne _0205CF90
_0205CF8C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CF90:
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205CFA4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CFA4:
	add r0, r4, #0
	bl MapObject_GetMovementCommand
	bl sub_0205DE64
	cmp r0, #1
	bne _0205CFB6
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205CFB6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205CF60

	thumb_func_start sub_0205CFBC
sub_0205CFBC: ; 0x0205CFBC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r4, #0
	mov r1, #0
	bl sub_0205C6D0
	add r0, r4, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	add r1, r5, #0
	bl MapObject_SetFacingDirection
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_02060F78
	add r0, r4, #0
	bl MapObject_ClearHeldMovement
	add r0, r5, #0
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r4, #0
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205CFBC

	thumb_func_start sub_0205D004
sub_0205D004: ; 0x0205D004
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205D01C
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0205D07C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D004

	thumb_func_start sub_0205D01C
sub_0205D01C: ; 0x0205D01C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	bl PlayerAvatar_GetMapObject
	bl sub_0205F504
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0205E078
	cmp r0, #1
	bne _0205D040
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0205D040:
	add r0, r5, #0
	bl sub_0205CA64
	cmp r0, #1
	bne _0205D04E
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205D04E:
	lsl r0, r7, #0x18
	ldr r5, _0205D074 ; =_020FCB88
	lsr r6, r0, #0x18
_0205D054:
	ldr r1, [r5]
	add r0, r6, #0
	blx r1
	cmp r0, #1
	bne _0205D066
	ldr r0, _0205D078 ; =_020FCB88 + 4
	lsl r1, r4, #3
	ldr r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0205D066:
	add r5, #8
	ldr r0, [r5]
	add r4, r4, #1
	cmp r0, #0
	bne _0205D054
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205D074: .word _020FCB88
_0205D078: .word _020FCB88 + 4
	thumb_func_end sub_0205D01C

	thumb_func_start sub_0205D07C
sub_0205D07C: ; 0x0205D07C
	push {r3, lr}
	add r3, r1, #0
	add r1, r2, #0
	ldr r2, _0205D098 ; =_020FCB7C
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #1
	bne _0205D092
	mov r0, #1
	pop {r3, pc}
_0205D092:
	mov r0, #0
	pop {r3, pc}
	nop
_0205D098: .word _020FCB7C
	thumb_func_end sub_0205D07C

	thumb_func_start sub_0205D09C
sub_0205D09C: ; 0x0205D09C
	push {r3, lr}
	bl sub_0205D1FC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205D09C

	thumb_func_start sub_0205D0A8
sub_0205D0A8: ; 0x0205D0A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_GetNextFacing
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D240
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205DA34
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA20
	cmp r7, #0
	beq _0205D10A
	add r0, r4, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA4C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r4, #0
	bl sub_0206D494
	cmp r0, #0
	bne _0205D106
	add r0, r5, #0
	bl sub_0205D1FC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205D106:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205D10A:
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0205D2A0
	cmp r0, #0
	bne _0205D170
	add r0, r5, #0
	bl sub_0205D1FC
	add r0, r6, #0
	bl sub_020611F4
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205DA34
	cmp r0, #0
	beq _0205D136
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205D136:
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl MapObject_SetFlagsBits
	add r0, r6, #0
	mov r1, #8
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA4C
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA20
	mov r1, #0
	mvn r1, r1
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0205C778
	b _0205D182
_0205D170:
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl MapObject_SetFlagsBits
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D2D0
_0205D182:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D0A8

	thumb_func_start sub_0205D190
sub_0205D190: ; 0x0205D190
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0205DA34
	cmp r0, #0
	bne _0205D1CE
	mov r0, #1
	mov r1, #0x14
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	add r0, r5, #0
	mov r1, #3
	bl sub_0205C748
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205D1CE:
	mov r0, #1
	add r1, r0, #0
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	bl sub_0205C74C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	add r0, r5, #0
	mov r1, #0
	bl sub_0205CA78
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D190

	thumb_func_start sub_0205D1FC
sub_0205D1FC: ; 0x0205D1FC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205CA38
	cmp r0, #1
	bne _0205D23E
	add r0, r4, #0
	bl PlayerAvatar_GetMapObject
	mov r1, #6
	lsl r1, r1, #6
	bl MapObject_ClearFlagsBits
	add r0, r4, #0
	bl sub_0205CB2C
	cmp r0, #0
	bne _0205D226
	add r0, r4, #0
	bl sub_0205C74C
_0205D226:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CA20
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CB14
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CAD0
_0205D23E:
	pop {r4, pc}
	thumb_func_end sub_0205D1FC

	thumb_func_start sub_0205D240
sub_0205D240: ; 0x0205D240
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_GetFieldSysPtr
	add r6, r0, #0
	add r0, r4, #0
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	add r4, sp, #0xc
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r1, r2, #0
	mov r2, #1
	str r0, [r3]
	add r0, r5, #0
	lsl r2, r2, #0xe
	bl sub_02061190
	add r0, r6, #0
	add r1, sp, #0
	bl sub_0206121C
	cmp r0, #0
	beq _0205D288
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bne _0205D28E
_0205D288:
	add sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205D28E:
	cmp r0, r1
	ble _0205D298
	add sp, #0x18
	mov r0, #2
	pop {r4, r5, r6, pc}
_0205D298:
	mov r0, #1
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205D240

	thumb_func_start sub_0205D2A0
sub_0205D2A0: ; 0x0205D2A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C744
	add r1, r0, #0
	cmp r4, #1
	bne _0205D2B8
	sub r1, r1, #1
	bpl _0205D2C4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205D2B8:
	cmp r4, #2
	bne _0205D2C4
	add r1, r1, #1
	cmp r1, #3
	ble _0205D2C4
	mov r1, #3
_0205D2C4:
	add r0, r5, #0
	bl sub_0205C748
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D2A0

	thumb_func_start sub_0205D2D0
sub_0205D2D0: ; 0x0205D2D0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	add r0, r6, #0
	mov r5, #0x10
	bl sub_0205C744
	cmp r0, #1
	beq _0205D2F2
	cmp r0, #2
	beq _0205D2F6
	cmp r0, #3
	beq _0205D2FA
	b _0205D2FC
_0205D2F2:
	mov r5, #0x50
	b _0205D2FC
_0205D2F6:
	mov r5, #0x14
	b _0205D2FC
_0205D2FA:
	mov r5, #0x14
_0205D2FC:
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0206234C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0205DA1C
	add r0, r4, #0
	bl MapObject_GetFieldSysPtr
	add r5, r0, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _0205D33C
	add r0, r4, #0
	bl MapObject_GetPrevX
	add r6, r0, #0
	add r0, r4, #0
	bl MapObject_GetPrevY
	add r5, #0xe4
	add r2, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r3, r5, #0
	bl ov01_02205990
_0205D33C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D2D0

	thumb_func_start sub_0205D340
sub_0205D340: ; 0x0205D340
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp, #8]
	add r4, r3, #0
	bl PlayerAvatar_GetState
	add r5, r0, #0
	add r0, r6, #0
	bl PlayerAvatar_GetMapObject
	add r1, r0, #0
	cmp r5, #3
	bhi _0205D39E
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205D36A: ; jump table
	.short _0205D372 - _0205D36A - 2 ; case 0
	.short _0205D388 - _0205D36A - 2 ; case 1
	.short _0205D372 - _0205D36A - 2 ; case 2
	.short _0205D372 - _0205D36A - 2 ; case 3
_0205D372:
	str r4, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	ldr r3, [sp, #8]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_0205D3A8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0205D388:
	str r4, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	ldr r3, [sp, #8]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_0205D640
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0205D39E:
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D340

	thumb_func_start sub_0205D3A8
sub_0205D3A8: ; 0x0205D3A8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r3, #0
	add r4, r1, #0
	add r1, r6, #0
	add r5, r0, #0
	bl sub_0205D40C
	cmp r0, #0
	beq _0205D3C8
	cmp r0, #1
	beq _0205D3DE
	cmp r0, #2
	beq _0205D3F4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0205D3C8:
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	add r2, r6, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	bl sub_0205D494
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0205D3DE:
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	add r2, r6, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	bl sub_0205D4B4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0205D3F4:
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	add r2, r6, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	add r0, r5, #0
	bl sub_0205D610
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205D3A8

	thumb_func_start sub_0205D40C
sub_0205D40C: ; 0x0205D40C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205D450
	add r4, r0, #0
	bl sub_0205D428
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205C6C8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D40C

	thumb_func_start sub_0205D428
sub_0205D428: ; 0x0205D428
	push {r3, lr}
	cmp r0, #0
	beq _0205D438
	cmp r0, #1
	beq _0205D43C
	cmp r0, #2
	beq _0205D440
	b _0205D444
_0205D438:
	mov r0, #0
	pop {r3, pc}
_0205D43C:
	mov r0, #1
	pop {r3, pc}
_0205D440:
	mov r0, #2
	pop {r3, pc}
_0205D444:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205D428

	thumb_func_start sub_0205D44C
sub_0205D44C: ; 0x0205D44C
	add r0, r2, #0
	bx lr
	thumb_func_end sub_0205D44C

	thumb_func_start sub_0205D450
sub_0205D450: ; 0x0205D450
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	cmp r4, r1
	bne _0205D468
	mov r1, #0
	bl sub_0205C6C8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205D468:
	bl PlayerAvatar_GetFacingDirection
	cmp r0, r4
	beq _0205D486
	add r0, r5, #0
	bl sub_0205C6CC
	cmp r0, #1
	beq _0205D486
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6C8
	mov r0, #2
	pop {r3, r4, r5, pc}
_0205D486:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D450

	thumb_func_start sub_0205D494
sub_0205D494: ; 0x0205D494
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	mov r1, #0
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D494

	thumb_func_start sub_0205D4B4
sub_0205D4B4: ; 0x0205D4B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r3, #0
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl sub_0205DA34
	add r4, r0, #0
	add r0, r6, #0
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _0205D588
	mov r0, #4
	tst r0, r4
	beq _0205D4DE
	mov r0, #0x38
	str r0, [sp]
	b _0205D5CE
_0205D4DE:
	cmp r4, #0
	beq _0205D544
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D536
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	mov r1, #7
	str r0, [sp, #8]
	bl FieldSystem_IsSaveGymmickTypeEqualTo
	cmp r0, #0
	beq _0205D52E
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r7, #0
	bl GetDeltaXByFacingDirection
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl GetDeltaYByFacingDirection
	ldr r1, [sp, #0xc]
	add r2, r0, #0
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #8]
	add r1, r4, r1
	add r2, r3, r2
	bl ov04_022566EC
	b _0205D536
_0205D52E:
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D536:
	add r0, r5, #0
	add r1, r7, #0
	bl MapObject_SetNextFacing
	mov r0, #1
	str r0, [sp, #4]
	b _0205D5CE
_0205D544:
	add r0, r6, #0
	mov r4, #0xc
	bl PlayerAvatar_GetPlayerSaveData
	bl PlayerSaveData_CheckRunningShoes
	cmp r0, #1
	bne _0205D564
	add r1, sp, #0x18
	ldrh r1, [r1, #0x10]
	add r0, r6, #0
	bl sub_0205DE88
	cmp r0, #1
	bne _0205D564
	mov r4, #0x58
_0205D564:
	add r0, r5, #0
	bl sub_0205F504
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl sub_0205D44C
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205E048
	add r0, r6, #0
	bl sub_0205CAE8
	b _0205D5CE
_0205D588:
	cmp r4, #0
	beq _0205D590
	cmp r4, #0x20
	bne _0205D5B4
_0205D590:
	add r0, r5, #0
	bl sub_0205F504
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0x10
	bl sub_0205D44C
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205E048
	add r0, r6, #0
	bl sub_0205CAE8
	b _0205D5CE
_0205D5B4:
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D5C6
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D5C6:
	add r0, r5, #0
	add r1, r7, #0
	bl MapObject_SetNextFacing
_0205D5CE:
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_0206234C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl sub_0205DA1C
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0205D60C
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevX
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevY
	add r4, #0xe4
	add r2, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r3, r4, #0
	bl ov01_02205990
_0205D60C:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0205D4B4

	thumb_func_start sub_0205D610
sub_0205D610: ; 0x0205D610
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #0x28
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r4, #0
	add r1, r6, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_0205C7B4
	add r0, r5, #0
	bl sub_0205C7A8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205D610

	thumb_func_start sub_0205D640
sub_0205D640: ; 0x0205D640
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, sp, #8
	ldrh r5, [r4, #0x10]
	str r5, [sp]
	ldrh r4, [r4, #0x14]
	str r4, [sp, #4]
	bl sub_0205D6E8
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D640

	thumb_func_start sub_0205D658
sub_0205D658: ; 0x0205D658
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r4, #0x4c
	bl sub_0205C744
	cmp r0, #1
	beq _0205D670
	cmp r0, #2
	beq _0205D674
	cmp r0, #3
	beq _0205D678
	b _0205D67A
_0205D670:
	mov r4, #0x10
	b _0205D67A
_0205D674:
	mov r4, #0x50
	b _0205D67A
_0205D678:
	mov r4, #0x14
_0205D67A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206234C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205D658

	thumb_func_start sub_0205D684
sub_0205D684: ; 0x0205D684
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #1
	mov r2, #3
	bl sub_0205C758
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205CA90
	cmp r0, #0
	bne _0205D6A8
	cmp r4, #2
	blt _0205D6A8
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA78
_0205D6A8:
	cmp r4, #3
	bne _0205D6B0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0205D6B0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205D684

	thumb_func_start sub_0205D6B4
sub_0205D6B4: ; 0x0205D6B4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #1
	bl sub_0205C744
	sub r4, r0, #1
	bpl _0205D6C6
	mov r4, #0
	add r6, r4, #0
_0205D6C6:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C748
	add r0, r5, #0
	bl sub_0205CA90
	cmp r0, #1
	bne _0205D6E4
	cmp r4, #0
	bne _0205D6E4
	add r0, r5, #0
	mov r1, #0
	bl sub_0205CA78
_0205D6E4:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205D6B4

	thumb_func_start sub_0205D6E8
sub_0205D6E8: ; 0x0205D6E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r1, r3, #0
	add r6, r0, #0
	str r3, [sp, #4]
	ldr r5, [sp, #0x20]
	ldr r4, [sp, #0x24]
	bl sub_0205D75C
	cmp r0, #3
	bhi _0205D758
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205D70C: ; jump table
	.short _0205D714 - _0205D70C - 2 ; case 0
	.short _0205D726 - _0205D70C - 2 ; case 1
	.short _0205D738 - _0205D70C - 2 ; case 2
	.short _0205D74A - _0205D70C - 2 ; case 3
_0205D714:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D818
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205D726:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D83C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205D738:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D948
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205D74A:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl sub_0205D978
_0205D758:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205D6E8

	thumb_func_start sub_0205D75C
sub_0205D75C: ; 0x0205D75C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205D7AC
	add r4, r0, #0
	bl sub_0205D778
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205C6C8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205D75C

	thumb_func_start sub_0205D778
sub_0205D778: ; 0x0205D778
	push {r3, lr}
	cmp r0, #3
	bhi _0205D7A2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205D78A: ; jump table
	.short _0205D792 - _0205D78A - 2 ; case 0
	.short _0205D796 - _0205D78A - 2 ; case 1
	.short _0205D79A - _0205D78A - 2 ; case 2
	.short _0205D79E - _0205D78A - 2 ; case 3
_0205D792:
	mov r0, #0
	pop {r3, pc}
_0205D796:
	mov r0, #1
	pop {r3, pc}
_0205D79A:
	mov r0, #2
	pop {r3, pc}
_0205D79E:
	mov r0, #1
	pop {r3, pc}
_0205D7A2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205D778

	thumb_func_start sub_0205D7AC
sub_0205D7AC: ; 0x0205D7AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C744
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0205D7DC
	cmp r6, #2
	bge _0205D7D0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C6C8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205D7D0:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #3
	pop {r4, r5, r6, pc}
_0205D7DC:
	add r0, r5, #0
	bl PlayerAvatar_GetFacingDirection
	cmp r0, r4
	beq _0205D80C
	add r0, r5, #0
	bl sub_0205C6CC
	cmp r0, #1
	beq _0205D80C
	cmp r6, #2
	bge _0205D800
	add r0, r5, #0
	mov r1, #2
	bl sub_0205C6C8
	mov r0, #2
	pop {r4, r5, r6, pc}
_0205D800:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #3
	pop {r4, r5, r6, pc}
_0205D80C:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205C6C8
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205D7AC

	thumb_func_start sub_0205D818
sub_0205D818: ; 0x0205D818
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	mov r1, #0
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r5, #0
	bl sub_0205C74C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205D818

	thumb_func_start sub_0205D83C
sub_0205D83C: ; 0x0205D83C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	bl sub_0205DA34
	add r4, r0, #0
	mov r0, #4
	tst r0, r4
	beq _0205D86E
	add r0, r6, #0
	mov r1, #0x38
	bl sub_0206234C
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205D684
	add r0, r5, #0
	bl sub_0205E048
	add r0, r5, #0
	bl sub_0205CAE8
	b _0205D93A
_0205D86E:
	mov r0, #0x10
	tst r0, r4
	beq _0205D8C0
	add r0, r5, #0
	bl sub_0205C744
	cmp r0, #3
	blt _0205D898
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D658
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205CAE8
	add r0, r5, #0
	mov r1, #1
	bl sub_0205CA20
	b _0205D93A
_0205D898:
	add r0, r6, #0
	mov r1, #0x1c
	bl sub_0206234C
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D8B0
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D8B0:
	add r0, r7, #0
	add r1, r6, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_0205C74C
	b _0205D93A
_0205D8C0:
	mov r0, #0x40
	tst r0, r4
	beq _0205D8F2
	add r0, r7, #0
	bl MapObject_GetNextFacing
	add r4, r0, #0
	mov r1, #0
	bl sub_0206234C
	str r0, [sp]
	add r0, r7, #0
	add r1, r4, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_0205C74C
	mov r1, #0
	mvn r1, r1
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0205C778
	b _0205D93A
_0205D8F2:
	cmp r4, #0
	beq _0205D91E
	add r0, r6, #0
	mov r1, #0x1c
	bl sub_0206234C
	str r0, [sp]
	mov r0, #8
	tst r0, r4
	bne _0205D90E
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
_0205D90E:
	add r0, r7, #0
	add r1, r6, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_0205C74C
	b _0205D93A
_0205D91E:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D658
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205D684
	add r0, r5, #0
	bl sub_0205E048
	add r0, r5, #0
	bl sub_0205CAE8
_0205D93A:
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205DA1C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D83C

	thumb_func_start sub_0205D948
sub_0205D948: ; 0x0205D948
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205C74C
	add r0, r6, #0
	mov r1, #0x28
	bl sub_0206234C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205DA1C
	add r0, r4, #0
	add r1, r6, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_0205C74C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205D948

	thumb_func_start sub_0205D978
sub_0205D978: ; 0x0205D978
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	bl sub_0205D6B4
	str r0, [sp]
	add r0, r5, #0
	bl PlayerAvatar_GetNextFacing
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0205DA34
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
	bl sub_0205C74C
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
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_0205C74C
	b _0205D9FE
_0205D9F4:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205D658
	str r0, [sp, #4]
_0205D9FE:
	ldr r0, [sp]
	cmp r0, #0
	bne _0205DA0C
	add r0, r5, #0
	mov r1, #0
	bl sub_0205CA78
_0205DA0C:
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205DA1C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205D978

	thumb_func_start sub_0205DA1C
sub_0205DA1C: ; 0x0205DA1C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r1, r4, #0
	bl sub_0205C79C
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetHeldMovement
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205DA1C

	thumb_func_start sub_0205DA34
sub_0205DA34: ; 0x0205DA34
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
	thumb_func_end sub_0205DA34

	thumb_func_start sub_0205DAA8
sub_0205DAA8: ; 0x0205DAA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r2, [sp, #4]
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl GetDeltaXByFacingDirection
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl GetDeltaYByFacingDirection
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #0x1c
	bl MapObject_GetPositionVec
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
	bl MapObject_GetFieldSysPtr
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
	bl MapObject_GetFieldSysPtr
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r5, r0, #0
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r5, r2
	bl GetMetatileBehaviorAt
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
	bl sub_0205B7B0
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBCC:
	bl sub_0205B7BC
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBD8:
	bl sub_0205B7C8
	cmp r0, #1
	bne _0205DBF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DBE4:
	bl sub_0205B7D4
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
	bl MapObject_GetFieldSysPtr
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp]
	ldr r2, [sp]
	add r0, r7, #0
	add r1, r6, #0
	bl GetMetatileBehaviorAt
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
	bl sub_0205B730
	cmp r0, #1
	bne _0205DC4A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC4A:
	add r0, r5, #0
	bl sub_0205B73C
	cmp r0, #1
	bne _0205DC58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC58:
	add r0, r5, #0
	bl sub_0205B724
	cmp r0, #1
	bne _0205DC66
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DC66:
	add r0, r5, #0
	bl sub_0205B718
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
	bl GetMetatileBehaviorAt
	bl sub_0205B70C
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
	bl MapObject_GetFieldSysPtr
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp, #4]
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r3, r0, #0
	ldr r2, [sp, #4]
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r2, r3
	bl GetMetatileBehaviorAt
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
	bl MapObject_GetFieldSysPtr
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp, #4]
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r3, r0, #0
	ldr r2, [sp, #4]
	ldr r0, [sp]
	add r1, r6, r7
	add r2, r2, r3
	bl GetMetatileBehaviorAt
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
	bl sub_0205B6F4
	cmp r0, #0
	beq _0205DD7E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205DD7E:
	add r0, r4, #0
	bl sub_0205B8AC
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
	ldr r3, _0205DD98 ; =sub_0205DDD4
	bx r3
	.balign 4, 0
_0205DD98: .word sub_0205DDD4
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

	thumb_func_start sub_0205DDD4
sub_0205DDD4: ; 0x0205DDD4
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
	bl PlayerAvatar_GetNextFacing
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205C76C
	str r0, [sp]
	add r0, r6, #0
	bl sub_0205C774
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
	thumb_func_end sub_0205DDD4

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

	thumb_func_start sub_0205DE88
sub_0205DE88: ; 0x0205DE88
	mov r0, #2
	tst r0, r1
	beq _0205DE92
	mov r0, #1
	bx lr
_0205DE92:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205DE88

	thumb_func_start sub_0205DE98
sub_0205DE98: ; 0x0205DE98
	push {r3, lr}
	bl sub_0205C7A0
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
	bl sub_0205D450
	bl sub_0205D428
	add r4, r0, #0
	b _0205DF08
_0205DEF2:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205D7AC
	bl sub_0205D778
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
	bl sub_0205DDD4
	str r0, [sp]
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0205DEC0
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205C6C8
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
	bl sub_0205DE88
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
	bl sub_0205DA1C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205DFD4

	thumb_func_start sub_0205DFEC
sub_0205DFEC: ; 0x0205DFEC
	push {r4, lr}
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	add r1, r4, #0
	bl sub_02060FA8
	pop {r4, pc}
	thumb_func_end sub_0205DFEC

	thumb_func_start sub_0205DFFC
sub_0205DFFC: ; 0x0205DFFC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r6, r2, #0
	add r7, r3, #0
	bl GetPlayerXCoord
	add r4, r0, #0
	add r0, r5, #0
	bl GetDeltaXByFacingDirection
	add r0, r4, r0
	str r0, [r6]
	ldr r0, [sp]
	bl GetPlayerYCoord
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

	thumb_func_start sub_0205E048
sub_0205E048: ; 0x0205E048
	push {r3, r4, r5, lr}
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetFieldSysPtr
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_GameStats_Get
	mov r1, #0
	add r4, r0, #0
	bl GameStats_Inc
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #1
	bne _0205E074
	add r0, r4, #0
	mov r1, #1
	bl GameStats_Inc
_0205E074:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E048

	thumb_func_start sub_0205E078
sub_0205E078: ; 0x0205E078
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
	bl sub_0205CABC
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
	thumb_func_end sub_0205E078

	.rodata

_020FCB7C:
	.word sub_0205D09C
	.word sub_0205D0A8
	.word sub_0205D190
_020FCB88:
	.word sub_0205B828, 1
	.word 0, 3
_020FCB98:
	.short SEQ_SE_GS_ASHIOTO_A_WALK, 0
	.short SEQ_SE_GS_ASHIOTO_A, 0
	.short SEQ_SE_GS_OCHIBA, 0
	.short SEQ_SE_GS_EDAPAKI, 0
	.short SEQ_SE_GS_KUSA2, 0
	.short SEQ_SE_GS_ASHIOTO_B, 1
	.short SEQ_SE_GS_ASHIOTO_D, 1
	.short SEQ_SE_GS_ASHIOTO_D_2, 0
	.short SEQ_SE_GS_ASHIOTO_E, 0
	.short SEQ_SE_GS_ASHIOTO_B, 1
	.short SEQ_SE_GS_ASHIOTO_F, 1
	.short SEQ_SE_GS_ASHIOTO_D, 0
	.short SEQ_SE_GS_ASHIOTO_H, 0
	.short SEQ_SE_GS_ASHIOTO_G, 0
	.short SEQ_SE_DP_BOX02, 0
	.short SEQ_SE_DP_BOX01, 0
