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
	.include "unk_0205FD20.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0205FD20
sub_0205FD20: ; 0x0205FD20
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F41C
	add r0, r4, #0
	bl sub_02063A14
	pop {r4, pc}
	thumb_func_end sub_0205FD20

	thumb_func_start sub_0205FD30
sub_0205FD30: ; 0x0205FD30
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	bl sub_0205F5E8
	cmp r0, #0
	bne _0205FD94
	add r0, r4, #0
	bl sub_0205FE0C
	add r0, r4, #0
	bl sub_0205FE24
	add r0, r4, #0
	bl sub_0205FE48
	add r0, r4, #0
	mov r1, #0x10
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FD64
	add r0, r4, #0
	bl sub_02062400
	b _0205FD88
_0205FD64:
	add r0, r4, #0
	bl sub_0205F714
	cmp r0, #0
	bne _0205FD88
	add r0, r4, #0
	bl sub_0205FD98
	cmp r0, #1
	bne _0205FD88
	add r0, r4, #0
	bl sub_02063A1C
	cmp r0, #0
	bne _0205FD88
	add r0, r4, #0
	bl sub_0205F430
_0205FD88:
	add r0, r4, #0
	bl sub_0205FE6C
	add r0, r4, #0
	bl sub_0205FEA4
_0205FD94:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205FD30

	thumb_func_start sub_0205FD98
sub_0205FD98: ; 0x0205FD98
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_IsSingleMovementActive
	cmp r0, #1
	bne _0205FDA8
	mov r0, #1
	pop {r4, pc}
_0205FDA8:
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl MapObject_GetFlagsMask
	cmp r0, #0
	bne _0205FDBA
	mov r0, #1
	pop {r4, pc}
_0205FDBA:
	add r0, r4, #0
	bl MapObject_GetMovement
	cmp r0, #0x32
	bne _0205FDC8
	mov r0, #1
	pop {r4, pc}
_0205FDC8:
	add r0, r4, #0
	bl MapObject_GetMovement
	cmp r0, #0x30
	bne _0205FDD6
	mov r0, #1
	pop {r4, pc}
_0205FDD6:
	add r0, r4, #0
	bl MapObject_GetFlagsWord
	mov r1, #1
	lsl r1, r1, #0xc
	add r2, r0, #0
	tst r2, r1
	beq _0205FDF0
	lsl r1, r1, #0xb
	tst r1, r0
	bne _0205FDF0
	mov r0, #0
	pop {r4, pc}
_0205FDF0:
	mov r1, #2
	lsl r1, r1, #0xa
	tst r0, r1
	beq _0205FE06
	add r0, r4, #0
	bl sub_0205F8D0
	cmp r0, #0
	bne _0205FE06
	mov r0, #0
	pop {r4, pc}
_0205FE06:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205FD98

	thumb_func_start sub_0205FE0C
sub_0205FE0C: ; 0x0205FE0C
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xc
	add r4, r0, #0
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FE22
	add r0, r4, #0
	bl sub_02061070
_0205FE22:
	pop {r4, pc}
	thumb_func_end sub_0205FE0C

	thumb_func_start sub_0205FE24
sub_0205FE24: ; 0x0205FE24
	push {r4, lr}
	mov r1, #2
	lsl r1, r1, #0xa
	add r4, r0, #0
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FE44
	add r0, r4, #0
	bl sub_02061108
	cmp r0, #1
	bne _0205FE44
	add r0, r4, #0
	bl MapObject_SetFlag2
_0205FE44:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205FE24

	thumb_func_start sub_0205FE48
sub_0205FE48: ; 0x0205FE48
	push {r4, lr}
	mov r1, #4
	add r4, r0, #0
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FE5C
	add r0, r4, #0
	bl sub_0205FEDC
_0205FE5C:
	ldr r1, _0205FE68 ; =0x00010004
	add r0, r4, #0
	bl MapObject_ClearFlagsBits
	pop {r4, pc}
	nop
_0205FE68: .word 0x00010004
	thumb_func_end sub_0205FE48

	thumb_func_start sub_0205FE6C
sub_0205FE6C: ; 0x0205FE6C
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0x10
	add r4, r0, #0
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FE84
	add r0, r4, #0
	bl sub_02060020
	b _0205FE96
_0205FE84:
	add r0, r4, #0
	mov r1, #4
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FE96
	add r0, r4, #0
	bl sub_0205FF6C
_0205FE96:
	ldr r1, _0205FEA0 ; =0x00010004
	add r0, r4, #0
	bl MapObject_ClearFlagsBits
	pop {r4, pc}
	.balign 4, 0
_0205FEA0: .word 0x00010004
	thumb_func_end sub_0205FE6C

	thumb_func_start sub_0205FEA4
sub_0205FEA4: ; 0x0205FEA4
	push {r4, lr}
	mov r1, #2
	lsl r1, r1, #0x10
	add r4, r0, #0
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FEBC
	add r0, r4, #0
	bl sub_02060114
	b _0205FECE
_0205FEBC:
	add r0, r4, #0
	mov r1, #8
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0205FECE
	add r0, r4, #0
	bl sub_0206008C
_0205FECE:
	ldr r1, _0205FED8 ; =0x00020008
	add r0, r4, #0
	bl MapObject_ClearFlagsBits
	pop {r4, pc}
	.balign 4, 0
_0205FED8: .word 0x00020008
	thumb_func_end sub_0205FEA4

	thumb_func_start sub_0205FEDC
sub_0205FEDC: ; 0x0205FEDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0205FF6A
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AB8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601BC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603DC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060698
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060700
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607D8
_0205FF6A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FEDC

	thumb_func_start sub_0205FF6C
sub_0205FF6C: ; 0x0205FF6C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0206001E
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AB8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060274
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060328
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603F8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020606CC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060704
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060708
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060770
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607D8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AF0
_0206001E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FF6C

	thumb_func_start sub_02060020
sub_02060020: ; 0x02060020
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0206008A
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AB8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603F8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607D8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020603D0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060AF0
_0206008A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060020

	thumb_func_start sub_0206008C
sub_0206008C: ; 0x0206008C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	add r0, r5, #0
	bl sub_0205F51C
	add r0, r5, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _02060112
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206073C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020609D4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060530
_02060112:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206008C

	thumb_func_start sub_02060114
sub_02060114: ; 0x02060114
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_02061108
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _020601A2
	add r0, r5, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl sub_0205F514
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov01_021F9318
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020601A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206073C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020607A4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206039C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_020609D4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060530
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02060274
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0206064C
_020601A2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060114

	thumb_func_start sub_020601A4
sub_020601A4: ; 0x020601A4
	push {lr}
	sub sp, #0xc
	add r1, sp, #0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	bl sub_0205F9C0
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020601A4

	thumb_func_start sub_020601BC
sub_020601BC: ; 0x020601BC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	bl MapObject_GetID
	add r4, r0, #0
	add r0, r6, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	bne _020601EE
	cmp r4, #0xfd
	bne _020601E6
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	beq _02060270
_020601E6:
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF070
_020601EE:
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	bne _02060270
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060270
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r4, #0xfe
	add r6, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02060270
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	bne _02060254
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02060254:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02060270
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF964
_02060270:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020601BC

	thumb_func_start sub_02060274
sub_02060274: ; 0x02060274
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	bl MapObject_GetID
	add r4, r0, #0
	add r0, r6, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	bne _020602A6
	cmp r4, #0xfd
	bne _0206029E
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	beq _02060324
_0206029E:
	add r0, r5, #0
	mov r1, #1
	bl ov01_021FF070
_020602A6:
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	bne _02060324
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060324
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r4, #0xfe
	add r6, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02060324
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	bne _0206030A
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0206030A:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02060324
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF964
_02060324:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02060274

	thumb_func_start sub_02060328
sub_02060328: ; 0x02060328
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	ldrh r0, [r4]
	add r6, r2, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1c
	beq _0206039A
	add r0, r6, #0
	bl sub_0205BA94
	cmp r0, #1
	bne _0206035E
	ldrh r0, [r4]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _02060354
	add r0, r5, #0
	bl ov01_021FE3E8
	b _0206035E
_02060354:
	cmp r0, #2
	bne _0206035E
	add r0, r5, #0
	bl ov01_021FE3F4
_0206035E:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02060EA4
	cmp r0, #1
	bne _02060388
	ldrh r0, [r4]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _0206037C
	add r0, r5, #0
	bl ov01_021FE3C4
	pop {r4, r5, r6, pc}
_0206037C:
	cmp r0, #2
	bne _0206039A
	add r0, r5, #0
	bl ov01_021FE3D0
	pop {r4, r5, r6, pc}
_02060388:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02060ED4
	cmp r0, #1
	bne _0206039A
	add r0, r5, #0
	bl ov01_021FE3DC
_0206039A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02060328

	thumb_func_start sub_0206039C
sub_0206039C: ; 0x0206039C
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_0205B7A4
	cmp r0, #1
	bne _020603C6
	add r0, r4, #0
	bl MapObject_CheckFlag26
	cmp r0, #0
	bne _020603CE
	add r0, r4, #0
	mov r1, #1
	bl ov01_021FF4FC
	add r0, r4, #0
	mov r1, #1
	bl MapObject_SetFlag26
	pop {r4, pc}
_020603C6:
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetFlag26
_020603CE:
	pop {r4, pc}
	thumb_func_end sub_0206039C

	thumb_func_start sub_020603D0
sub_020603D0: ; 0x020603D0
	ldr r3, _020603D8 ; =MapObject_SetFlag26
	mov r1, #0
	bx r3
	nop
_020603D8: .word MapObject_SetFlag26
	thumb_func_end sub_020603D0

	thumb_func_start sub_020603DC
sub_020603DC: ; 0x020603DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	bl sub_0205F524
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	add r0, r5, #0
	add r1, r4, #0
	add r3, r6, #0
	bl sub_020603F8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020603DC

	thumb_func_start sub_020603F8
sub_020603F8: ; 0x020603F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl MapObject_GetManager
	bl sub_0205F610
	cmp r0, #0
	beq _02060416
	ldrh r0, [r7]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1d
	bne _02060418
_02060416:
	b _0206052E
_02060418:
	cmp r0, #2
	bne _020604B0
	add r0, r4, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060484
	add r0, r6, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	beq _02060484
	add r0, r6, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060484
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060484
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060484
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _02060490
_02060484:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, r6, r7, pc}
_02060490:
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl MapObject_GetFlagsMask
	cmp r0, #0
	bne _0206052E
	add r0, r5, #0
	bl ov01_021FD684
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, r6, r7, pc}
_020604B0:
	add r0, r4, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060504
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060504
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060504
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _02060510
_02060504:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, r6, r7, pc}
_02060510:
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl MapObject_GetFlagsMask
	cmp r0, #0
	bne _0206052E
	add r0, r5, #0
	bl ov01_021FD640
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl MapObject_SetFlagsBits
_0206052E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020603F8

	thumb_func_start sub_02060530
sub_02060530: ; 0x02060530
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	bl MapObject_GetManager
	bl sub_0205F610
	cmp r0, #0
	bne _02060546
	b _0206064A
_02060546:
	ldrh r0, [r6]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1d
	beq _0206064A
	cmp r0, #2
	bne _020605E0
	add r0, r5, #0
	bl sub_0205F524
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r4, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _020605C8
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	beq _020605C8
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	beq _020605C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _020605C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _020605C8
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _020605D4
_020605C8:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r4, r5, r6, pc}
_020605D4:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearFlagsBits
	pop {r4, r5, r6, pc}
_020605E0:
	add r0, r4, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B6F4
	cmp r0, #1
	beq _02060634
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060634
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060634
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #0
	beq _02060640
_02060634:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	pop {r4, r5, r6, pc}
_02060640:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_ClearFlagsBits
_0206064A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02060530

	thumb_func_start sub_0206064C
sub_0206064C: ; 0x0206064C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02060E54
	cmp r0, #1
	beq _02060694
	add r0, r4, #0
	bl sub_0205B7A4
	cmp r0, #1
	beq _02060694
	add r0, r4, #0
	bl sub_0205B828
	cmp r0, #1
	beq _02060694
	add r0, r4, #0
	bl sub_0205B8AC
	cmp r0, #1
	beq _02060694
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060EBC
	cmp r0, #1
	beq _02060694
	add r0, r5, #0
	bl MapObject_CheckVisible
	cmp r0, #0
	bne _02060694
	add r0, r5, #0
	bl ov01_021FF74C
_02060694:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206064C

	thumb_func_start sub_02060698
sub_02060698: ; 0x02060698
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	bl MapObject_GetID
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205B6F4
	cmp r0, #1
	bne _020606C8
	cmp r4, #0xfd
	bne _020606C0
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	beq _020606C8
_020606C0:
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF8F0
_020606C8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02060698

	thumb_func_start sub_020606CC
sub_020606CC: ; 0x020606CC
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	bl MapObject_GetID
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205B6F4
	cmp r0, #1
	bne _020606FC
	cmp r4, #0xfd
	bne _020606F4
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	beq _020606FC
_020606F4:
	add r0, r5, #0
	mov r1, #1
	bl ov01_021FF8F0
_020606FC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020606CC

	thumb_func_start sub_02060700
sub_02060700: ; 0x02060700
	bx lr
	.balign 4, 0
	thumb_func_end sub_02060700

	thumb_func_start sub_02060704
sub_02060704: ; 0x02060704
	bx lr
	.balign 4, 0
	thumb_func_end sub_02060704

	thumb_func_start sub_02060708
sub_02060708: ; 0x02060708
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r2, #0
	bl sub_0205B984
	cmp r0, #1
	bne _02060738
	add r0, r5, #0
	bl MapObject_GetPrevX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevHeight
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevY
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FECA0
_02060738:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02060708

	thumb_func_start sub_0206073C
sub_0206073C: ; 0x0206073C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_0205B984
	cmp r0, #1
	bne _0206076C
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FECA0
_0206076C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206073C

	thumb_func_start sub_02060770
sub_02060770: ; 0x02060770
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r2, #0
	bl sub_0205B8AC
	cmp r0, #1
	bne _020607A0
	add r0, r5, #0
	bl MapObject_GetPrevX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevHeight
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevY
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FEE04
_020607A0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02060770

	thumb_func_start sub_020607A4
sub_020607A4: ; 0x020607A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_0205B8AC
	cmp r0, #1
	bne _020607D4
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r3, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021FEE04
_020607D4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020607A4

	thumb_func_start sub_020607D8
sub_020607D8: ; 0x020607D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	ldrh r1, [r3]
	add r5, r0, #0
	lsl r1, r1, #0x13
	lsr r1, r1, #0x1e
	beq _020607F0
	bl MapObject_CheckFlag24
	cmp r0, #1
	bne _020607F2
_020607F0:
	b _020609CE
_020607F2:
	bl sub_0205BA6C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _02060804
	b _0206096A
_02060804:
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060902
	add r0, r5, #0
	bl MapObject_CheckFlag24
	cmp r0, #0
	beq _0206081A
	b _020609CE
_0206081A:
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060828
	add r4, r6, #0
	b _020608CA
_02060828:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #3
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #2
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #4
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	mov r1, #5
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #0xc]
	mov r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060880
	ldr r0, [sp, #0xc]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_02060880:
	ldr r0, [sp, #8]
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060892
	ldr r0, [sp, #8]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_02060892:
	ldr r0, [sp, #4]
	bl sub_0205B9B8
	cmp r0, #1
	bne _020608A4
	ldr r0, [sp, #4]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_020608A4:
	ldr r0, [sp]
	bl sub_0205B9B8
	cmp r0, #1
	bne _020608B6
	ldr r0, [sp]
	mov r6, #1
	str r0, [sp, #0x10]
	b _020608C4
_020608B6:
	add r0, r7, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _020608C4
	str r7, [sp, #0x10]
	mov r6, #1
_020608C4:
	cmp r6, #1
	bne _020608CA
	ldr r4, [sp, #0x10]
_020608CA:
	bl sub_0205BA6C
	cmp r4, r0
	beq _020609CE
	add r0, r5, #0
	mov r1, #1
	bl MapObject_SetFlag24
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #1
	bne _020608E8
	mov r1, #5
	b _020608F8
_020608E8:
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	bne _020608F6
	mov r1, #3
	b _020608F8
_020608F6:
	mov r1, #4
_020608F8:
	add r0, r5, #0
	bl ov01_021FDF88
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02060902:
	add r0, r5, #0
	bl MapObject_CheckFlag24
	cmp r0, #0
	bne _020609CE
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _0206091A
	add r4, r6, #0
	b _02060932
_0206091A:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060932
	add r4, r6, #0
_02060932:
	bl sub_0205BA6C
	cmp r4, r0
	beq _020609CE
	add r0, r5, #0
	mov r1, #1
	bl MapObject_SetFlag24
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #1
	bne _02060950
	mov r1, #2
	b _02060960
_02060950:
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	bne _0206095E
	mov r1, #0
	b _02060960
_0206095E:
	mov r1, #1
_02060960:
	add r0, r5, #0
	bl ov01_021FDF88
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0206096A:
	add r0, r5, #0
	bl MapObject_CheckFlag24
	cmp r0, #0
	bne _020609CE
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060982
	add r4, r6, #0
	b _0206099A
_02060982:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _0206099A
	add r4, r6, #0
_0206099A:
	bl sub_0205BA6C
	cmp r4, r0
	beq _020609CE
	add r0, r5, #0
	mov r1, #1
	bl MapObject_SetFlag24
	add r0, r4, #0
	bl sub_0205BA70
	cmp r0, #1
	bne _020609B8
	mov r1, #2
	b _020609C8
_020609B8:
	add r0, r4, #0
	bl sub_0205B984
	cmp r0, #1
	bne _020609C6
	mov r1, #0
	b _020609C8
_020609C6:
	mov r1, #1
_020609C8:
	add r0, r5, #0
	bl ov01_021FDA74
_020609CE:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020607D8

	thumb_func_start sub_020609D4
sub_020609D4: ; 0x020609D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldrh r1, [r3]
	add r5, r0, #0
	lsl r1, r1, #0x13
	lsr r1, r1, #0x1e
	beq _02060AB2
	bl MapObject_CheckFlag24
	cmp r0, #0
	beq _02060AB2
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	bne _02060A96
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02060A96
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #2
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	mov r1, #4
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r5, #0
	mov r1, #5
	bl ov01_022056C4
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [sp, #8]
	mov r4, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A50
	mov r4, #1
	b _02060A86
_02060A50:
	ldr r0, [sp, #4]
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A5E
	mov r4, #1
	b _02060A86
_02060A5E:
	ldr r0, [sp]
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A6C
	mov r4, #1
	b _02060A86
_02060A6C:
	add r0, r7, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A7A
	mov r4, #1
	b _02060A86
_02060A7A:
	add r0, r6, #0
	bl sub_0205B9B8
	cmp r0, #1
	bne _02060A86
	mov r4, #1
_02060A86:
	cmp r4, #0
	bne _02060AB2
	add r0, r5, #0
	mov r1, #0
	bl MapObject_SetFlag24
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02060A96:
	add r0, r5, #0
	mov r1, #1
	bl sub_02060FA8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B9B8
	cmp r0, #0
	bne _02060AB2
	add r0, r5, #0
	mov r1, #0
	bl MapObject_SetFlag24
_02060AB2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020609D4

	thumb_func_start sub_02060AB8
sub_02060AB8: ; 0x02060AB8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205BA24
	cmp r0, #1
	bne _02060AD2
	add r0, r5, #0
	mov r1, #1
	bl MapObject_SetFlag28
	pop {r3, r4, r5, pc}
_02060AD2:
	add r0, r5, #0
	bl MapObject_CheckFlag28
	cmp r0, #1
	bne _02060AEE
	add r0, r4, #0
	bl sub_0205BA30
	cmp r0, #0
	bne _02060AEE
	add r0, r5, #0
	mov r1, #0
	bl MapObject_SetFlag28
_02060AEE:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02060AB8

	thumb_func_start sub_02060AF0
sub_02060AF0: ; 0x02060AF0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02060AF0

	thumb_func_start sub_02060AF4
sub_02060AF4: ; 0x02060AF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r7, [sp, #0x28]
	add r5, r2, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	add r2, r3, #0
	add r1, r5, #0
	add r3, r7, #0
	add r6, r0, #0
	mov r4, #0
	bl sub_02060D94
	cmp r0, #1
	bne _02060B16
	mov r0, #1
	orr r4, r0
_02060B16:
	add r0, r6, #0
	bl MapObject_GetFieldSysPtr
	add r1, sp, #0xc
	str r1, [sp]
	ldr r1, [sp, #4]
	add r2, r5, #0
	add r3, r7, #0
	bl sub_020549A8
	cmp r0, #1
	bne _02060B40
	mov r0, #2
	orr r4, r0
	add r1, sp, #0xc
	mov r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _02060B40
	mov r0, #8
	orr r4, r0
_02060B40:
	ldr r3, [sp, #0x2c]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl sub_02060DEC
	cmp r0, #1
	bne _02060B54
	mov r0, #2
	orr r4, r0
_02060B54:
	bl sub_0203993C
	bl sub_0203401C
	cmp r0, #0
	beq _02060B76
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r3, r7, #0
	bl sub_02060BFC
	cmp r0, #1
	bne _02060B8A
	mov r0, #4
	orr r4, r0
	b _02060B8A
_02060B76:
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r3, r7, #0
	bl sub_02060CA8
	cmp r0, #1
	bne _02060B8A
	mov r0, #4
	orr r4, r0
_02060B8A:
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060AF4

	thumb_func_start sub_02060B90
sub_02060B90: ; 0x02060B90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r1, sp, #8
	add r5, r0, #0
	add r7, r2, #0
	add r4, r3, #0
	bl MapObject_GetPositionVec
	ldr r0, [sp, #0x28]
	str r4, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #8
	add r2, r6, #0
	add r3, r7, #0
	bl sub_02060AF4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02060B90

	thumb_func_start sub_02060BB8
sub_02060BB8: ; 0x02060BB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	str r0, [sp, #4]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp, #8]
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	str r4, [sp]
	add r3, r0, #0
	ldr r4, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r6, r7
	add r3, r4, r3
	bl sub_02060B90
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060BB8

	thumb_func_start sub_02060BFC
sub_02060BFC: ; 0x02060BFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl MapObject_GetManager
	add r5, r0, #0
	bl sub_0205F1AC
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObjectManager_GetCount
	str r0, [sp, #4]
_02060C1C:
	ldr r0, [sp, #8]
	ldr r1, [sp]
	cmp r0, r1
	beq _02060C94
	mov r1, #1
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _02060C94
	mov r1, #1
	ldr r0, [sp, #8]
	lsl r1, r1, #0x12
	bl MapObject_GetFlagsMask
	cmp r0, #0
	bne _02060C94
	ldr r0, [sp, #8]
	bl MapObject_GetCurrentX
	add r5, r0, #0
	ldr r0, [sp, #8]
	bl MapObject_GetCurrentY
	cmp r5, r4
	bne _02060C68
	cmp r0, r7
	bne _02060C68
	ldr r0, [sp, #8]
	bl MapObject_GetCurrentHeight
	sub r0, r0, r6
	bpl _02060C5E
	neg r0, r0
_02060C5E:
	cmp r0, #2
	bge _02060C68
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02060C68:
	ldr r0, [sp, #8]
	bl MapObject_GetPrevX
	add r5, r0, #0
	ldr r0, [sp, #8]
	bl MapObject_GetPrevY
	cmp r5, r4
	bne _02060C94
	cmp r0, r7
	bne _02060C94
	ldr r0, [sp, #8]
	bl MapObject_GetCurrentHeight
	sub r0, r0, r6
	bpl _02060C8A
	neg r0, r0
_02060C8A:
	cmp r0, #2
	bge _02060C94
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02060C94:
	add r0, sp, #8
	bl sub_0205F1C4
	ldr r0, [sp, #4]
	sub r0, r0, #1
	str r0, [sp, #4]
	bne _02060C1C
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02060BFC

	thumb_func_start sub_02060CA8
sub_02060CA8: ; 0x02060CA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl MapObject_GetManager
	add r7, r0, #0
	bl sub_0205F1AC
	str r0, [sp, #4]
	add r0, r7, #0
	bl MapObjectManager_GetCount
	add r7, r0, #0
_02060CC8:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, r1
	beq _02060D84
	mov r1, #1
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _02060D84
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentX
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentY
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r1, r5
	bne _02060D0A
	cmp r0, r6
	bne _02060D0A
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentHeight
	sub r0, r0, r4
	bpl _02060D00
	neg r0, r0
_02060D00:
	cmp r0, #2
	bge _02060D0A
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060D0A:
	ldr r0, [sp, #4]
	bl MapObject_GetPrevX
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl MapObject_GetPrevY
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r1, r5
	bne _02060D3A
	cmp r0, r6
	bne _02060D3A
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentHeight
	sub r0, r0, r4
	bpl _02060D30
	neg r0, r0
_02060D30:
	cmp r0, #2
	bge _02060D3A
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060D3A:
	ldr r0, [sp, #4]
	bl MapObject_GetID
	cmp r0, #0xfd
	bne _02060D84
	ldr r0, [sp, #4]
	bl ov01_022055DC
	cmp r0, #0
	beq _02060D84
	ldr r0, [sp, #4]
	bl MapObject_CheckVisible
	cmp r0, #0
	bne _02060D84
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov01_02205664
	ldr r0, [sp, #0xc]
	cmp r0, r5
	bne _02060D84
	ldr r0, [sp, #8]
	cmp r0, r6
	bne _02060D84
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentHeight
	sub r0, r0, r4
	bpl _02060D7A
	neg r0, r0
_02060D7A:
	cmp r0, #2
	bge _02060D84
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060D84:
	add r0, sp, #4
	bl sub_0205F1C4
	sub r7, r7, #1
	bne _02060CC8
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02060CA8

	thumb_func_start sub_02060D94
sub_02060D94: ; 0x02060D94
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r3, #0
	bl MapObject_GetInitialX
	add r7, r0, #0
	add r0, r6, #0
	bl MapObject_GetXRange
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02060DC0
	add r1, r7, r0
	sub r0, r7, r0
	cmp r0, r5
	bgt _02060DBC
	cmp r1, r5
	bge _02060DC0
_02060DBC:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060DC0:
	add r0, r6, #0
	bl MapObject_GetInitialY
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetYRange
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02060DE6
	add r1, r5, r0
	sub r0, r5, r0
	cmp r0, r4
	bgt _02060DE2
	cmp r1, r4
	bge _02060DE6
_02060DE2:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060DE6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060D94

	thumb_func_start sub_02060DEC
sub_02060DEC: ; 0x02060DEC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r5, r3, #0
	bl sub_0205F8D0
	cmp r0, #0
	bne _02060E46
	add r0, r4, #0
	bl MapObject_GetFieldSysPtr
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205F504
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp]
	add r1, r6, #0
	add r2, r7, #0
	bl GetMetatileBehaviorAt
	add r6, r0, #0
	bl sub_0205BA6C
	cmp r6, r0
	bne _02060E28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060E28:
	ldr r1, _02060E4C ; =_020FD4CC
	lsl r5, r5, #2
	ldr r1, [r1, r5]
	add r0, r4, #0
	blx r1
	cmp r0, #1
	beq _02060E42
	ldr r1, _02060E50 ; =_020FD4BC
	add r0, r6, #0
	ldr r1, [r1, r5]
	blx r1
	cmp r0, #1
	bne _02060E46
_02060E42:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02060E46:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02060E4C: .word _020FD4CC
_02060E50: .word _020FD4BC
	thumb_func_end sub_02060DEC

	thumb_func_start sub_02060E54
sub_02060E54: ; 0x02060E54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA54
	cmp r0, #0
	beq _02060E74
	add r0, r5, #0
	bl MapObject_CheckFlag28
	cmp r0, #0
	bne _02060EA0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02060E74:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsSurfableWater
	cmp r0, #0
	beq _02060E84
	mov r0, #1
	pop {r3, r4, r5, pc}
_02060E84:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B78C
	cmp r0, #0
	beq _02060EA0
	add r0, r5, #0
	bl MapObject_GetGfxID
	sub r0, #0xb2
	cmp r0, #1
	bhi _02060EA0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02060EA0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02060E54

	thumb_func_start sub_02060EA4
sub_02060EA4: ; 0x02060EA4
	push {r3, lr}
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B798
	cmp r0, #0
	beq _02060EB6
	mov r0, #1
	pop {r3, pc}
_02060EB6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02060EA4

	thumb_func_start sub_02060EBC
sub_02060EBC: ; 0x02060EBC
	push {r3, lr}
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8B8
	cmp r0, #0
	beq _02060ECE
	mov r0, #1
	pop {r3, pc}
_02060ECE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02060EBC

	thumb_func_start sub_02060ED4
sub_02060ED4: ; 0x02060ED4
	push {r3, lr}
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8C4
	cmp r0, #0
	beq _02060EE6
	mov r0, #1
	pop {r3, pc}
_02060EE6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02060ED4

	thumb_func_start sub_02060EEC
sub_02060EEC: ; 0x02060EEC
	push {r4, lr}
	add r4, r1, #0
	bl MapObject_CheckFlag28
	cmp r0, #1
	bne _02060F08
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA30
	cmp r0, #1
	bne _02060F08
	mov r0, #1
	pop {r4, pc}
_02060F08:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02060EEC

	thumb_func_start GetDeltaXByFacingDirection
GetDeltaXByFacingDirection: ; 0x02060F0C
	lsl r1, r0, #2
	ldr r0, _02060F14 ; =_020FD4AC
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02060F14: .word _020FD4AC
	thumb_func_end GetDeltaXByFacingDirection

	thumb_func_start GetDeltaYByFacingDirection
GetDeltaYByFacingDirection: ; 0x02060F18
	lsl r1, r0, #2
	ldr r0, _02060F20 ; =_020FD49C
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02060F20: .word _020FD49C
	thumb_func_end GetDeltaYByFacingDirection

	thumb_func_start sub_02060F24
sub_02060F24: ; 0x02060F24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetCurrentX
	add r1, r0, #0
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
	add r0, r5, #0
	bl MapObject_SetPrevY
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_AddCurrentX
	add r0, r5, #0
	mov r1, #0
	bl MapObject_AddCurrentHeight
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_AddCurrentY
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02060F24

	thumb_func_start sub_02060F78
sub_02060F78: ; 0x02060F78
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetCurrentX
	add r1, r0, #0
	add r0, r4, #0
	bl MapObject_SetPrevX
	add r0, r4, #0
	bl MapObject_GetCurrentHeight
	add r1, r0, #0
	add r0, r4, #0
	bl MapObject_SetPrevHeight
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r1, r0, #0
	add r0, r4, #0
	bl MapObject_SetPrevY
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02060F78

	thumb_func_start sub_02060FA8
sub_02060FA8: ; 0x02060FA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r5, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentY
	str r0, [sp]
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetFieldSysPtr
	ldr r2, [sp]
	add r1, r6, r7
	add r2, r2, r5
	bl GetMetatileBehaviorAt
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060FA8

	thumb_func_start sub_02060FE0
sub_02060FE0: ; 0x02060FE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r5, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentY
	str r0, [sp]
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetFieldSysPtr
	ldr r2, [sp]
	add r1, r6, r7
	add r2, r2, r5
	bl sub_020548EC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02060FE0

	thumb_func_start sub_0206101C
sub_0206101C: ; 0x0206101C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r1, sp, #0
	add r6, r0, #0
	add r4, r2, #0
	bl MapObject_GetPositionVec
	cmp r5, #3
	bhi _02061062
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206103C: ; jump table
	.short _02061044 - _0206103C - 2 ; case 0
	.short _0206104C - _0206103C - 2 ; case 1
	.short _02061054 - _0206103C - 2 ; case 2
	.short _0206105C - _0206103C - 2 ; case 3
_02061044:
	ldr r0, [sp, #8]
	sub r0, r0, r4
	str r0, [sp, #8]
	b _02061062
_0206104C:
	ldr r0, [sp, #8]
	add r0, r0, r4
	str r0, [sp, #8]
	b _02061062
_02061054:
	ldr r0, [sp]
	sub r0, r0, r4
	str r0, [sp]
	b _02061062
_0206105C:
	ldr r0, [sp]
	add r0, r0, r4
	str r0, [sp]
_02061062:
	add r0, r6, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206101C

	thumb_func_start sub_02061070
sub_02061070: ; 0x02061070
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r1, sp, #0xc
	add r5, r0, #0
	bl MapObject_GetPositionVec
	add r3, sp, #0xc
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r5, #0
	bl MapObject_CheckIgnoreHeights
	cmp r0, #1
	bne _020610A2
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_ClearFlagsBits
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_020610A2:
	add r0, r5, #0
	bl MapObject_CheckFlag29
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r1, sp, #0
	add r2, r4, #0
	bl sub_02061248
	add r4, r0, #0
	cmp r4, #1
	bne _020610F6
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetPrevHeight
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	asr r2, r1, #3
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl MapObject_SetCurrentHeight
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_ClearFlagsBits
	b _02061100
_020610F6:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl MapObject_SetFlagsBits
_02061100:
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061070

	thumb_func_start sub_02061108
sub_02061108: ; 0x02061108
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205BA6C
	add r6, r0, #0
	add r0, r5, #0
	add r4, r6, #0
	bl sub_0205F8D0
	cmp r0, #0
	bne _0206115A
	add r0, r5, #0
	bl MapObject_GetPrevX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevY
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r1, r4, #0
	add r2, r6, #0
	add r7, r0, #0
	bl GetMetatileBehaviorAt
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl GetMetatileBehaviorAt
	add r4, r0, #0
_0206115A:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F50C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F4FC
	add r0, r4, #0
	bl MetatileBehavior_IsNone
	cmp r0, #1
	bne _02061182
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xa
	bl MapObject_SetFlagsBits
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02061182:
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xa
	bl MapObject_ClearFlagsBits
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02061108

	thumb_func_start sub_02061190
sub_02061190: ; 0x02061190
	cmp r0, #3
	bhi _020611C6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020611A0: ; jump table
	.short _020611A8 - _020611A0 - 2 ; case 0
	.short _020611B0 - _020611A0 - 2 ; case 1
	.short _020611B8 - _020611A0 - 2 ; case 2
	.short _020611C0 - _020611A0 - 2 ; case 3
_020611A8:
	ldr r0, [r1, #8]
	sub r0, r0, r2
	str r0, [r1, #8]
	bx lr
_020611B0:
	ldr r0, [r1, #8]
	add r0, r0, r2
	str r0, [r1, #8]
	bx lr
_020611B8:
	ldr r0, [r1]
	sub r0, r0, r2
	str r0, [r1]
	bx lr
_020611C0:
	ldr r0, [r1]
	add r0, r0, r2
	str r0, [r1]
_020611C6:
	bx lr
	thumb_func_end sub_02061190

	thumb_func_start sub_020611C8
sub_020611C8: ; 0x020611C8
	lsl r3, r0, #0x10
	mov r0, #2
	lsl r0, r0, #0xe
	add r3, r3, r0
	lsl r1, r1, #0x10
	str r3, [r2]
	add r0, r1, r0
	str r0, [r2, #8]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020611C8

	thumb_func_start sub_020611DC
sub_020611DC: ; 0x020611DC
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetMovement
	sub r0, #0x33
	cmp r0, #3
	bhi _020611F0
	add r0, r4, #0
	bl sub_0205F430
_020611F0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020611DC

	thumb_func_start sub_020611F4
sub_020611F4: ; 0x020611F4
	lsl r1, r0, #2
	ldr r0, _020611FC ; =_020FD4DC
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_020611FC: .word _020FD4DC
	thumb_func_end sub_020611F4

	thumb_func_start sub_02061200
sub_02061200: ; 0x02061200
	cmp r0, r2
	ble _02061208
	mov r0, #2
	bx lr
_02061208:
	cmp r0, r2
	bge _02061210
	mov r0, #3
	bx lr
_02061210:
	cmp r1, r3
	bgt _02061218
	mov r0, #1
	bx lr
_02061218:
	mov r0, #0
	bx lr
	thumb_func_end sub_02061200

	thumb_func_start sub_0206121C
sub_0206121C: ; 0x0206121C
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r1, sp, #4
	str r1, [sp]
	ldr r1, [r4, #4]
	ldr r2, [r4]
	ldr r3, [r4, #8]
	bl sub_02054940
	add r1, sp, #4
	ldrb r1, [r1]
	cmp r1, #0
	bne _0206123E
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_0206123E:
	str r0, [r4, #4]
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206121C

	thumb_func_start sub_02061248
sub_02061248: ; 0x02061248
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r1, sp, #4
	str r1, [sp]
	add r4, r2, #0
	ldr r1, [r5, #4]
	ldr r2, [r5]
	ldr r3, [r5, #8]
	bl sub_02054940
	add r1, sp, #4
	ldrb r1, [r1]
	cmp r1, #0
	bne _0206126C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0206126C:
	cmp r1, #2
	bne _0206127A
	cmp r4, #0
	bne _0206127A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0206127A:
	str r0, [r5, #4]
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061248

	.rodata

	; File boundary
_020FD49C:
	.word -1
	.word  1
	.word  0
	.word  0
_020FD4AC:
	.word  0
	.word  0
	.word -1
	.word  1
_020FD4BC:
	.word sub_0205B918
	.word sub_0205B8F4
	.word sub_0205B960
	.word sub_0205B93C
_020FD4CC:
	.word sub_0205B8F4
	.word sub_0205B918
	.word sub_0205B93C
	.word sub_0205B960
_020FD4DC:
	.word 1
	.word 0
	.word 3
	.word 2
